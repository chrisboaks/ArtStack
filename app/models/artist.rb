# == Schema Information
#
# Table name: artists
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  created_at :datetime
#  updated_at :datetime
#

class Artist < ActiveRecord::Base

  validates_presence_of :name

  has_many :artworks

  has_many :follows, :as => :followable

end
