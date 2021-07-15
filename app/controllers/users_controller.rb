class UsersController < ApplicationController
  load_and_authorize_resource
  def index
    # @users = User.all
    @pagy, @users = pagy(User.all, items: 10)
  end
end
