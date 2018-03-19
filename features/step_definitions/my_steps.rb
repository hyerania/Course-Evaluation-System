#background

Given(/^the following students exist:$/) do |table|
    table.hashes.each do |student|
        Student.create(student)
    end
end