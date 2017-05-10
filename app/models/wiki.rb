class Wiki < ActiveRecord::Base
  belongs_to :user

  def title
    if self.private?
      "#{self[:title]} (Private Wiki)"
    else
      self[:title]
    end
  end
end
