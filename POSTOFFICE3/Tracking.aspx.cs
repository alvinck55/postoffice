using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.ComponentModel.DataAnnotations;

namespace POSTOFFICE3
{
	public partial class Tracking : System.Web.UI.Page
	{
        SqlConnection conn;
        SqlCommand command;
        SqlDataReader dataReader;
        string sqlQuery;
        string output;
        string username;

        protected void Page_Load(object sender, EventArgs e)
		{
            this.Form.DefaultButton = this.Button1.UniqueID;

            if (Session["username"] == null)
            {
                dashboardcheck.NavigateUrl = "Home.aspx";
                dashboardcheck.Text = "Home";

            }
            else
            {
                username = Session["username"].ToString();
                loggedin.Text = "Currently logged in as: " + Session["username"];
                var email = new EmailAddressAttribute();
                bool isEmail;
                isEmail = email.IsValid(username);
                if (isEmail == true)
                {
                    dashboardcheck.NavigateUrl = "Dashboard.aspx";
                    dashboardcheck.Text = "Dashboard";

                }
                else
                {
                    int employeecheck;
                    int.TryParse(username, out employeecheck);
                    if (employeecheck == 0)
                    {
                        dashboardcheck.NavigateUrl = "Home.aspx";
                        dashboardcheck.Text = "Home";

                    }
                    else
                    {
                        dashboardcheck.NavigateUrl = "EmployeeDashboard.aspx";
                        dashboardcheck.Text = "Employee Dashboard";
                    }
                }
            }
            
        }

        protected void TrackPackage_Click(object sender, EventArgs e)
        {
            trackPackage();
        }
        private void trackPackage()
        {
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["PostOffice"].ToString();
            try
            {
                
                conn = new SqlConnection(connectionString);

                conn.Open();

                sqlQuery = "SELECT dbo.STATUS.Status FROM POSTOFFICE2.dbo.TRACKING, POSTOFFICE2.dbo.STATUS WHERE dbo.TRACKING.Tracking_no='" + TrackingNumberTextBox.Text + "' AND dbo.TRACKING.Status = dbo.STATUS.Status_ID";
                command = new SqlCommand(sqlQuery, conn);
                dataReader = command.ExecuteReader();
                output = "";


                if (dataReader.HasRows)
                {
                    while (dataReader.Read())
                    {
                        output = dataReader.GetValue(dataReader.GetOrdinal("Status")).ToString();
                    }
                    if (output == "Delivered")
                    {
                        dataReader.Close();
                        command.Dispose();
                        sqlQuery = "SELECT dbo.ADDRESS.Street, dbo.ADDRESS.City, dbo.ADDRESS.State, dbo.ADDRESS.Zip, dbo.ADDRESS.aptn FROM dbo.ADDRESS,dbo.TRACKING WHERE" +
                            " dbo.TRACKING.Tracking_no = @tracking AND dbo.ADDRESS.Address_ID=dbo.TRACKING.Destination_Address_ID ";
                        command = new SqlCommand(sqlQuery, conn);
                        command.Parameters.AddWithValue("@tracking", TrackingNumberTextBox.Text);
                        dataReader = command.ExecuteReader();
                        while (dataReader.Read())
                        {
                            output = "Delivered at #" + dataReader.GetValue(dataReader.GetOrdinal("aptn")).ToString() + " " + dataReader.GetValue(dataReader.GetOrdinal("Street")).ToString() + "   " + dataReader.GetValue(dataReader.GetOrdinal("City")).ToString() +
                                "," + dataReader.GetValue(dataReader.GetOrdinal("State")).ToString() + " " + dataReader.GetValue(dataReader.GetOrdinal("Zip")).ToString();
                            Label1.Text = output;
                            Label2.Text = "";
                        }

                    }
                    else
                    {
                        Label1.Text = output;
                        dataReader.Close();
                        command.Dispose();
                        sqlQuery = "SELECT dbo.ADDRESS.Street, dbo.ADDRESS.City, dbo.ADDRESS.State, dbo.ADDRESS.Zip, dbo.ADDRESS.aptn, TRACKING.Delivery_Date FROM dbo.ADDRESS,dbo.TRACKING WHERE" +
                            " dbo.TRACKING.Tracking_no = @tracking AND dbo.ADDRESS.Address_ID=dbo.TRACKING.Destination_Address_ID ";
                        command = new SqlCommand(sqlQuery, conn);
                        command.Parameters.AddWithValue("@tracking", TrackingNumberTextBox.Text);
                        dataReader = command.ExecuteReader();
                        while (dataReader.Read())
                        {
                            output = "#" + dataReader.GetValue(dataReader.GetOrdinal("aptn")).ToString() + " " + dataReader.GetValue(dataReader.GetOrdinal("Street")).ToString() + "   " + dataReader.GetValue(dataReader.GetOrdinal("City")).ToString() +
                                "," + dataReader.GetValue(dataReader.GetOrdinal("State")).ToString() + " " + dataReader.GetValue(dataReader.GetOrdinal("Zip")).ToString();
                            Label3.Text = output;
                            Label4.Text = dataReader.GetValue(dataReader.GetOrdinal("Delivery_Date")).ToString();
                            Label2.Text = "";
                        }
                        Label3.Text = output;
                        Label2.Text = "";
                    }

                }
                else
                {
                    Label1.Text = "";
                    Label3.Text = "";
                    Label4.Text = "";
                    Label2.Text = "invalid tracking number";
                }
                dataReader.Close();
                command.Dispose();
                conn.Close();
            }
            catch(Exception ex)
            {
                command.Dispose();
                conn.Close();
            }


            
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            
            Session.Abandon();
            Response.Redirect("Home.aspx");
        }
    }
}