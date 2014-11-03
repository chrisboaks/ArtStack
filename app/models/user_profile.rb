# == Schema Information
#
# Table name: user_profiles
#
#  id                  :integer          not null, primary key
#  username            :text
#  first_name          :text
#  last_name           :text
#  location            :text
#  bio                 :text
#  is_artist           :boolean
#  is_art_professional :boolean
#  is_collector        :boolean
#  is_art_lover        :boolean
#  is_curator          :boolean
#  is_art_writer       :boolean
#  is_student          :boolean
#  website             :text
#  user_id             :integer
#  created_at          :datetime
#  updated_at          :datetime
#

class UserProfile < ActiveRecord::Base

  validates_presence_of :user
  validates_uniqueness_of :user

  belongs_to :user

  def description
    traits = []
    traits << "Artist" if self.is_artist
    traits << "Art Professional" if self.is_art_professional
    traits << "Collector" if self.is_collector
    traits << "Art Lover" if self.is_art_lover
    traits << "Curator" if self.is_curator
    traits << "Art Writer" if self.is_art_writer
    traits << "Student" if self.is_student
    traits
  end

end
