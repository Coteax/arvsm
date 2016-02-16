class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :position
      t.string :password_digest
      t.boolean :is_manager

      t.timestamps null: false
    end
  end
end
