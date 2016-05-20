class AddTasksRefToUser < ActiveRecord::Migration
  def change
    add_reference :users, :task, index: true, foreign_key: true
  end
end
