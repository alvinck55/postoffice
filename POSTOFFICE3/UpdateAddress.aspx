<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdateAddress.aspx.cs" Inherits="POSTOFFICE3.UpdateAddress" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Update Address</title>
    <link href="css/bootstrap.css" rel="stylesheet" />

</head>
<body>
    <form id="form1" runat="server">
        <h1>Post Office Update Address</h1>
        <asp:Label ID="logText" runat="server" Text=""></asp:Label>
        <br />
        <br />
        <div>
            <asp:HiddenField ID="hfContactID" runat="server" />
            <table>
                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="Street"></asp:Label>
                    </td>
                    <td colspan="2">
                        <asp:TextBox ID="streetText" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text="Apt # (optional)"></asp:Label>
                    </td>
                    <td colspan="2">
                        <asp:TextBox ID="aptnText" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label3" runat="server" Text="City"></asp:Label>
                    </td>
                    <td colspan="2">
                        <asp:TextBox ID="cityText" runat="server"></asp:TextBox>
                    </td>
                </tr>
                 <tr>
                    <td>
                        <asp:Label ID="Label4" runat="server" Text="State"></asp:Label>
                    </td>
                    <td colspan="2">
                        <asp:DropDownList ID="stateText" runat="server" DataSourceID="SqlDataSource1" DataTextField="State" DataValueField="State_ID"><asp:ListItem>Alabama</asp:ListItem>
                <asp:ListItem>Alaska</asp:ListItem>
                <asp:ListItem>Arizona</asp:ListItem>
                <asp:ListItem>Arkansas</asp:ListItem>
                <asp:ListItem>California</asp:ListItem>
                <asp:ListItem>Colorado</asp:ListItem>
                <asp:ListItem>Connecticut</asp:ListItem>
                <asp:ListItem>Delaware</asp:ListItem>
                <asp:ListItem>Florida</asp:ListItem>
                <asp:ListItem>Georgia</asp:ListItem>
                <asp:ListItem>Hawaii</asp:ListItem>
                <asp:ListItem>Idaho</asp:ListItem>
                <asp:ListItem>Illinois</asp:ListItem>
                <asp:ListItem>Indiana</asp:ListItem>
                <asp:ListItem>Iowa</asp:ListItem>
                <asp:ListItem>Kansas</asp:ListItem>
                <asp:ListItem>Kentucky</asp:ListItem>
                <asp:ListItem>Louisiana</asp:ListItem>
                <asp:ListItem>Maine</asp:ListItem>
                <asp:ListItem>Maryland</asp:ListItem>
                <asp:ListItem>Massachusetts</asp:ListItem>
                <asp:ListItem>Michigan</asp:ListItem>
                <asp:ListItem>Minnesota</asp:ListItem>
                <asp:ListItem>Mississippi</asp:ListItem>
                <asp:ListItem>Missouri</asp:ListItem>
                <asp:ListItem>Montana</asp:ListItem>
                <asp:ListItem>Nebraska</asp:ListItem>
                <asp:ListItem>Nevada</asp:ListItem>
                <asp:ListItem>New Hampshire</asp:ListItem>
                <asp:ListItem>New Jersey</asp:ListItem>
                <asp:ListItem>New Mexico</asp:ListItem>
                <asp:ListItem>New York</asp:ListItem>
                <asp:ListItem>North Carolina</asp:ListItem>
                <asp:ListItem>North Dakota</asp:ListItem>
                <asp:ListItem>Ohio</asp:ListItem>
                <asp:ListItem>Oklahoma</asp:ListItem>
                <asp:ListItem>Oregon</asp:ListItem>
                <asp:ListItem>Pennsylvania</asp:ListItem>
                <asp:ListItem>Rhode Island</asp:ListItem>
                <asp:ListItem>South Carolina</asp:ListItem>
                <asp:ListItem>South Dakota</asp:ListItem>
                <asp:ListItem>Tennessee</asp:ListItem>
                <asp:ListItem>Texas</asp:ListItem>
                <asp:ListItem>Utah</asp:ListItem>
                <asp:ListItem>Vermont</asp:ListItem>
                <asp:ListItem>Virginia</asp:ListItem>
                <asp:ListItem>Washington</asp:ListItem>
                <asp:ListItem>West Virginia</asp:ListItem>
                <asp:ListItem>Wisconsin</asp:ListItem>
                <asp:ListItem>Wyoming</asp:ListItem></asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:POSTOFFICE2ConnectionString %>" SelectCommand="SELECT STATE.State, STATE.State_ID FROM STATE"></asp:SqlDataSource>
                    </td>
                </tr>
                 <tr>
                    <td>
                        <asp:Label ID="Label5" runat="server" Text="Zip"></asp:Label>
                    </td>
                    <td colspan="2">
                        <asp:TextBox ID="zipText" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="statusMessage" runat="server" Text="Please fill in all required fields"></asp:Label>
                    </td>
                    
                </tr>
                  
            </table>
            <asp:Button ID="addressButton" runat="server" OnClick="Button1_Click" Text="Update Address" />
            <asp:GridView ID="gvAddress" runat="server" AutoGenerateColumns="false">
                <Columns>
                    <asp:BoundField DataField="Street" HeaderText="Street" />
                    <asp:BoundField DataField="aptn" HeaderText="Apt #" />
                    <asp:BoundField DataField="City" HeaderText="City" />
                    <asp:BoundField DataField="State" HeaderText="State" />
                    <asp:BoundField DataField="Zip" HeaderText="Zip Code" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <br />
            <a href="Dashboard.aspx">Dashboard</a>
         
        </div>
      
    </form>
</body>
</html>
