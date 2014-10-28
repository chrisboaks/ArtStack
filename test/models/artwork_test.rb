# == Schema Information
#
# Table name: artworks
#
#  id          :integer          not null, primary key
#  image       :string(255)      not null
#  uploader_id :integer
#  artist_id   :integer
#  title       :string(255)      default("Unknown")
#  art_type    :string(255)      not null
#  created_at  :datetime
#  updated_at  :datetime
#

require 'test_helper'

class ArtworkTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
