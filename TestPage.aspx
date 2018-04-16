<%@ Page Language="C#" %>

<!DOCTYPE html>
<script runat="server">

    protected void Button1_Click(object sender, EventArgs e)
    {
        Label1.Text = TextBox1.Text + ", welcome";
    }
</script>

<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta charset="utf-8" />
    <title></title>    
</head>
<body>
    <form id="form1" runat="server">   
        Enter your name here:<br />
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" Text="Display Name" OnClick="Button1_Click" />
        <p>
            <asp:Label ForeColor="SteelBlue"  ID="Label1" runat="server" Text="Label"></asp:Label>
        </p>
    </form>
</body>
</html>
