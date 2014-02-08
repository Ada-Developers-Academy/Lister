class RebuildsTables < ActiveRecord::Migration
  def change
    create_table :lists, force: true do |t|
      t.integer  :user_id
      t.string   :title
    end

    create_table :users, force: true do |t|
      t.string :username
      t.string :password
      t.string :email
      t.string :password_digest
    end
  end
end
