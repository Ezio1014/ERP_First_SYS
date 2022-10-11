using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace prjERP
{
    public partial class IDL : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {            
            if (!IsPostBack)
            {
                DV_dep.Visible = false;
                GV_dep.Visible = false;
                DV_post.Visible = false;
                GV_post.Visible = false;
            }
        }

        protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            switch (RbtnL_IIF.SelectedValue)
            {
                case "0":
                    DV_IIF.Visible = true;
                    GV_IIF.Visible = true;
                    DV_dep.Visible = false;
                    GV_dep.Visible = false;
                    DV_post.Visible = false;
                    GV_post.Visible = false;
                    break;
                case "1":
                    DV_IIF.Visible = false;
                    GV_IIF.Visible = false;
                    DV_dep.Visible = true;
                    GV_dep.Visible = true;
                    DV_post.Visible = false;
                    GV_post.Visible = false;
                    break;
                case "2":
                    DV_IIF.Visible = false;
                    GV_IIF.Visible = false;
                    DV_dep.Visible = false;
                    GV_dep.Visible = false;
                    DV_post.Visible = true;
                    GV_post.Visible = true;
                    break;
            }
        }        

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            //按下GridView的編輯按鈕時隱藏指定欄位(欄位的位置依照所有欄位排序而定，如果有額外預先隱藏欄位也要算進去)
            //另外GridView 的 AutoGenerateColumns 是 false，否則會出錯。
            GV_IIF.Columns[2].Visible = true;
            GV_IIF.Columns[3].Visible = true;
            GV_IIF.Columns[4].Visible = false;
            GV_IIF.Columns[5].Visible = false;
        }

        protected void GridView1_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {
            //按下GridView的編輯按鈕時隱藏指定欄位(欄位的位置依照所有欄位排序而定，如果有額外預先隱藏欄位也要算進去)
            //另外GridView 的 AutoGenerateColumns 是 false，否則會出錯。
            GV_IIF.Columns[4].Visible = true;
            GV_IIF.Columns[5].Visible = true;
            GV_IIF.Columns[2].Visible = false;
            GV_IIF.Columns[3].Visible = false;
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            //按下GridView的編輯按鈕時隱藏指定欄位(欄位的位置依照所有欄位排序而定，如果有額外預先隱藏欄位也要算進去)
            //另外GridView 的 AutoGenerateColumns 是 false，否則會出錯。
            GV_IIF.Columns[4].Visible = true;
            GV_IIF.Columns[5].Visible = true;
            GV_IIF.Columns[2].Visible = false;
            GV_IIF.Columns[3].Visible = false;
        }

        protected void DV_IIF_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
            GV_IIF.DataBind();
        }

        protected void DV_dep_ItemInserted(object sender, DetailsViewDeletedEventArgs e)
        {
            GV_dep.DataBind();
        }

        protected void DV_post_ItemInserted(object sender, DetailsViewDeletedEventArgs e)
        {
            GV_post.DataBind();
        }

        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {            
            CustomValidator cv1 = (CustomValidator)DV_IIF.FindControl("CustomValidator1");
            TextBox tb1 = (TextBox)DV_IIF.FindControl("TextBox8");
            TextBox accu = (TextBox)DV_IIF.FindControl("TextBox2");
            string i = tb1.Text;
            string accu01 = accu.Text;

            if (string.IsNullOrEmpty(i))
            {
                cv1.ErrorMessage = "密碼不得為空白";
                args.IsValid = false;
            }
            else if (i.Length < 4)
            {
                cv1.ErrorMessage = "密碼長度不得小於4位";
                args.IsValid = false;
            }
            else if (i == accu01)
            {
                cv1.ErrorMessage = "密碼不得與帳號相同";
                args.IsValid = false;
            }
            else
            {
                args.IsValid = true;
            }
        }
    }
}