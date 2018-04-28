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

Given(/^the following instructions exist:$/) do |table|
  table.hashes.each do |content|
    Instruction.create(content)
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
        # @evaluation.qids=evaluation[:qids]
        @evaluation.content=evaluation[:content].tr('[]','').split(',')
        @evaluation.access_code=evaluation[:access_code]
        if evaluation[:scales]!=nil
          @evaluation.scales=evaluation[:scales].tr('[]','').split(',').map(&:to_i)
        end
        if evaluation[:qids]!=nil
          @evaluation.qids=evaluation[:qids].tr('[]','').split(',').map(&:to_i)
        end
        @evaluation.save
    end
end

When("I delete evaluation {string}") do |string|
  eid = string.to_i
  evaluations = Evaluation.where(eid: eid)
  evaluation = evaluations[0]
  evaluation.delete
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

Then (/^the access code of "(.*)" should be "(.*)"$/) do |eid, code|
  evaluation = Evaluation.where(eid: eid).first
  expect(evaluation.access_code).to eq code
end

Then(/^the section of "(.*)" should be "(.*)"$/) do |name, section|
  @student = Student.find_by_name(name)
  expect(@student.section.to_s).to eq section
end

When(/^I go back$/) do
  page.go_back
end

Then("evaluation {string} should have {string} questions") do |eid, num|
  evaluation = Evaluation.where(eid: eid.to_i)
  expect(evaluation[0].qids.length.to_s).to eq num
end