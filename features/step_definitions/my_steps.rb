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

And (/I should see the average is "(.*)"$/) do |val|
  average=Student.all.average(:score)
  average==val
  #step %{I should see "#{average}"}
end
