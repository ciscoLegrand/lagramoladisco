import { Controller } from 'stimulus'
//import Swiper from 'https://cdn.skypack.dev/swiper';
import Swiper from 'https://unpkg.com/swiper@v6.5.4/swiper-bundle.esm.browser.min.js'

export default class extends Controller {
    static targets = [  "opinions" ]

    connect() {
        this.opinionSlider = new Swiper(this.opinionsTarget, {
            height:'300px',
            loop:true,
            navigation: {
                nextEl: '.swiper-button-next',
                prevEl: '.swiper-button-prev',
            },
            breakpoints: {
                640: {
                    slidesPerView: 1,
                    spaceBetween: 10,
                },
                768: {
                    slidesPerView: 2,
                    spaceBetween: 20,
                },
                1243: {
                    slidesPerView: 3,
                    spaceBetween: 30,
                },
            }, 
        });
    }

    disconnect() {
        this.opinionSlider.destroy()
        this.opinionSlider = undefined
    }
}