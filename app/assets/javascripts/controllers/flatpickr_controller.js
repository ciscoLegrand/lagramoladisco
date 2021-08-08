import { Controller } from 'stimulus';
import Flatpickr from 'https://cdn.skypack.dev/stimulus-flatpickr';

export default class extends Flatpickr {
  change(selectedDates, dateStr) {
    console.log(dateStr);
  }
}
