using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace prjERP
{
    public partial class details : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label4.Text = Calendar1.SelectedDate.GetDateTimeFormats('d')[0].ToString();
            Label5.Text = Calendar2.SelectedDate.GetDateTimeFormats('d')[0].ToString();
            start_date_buy.Text = Calendar1.SelectedDate.GetDateTimeFormats('d')[0].ToString();
            end_date_buy.Text = Calendar2.SelectedDate.GetDateTimeFormats('d')[0].ToString();
            GridView6.Visible = false;
            GridView5.Visible = false;
        }
        

        protected void Button2_Click(object sender, EventArgs e)
        {
            GridView1.DataBind();
            GridView2.DataBind();
            //if (TB1.Text == "")
            //{
            //    TB1.Text = " ";
            //}            
            //DropDownList ddl_buy = (DropDownList)DropDownList1;
            //DropDownList ddl_sell = (DropDownList)DropDownList2;

            //Calendar cal01 = (Calendar)Calendar1;
            //string cal01_1 = cal01.SelectedDate.ToShortDateString().ToString();

            //Calendar cal02 = (Calendar)Calendar2;            
            //string cal02_1 = cal02.SelectedDate.ToShortDateString().ToString(); 

            //SqlDataSource SD_GV01 = (SqlDataSource)SqlDataSource1;
            //SqlDataSource SD_GV02 = (SqlDataSource)SqlDataSource3;

            //string SD_buy = "select a.purchase_name, a.purchase_date, a.arrival_date, a.declaration_form, " +
            //               "a.freight, a.invoice_num, a.address, b.purchase_price, b.purchase_quantity, " +
            //               "c.item_name, d.staff_name, e.payway, f.invoice, g.tax_style, h.Supplier_name, " +
            //               "i.warehouse_name, (b.purchase_price*b.purchase_quantity) as s_money from Buy_data1 a " +
            //               "left join Buy_data2 b on a.uid = b.purchase_id " +
            //               "left join Item_data c on c.Item_id = b.item_name " +
            //               "left join Staff_data d on a.staff = d.uid " +
            //               "left join Payway e on a.payway = e.pid " +
            //               "left join Invoice_style f on a.invoice_style = f.uid " +
            //               "left join Tax_style g on a.tax_style = g.uid " +
            //               "left join Supplier_data h on a.supplier_name = h.Supplier_id " +
            //               "left join Warehouse_data i on a.warehouse_name = i.uid ";

            //string SD_sell = "select a.o_id, a.order_date, b.staff_name, c.dealer_name, a.freight, a.address, " +
            //                 "(g.sell_quantity * h.pricing) as s_money, d.payway, e.invoice, f.tax_style, " +
            //                 "a.invoice_num, g.sell_quantity, h.Item_Name, h.pricing from Sell_data1 a " +
            //                 "left join Staff_data b on a.staff = b.uid " +
            //                 "left join Dealer_data c on a.dealer_name = c.Dealer_id " +
            //                 "left join Payway d on a.payway = d.pid " +
            //                 "left join Invoice_style e on a.invoice_style = e.uid " +
            //                 "left join Tax_style f on a.tax = f.uid " +
            //                 "left join Sell_data2 g on a.sid = g.order_id " +
            //                 "left join Item_data h on g.item_name = h.Item_id ";

            switch (int.Parse(RadioButtonList1.SelectedValue))
            {
                case 0:                    
                    //if (ddl_buy.SelectedValue == "-1")
                    //{
                    //    SD_GV01.SelectCommand = SD_buy +
                    //                            "where purchase_date between '" + cal01_1 + "' and '" + cal02_1 + "' " +
                    //                            "ORDER BY a.purchase_date, h.Supplier_name, c.item_name";
                    //}
                    //else if (int.Parse(ddl_buy.SelectedValue) >= 0)
                    //{
                    //    SD_GV01.SelectCommand = SD_buy +
                    //                            "where a.supplier_name = '" + ddl_buy.SelectedValue + "' and " +
                    //                            "(purchase_date between '" + cal01_1 + "' and '" + cal02_1 + "') " +
                    //                            "ORDER BY a.purchase_date, c.item_name";
                    //}
                    DropDownList1.Visible = true;
                    GridView1.Visible = true;
                    break;

                case 1:                    
                    //if (ddl_sell.SelectedValue == "-1")
                    //{
                    //    SD_GV02.SelectCommand = SD_sell +
                    //                            "where order_date between '" + cal01_1 + "' and '" + cal02_1 + "' " +
                    //                            "ORDER BY a.order_date, h.Item_Name";
                    //}
                    //else if (int.Parse(ddl_sell.SelectedValue) >= 0)
                    //{
                    //    SD_GV02.SelectCommand = SD_sell +
                    //                            "where a.Dealer_name = '" + ddl_sell.SelectedValue + "' and " +
                    //                            "(order_date between '" + cal01_1 + "' and '" + cal02_1 + "') " +
                    //                            "ORDER BY a.order_date, c.dealer_name, h.Item_Name";
                    //}
                    DropDownList2.Visible = true;
                    GridView2.Visible = true;
                    break;
            }
            
        }        

        protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            switch (int.Parse(RadioButtonList1.SelectedValue))
            {
                case 0:
                    TB1.Visible = true;                    
                    Label2.Visible = true;
                    Label3.Visible = false;
                    DropDownList1.Visible = true;
                    GridView1.Visible = true;
                    DropDownList2.Visible = false;
                    GridView2.Visible = false;
                    
                    GridView4.Visible = false;
                    break;
                case 1:
                    TB1.Visible = true;                    
                    Label2.Visible = false;
                    Label3.Visible = true;
                    DropDownList2.Visible = true;
                    GridView2.Visible = true;
                    DropDownList1.Visible = false;
                    GridView1.Visible = false;
                    
                    GridView4.Visible = false;
                    break;
                case 4:
                    
                    TB1.Visible = false;
                    Label2.Visible = false;
                    Label3.Visible = false;
                    DropDownList2.Visible = false;
                    GridView2.Visible = false;
                    DropDownList1.Visible = false;
                    GridView1.Visible = false;
                    GridView4.Visible = false;
                    break;
                case 5:
                    GridView4.Visible = true;
                    TB1.Visible = false;
                    Label2.Visible = false;
                    Label3.Visible = false;
                    DropDownList2.Visible = false;
                    GridView2.Visible = false;
                    DropDownList1.Visible = false;
                    GridView1.Visible = false;
                    
                    break;
            }
        }
    }
        
}