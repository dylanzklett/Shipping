class Boat < ActiveRecord::Base
	belongs_to :user
	has_one :job
	validates :name, uniqueness: true, presence: true
end
