Feature: Edit a question from the question database
  As a professor at Texas A&M
  So that I can mange the questions
  I want to be able to edit a question
  
Background: questions in database
  Given the following questions exist in questions:
    | qid   | content       | answer    | c1 | c2 | c3 | c4 | c5 |
    | 1000  | "Question 1:" | 10        | 1  | 2  | 3  | 4  | 5  |

Scenario: viewing the edit question page
  When I am on the admin questions page
  And I follow "1000"
  Then I should see "Edit Question: 1000"
 
Scenario: trying to edit a question through route
  When I am on the edit question page for "1000"
  Then I should see "Edit Question: 1000"
  
Scenario: trying to edit an invalid question through route
  When I am on the edit question page for "1001"
  Then I should not see "Edit Question: 1000"
  And I should see "Unable to find question. Please try again."
  
Scenario: editing the question content 1
  When I am on the edit question page for "1000"
  And I select "1" from "answer"
  And I press "Save"
  Then I should see "Question 1000 successfully updated."
  And the question 1000 answer should be 1
  
Scenario: editing the question content 2
  When I am on the edit question page for "1000"
  And I select "2" from "answer"
  And I press "Save"
  Then I should see "Question 1000 successfully updated."
  And the question 1000 answer should be 2
  
Scenario: editing the question content 3
  When I am on the edit question page for "1000"
  And I select "3" from "answer"
  And I press "Save"
  Then I should see "Question 1000 successfully updated."
  And the question 1000 answer should be 3
  
Scenario: editing the question content 4
  When I am on the edit question page for "1000"
  And I select "4" from "answer"
  And I press "Save"
  Then I should see "Question 1000 successfully updated."
  And the question 1000 answer should be 4
  
Scenario: deleted question while editing
  When I am on the edit question page for "1000"
  And I delete question "1000"
  And I press "Save"
  Then I should see "Unable to find question. Please try again."
