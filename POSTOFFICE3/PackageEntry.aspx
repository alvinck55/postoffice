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
        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="PostOffice" DataTextField="Type" DataValueField="Type" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged1">
        </asp:DropDownList>
        <asp:SqlDataSource ID="PostOffice" runat="server" ConnectionString="<%$ ConnectionStrings:POSTOFFICE2ConnectionString %>" SelectCommand="SELECT TYPE.Type FROM TYPE"></asp:SqlDataSource>
        <br />
        Sender Last Name:<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Priority of Package:<asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="PostOfficePriority" DataTextField="Priority" DataValueField="Priority">
        </asp:DropDownList>
        <asp:SqlDataSource ID="PostOfficePriority" runat="server" ConnectionString="<%$ ConnectionStrings:POSTOFFICE2ConnectionString3 %>" SelectCommand="SELECT PRIORITY.Priority FROM PRIORITY"></asp:SqlDataSource>
        <br />
        Sender Address:<asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        Sender Apt #(OPTIONAL):<asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
        <br />
        Sender City:<asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
        <br />
        Sender State:<asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
        <br />
        Sender Zip:<asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
        <br />
        <br />
        <br />
        Receiver First Name:<asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
        <br />
        Receiver Last Name:<asp:TextBox ID="TextBox9" runat="server"></asp:TextBox>
        <br />
        Receiver Address:<asp:TextBox ID="TextBox10" runat="server"></asp:TextBox>
        <br />
        Receiver Apt#(OPTIONAL):<asp:TextBox ID="TextBox11" runat="server"></asp:TextBox>
        <br />
        Receiver City:<asp:TextBox ID="TextBox12" runat="server"></asp:TextBox>
        <br />
        Receiver State:<asp:TextBox ID="TextBox13" runat="server"></asp:TextBox>
        <br />
        Receiver Zip:<asp:TextBox ID="TextBox14" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click" />
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
    </form>
</body>
</html>
