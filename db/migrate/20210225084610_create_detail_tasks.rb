class CreateDetailTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :detail_tasks do |t|
      t.string     :title,               null:false
      t.references :task_category,       foregin_key: true
      t.references :user,                foregin_key: true
      t.text       :description,         null:false
      t.date       :deadline,            null:false
      t.integer    :state_id,            null:false
      t.timestamps
    end
  end
end
