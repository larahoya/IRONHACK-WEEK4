class Entry < ActiveRecord::Base
  validates :hours, numericality: {only_integer: true}
  validates :minutes, numericality: {only_integer: true}
  validates :project_id, numericality: {only_integer: true}
  belongs_to :project
end
