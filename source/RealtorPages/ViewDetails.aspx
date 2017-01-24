<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ViewDetails.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

    <link href="../Content/StyleSheet.css" rel="stylesheet" />
    <link href="bootstrap/css/bootstrap.css" rel="stylesheet" />
    <link href="bootstrap/css/bootstrap-theme.min.css" rel="stylesheet" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="bootstrap/js/bootstrap.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <style>
        .carousel-inner > .item > img,
        .carousel-inner > .item > a > img {
            width: 70%;
            margin: auto;
        }
    </style>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
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
        <div class="details">
            <div style="display: flex">
                <div class="upperLeft">
                    <span style="font-size: 40px; margin-left: 109px; text-decoration: underline; color: lightslategrey;">Address</span><br />
                    <asp:Label ID="address1" runat="server" CssClass="add1"></asp:Label>
                    <br />
                    <asp:Label ID="address2" runat="server" CssClass="add2"></asp:Label>
                </div>
                <div class="upperRight">
                    <div style="margin-left: 20px;">
                        <br />
                        <asp:Label runat="server" ID="bed" ForeColor="Blue" Font-Size="27">
                            
                        </asp:Label>
                        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                        <asp:Label runat="server" ID="price" ForeColor="darkgreen" Font-Size="30">
                            
                        </asp:Label>
                        <br />
                        <asp:Label runat="server" ID="bath" ForeColor="Blue" Font-Size="27">

                        </asp:Label>
                        <br />
                        <asp:Label runat="server" ID="sqft" ForeColor="Blue" Font-Size="27">

                        </asp:Label>
                    </div>
                </div>
            </div>
            <div class="bottom">
                <div class="container">
                    <br />
                    <div id="myCarousel" class="carousel slide" data-ride="carousel">
                        <!-- Indicators -->
                        <ol class="carousel-indicators">
                            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                            <li data-target="#myCarousel" data-slide-to="1"></li>
                            <li data-target="#myCarousel" data-slide-to="2"></li>
                            <li data-target="#myCarousel" data-slide-to="3"></li>
                        </ol>

                        <!-- Wrapper for slides -->
                        <div class="carousel-inner" role="listbox">
                            <div class="item active">
                                <%--<img src="Images/bedroom_1.jpg" alt="Chania" width="460" height="345" />--%>
                                <asp:Image runat="server" alt="Chania" Width="100%" Height="580" ID="pic1" />
                                <div class="carousel-caption">
                                    <h3 style="color:blue">Most Valued Property</h3>
                                </div>
                            </div>

                            <div class="item">
                                <%--<img src="Images/bedroom_2.jpg" alt="Chania" width="460" height="345"  />--%>
                                <asp:Image runat="server" alt="Chania" Width="100%" Height="580" ID="pic2" />
                                <div class="carousel-caption">
                                    <h3 style="color:blue">Clean Title</h3>
                                </div>
                            </div>

                            <div class="item">
                                <%--<img src="Images/bedroom_3.jpg" alt="Flower" width="460" height="345" />--%>
                                <asp:Image runat="server" alt="Chania" Width="100%" Height="580" ID="pic3" />
                                <div class="carousel-caption">
                                    <h3 style="color:blue">Your dream house</h3>
                                </div>
                            </div>


                        </div>

                        <!-- Left and right controls -->
                        <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                            <span class="sr-only">Next</span>
                        </a>
                    </div>
                </div>

            </div>
        </div>
    </div>
</asp:Content>

