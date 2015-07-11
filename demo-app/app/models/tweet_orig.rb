class Tweet < ActiveRecord::Base

  validates_presence_of :status
  validates :status,
            presence: true

  belongs_to :zombie

end
