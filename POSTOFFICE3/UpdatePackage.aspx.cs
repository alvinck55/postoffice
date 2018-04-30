using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace POSTOFFICE3
{
    public partial class UpdatePackage : System.Web.UI.Page
    {
        SqlConnection conn;
        SqlCommand command;
        SqlDataReader dataReader;
        string sqlQuery;
        string facility_id;
        protected void Page_Load(object sender, EventArgs e)
        {
            string username;
            if (Session["username"] == null)
            {
                Response.Redirect("Home.aspx");


            }
            loggedin.Text = "Employee ID: " + Session["username"];

            username = Session["username"].ToString();
            try
            {
                string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["PostOffice"].ToString();
                conn = new SqlConnection(connectionString);

                conn.Open();

                sqlQuery = "SELECT dbo.EMPLOYEES.Facility_ID FROM dbo.EMPLOYEES WHERE dbo.EMPLOYEES.Employee_ID = @username";
                command = new SqlCommand(sqlQuery, conn);
                command.Parameters.AddWithValue("@username", username);
                dataReader = command.ExecuteReader();

                if (dataReader.HasRows)
                {
                    while (dataReader.Read())
                    {
                        facility_id = dataReader.GetValue(dataReader.GetOrdinal("Facility_ID")).ToString();
                    }
                }
                dataReader.Close();
                command.Dispose();
                conn.Close();
            }
            catch(Exception ex)
            {
                Label1.Text = "ERROR FOR USERNAME LOGIN";
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            UpdatePackageNow();
        }

        private void UpdatePackageNow()
        {
            try
            {
                string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["PostOffice"].ToString();
                conn = new SqlConnection(connectionString);

                conn.Open();

                sqlQuery = "UPDATE TRACKING SET Facility_ID = @facilityid, Status = @status WHERE Tracking_no = @trackingno";
                command = new SqlCommand(sqlQuery, conn);
                command.Parameters.AddWithValue("@facilityid", Convert.ToInt32(facility_id));
                command.Parameters.AddWithValue("@status", DropDownList2.SelectedValue.ToString());
                command.Parameters.AddWithValue("@trackingno", Convert.ToInt32(TextBox1.Text));
                command.ExecuteNonQuery();

                Label1.Text = "Tracking successfully updated";

                command.Dispose();
                conn.Close();

            }
            catch(Exception ex)
            {
                Label1.Text = "Please ensure all fields are filled";
            }

        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("Home.aspx");
        }
    }
}