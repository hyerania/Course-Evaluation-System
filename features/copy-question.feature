Feature: Duplicate a question from the question database
  As a professor at Texas A&M
  So that I can manage the questions
  I want to be able to copy a question
  
Background: questions in database
  Given the following questions exist in questions:
    | qid   | content       | answer    | c1 | c2 | c3 | c4 | c5 | numAnswers |
    | 1000  | "Question 1:" | 10        | 1  | 2  | 3  | 4  | 5  | 5         |
  Given the following admin_keys exist:
    |key                                      |
    |99f427c0c6a2411bc8a046f26c8aa4cb45bba27f |

Scenario: Duplicating the first question
  Given I am on the admin login page
  And I fill in "key" with "dshell"
  And I press "Login"
  Then I should be on the admin page
  And I follow "Questions Manager"
  And I follow "Copy"
  Then I should see "Question 1000 successfully copied."
  And I should see "1001"

Scenario: Duplicating a deleted question
  Given I am on the admin login page
  And I fill in "key" with "dshell"
  And I press "Login"
  Then I should be on the admin page
  And I follow "Questions Manager"
  And I delete question "1000"
  And I follow "Copy"
  Then I should see "Unable to find question. Please try again."
  