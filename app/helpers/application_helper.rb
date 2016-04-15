module ApplicationHelper

  def t(key, options = {})
    result = translate(key, options)
    if defined?(current_user) && current_user && current_user.translator?
      if result.is_a?(Array)
        result.map {|res| build_editable_tag(key, res) }
      else
        build_editable_tag(key, result)
      end
    else
      result
    end
  end

  private

  def build_editable_tag(key, result)
    "<span class=\"editable trans-edit\" id=\"#{key}\" style=\"display:inline;\">#{result}</span>".html_safe
  end

end
