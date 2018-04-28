Feature: Delete an evaluation from the database
  As a professor at Texas A&M
  So that I can manage the evaluations
  I want to be able to delete an evaluation
  
Background: evaluations in database
  Given the following questions exist:
        | qid   | content                               | answer  | c1 | c2      | c3     | c4 | c5     | numAnswers | 
        | 1001  | "What is the color of the grass?"     | "Green" | 1  | "Green" | 3      | 4  | 5      | 5          |
        | 1002  | "What is the color of the blood?"     | "Blue"  | 1  | 2       | "Blue" | 4  | 5      | 5          |
        | 1003  | "What is the color of the hair?"      | "Red"   | 1  | 2       | 3      | 4  | "Red"  | 5          |
    
  Given the following evaluations exist:
      | eid | title       | content                                                              |
      | 1   | Testing1    | ["What is the color of the blood?","What is the color of the hair?"] |
  
  Given the following admin_keys exist:
        |key                                      |
        |99f427c0c6a2411bc8a046f26c8aa4cb45bba27f |

  Given the following instructions exist:
        |content                  |
        |"This exam is not timed" |
Scenario: deleting an evaluation
  Given I am on the admin login page
  And I fill in "key" with "dshell"
  And I press "Login"
  Then I should be on the admin page
  And I follow "Evaluations Manager"
  Then I should be on the admin evaluations page
  Then I should see "Testing1"
  And I follow "Remove"
  Then I should see "Evaluation 1 successfully deleted."
  
 Scenario: deleting an already deleted Evaluation
  Given I am on the admin login page
  And I fill in "key" with "dshell"
  And I press "Login"
  Then I should be on the admin page
  And I follow "Evaluations Manager"
  Then I should be on the admin evaluations page
  And I delete evaluation "1"
  And I follow "Remove"
  Then I should see "Unable to find evaluation. Please try again."
