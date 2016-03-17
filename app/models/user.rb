class User < ActiveRecord::Base
	# Users need a password to log in
	has_secure_password

	# Emails can only be used once, thus ensuring Users are unique
	validates :e_mail, uniqueness: true

	# A User can write many comments
	# => 1 to x Association
	# => on Comment model, write: belongs_to :user
	# => Comments will not be deleted when deleting their associated User 
	has_many :comments

	# A User can create many Locations which will then be posted.
	# => 1 to x Association
	# => On the Location Model, write: belongs_to :user
	has_many :locations

	# A User can create many Foods which will then be posted.
	# => 1 to x Association
	# => On the Food Model, write: belongs_to :user
	has_many :foods
end