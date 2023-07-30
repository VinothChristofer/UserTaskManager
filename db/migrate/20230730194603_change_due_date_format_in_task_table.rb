class ChangeDueDateFormatInTaskTable < ActiveRecord::Migration[7.0]
  def change
    def up
      change_column :tasks, :due_date, :date
    end
  
    def down
      change_column :tasks, :due_date, :string
    end
  end
end
