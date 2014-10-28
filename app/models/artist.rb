# == Schema Information
#
# Table name: artists
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  created_at :datetime
#  updated_at :datetime
#

class Artist < ActiveRecord::Base

  validates_presence_of :name

  has_many :artworks

  # def self.artist_id_of(name)
  #   @artist = Artist.find_by_name(name)
  #   if @artist
  #     return @artist.id
  #   else
  #     @artist = Artist.create(name: name)
  #     return @artist.id
  #   end
  # end

end