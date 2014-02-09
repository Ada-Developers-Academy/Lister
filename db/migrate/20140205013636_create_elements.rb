class CreateElements < ActiveRecord::Migration
  def change
    create_table :elements do |t|
      t.integer :list_id
      t.text :body

      t.timestamps
    end
  end
end
