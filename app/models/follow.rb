class Follow < ActiveRecord::Base
  belongs_to :follower, class_name: 'User', foreign_key: :follower_id
  belongs_to :followable

  validates :follower_id, :uniqueness => { :scope => [:followable_id, :followable_type]}
end
