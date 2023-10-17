import Swiper from 'swiper/swiper-bundle';
import 'swiper/swiper-bundle.min.css';

window.addEventListener('load', () => {
  // トップページ以外の場合、以下処理をスキップ
  if (location.pathname != '/') return;

  const mainVisualSwiper = new Swiper('#main-visual-swiper', {
    pagination: {
      el: ".main-visual .swiper-pagination",
      type: "progressbar",
      progressbarOpposite: true
    },
    autoplay: {
      delay: 5000,
    },
    speed: 2000,
    loop: true,
    parallax: true,
    allowTouchMove: false
  });

  const newItemsSwiper = new Swiper('#new-items-swiper', {
    slidesPerView: 3.25,
    spaceBetween: 20,
    grabCursor: true
  });
});