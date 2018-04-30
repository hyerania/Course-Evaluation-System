Feature: Edit a question from the question database
  As a professor at Texas A&M
  So that I can mange the questions
  I want to be able to edit a question
  
Background: questions in database
  Given the following questions exist in questions:
    | qid   | content       | answer    | c1 | c2 | c3 | c4 | c5 | numAnswers |
    | 1000  | "Question 1:" | 5        | 1  | 2  | 3  | 4  | 5  | 5          |
    | 1001  | "Question 2:" | 4        | 1  | 2  | 3  | 4  |   | 4        |
    | 1002  | "Question 3:" | 3        | 1  | 2  | 3  |   |   | 3        |
    | 1003  | "Question 4:" | 2        | 1  | 2  |   |   |   | 2        |

  Given the following evaluations exist:
  | eid        | title            |access_code         | content                                                               |
  | 1          | Evaluation 1     |CSCE120             | ["What is the color of the blood?","What is the color of the hair?"]  |

  Given the following admin_keys exist:
    |key                                      |
    |99f427c0c6a2411bc8a046f26c8aa4cb45bba27f |
# Scenario: 

Scenario: viewing the edit question two
  Given I am on the admin login page
  And I fill in "key" with "dshell"
  And I press "Login"
  Then I should be on the admin page
  And I follow "Questions Manager"
  Then I should be on the admin questions page
  And I follow "1003"
  Then I should see "Edit Question: 1003"
  
Scenario: viewing the edit question three
  Given I am on the admin login page
  And I fill in "key" with "dshell"
  And I press "Login"
  Then I should be on the admin page
  And I follow "Questions Manager"
  Then I should be on the admin questions page
  And I follow "1002"
  Then I should see "Edit Question: 1002"

Scenario: viewing the edit question four
  Given I am on the admin login page
  And I fill in "key" with "dshell"
  And I press "Login"
  Then I should be on the admin page
  And I follow "Questions Manager"
  Then I should be on the admin questions page
  And I follow "1001"
  Then I should see "Edit Question: 1001"

Scenario: viewing the edit question page
  Given I am on the admin login page
  And I fill in "key" with "dshell"
  And I press "Login"
  Then I should be on the admin page
  And I follow "Questions Manager"
  Then I should be on the admin questions page
  And I follow "1000"
  Then I should see "Edit Question: 1000"
 
Scenario: trying to edit a question through route
  Given I am on the admin login page
  And I fill in "key" with "dshell"
  And I press "Login"
  Then I should be on the admin page
  And I follow "Questions Manager"
  Then I should be on the admin questions page
  Then I go to the edit question page for "1000"
  Then I should see "Edit Question: 1000"
  
Scenario: trying to edit an invalid question through route
  Given I am on the admin login page
  And I fill in "key" with "dshell"
  And I press "Login"
  Then I should be on the admin page
  And I follow "Questions Manager"
  Then I should be on the admin questions page
  And I delete question "1000"
  And I follow "1000"
  Then I should not see "Edit Question: 1000"
  And I should see "Unable to find question. Please try again."
  
Scenario: editing the question content 1
  Given I am on the admin login page
  And I fill in "key" with "dshell"
  And I press "Login"
  Then I should be on the admin page
  And I follow "Questions Manager"
  Then I should be on the admin questions page
  Then I go to the edit question page for "1000"
  And I select "1" from "answer"
  And I press "Save"
  Then I should see "Question 1000 successfully updated."
  And the question 1000 answer should be 1
  
Scenario: editing the question content 2
  Given I am on the admin login page
  And I fill in "key" with "dshell"
  And I press "Login"
  Then I should be on the admin page
  And I follow "Questions Manager"
  Then I should be on the admin questions page
  Then I go to the edit question page for "1000"
  And I select "2" from "answer"
  And I press "Save"
  Then I should see "Question 1000 successfully updated."
  And the question 1000 answer should be 2
  
Scenario: editing the question content 3
  Given I am on the admin login page
  And I fill in "key" with "dshell"
  And I press "Login"
  Then I should be on the admin page
  And I follow "Questions Manager"
  Then I should be on the admin questions page
  Then I go to the edit question page for "1000"
  And I select "3" from "answer"
  And I press "Save"
  Then I should see "Question 1000 successfully updated."
  And the question 1000 answer should be 3
  
Scenario: editing the question content 4
  Given I am on the admin login page
  And I fill in "key" with "dshell"
  And I press "Login"
  Then I should be on the admin page
  And I follow "Questions Manager"
  Then I should be on the admin questions page
  And I follow "1000"
  And I select "4" from "answer"
  And I press "Save"
  Then I should see "Question 1000 successfully updated."
  And the question 1000 answer should be 4
  
Scenario: editing the question content 5
  Given I am on the admin login page
  And I fill in "key" with "dshell"
  And I press "Login"
  Then I should be on the admin page
  And I follow "Questions Manager"
  Then I should be on the admin questions page
  And I follow "1000"
  And I select "5" from "answer"
  And I press "Save"
  Then I should see "Question 1000 successfully updated."
  And the question 1000 answer should be 5
  
Scenario: deleted question while editing
  Given I am on the admin login page
  And I fill in "key" with "dshell"
  And I press "Login"
  Then I should be on the admin page
  And I follow "Questions Manager"
  Then I should be on the admin questions page
  Then I go to the edit question page for "1000"
  And I delete question "1000"
  And I press "Save"
  Then I should see "Unable to find question. Please try again."
  
Scenario: deleted question before editing
  Given I am on the admin login page
  And I fill in "key" with "dshell"
  And I press "Login"
  Then I should be on the admin page
  And I follow "Questions Manager"
  Then I should be on the admin questions page
  And I delete question "1000"
  And I follow "1000"
  Then I should see "Unable to find question. Please try again."