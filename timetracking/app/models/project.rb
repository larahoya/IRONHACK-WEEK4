class Project < ActiveRecord::Base
  has_many :entries

  def self.iron_find(params)
    where(params).first
  end

  def self.clean_old
    where('created_at < ? ', 1.week.ago).destroy_all
  end

  def self.last_created_projects(number)
    Project.order('created_at DESC').limit(number)
  end

  def self.first_updated_projects(number)
    Project.order('updated_at ASC').limit(number)
  end

end
