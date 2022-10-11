using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace prjERP
{
    public partial class Dealer_data : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DV_supplier.Visible = false;
                GV_supplier.Visible = false;
            }
        }

        protected void RbtnL_cos_SelectedIndexChanged(object sender, EventArgs e)
        {
            switch (RbtnL_cos.SelectedValue)
            {
                case "0":
                    DV_dealer.Visible = true;
                    GV_dealer.Visible = true;
                    DV_supplier.Visible = false;
                    GV_supplier.Visible = false;
                    break;

                case "1":
                    DV_dealer.Visible = false;
                    GV_dealer.Visible = false;
                    DV_supplier.Visible = true;
                    GV_supplier.Visible = true;
                    break;
            }
        }
    }
}