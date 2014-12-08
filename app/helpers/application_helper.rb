module ApplicationHelper
  def error_message(errors, type)
    if errors.any?
      if errors.include?("has already been taken")
        content_tag :div, "Sorry, an event with this name already exists!", class: "#{type}-error-field"
      else
        content_tag :div, "Sorry, this field cannot be blank!", class: "#{type}-error-field"
      end
    end
  end

  def error_border(errors)
    if errors.any?
      'error-border'
    end
  end
end
