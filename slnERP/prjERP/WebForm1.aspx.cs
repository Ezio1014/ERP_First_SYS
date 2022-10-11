using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace prjERP
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        class Test
        {

            static void foo(ref int a, ref int b)
            {
                int x = a;

                a = b; b = x;

                Console.Write(a + " " + b + " ");
            }



            public static void Main()
            {
                int x = 10, y = 25;

                foo(ref x, ref y);

                Console.Write(x + " " + y);
            }
        }

    }
}