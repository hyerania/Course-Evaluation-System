Feature: View for the students test

Background: evaluations in database
  Given the following questions exist:
  | qid   | content                               | answer  |c1     | c2    | c3    | c4    | c5    |
  | 1002  | "What is the color of the blood?"     | "Green" |"Green"|"Pink" |"White"|"Blue" |"Red"  |
  | 1003  | "What is the color of the hair?"      | "Black" |"Black"|"Pink" |"White"|"Blue" |"Red"  |
 
  Given the following evaluations exist:
  | eid        | title            | content                                                                       |
  | 1          | Evaluation 1     | ["What is the color of the blood?","What is the color of the hair?"] |
  
  Given the following access_code exist:
    |code       |
    |CSCE120    | 
  
Scenario: view for the student's test
  When I am on the student questions page
  Then I should see "What is the color of the blood?"
  And  I should see "Green"
  And  I should see "Pink"
  And  I should see "White"
  And  I should see "Blue"
  And  I should see "Red"
  
  When I follow "Next"
  Then I should see "What is the color of the hair?"
  And  I should see "Black"
  And  I should see "Pink"
  And  I should see "White"
  And  I should see "Blue"
  And  I should see "Red"
  
  When I press "Submit"
  Then I should be on the student personal page
  
