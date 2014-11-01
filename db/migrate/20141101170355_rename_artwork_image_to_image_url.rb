class RenameArtworkImageToImageUrl < ActiveRecord::Migration
  def change
    rename_column :artworks, :image, :image_url
  end
end
