const menu = document.querySelector('.menu-list');
const menuBtn = document.querySelector('.menu-btn');
const closeBtn = document.querySelector('.close-btn');
menuBtn.onclick = function () {
    menu.classList.add('active');
}
closeBtn.onclick = function () {
    menu.classList.remove('active');
}

var indexValue = 0;
function slideShow() {
    setTimeout(slideShow, 4000);
       var x;
   const img = document.querySelectorAll(".img-slide");
    for (x = 0; x < img.length; x++) {
        img[x].style.display = "none";
    }
    indexValue++;
    if (indexValue > img.length) { indexValue = 1 }
    img[indexValue - 1].style.display = "block";
}
slideShow();
