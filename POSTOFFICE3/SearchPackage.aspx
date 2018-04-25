<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SearchPackage.aspx.cs" Inherits="POSTOFFICE3.SearchPackage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <h1>Search for a Package</h1>
    <p>
        &nbsp;</p>
    <form id="form1" runat="server">
        <p>
            Receiver
            Address :<asp:TextBox ID="Address_TextBox" runat="server" Text=""></asp:TextBox>
        </p>
        <p>
            Receiver
            State:<asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="State" DataValueField="State_ID" AppendDataBoundItems="true">
                <asp:ListItem>Select</asp:ListItem>
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:POSTOFFICE2ConnectionString %>" SelectCommand="SELECT STATE.State, STATE.State_ID FROM STATE"></asp:SqlDataSource>
        </p>
        <p style="margin-left: 640px">
            &nbsp;</p>
        <p>
            Receiver
            City:<asp:TextBox ID="City_TextBox" runat="server" Text=""></asp:TextBox>
        </p>
        <p>
            Receiver
            Zip:<asp:TextBox ID="Zip_TextBox" runat="server" Text=""></asp:TextBox>
        </p>
        <p>
            Type:<asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="Type" DataValueField="Type_ID" AppendDataBoundItems="true">
                <asp:ListItem>Select</asp:ListItem>
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:POSTOFFICE2ConnectionString %>" SelectCommand="SELECT TYPE.Type, TYPE.Type_ID FROM TYPE"></asp:SqlDataSource>
        </p>
        <p>
            Weight:<asp:TextBox ID="Weight_TextBox" runat="server" Text=""></asp:TextBox>
        </p>
        <p>
            Priority:<asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource3" DataTextField="Priority" DataValueField="Priority_ID" AppendDataBoundItems="true">
                <asp:ListItem>Select</asp:ListItem>
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:POSTOFFICE2ConnectionString %>" SelectCommand="SELECT PRIORITY.Priority, PRIORITY.Priority_ID FROM PRIORITY"></asp:SqlDataSource>
        </p>
        <p>
            <asp:Button ID="Button1" runat="server" Text="Search" OnClick="Button1_Click" />
            <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
            <asp:GridView ID="GridView1" runat="server">
            </asp:GridView>
        </p>
        <div>
        <a href="Dashboard.aspx">Dashboard</a></div>
    </form>
</body>
</html>
