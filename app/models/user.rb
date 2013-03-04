class User < ActiveRecord::Base
   require 'digest/sha1'
   validates :password, :confirmation => true, :length => 6..8, :on => :create

   attr_accessor :password

   before_save :encrypt_password
   after_save :clear_password
	
	def encrypt_password
		if password.present?
			self.salt = Digest::SHA1.hexdigest("encrypt your password {password}")
			self.encrypted_password = Digest::SHA1.hexdigest("Adding #{salt} to {password}")
		end
	end

	def clear_password
		self.password = nil
	end
   attr_accessible :username, :email, :password, :password_confirmation, :encrypted_password
end
