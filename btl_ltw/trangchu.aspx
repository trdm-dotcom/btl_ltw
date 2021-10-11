<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="trangchu.aspx.cs" Inherits="btl_ltw.trangchu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Toy King</title>
    <link rel="stylesheet" href="fontawesome-free-5.15.2-web/css/all.min.css">
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/reponsive.css">
    <style>
        #dropdown {
            float: left;
            overflow: hidden;
        }
        #dropdown_content {
            cursor:pointer;
            display: none;
            position: absolute;
            background-color: #f9f9f9;
            min-width: 160px;
            box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
            z-index: 1;
        }
        #dropdown:hover #dropdown_content {
            display: block;
        }
        #dangxuat{
            cursor:pointer;
            border: 0;
            font-size: 16px;
            outline: none;
            background:#fff;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <header>
            <nav class="navbar">
                <div class="content grid wide">       
                    <div class="logo">
                        <a href="trangchu.aspx" class="logo-text">TOY KING</a>
                    </div>
                    <div class="menu-box">
                        <ul class="menu-list">
                            <button class="icon close-btn" type="button"><i class="fas fa-times" style="font-size: 20px;"></i></button>
                            <li class="menu-item"><a href="trangchu.aspx">Trang chủ</a></li>
                            <li class="menu-item"><a href="trangsanpham.aspx">Sản phẩm</a></li>
                            <li class="menu-item"><a href="#">Tuổi</a></li>
                            <li class="menu-item"><a href="#">Giới tính</a></li>
                            <li class="menu-item"><a href="#">Thông tin</a></li>
                        </ul>
                        <div class="menu-icon">
                            <div id="dropdown">
                                <a href="dangnhap.aspx" style="color:#3d3d3d;"><i class="far fa-user-circle" style="font-size: 20px;"></i> <asp:Label ID="Acc" runat="server" Text="" Font-Size="20px"></asp:Label></a>
                                <div id="dropdown_content" runat="server">
                                    <asp:Button ID="dangxuat" runat="server" Text="Đăng xuất" onclick="dangxuat_Click"/>
                                </div>
                            </div>
                            <a href="giohang.aspx" style="color:#3d3d3d;"><i class="fas fa-shopping-cart" style="font-size: 20px;"></i>(<asp:Label ID="soluongArea" runat="server" Text="0"></asp:Label>)</a>
                            <button class="icon menu-btn" type="button"><i class="fas fa-bars" style="font-size: 20px;"></i></button>
                        </div>
                    </div>
                </div>
            </nav>
        </header>
        <main>
            <div class="banner-slider">
                <img src="img/banner1.jpg" class="img-slide">
                <img src="img/banner2.jpg" class="img-slide">
                <img src="img/banner3.jpg" class="img-slide">
            </div>
            <div class="grid wide">
                <div class="danhmuc">
                    <div class="heading">
                        <center>
                            <h3>Đồ chơi theo giới tính</h3>
                        </center>
                    </div>
                    <div class="row">
                        <div class="hero-box col l-6 m-12 c-12" id="begai">
                            <img src="img/begai.jpg" class="hero-img"/>
                            <a href="trangsanpham.aspx?gioitinh=gai" class="hero-text">Bé gái</a>
                        </div>
                        <div class="hero-box col l-6 m-12 c-12" id="betrai">
                            <img src="img/betrai.jpg" class="hero-img"/>
                            <a href="trangsanpham.aspx?gioitinh=trai" class="hero-text">Bé trai</a>
                        </div>
                    </div>
                </div>
                <div class="danhmuc">
                    <div class="heading">
                        <center>
                            <h3>Thương hiệu</h3>
                        </center>
                    </div>
                    <div class="slider" id="slider">
                        <ul class="slide">
                            <li class="item">
                                <a href="trangsanpham.aspx?thuonghieu=Tamica"><img src="img/thuonghieu/vendor_item_1.jpg"></a>
                            </li>
                            <li class="item">
                                <a href="trangsanpham.aspx?thuonghieu=Sylvanian%20Families%20Village"><img src="img/thuonghieu/vendor_item_2.jpg"></a>
                            </li>
                            <li class="item">
                                <a href="trangsanpham.aspx?thuonghieu=Pokemon"><img src="img/thuonghieu/vendor_item_3.jpg"></a>
                            </li>
                            <li class="item">
                                <a href="trangsanpham.aspx"><img src="img/thuonghieu/vendor_item_4.jpg"></a>
                            </li>
                            <li class="item">
                                <a href="trangsanpham.aspx?thuonghieu=Beyblade%20Burst"><img src="img/thuonghieu/vendor_item_5.jpg"></a>
                            </li>
                            <li class="item">
                                <a href="trangsanpham.aspx?thuonghieu=Lego"><img src="img/thuonghieu/vendor_item_6.jpg"></a>
                            </li>
                            <li class="item">
                                <a href="trangsanpham.aspx"><img src="img/thuonghieu/vendor_item_7.jpg"></a>
                            </li>
                            <li class="item">
                                <a href="trangsanpham.aspx?thuonghieu=Smartgames"><img src="img/thuonghieu/vendor_item_8.jpg"></a>
                            </li>
                            <li class="item">
                                <a href="trangsanpham.aspx"><img src="img/thuonghieu/vendor_item_10.jpg"></a>
                            </li>
                        </ul>
                  </div>
                </div>
            
                <div class="danhmuc">
                    <div class="heading">
                        <center>
                            <h3>Đồ chơi trí tuệ Smartgames</h3>
                            <a href="#">Xem thêm</a>
                        </center>
                        <div class="slider">
                            <ul class="slide">
                                <li class="product">
                                    <div class="box">
                                        <div class="slide-img">
                                            <img src="img/smartgame/cubeduel.jpg" alt="" />
                                            <div class="overlay">
                                              <a href="#" class="buy-btn">Thêm vào giỏ</a>
                                            </div>
                                        </div>
                                        <div class="detail-box">
                                            <div class="type">
                                              <a href="#">Smartgames</a>
                                              <span>Thử thách Cube Duel</span>
                                            </div>
                                            <a href="#" class="price">450000</a>
                                        </div>
                                    </div>
                                </li>
                                <li class="product">
                                    <div class="box">
                                        <div class="slide-img">
                                            <img src="img/smartgame/iqtwist.jpg" alt="" />
                                            <div class="overlay">
                                              <a href="#" class="buy-btn">Thêm vào giỏ</a>
                                            </div>
                                        </div>
                                        <div class="detail-box">
                                            <div class="type">
                                              <a href="#">Smartgames</a>
                                              <span>Thử thách IQ Twist</span>
                                            </div>
                                            <a href="#" class="price">450000</a>
                                        </div>
                                    </div>
                                </li>
                                <li class="product">
                                    <div class="box">
                                        <div class="slide-img">
                                            <img src="img/smartgame/iqxoxo.jpg" alt="" />
                                            <div class="overlay">
                                              <a href="#" class="buy-btn">Thêm vào giỏ</a>
                                            </div>
                                        </div>
                                        <div class="detail-box">
                                            <div class="type">
                                              <a href="#">Smartgames</a>
                                              <span>Thử thách IQ XOXO</span>
                                            </div>
                                            <a href="#" class="price">450000</a>
                                        </div>
                                    </div>
                                </li>
                                <li class="product">
                                    <div class="box">
                                        <div class="slide-img">
                                            <img src="img/smartgame/iqblox.jpg" alt="" />
                                            <div class="overlay">
                                              <a href="#" class="buy-btn">Thêm vào giỏ</a>
                                            </div>
                                        </div>
                                        <div class="detail-box">
                                            <div class="type">
                                              <a href="#">Smartgames</a>
                                              <span>Thử thách IQ Blox</span>
                                            </div>
                                            <a href="#" class="price">450000</a>
                                        </div>
                                    </div>
                                </li>
                                <li class="product">
                                    <div class="box">
                                        <div class="slide-img">
                                            <img src="img/smartgame/iqlink.jpg" alt="" />
                                            <div class="overlay">
                                              <a href="#" class="buy-btn">Thêm vào giỏ</a>
                                            </div>
                                        </div>
                                        <div class="detail-box">
                                            <div class="type">
                                              <a href="#">Smartgames</a>
                                              <span>Thử thách IQ Link</span>
                                            </div>
                                            <a href="#" class="price">450000</a>
                                        </div>
                                    </div>
                                </li>
                                <li class="product">
                                    <div class="box">
                                        <div class="slide-img">
                                            <img src="img/smartgame/iqfocus.jpg" alt="" />
                                            <div class="overlay">
                                              <a href="#" class="buy-btn">Thêm vào giỏ</a>
                                            </div>
                                        </div>
                                        <div class="detail-box">
                                            <div class="type">
                                              <a href="#">Smartgames</a>
                                              <span>Thử thách IQ Focus </span>
                                            </div>
                                            <a href="#" class="price">450000</a>
                                        </div>
                                    </div>
                                </li>
                                <li class="product">
                                    <div class="box">
                                        <div class="slide-img">
                                            <img src="img/smartgame/iqarrows.jpg" alt="" />
                                            <div class="overlay">
                                              <a href="#" class="buy-btn">Thêm vào giỏ</a>
                                            </div>
                                        </div>
                                        <div class="detail-box">
                                            <div class="type">
                                              <a href="#">Smartgames</a>
                                              <span>Thử thách IQ Arrows </span>
                                            </div>
                                            <a href="#" class="price">450000</a>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="danhmuc">
                    <div class="heading">
                        <center>
                            <h3>Đồ chơi nắp ghép</h3>
                            <a href="#">Xem thêm</a>
                        </center>
                    </div>
                    <div class="slider">
                        <ul class="slide">
                            <li class="product">
                                <div class="box">
                                    <div class="slide-img">
                                        <img src="img/lego/lego1.jpg" alt="" />
                                        <div class="overlay">
                                          <a href="#" class="buy-btn">Thêm vào giỏ</a>
                                        </div>
                                    </div>
                                    <div class="detail-box">
                                        <div class="type">
                                          <a href="#">Lego</a>
                                          <span>Bộ vũ khí Ninja Jay</span>
                                        </div>
                                        <a href="#" class="price">450000</a>
                                    </div>
                                </div>
                            </li>
                            <li class="product">
                                <div class="box">
                                    <div class="slide-img">
                                        <img src="img/lego/lego2.jpg" alt="" />
                                        <div class="overlay">
                                          <a href="#" class="buy-btn">Thêm vào giỏ</a>
                                        </div>
                                    </div>
                                    <div class="detail-box">
                                        <div class="type">
                                          <a href="#">Lego</a>
                                          <span>Bộ gạch classic</span>
                                        </div>
                                        <a href="#" class="price">450000</a>
                                    </div>
                                </div>
                            </li>
                            <li class="product">
                                <div class="box">
                                    <div class="slide-img">
                                        <img src="img/lego/lego3.jpg" alt="" />
                                        <div class="overlay">
                                          <a href="#" class="buy-btn">Thêm vào giỏ</a>
                                        </div>
                                    </div>
                                    <div class="detail-box">
                                        <div class="type">
                                          <a href="#">Lego</a>
                                          <span>Đội cảnh sách chó</span>
                                        </div>
                                        <a href="#" class="price">450000</a>
                                    </div>
                                </div>
                            </li>
                            <li class="product">
                                <div class="box">
                                    <div class="slide-img">
                                        <img src="img/lego/lego4.jpg" alt="" />
                                        <div class="overlay">
                                          <a href="#" class="buy-btn">Thêm vào giỏ</a>
                                        </div>
                                    </div>
                                    <div class="detail-box">
                                        <div class="type">
                                          <a href="#">Lego</a>
                                          <span>Bộ lắp ráp công trường</span>
                                        </div>
                                        <a href="#" class="price">450000</a>
                                    </div>
                                </div>
                            </li>
                            <li class="product">
                                <div class="box">
                                    <div class="slide-img">
                                        <img src="img/lego/lego5.jpg" alt="" />
                                        <div class="overlay">
                                          <a href="#" class="buy-btn">Thêm vào giỏ</a>
                                        </div>
                                    </div>
                                    <div class="detail-box">
                                        <div class="type">
                                          <a href="#">Lego</a>
                                          <span>Biệt thự gia đình Andrea</span>
                                        </div>
                                        <a href="#" class="price">450000</a>
                                    </div>
                                </div>
                            </li>
                            <li class="product">
                                <div class="box">
                                    <div class="slide-img">
                                        <img src="img/lego/lego6.jpg" alt="" />
                                        <div class="overlay">
                                          <a href="#" class="buy-btn">Thêm vào giỏ</a>
                                        </div>
                                    </div>
                                    <div class="detail-box">
                                        <div class="type">
                                          <a href="#">Lego</a>
                                          <span>Đội khám phá Bắc Cực</span>
                                        </div>
                                        <a href="#" class="price">450000</a>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </main>
        <!-- footer -->
      <footer>
         <div class="container">
            <!--Bắt Đầu Nội Dung Giới Thiệu-->
            <div class="noi-dung about">
               <h2>Về Chúng Tôi</h2>
               <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>
            </div>
            <!--Kết Thúc Nội Dung Giới Thiệu-->
            <!--Bắt Đầu Nội Dung Đường Dẫn-->
            <div class="noi-dung links">
               <h2>Đường Dẫn</h2>
               <ul>
                  <li><a href="#">Trang Chủ</a></li>
                  <li><a href="#">Sản phẩm</a></li>
                  <li><a href="#">Thông Tin</a></li>
                  <li><a href="#">Điều Kiện Chính Sách</a></li>
               </ul>
            </div>
            <!--Kết Thúc Nội Dung Đường Dẫn-->
            <!--Bắt Đâu Nội Dung Liên Hệ-->
            <div class="noi-dung contact">
               <h2>Thông Tin Liên Hệ</h2>
               <ul class="info">
                  <li>
                     <span><i class="fa fa-map-marker"></i></span>
                     <span>
                     Đường Số 1<br />
                     Quận 1, Thành Phố Hồ Chí Minh<br />
                     Việt Nam
                     </span>
                  </li>
                  <li>
                     <span><i class="fa fa-phone"></i></span>
                     <p>
                        <a href="#">+84 123 456 789</a>
                        <br />
                        <a href="#">+84 987 654 321</a>
                     </p>
                  </li>
                  <li>
                     <span><i class="fa fa-envelope"></i></span>
                     <p><a href="#">kingtoy@gmail.com</a></p>
                  </li>
               </ul>
            </div>
            <!--Kết Thúc Nội Dung Liên Hệ-->
         </div>
      </footer>
    </form>
    <script src="js/main.js"></script>
</body>
</html>
