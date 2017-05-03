class Wiki < ActiveRecord::Base
  belongs_to :user
  before_save :wiki_private

  private

  def wiki_private
    if self.private?
      self.title == "#{self.title} (Private Wiki)"
    end
  end
end
