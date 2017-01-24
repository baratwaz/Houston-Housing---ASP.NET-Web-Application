using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default2 : System.Web.UI.Page
{
    private static int houseid = 0;
    List<PropertyType> property_types = new List<PropertyType>();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["house"] != null)
            {
                string cs = ConfigurationManager.ConnectionStrings["DataConnectionString"].ConnectionString;

                using (SqlConnection con = new SqlConnection(cs))
                {
                    string sql1 = "select * from propertytype";
                    SqlCommand command1 = new SqlCommand(sql1.ToString(), con);
                    command1.CommandTimeout = 3600;

                    con.Open();

                    using (var rdr = command1.ExecuteReader())
                    {
                        while (rdr.Read())
                        {
                            var p = new PropertyType
                            {
                                pid = (int)rdr.GetValue(0),
                                type_of_property = rdr.GetString(1)
                            };
                            property_types.Add(p);
                        }

                    }
                }
                List<string> l = new List<string>();
                foreach (var item in property_types)
                {
                    l.Add(item.type_of_property);
                }
                txtPropertyType.DataSource = l;
                txtPropertyType.DataBind();

                House h = (House)Session["house"];
                houseid = h.house_id;
                this.txtPrice.Text = h.price.ToString();
               
               
                this.txtSqFt.Text = h.sqft.ToString();
                this.txtYearBuilt.Text = h.year_built.ToString();
                this.noOfBath.Text = h.bath.ToString();
                this.noOfBeds.Text = h.bed.ToString();
                this.addStreet1.Text = h.street_1.ToString();
                this.addStreet2.Text = h.street_2.ToString();
                this.addCity.Text = h.city.ToString();
                this.addState.Text = h.state.ToString();
                this.addZipCode.Text = h.zipcode.ToString();
                //this.picture.ResolveUrl = "data:Image/png;base64," + Convert.ToBase64String((byte[])h.photo_1);
                //this.picture1.ImageUrl = "data:Image/png;base64," + Convert.ToBase64String((byte[])h.photot_2);
                //this.picture2.ImageUrl = "data:Image/png;base64," + Convert.ToBase64String((byte[])h.photo_3);
            }
        }
    }
    protected void editHome_Click(object sender, EventArgs e)
    {
        List<PropertyType> property_types = new List<PropertyType>();
        string cs = ConfigurationManager.ConnectionStrings["DataConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(cs))
        {
            string sql1 = "select * from propertytype";
            SqlCommand command1 = new SqlCommand(sql1.ToString(), con);
            command1.CommandTimeout = 3600;

            con.Open();

            using (var rdr = command1.ExecuteReader())
            {
                while (rdr.Read())
                {
                    var p = new PropertyType
                    {
                        pid = (int)rdr.GetValue(0),
                        type_of_property = rdr.GetString(1)
                    };
                    property_types.Add(p);
                }

            }

            //int property;
            //int.TryParse(this.txtPropertyType.Text.ToString(),out property);
            //PropertyType propertyType = (from c in db.PropertyTypes
            //                             where c.pid == property
            //        select c).FirstOrDefault();

            //  h.PropertyType = propertyType;

            //User user = (from c in db.Users
            //                             where c.user_name == "Admin"
            //                             select c).FirstOrDefault();

            //HttpPostedFile postedFile = picture.PostedFile;
            //HttpPostedFile postedFile1 = picture1.PostedFile;
            //HttpPostedFile postedFile2 = picture2.PostedFile;
            //string fileName = Path.GetFileName(postedFile.FileName);
            //string fileName1 = Path.GetFileName(postedFile1.FileName);
            //string fileName2 = Path.GetFileName(postedFile2.FileName);
            //string fileExtension = Path.GetExtension(fileName);
            //int fileSize = postedFile.ContentLength;
            //int fileSize1 = postedFile1.ContentLength;
            //int fileSize2 = postedFile2.ContentLength;

            ////if (fileExtension.ToLower() == ".jpg" || fileExtension.ToLower() == ".bmp" || fileExtension.ToLower() == ".gif" || fileExtension.ToLower() == ".png")
            ////{
            //// Read the file and convert it to Byte Array
            //string filename = fileName;//Path.GetFileName(filePath);
            //string filename1 = fileName1;
            //string filename2 = fileName2;
            //Stream f = postedFile.InputStream;
            //Stream f1 = postedFile1.InputStream;
            //Stream f2 = postedFile2.InputStream;
            //BinaryReader br = new BinaryReader(f);
            //BinaryReader br1 = new BinaryReader(f1);
            //BinaryReader br2 = new BinaryReader(f2);
            //Byte[] bytes = br.ReadBytes((Int32)f.Length);
            //Byte[] bytes1 = br1.ReadBytes((Int32)f1.Length);
            //Byte[] bytes2 = br2.ReadBytes((Int32)f2.Length);
            //if (bytes.Length == 0)
            //{
            //    string sql2 = "select * from house where house_id=@houseid_pic1";
            //    SqlCommand command2 = new  SqlCommand(sql2.ToString(), con);
            //    command2.Parameters.Add("@houseid_pic1", SqlDbType.Int).Value = houseid;

            //    command2.CommandTimeout = 3600;

            //    con.Open();

            //    using (var rdr = command1.ExecuteReader())
            //    {
            //         bytes = (byte[])rdr.GetValue(13);
            //    }
            //    con.Close();
            //}
            //if (bytes1.Length == 0)
            //{
            //    string sql2 = "select * from house where house_id=@houseid_pic1";
            //    SqlCommand command2 = new SqlCommand(sql2.ToString(), con);
            //    command2.Parameters.Add("@houseid_pic1", SqlDbType.Int).Value = houseid;

            //    command2.CommandTimeout = 3600;

            //    con.Open();

            //    using (var rdr = command1.ExecuteReader())
            //    {
            //        bytes1 = (byte[])rdr.GetValue(14);
            //    }
            //    con.Close();
            //}
            //if (bytes2.Length == 0)
            //{
            //    string sql2 = "select * from house where house_id=@houseid_pic1";
            //    SqlCommand command2 = new SqlCommand(sql2.ToString(), con);
            //    command2.Parameters.Add("@houseid_pic1", SqlDbType.Int).Value = houseid;

            //    command2.CommandTimeout = 3600;

            //    con.Open();

            //    using (var rdr = command1.ExecuteReader())
            //    {
            //        bytes2 = (byte[])rdr.GetValue(15);
            //    }
            //    con.Close();
            //}
            //br.Close();
            //br1.Close();
            //br2.Close();
            //f.Close();
            //f1.Close();
            //f2.Close();


            //insert the file into database
            string strQuery = "update house set zipcode = @zipcode,property_type = @property_type,added_by=@added_by,sqft=@sqft,bath=@bath,bed=@bed,street_1=@street_1,street_2=@street_2,price=@price,year_built=@year_built,city=@city,state=@state,sold=@sold where house_id =@houseid";
            SqlCommand cmd = new SqlCommand(strQuery);
            cmd.Parameters.Add("@houseid", SqlDbType.Int).Value = houseid;
            cmd.Parameters.Add("@zipcode", SqlDbType.Int).Value = Convert.ToInt32(this.addZipCode.Text);
            if (txtPropertyType.SelectedValue.ToLower() == "sale")
            {
                cmd.Parameters.Add("@property_type", SqlDbType.Int).Value = 1;
            }
            else if (txtPropertyType.SelectedValue.ToLower() == "rent")
            {
                cmd.Parameters.Add("@property_type", SqlDbType.Int).Value = 2;
            }
            else
            {
                cmd.Parameters.Add("@property_type", SqlDbType.Int).Value = 0;
            }
            cmd.Parameters.Add("@added_by", SqlDbType.Int).Value = "1"; // hard coded need to be replaced by logged in user from session
            cmd.Parameters.Add("@sqft", SqlDbType.Int).Value = Convert.ToInt32(this.txtSqFt.Text);
            cmd.Parameters.Add("@bath", SqlDbType.Int).Value = Convert.ToInt32(this.noOfBath.Text);
            cmd.Parameters.Add("@bed", SqlDbType.Int).Value = Convert.ToInt32(this.noOfBeds.Text);
            cmd.Parameters.Add("@street_1", SqlDbType.VarChar).Value = this.addStreet1.Text.ToString();
            cmd.Parameters.Add("@street_2", SqlDbType.VarChar).Value = this.addStreet2.Text.ToString();
            cmd.Parameters.Add("@price", SqlDbType.Decimal).Value = Convert.ToDecimal(this.txtPrice.Text);
            cmd.Parameters.Add("@year_built", SqlDbType.DateTime).Value = Convert.ToDateTime(this.txtYearBuilt.Text);
            cmd.Parameters.Add("@city", SqlDbType.VarChar).Value = this.addCity.Text.ToString();
            cmd.Parameters.Add("@state", SqlDbType.VarChar).Value = this.addState.Text.ToString();
            //cmd.Parameters.Add("@Data", SqlDbType.Binary).Value = bytes;
            //cmd.Parameters.Add("@Data1", SqlDbType.Binary).Value = bytes1;
            //cmd.Parameters.Add("@Data2", SqlDbType.Binary).Value = bytes2;
            if (this.sold.Checked ==true)
            {
                cmd.Parameters.Add("@sold", SqlDbType.Bit).Value = true;
            }
            else
            {
                cmd.Parameters.Add("@sold", SqlDbType.Bit).Value = false;
            }
            
            //string strConnString = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            //SqlConnection con = new SqlConnection(strConnString);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = con;
            try
            {
                // con.Open();
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
            finally
            {
                con.Close();
                con.Dispose();
            }
            // }
            Session["AddSuccessMessage"] = "Home Edited Successfully";
            Response.Redirect("RealtorHome.aspx");
        }
    }
}