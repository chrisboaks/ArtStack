# == Schema Information
#
# Table name: follows
#
#  id              :integer          not null, primary key
#  follower_id     :integer
#  followable_id   :integer
#  followable_type :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#

require 'test_helper'

class FollowTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
