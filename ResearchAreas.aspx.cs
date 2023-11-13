using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CitizenScience
{
    public partial class ResearchAreas : System.Web.UI.Page
    {
    //method that uses the InstitutionID as a parameter to get the research areas by the passed in InstitutionID
        public DataTable GetResearchAreasByInstitution()
        {
            DataTable dt = new DataTable();
            string connString = ConfigurationManager.ConnectionStrings["CitizenScienceDB"].ToString(); ;
            string idValue = Request.QueryString["InstID"];

            if (!string.IsNullOrEmpty(idValue))
            {
                using (SqlConnection conn = new SqlConnection(connString))
                {
                    conn.Open();

                    string query = "EXEC sp_GetAllResearchAreasFromInstID @InstitutionID";

                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        
                        cmd.Parameters.AddWithValue("@InstitutionID", idValue);
                        cmd.ExecuteNonQuery();

                        using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                        {
                            da.Fill(dt);
                        }
                    }
                }
            }

            return dt;
        }

//method that uses a different stored procedure that displays all research areas, used if there is no InstitutionID provided
        public DataTable GetAllResearchAreas()
        {
            DataTable dt = new DataTable();
            string connString = ConfigurationManager.ConnectionStrings["CitizenScienceDB"].ToString();

            using (SqlConnection conn = new SqlConnection(connString))
            {
                using (SqlCommand cmd = new SqlCommand("EXEC sp_GetAllResearchAreas", conn))
                {
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        da.Fill(dt);
                    }
                }
            }
            return dt;
        }

//loads page and calls appropriate method based on parameters (if provided)
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                string InstID = Request.QueryString["InstID"];
                if (string.IsNullOrEmpty(InstID))
                {
                    Projects.DataSource = GetAllResearchAreas();
                   
                }
                else
                {
                    Projects.DataSource = GetResearchAreasByInstitution();
                    
                }
                Projects.DataBind();
            }
        }
     
    }
}
