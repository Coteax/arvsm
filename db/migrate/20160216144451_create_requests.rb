class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :description
      t.string :response
      t.datetime :starting
      t.datetime :ending
      t.string :absense_type
      t.string :status

      t.timestamps null: false
    end
  end
end
