Given (/^the following questions exist in questions:/) do |questions_table|
  questions_table.hashes.each do |question|
      Question.create!(question)
  end
  expect(Question.all.count).to eq 1
end

Then("the question {int} answer should be {int}") do |int, int2|
  questions = Question.where(qid: int)
  question = questions[0]
  question.getCorrectAnswerNum.should eq(int2)
end

When("I delete question {string}") do |string|
  qid = string.to_i
  questions = Question.where(qid: qid)
  question = questions[0]
  question.delete
end