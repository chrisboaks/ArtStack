class RenameBooleanUserProfileColumns < ActiveRecord::Migration
  def change
    rename_column :user_profiles, :artist,           :is_artist
    rename_column :user_profiles, :art_professional, :is_art_professional
    rename_column :user_profiles, :collector,        :is_collector
    rename_column :user_profiles, :art_lover,        :is_art_lover
    rename_column :user_profiles, :curator,          :is_curator
    rename_column :user_profiles, :art_writer,       :is_art_writer
    rename_column :user_profiles, :student,          :is_student
  end
end
