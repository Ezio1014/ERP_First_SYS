using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace prjERP
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Redirect("07IIF.aspx", false);
            GridView1.Visible = false;
        }

        protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
        {
            foreach (TableRow R in GridView1.Rows)
            {
                if(Login1.UserName == R.Cells[0].Text)
                {
                    if(Login1.Password == R.Cells[1].Text)
                    {
                        Session.Add("role", R.Cells[2].Text);
                        Response.Redirect("~/01index.aspx");
                    }
                    else
                    {
                        Response.Write("pwd err");
                    }
                }
                else
                {
                    Response.Write("acc err");
                }
            }
        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            String Url = "01index.aspx?Name=" + TxtName.Text + "&PWD=" + TxtPWD.Text;
            Response.Redirect(Url);
        }
    }
}