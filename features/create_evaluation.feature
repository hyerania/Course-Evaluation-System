Feature: create a evaluation

Background: evaluations in database
  Given the following questions exist:
  | qid   | content                               | answer  |c1     | c2   | c3    | c4    | c5    |c1_count|c2_count|c3_count|c4_count|c5_count| numAnswers |
  | 1001  | "What is the color of the grass?"     | "Green" |"Green"|"black"|"red" |"blue" | "white"|0|0|0|0|0| 5          |
  | 1002  | "What is the color of the blood?"     | "Green" |"Green"|"black"|"red" |"blue" | "white"|0|0|0|0|0| 5          |
  | 1003  | "What is the color of the hair?"      | "Green" |"Green"|"black"|"red" |"blue" | "white"|0|0|0|0|0| 5          |
 
  Given the following evaluations exist:
  | eid        | title            | content                                                              |
  | 1          | Evaluation 1     | ["What is the color of the blood?","What is the color of the hair?"] |
  | 2          | Evaluation 2     | ["What is the color of the grass?","What is the color of the hair?"] |
  
Scenario: creating a new evaluation
  When I am on the Evaluations page
  And  I follow "Add new evaluation"
  And  I fill in "title" with "Evaluation 3"
  And  I fill in "size" with "2"
  And  I press "evaluations_random"
  And  I press "Save Changes"
  Then I should see "Evaluation 3"
  And I should not see any question twice
 
Scenario: creating a new evaluation without filling in parameters
  When I am on the Evaluations page
  And  I follow "Add new evaluation"
  And  I check "questions[1001]"
  And  I select "1" from "scales1001-1"
  And  I select "2" from "scales1001-2"
  And  I press "Save Changes"
  Then I should be on the New page