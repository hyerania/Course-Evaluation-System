Feature: View for the students practice test

Background: evaluations in database
  Given the following students exist:
  | uin          | name            | section      |    attempts  | score|last_start              |last_end                |created_at |updated_at|
  | 123000123    | Ruth Morris     | 500          |   0          |  -1  |2018-03-10 17:00:00 UTC |2018-03-10 20:00:00 UTC |           |          |
  
  Given the following questions exist:
  | qid   | content                               | answer|c1     | c2   | c3    | c4    | c5    |c1_count|c2_count|c3_count|c4_count|c5_count| numAnswers |
  | 1002  | "What is an array?"     | Green | Green | Pink |"White"|"Blue" |"Red"  |0       |0       |0       |0       |0       | 5          |
  
 
  Given the following evaluations exist:
    | eid        | title    | content               |  scales       |  access_code  |
  | 1          | Practice   | ["What is an array?"  |   [5,4,3,2,1] |  practice     |
  
  Given the following instructions exist:
  |content                  |
  |"This exam is not timed" |

  
Scenario: view for the student's test
  Given I am on the home page
  And I follow "For Students"
  Then I should be on the student login page
  And I fill in "uin" with "123000123"
  And I press "Login"
  Then I should be on the student personal page
  And I fill in "access_code" with "practice"
  And I press "Practice"
  When I am on the student questions page
  Then I should see "What is an array?"
  And  I should see "Green"
  And  I should see "Pink"
  And  I should see "White"
  And  I should see "Blue"
  And  I should see "Red"