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

require 'test_helper'

class TweetTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
