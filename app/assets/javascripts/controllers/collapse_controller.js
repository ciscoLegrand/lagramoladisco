import { Controller } from 'stimulus'

export default class extends Controller {
    static values = { id: String }

    toggle(){
        const panel = document.getElementById(this.idValue)
        panel.classList.contains("open") 
            ? panel.classList.remove("open") 
            : panel.classList.add("open")
    }
}