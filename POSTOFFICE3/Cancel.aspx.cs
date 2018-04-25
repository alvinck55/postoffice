using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace POSTOFFICE3
{
    public partial class Cancel : System.Web.UI.Page
    {
        SqlConnection conn;
        SqlCommand command;
        SqlDataReader dataReader;
        string sqlQuery;
        string connectionString;
        string customerid;

        protected void Page_Load(object sender, EventArgs e)
        {
            string username;
            if (Session["username"] == null)
            {
                Response.Redirect("Home.aspx");
            }
            lblUserDetails.Text = "Currently logged in as: " + Session["username"];
            username = Session["username"].ToString();

            connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["PostOffice"].ToString();
            conn = new SqlConnection(connectionString);
            conn.Open();
            sqlQuery = "SELECT * FROM POSTOFFICE2.dbo.CUSTOMER WHERE Email='" + username + "'";

            command = new SqlCommand(sqlQuery, conn);
            dataReader = command.ExecuteReader();
            if (dataReader.HasRows)
            {
                while (dataReader.Read())
                {
                    customerid = dataReader.GetValue(dataReader.GetOrdinal("Customer_ID")).ToString();
                }
                TextBox1.Text = customerid;
            }
            dataReader.Close();
            command.Dispose();
            conn.Close();
        }
    }
}