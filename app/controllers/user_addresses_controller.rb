class UserAddressesController < ApplicationController
  def edit
    @user_address = UserAddress.find(params[:id])
  end

  def update
    @user_address = UserAddress.find(params[:id])
    if @user_address.update(user_address_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def user_address_params
    params.require(:user_address).permit(:address_last_name, :address_first_name, :address_last_name_kana, :address_first_name_kana, :zip_code, :prefecture_id, :city, :street, :building_name, :phone_number)
  end

end
