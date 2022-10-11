using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace prjERP
{
    public partial class MIT_class : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DetailsView2.Visible = false;
                DetailsView3.Visible = false;
                GridView2.Visible = false;
                GridView3.Visible = false;
            }

        }

        protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            switch (RadioButtonList1.SelectedValue)
            {
                case "0":
                    DetailsView1.Visible = true;
                    DetailsView2.Visible = false;
                    DetailsView3.Visible = false;
                    GridView1.Visible = true;
                    GridView2.Visible = false;
                    GridView3.Visible = false;
                    break;
                case "1":
                    DetailsView1.Visible = false;
                    DetailsView2.Visible = true;
                    DetailsView3.Visible = false;
                    GridView1.Visible = false;
                    GridView2.Visible = true;
                    GridView3.Visible = false;
                    break;
                case "2":
                    DetailsView1.Visible = false;
                    DetailsView2.Visible = false;
                    DetailsView3.Visible = true;
                    GridView1.Visible = false;
                    GridView2.Visible = false;
                    GridView3.Visible = true;
                    break;
            }
        }

        protected void DetailsView1_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
            GridView1.DataBind();
        }

        protected void DetailsView2_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
            GridView2.DataBind();
        }

        protected void DetailsView3_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
            GridView3.DataBind();
        }
        
    }
}