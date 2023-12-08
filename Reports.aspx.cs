using Microsoft.AspNet.Identity;
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
    public partial class Reports : System.Web.UI.Page
    {
        //method to insert VolunteerID parameter after checking if user is verified or directs back to login page if not
       protected void GetReports()
        {
            if(User.Identity.IsAuthenticated)
            {
                ReportsPanel.Visible = true;
                string userID = HttpContext.Current.User.Identity.GetUserId();
                string query = "SELECT * FROM Reports R Inner Join Projects P on P.ProjectID = R.ProjectID WHERE VolunteerID = @userID";
                DataTable dt = new DataTable();
                string connString = ConfigurationManager.ConnectionStrings["CitizenScienceDB"].ToString();
                using (SqlConnection conn = new SqlConnection(connString))
                {
                    conn.Open();

                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@UserID", userID);
                        cmd.ExecuteNonQuery();
                        using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                        {
                            da.Fill(dt);
                            
                        }

                    }
                }
                ReportsTable.DataSource = dt;
                ReportsTable.DataBind();
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }
       
        //loads the GetReports method if a valid volunteer id is provided, directs back to login page if not
        protected void Page_Load(object sender, EventArgs e)
        {
            string userID = HttpContext.Current.User.Identity.GetUserId();
            if (userID != null)
            {
                GetReports();
                
            }
            else
            {
                Response.Redirect("Login.aspx");
            }

        }

    }
}