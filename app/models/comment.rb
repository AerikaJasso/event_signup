class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validates :message, presence: true
  validates :message, length: { in: 2..500 }
end
