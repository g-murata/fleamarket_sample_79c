class DeletePhoneNumberUniqIndexFromUserAddresses < ActiveRecord::Migration[6.0]
  def change
    remove_index :user_addresses, :phone_number
  end
end
