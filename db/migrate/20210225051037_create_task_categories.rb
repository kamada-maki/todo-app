class CreateTaskCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :task_categories do |t|
      t.string     :title,               null:false
      t.references :user,                foregin_key: true
      t.text       :description,         null:false
      t.date       :deadline,            null:false
      t.integer    :state_id,            null:false
      t.timestamps
    end
  end
end
