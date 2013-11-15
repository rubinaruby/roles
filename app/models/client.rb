include ApplicationHelper
class Client < ActiveRecord::Base
  has_one :user, as: :role, dependent: :destroy 
  accepts_nested_attributes_for :user
  has_one :sub_domain
  has_many :team_leaders
  has_many :workers
  has_many :categories
  has_many :services
end
