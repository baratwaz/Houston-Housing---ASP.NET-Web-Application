<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" Theme="Default" %>



    <asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    </asp:Content>

    <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <link href="bootstrap/css/bootstrap.css" rel="stylesheet" />
    <link href="bootstrap/css/bootstrap-theme.min.css" rel="stylesheet" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="bootstrap/js/bootstrap.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    
    <style>
  .carousel-inner > .item > img,
  .carousel-inner > .item > a > img {
      width: 50%;
      margin: auto;
  }

  .loginFormat{
      color: #0B50D2;font-family:effra,helvetica,sans-serif;font-weight: 500!important;
  }

  </style>

   <%-- <script>
        $('.carousel').carousel({
            interval: 1000
        })
    </script>
<div class="container-fluid"  >

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

      <%--<div class="item active">
        <img src="Images/imageCorousal_2.jpg" alt="" style="width:40%"/>
        <div class="carousel-caption">
                 <%--<h3 >Best Website</h3>--%>
                 <%--<p>One Stop Place to buy or sell houses</p>--%>
      <%--  </div>
      </div>--%>--%>

     <%-- <div class="item">
        <img src="Images/imageCorousal_1.jpg" alt="" style="width:40%; height:15%;"/>
        <div class="carousel-caption">
          <h3>Quick and Verified</h3>
          <p>100% Satisfaction Garenteed</p>
        </div>
      </div>
    
      <div class="item">
        <img src="Images/imageCorousal_3.jpg" alt="" style="width:40%; height:15%;"/>
        <div class="carousel-caption">
          <h3>Dream</h3>
          <p>Your dream house</p>
        </div>
      </div>

      <div class="item">
        <img src="Images/imageCorousal_4.jpg" alt="" style="width:40%; height:15%;"/>
        <div class="carousel-caption">
          <h3>Best prices</h3>
          <p>All the houses available at best prices</p>
        </div>
      </div>--%>
        <%--<div class="item active">
        <img src="Images/imageCorousal_2.jpg" alt="" style="width:100%; height:350px;"/>
        <div class="carousel-caption">
          <span style="font-size:30px; color:darkorange; font-family:Calibri">Best Website</span>
          <p style="color:peru; font-size:20px">.One Stop Place to buy or sell houses</p>
        </div>
      </div>

      <div class="item">
        <img src="Images/imageCorousal_1.jpg" alt="" style="width:100%; height:350px;"/>
        <div class="carousel-caption">
          <span style="font-size:30px; color:darkorange; font-family:Calibri">Quick and Verified</span>
          <p style="color:peru; font-size:20px">100% Satisfaction Garenteed</p>
        </div>
      </div>
    
      <div class="item">
        <img src="Images/imageCorousal_3.jpg" alt="" style="width:100%; height:350px;"/>
        <div class="carousel-caption">
          <span style="font-size:30px; color:darkorange; font-family:Calibri">Dream</span>
          <p style="color:peru; font-size:20px">Your dream house</p>
        </div>
      </div>

      <div class="item">
        <img src="Images/imageCorousal_4.jpg" alt="" style="width:100%; height:350px;"/>
        <div class="carousel-caption">
          <span style="font-size:30px; color:darkorange; font-family:Calibri">Best prices</span>
          <p style="color:peru; font-size:20px">All the houses available at best prices</p>
        </div>
       </div>
  
    </div>
</div>
    </div>--%>
     --%> 
       <div style="margin-top:100px;margin-left:30%;width:40%;height:60%;  background-color:ghostwhite; filter:alpha(opacity=90); /* IE */
-moz-opacity:0.9; /* Mozilla */
opacity: 0.9; /* CSS3 */" >
      
      <div style="align-self:center;margin-left:85px;">
     <asp:Login ID="Login1" runat="server" CreateUserUrl="~/Login/Register.aspx" CreateUserText="Create Account" SkinID="lblText" OnLoggedIn="Login1_LoggedIn" >
            <LayoutTemplate>
                <table cellpadding="1" cellspacing="0" style="border-collapse:collapse;">
                    <tr>
                        <td>
                            <table cellpadding="0">
                                <tr>
                                    <td align="center" colspan="2" style="font-family:effra,helvetica,sans-serif;font-weight: 500!important; margin-top:10px;color: #0B50D2; font-size:24px;">Log In</td>
                                </tr>

                                <tr>
                                    <td >
                                          <asp:label id="UserNameLabel" runat="server" CssClass="control-label" >User Name: </asp:label>
                                    </td>
                                    <td> 
                                          <asp:TextBox ID="UserName" runat="server" CssClass="form-control" Style="margin-top:10%"></asp:TextBox>
                                          <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                            
                                     </td>
                                 </tr>

                                <tr>
                                    <td >
                                        <asp:Label ID="PasswordLabel" runat="server"  CssClass="control-label" style="color: #0B50D2;font-family:effra,helvetica,sans-serif;font-weight: 500!important;">Password:</asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="Password" runat="server" CssClass="form-control" Style="margin-top:10%" TextMode="Password"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <br />
                                <tr>
                                    <td colspan="2">
                                        <asp:CheckBox ID="RememberMe" runat="server" Text="Remember me next time." style="color: #0B50D2;font-family:effra,helvetica,sans-serif;font-weight: 500!important;" CssClass="Checkbox"  />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2" style="color:Red;">
                                        <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2"">
                                        <asp:Button ID="LoginButton" runat="server" class="btn btn-primary" CommandName="Login" Text="Log In" ValidationGroup="Login1" />
                                        <a href="../Login/Register.aspx" class="btn btn-primary">SignUp</a>
                                        <%--<asp:Button ID="Button1" runat="server" class="btn btn-primary" Text="SignUp" OnClick="location.href='../Login/Register.aspx'" />--%>
                                         </td>
                                </tr>
                               
                            </table>
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
        </asp:Login>
      
        <%--<asp:Login ID="Login1" runat="server" CreateUserUrl="~/Login/Register.aspx" CreateUserText="Create Account" Height="163px" Width="305px" OnLoggedIn="Login1_LoggedIn"></asp:Login>--%>
     </div> 
    </div>


    <!-- Left and right controls -->
   
  </div>
</div>
   <%-- style="margin-top:70px;margin-left:35%;width:25%;height:250px;  background-color:ghostwhite; filter:alpha(opacity=90); /* IE */
-moz-opacity:0.9; /* Mozilla */
opacity: 0.9; /* CSS3 */" --%>
   
    </asp:Content>

