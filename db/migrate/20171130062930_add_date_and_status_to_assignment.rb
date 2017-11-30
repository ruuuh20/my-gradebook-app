class AddDateAndStatusToAssignment < ActiveRecord::Migration[5.1]
  def change
    add_column :assignments, :date, :date
    add_column :assignments, :status, :string
    add_column :assignments, :user_id, :integer
  end
end
