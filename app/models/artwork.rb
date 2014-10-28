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

class Artwork < ActiveRecord::Base

  validates_presence_of :artist, :title, :art_type

  belongs_to :artist
  belongs_to :uploader, class_name: 'User', foreign_key: :uploader_id


end
