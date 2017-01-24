using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }




    protected void Login1_LoggedIn(object sender, EventArgs e)
    {
        MembershipUser name = Membership.GetUser();

        var currentUser = Login1.UserName;

        if (currentUser != null)
        {
            if(Roles.IsUserInRole(currentUser, "Admin"))
            {
                Response.Redirect("Report.aspx");

            }
            if(Roles.IsUserInRole(currentUser, "Consumer"))
            {
                Response.Redirect("Search.aspx");

            }
            if (Roles.IsUserInRole(currentUser, "Realtor"))
            {
                Response.Redirect("RealtorPages/RealtorHome.aspx");

            }
            


        }

    }
}