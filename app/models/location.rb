class Location < ActiveRecord::Base

	# A Location will be created and posted by a User
	# => 1 to x Association
	# => On the User Model, write: has_many :locations
	belongs_to :user

	# Locations can have many different Foods
	# Foods can have many different Locations
	# => x to x Association
	# => on Food model, write: has_and_belongs_to_many :locations
	has_and_belongs_to_many :foods

	# A Location can have many Comments
	# => 1 to x Association, tho both Location and Food can have Comments
	# => on Comment Model, write: belongs_to :commentable, :polymorphic => true
	# => Comments will be deleted on deleteing their associated Location
	has_many :comments, :as => :commentable, :dependent => :destroy
end
