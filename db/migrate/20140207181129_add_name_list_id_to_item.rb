class AddNameListIdToItem < ActiveRecord::Migration
  def change
    add_column :items, :name, :string
    add_column :items, :list_id, :integer
  end
end
