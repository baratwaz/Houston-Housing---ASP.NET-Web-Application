using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default2 : System.Web.UI.Page
{

    public  List<House> listHouses = new List<House>();
    public int value = 0;
    public List<PropertyType> property_types = new List<PropertyType>();

    protected String LabelProperty
    {
        get
        {
            return hidden.Value;
        }
        set
        {
            hidden.Value = value;
        }
    }
    protected String LabelProperty1
    {
        get
        {
            return HiddenField1.Value;
        }
        set
        {
            HiddenField1.Value = value;
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (this.hidden.Value!="" && this.hidden.Value!=null)
            {
                this.hidden.Value = "";
            }
            if (this.HiddenField1.Value != "" && this.HiddenField1.Value != null)
            {
                this.HiddenField1.Value = "";
            }
           
        }
        string cs = ConfigurationManager.ConnectionStrings["DataConnectionString"].ConnectionString;

        using (SqlConnection con = new SqlConnection(cs))
        {
            string sql = "select * from house";
            string sql1 = "select * from propertytype";
            SqlCommand command = new SqlCommand(sql.ToString(), con);
            SqlCommand command1 = new SqlCommand(sql1.ToString(), con);
            command.CommandTimeout = 3600;
            command1.CommandTimeout = 3600;

            con.Open();


            using (var rdr = command.ExecuteReader())
            {
                while (rdr.Read())
                {
                    var h = new House
                    {
                        house_id = (int)rdr.GetValue(0),
                        zipcode = (int)rdr.GetValue(1),

                        property_type = (int)rdr.GetValue(2),
                        added_by = (int)rdr.GetValue(3),
                        sqft = (int)rdr.GetValue(4),
                        bath = (int)rdr.GetValue(5),
                        bed = (int)rdr.GetValue(6),
                        street_1 = rdr.GetString(7),
                        street_2 = rdr.GetString(8),
                        price = (decimal)rdr.GetValue(9),
                        year_built = rdr.GetDateTime(10),
                        city = rdr.GetString(11),
                        state = rdr.GetString(12),
                        photo_1 = (byte[])rdr.GetValue(13),
                        photot_2 = (byte[])rdr.GetValue(14),
                        photo_3 = (byte[])rdr.GetValue(15),
                        sold = (bool)rdr.GetValue(16)

                    };
                    if (h.property_type == null)
                    {
                        h.property_type = 0;
                    }
                    listHouses.Add(h);
                }

            }
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
        if (this.hidden.Value != null && this.hidden.Value != "" && listHouses != null && listHouses.Count > 0)
        {

            var house = listHouses.Where(x => x.house_id == Convert.ToInt32(this.hidden.Value)).FirstOrDefault();
            Session["house"] = house as House;
            this.hidden.Value = null;
            Response.Redirect("ViewDetails.aspx");
        }
        if (this.HiddenField1.Value != null && this.HiddenField1.Value != "" && listHouses != null && listHouses.Count > 0)
        {

            var house = listHouses.Where(x => x.house_id == Convert.ToInt32(this.HiddenField1.Value)).FirstOrDefault();
            Session["house"] = house as House;
            this.hidden.Value = null;
            Response.Redirect("EditDetails.aspx");
        }
        Session["house_id"] = 0;
        if (Session["AddSuccessMessage"] != null && Session["AddSuccessMessage"].ToString() != "")
        {
            successMsg.Text = Session["AddSuccessMessage"].ToString();
            Session["AddSuccessMessage"] = "";
        }
        User user = new User();
       // string cs = ConfigurationManager.ConnectionStrings["DataConnectionString"].ConnectionString;
        using (SqlConnection db = new SqlConnection())
        {
            //user = (from c in db.Databas
            //        where c.user_name == "Admin"
            //        select c).FirstOrDefault();
            // Need the logged in user details from session 
        }
        //  string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
       
    }

    private DataTable GetData(SqlCommand cmd)
    {
        DataTable dt = new DataTable();
        string strConnString = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);

        SqlDataAdapter sda = new SqlDataAdapter();
        cmd.CommandType = CommandType.Text;
        cmd.Connection = con;
        try
        {
            con.Open();
            sda.SelectCommand = cmd;
            sda.Fill(dt);
            return dt;
        }
        catch
        {
            return null;
        }
        finally
        {
            con.Close();
            sda.Dispose();
            con.Dispose();
        }
    }
    private void download(DataTable dt)
    {
        Byte[] bytes = (Byte[])dt.Rows[0]["Data"];
        Response.Buffer = true;
        Response.Charset = "";
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.ContentType = dt.Rows[0]["ContentType"].ToString();
        Response.AddHeader("content-disposition", "attachment;filename="
        + dt.Rows[0]["Name"].ToString());
        Response.BinaryWrite(bytes);
        Response.Flush();
        Response.End();
    }

    protected void ViewDetails_Click(object sender, EventArgs e)
    {
        //  string id = this.ViewDetails.Parent.Parent.Parent.ID.ToString();
        // var house_id = Convert.ToInt32(Session["house_id"].ToString());
        House house = (House)listHouses.Where(x => x.house_id == value);
        Session["house"] = house;
        Response.Redirect("ViewDetails.aspx");
    }
}