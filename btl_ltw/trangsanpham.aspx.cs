using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using System.Xml.Linq;

namespace btl_ltw
{
    public partial class trangsanpham : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            acc account = (acc)Session["acc"];
            if (account.Hoten != null)
            {
                Acc.Text = account.Hoten;
                dropdown_content.Visible = true;
            }
            else
            {
                dropdown_content.Visible = false;
            }
            if (Session["giohang"] != null || account.Cart != null)
            {
                DataTable cart = (account.Hoten == null) ? (DataTable)Session["giohang"] : account.Cart;
                string sl = cart.Rows.Count.ToString();
                soluongArea.Text = sl;
            }
            var field = Request.QueryString.Get("field");
            var sort = Request.QueryString.Get("sort");
            var thuonghieu = Request.QueryString.Get("thuonghieu");
            var gioitinh = Request.QueryString.Get("gioitinh");
            string output = "";
            output += "<div class='row no-gutters'>";
            if ((field != null && sort != null) || thuonghieu != null || gioitinh != null)
            {
                if (field != null && sort != null && thuonghieu != null)
                {
                    output += getDataSortFilter(field, sort, thuonghieu);
                }
                else if (field != null && sort != null && thuonghieu == null)
                {
                    output += getDataSort(field, sort);
                }
                else if (thuonghieu != null && field == null && sort == null)
                {
                    output += getDatafilter(thuonghieu);
                }
                else if (gioitinh != null)
                {
                    output += getDataGioiTinh(gioitinh);
                }
            }
            else
            {
                output += getData();
            }
            output += "</div>";
            listProduct.InnerHtml = output;
        }

        private string getDataSort(string field, string sort)
        {
            string data = "";
            if (sort == "asc")
            {
                XDocument doc = XDocument.Load(Server.MapPath("Product.xml"));

                var nodeList = from product in doc.Descendants("Product")
                               orderby (string)product.Element(field)
                               select product;
                foreach (var pro in nodeList)
                {
                    string image = pro.Element("image").Value;
                    string ten = pro.Element("ten").Value;
                    string gia = pro.Element("gia").Value;
                    string hang = pro.Element("hang").Value;
                    string id = pro.Element("id").Value;
                    string gioitinh = pro.Element("gioitinh").Value;
                    string loai = pro.Element("loai").Value;
                    data += @"<div class='col l-3 c-6 m-6 product'>
                                            <div class='box'>
                                                <div class='slide-img'>
                                                    <img src = '" + image + @"'/>
                                                    <div class='overlay'>
                                                      <a href='xulygiohang.aspx?action=them&idsanpham=" + id + @"' class='buy-btn'>Thêm vào giỏ</a>
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
                                        </div>";
                }
            }
            else if (sort == "desc")
            {
                XDocument doc = XDocument.Load(Server.MapPath("Product.xml"));

                var nodeList = from product in doc.Descendants("Product")
                               orderby (string)product.Element(field) descending
                               select product;
                foreach (var pro in nodeList)
                {
                    string image = pro.Element("image").Value;
                    string ten = pro.Element("ten").Value;
                    string gia = pro.Element("gia").Value;
                    string hang = pro.Element("hang").Value;
                    string id = pro.Element("id").Value;
                    string gioitinh = pro.Element("gioitinh").Value;
                    string loai = pro.Element("loai").Value;
                    data += @"<div class='col l-3 c-6 m-6 product'>
                                            <div class='box'>
                                                <div class='slide-img'>
                                                    <img src = '" + image + @"'/>
                                                    <div class='overlay'>
                                                      <a  href='xulygiohang.aspx?action=them&idsanpham=" + id + @"' class='buy-btn'>Thêm vào giỏ</a>
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
                                        </div>";
                }
            }
            return data;
        }
        private string getData()
        {
            string data = "";
            XmlDocument xdoc = new XmlDocument();
            xdoc.Load(Server.MapPath("Product.xml"));
            XmlNodeList listPro = xdoc.GetElementsByTagName("Product");
            foreach (XmlNode pro in listPro)
            {
                string id = pro.ChildNodes[0].InnerText;
                string image = pro.ChildNodes[1].InnerText;
                string ten = pro.ChildNodes[2].InnerText;
                string hang = pro.ChildNodes[3].InnerText;
                string gia = pro.ChildNodes[4].InnerText;
                string gioitinh = pro.ChildNodes[6].InnerText;
                string loai = pro.ChildNodes[5].InnerText;
                data += @"<div class='col l-3 c-6 m-6 product'>
                                            <div class='box'>
                                                <div class='slide-img'>
                                                    <img src = '" + image + @"'/>
                                                    <div class='overlay'>
                                                      <a href='xulygiohang.aspx?action=them&idsanpham=" + id + @"' class='buy-btn'>Thêm vào giỏ</a>
                                                    </div>
                                                </div>
                                                <div class='detail-box'>
                                                    <div class='type'>
                                                      <a class='hang' href = 'trangsanpham.aspx?thuonghieu=" + hang + @"' >" + hang + @"</a>
                                                      <a class='ten' href = 'chitietsanpham.aspx?idsanpham=" + id + @"'>" + ten + @"</a>
                                                    </div>
                                                    <a href = '#' class='price'>" + gia + @"đ</a>
                                                </div>
                                            </div>
                                        </div>";
            }
            return data;
        }
        private string getDatafilter(string thuonghieu)
        {
            string data = "";
            XDocument doc = XDocument.Load(Server.MapPath("Product.xml"));
            string[] arr = thuonghieu.Split(',');
            List<string> list = new List<string>(arr);
            var nodeList = from product in doc.Descendants("Product")
                           where list.Contains((string)product.Element("hang"))
                           select product;
            foreach (var pro in nodeList)
            {
                string image = pro.Element("image").Value;
                string ten = pro.Element("ten").Value;
                string gia = pro.Element("gia").Value;
                string hang = pro.Element("hang").Value;
                string id = pro.Element("id").Value;
                string gioitinh = pro.Element("gioitinh").Value;
                string loai = pro.Element("loai").Value;
                data += @"<div class='col l-3 c-6 m-6 product'>
                                            <div class='box'>
                                                <div class='slide-img'>
                                                    <img src = '" + image + @"'/>
                                                    <div class='overlay'>
                                                      <a href='xulygiohang.aspx?action=them&idsanpham=" + id + @"' class='buy-btn'>Thêm vào giỏ</a>
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
                                        </div>";
            }
            return data;
        }
        private string getDataGioiTinh(string gt)
        {
            string data = "";
            XDocument doc = XDocument.Load(Server.MapPath("Product.xml"));
            string[] arr = gt.Split(',');
            List<string> list = new List<string>(arr);
            var nodeList = from product in doc.Descendants("Product")
                           where list.Contains((string)product.Element("gioitinh"))
                           select product;
            foreach (var pro in nodeList)
            {
                string image = pro.Element("image").Value;
                string ten = pro.Element("ten").Value;
                string gia = pro.Element("gia").Value;
                string hang = pro.Element("hang").Value;
                string id = pro.Element("id").Value;
                string gioitinh = pro.Element("gioitinh").Value;
                string loai = pro.Element("loai").Value;
                data += @"<div class='col l-3 c-6 m-6 product'>
                                            <div class='box'>
                                                <div class='slide-img'>
                                                    <img src = '" + image + @"'/>
                                                    <div class='overlay'>
                                                      <a href='xulygiohang.aspx?action=them&idsanpham=" + id + @"' class='buy-btn'>Thêm vào giỏ</a>
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
                                        </div>";
            }
            return data;
        }
        private string getDataSortFilter(string field, string sort, string thuonghieu)
        {
            string data = "";
            XDocument doc = XDocument.Load(Server.MapPath("Product.xml"));
            string[] arr = thuonghieu.Split(',');
            List<string> list = new List<string>(arr);
            if (sort == "asc")
            {
                // product bien luu thong tin tung phan tu
                var nodeList = from product in doc.Descendants("Product")
                               orderby (int)product.Element(field)
                               where list.Contains((string)product.Element("hang"))
                               select product;
                foreach (var pro in nodeList)
                {
                    string image = pro.Element("image").Value;
                    string ten = pro.Element("ten").Value;
                    string gia = pro.Element("gia").Value;
                    string hang = pro.Element("hang").Value;
                    string id = pro.Element("id").Value;
                    string gioitinh = pro.Element("gioitinh").Value;
                    string loai = pro.Element("loai").Value;
                    data += @"<div class='col l-3 c-6 m-6 product'>
                                            <div class='box'>
                                                <div class='slide-img'>
                                                    <img src = '" + image + @"'/>
                                                    <div class='overlay'>
                                                      <a href='xulygiohang.aspx?action=them&idsanpham=" + id + @"' class='buy-btn'>Thêm vào giỏ</a>
                                                    </div>
                                                </div>
                                                <div class='detail-box'>
                                                    <div class='type'>
                                                      <a href = 'trangsanpham.aspx?thuonghieu=" + hang + @"' >" + hang + @"</a>
                                                      <span>" + ten + @"</span>
                                                    </div>
                                                    <a href = '#' class='price'>" + gia + @"</a>
                                                </div>
                                            </div>
                                        </div>";
                }
            }
            else if (sort == "desc")
            {
                var nodeList = from product in doc.Descendants("Product")
                               orderby (int)product.Element(field) descending
                               where list.Contains((string)product.Element("hang"))
                               select product;
                foreach (var pro in nodeList)
                {
                    string image = pro.Element("image").Value;
                    string ten = pro.Element("ten").Value;
                    string gia = pro.Element("gia").Value;
                    string hang = pro.Element("hang").Value;
                    string id = pro.Element("id").Value;
                    string gioitinh = pro.Element("gioitinh").Value;
                    string loai = pro.Element("loai").Value;
                    data += @"<div class='col l-3 c-6 m-6 product'>
                                            <div class='box'>
                                                <div class='slide-img'>
                                                    <img src = '" + image + @"'/>
                                                    <div class='overlay'>
                                                      <a href='xulygiohang.aspx?idsanpham=" + id + @"' class='buy-btn'>Thêm vào giỏ</a>
                                                    </div>
                                                </div>
                                                <div class='detail-box'>
                                                    <div class='type'>
                                                      <a href = 'trangsanpham.aspx?thuonghieu=" + hang + @"' >" + hang + @"</a>
                                                      <span>" + ten + @"</span>
                                                    </div>
                                                    <a href = '#' class='price'>" + gia + @"</a>
                                                </div>
                                            </div>
                                        </div>";
                }
            }
            return data;
        }

        protected void dangxuat_Click(object sender, EventArgs e)
        {
            Session["acc"] = new acc();
            Response.Redirect(Request.RawUrl);
        }
    }
}