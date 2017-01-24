<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master"  AutoEventWireup="true" CodeFile="Report.aspx.cs" Inherits="Report" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <link href="bootstrap-3.3.6-dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/Style1.css" rel="stylesheet" />
    <link href="Content/video.css" rel="stylesheet" />
    <link href="~/bootstrap/bootstrap.min.css" rel="stylesheet" />
    <link href="~/bootstrap/bootstrap.css" rel="stylesheet" />
    <style type="text/css">
        /*.auto-style1 {
            width: 100%;
            border: 1px solid #FFFFFF;
        }*/
         .loginFormat{
      color: #0B50D2;font-family:effra,helvetica,sans-serif;font-weight: 500!important;
  }

        .auto-style2 {
            height: 20px;
        }

        .auto-style3 {
            height: 22px;
        }
    </style>

    <body>
        <%-- <form id="form1" runat="server">--%>


        <div class="container">
            <video poster="poster.png" autoplay="true" loop>
                <source src="Media/Home.mp4" type="video/mp4" />
            </video>

            <div class="text">
                <%--     
    <div class="row">
    <div class="container text-center well well-lg clearfix" style="background-color: lightblue;">
        <h1 style="font-family: 'Comic Sans MS'; font-style:italic; font-weight:bold; font-size: 40px; color: darkblue;">Welcome to the Houston Housing
            <br />Rental And Sales Services</h1>
        <h1>Find your Home or Rental in Texas: Discover the diversity of our models and let the innovative House win you over.</h1>
    </div>
    </div>--%>

                <div style="margin-top:100px;width:60%;height:55%; margin-left:20%; background-color:ghostwhite; filter:alpha(opacity=90); /* IE */
            -moz-opacity:0.9; /* Mozilla */
