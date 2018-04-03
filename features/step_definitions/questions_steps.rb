Given (/^the following questions exist in questions:/) do |questions_table|
  questions_table.hashes.each do |question|
      Question.create!(question)
  end
  expect(Question.all.count).to eq 1
end
