using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace btl_ltw
{
    public partial class chitietsanpham : System.Web.UI.Page
    {
        public string message = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            acc account = (acc)Session["acc"];
            if (Request.QueryString.Get("idsanpham") == null)
            {
                Response.Redirect("trangsanpham.aspx");
            }
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
            List<string> list = new List<string>();
            if (Session["lichsu"] == null)
            {
                Session["lichsu"] = list;
            }
            else
            {
                list = (List<string>)Session["lichsu"];
            }
            string id = Request.QueryString.Get("idsanpham");
            XDocument doc = XDocument.Load(Server.MapPath("Product.xml"));
            var nodeList = from product in doc.Descendants("Product")
                           where (string)product.Element("id") == id
                           select product;
            foreach (var pro in nodeList)
            {
                string image = pro.Element("image").Value;
                string ten = pro.Element("ten").Value;
                string gia = pro.Element("gia").Value;
                string hang = pro.Element("hang").Value;
                product_img.InnerHtml = "<img src='" + image + "'>";
                brand.InnerText = hang;
                price.InnerText = gia + "đ";
                name.InnerText = ten;
            }

            var chosenList = from product in doc.Descendants("Product")
                             where list.Contains((string)product.Element("id"))
                             select product;
            string output = "";
            foreach (var pro in chosenList)
            {
                string image = pro.Element("image").Value;
                string ten = pro.Element("ten").Value;
                string gia = pro.Element("gia").Value;
                string hang = pro.Element("hang").Value;
                string ma = pro.Element("id").Value;
                string gioitinh = pro.Element("gioitinh").Value;
                string loai = pro.Element("loai").Value;
                output += @"<li class='product'>
                                    <div class='box'>
                                        <div class='slide-img'>
                                            <img src ='" + image + @"'/>
                                            <div class='overlay'>
                                              <a href = 'xulygiohang.aspx?action=them&idsanpham=" + id + @"' class='buy-btn'>Thêm vào giỏ</a>
                                            </div>
                                        </div>
                                        <div class='detail-box'>
                                            <div class='type'>
                                                <a class='hang' href = 'trangsanpham.aspx?thuonghieu=" + hang + @"' >" + hang + @"</a>
                                                <a class='ten' href = 'chitietsanpham.aspx?idsanpham=" + id + @"'>" + ten + @"</a>
                                            </div>
                                            <a href = '#' class='price'>" + gia + @"</a>
                                        </div>
                                    </div>
                                </li>";
            }
            int check = 0;
            chosenlist.InnerHtml = output;
            foreach (string i in list)
            {
                if (i == id)
                {
                    check = 1;
                    break;
                }
            }
            if (check == 0) list.Add(id);
        }
        protected void themgio_Click(object sender, EventArgs e)
        {
            acc account = (acc)Session["acc"];
            string image = "";
            string ten = "";
            string gia = "";
            DataTable cart = new DataTable();
            int soluong = int.Parse(sl.Value);
            var id = Request.QueryString.Get("idsanpham");
            XDocument doc = XDocument.Load(Server.MapPath("Product.xml"));
            var nodeList = from product in doc.Descendants("Product")
                           where (string)product.Element("id") == id
                           select product;
            foreach (var pro in nodeList)
            {
                image = pro.Element("image").Value;
                ten = pro.Element("ten").Value;
                gia = pro.Element("gia").Value;
            }
            if (Session["giohang"] == null && account.Cart == null)
            {
                //chưa có giỏ hàng, tạo giỏ hàng 
                cart.Columns.Add("id");
                cart.Columns.Add("ten");
                cart.Columns.Add("gia");
                cart.Columns.Add("soluong");
                cart.Columns.Add("anh");
                cart.Rows.Add(id, ten, gia, soluong, image);
                if (account.Hoten == null) Session["giohang"] = cart;
                else account.Cart = cart;
            }
            else
            {
                cart = (account.Hoten == null) ? (DataTable)Session["giohang"] : (DataTable)account.Cart;
                // kiem tra ton tai san pham
                int check = 0;
                foreach (DataRow dr in cart.Rows)
                {
                    if (dr["id"].ToString() == id)
                    {
                        dr["soluong"] = int.Parse(dr["soluong"].ToString()) + soluong;
                        check = 1;
                        break;
                    }
                }
                if (check == 0)
                {
                    cart.Rows.Add(id, ten, gia, soluong, image);
                }
                if (account.Hoten == null) Session["giohang"] = cart;
                else account.Cart = cart;
            }
            soluongArea.Text = cart.Rows.Count.ToString();
            //message = "<script>let alert = document.getElementById('alert'); alert.style.visibility = 'visible';setTimeout(function() {  alert.style.visibility = 'hidden' }, 3000) </script>";
        }
        protected void dangxuat_Click(object sender, EventArgs e)
        {
            Session["acc"] = new acc();
            Response.Redirect(Request.RawUrl);
        }
    }
}