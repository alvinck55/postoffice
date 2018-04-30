<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="newaddress.aspx.cs" Inherits="POSTOFFICE3.New_Address" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <link href="css/bootstrap.css" rel="stylesheet" />

    <title></title>
</head>
<body>
    <asp:Label ID="addressStatus" runat="server" Text=""></asp:Label>
    <form id="form1" runat="server">
        <div class="col-md-4">
            <asp:Label ID="addressDetails" runat="server" Text=""></asp:Label>
            <p>Street: </p>
            <asp:TextBox ID="streetText" CssClass="form-control" Text="" runat="server" />
            <p>Apt #(optional): </p>
            <asp:TextBox ID="aptText" CssClass="form-control" Text="" runat="server" />
            <p>City: </p>
            <asp:TextBox ID="cityText" CssClass="form-control" Text="" runat="server" />
            <p>State: 
            <asp:DropDownList ID="stateList" runat="server" DataSourceID="SqlDataSource1" DataTextField="State" DataValueField="State_ID" OnSelectedIndexChanged="stateList_SelectedIndexChanged">
            </asp:DropDownList>
            </p>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:POSTOFFICE2ConnectionString %>" SelectCommand="SELECT STATE.State, STATE.State_ID FROM STATE"></asp:SqlDataSource>
            <p>Zip: </p>
            <asp:TextBox ID="zipText" CssClass="form-control" Text="" runat="server" />
            <asp:Label ID="fieldStatus" runat="server" Text="Please fill in all fields"></asp:Label>
            <asp:Button ID="submitAddress" runat="server" Text="Submit" OnClick="submitAddress_Click" />
        </div>
    </form>
</body>
</html>
