# == Schema Information
#
# Table name: tweets
#
#  id         :integer          not null, primary key
#  status     :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  location   :text
#

class Tweet < ActiveRecord::Base
  validates_presence_of :status
  validates :status,
            presence: true

  belongs_to :zombie
end
