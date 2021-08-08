import LightBox from 'https://cdn.skypack.dev/lightbox';
import { Controller } from 'stimulus';

export default class extends Controller {
  static targets = ['image']
  connect() {
    this.lightImage = new LightBox(this.imageTarget,{
      thumbnail: true,
      animateThumb: false,
      showThumbByDefault: false
    })
  }
}