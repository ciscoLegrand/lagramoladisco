class UsersController < ApplicationController
  load_and_authorize_resource
  def index
    result = User.order(params[:sort])
    @pagy, @users = pagy(result, items: 10)

    respond_to  do |format|
      format.html
      format.json {
        render json: {entries: render_to_string(partial: 'user_table', formats: [:html]), pagination: view_contexxt.pagy_nav(@pagy)}
      }
    end
  end
end
