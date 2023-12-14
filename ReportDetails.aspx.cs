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
    public partial class ReportDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string ReportID = Request.QueryString["ID"];
            if (ReportID != null)
            {
                Session["ReportID"] = ReportID;
            }
            else
            {
                CreateReport();
            }

            DisplayObservations();


        }
        //displays the current observations for the given report- checks report with parameters, redirects to login page if invalid
        public void DisplayObservations()
        {
            if(User.Identity.IsAuthenticated)
            {
                DataTable dt = new DataTable();
                string connString = ConfigurationManager.ConnectionStrings["CitizenScienceDB"].ToString();
                string ReportID = Session["ReportID"] as string;
                string query = "select * from Observations where ReportID=@ReportID";

                using (SqlConnection conn = new SqlConnection())
                {
                    conn.ConnectionString = connString;
                    conn.Open();

                    using(SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@ReportID", ReportID);
                        cmd.ExecuteNonQuery();

                        using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                        {
                            da.Fill(dt);
                        }

                    }

                }

                ObservationTable.DataSource = dt;
                ObservationTable.DataBind();
                ObservationPanel.Visible = true;
            }

            else
            {
                Response.Redirect("Login.aspx");
            }
        }

        //method to create a report if user chooses, passes in project id/user id parameters
        private void CreateReport()
        {
            string connString = ConfigurationManager.ConnectionStrings["CitizenScienceDB"].ToString();

            string userID = HttpContext.Current.User.Identity.GetUserId();
            string ProjectID = Request.QueryString["ProjectID"] as string;

            if(ProjectID != null & userID != null)
            {
                using (SqlConnection conn = new SqlConnection(connString))
                {
                    conn.Open();

                    using (SqlCommand cmd = new SqlCommand("sp_CreateReport", conn))
                    {
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@ProjectID", ProjectID);
                        cmd.Parameters.AddWithValue("@VolunteerID", userID);
                        cmd.Parameters.Add("@ReportID", SqlDbType.Int);
                        

                        cmd.Parameters["@ReportID"].Direction = ParameterDirection.Output;


                        cmd.ExecuteNonQuery();

                        Session["ReportID"] = cmd.Parameters["@ReportID"].Value.ToString();

                    }
                }
            }

            else
            {
                errorMsg.Visible = true;
            }


            
        }

        
        
    }
}