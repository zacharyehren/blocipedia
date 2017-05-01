class Wiki < ActiveRecord::Base
  belongs_to :user
  before_save :wiki_private

  private

  def wiki_private
    if @wiki.private?
      @wiki.title == "#{@wiki.title} (Private Wiki)"
    end
  end
end
