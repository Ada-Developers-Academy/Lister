class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :itemname
      t.string :list_id

      t.timestamps
    end
  end
end
