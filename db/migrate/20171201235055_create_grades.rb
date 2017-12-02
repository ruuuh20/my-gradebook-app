class CreateGrades < ActiveRecord::Migration[5.1]
  def change
    create_table :grades do |t|
      t.integer :score
      t.integer :assignment_id
      t.integer :user_id

      t.timestamps
    end
  end
end
