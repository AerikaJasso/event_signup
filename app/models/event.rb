class Event < ApplicationRecord
  belongs_to :user
  has_many :users_events
  has_many :comments

  validates :name,	:presence => true, length: { minimum: 6 }

  validates :city,	:presence => true

  validates :state,	:presence => true

  validates	:date,	:presence => true

  validates :time,	:presence => true 
  
  validate :event_future_date, on: :create

  def event_future_date
  	if date.present? && date < Date.today
  		errors.add(:date, "can't be in the past")
  	end
  end
end
