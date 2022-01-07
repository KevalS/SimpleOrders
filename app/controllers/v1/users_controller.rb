class V1::UsersController < ApplicationController
  def create
    @user = User.create(user_params)
  end

  private
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
