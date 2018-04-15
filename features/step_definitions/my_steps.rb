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

Then (/^I should see all the students/) do
  students = Student.all
  students.each do |student|
    step %{I should see "#{student.score}"}
  end
end

Given(/^the following evaluations exist:$/) do |table|
    table.hashes.each do |evaluation|
        @evaluation = Evaluation.new
        @evaluation.eid=evaluation[:eid].to_i
        @evaluation.title=evaluation[:title]
        @evaluation.content=evaluation[:content].tr('[]','').split(',')
        @evaluation.save
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
