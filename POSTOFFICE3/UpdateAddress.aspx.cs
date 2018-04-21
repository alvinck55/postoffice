using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace POSTOFFICE3
{
    public partial class UpdateAddress : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                Response.Redirect("Home.aspx");


            }
            addressDetails.Text = "Currently logged in as: " + Session["username"];
        }

        protected void stateText_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}