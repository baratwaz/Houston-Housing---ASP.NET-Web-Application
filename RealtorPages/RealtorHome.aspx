<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="RealtorHome.aspx.cs" Inherits="Default2" %>
<%--<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RealtorContent.aspx.cs" Inherits="Realtor_RealtorContent" %>--%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title></title>
    <%--    <link href="../StyleSheet.css" rel="stylesheet" />--%><link href="../Content/StyleSheet.css" rel="stylesheet" />
    <link href="../bootstrap-3.3.6-dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="../bootstrap-3.3.6-dist/js/bootstrap.min.js"></script>
    <script src="../lib/jquery-1.10.1.min.js"></script>
    <script src="../lib/jquery-1.9.0.min.js"></script>
    <script src="../Content/ViewDetails.js"></script>
    <script type="text/javascript">
        function onClick(id) {
            var value = id.substr(12, 13);
            document.getElementById('<%=hidden.ClientID %>').value = value;
            window.location.reload(true);

        }
        function onClickEdit(id) {
            var value = id.substr(9, 10);
            document.getElementById('<%=hidden.ClientID %>').value = "";
            document.getElementById('<%=HiddenField1.ClientID %>').value = value;
            window.location.reload(true);
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="myclass">
        <div class="container">
            
                <h2 style="color: #0B50D2; background-color:ghostwhite; padding-top:2%; opacity:0.8">Welcome our valued partners</h2>
            
            <div class="row">
                <nav class="navbar navbar-default">
                    <div class="container-fluid">
                        <ul class="nav navbar-nav" id="menu">
                            <li><a href="RealtorHome.aspx">Home</a></li>
                            <li><a href="RealtorAddHome.aspx">Add Home</a></li>
                            <%--<li><a href="RealtorEditHome.aspx">Edit Home</a></li>--%>
                        </ul>
                    </div>
                </nav>
            </div>
            <asp:Label ID="successMsg" class="green success" runat="server" Text=""></asp:Label>
            <input id="Hidden1" type="hidden" runat="server" />
            <asp:HiddenField ID="hidden" runat="server" />
            <asp:HiddenField ID="HiddenField1" runat="server" />
        </div>
        <asp:Label runat="server" ID="temp"></asp:Label>
        <div class="container-fluid" style="width: 75%; height: auto; margin-left: 10%; cursor: pointer; background-color: ghostwhite; filter: alpha(opacity=90); /* ie */
-moz-opacity: 0.9; /* mozilla */
opacity: 0.9; /* css3 */">
            <% foreach (House h in listHouses)
               {%>
            <div style="display: flex">
                <div class="row" id="<%: h.house_id %>" style="width: 1000px; height: 200px; display: flex; flex-direction: row; margin-left: 100px; margin-top: 30px; border-style: groove;">
                    <div id="imageLeft" style="width: 200px; height: 200px;">
                        <img style="display: inline-block; width: 200px; height: 193px;" src="<%: "data:Image/png;base64,"
                    + Convert.ToBase64String((byte[])h.photo_1) %>" />
                    </div>

                    <div id="textRight" style="width: 800px; height: 200px; font-size: 15px;">
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

                        <%--  <% if(h.property_type==1 && h.sold!=false) { %>
                    <span style="margin-left:20px;color:green"> For Sale </span>
                <% } %>
                 <% if(h.property_type==2 && h.sold!=false) { %>
                    <span style="margin-left:20px;color:green;"> For Rent </span>
                <% } %>--%>

                        <br />
                        <b>Sq ft: </b>
                        <span id="sqft"><%: h.sqft %> sqft</span>
                        <br />
                        <b>Price: </b>
                        <span id="price">$<%: (long)h.price %></span><br />
                        <b>Property type: </b>
                        <span id="propertytype"><%: property_types.Where(x=>x.pid== h.property_type).FirstOrDefault().type_of_property %></span><br />
                        <b>Year built: </b>
                        <span id="yearbuilt"><%: h.year_built.Value.ToShortDateString() %></span>
                        <br />

                        <span style="font-size: 17px;"><%--<asp:Button runat="server" Text="View Details" CssClass="btn-success" ID="ViewDetails" OnClick="ViewDetails_Click" />--%>
                            <button style="margin-top: 7px;" id="viewdetails+<%:h.house_id %>" onclick="onClick(this.id);">View Details </button>
                            <button style="margin-top: 7px; margin-left: 20px;" id="edithome+<%:h.house_id %>" onclick="onClickEdit(this.id);">Edit Details </button>
                        </span>
                    </div>
                </div>
                <div style="width: 135px; margin-left: 330px;">
                    <% if (h.sold == true)
                       { %>
                    <div style="width: 135px; margin-left: -511px;margin-top: 99px;">
                        <div style="float: left; width: 20px; height: 20px; -webkit-border-radius: 25px; -moz-border-radius: 25px; border-radius: 25px; background: red; display: inline-flex"></div>
                        <div style="float: right; margin-left: 10px; color: red; font-size: 17px">Property Sold </div>
                    </div>
                    <% } %>
                </div>
            </div>

            <%}%>
        </div>
    </div>
</asp:Content>

