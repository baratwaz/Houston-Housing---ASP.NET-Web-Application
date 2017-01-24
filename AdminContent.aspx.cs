using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Entity;

public partial class Admin_AdminContent : System.Web.UI.Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            BindUsersToUserList();
            BindRolesToList(); 
          
          
        }
    }

   
    protected void Button1_Click(object sender, EventArgs e)
    {
        string user = DropDownList1.SelectedValue;
        CheckBox RoleCheckBox = sender as CheckBox;

            // Get the currently selected user and role 
            string selectedUserName = DropDownList1.SelectedValue;

            string roleName = CheckBoxList1.Text;

            // Determine if we need to add or remove the user from this role 

            // Add the user to the role 
           // CheckRolesForSelectedUser();
            try
            {

                Roles.AddUserToRole(selectedUserName, roleName);
                Response.Write("User has been added");

            }

        catch(Exception ex)
            {
                Response.Write("User already has this role");
            }
            finally
            {
                
            }
                
    }
    private void BindUsersToUserList()
    {
        // Get all of the user accounts 
        MembershipUserCollection users = Membership.GetAllUsers();
        DropDownList1.DataSource = users;
        DropDownList1.DataBind();
    }

    private void BindRolesToList()
    {
        // Get all of the roles 

        string[] roles = Roles.GetAllRoles();
        
        DropDownList1.DataBind();
    }
    
    protected void CheckBoxList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        //
        CheckBox RoleCheckBox = sender as CheckBox;

        // Get the currently selected user and role 
        string selectedUserName = DropDownList1.SelectedValue;

        string roleName = RoleCheckBox.Text;

        // Determine if we need to add or remove the user from this role 
        if (RoleCheckBox.Checked)
        {
            // Add the user to the role 
            Roles.AddUserToRole(selectedUserName, roleName);
           }
        else
        {
              Roles.RemoveUserFromRole(selectedUserName, roleName);
           
        }
    }

  
    protected void CheckBox2_CheckedChanged(object sender, EventArgs e)
    {

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        string user = DropDownList2.SelectedValue;
        CheckBox RoleCheckBox = sender as CheckBox;

        // Get the currently selected user and role 
        string selectedUserName = DropDownList2.SelectedValue;

        string roleName = CheckBoxList2.Text;

       
        try
        {

            Roles.RemoveUserFromRole(selectedUserName, roleName);
            Response.Write("User has been Removed");

        }

        catch (Exception ex)
        {
            Response.Write("User is not present in this role");
        }
        finally
        {

        }
    }
}