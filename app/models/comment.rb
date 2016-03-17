class Comment < ActiveRecord::Base
	
	# A Comment is been written by one User
	# => 1 to x Association, as a User can write many Comments
	# => On User Model, write: has_many :comments
	belongs_to :user

	# A Comment can be written to either a Location, or a Food
	# => 1 to x Association
	# => on Location and Food Model, write: has_many :comments, :as => :commentable, :dependent => :destroy
	# => Comments will be deleted on deleteing their associated Location
	belongs_to :commentable, :polymorphic => true
end
