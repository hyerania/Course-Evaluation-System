Feature: View for the students test

Background: evaluations in database
  Given the following students exist:
  | uin          | name            | section      |    attempts  | score|last_start              |last_end                |created_at |updated_at|
  | 123000123    | Ruth Morris     | 500          |   0          |  -1  |2018-03-10 17:00:00 UTC |2018-03-10 20:00:00 UTC |           |          |
  
  Given the following questions exist:
  | qid   | content                               | answer|c1     | c2   | c3    | c4    | c5    |
  | 1002  | "What is the color of the blood?"     | Green | Green | Pink |"White"|"Blue" |"Red"  |
  | 1003  | "What is the color of the hair?"      | Black | Black | Pink |"White"|"Blue" |"Red"  |
 
  Given the following evaluations exist:
  | eid        | title            | content                                                              | access_code |
  | 1          | Evaluation 1     | ["What is the color of the blood?","What is the color of the hair?"] | CSCE120     |
  
Scenario: view for the student's test
  Given I am on the home page
  And I follow "For Students"
  Then I should be on the student login page
  And I fill in "uin" with "123000123"
  And I press "Login"
  Then I should be on the student personal page
  And I fill in "access_code" with "CSCE120"
  And I press "Begin"
  When I am on the student questions page
  Then I should see "What is the color of the blood?"
  And  I should see "Green"
  And  I should see "Pink"
  And  I should see "White"
  And  I should see "Blue"
  And  I should see "Red"
  
  When I choose "choice_Green"
  And I press "Next"
  Then I should see "What is the color of the hair?"
  And  I should see "Black"
  And  I should see "Pink"
  And  I should see "White"
  And  I should see "Blue"
  And  I should see "Red"
  
  When I choose "choice_Black"
  And I press "Submit"
  Then I should be on the student personal page
  
  
