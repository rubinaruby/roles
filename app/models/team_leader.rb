class TeamLeader < ActiveRecord::Base
  has_one :user, as: :role, dependent: :destroy 
  accepts_nested_attributes_for :user
  has_many :workers
  #belongs_to :client
end
