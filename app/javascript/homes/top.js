import Swiper from 'swiper/swiper-bundle';
import 'swiper/swiper-bundle.min.css';

window.addEventListener('load', () => {
  // トップページ以外の場合、以下処理をスキップ
  if (location.pathname != '/') return;

  const mainVisualSwiper = new Swiper('#main-visual-swiper', {
    pagination: {
      el: '.main-visual .swiper-pagination',
      type: 'progressbar',
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
    pagination: {
      el: '#new-items-swiper-pagination',
      type: 'progressbar'
    },
    slidesPerView: 1.25,
    breakpoints: {
      767: {
        slidesPerView: 1.75
      },
      992: {
        slidesPerView: 2.25
      },
      1200: {
        slidesPerView: 3.25
      }
    },
    autoplay: {
      delay: 2500,
      disableOnInteraction: false,
    },
    speed: 1500,
    spaceBetween: 20,
    grabCursor: true
  });
});