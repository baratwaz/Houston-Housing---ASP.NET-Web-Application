
<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"CodeFile="AdminContent.aspx.cs" Inherits="Admin_AdminContent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <title></title>
<%--    <link href="../StyleSheet.css" rel="stylesheet" />--%><link href="../Content/StyleSheet.css" rel="stylesheet" />
    <link href="../bootstrap-3.3.6-dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="../bootstrap-3.3.6-dist/js/bootstrap.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="margin-top:100px;margin-left:30%;width:40%;align-self:center; background-color:ghostwhite; filter:alpha(opacity=90); /* IE */
-moz-opacity:0.9; /* Mozilla */
opacity: 0.9; /* CSS3 */" 

    <h1>Admin Panel</h1>
        <p style="width: 731px">
            <asp:DropDownList ID="DropDownList1"  runat="server" AutoPostBack="True" 
                 DataTextField="UserName" DataValueField="UserName" OnSelectedIndexChanged="Page_Load" >
            </asp:DropDownList>
            
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [UserName] FROM [Users]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [UserName] FROM [Users]"></asp:SqlDataSource>
        </p>
        <p>
            <asp:CheckBoxList ID="CheckBoxList1" runat="server">
                <asp:ListItem>Admin</asp:ListItem>
                <asp:ListItem>Realtor</asp:ListItem>
                <asp:ListItem>Consumer</asp:ListItem>
            </asp:CheckBoxList>
        </p>



        <p>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Add User" />
        </p>
            <asp:DropDownList ID="DropDownList2"  runat="server" AutoPostBack="True" 
                 DataTextField="UserName" DataValueField="UserName" OnSelectedIndexChanged="Page_Load" DataSourceID="SqlDataSource1"  >
            </asp:DropDownList>
            
        <br />
            <asp:CheckBoxList ID="CheckBoxList2" runat="server">
                <asp:ListItem>Admin</asp:ListItem>
                <asp:ListItem>Realtor</asp:ListItem>
                <asp:ListItem>Consumer</asp:ListItem>
            </asp:CheckBoxList>
        <br />
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Remove User" />
        </div>
    </asp:Content>
  
