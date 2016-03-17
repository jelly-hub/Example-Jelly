class Food < ActiveRecord::Base

	# A Food will be created and posted by a User
	# => 1 to x Association
	# => On the User Model, write: has_many :foods
	belongs_to :user

	# Foods can have many different Locations
	# Locations can have many different Foods
	# => x to x Association
	# => on Location model, write: has_and_belongs_to_many :foods
	has_and_belongs_to_many :locations

	# A Food can have many Comments
	# => 1 to x Association, as both Location and Food can have Comments
	# => on Comment Model, write: belongs_to :commentable, :polymorphic => true
	# => Comments will be deleted on deleteing their associated Location
	has_many :comments, :as => :commentable, :dependent => :destroy
end
