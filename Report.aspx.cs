using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Net.Mime;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Report : System.Web.UI.Page
{


    static decimal amountDue;
    static String realtorId;
    static String realtorEmail;
    static String realtorName;
    SqlConnection dbConnection = new SqlConnection("Data Source=mis-sql.uhcl.edu;Initial Catalog=Data;User ID=Isam_Data;Password=*project*");// new SqlConnection("Data Source=.\\SQLEXPRESS;Integrated Security=true");
    // dbConnection.ConnectionString = "Data Source=mis-sql.uhcl.edu;Initial Catalog=Data;User ID=Isam_Data;Password=*project*";





    protected void Page_Load(object sender, EventArgs e)
    {
        
        SqlDataSource2.SelectCommand = null;
        SqlDataSource2.DataBind();
    }

    //Filtering Report based on search criteria
    protected void Button1_Click(object sender, EventArgs e)
    {

        String Command = "select * from [House]";
        bool where = false;
        if (id.Text.Length > 0)
        {
            if (where == false)
            {
                Command = Command + " where";
                where = true;
            }
            else
            {
                Command = Command + " and";
            }
            Command = Command + " added_by = '" + id.Text + "'";
        }

        if (zipcode.Text.Length > 0)
        {
            if (where == false)
            {
                Command = Command + " where";
                where = true;
            }
            else
            {
                Command = Command + " and";
            }
            Command = Command + " zipcode = '" + zipcode.Text + "'";
        }

        if (area.Text.Length > 0)
        {
            if (where == false)
            {
                Command = Command + " where";
                where = true;
            }
            else
            {
                Command = Command + " and";
            }
            Command = Command + " sqft = '" + area.Text + "'";
        }


        if (type.SelectedValue.Length > 0)
        {
            if (type.SelectedItem.Text != "All")
            {
                if (where == false)
                {
                    Command = Command + " where";
                    where = true;
                }
                else
                {
                    Command = Command + " and";
                }
                Command = Command + " property_type = '" + type.SelectedItem.Value + "'";
            }
        }




        SqlDataSource1.SelectCommand = Command;
        SqlDataSource1.DataBind();



    }







    //Displaying gridview2 based on gridview1 selected item
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {

        if (e.CommandName == "house")
        {
            int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = GridView1.Rows[index];
            LinkButton name = (LinkButton)GridView1.Rows[index].Cells[0].FindControl("LinkButton2");



            String Command = "select house_id as House, street_1, street_2, zipcode as Zipcode, Photo_1, Photot_2, Photo_3 from [House] where house_id = '" + name.Text + "' ";
            SqlDataSource2.SelectCommand = Command;

            //SqlDataSource2.DataBind();
            GridView2.DataSource = SqlDataSource2;
            GridView2.DataBind();
            btnBlock.Visible = false;
            btnEmail.Visible = false;



        }
        else if (e.CommandName == "relator")
        {
            int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = GridView1.Rows[index];

            LinkButton name = (LinkButton)GridView1.Rows[index].Cells[0].FindControl("LinkButton1");

            String Command = "select user_name as Name, password as Password, mobile_no as Mobile, email as Email, amount_due as 'Amount Due' from [User] where user_id = '" + name.Text + "' ";
            SqlDataSource2.SelectCommand = Command;

            DataView dview = (DataView)(SqlDataSource2.Select(DataSourceSelectArguments.Empty));
            amountDue = (decimal)dview.Table.Rows[0][4];
            realtorEmail = dview.Table.Rows[0][3].ToString();
            realtorName = dview.Table.Rows[0][0].ToString();
            realtorId = name.Text;
            try
            {
                dbConnection.Open();
                SqlCommand checkData = new SqlCommand("select * from Block where Id = '" + realtorId + "'", dbConnection);
                SqlDataReader myReader = checkData.ExecuteReader();
                if (myReader.Read())
                {
                    btnBlock.Text = "Unblock";
                    btnEmail.Text = "Send Block Notification";
                    btnEmail.Visible = true;
                    btnBlock.Visible = true;
                }
                else if (amountDue == 0)
                {
                    btnBlock.Visible = false;
                    btnEmail.Visible = false;

                }
                else
                {
                    btnBlock.Text = "Block";
                    btnEmail.Text = "Send Warning Email";
                    btnBlock.Visible = true;
                    btnEmail.Visible = true;

                }

                GridView2.DataSource = SqlDataSource2;
                GridView2.DataBind();
            }
            catch (SqlException exception)
            {
                //Response.Write("<p>Error code " + exception.Number + ": " + exception.Message + "</p>");
            }
            finally
            {
                dbConnection.Close();
            }

        }
    }


    //blocking and UBlocking user
    protected void btnBlock_Click(object sender, EventArgs e)
    {



        try
        {
            dbConnection.Open();

            if (btnBlock.Text.Equals("Block"))
            {
                SqlCommand myCommand = new SqlCommand("INSERT INTO Block VALUES ('" + realtorId.ToString() + "','Block')", dbConnection);

                myCommand.ExecuteNonQuery();

                btnBlock.Text = "Unblock";
                btnEmail.Text = "Send Block Notification";
            }
            else if (btnBlock.Text.Equals("Unblock"))
            {
                SqlCommand myCommand = new SqlCommand("DELETE FROM Block WHERE Id='" + realtorId.ToString() + "'", dbConnection);

                myCommand.ExecuteNonQuery();

                btnBlock.Text = "Block";
                btnEmail.Text = "Send Warning Email";
            }


        }
        catch (SqlException exception)
        {
            //Response.Write("<p>Error code " + exception.Number + ": " + exception.Message + "</p>");
        }
        finally
        {
            dbConnection.Close();
        }




    }


    //Sending an email to realtor
    protected void btnEmail_Click(object sender, EventArgs e)
    {
        DateTime today = DateTime.Now;
        MailMessage mail = new MailMessage();
       mail.From = new MailAddress("uhcl5678@gmail.com", "Houston Housing");
        mail.To.Add(realtorEmail);
        
       // mail.To.Add("uhcl5678@gmail.com");
        mail.IsBodyHtml = true;
        mail.Priority = MailPriority.High;
        SmtpClient smtp = new SmtpClient();
        smtp.Host = "smtp.gmail.com";
        smtp.Port = 587;
        smtp.EnableSsl = true;
      smtp.Credentials = new System.Net.NetworkCredential("uhcl5678@gmail.com", "$ultan1234");
        mail.Attachments.Add(new Attachment(Server.MapPath("~") + "Images/Logo1.png"));
       smtp.DeliveryMethod = SmtpDeliveryMethod.Network;


        

        if (btnEmail.Text.Equals("Send Block Notification"))
        {//notify realtor that you have blocked them

            mail.Subject = "Your Account has been temporarily suspended";

            string body = string.Empty;
            using (StreamReader reader = new StreamReader(Server.MapPath("~") + "\\AdministratorPages\\BlockEmail.html"))
            {
                body = reader.ReadToEnd();
            }

            body = body.Replace("{UserName}", realtorName);
            body = body.Replace("{date}", today.Date.ToString("dd MMM yyyy"));
            body = body.Replace("{amountdue}", amountDue.ToString());
            body = body.Replace("{deadline}", today.AddDays(14).Date.ToString("dd MMM yyyy"));
            body = body.Replace("{home}", HttpContext.Current.Request.Url.GetLeftPart(UriPartial.Authority) + "/Default.aspx");
            body = body.Replace("{image}", "Logo1.png");

            AlternateView alternate = AlternateView.CreateAlternateViewFromString(body, null, MediaTypeNames.Text.Html);
            LinkedResource image1 = new LinkedResource(Server.MapPath("") + "\\Images\\Logo1.png", MediaTypeNames.Image.Jpeg);
            image1.ContentId = "\\Images\\Logo1.png";
            alternate.LinkedResources.Add(image1);
            mail.AlternateViews.Add(alternate);
           



            mail.Body = body;


        }
        else if (btnEmail.Text.Equals("Send Warning Email"))
        {//Warn realtor regarding blocking them
            mail.Subject = "About to block your account";


            string body = string.Empty;
            using (StreamReader reader = new StreamReader(Server.MapPath("~") + "WarningEmail.html"))
            {
                body = reader.ReadToEnd();
            }

            body = body.Replace("{UserName}", realtorName);
            body = body.Replace("{date}", today.Date.ToString("dd MMM yyyy"));
            body = body.Replace("{amountdue}", amountDue.ToString());
            body = body.Replace("{deadline}", today.AddDays(14).Date.ToString("dd MMM yyyy"));
            body = body.Replace("{home}", HttpContext.Current.Request.Url.GetLeftPart(UriPartial.Authority)+"/Default.aspx");
            body = body.Replace("{image}", "Logo1.png");

            AlternateView alternate = AlternateView.CreateAlternateViewFromString(body, null, MediaTypeNames.Text.Html);
            LinkedResource image1 = new LinkedResource(Server.MapPath("") + "\\Images\\Logo1.png", MediaTypeNames.Image.Jpeg);
            image1.ContentId = "\\Images\\Logo1.png";
            alternate.LinkedResources.Add(image1);
            mail.AlternateViews.Add(alternate);
            
          



            mail.Body = body;






        }

     

        smtp.Send(mail);
      //  System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Email has been send to the retailer');", true);



        smtp.Dispose();
        mail.Dispose();

    }





  
}