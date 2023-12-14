using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CitizenScience
{
    public partial class InstitutionsInfo : System.Web.UI.Page
    {

        protected void btnInstPage_Click(object sender, EventArgs e)
        {
            if (!HttpContext.Current.User.Identity.IsAuthenticated)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                Response.Redirect("Institutions.aspx");
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}