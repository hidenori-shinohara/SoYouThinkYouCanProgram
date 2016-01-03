class AddUsernamesToMatch < ActiveRecord::Migration
  def change
    add_column :matches, :created_by, :string
    add_column :matches, :joined_by, :string
  end
end
