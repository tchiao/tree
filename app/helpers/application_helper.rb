module ApplicationHelper
  def error_message(errors, type)
    if errors.any?
      content_tag :div, "Sorry, this field cannot be blank!", class: "#{type}-error-field"
    end
  end

  def error_border(errors)
    if errors.any?
      'error-border'
    end
  end
end
