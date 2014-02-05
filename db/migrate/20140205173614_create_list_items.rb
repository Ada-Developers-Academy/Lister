class CreateListItems < ActiveRecord::Migration
  def change
    create_table :list_items do |t|
      t.string :description
      t.integer :list_id

      t.timestamps
    end
  end
end
