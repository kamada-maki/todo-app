class CreateDetailTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :detail_tasks do |t|

      t.timestamps
    end
  end
end
