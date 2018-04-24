<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddAddress.aspx.cs" Inherits="POSTOFFICE3.AddAddress1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <br />
            Street:<asp:TextBox ID="Street_TextBox" runat="server"></asp:TextBox>
            <br />
            APT#(Optional):
            <asp:TextBox ID="Apt_TextBox" runat="server"></asp:TextBox>
            <br />
            City:<asp:TextBox ID="City_TextBox" runat="server"></asp:TextBox>
            <br />
            State:<asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="State" DataValueField="State_ID">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:POSTOFFICE2ConnectionString %>" SelectCommand="SELECT [State], [State_ID] FROM [STATE]"></asp:SqlDataSource>
            <br />
            Zip:<asp:TextBox ID="Zip_TextBox" runat="server"></asp:TextBox>
            <br />
            Postal Code(Optional):
            <asp:TextBox ID="PostalCode_TextBox" runat="server"></asp:TextBox>
            <br />
        </div>
        <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click" />
        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
    </form>
</body>
</html>
