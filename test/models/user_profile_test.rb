# == Schema Information
#
# Table name: user_profiles
#
#  id                  :integer          not null, primary key
#  username            :text
#  first_name          :text
#  last_name           :text
#  location            :text
#  bio                 :text
#  is_artist           :boolean
#  is_art_professional :boolean
#  is_collector        :boolean
#  is_art_lover        :boolean
#  is_curator          :boolean
#  is_art_writer       :boolean
#  is_student          :boolean
#  website             :text
#  user_id             :integer
#  created_at          :datetime
#  updated_at          :datetime
#

require 'test_helper'

class UserProfileTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
