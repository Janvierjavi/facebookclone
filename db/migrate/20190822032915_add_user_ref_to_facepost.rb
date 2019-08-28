class AddUserRefToFacepost < ActiveRecord::Migration[5.1]
  def change
    add_reference :faceposts, :user, foreign_key: true
  end
end
