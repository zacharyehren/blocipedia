class Wiki < ActiveRecord::Base
  belongs_to :user
  has_many :collaborators, through: :users
end
