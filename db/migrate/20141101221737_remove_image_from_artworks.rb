class RemoveImageFromArtworks < ActiveRecord::Migration
  def change
    remove_column :artworks, :image, :text
  end
end
