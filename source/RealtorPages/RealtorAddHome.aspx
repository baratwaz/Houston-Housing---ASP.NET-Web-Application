﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="RealtorAddHome.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
        <title></title>
    <link href="../Content/StyleSheet.css" rel="stylesheet" />
    <link href="../bootstrap-3.3.6-dist/css/bootstrap.min.css" rel="Stylesheet" />
    <script src="../bootstrap-3.3.6-dist/js/bootstrap.min.js"></script>
     <script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.7.min.js" type="text/javascript"></script>
 
    <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.16/jquery-ui.js" type="text/javascript"></script>
 
<link rel="stylesheet" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.16/themes/base/jquery-ui.css" type="text/css" media="all" />
 <script type="text/javascript">
 
    $(function () {
 
        $("#<%= txtYearBuilt.ClientID %>").datepicker();
 
    });
 
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <div class="container">
            <div class="row">
                <h2 class="red">Welcome our valued partners</h2>
            </div>
            <div class="row">
                <nav class="navbar navbar-default">
                    <div class="container-fluid">
                        <%--<div class="navbar-header">
                            <a class="navbar-brand" href="#">WebSiteName</a>
                        </div>--%>
                        <ul class="nav navbar-nav" id="menu">
                            <li class=""><a href="RealtorHome.aspx">Home</a></li>
                            <li><a href="RealtorAddHome.aspx">Add Home</a></li>
                            <%--<li><a href="RealtorEditHome.aspx">Edit Home</a></li>--%>
                        </ul>
                    </div>
                </nav>
            </div>
            <div>
            <table border="0" style="background-color:ghostwhite!important;opacity:0.9!important;">
     
                <tr>
                    <th colspan="4" style="padding-left:30px;padding-top:10px;">Adding new home
                    </th>
                </tr>
                <tr>
                    <td>Property type
                    </td>
                    <td>
                        <%--<asp:TextBox ID="txtPropertyType" runat="server" />--%>
                        <asp:DropDownList ID="txtPropertyType" Font-Size="12" runat="server" CssClass="dropdown"></asp:DropDownList>
                      
                    </td>
                    <td>
                          <asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" ControlToValidate="txtPropertyType"
                            runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>Year built
                    </td>
                    <td>
                        <asp:TextBox ID="txtYearBuilt" runat="server" ></asp:TextBox>
 
                    </td>
                    <td>
                       <asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" ControlToValidate="txtYearBuilt"
                            runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>Sq Ft of house
                    </td>
                    <td>
                        <asp:TextBox ID="txtSqFt" runat="server" />
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" ControlToValidate="txtSqFt"
                            runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>Price
                    </td>
                    <td>
                        <asp:TextBox ID="txtPrice" runat="server" />
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" ControlToValidate="txtPrice"
                            runat="server" />
                    </td>
                </tr>
                 <tr>
                    <td >Picture 1 upload
                    </td>
                    <td>
                        <asp:FileUpload ForeColor="White" runat ="server" ID="picture" />
                        
                    </td>
                    <td>
                            <asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" ControlToValidate="picture"
                            runat="server" />
                    </td>
                </tr>
                  <tr>
                    <td >Picture 2 upload
                    </td>
                    <td>
                        <asp:FileUpload ForeColor="White" runat ="server" ID="picture1" />
                       
                    </td>
                    <td>
                          <asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" ControlToValidate="picture1"
                            runat="server" />
                    </td>
                </tr>
                  <tr>
                    <td >Picture 3 upload
                    </td>
                    <td>
                        <asp:FileUpload ForeColor="White" runat ="server" ID="picture2" />
                      
                    </td>
                    <td>
                              <asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" ControlToValidate="picture2"
                            runat="server" />
                    </td>
                </tr>

                <tr>
                    <td>No of Bathrooms
                    </td>
                    <td>
                        <asp:TextBox ID="noOfBath" runat="server" />
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" ControlToValidate="noOfBath"
                            runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>No of BedRooms
                    </td>
                    <td>
                        <asp:TextBox ID="noOfBeds" runat="server" />
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" ControlToValidate="noOfBeds"
                            runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>Address: Street 1
                    </td>
                    <td>
                        <asp:TextBox ID="addStreet1" runat="server"  />
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" ControlToValidate="addStreet1"
                            runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>Address: Street 2
                    </td>
                    <td>
                        <asp:TextBox ID="addStreet2" runat="server" />
                    </td>
                </tr>
                 <tr>
                    <td>Address: City
                    </td>
                    <td>
                        <asp:TextBox ID="addCity" runat="server" />
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" ControlToValidate="addCity"
                            runat="server" />
                    </td>
                </tr>
                 <tr>
                    <td>Address: State
                    </td>
                    <td>
                        <asp:TextBox ID="addState" runat="server" />
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" ControlToValidate="addState"
                            runat="server" />
                    </td>
                </tr>
                 <tr>
                    <td>Address: Zip code
                    </td>
                    <td>
                        <asp:TextBox ID="addZipCode" runat="server" />
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" ControlToValidate="addZipCode"
                            runat="server" />
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td style="padding-bottom: 40px;">
                        <asp:Button Text="Add home"  ID="addHome" runat="server" OnClick="addHome_Click" />
                    </td>
                    <td></td>
                </tr>
            </table>
                </div>
        </div>
</asp:Content>

