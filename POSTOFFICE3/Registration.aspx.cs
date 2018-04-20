using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
namespace POSTOFFICE3
{
    public partial class Registration : System.Web.UI.Page
    {
        string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["PostOffice"].ToString();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Clear();
            }

        }
        protected void registerEventMethod(object sender, EventArgs args)
        {
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                if (firstNameText.Text == "" || middleNameText.Text == "" || lastNameText.Text == "" || emailText.Text == "" || phoneText.Text == "" || passwordText.Text == "" || password2Text.Text == "")
                {
                    statusMessage.Text = "Please fill in require fields";
                }
                else if (passwordText.Text != password2Text.Text)
                {
                    statusMessage.Text = "Passwords do not match";

                }
                else
                {
                    sqlCon.Open();
                    SqlCommand sqlCmd = new SqlCommand("newuser", sqlCon);
                    sqlCmd.CommandType = CommandType.StoredProcedure;
                    try
                    {
                        //sqlCmd.Parameters.AddWithValue("@Customer_ID", Convert.ToInt32(hfCustomerID.Value == "" ? "0" : hfCustomerID.Value));
                        sqlCmd.Parameters.AddWithValue("@Fname", firstNameText.Text.Trim());
                        sqlCmd.Parameters.AddWithValue("@Minit", middleNameText.Text.Trim());
                        sqlCmd.Parameters.AddWithValue("@Lname", lastNameText.Text.Trim());
                        sqlCmd.Parameters.AddWithValue("@Email", emailText.Text.Trim());
                        sqlCmd.Parameters.AddWithValue("@Phone1", phoneText.Text.Trim());
                        sqlCmd.Parameters.AddWithValue("@Phone2", phone2Text.Text.Trim());
                        sqlCmd.Parameters.AddWithValue("@Password", passwordText.Text.Trim());
                        sqlCmd.ExecuteNonQuery();
                        Clear();
                        statusMessage.Text = "Account registered";
                    }
                    catch (Exception ex)
                    {
                        statusMessage.Text = "email already exists";
                    }
                }
                //lblSuccessMessage.Text = "Submitted Successfully";
                


            }

        }  
        
        void Clear()
        {
            firstNameText.Text = middleNameText.Text = lastNameText.Text = emailText.Text = phoneText.Text = phone2Text.Text = passwordText.Text = "";
            hfCustomerID.Value = "";



        }

    }
}


      