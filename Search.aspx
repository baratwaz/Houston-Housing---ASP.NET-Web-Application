<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Search.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title></title>
    <script src="//code.jquery.com/jquery-2.1.3.min.js"></script>
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
    <script src="//raw.github.com/botmonster/jquery-bootpag/master/lib/jquery.bootpag.min.js"></script>
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css"/>


    <link href="../bootstrap-3.3.6-dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="../bootstrap-3.3.6-dist/js/bootstrap.min.js"></script>
   


    <style type="text/css">
        .text-search {
            height: 24px;
            font-family: "Helvetica Neue",helvetica,sans-serif;
            font-weight: normal;
            color: rgb(0, 143, 213);
            font-size: 16px;
            padding: 0px 10px;
            border-radius: 4px;
            background-color: rgb(255, 255, 255);
            box-shadow: 0px 1px 2px rgb(81, 184, 228) inset;
            border: 1px solid rgb(22, 71, 88);
        }

        .button-search {
            cursor: pointer;
            height: 24px;
            font-family: "Helvetica Neue",helvetica,sans-serif;
            font-weight: bold;
            color: white;
            font-size: 16px;
            padding: 0px 24px;
            border-radius: 4px;
            background-color: rgb(0, 143, 213);
            box-shadow: 0px 1px 2px rgb(81, 184, 228) inset;
            text-shadow: 0px 1px 1px rgb(1, 72, 117);
            border: 1px solid rgb(22, 71, 88);
        }

            .button-search:hover {
                color: yellow;
            }

        #list, #list1 {
            display: flex;
            flex-direction: row;
            margin-top: 30px;
            border-style: groove;
        }

        #list {
            margin-top: 25px;
        }
    </style>

    <script>

        function toSpecificPage(houseId) {
            location.href = "./SearchSpecific.aspx?house_Id=" + houseId;

        }

    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="myclass">
        <div class="container">

            <link href="StyleSheet.css" rel="stylesheet" />

            <br />


            <div style="height: auto; margin-top: 25px; width: 100%; cursor: pointer; background-color: #e6e6e6; filter: alpha(opacity=90); /* ie */
-moz-opacity: 0.9; /* mozilla */
opacity: 0.9; /* css3 */"
                class="row" id="list">
                <table class="nav-justified" style="align-self:center;margin-left:30%;"">
                    <tr>
                        <th colspan="2" style="font: 14px/1.65em Helvetica, Helvetica Neue, Source Sans Pro, Arial; color: #0B50D2; font-size: 34px;">Find your Home or Rental</th>
                    </tr>
                    <tr>
                        <td class="auto-style1" id="lblbox">
                            <asp:Label ID="Label1" runat="server" Text="ZIPCODE:" text-align="right" Font-Bold="True"></asp:Label>
                        </td>

                        <td>
                            <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
                            <asp:RequiredFieldValidator ControlToValidate="TextBox1" runat="server" ErrorMessage="ZipCode is a required field."
                                ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1" id="lblbed">
                            <asp:Label ID="Label2" runat="server" Text="No.of Beds" text-align="right" Font-Bold="true"></asp:Label>
                        </td>
                        <td>
                            <%-- <asp:DropDownList ID="BedDropDownList" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" DataSourceID="SqlDataSource1" DataTextField="bed" DataValueField="bed"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DataConnectionString %>" SelectCommand="SELECT DISTINCT [bed] FROM [House]"></asp:SqlDataSource>--%>
                            <asp:DropDownList CssClass="form-control" ID="BedDropDownList" AutoPostBack="True" OnSelectedIndexChanged="BedDropDownList_SelectedIndexChanged" runat="server">

                                <asp:ListItem>1</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem>3</asp:ListItem>
                                <asp:ListItem>4</asp:ListItem>
                                <asp:ListItem>5</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1" id="lblbath">
                            <asp:Label ID="Label3" runat="server" Text="No.of Bath" text-align="right" Font-Bold="true"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList CssClass="form-control" ID="BathDropDownList" AutoPostBack="true" OnSelectedIndexChanged="BathDropDownList_SelectedIndexChanged" runat="server">

                                <asp:ListItem>1</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem>3</asp:ListItem>
                                <asp:ListItem>4</asp:ListItem>
                                <asp:ListItem>11</asp:ListItem>
                            </asp:DropDownList>
                            <%-- <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DataConnectionString %>" SelectCommand="SELECT DISTINCT [bed] FROM [House]"></asp:SqlDataSource>--%>
   
                        </td>

                    </tr>
                    <tr>
                        <td class="auto-style1" id="lblPrice">
                            <asp:Label ID="Label4" runat="server" Text="MinPrice" text-align="right" Font-Bold="true"></asp:Label>
                        </td>
                        <td>
                            <%--<asp:DropDownList ID="PriceDropDownList" runat="server" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged" AutoPostBack="True" DataSourceID="SqlDataSource3" DataTextField="price" DataValueField="price" ></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:DataConnectionString %>" SelectCommand="SELECT DISTINCT [price] FROM [House]"></asp:SqlDataSource>--%>
                            <asp:DropDownList CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="MinPriceDropDownList_SelectedIndexChanged" ID="MinPriceDropDownList" runat="server">
                                <asp:ListItem>10</asp:ListItem>
                                <asp:ListItem>500</asp:ListItem>
                                <asp:ListItem>2000</asp:ListItem>
                                <asp:ListItem>5000</asp:ListItem>
                                <asp:ListItem>5000</asp:ListItem>
                                <asp:ListItem>10000</asp:ListItem>
                                <asp:ListItem>15000</asp:ListItem>
                                <asp:ListItem>25000</asp:ListItem>
                                <asp:ListItem>45000</asp:ListItem>
                                <asp:ListItem>100000</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1" id="lblPrice">
                            <asp:Label ID="Label5" runat="server" Text="MaxPrice" text-align="right" Font-Bold="true"></asp:Label>
                        </td>
                        <td>
                            <%--<asp:DropDownList ID="PriceDropDownList" runat="server" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged" AutoPostBack="True" DataSourceID="SqlDataSource3" DataTextField="price" DataValueField="price" ></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:DataConnectionString %>" SelectCommand="SELECT DISTINCT [price] FROM [House]"></asp:SqlDataSource>--%>
                            <asp:DropDownList CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="MaxPriceDropDownList_SelectedIndexChanged" ID="MaxPriceDropDownList" runat="server">
                                <asp:ListItem>500</asp:ListItem>
                                <asp:ListItem>2000</asp:ListItem>
                                <asp:ListItem>5000</asp:ListItem>
                                <asp:ListItem>10000</asp:ListItem>
                                <asp:ListItem>15000</asp:ListItem>
                                <asp:ListItem>25000</asp:ListItem>
                                <asp:ListItem>40000</asp:ListItem>
                                <asp:ListItem>45000</asp:ListItem>
                                <asp:ListItem>70000</asp:ListItem>
                                <asp:ListItem>700000</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>

                    <tr>
                        <td class="auto-style1" id="lblPropertyType">
                            <asp:Label ID="Label6" runat="server" Text="Property Type" text-align="right" Font-Bold="true"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="PropertyDropDownList" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" runat="server">
                                <asp:ListItem Value="2">Rent</asp:ListItem>
                                <asp:ListItem Value="1">Sale</asp:ListItem>

                            </asp:DropDownList>
                        </td>

                    </tr>
                    <br />

                    <tr>
                        <td class="auto-style1"></td>
                        <td>
                            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Search" CssClass="btn btn-md btn-primary" />
                            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Clear" CssClass="btn btn-md btn-primary" />
                        </td>

                    </tr>
                </table>
            </div>
            <div class="container" style="height: auto; margin-top: 25px; cursor: pointer; background-color: ghostwhite; filter: alpha(opacity=90); /* ie */
