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
#  dimensions         :string(255)
#

class Artwork < ActiveRecord::Base

  validates_presence_of :artist, :title, :art_type, :image
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

  has_attached_file :image, styles: {
    thumb: "150x>",
    small: "300x>",
    medium: "450x>",
    large: "900x>"
  }

  before_save :extract_dimensions
  serialize :dimensions

  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  def scaled_height_by_width(scaled_width)
    width, height = self.dimensions
    return height if width <= scaled_width
    scale_factor = (scaled_width / width.to_f)
    Integer(height * scale_factor)
  end

  private

  def extract_dimensions
    tempfile = image.queued_for_write[:original]
    unless tempfile.nil?
      geometry = Paperclip::Geometry.from_file(tempfile)
      self.dimensions = [geometry.width.to_i, geometry.height.to_i]
    end
  end

end
