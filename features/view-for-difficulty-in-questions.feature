Feature: View for difficulty in questions

Background: evaluations in database
  Given the following students exist:
  | uin          | name            | section      |    attempts  | score|last_start              |last_end                |created_at |updated_at|
  | 123000123    | Ruth Morris     | 500          |   0          |  -1  |2018-03-10 17:00:00 UTC |2018-03-10 20:00:00 UTC |           |          |
  
  Given the following questions exist:
  | qid   | content                               | answer|c1     | c2   | c3    | c4    | c5    |c1_count|c2_count|c3_count|c4_count|c5_count| numAnswers |difficulty |
  | 1002  | "What is the color of the blood?"     | Green | Green | Pink |"White"|"Blue" |"Red"  |0       |0       |0       |0       |0       | 5          |easy       |
  | 1003  | "What is the color of the hair?"      | Black | Black | Pink |"White"|"Blue" |"Red"  |0       |0       |0       |0       |0       | 5          |easy       |
  | 1004  | "What is the color of the blood2?"    | Green | Green | Pink |"White"|"Blue" |"Red"  |0       |0       |0       |0       |0       | 5          |easy       |
  | 1005  | "What is the color of the hair3?"     | Black | Black | Pink |"White"|"Blue" |"Red"  |0       |0       |0       |0       |0       | 5          |medium     |
  | 1006  | "What is the color of the blood4?"    | Green | Green | Pink |"White"|"Blue" |"Red"  |0       |0       |0       |0       |0       | 5          |hard       |
  | 1007  | "What is the color of the hair5?"     | Red   | Black | Pink |"White"|"Blue" | Red  |0       |0       |0       |0       |0       | 5          |easy       |

 
  Given the following evaluations exist:
    | eid        | title            | content                                                                                                                                                                                                        |scales|  access_code |
  | 1          | Evaluation 1     | ["What is the color of the blood?","What is the color of the hair?","What is the color of the blood2?","What is the color of the hair3?","What is the color of the blood4?","What is the color of the hair5?"] |[1,2,3,4,5,5,4,3,2,1,1,2,3,4,5,5,4,3,2,1,1,2,3,4,5,5,4,3,2,1]|  CSCE120     |
  
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
  And I fill in "access_code" with "CSCE120"
  And I press "Begin"
  When I am on the student questions page
  Then I should see "What is the color of the blood?"
  And  I should see "Easy"
  And  I should see "Green"
  And  I should see "Pink"
  And  I should see "White"
  And  I should see "Blue"
  And  I should see "Red"
  
  When I press "Next"
  Then I should be on the student questions page
  
  When I choose "choice_1"
  And I press "Next"
  Then I should see "What is the color of the hair?"
  And  I should see "Easy"
  And  I should see "Black"
  And  I should see "Pink"
  And  I should see "White"
  And  I should see "Blue"
  And  I should see "Red"

  When I choose "choice_2"
  And I press "Next"
  Then I should see "What is the color of the blood2?"
  And  I should see "Easy"
  And  I should see "Green"
  And  I should see "Pink"
  And  I should see "White"
  And  I should see "Blue"
  And  I should see "Red"
  
  When I choose "choice_3"
  And I press "Next"
  Then I should see "What is the color of the hair3?"
  And  I should see "Medium"
  And  I should see "Black"
  And  I should see "Pink"
  And  I should see "White"
  And  I should see "Blue"
  And  I should see "Red"
  
  When I am on the student question page without arguments
  Then I should be on the student questions page
  
  When I choose "choice_4"
  And I press "Next"
  Then I should see "What is the color of the blood4?"
  And  I should see "Hard"
  And  I should see "Green"
  And  I should see "Pink"
  And  I should see "White"
  And  I should see "Blue"
  And  I should see "Red"
  
  When I choose "choice_5"
  And I press "Next"
  Then I should see "What is the color of the hair5?"
  And  I should see "Easy"
  And  I should see "Black"
  And  I should see "Pink"
  And  I should see "White"
  And  I should see "Blue"
  And  I should see "Red"
  
  When I press "Submit"
  Then I should be on the student questions page
  
  When I choose "choice_1"
  And I press "Submit"
  Then I should be on the student personal page
  
  
Scenario: view for the student's test trying to press backarrow
  Given I am on the home page
  And I follow "For Students"
  Then I should be on the student login page
  And I fill in "uin" with "123000123"
  And I press "Login"
  Then I should be on the student personal page
  And I fill in "access_code" with "CSCE120"
  And I press "Begin"
  
  When I choose "choice_1"
  And I press "Next"
  Then I should see "What is the color of the hair?"
  And  I should see "Easy"
  And  I should see "Black"
  And  I should see "Pink"
  And  I should see "White"
  And  I should see "Blue"
  And  I should see "Red"
  
  When I am on the student questions previous page
  Then I should see "Don't even think about going back"