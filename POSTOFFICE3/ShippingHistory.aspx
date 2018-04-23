<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShippingHistory.aspx.cs" Inherits="POSTOFFICE3.ShippingHistory" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Shipping History</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            From Date<br />
        </div>
        <asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>
        <br />
        <br />
        To Date<br />
        <asp:Calendar ID="Calendar2" runat="server"></asp:Calendar>
        <br />
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
            <asp:ListItem Value="-30">Last 30 days</asp:ListItem>
            <asp:ListItem Value="-60">Last 60 days</asp:ListItem>
            <asp:ListItem Value="-90">Last 90 days</asp:ListItem>
        </asp:DropDownList>
        <br />
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
            <br />
        <br />
        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="Temp_date" DataValueField="Temp_date">
            <asp:ListItem Value="30">Last 30 days</asp:ListItem>
            <asp:ListItem Value="60">Last 60 days</asp:ListItem>
            <asp:ListItem Value="90">Last 90 days</asp:ListItem>
            <asp:ListItem Value="Custom"></asp:ListItem>
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:POSTOFFICE2ConnectionString %>" SelectCommand="SELECT P.Temp_date
FROM PACKAGE p, CUSTOMER c
WHERE p.Temp_date &gt;= DATEADD(day,-30, getdate())
AND p.Sender_ID=c.Customer_ID
AND c.Customer_ID=9">
        </asp:SqlDataSource>
        <br />
        <br />
        <br />
        <br />
        <asp:TextBox ID="TextBox2" runat="server" Text="-30"></asp:TextBox>
        <br />
        <asp:TextBox ID="TextBox3" runat="server" Text="-60"></asp:TextBox>
        <br />
        <asp:TextBox ID="TextBox4" runat="server" Text="-90"></asp:TextBox>
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2">
            <Columns>
                <asp:BoundField DataField="Temp_date" HeaderText="Temp_date" SortExpression="Temp_date" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:POSTOFFICE2ConnectionString %>" SelectCommand="SELECT Tracking_no, Types, Priority, Last_updated FROM POSTOFFICE2.dbo.PACKAGE p WHERE p.Sender_ID=@customerid">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox1" Name="customerid" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
        <p>
            <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
        </p>
        <p>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        </p>
    </form>
</body>
</html>
