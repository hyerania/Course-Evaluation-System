Feature: Add a question to the question database
    As a professor at Texas A&M
    So that I can manage the questions
    I want to be able to add a question
    
Background: questions in database
  Given the following questions exist in questions:
    | qid   | content       | answer    | c1 | c2 | c3 | c4 | c5 |
    | 1000  | "Question 1:" | 10        | 1  | 2  | 3  | 4  | 5  |

Scenario: creating a new question answer 1
  When I am on the new question page
  And I fill in "content" with "Question 2:"
  And I fill in "c1" with "Answer1"
  And I fill in "c2" with "2"
  And I fill in "c3" with "3"
  And I fill in "c4" with "4"
  And I select "1" from "answer"
  And I press "Save"
  Then I should see "Question 2:"
  And the question 1001 answer should be 1

Scenario: creating a new question answer 2
  When I am on the new question page
  And I fill in "content" with "Question 2:"
  And I fill in "c1" with "Answer1"
  And I fill in "c2" with "2"
  And I fill in "c3" with "3"
  And I fill in "c4" with "4"
  And I select "2" from "answer"
  And I press "Save"
  Then I should see "Question 2:"
  And the question 1001 answer should be 2
  

Scenario: creating a new question answer 3
  When I am on the new question page
  And I fill in "content" with "Question 2:"
  And I fill in "c1" with "Answer1"
  And I fill in "c2" with "2"
  And I fill in "c3" with "3"
  And I fill in "c4" with "4"
  And I select "3" from "answer"
  And I press "Save"
  Then I should see "Question 2:"
  And the question 1001 answer should be 3
  
  
Scenario: creating a new question answer 4
  When I am on the new question page
  And I fill in "content" with "Question 2:"
  And I fill in "c1" with "Answer1"
  And I fill in "c2" with "2"
  And I fill in "c3" with "3"
  And I fill in "c4" with "4"
  And I select "4" from "answer"
  And I press "Save"
  Then I should see "Question 2:"
  And the question 1001 answer should be 4
  
Scenario: cancelling a new question
  When I am on the new question page
  And I fill in "content" with "Question 3:"
  And I fill in "c1" with "1"
  And I fill in "c2" with "2"
  And I fill in "c3" with "3"
  And I fill in "c4" with "4"
  And I select "1" from "answer"
  And I follow "Cancel"
  Then I should not see "Question 3:"