import { Controller } from 'stimulus'

export default class extends Controller {
  static target = ["users", "pagination"]
  scroll(){
    console.log(window.pageYOffset);
    let next_page = this.paginationTarget.querySelector("a[rel='next'")
    if(next_page == mull) { return }

    let url = next_page.href

    var body = document.body,
        html = document.documentElement
    
    var height = Math.max(body.scrollHeight, body.offsetHeight, html.clientHeight, html.scrollHeight, html.offsetHeight)

    if (window.pageYOffset >= height - window.innerHeight){
      console.log("this is the bottom page");
      this.loadMore(url)
    }

  }

  loadMore(url){
    Rails.ajax({
      type: 'GET',
      url: url,
      dataType: 'json',
      success: (data) => {
        // console.log(data);
        this.usersTarget.insertAdjacentHTML('beforeend', data.users)
        this.paginationTarget.innerHTML = data.pagination
      }
    })
  }
}