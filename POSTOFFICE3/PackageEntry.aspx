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
        <br />
        Sender Last Name:<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        <br />
        Sender Street:<asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
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
        Receiver Street:<asp:TextBox ID="TextBox10" runat="server"></asp:TextBox>
        <br />
        Receiver Apt#(OPTIONAL):<asp:TextBox ID="TextBox11" runat="server"></asp:TextBox>
        <br />
        Receiver City:<asp:TextBox ID="TextBox12" runat="server"></asp:TextBox>
        <br />
        Receiver State:<asp:TextBox ID="TextBox13" runat="server"></asp:TextBox>
        <br />
        Receiver Zip:<asp:TextBox ID="TextBox14" runat="server"></asp:TextBox>
        <br />
    </form>
</body>
</html>
