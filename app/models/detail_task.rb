class DetailTask < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :state
  belongs_to :user
  belongs_to :task_category
  with_options presence: true do
    validates :title
    validates :description
    validates :deadline
  end
  validates :user_id, presence: true
  validates :state_id, numericality: { other_than: 1 }
end
