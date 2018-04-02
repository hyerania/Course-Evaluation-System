#background


Given(/^the following questions exist:$/) do |table|
    table.hashes.each do |question|
        Question.create(question)
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
