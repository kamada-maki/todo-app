class TaskCategory < ApplicationRecord
  belongs_to :user
  with_options presence: true do
    validates :title
    validates :description
    validates :deadline
    validates :state
  end
end