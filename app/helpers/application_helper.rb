module ApplicationHelper

  def markdown(text)
    options = {
      filter_html: true,
      hard_wrap: true,
      link_attributes: { rel: 'nofollow', target: "_blank" },
      space_after_headers: true,
      fenced_code_blocks: true
    }

    extensions = {
      autolink: true,
      superscript: true,
      disable_indented_code_blocks: true
    }


    renderer = Redcarpet::Render::HTML.new(options)
    markdown = Redcarpet::Markdown.new(renderer, extensions)

    markdown.render(text).html_safe
  end

  def downgrade_wiki
    current_user.wikis.where(private: true).update_all(private: false)
    # private_wikis = current_user.wikis.where(:private, true)
    # private_wikis.each do |p|
    #   p.update_attributes(:private, false)
    # end
  end 
end
