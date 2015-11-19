module ApplicationHelper

  def flash_message
    if flash[:alert]  
      display_message(:alert)
    elsif flash[:notice]
      display_message(:notice)
    end
  end

  def project_total_hours(project)
    project.total_hours_in_month(Date.current.mon, Date.current.year)
  end

  private

  def display_message(type)
    content_tag :div, class: "message #{type}" do
      content_tag :p do
        flash[type]
      end
    end
  end

end