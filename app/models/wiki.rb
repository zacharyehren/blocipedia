class Wiki < ActiveRecord::Base
  belongs_to :user
  has_many :collaborators
  has_many :users, through: :collaborators
  # wiki.user => the wiki creator
  # wiki.collaborators => actual collaborator models, which is pretty much useless
  # wiki.users -> the wiki collaborators
  before_create :create_collaborator

  private

  def create_collaborator(email)
    wiki.users << email.id
  end
end
