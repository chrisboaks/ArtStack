# == Schema Information
#
# Table name: stacks
#
#  id         :integer          not null, primary key
#  artwork_id :integer
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Stack < ActiveRecord::Base
  belongs_to :artwork
  belongs_to :user

  validates_presence_of :user_id, :artwork_id
end