-moz-opacity: 0.9; /* mozilla */
opacity: 0.9; /* css3 */">
                <% foreach (House h in listHouses)
                   {%>
                <div  id="content">
                <div class="row" id="list1" style="margin-top: 20px; margin-bottom: 10px;" onclick="toSpecificPage(<%:h.house_id%>)">
                    <div class="col-xs-4" style="height: 200px;">
                        <img style="width: 200px; height: 200px;" src="<%: "data:Image/png;base64,"
                    + Convert.ToBase64String((byte[])h.photo_1) %>" />
                    </div>

                    <div style="height: 200px; font-size: 15px;" id="textRight">
                        <b>Address:</b>
                        <span id="address">
                            <%: h.street_1 + " , "+ h.street_2+ " , "+ h.city + " , "+ h.state+" , "+ h.zipcode %>
                        </span>
                        <br />
                        <b>No of Beds: </b>
                        <span id="bed"><%: h.bed %></span>
                        <br />
                        <b>No of Bath: </b>
                        <span id="bath"><%: h.bath %></span>
                        <br />
                        <b>Sq ft: </b>
                        <span id="sqft"><%: h.sqft %> sqft</span>
                        <br />
                        <b>Price: </b>
                        <span id="price">$<%: (long)h.price %></span><br />
                        <b>Property type: </b>
                        <span id="propertytype"><%: property_types.Where(x=>x.pid== h.property_type).FirstOrDefault().type_of_property %></span><br />
                        <b>Year built: </b>
                        <span id="yearbuilt"><%: h.year_built.Value.ToShortDateString() %></span><br />
                    </div>
                </div>
                <span></span>


                <%}%>
                    </div>

            </div>
            </div>
        </div>
        <div id="page-selection">Pagination goes here</div>
        <script>
            $('#page-selection').bootpag({
                total: 5
            }).on("page", function (event, num) {
                $(".content").html("Page " + num); // or some ajax content loading...

                // ... after content load -> change total to 10
                $(this).bootpag({ total: 10, maxVisible: 10 });

            });
        // init bootpag
        //$('#page-selection').bootpag({
        //    total: 10
        //}).on("page", function (event, /* page number here */ num) {
        //    $("#content").html("Insert content"); // some ajax content loading...
        //});
    </script>
</asp:Content>

