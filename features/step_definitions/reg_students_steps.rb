#background

Given(/^the following students exist:$/) do |table|
    table.hashes.each do |student|
        Student.create(student)
    end
end
Then (/I should see all the students/) do
  students = Student.all
  students.each do |student|
    step %{I should see "#{student.score}"}
  end
end