<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdatePackage.aspx.cs" Inherits="POSTOFFICE3.UpdatePackage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
        <link href="css/bootstrap.css" rel="stylesheet" />

</head>
<body>
    <form id="form1" runat="server">
         <div>
            <nav class="navbar navbar-dark" style="background-color: #116845">
              <a class="navbar-brand navbar-left" href="EmployeeDashboard.aspx">Employee Dashboard</a>
            <asp:Label ID="loggedin" Text="" class="navbar-text navbar-center" runat="server" />

          
            <asp:Button ID="btnLogout" runat="server" Text="Logout" class="btn btn-danger" OnClick="btnLogout_Click" />
                </nav>
            </div>
        
        <div>

            <h1>Update Package Location/Status</h1>
            <br />
            Enter the Tracking Number:
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <br />
            Enter Status:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="Status" DataTextField="Status" DataValueField="Status_ID">
            </asp:DropDownList>
            <asp:SqlDataSource ID="Status" runat="server" ConnectionString="<%$ ConnectionStrings:POSTOFFICE2ConnectionString %>" SelectCommand="SELECT STATUS.Status, STATUS.Status_ID FROM STATUS "></asp:SqlDataSource>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button1" runat="server" Text="Update" OnClick="Button1_Click" />
        </div>
        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>

    </form>
</body>
</html>
