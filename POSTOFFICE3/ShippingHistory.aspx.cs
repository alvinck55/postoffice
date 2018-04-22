using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace POSTOFFICE3
{
    public partial class ShippingHistory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Calendar1.SelectedDate = DateTime.Today + TimeSpan.FromDays(-30);
            Calendar2.SelectedDate = DateTime.Today;
        }
    }
}