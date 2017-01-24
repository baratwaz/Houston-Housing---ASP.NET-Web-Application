<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="SearchSpecific.aspx.cs" Inherits="SearchSpecific" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 346px;
        }
    </style>
    <style type="text/css">
             .modal-content {
  position: relative;
  background-color: #fff;
  -webkit-background-clip: padding-box;
          background-clip: padding-box;
  border: 1px solid #999;
  border: 1px solid rgba(0, 0, 0, .2);
  border-radius: 6px;
  outline: 0;
  -webkit-box-shadow: 0 3px 9px rgba(0, 0, 0, .5);
          box-shadow: 0 3px 9px rgba(0, 0, 0, .5);
}
             .modal-body
{
    overflow: hidden;
}
.modal-body .row
{
    margin-bottom: 10px;
}

.img-responsive
{  width: 100%;
    border: 3px solid #999;
    padding: 2px;
    -webkit-border-radius: 50px 0;
    -moz-border-radius: 50px 0;
    border-radius: 50px 0;
    display: block;
  max-width: 100%;
  height: auto;
}

body{
    overflow:hidden;
   
}
    </style>
    <script type="text/javascript" src="../lib/jquery-1.10.1.min.js"></script>

	<!-- Add mousewheel plugin (this is optional) -->
	<script type="text/javascript" src="../lib/jquery.mousewheel-3.0.6.pack.js"></script>

	<!-- Add fancyBox main JS and CSS files -->
	<script type="text/javascript" src="../source/jquery.fancybox.js?v=2.1.5"></script>
	<link rel="stylesheet" type="text/css" href="../source/jquery.fancybox.css?v=2.1.5" media="screen" />

	<!-- Add Button helper (this is optional) -->
	<link rel="stylesheet" type="text/css" href="../source/helpers/jquery.fancybox-buttons.css?v=1.0.5" />
	<script type="text/javascript" src="../source/helpers/jquery.fancybox-buttons.js?v=1.0.5"></script>

	<!-- Add Thumbnail helper (this is optional) -->
	<link rel="stylesheet" type="text/css" href="../source/helpers/jquery.fancybox-thumbs.css?v=1.0.7" />
	<script type="text/javascript" src="../source/helpers/jquery.fancybox-thumbs.js?v=1.0.7"></script>

	<!-- Add Media helper (this is optional) -->
	<script type="text/javascript" src="../source/helpers/jquery.fancybox-media.js?v=1.0.6"></script>
      

	<script type="text/javascript">
	    $(document).ready(function () {
	        var address = document.getElementById("address").innerHTML || 'bay area blvd, houston, texas';
	        gerc = new google.maps.Geocoder();
	        if (gerc) {
	            gerc.geocode({
	                'address': address,
	                'region': 'us'
	            }, function (result, stat) {
	                if (stat == google.maps.GeocoderStatus.OK) {
	                    loadHref(result[0]);
	                }
	            });
	        }

	        $('.fancybox').fancybox();

	        $(".various").fancybox({
	            maxWidth: 800,
	            maxHeight: 600,
	            fitToView: false,
	            width: '70%',
	            height: '70%',
	            autoSize: false,
	            closeClick: false,
	            openEffect: 'none',
	            closeEffect: 'none'
	        })
	    }

        );


	    function loadHref(result) {
	        document.getElementById("gMap").href = "https://maps.google.com/?q=" + result.geometry.location.lat() + "," + result.geometry.location.lng() + "&spn=0.003381,0.017231&z=20&output=embed";
	    }
        </script>



    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

     <div class="container" style="margin-top:150px;">
        <div class="section blogs-section active">
            <div class="section-wrapper">
<div class="container-fluid"><div class="modal-content"><div class="modal-header det-container-hdr">
    <h4 class="modal-title">House Details</h4>
    </div><div class="modal-body">
 <% foreach (House h in listHouses)
           {%>
    <div class="col-sm-5"> <a class="fancybox" href="<%: "data:Image/png;base64,"
                    + Convert.ToBase64String((byte[])h.photo_1) %>" data-fancybox-group="gallery" title="House Exterior">     <img class="img-responsive" src="<%: "data:Image/png;base64,"
                    + Convert.ToBase64String((byte[])h.photo_1) %>"/></a>
                 <a class="fancybox" href="<%: "data:Image/png;base64,"
                    + Convert.ToBase64String((byte[])h.photot_2) %>" data-fancybox-group="gallery" title="House Interior">     <img class="img-responsive" style="display: none; " src="<%: "data:Image/png;base64,"
                    + Convert.ToBase64String((byte[])h.photot_2) %>"/></a>
                 <a class="fancybox" href="<%: "data:Image/png;base64,"
                    + Convert.ToBase64String((byte[])h.photo_3) %>" data-fancybox-group="gallery" title="House Interior">     <img class="img-responsive" style="display: none; " src="<%: "data:Image/png;base64,"
                    + Convert.ToBase64String((byte[])h.photo_3) %>"/></a>
           </div>
                            <div class="col-sm-7">
                             <div class="row">
                               <div class="col-sm-5"><label>Address: </label></div><div id="address" class="col-sm-7"><%: h.street_1 + ","+ h.street_2+ ","+ h.city + ","+ h.state+","+ h.zipcode %></div>
                               </div><div class="row">
                               <div class="col-sm-5"><label>No of Beds: </label></div><div class="col-sm-7"><%: h.bed %></div>
                               </div><div class="row">
                               <div class="col-sm-5"><label>No of Bath: </label></div><div class="col-sm-7"><%: h.bath %></div>
                               </div><div class="row">
                               <div class="col-sm-5"><label>Price:</label></div><div class="col-sm-7"><%: h.sqft %> sqft</div>
                               </div><div class="row">
                               <div class="col-sm-5"><label>Property type: </label></div><div class="col-sm-7">$<%: (long)h.price %></div>
                               </div><div class="row">
                               <div class="col-sm-5"><label>Property type: </label></div><div class="col-sm-7"><%: property_types.Where(x=>x.pid== h.property_type).FirstOrDefault().type_of_property %></div>
                               </div><div class="row"><div class="col-sm-5"><label>Year built: </label></div><div class="col-sm-7"><%: h.year_built.Value.ToShortDateString() %></div></div>
                                <div class="row"><a class="various fancybox.iframe btn btn-info btn-lg" id="gMap" >Google Maps</a><a class="btn btn-primary btn-lg" href="Search.aspx"  style="margin-left:5px;">Return</a> </div>
                                
                            </div></div>
    
    							    <%}%> 
    <br /></div>
							   
				    </div>
        </div>
    </div>

         </div>
  
         <script  type="text/javascript" src="http://maps.google.com/maps/api/js?key=AIzaSyB9KLeUrGHvoL1OyOPExJ3SiUkvkF7RbK4" ></script>
</asp:Content>