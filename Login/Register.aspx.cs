using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    
    protected void CreateUserWizard1_CreatedUser1(object sender, EventArgs e)
    {
        CreateUserWizard cuw = (CreateUserWizard)sender;

        string RoleToJoin = "Consumer";

        if (!Roles.IsUserInRole(cuw.UserName, RoleToJoin))
        {
            Roles.AddUserToRole(cuw.UserName, RoleToJoin);
        }

    }
}