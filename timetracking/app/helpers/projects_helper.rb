module ProjectsHelper

  def project_total_hours(project)
    project.total_hours_in_month(Date.current.mon, Date.current.year)
  end

end
