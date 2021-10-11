using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace btl_ltw
{
    public partial class trangchu : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            acc account = (acc)Session["acc"];
            if (Session["giohang"] != null || account.Cart != null)
            {
                DataTable cart = (account.Hoten == null) ? (DataTable)Session["giohang"] : account.Cart;
                string sl = cart.Rows.Count.ToString();
                soluongArea.Text = sl;
            }
            if (account.Hoten != null)
            {
                Acc.Text = account.Hoten;
                dropdown_content.Visible = true;
            }
            else
            {
                dropdown_content.Visible = false;
            }
        }
        protected void dangxuat_Click(object sender, EventArgs e)
        {
            Session["acc"] = new acc();
            Response.Redirect(Request.RawUrl);
        }
    }
}