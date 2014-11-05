class AddDimensionsToArtworks < ActiveRecord::Migration
  def change
    add_column :artworks, :dimensions, :string
  end
end
