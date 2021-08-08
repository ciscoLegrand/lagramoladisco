import { Controller } from 'stimulus'
//import Swiper from 'https://cdn.skypack.dev/swiper';
import Swiper from 'https://unpkg.com/swiper@v6.5.4/swiper-bundle.esm.browser.min.js'

export default class extends Controller {
    static targets = [  "opinions" ]

    connect() {
        this.opinionSlider = new Swiper(this.opinionsTarget, {
            height:'300px',
            loop:true,
            spaceBetween: 30,
            slidesPerView: 3,
            navigation: {
                nextEl: '.swiper-button-next',
                prevEl: '.swiper-button-prev',
            },  
        });
    }

    disconnect() {
        this.opinionSlider.destroy()
        this.opinionSlider = undefined
    }
}