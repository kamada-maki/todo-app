class State < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '未完了（進行前）' },
    { id: 3, name: '未完了（進行中）' },
    { id: 4, name: '完了' },
  ]
  include ActiveHash::Associations
  has_many :task_categories
  end