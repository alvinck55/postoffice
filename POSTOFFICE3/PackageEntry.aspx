<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PackageEntry.aspx.cs" Inherits="POSTOFFICE3.PackageEntry" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Enter Package Info:</div>
        Sender First Name:<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Type of Package:
        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="PostOffice" DataTextField="Type" DataValueField="Type_ID" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged1" Width="80px" AutoPostBack="True">
        </asp:DropDownList>
        <asp:SqlDataSource ID="PostOffice" runat="server" ConnectionString="<%$ ConnectionStrings:POSTOFFICE2ConnectionString %>" SelectCommand="SELECT TYPE.Type, TYPE.Type_ID FROM TYPE"></asp:SqlDataSource>
        <br />
        Sender Last Name:<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Priority of Package:<asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="PostOfficePriority" DataTextField="Priority" DataValueField="Priority_ID">
        </asp:DropDownList>
        <asp:SqlDataSource ID="PostOfficePriority" runat="server" ConnectionString="<%$ ConnectionStrings:POSTOFFICE2ConnectionString3 %>" SelectCommand="SELECT PRIORITY.Priority,PRIORITY.Priority_ID FROM PRIORITY"></asp:SqlDataSource>
        <br />
        Sender Address:<asp:TextBox ID="S_Address_TextBox" runat="server"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        Weight of Package(Estimated):
        <asp:TextBox ID="Weight_TextBox" ReadOnly="false" runat="server"></asp:TextBox>
        <br />
        Sender Apt #(OPTIONAL):<asp:TextBox ID="S_Apt_TextBox" runat="server"></asp:TextBox>
        <br />
        Sender City:<asp:TextBox ID="S_City_TextBox" runat="server"></asp:TextBox>
        <br />
        Sender State:<asp:TextBox ID="S_State_TextBox" runat="server"></asp:TextBox>
        <br />
        Sender Zip:<asp:TextBox ID="S_Zip_TextBox" runat="server"></asp:TextBox>
        <br />
        Sender Postal Code:<asp:TextBox ID="S_PostalCode_TextBox" runat="server"></asp:TextBox>
        <br />
        <br />
        Receiver First Name:<asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
        <br />
        Receiver Last Name:<asp:TextBox ID="TextBox9" runat="server"></asp:TextBox>
        <br />
        Receiver Address:<asp:TextBox ID="R_Address_TextBox" runat="server"></asp:TextBox>
        <br />
        Receiver Apt#(OPTIONAL):<asp:TextBox ID="R_Apt_TextBox" runat="server"></asp:TextBox>
        <br />
        Receiver City:<asp:TextBox ID="R_City_TextBox" runat="server"></asp:TextBox>
        <br />
        Receiver State:<asp:TextBox ID="R_State_TextBox" runat="server"></asp:TextBox>
        <br />
        Receiver Zip:<asp:TextBox ID="R_Zip_TextBox" runat="server"></asp:TextBox>
        <br />
        Receiver Postal Code:<asp:TextBox ID="R_PostalCode_TextBox" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click" />
        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
        <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
    </form>
</body>
</html>
