class Worker < ActiveRecord::Base
  has_one :user, as: :role, dependent: :destroy 
  accepts_nested_attributes_for :user
  belongs_to :client
  belongs_to :team_leader

  has_many :allocations
  has_many :services, through: :allocations
  
end
