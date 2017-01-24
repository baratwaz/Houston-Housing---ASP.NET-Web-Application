<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" Theme="Default" %>



     <asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<link href="~/Content/Site.css" rel="stylesheet" type="text/css" />
     <link href="bootstrap/css/bootstrap.css" rel="stylesheet" />
    <link href="bootstrap/css/bootstrap-theme.min.css" rel="stylesheet" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="bootstrap/js/bootstrap.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>


<div style="margin-top:100px;margin-left:20%;width:40%;  background-color:ghostwhite; filter:alpha(opacity=90); /* IE */
-moz-opacity:0.9; /* Mozilla */
opacity: 0.9; /* CSS3 */">
        <asp:CreateUserWizard ID="CreateUserWizard1" runat="server" ContinueDestinationPageUrl="~/Login.aspx" >
            <WizardSteps>
                <asp:CreateUserWizardStep ID="CreateUserWizardStep1" runat="server">
                    <ContentTemplate>
                        <div style="align-self:center;margin-left:85px;">
                        <table cellpadding="1" cellspacing="0" >
                            <tr>
                                <td align="center" colspan="2"  style="font-family:effra,helvetica,sans-serif;font-weight: 500!important; margin-top:10px;color: #0B50D2; font-size:24px;">Sign Up for Your New Account</td>
                            </tr>
                           
                            <tr>
                                <td align="right">
                                    <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName" class="loginLabel">User Name:</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="UserName" runat="server" CssClass="form-control" Style="margin-top:10%"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password" class="loginLabel">Password:</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="Password" runat="server" TextMode="Password" CssClass="form-control" Style="margin-top:10%"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="ConfirmPasswordLabel" runat="server" AssociatedControlID="ConfirmPassword" class="loginLabel">Confirm Password:</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password" CssClass="form-control" Style="margin-top:10%"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" ControlToValidate="ConfirmPassword" ErrorMessage="Confirm Password is required." ToolTip="Confirm Password is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="Email" class="loginLabel">E-mail:</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="Email" runat="server" CssClass="form-control" Style="margin-top:10%"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="Email" ErrorMessage="E-mail is required." ToolTip="E-mail is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="QuestionLabel" runat="server" AssociatedControlID="Question" class="loginLabel">Security Question:</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="Question" runat="server" CssClass="form-control" Style="margin-top:10%"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="QuestionRequired" runat="server" ControlToValidate="Question" ErrorMessage="Security question is required." ToolTip="Security question is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="AnswerLabel" runat="server" AssociatedControlID="Answer" class="loginLabel">Security Answer:</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="Answer" runat="server" CssClass="form-control" Style="margin-top:10%"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="AnswerRequired" runat="server" ControlToValidate="Answer" ErrorMessage="Security answer is required." ToolTip="Security answer is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" colspan="2">
                                    <asp:CompareValidator ID="PasswordCompare" runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword" Display="Dynamic" ErrorMessage="The Password and Confirmation Password must match." ValidationGroup="CreateUserWizard1"></asp:CompareValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" colspan="2" style="color:Red;">
                                    <asp:Literal ID="ErrorMessage" runat="server" EnableViewState="False"></asp:Literal>
                                </td>
                            </tr>
                        </table>
                            </div>
                    </ContentTemplate>
                    <CustomNavigationTemplate>
                        <table border="0" cellspacing="2" style="width:100%;height:100%;">
                            <tr align="right">
                                <td align="center">
                                    <asp:Button ID="StepNextButton" runat="server" CommandName="MoveNext" CssClass="btn btn-primary" Text="Create User" ValidationGroup="CreateUserWizard1"  />
                                </td>
                            </tr>
                        </table>
                    </CustomNavigationTemplate>
                </asp:CreateUserWizardStep>
                <asp:CompleteWizardStep ID="CompleteWizardStep1" runat="server">
                    <ContentTemplate>
                        <table>
                            <tr>
                                <td align="center" style="font-family: Arial Black, Gadget, sans-serif; margin-top:10px; font-size:24px;">Complete</td>
                            </tr>
                            <tr>
                                <td style="font-family: Arial Black, Gadget, sans-serif; margin-top:10px; font-size:24px;" >Your account has been successfully created.</td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Button ID="ContinueButton" runat="server" CausesValidation="False" CommandName="Continue" Text="Continue" ValidationGroup="CreateUserWizard1" CssClass="btn btn-primary" />
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </asp:CompleteWizardStep>
            </WizardSteps>
        </asp:CreateUserWizard>
    </div>
    </asp:Content>

