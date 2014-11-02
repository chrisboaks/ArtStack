# == Schema Information
#
# Table name: artworks
#
#  id                 :integer          not null, primary key
#  uploader_id        :integer
#  artist_id          :integer
#  title              :string(255)      default("Unknown")
#  art_type           :string(255)      not null
#  created_at         :datetime
#  updated_at         :datetime
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer
#  image_updated_at   :datetime
#

class Artwork < ActiveRecord::Base

  validates_presence_of :artist, :title, :art_type
  validates :art_type, inclusion: { in: %w(
    painting
    photograph
    sculpture
    performance
    video
    installation
    drawing
    collage
    ) }

  belongs_to :artist
  belongs_to :uploader, class_name: 'User', foreign_key: :uploader_id
  has_many :stacks
  has_many :stacking_users, through: :stacks, source: :user
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/


end

