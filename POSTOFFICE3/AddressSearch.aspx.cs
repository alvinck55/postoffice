using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace POSTOFFICE3
{
    public partial class AddressSearch : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            GridView1.DataBind();
            GridView2.DataBind();
        }

        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}