using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CitizenScience
{
    public partial class Projects : System.Web.UI.Page
    {
        public DataTable GetProjects()
        { 
        
            DataTable dt = new DataTable();
            string connString = ConfigurationManager.ConnectionStrings["CitizenScienceDB"].ToString();

            string researchID = Request.QueryString["RA"];

            if (!string.IsNullOrEmpty(researchID))
            {
                using(SqlConnection conn = new SqlConnection(connString))
                {
                    conn.Open();

                    string query = "EXEC sp_GetProjectByResearchArea @ResearchID";
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@ResearchID",researchID);
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
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string IDValue = Request.QueryString["RA"];
                if (string.IsNullOrEmpty(IDValue)) 
                {
                    Response.Redirect("ResearchAreas.aspx");
                }
                else
                {
                    Project.DataSource = GetProjects();
                    Project.DataBind();
                }
            }

        }
    }
}