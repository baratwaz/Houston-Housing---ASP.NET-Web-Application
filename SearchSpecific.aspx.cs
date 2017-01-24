using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SearchSpecific : System.Web.UI.Page
{
    public List<House> listHouses = new List<House>();
    public List<PropertyType> property_types = new List<PropertyType>();
    protected void Page_Load(object sender, EventArgs e)
    {
      string house_id= Request.QueryString["house_Id"];

      string cs = ConfigurationManager.ConnectionStrings["DataConnectionString"].ConnectionString;
      using (SqlConnection con = new SqlConnection(cs))
      {
         
          string sql = "select * from house where house_id=" + house_id;
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
                      photo_3 = (byte[])rdr.GetValue(15)

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
}