class AddListColumns < ActiveRecord::Migration
  def change
    add_column :lists, :name, :string
    add_column :lists, :user_id, :integer
  end
end
