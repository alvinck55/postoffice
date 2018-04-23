<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SearchPackage.aspx.cs" Inherits="POSTOFFICE3.SearchPackage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <p>
        <br />
    </p>
    <p>
        &nbsp;</p>
    <form id="form1" runat="server">
        <p>
            Address :<asp:TextBox ID="Address_TextBox" runat="server" Text=""></asp:TextBox>
        </p>
        <p>
            State:<asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="State" DataValueField="State_ID" AppendDataBoundItems="true">
                <asp:ListItem>Select</asp:ListItem>
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:POSTOFFICE2ConnectionString %>" SelectCommand="SELECT STATE.State, STATE.State_ID FROM STATE"></asp:SqlDataSource>
        </p>
        <p style="margin-left: 640px">
            <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
        </p>
        <p>
            City:<asp:TextBox ID="City_TextBox" runat="server" Text=""></asp:TextBox>
        </p>
        <p>
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
        </p>
        <div>
        </div>
        <div style="margin-left: 440px">
        </div>
    </form>
</body>
</html>
