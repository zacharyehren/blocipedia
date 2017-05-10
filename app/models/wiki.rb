class Wiki < ActiveRecord::Base
  belongs_to :user
  has_many :collaborators
  has_many :users, through: :collaborators
  # wiki.user => the wiki creator
  # wiki.collaborators => actual collaborator models, which is pretty much useless
  # wiki.users -> the wiki collaborators


  def title
    if self.private?
      "#{self[:title]} (Private Wiki)"
    else
      self[:title]
    end
  end
end
