using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace POSTOFFICE3
{
	public partial class customerSearch : System.Web.UI.Page
	{
        SqlConnection conn;
        string sqlQuery;
        string output;

        protected void Page_Load(object sender, EventArgs e)
		{

		}

        protected void customerSearch_Click(object sender, EventArgs e)
        {
            custSearch();
        }
        private void custSearch()
        {
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["PostOffice"].ToString();
            conn = new SqlConnection(connectionString);
            string quer = "";
            conn.Open();
            if (!(string.IsNullOrEmpty(fName.Text) && string.IsNullOrEmpty(mInit.Text) && string.IsNullOrEmpty(lName.Text) && string.IsNullOrEmpty(email.Text) && string.IsNullOrEmpty(phone.Text) && string.IsNullOrEmpty(street.Text) && string.IsNullOrEmpty(city.Text) && string.IsNullOrEmpty(state.Text) && string.IsNullOrEmpty(zip.Text)))
            {
                SqlDataReader dataReader;
                SqlCommand command;
                if (!string.IsNullOrEmpty(fName.Text))
                {
                    if (string.IsNullOrEmpty(quer))
                        quer = "SELECT dbo.CUSTOMER.Customer_ID FROM POSTOFFICE2.dbo.CUSTOMER, POSTOFFICE2.dbo.ADDRESS WHERE dbo.CUSTOMER.Fname= '" + fName.Text + "'";
                    else
                        quer += " AND dbo.CUSTOMER.Fname= '" + fName.Text + "'";
                }
                if (!string.IsNullOrEmpty(mInit.Text))
                {
                    if (string.IsNullOrEmpty(quer))
                        quer = "SELECT dbo.CUSTOMER.Customer_ID FROM POSTOFFICE2.dbo.CUSTOMER, POSTOFFICE2.dbo.ADDRESS WHERE dbo.CUSTOMER.Minit= '" + mInit.Text + "'";
                    else
                        quer += " AND dbo.CUSTOMER.Fname= '" + mInit.Text + "'";
                }
                if (!string.IsNullOrEmpty(lName.Text))
                {
                    if (string.IsNullOrEmpty(quer))
                        quer = "SELECT dbo.CUSTOMER.Customer_ID FROM POSTOFFICE2.dbo.CUSTOMER, POSTOFFICE2.dbo.ADDRESS WHERE dbo.CUSTOMER.Lname= '" + lName.Text + "'";
                    else
                        quer += " AND dbo.CUSTOMER.Fname= '" + lName.Text + "'";
                }
                if (!string.IsNullOrEmpty(email.Text))
                {
                    if (string.IsNullOrEmpty(quer))
                        quer = "SELECT dbo.CUSTOMER.Customer_ID FROM POSTOFFICE2.dbo.CUSTOMER, POSTOFFICE2.dbo.ADDRESS WHERE dbo.CUSTOMER.Email= '" + email.Text + "'";
                    else
                        quer += " AND dbo.CUSTOMER.Fname= '" + email.Text + "'";
                }
                if (!string.IsNullOrEmpty(phone.Text))
                {
                    if (string.IsNullOrEmpty(quer))
                        quer = "SELECT dbo.CUSTOMER.Customer_ID FROM POSTOFFICE2.dbo.CUSTOMER, POSTOFFICE2.dbo.ADDRESS WHERE (dbo.CUSTOMER.Phone1= '" + phone.Text + "' OR dbo.CUSTOMER.Phone2 = '" + phone.Text + "')";
                    else
                        quer += " AND (dbo.CUSTOMER.Phone1= '" + phone.Text + "' OR dbo.CUSTOMER.Phone2 = '" + phone.Text + "')";
                }
                if (!string.IsNullOrEmpty(street.Text))
                {
                    if (string.IsNullOrEmpty(quer))
                        quer = "SELECT dbo.CUSTOMER.Customer_ID FROM POSTOFFICE2.dbo.CUSTOMER, POSTOFFICE2.dbo.ADDRESS WHERE dbo.ADDRESS.Street= '" + street.Text + "'";
                    else
                        quer += " AND dbo.ADDRESS.Street= '" + street.Text + "'";
                }
                if (!string.IsNullOrEmpty(city.Text))
                {
                    if (string.IsNullOrEmpty(quer))
                        quer = "SELECT dbo.CUSTOMER.Customer_ID FROM POSTOFFICE2.dbo.CUSTOMER, POSTOFFICE2.dbo.ADDRESS WHERE dbo.ADDRESS.City= '" + city.Text + "'";
                    else
                        quer += " AND dbo.ADDRESS.City= '" + city.Text + "'";
                }
                if (!string.IsNullOrEmpty(state.Text))
                {
                    if (string.IsNullOrEmpty(quer))
                        quer = "SELECT dbo.CUSTOMER.Customer_ID FROM POSTOFFICE2.dbo.CUSTOMER, POSTOFFICE2.dbo.ADDRESS WHERE dbo.ADDRESS.State= '" + state.Text + "'";
                    else
                        quer += " AND dbo.ADDRESS.State= '" + state.Text + "'";
                }
                if (!string.IsNullOrEmpty(zip.Text))
                {
                    if (string.IsNullOrEmpty(quer))
                        quer = "SELECT dbo.CUSTOMER.Customer_ID FROM POSTOFFICE2.dbo.CUSTOMER, POSTOFFICE2.dbo.ADDRESS WHERE dbo.ADDRESS.Zip= '" + zip.Text + "'";
                    else
                        quer += " AND dbo.ADDRESS.Zip= '" + zip.Text + "'";
                }
                sqlQuery = quer;
                command = new SqlCommand(sqlQuery, conn);
                dataReader = command.ExecuteReader();
                output = "";


                if (dataReader.HasRows)
                {
                    while (dataReader.Read())
                    {
                        output = dataReader.GetValue(dataReader.GetOrdinal("Customer_ID")).ToString();
                    }
                    Label1.Text = output;
                }
                else
                {
                    Label1.Text = "No matching customer.";
                }
                dataReader.Close();
                command.Dispose();
            }
            else
            {
                Label1.Text = "Complete at least one field.";
            }
            conn.Close();
        }
    }
}