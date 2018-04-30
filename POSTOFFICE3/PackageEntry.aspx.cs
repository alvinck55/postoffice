using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace POSTOFFICE3
{
    public partial class PackageEntry : System.Web.UI.Page
    {
        SqlConnection conn;
        SqlCommand command;
        SqlDataReader dataReader;
        string sqlQuery;
        string senderAddressID;
        string senderID;
        string receiverAddressID;
        string username;
        string packageID;
        string trackingNo;
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Form.DefaultButton = this.Button1.UniqueID;

            if (Session["username"] == null)
            {
                Response.Redirect("Home.aspx");
            }
            loggedin.Text = "Currently logged in as: " + Session["username"];

            username = Session["username"].ToString();
            logText.Text = "Currently logged in as: " + Session["username"];
            try
            {
                string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["PostOffice"].ToString();
                conn = new SqlConnection(connectionString);

                conn.Open();

                sqlQuery = "SELECT dbo.CUSTOMER.Customer_ID FROM dbo.CUSTOMER WHERE dbo.CUSTOMER.Email = @username";
                command = new SqlCommand(sqlQuery, conn);
                command.Parameters.AddWithValue("@username", username);
                dataReader = command.ExecuteReader();

                if (dataReader.HasRows)
                {
                    while (dataReader.Read())
                    {
                        senderID = dataReader.GetValue(dataReader.GetOrdinal("Customer_ID")).ToString();
                    }
                }
                Session["customerid"] = senderID;
                dataReader.Close();
                command.Dispose();
                conn.Close();
            }
            catch (Exception ex)
            {
                Label1.Text = "ERROR FOR USERNAME LOGIN";
            }
        }
            
        protected void Button1_Click(object sender, EventArgs e)
        {
            if(DropDownList5.SelectedValue == "Select")
            {
        
                checkAddress();
            }
            else
            {
                senderAddressID = DropDownList5.SelectedValue.ToString();
                createPackage();
            }
            
        }
        private void checkAddress()
        {
            try
            {
                string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["PostOffice"].ToString();
                conn = new SqlConnection(connectionString);

                conn.Open();

                sqlQuery = "DECLARE @adID int SET @adID = (SELECT ADDRESS.Address_ID FROM ADDRESS WHERE ADDRESS.Street = @Street AND ADDRESS.City = @City AND ADDRESS.State = @State) IF @adID IS NULL BEGIN " +
                    "INSERT INTO ADDRESS(Facility_ID, Street, City,State,Zip,aptn,Postal_code) VALUES('1',@Street,@City,@State,@Zip,@aptn,@Postal_code) SET @adID = SCOPE_IDENTITY() END SELECT @adID";

                command = new SqlCommand(sqlQuery, conn);
                command.Parameters.AddWithValue("@Street", S_Address_TextBox.Text);
                command.Parameters.AddWithValue("@City", S_City_TextBox.Text);
                command.Parameters.AddWithValue("@State", DropDownList3.SelectedItem.Value.ToString());
                if (S_Zip_TextBox.Text == string.Empty)
                {
                    command.Parameters.AddWithValue("@Zip", DBNull.Value);
                }
                else
                {
                    command.Parameters.AddWithValue("@Zip", Convert.ToDecimal(S_Zip_TextBox.Text));
                }
                if (S_Apt_TextBox.Text == string.Empty)
                {
                    command.Parameters.AddWithValue("@aptn", DBNull.Value);
                }
                else
                {
                    command.Parameters.AddWithValue("@aptn", Convert.ToInt32(S_Apt_TextBox.Text));
                }
                if (S_PostalCode_TextBox.Text == string.Empty)
                {
                    command.Parameters.AddWithValue("@Postal_code", DBNull.Value);
                }
                else
                {
                    command.Parameters.AddWithValue("@Postal_code", Convert.ToDecimal(S_PostalCode_TextBox.Text));
                }

                dataReader = command.ExecuteReader();

                if (dataReader.HasRows)
                {
                    while (dataReader.Read())
                    {
                        senderAddressID = dataReader[0].ToString();
                    }
                    dataReader.Close();
                    command.Dispose();
                    
                    sqlQuery = "IF NOT EXISTS(SELECT CUSTOMER_ADDRESS.ID FROM dbo.CUSTOMER_ADDRESS WHERE dbo.CUSTOMER_ADDRESS.Customer_ID = @customerid AND dbo.CUSTOMER_ADDRESS.Address_ID = @addressid ) BEGIN INSERT INTO dbo.CUSTOMER_ADDRESS(Customer_ID,Address_ID) VALUES(@customerid,@addressid) END";
                    command = new SqlCommand(sqlQuery, conn);
                    command.Parameters.AddWithValue("@customerid", senderID);
                    command.Parameters.AddWithValue("@addressid", senderAddressID);
                    command.ExecuteNonQuery();
                    command.Dispose();
                }
                else
                {
                    dataReader.Close();
                    command.Dispose();
                }
               
               
                





                sqlQuery = "DECLARE @adID int SET @adID = (SELECT ADDRESS.Address_ID FROM ADDRESS WHERE ADDRESS.Street = @Street AND ADDRESS.State = @State AND ADDRESS.City = @City) IF @adID IS NULL BEGIN " +
                   "INSERT INTO ADDRESS(Facility_ID, Street, City,State,Zip,aptn,Postal_code) VALUES('1',@Street,@City,@State,@Zip,@aptn,@Postal_code) SET @adID = SCOPE_IDENTITY() END SELECT @adID";
                command = new SqlCommand(sqlQuery, conn);
                command.Parameters.AddWithValue("@Street", R_Address_TextBox.Text);
                command.Parameters.AddWithValue("@City", R_City_TextBox.Text);
                command.Parameters.AddWithValue("@State", DropDownList4.SelectedItem.Value.ToString());
                if (R_Zip_TextBox.Text == string.Empty)
                {
                    command.Parameters.AddWithValue("@Zip", DBNull.Value);
                }
                else
                {
                    command.Parameters.AddWithValue("@Zip", Convert.ToDecimal(R_Zip_TextBox.Text));
                }
                if (R_Apt_TextBox.Text == string.Empty)
                {
                    command.Parameters.AddWithValue("@aptn", DBNull.Value);
                }
                else
                {
                    command.Parameters.AddWithValue("@aptn", Convert.ToInt32(R_Apt_TextBox.Text));
                }
                if (R_PostalCode_TextBox.Text == string.Empty)
                {
                    command.Parameters.AddWithValue("@Postal_code", DBNull.Value);
                }
                else
                {
                    command.Parameters.AddWithValue("@Postal_code", Convert.ToDecimal(R_PostalCode_TextBox.Text));
                }

                dataReader = command.ExecuteReader();

                if (dataReader.HasRows)
                {
                    while (dataReader.Read())
                    {
                        receiverAddressID = dataReader[0].ToString();
                    }
                }

                dataReader.Close();
                command.Dispose();
                conn.Close();
                createPackage();
            }

            catch (Exception ex)
            {
                Label1.Text = "Please ensure all required fields filled in correctly";
                command.Dispose();
                conn.Close();
            }



        }
        private void createPackage()
        {
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["PostOffice"].ToString();
            try
            {
            
                conn = new SqlConnection(connectionString);

                conn.Open();


                sqlQuery = "DECLARE @adID int SET @adID = (SELECT ADDRESS.Address_ID FROM ADDRESS WHERE ADDRESS.Street = @Street AND ADDRESS.State = @State AND ADDRESS.City = @City) IF @adID IS NULL BEGIN " +
   "INSERT INTO ADDRESS(Facility_ID, Street, City,State,Zip,aptn,Postal_code) VALUES('1',@Street,@City,@State,@Zip,@aptn,@Postal_code) SET @adID = SCOPE_IDENTITY() END SELECT @adID";
                command = new SqlCommand(sqlQuery, conn);
                command.Parameters.AddWithValue("@Street", R_Address_TextBox.Text);
                command.Parameters.AddWithValue("@City", R_City_TextBox.Text);
                command.Parameters.AddWithValue("@State", DropDownList4.SelectedItem.Value.ToString());
                if (R_Zip_TextBox.Text == string.Empty)
                {
                    command.Parameters.AddWithValue("@Zip", DBNull.Value);
                }
                else
                {
                    command.Parameters.AddWithValue("@Zip", Convert.ToDecimal(R_Zip_TextBox.Text));
                }
                if (R_Apt_TextBox.Text == string.Empty)
                {
                    command.Parameters.AddWithValue("@aptn", DBNull.Value);
                }
                else
                {
                    command.Parameters.AddWithValue("@aptn", Convert.ToInt32(R_Apt_TextBox.Text));
                }
                if (R_PostalCode_TextBox.Text == string.Empty)
                {
                    command.Parameters.AddWithValue("@Postal_code", DBNull.Value);
                }
                else
                {
                    command.Parameters.AddWithValue("@Postal_code", Convert.ToDecimal(R_PostalCode_TextBox.Text));
                }

                dataReader = command.ExecuteReader();

                if (dataReader.HasRows)
                {
                    while (dataReader.Read())
                    {
                        receiverAddressID = dataReader[0].ToString();
                    }
                    dataReader.Close();
                    command.Dispose();
                    conn.Close();
                }

            }
            catch(Exception ex)
            {
                Label1.Text = "Receiver address ID failed";
            }

            try
            {

            
            conn = new SqlConnection(connectionString);

                conn.Open();

                sqlQuery = "INSERT INTO dbo.PACKAGE(Sender_ID,Weight,Types,Priority,Sender_Address_ID,Receiver_Address_ID,Receiver_Fname,Receiver_Lname)" +
                    "VALUES(@senderid, @weight,@type,@priority,@Sender_Address_ID,@Receiver_Address_ID,@fname,@lname)" +
                    " DECLARE @Package_ID int DECLARE @Tracking_no int SET @Package_ID = SCOPE_IDENTITY() SET @Tracking_no = (SELECT TRACKING.Tracking_no FROM TRACKING WHERE TRACKING.Package_ID = @Package_ID) SELECT @Package_ID,@Tracking_no";


                command = new SqlCommand(sqlQuery, conn);
                command.Parameters.AddWithValue("@type", DropDownList1.SelectedItem.Value.ToString());
                command.Parameters.AddWithValue("@priority", DropDownList2.SelectedItem.Value.ToString());
                command.Parameters.AddWithValue("@Receiver_Address_ID", receiverAddressID);
                command.Parameters.AddWithValue("@Sender_Address_ID", senderAddressID);
                command.Parameters.AddWithValue("@senderid", senderID);
                command.Parameters.AddWithValue("@fname", TextBox8.Text);
                command.Parameters.AddWithValue("@lname", TextBox9.Text);
                if (DropDownList1.SelectedItem.Value.ToString() == "EE")
                {
                    command.Parameters.AddWithValue("@weight", Convert.ToDecimal(Weight_TextBox.Text));
                }
                else
                {
                    command.Parameters.AddWithValue("@weight", .01);
                }
                dataReader = command.ExecuteReader();
                if (dataReader.HasRows)
                {
                    while (dataReader.Read())
                    {
                        packageID = dataReader[0].ToString();
                        trackingNo = dataReader[1].ToString();

                    }

                    command.Dispose();
                    Label1.Text = "Package sucessfully created, your package ID# is " +packageID;
                    Label2.Text = "Your tracking number is " + trackingNo;
                    

           
                }
                else
                {
                    Label1.Text = "Package creation failed";
                }


                
            }
            catch(Exception ex)
            {
                Label1.Text = "Package creation failed";
                command.Dispose();
                conn.Close();
            }


            
            command.Dispose();
            conn.Close();


        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        protected void DropDownList1_SelectedIndexChanged1(object sender, EventArgs e)
        {
            if(DropDownList1.SelectedItem.Value.ToString() == "LE")
            {
                Weight_TextBox.ReadOnly = true;
                Weight_TextBox.BackColor = System.Drawing.Color.LightGray;
            }
            else
            {
                Weight_TextBox.ReadOnly = false;
                Weight_TextBox.BackColor = System.Drawing.Color.White;
            }
        }

        protected void DropDownList5_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(DropDownList5.SelectedItem.Value.ToString() != "Select")
            {
                S_Address_TextBox.ReadOnly = true;
                S_Address_TextBox.BackColor = System.Drawing.Color.LightGray;
                S_City_TextBox.ReadOnly = true;
                S_City_TextBox.BackColor = System.Drawing.Color.LightGray;
                S_Apt_TextBox.ReadOnly = true;
                S_Apt_TextBox.BackColor = System.Drawing.Color.LightGray;
                S_Zip_TextBox.ReadOnly = true;
                S_Zip_TextBox.BackColor = System.Drawing.Color.LightGray;
                S_PostalCode_TextBox.ReadOnly = true;
                S_PostalCode_TextBox.BackColor = System.Drawing.Color.LightGray;
                DropDownList3.BackColor = System.Drawing.Color.LightGray;
            }
            else
            {
                S_Address_TextBox.ReadOnly = false;
                S_Address_TextBox.BackColor = System.Drawing.Color.White;
                S_City_TextBox.ReadOnly = false;
                S_City_TextBox.BackColor = System.Drawing.Color.White;
                S_Apt_TextBox.ReadOnly = false;
                S_Apt_TextBox.BackColor = System.Drawing.Color.White;
                S_Zip_TextBox.ReadOnly = false;
                S_Zip_TextBox.BackColor = System.Drawing.Color.White;
                S_PostalCode_TextBox.ReadOnly = false;
                S_PostalCode_TextBox.BackColor = System.Drawing.Color.White;
                DropDownList3.BackColor = System.Drawing.Color.White;
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("Home.aspx");
        }
    }
}