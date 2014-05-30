#---
# Excerpted from "Agile Web Development with Rails",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/rails4 for more book information.
#---
module ApplicationHelper
  def hidden_div_if(condition, attributes = {}, &block)
    if condition
      attributes["style"] = "display:none"
    end
    content_tag("div", attributes, &block)
  end

  # converts
  # "string with _link_ in the middle." to
  # "string with #{link_to('link', link_url, link_options)} in the middle."
  def string_with_link(str, link_url, link_options = {})
    match = str.match(/__([^_]{2,30})__/)
    if !match.blank?
      raw($` + link_to($1, link_url, link_options) + $')
    else
      raise "string_with_link: No place for __link__ given in #{str}" if Rails.env.test?
      nil
    end
  end
end
