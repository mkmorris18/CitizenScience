﻿using System;
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
    public partial class ProjectDetails : System.Web.UI.Page
    {
        public void DisplayProjectDetails(string ProjectID)
        {
            
            string connStr = ConfigurationManager.ConnectionStrings["CitizenScienceDB"].ToString();

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "EXEC sp_GetProjectDetails @ProjectID";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@ProjectID", ProjectID);

                conn.Open();

                SqlDataReader reader = cmd.ExecuteReader();

                 if (reader.Read())
                 {
                            lblProjectName.Text = reader["ProjectName"].ToString();
                            lblStartDate.Text = reader["StartDate"].ToString();
                            lblEndDate.Text = reader["EndDate"].ToString();
                            lblCoordinator.Text = reader["Coordinator"].ToString();
                            lblDescription.Text = reader["Description"].ToString();
                  }
                      
                reader.Close();    
                
            }

        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                string projectID = Request.QueryString["ProjectID"];
                if(!string.IsNullOrEmpty(projectID) ) 
                {
                    DisplayProjectDetails(projectID);
                }

            }
            

        }
    }
}