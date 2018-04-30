using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace POSTOFFICE3
{
    public partial class FacilityReport : System.Web.UI.Page
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

                Label1.Text = "Facility " + facility_id;
                Session["facility_id"] = facility_id;
                dataReader.Close();
                command.Dispose();
                conn.Close();
            }
            catch (Exception ex)
            {
                Label1.Text = "ERROR FOR USERNAME LOGIN";
            }
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            TextBox1.Text = Calendar1.SelectedDate.ToLongDateString();
            Calendar1.Visible = false;
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }

        protected void lnkpickdate_Click(object sender, EventArgs e)
        {
            
            Calendar1.Visible = true;
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Calendar2.Visible = true;
        }

        protected void Calendar2_SelectionChanged(object sender, EventArgs e)
        {
            TextBox2.Text = Calendar2.SelectedDate.ToLongDateString();
            Calendar2.Visible = false;
        }
    }
}