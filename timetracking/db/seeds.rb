(1..25).each do |index|
  Project.create(name: "Project #{index}", description: "Description of the project #{index}")
end

(1..50).each do |index|
  random = Random.new
  Entry.create(project_id: random.rand(25), hours: random.rand(1), minutes: random.rand(60), comment: "entry #{index}", date: Date.current)
end