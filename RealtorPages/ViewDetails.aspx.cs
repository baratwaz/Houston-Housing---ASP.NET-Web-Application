using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["house"]!=null)
        {
            House h = (House)Session["house"];
            this.address1.Text = h.street_1 + " " + h.street_2;
            this.address2.Text = h.city + " " + h.state + " " + h.zipcode;
            this.bed.Text = h.bed.ToString() + " " + "Bed";
            this.bath.Text = h.bath.ToString() + " " + "Bath";
            this.sqft.Text = h.sqft.ToString() + " " + "Bldg Sqft.";
            this.price.Text = "Price: $" + Convert.ToInt32(h.price).ToString();
            this.pic1.ImageUrl= "data:Image/png;base64," + Convert.ToBase64String((byte[])h.photo_1);
            this.pic2.ImageUrl = "data:Image/png;base64," + Convert.ToBase64String((byte[])h.photot_2);
            this.pic3.ImageUrl = "data:Image/png;base64," + Convert.ToBase64String((byte[])h.photo_3);
        }
    }
   
    public void Details(string value)
    {

    }
}