class User < ActiveRecord::Base
   attr_accessor :password
   validates :password, :confirmation => true, :length => 6..8, :on => :create

   require 'digest/sha1'
   before_save :encrypt_password
   after_save :clear_password
	
	def encrypt_password
		if password.present?
			self.salt = Digest::SHA1.hexdigest("encrypt your password #{password}")
			self.encrypt_password = Digest::SHA1.hexdigest("encrypt again with #{password}")
		end
	end

	def clear_password
		self.password = nil
	end
   attr_accessible :username, :email, :password, :password_confirmation
end
