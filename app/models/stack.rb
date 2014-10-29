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
end
