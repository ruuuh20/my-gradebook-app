class AddCourseIdToAssignment < ActiveRecord::Migration[5.1]
  def change
    add_column :assignments, :course_id, :integer
  end
end
