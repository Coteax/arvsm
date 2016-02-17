class AddUserAssignedToRequests < ActiveRecord::Migration
  def change
    add_reference :requests, :user_assigned, index: true
  end
end
