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

    public List<House> listHouses = new List<House>();
    public List<PropertyType> property_types = new List<PropertyType>();
    protected void Page_Load(object sender, EventArgs e)
    {
        string cs = ConfigurationManager.ConnectionStrings["DataConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(cs))
        {
           
            string sql = "select * from house where sold='False'";
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
                        house_id = (int)rdr.GetValue(0), //1st column
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
                        photo_1 = (byte[])rdr.GetValue(13)

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


   
       


    }
    protected void Button1_Click(object sender, EventArgs e)
    {

       listHouses = new List<House>();
 property_types = new List<PropertyType>();


        string cs = ConfigurationManager.ConnectionStrings["DataConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(cs))
                {
            int zip = Convert.ToInt32(TextBox1.Text);
            //int bedselected = Convert.ToInt32(BedDropDownList.SelectedItem.Text);
            //int bathselected = Convert.ToInt32(BathDropDownList.SelectedItem.Text);
            //decimal priceselected = Convert.ToDecimal(PriceDropDownList.SelectedItem.Text);
            int bedSelected = Convert.ToInt32(BedDropDownList.SelectedItem.Text);
            int bathSelected = Convert.ToInt32(BathDropDownList.SelectedItem.Text);
            int min_priceSelected = Convert.ToInt32(MinPriceDropDownList.SelectedItem.Text);
            int max_priceSelected = Convert.ToInt32(MaxPriceDropDownList.SelectedItem.Text);
            String propertyTypeSelected = PropertyDropDownList.SelectedItem.Text;
            //string sql = "select * from house where sold='False' and zipcode=" + zip;
            //    //+ "bed=" + bedselected + "bath=" + bathselected + "price=" + priceselected;
            
           
           // string sql= "select * from house where sold='False' and price>=" + min_priceSelected +"and price<"+ max_priceSelected+" and zipcode=" + zip + "and bed=" + bedSelected + " and bath=" + bathSelected + "and property_type="+propertyTypeSelected + ";";
            string sql = "select *  from house h,PropertyType pt where h.property_type=pt.pid and sold='False' and price>=" + min_priceSelected + "and price<" + max_priceSelected + " and zipcode=" + zip + "and bed=" + bedSelected + " and bath=" + bathSelected + "and type_of_property='" + propertyTypeSelected + "';";
            string sql1 = "select * from propertytype";
            SqlCommand command = new SqlCommand(sql.ToString(), con);
            SqlCommand command1 = new SqlCommand(sql1.ToString(), con);
            //command.CommandTimeout = 3600;
            //command1.CommandTimeout = 3600;

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
                        photo_1 = (byte[])rdr.GetValue(13)

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


   
       

        }
    protected void BedDropDownList_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void BathDropDownList_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void MinPriceDropDownList_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void MaxPriceDropDownList_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        TextBox1.Text = "";
        
    }
}
 