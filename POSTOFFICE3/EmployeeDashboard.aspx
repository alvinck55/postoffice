<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmployeeDashboard.aspx.cs" Inherits="POSTOFFICE3.EmployeeDashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <link href="css/bootstrap.css" rel="stylesheet" />

    <title></title>
</head>
<body>
    <form id="form1" runat="server">
       
            <nav class="navbar navbar-dark" style="background-color: #116845">
              <a class="navbar-brand navbar-left" href="EmployeeDashboard.aspx">Employee Dashboard</a>
            <asp:Label ID="loggedin" Text="" class="navbar-text navbar-center" runat="server" />

          
            <asp:Button ID="btnLogout" runat="server" Text="Logout" class="btn btn-danger" OnClick="btnLogout_Click" />

        </nav>
       <br />
        <br />
         <div class="container-fluid">

            <div class="col-md-4">
            <a href="UpdatePackage.aspx" class="btn btn-primary btn-sm btn-block" role="button">Update a Package Location/Status</a><br />
            <a href="FacilityTraffic.aspx" class="btn btn-primary btn-sm btn-block" role="button">Facility Report</a><br />
            <a href="EditPackage.aspx" class="btn btn-primary btn-sm btn-block" role="button">Edit a Package</a><br />
            <a href="Tracking.aspx"class="btn btn-primary btn-sm btn-block" role="button">Track a package</a>
            <br />
             <a href="SearchCustomer.aspx" class="btn btn-primary btn-sm btn-block" role="button">Search a Customer Shipping History</a><br />
            <a href="AddressSearch.aspx" class="btn btn-primary btn-sm btn-block" role="button">Search an Address Shipping History</a><br />
            <br />
            
            <br />
        </div>
             </div>
    </form>
</body>
</html>
