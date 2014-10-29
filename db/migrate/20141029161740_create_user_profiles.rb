class CreateUserProfiles < ActiveRecord::Migration
  def change
    create_table :user_profiles do |t|
      t.text :username
      t.text :first_name
      t.text :last_name
      t.text :location
      t.text :bio
      t.boolean :artist
      t.boolean :art_professional
      t.boolean :collector
      t.boolean :art_lover
      t.boolean :curator
      t.boolean :art_writer
      t.boolean :student
      t.text :website
      t.references :user, index: true, unique: true

      t.timestamps
    end
  end
end
