class AddUserRefToRestaurants < ActiveRecord::Migration
  def change
    add_reference :restaurants, :user, foreign_key: true
  end
end
