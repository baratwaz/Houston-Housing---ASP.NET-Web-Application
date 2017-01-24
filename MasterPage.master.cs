using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    
    protected void Page_Load(object sender, EventArgs e)
    {
        

        MembershipUser name = Membership.GetUser();
        if (name == null || !Request.IsAuthenticated)
        {
            
            menu_tab_3.Visible = false;
            menu_tab_4.Visible = false;

        } if (Request.IsAuthenticated)
        {
           
       


        if (name != null)
        {
          
            if (Roles.IsUserInRole(name.UserName, "Consumer"))
            {
                menu_tab_3.Visible = false;
                menu_tab_4.Visible = false;



            }
            if (Roles.IsUserInRole(name.UserName, "Realtor"))
            {
                menu_tab_4.Visible = false;
              


            }
            if (Roles.IsUserInRole(name.UserName, "Admin"))
            {
                menu_tab_3.Visible = false;
                //menu_tab_5.Visible = true;
                //menu_tab_4.Visible = true;


            }

        }
        }
    }

protected void Logon1_logout(object sender, EventArgs e)
{
    Session.Abandon();
}
}