opacity: 0.9; /* CSS3 */">
                    <div class="flex col-md-4" style="margin-left:20%; width:60%;">

                        <ul class="nav nav-pills">
                            <li role="presentation" class="active"><a href="#">Reports</a></li>
                            <li role="presentation"><a href="AdministratorPages/DisplayChartReports.aspx">Chart Report</a></li>
                            <li role="presentation"><a href="AdministratorPages/RealtorDue.aspx">Manage Realtors</a></li>
                             
                            
                        </ul>
                        </div>
                    <div>

                        <table cellpadding="5" style="width: 1080px" >
                            <col width="50%">
                            <col width="50%">


                            <tr>
                                <td>
                                    <table  cellpadding="4">
                                        <tr align="center">
                                            <td>
                                                <asp:Label ID="Label1" runat="server" Text="Realtor Id" class="loginLabel"></asp:Label>
                                            </td>
                                            <td >
                                                <asp:TextBox ID="id" runat="server" ToolTip="Please Enter Id" TextMode="Number" CssClass="form-control" Style="margin-top:10%"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr align="center">
                                            <td class="auto-style3">
                                                <asp:Label ID="Label8" runat="server" Text="Zipcode" class="loginLabel"></asp:Label>
                                            </td>
                                            <td >
                                                <asp:TextBox ID="zipcode" runat="server" ToolTip="Please Enter Zipcode" CssClass="form-control" Style="margin-top:10%" TextMode="Number"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr align="center">
                                            <td>
                                                <asp:Label ID="Label3" runat="server" Text="Property Area" class="loginLabel"></asp:Label>
                                            </td>
                                            <td >
                                                <asp:TextBox ID="area" runat="server" TextMode="Number"  CssClass="form-control" Style="margin-top:10%" ToolTip="Please Enter Area"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <br />
                                        <tr align="center">
                                            <td class="auto-style2">
                                                <asp:Label ID="Label7" runat="server" Text="Property Type" class="loginLabel"></asp:Label>
                                            </td>
                                            <td >
                                                <asp:DropDownList ID="type" runat="server" class="dropdown" Width="100%" Height="160%">
                                                    <asp:ListItem></asp:ListItem>
                                                    <asp:ListItem>All</asp:ListItem>
                                                    <asp:ListItem Value="1">Sale</asp:ListItem>
                                                    <asp:ListItem Value="2">Rent</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td  align="center" colspan="2">
                                                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" class="btn btn-primary" Text="Generate Report" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                </tr>
                            <tr >
                                <td>

                                    <asp:GridView ID="GridView2" runat="server" CssClass="mydatagrid"  GridLines="None" ForeColor="#333333">
                                        <AlternatingRowStyle BackColor="White" />
                                        <EditRowStyle BackColor="#2461BF" />
                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                        <RowStyle BackColor="#EFF3FB" />
                                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                                    </asp:GridView>
                                    

                                    <asp:Button ID="btnBlock" class="btn btn-primary" runat="server" Text="Block" Visible="False" OnClick="btnBlock_Click" />
                                    &nbsp;&nbsp;
                        <asp:Button ID="btnEmail" class="btn btn-primary" runat="server" Text="Email Realtor" Visible="False" OnClick="btnEmail_Click" />
                                </td>

                            </tr>
                        </table>
                        <br />
                        <br />
                       
  </div>
                    </div>
      
                <div style="margin-left:10%;">
                        <asp:GridView ID="GridView1" runat="server" Width="1080px"
                            CssClass="mydatagrid" PagerStyle-CssClass="pager" HeaderStyle-CssClass="header" RowStyle-CssClass="rows"
                            AutoGenerateColumns="False" DataKeyNames="house_id" DataSourceID="SqlDataSource1" OnRowCommand="GridView1_RowCommand" AllowSorting="True">
                            <Columns>
                                <asp:TemplateField HeaderText="House" SortExpression="house_id">
                                    <%--<EditItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("house_id") %>'></asp:Label>
                        </EditItemTemplate>--%>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton2" runat="server" CommandName="house" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" Text='<%# Eval("house_id", "{0}") %>'></asp:LinkButton>
                                        <%--<asp:Button ID="Button2" runat="server" CommandName="house"  CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"  Text='<%# Eval("house_id", "{0}") %>' />--%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="zipcode" HeaderText="ZipCode" SortExpression="zipcode" />
                                <asp:BoundField DataField="property_type" HeaderText="Property Id" SortExpression="property_type" />
                                <asp:TemplateField HeaderText="Realtor Id" SortExpression="added_by">
                                    <EditItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("added_by") %>'></asp:Label>
                                        <%--<asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("added_by") %>'></asp:TextBox>--%>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CommandName="relator" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" Text='<%# Eval("added_by", "{0}") %>'></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:BoundField DataField="sqft" HeaderText="Area" SortExpression="sqft" />
                                <asp:BoundField DataField="bath" HeaderText="Bathrooms" SortExpression="bath" />
                                <asp:BoundField DataField="bed" HeaderText="Bedrooms" SortExpression="bed" />
                                <asp:BoundField DataField="street_1" HeaderText="Address1" SortExpression="street_1" />
                                <asp:BoundField DataField="street_2" HeaderText="Address2" SortExpression="street_2" />
                                <asp:BoundField DataField="price" HeaderText="Price" SortExpression="price" />
                                <asp:BoundField DataField="year_built" HeaderText="Year Built" SortExpression="year_built" />
                                <asp:BoundField DataField="city" HeaderText="City" SortExpression="city" />
                                <asp:BoundField DataField="state" HeaderText="State" SortExpression="state" />
                                <asp:CheckBoxField DataField="sold" HeaderText="Sold" SortExpression="sold" />
                            </Columns>

                            <HeaderStyle CssClass="header"></HeaderStyle>

                            <PagerStyle CssClass="pager"></PagerStyle>

                            <RowStyle CssClass="rows"></RowStyle>

                        </asp:GridView>




                        <br />
                        <br />
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DataConnectionString %>" SelectCommand="SELECT [house_id], [zipcode], [property_type], [added_by], [sqft], [bath], [bed], [street_1], [street_2], [price], [year_built], [city], [state], [sold] FROM [House]"></asp:SqlDataSource>

                        <br />
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DataConnectionString %>" SelectCommand="SELECT [house_id] FROM [House]"></asp:SqlDataSource>
                        <br />
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:DataConnectionString %>" SelectCommand="SELECT DISTINCT [added_by] FROM [House]"></asp:SqlDataSource>
                        <br />
                        <asp:SqlDataSource ID="SqlDSSpare" runat="server" ConnectionString="<%$ ConnectionStrings:DataConnectionString %>" ProviderName="<%$ ConnectionStrings:DataConnectionString.ProviderName %>"></asp:SqlDataSource>


                        <br />

                    </div>
                </div>
                <script src="bootstrap-3.3.6-dist/js/bootstrap.min.js"></script>


            </div>
      </div>

    </body>
</asp:Content>

