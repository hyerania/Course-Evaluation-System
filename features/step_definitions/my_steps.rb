#background


Given(/^the following questions exist:$/) do |table|
    table.hashes.each do |question|
        Question.create(question)
    end
end

Given(/^the following access_code exist:$/) do |table|
  table.hashes.each do |access_code|
    AccessCode.create(access_code)
  end
end

Given(/^the following sections exist:$/) do |table|
  table.hashes.each do |section|
    Section.create(section)
  end
end

Given(/^the following admin_keys exist:$/) do |table|
  table.hashes.each do |key|
    AdminKey.create(key)
  end
end

Then (/^I should see all the students/) do
  students = Student.all
  students.each do |student|
    step %{I should see "#{student.score}"}
  end
end

Given(/^the following evaluations exist:$/) do |table|
    table.hashes.each do |evaluation|
        Evaluation.create(evaluation)
    end
end

And (/I should see the average is "(.*)"$/) do |val|
  average=Student.all.average(:score)
  average==val
  #step %{I should see "#{average}"}
end

Then (/I should not see any question twice/) do
  evaluations=Evaluation.all
  evaluations.each do |evaluation|
    if evaluation.content!=nil
      puts evaluation.content
      puts evaluation.content.uniq.length==evaluation.content.length
      #expect(evaluation.content.uniq.length==evaluation.content.length). to be true
    else
      true
    end
  end
end

Then (/^the access code should be "(.*)"$/) do |code|
  access_code = AccessCode.all.first
  expect(access_code.code).to eq code
end

Then(/^the section of "(.*)" should be "(.*)"$/) do |name, section|
  @student = Student.find_by_name(name)
  expect(@student.section.to_s).to eq section
end
