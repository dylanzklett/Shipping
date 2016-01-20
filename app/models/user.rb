class User < ActiveRecord::Base
	# has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
 #  	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
	has_many :boats
	has_many :jobs
	validates :username, uniqueness: true, presence: true, length: {in: 6..20}
	has_secure_password
	validates_presence_of :password, on: :create
	validates_confirmation_of :password
end
