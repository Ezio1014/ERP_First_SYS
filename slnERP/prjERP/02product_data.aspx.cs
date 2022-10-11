using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace prjERP
{
    public partial class Items_data : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DV_product.Visible = false;
                GV_product.Visible = false;
                DV_C1.Visible = false;
                GV_C1.Visible = false;
                DV_C2.Visible = false;
                GV_C2.Visible = false;
            }
        }

        protected void DetailsView1_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
            GV_product.DataBind();
        }

        protected void btn_pdt_new_Click(object sender, EventArgs e)
        {
            DV_product.Visible = true;
            GV_product.Visible = true;
            DV_C1.Visible = false;
            GV_C1.Visible = false;
            DV_C2.Visible = false;
            GV_C2.Visible = false;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            DV_C1.Visible = true;
            GV_C1.Visible = true;
            DV_product.Visible = false;
            GV_product.Visible = false;
            DV_C2.Visible = false;
            GV_C2.Visible = false;
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            DV_C2.Visible = true;
            GV_C2.Visible = true;
            DV_product.Visible = false;
            GV_product.Visible = false;
            DV_C1.Visible = false;
            GV_C1.Visible = false;
        }

        protected void DV_C1_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
            GV_C1.DataBind();
        }

        protected void DV_C2_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
            GV_C2.DataBind();
        }        
    }
}