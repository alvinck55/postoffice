using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace POSTOFFICE3
{
    public partial class FacilityTraffic : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection conn;
            SqlCommand command;
            SqlDataReader dataReader;
            string username;
            string sqlQuery;
            string facility_id = "";
            if (Session["username"] == null)
            {
                Response.Redirect("Home.aspx");


            }
            username = Session["username"].ToString();
            try
            {
                string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["PostOffice"].ToString();
                conn = new SqlConnection(connectionString);

                conn.Open();

                sqlQuery = "SELECT EMPLOYEE.Facility_ID FROM EMPLOYEE WHERE EMPLOYEE.Employee_ID = @username";
                command = new SqlCommand(sqlQuery, conn);
                dataReader = command.ExecuteReader();

                if (dataReader.HasRows)
                {
                    while (dataReader.Read())
                    {
                        facility_id = dataReader.GetString(dataReader.GetOrdinal("Facility_ID"));
                    }
                }

                Label1.Text = "Facility " + facility_id;
                TextBox1.Text = facility_id;
                dataReader.Close();
                command.Dispose();
                conn.Close();
            }
            catch (Exception ex)
            {
                Label1.Text = "ERROR FOR USERNAME LOGIN";
            }
        }
        
    }
}