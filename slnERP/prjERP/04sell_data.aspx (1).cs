using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace prjERP
{
    public partial class sell_data : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }        

        protected void DetailsView2_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
            GridView2.DataBind();
        }

        protected void DetailsView1_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
            DetailsView2.DataBind();
            DropDownList19.DataBind();
        }

        protected void GridView1_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {
            DetailsView2.DataBind();
            DropDownList19.DataBind();
        }

        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            Calendar cal01 = (Calendar)DetailsView1.FindControl("Calendar1");
            if (cal01.SelectedDate.ToString() == "0001/1/1 上午 12:00:00")
            {
                args.IsValid = false;
            }
            else
            {
                args.IsValid = true;
            }
        }
    }
}