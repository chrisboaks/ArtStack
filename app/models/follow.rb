class Follow < ActiveRecord::Base
  belongs_to :follower, class_name: 'User'
  belongs_to :followable, :polymorphic => true

  validates :follower_id, :uniqueness => { :scope => [:followable_id, :followable_type]}
end
