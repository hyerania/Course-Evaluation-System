Feature: Duplicate a question from the question database
  As a professor at Texas A&M
  So that I can manage the questions
  I want to be able to copy a question
  
Background: questions in database
  Given the following questions exist in questions:
    | qid   | content       | answer    | c1 | c2 | c3 | c4 | c5 |
    | 1000  | "Question 1:" | 10        | 1  | 2  | 3  | 4  | 5  |

Scenario: Duplicating the first question
  When I am on the admin questions page
  And I follow "Copy"
  Then I should see "Question 1000 successfully copied."
  And I should see "1001"

Scenario: Duplicating a deleted question
  When I am on the admin questions page
  And I delete question "1000"
  And I follow "Copy"
  Then I should see "Unable to find question. Please try again."
  