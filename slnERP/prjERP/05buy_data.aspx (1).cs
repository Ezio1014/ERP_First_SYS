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
            CheckBox cb01 = (CheckBox)GridView1.FindControl("checkbox1");
        }

        protected void DetailsView2_ItemInserted1(object sender, DetailsViewInsertedEventArgs e)
        {
            GridView2.DataBind();
        }

        protected void DetailsView1_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
            DetailsView2.DataBind();
            DropDownList17.DataBind();
        }

        protected void GridView1_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {
            DetailsView2.DataBind();
            DropDownList17.DataBind();
        }       
            

        protected void CustomValidator3_ServerValidate(object source, ServerValidateEventArgs args)
        {
            TextBox TB1 = (TextBox)DetailsView1.FindControl("TextBox1");
            if (TB1.Text == "")
            {
                args.IsValid = false;
            }
            else
            {
                args.IsValid = true;
            }
        }

        protected void CustomValidator4_ServerValidate(object source, ServerValidateEventArgs args)
        {
            Calendar cal01 = (Calendar)DetailsView1.FindControl("Calendar1");
            if(cal01.SelectedDate.ToString() == "0001/1/1 上午 12:00:00")
            {
                args.IsValid = false;
            }
            else
            {
                args.IsValid = true;
            }
        }

        protected void CustomValidator5_ServerValidate(object source, ServerValidateEventArgs args)
        {
            Calendar cal02 = (Calendar)DetailsView1.FindControl("Calendar2");
            if (cal02.SelectedDate.ToString() == "0001/1/1 上午 12:00:00")
            {
                args.IsValid = false;
            }
            else
            {
                args.IsValid = true;
            }
        }

        protected void CustomValidator6_ServerValidate(object source, ServerValidateEventArgs args)
        {
            TextBox TB2 = (TextBox)GridView1.FindControl("TextBox10");
            if (TB2.Text == "")
            {
                args.IsValid = false;
            }
            else
            {
                args.IsValid = true;
            }
        }

        protected void CustomValidator7_ServerValidate(object source, ServerValidateEventArgs args)
        {
            TextBox TB3 = (TextBox)GridView1.FindControl("TextBox13");
            if (TB3.Text == "")
            {
                args.IsValid = false;
            }
            else
            {
                args.IsValid = true;
            }
        }

        protected void CustomValidator8_ServerValidate(object source, ServerValidateEventArgs args)
        {
            TextBox TB4 = (TextBox)GridView1.FindControl("TextBox12");
            if (TB4.Text == "")
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