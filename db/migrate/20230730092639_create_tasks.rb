class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.belongs_to :user
      t.string :title
      t.text :description
      t.string :due_date

      t.timestamps
    end
  end
end
