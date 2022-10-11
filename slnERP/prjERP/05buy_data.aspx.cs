using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace prjERP
{
    public partial class buy_data : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void DetailsView2_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
            GridView1.DataBind();
        }

        protected void DetailsView1_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
            GridView1.DataBind();
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.Columns[2].Visible = true;
            GridView1.Columns[3].Visible = false;
            GridView1.Columns[4].Visible = true;
            GridView1.Columns[5].Visible = false;
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.Columns[2].Visible = false;
            GridView1.Columns[3].Visible = true;
            GridView1.Columns[4].Visible = false;
            GridView1.Columns[5].Visible = true;
        }

        protected void GridView1_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {
            GridView1.Columns[2].Visible = false;
            GridView1.Columns[3].Visible = true;
            GridView1.Columns[4].Visible = false;
            GridView1.Columns[5].Visible = true;
        }

        protected void GridView2_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView2.Columns[5].Visible = true;
            GridView2.Columns[6].Visible = false;
            GridView2.Columns[9].Visible = true;
            GridView2.Columns[10].Visible = false;
            GridView2.Columns[11].Visible = true;
            GridView2.Columns[12].Visible = false;
            GridView2.Columns[13].Visible = true;
            GridView2.Columns[14].Visible = false;
            GridView2.Columns[16].Visible = true;
            GridView2.Columns[17].Visible = false;
            GridView2.Columns[18].Visible = true;
            GridView2.Columns[19].Visible = false;
        }

        protected void GridView2_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {
            GridView2.Columns[5].Visible = false;
            GridView2.Columns[6].Visible = true;
            GridView2.Columns[9].Visible = false;
            GridView2.Columns[10].Visible = true;
            GridView2.Columns[11].Visible = false;
            GridView2.Columns[12].Visible = true;
            GridView2.Columns[13].Visible = false;
            GridView2.Columns[14].Visible = true;
            GridView2.Columns[16].Visible = false;
            GridView2.Columns[17].Visible = true;
            GridView2.Columns[18].Visible = false;
            GridView2.Columns[19].Visible = true;
        }

        protected void GridView2_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView2.Columns[5].Visible = false;
            GridView2.Columns[6].Visible = true;
            GridView2.Columns[9].Visible = false;
            GridView2.Columns[10].Visible = true;
            GridView2.Columns[11].Visible = false;
            GridView2.Columns[12].Visible = true;
            GridView2.Columns[13].Visible = false;
            GridView2.Columns[14].Visible = true;
            GridView2.Columns[16].Visible = false;
            GridView2.Columns[17].Visible = true;
            GridView2.Columns[18].Visible = false;
            GridView2.Columns[19].Visible = true;
        }
    }
}