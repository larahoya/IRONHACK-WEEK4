Project.create(name: 'Project 1', description: 'Description of my project')
Project.create(name: 'Project 2', description: 'Description of my project')

Colleague.create(name: 'Name 1')
Colleague.create(name: 'Name 2')
Colleague.create(name: 'Name 3')

(0..20).each do |index|
  Task.create(name: "Task #{index}", hours: rand(9), colleague_id: rand(3)+1, project_id: rand(2)+1)
end