Feature: create a evaluation

Background: evaluations in database
  Given the following questions exist:
  | qid   | content                               | answer  |
  | 1001  | "What is the color of the grass?"     | "Green" |
  | 1002  | "What is the color of the blood?"     | "Green" |
  | 1003  | "What is the color of the hair?"      | "Green" |
 
  Given the following evaluations exist:
  | eid        | title            | content                                                              |
  | 1          | Evaluation 1     | ["What is the color of the blood?","What is the color of the hair?"] |
  | 2          | Evaluation 2     | ["What is the color of the grass?","What is the color of the hair?"] |
  
  Given the following admin_keys exist:
  |key                                      |
  |99f427c0c6a2411bc8a046f26c8aa4cb45bba27f |
  
  Given the following instructions exist:
  |content                  |
  |"This exam is not timed" |
    
Scenario: creating a new evaluation
  Given I am on the admin login page
  And I fill in "key" with "dshell"
  And I press "Login"
  Then I should be on the admin page
  And I follow "Evaluations Manager"
  Then I should be on the Evaluations page
  And  I follow "Add new evaluation"
  And  I fill in "title" with "Evaluation 3"
  And  I fill in "size" with "2"
  And  I press "evaluations_random"
  And  I press "Save Changes" 
  Then I should see "Evaluation 3"
  And I should not see any question twice
 
Scenario: creating a new evaluation without filling in parameters
  Given I am on the admin login page
  And I fill in "key" with "dshell"
  And I press "Login"
  Then I should be on the admin page
  And I follow "Evaluations Manager"
  Then I should be on the Evaluations page
  And  I follow "Add new evaluation"
  And  I check "questions[1001]"
  And  I press "Save Changes" 
  Then I should be on the New page