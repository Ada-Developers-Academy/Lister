class ChangeListUserIdColumnType < ActiveRecord::Migration
  def change
  rename_column :lists, :user_id, :user_id_string
  add_column :lists, :user_id, :integer

  List.reset_column_information
  List.find_each { |e| e.update_attribute(:user_id, e.user_id_string) }
  remove_column :lists, :user_id_string
  end
end
