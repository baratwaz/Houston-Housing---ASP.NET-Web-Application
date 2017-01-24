<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="RealtorEditHome.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <title></title>
    <link href="../Content/StyleSheet.css" rel="stylesheet" />
    <link href="../bootstrap-3.3.6-dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="../bootstrap-3.3.6-dist/js/bootstrap.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <div class="container">
            <div class="row">
                <h2 class="red">Welcome our valued partners</h2>
            </div>
            <div class="row">
                <nav class="navbar navbar-default" >
                    <div class="container-fluid">
                        <ul class="nav navbar-nav" id="menu">
                            <li class=""><a href="RealtorHome.aspx">Home</a></li>
                            <li><a href="RealtorAddHome.aspx">Add Home</a></li>
                            <%--<li><a href="RealtorEditHome.aspx">Edit Home</a></li>--%>
                        </ul>
                    </div>
                </nav>
            </div>
 
            <span class="success red">Edit Home Added - Next sprint deliverable.</span>
        </div>
</asp:Content>

