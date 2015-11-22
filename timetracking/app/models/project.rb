class Project < ActiveRecord::Base
  validates :name, uniqueness: true
  validates :name, presence: true
  validates :name, length: {maximum: 30}
  validates :name, format: {with: /\A[a-zA-ZÑñ0-9\ ]+\z/}
  has_many :entries
  has_many :participations
  has_many :people, through: :participations

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

  def total_hours_in_month(month, year)
    selected_entries = entries.select do |entry|
      entry.date.mon == month && entry.date.year == year
    end
    total_minutes = selected_entries.reduce(0) do |sum, entry|
      sum += (entry.hours*60 + entry.minutes)
    end
    return total_minutes/60
  end

  # def total_time_in_month(month, year)
  #   selected_entries = entries.select do |entry|
  #     entry.date.mon == month && entry.date.year == year
  #   end
  #   total_minutes = selected_entries.reduce(0) do |sum, entry|
  #     sum += (entry.hours*60 + entry.minutes)
  #   end
  #   hours = total_minutes/60
  #   minutes = total_minutes%60
  #   return "#{hours}:#{minutes}"
  # end

end
