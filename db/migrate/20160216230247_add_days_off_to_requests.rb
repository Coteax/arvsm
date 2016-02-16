class AddDaysOffToRequests < ActiveRecord::Migration
  def change
      add_column :requests, :days_off , :integer
  end
end
