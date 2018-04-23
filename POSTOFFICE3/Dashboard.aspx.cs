using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace POSTOFFICE3
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string username;
            if (Session["username"] == null)
            {
                Response.Redirect("Home.aspx");


            }
            lblUserDetails.Text = "Currently logged in as: " + Session["username"];
            username = Session["username"].ToString();
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("Home.aspx");
        }
    }
}