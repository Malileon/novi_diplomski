class AddAdminColumnToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :is_admin, :integer, null: false, default: 0
  end
end
