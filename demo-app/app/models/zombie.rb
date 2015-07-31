# == Schema Information
#
# Table name: zombies
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Zombie < ActiveRecord::Base
  has_many :tweets
end
