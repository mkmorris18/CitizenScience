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
    //method that uses stored procedure to get the Institutions
    public partial class Institutions : System.Web.UI.Page
    {
        public DataTable GetInstitutions()
        {
            DataTable dt = new DataTable();
            string connString = ConfigurationManager.ConnectionStrings["CitizenScienceDB"].ToString();

            using (SqlConnection conn = new SqlConnection(connString))
            {
                using (SqlCommand cmd = new SqlCommand("sp_GetAllInstitutions", conn))
                {
                    using(SqlDataAdapter da = new SqlDataAdapter(cmd)) 
                    { 
                        da.Fill(dt);
                    }
                }
            }
            return dt;

        }

        //calls the method to load onto the page
        protected void Page_Load(object sender, EventArgs e)
        {
                Institution.DataSource = GetInstitutions();
                Institution.DataBind();
        }


        protected void btnInstInfo_Click(object sender, EventArgs e)
        {
            if (!HttpContext.Current.User.Identity.IsAuthenticated)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                Response.Redirect("InstitutionsInfo.aspx");
            }
        }

    }
    
}