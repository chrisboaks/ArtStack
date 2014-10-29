# == Schema Information
#
# Table name: user_profiles
#
#  id               :integer          not null, primary key
#  username         :text
#  first_name       :text
#  last_name        :text
#  location         :text
#  bio              :text
#  artist           :boolean
#  art_professional :boolean
#  collector        :boolean
#  art_lover        :boolean
#  curator          :boolean
#  art_writer       :boolean
#  student          :boolean
#  website          :text
#  user_id          :integer
#  created_at       :datetime
#  updated_at       :datetime
#

require 'test_helper'

class UserProfileTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
