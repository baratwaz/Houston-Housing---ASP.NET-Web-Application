<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <div class=" text-justify">
                    <div>
                        <asp:LoginView ID="LoginView1" runat="server" >
                            
                            <LoggedInTemplate>
                                Content for logged in user here...
    
                            </LoggedInTemplate>

                            <AnonymousTemplate>
                                <%--Content for the anonymous users here..--%>
                                <h2>Houston Housing Welcomes You</h2>
               
                            </AnonymousTemplate>

                            <RoleGroups>

                                <asp:RoleGroup Roles="Admin">

                                    <ContentTemplate>
                                         <div style="margin-top:100px;margin-left:30%;width:40%;height:60%;text-align:center;  background-color:ghostwhite; filter:alpha(opacity=90); /* IE */
                                            -moz-opacity:0.9; /* Mozilla */
                                                opacity: 0.9; /* CSS3 */">
                                        <h2>Welcome, Admin !!! </h2>
                                            <a href="Report.aspx" style="font-size:20px">Click Here to View Reports</a> 
                                        </div>
                                    </ContentTemplate>

                                </asp:RoleGroup>

                                <asp:RoleGroup Roles="Realtor">

                                    <ContentTemplate>
                                        <div style="margin-top:100px;margin-left:30%;width:40%;height:60%;text-align:center;  background-color:ghostwhite; filter:alpha(opacity=90); /* IE */
                                            -moz-opacity:0.9; /* Mozilla */
                                                opacity: 0.9; /* CSS3 */">
                                        <h2>Welcome Realtor !!! </h2>
                                            <a href="RealtorPages/RealtorHome.aspx" style="font-size:20px">Click Here to Add or Edit Home</a> 
                                        </div>
                                    </ContentTemplate>

                                </asp:RoleGroup>
                                <asp:RoleGroup Roles="Consumer">

                                    <ContentTemplate>

                                        <div style="margin-top:100px;margin-left:30%;width:40%;height:60%;text-align:center;  background-color:ghostwhite; filter:alpha(opacity=90); /* IE */
                                            -moz-opacity:0.9; /* Mozilla */
                                                opacity: 0.9; /* CSS3 */">
                                        <h2>Welcome Customer !!! </h2>
                                            <a href="Search.aspx" style="font-size:20px">Click Here to Find Your Home</a> 
                                        </div>

                                    </ContentTemplate>

                                </asp:RoleGroup>

                            </RoleGroups>

                        </asp:LoginView>

                    </div>
                </div>
           
  
</asp:Content>

