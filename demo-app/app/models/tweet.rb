class Tweet < ActiveRecord::Base

  # Define the attributes that must always be available
  validates_presence_of :status
  validates_presence_of :location

  # or like this
  validates :status,
            presence: true

  belongs_to :zombie
end
