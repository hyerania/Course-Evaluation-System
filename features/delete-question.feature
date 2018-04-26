Feature: Edit a question from the question database
  As a professor at Texas A&M
  So that I can mange the questions
  I want to be able to delete a question
  
Background: questions in database
  Given the following questions exist in questions:
    | qid   | content       | answer    | c1 | c2 | c3 | c4 | c5 |
    | 1000  | "Question 1:" | 10        | 1  | 2  | 3  | 4  | 5  |
  
  Given the following admin_keys exist:
    |key                                      |
    |99f427c0c6a2411bc8a046f26c8aa4cb45bba27f |

Scenario: deleting a question
  Given I am on the admin login page
  And I fill in "key" with "dshell"
  And I press "Login"
  Then I should be on the admin page
  And I follow "Questions Manager"
  Then I should be on the admin questions page
  Then I should see "Question 1"
  And I follow "Remove"
  Then I should see "Question 1000 successfully deleted."
  
 Scenario: deleting an already deleted question
  Given I am on the admin login page
  And I fill in "key" with "dshell"
  And I press "Login"
  Then I should be on the admin page
  And I follow "Questions Manager"
  Then I should be on the admin questions page
  And I delete question "1000"
  And I follow "Remove"
  Then I should see "Unable to find question. Please try again."
