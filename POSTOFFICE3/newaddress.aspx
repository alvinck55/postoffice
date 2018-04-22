<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="newaddress.aspx.cs" Inherits="POSTOFFICE3.New_Address" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <asp:Label ID="addressStatus" runat="server" Text=""></asp:Label>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="addressDetails" runat="server" Text=""></asp:Label>
            <p>Street: </p>
            <asp:TextBox ID="streetText" Text="" runat="server" />
            <p>Apt #(optional): </p>
            <asp:TextBox ID="aptText" Text="" runat="server" />
            <p>City: </p>
            <asp:TextBox ID="cityText" Text="" runat="server" />
            <p>State: </p>
            <asp:DropDownList ID="stateList" runat="server">
                <asp:ListItem>Alabama</asp:ListItem>
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
                <asp:ListItem>Wyoming</asp:ListItem>
            </asp:DropDownList>
            <p>Zip: </p>
            <asp:TextBox ID="zipText" Text="" runat="server" />
            <asp:Label ID="fieldStatus" runat="server" Text="Please fill in all fields"></asp:Label>
            <asp:Button ID="submitAddress" runat="server" Text="Submit" OnClick="submitAddress_Click" />
        </div>
    </form>
</body>
</html>
