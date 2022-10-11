using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace prjERP
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LbName.Text = Session["role"].ToString();
            //LbPWD.Text = Request.QueryString["PWD"];

            

            //if (Session["role"] != null)
            //{
            //    Response.Redirect("~/01index.aspx");
            //}
            //else
            //{
            //    Response.Redirect("~/00login.aspx");
            //}
        }
    }
}