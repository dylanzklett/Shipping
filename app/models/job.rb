class Job < ActiveRecord::Base
  belongs_to :user
  belongs_to :boat
  validates_presence_of :start, :end, :name, :cost, :cargo_description, on: :create
  validates :name, uniqueness: true, presence: true
  validates :cost, :numericality => { :greater_than => 1000 }
  validates :cargo_description, :length => {:minimum => 50 }
end
