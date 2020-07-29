class UsersController < ApplicationController
  def show
    @user_address = UserAddress.find_by(user_id: current_user.id)
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path, notice: 'プロフィールを更新しました'
    else
      @user_address = UserAddress.find_by(user_id: current_user.id)
      render :show
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :last_name, :first_name, :last_name_kana, :first_name_kana, :birthday, :introduction, :email, :password)
  end
end
