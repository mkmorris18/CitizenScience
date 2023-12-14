using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Policy;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CitizenScience
{
    public partial class Observations : System.Web.UI.Page
    {
        protected void ShowObservations()
        {
            if(User.Identity.IsAuthenticated)
            {
                ObservationSubID.Visible = true;
            }
            else
            {
                Response.Redirect("Login.aspx");
            }

        }

        //creates new report through observations
        protected void CreateReport()
        {
            string connString = ConfigurationManager.ConnectionStrings["CitizenScienceDB"].ToString();

            string userID = HttpContext.Current.User.Identity.GetUserId();
            string ProjectID = Session["ProjectID"] as string;

            if (ProjectID != null & userID != null)
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

                ObservationSubID.Visible = true;
            }
            else
            {
                errorMsg.Visible = true;
            }
        }

        //user can add new observation
        private void InsertObservation()
        {
            string connString = ConfigurationManager.ConnectionStrings["CitizenScienceDB"].ToString();

            string ReportID = Session["ReportID"] as string;

            string Notes = NotesBox.Text;

            using (SqlConnection conn = new SqlConnection(connString))
            {
                conn.Open() ;

                using (SqlCommand cmd = new SqlCommand("sp_AddObservationToReport", conn))
                {

                    cmd.CommandType = System.Data.CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@ReportID", ReportID);
                    cmd.Parameters.Add("@ObservationID", SqlDbType.Int);
                    cmd.Parameters["@ObservationID"].Direction = ParameterDirection.Output;
                    cmd.Parameters.AddWithValue("@Notes", Notes);

                    cmd.ExecuteNonQuery ();

                    ObservationSubID.Visible = true;

                   

                }

            }
            
        }
        
        public void Submit_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                InsertObservation();
                ObservationSubID.Visible = false;

                Response.Redirect("ReportDetails.aspx?ID=" + Session["ReportID"]);
            }
        }


        protected void Page_Load(object sender, EventArgs e)
        {
            string ReportID = Session["ReportID"] as string;
            if(ReportID != null )
            {
                ObservationSubID.Visible = true;
            }
            else
            {
                CreateReport();
            }
        }
    }
}