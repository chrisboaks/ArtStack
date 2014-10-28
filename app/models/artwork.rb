# == Schema Information
#
# Table name: artworks
#
#  id         :integer          not null, primary key
#  image      :string(255)      not null
#  artist_id  :integer
#  title      :string(255)      default("Unknown")
#  type       :string(255)      not null
#  created_at :datetime
#  updated_at :datetime
#

class Artwork < ActiveRecord::Base

  validates_presence_of :artist, :title, :art_type

  belongs_to :artist

end
