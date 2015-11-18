class Entry < ActiveRecord::Base
  validates :hours, :minutes, numericality: {only_integer: true}
  validates :date, :project_id, presence: true
  belongs_to :project
end
