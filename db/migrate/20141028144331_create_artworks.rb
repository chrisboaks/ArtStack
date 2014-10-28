class CreateArtworks < ActiveRecord::Migration
  def change
    create_table :artworks do |t|
      t.string :image, null: false
      t.references :uploader, index: true
      t.references :artist, index: true
      t.string :title, default: "Unknown"
      t.string :art_type, null: false

      t.timestamps
    end

    add_index :artworks, :art_type
  end
end
