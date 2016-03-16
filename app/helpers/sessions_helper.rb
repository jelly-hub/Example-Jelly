module SessionsHelper

	# Log In user
	# => put the user id into the session hash
	def log_in(user)
		session[:user_id] = user.id
	end

	# Lot out user
	# => delete user id from session and reset current_user
	def log_out
		session.delete(:user_id)
		@current_user = nil
	end

	# Return current User
	def current_user
		@current_user ||= User.find_by(id: session[:user_id])
	end

	# Check if you are logged in
	def logged_in?
		!current_user.nil?
	end

	# Check if role of the logged in user is "admin"
	def admin_present?
		role = current_user.role
		return role.downcase == "admin"
	end
end
