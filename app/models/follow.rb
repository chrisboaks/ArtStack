# == Schema Information
#
# Table name: follows
#
#  id              :integer          not null, primary key
#  follower_id     :integer
#  followable_id   :integer
#  followable_type :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#

class Follow < ActiveRecord::Base
  belongs_to :follower, class_name: 'User'
  belongs_to :followable, :polymorphic => true

  validates :follower_id, :uniqueness => { :scope => [:followable_id, :followable_type]}

  validate :check_for_self_follow

  def check_for_self_follow
    if follower_id == followable_id && followable_type == "User"
      errors.add(:follow, "can't follow yourself")
    end
  end

end
