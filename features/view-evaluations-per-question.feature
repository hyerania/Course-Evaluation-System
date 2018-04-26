Feature: View all questions from a specific evaluation in the database
  As a professor at Texas A&M
  So that I can manage the evaluations
  I want to be able to view the questions in a single evaluation

Background: evaluations in database
    Given the following questions exist:
        | qid   | content                               | answer  | c1 | c2      | c3     | c4 | c5     | numAnswers | 
        | 1001  | "What is the color of the grass?"     | "Green" | 1  | "Green" | 3      | 4  | 5      | 5          |
        | 1002  | "What is the color of the blood?"     | "Blue"  | 1  | 2       | "Blue" | 4  | 5      | 5          |
        | 1003  | "What is the color of the hair?"      | "Red"   | 1  | 2       | 3      | 4  | "Red"  | 5          |
    
    Given the following evaluations exist:
        | eid        | title            | content                                                              |
        | 1          | Testing1         | ["What is the color of the blood?","What is the color of the hair?"] |
        | 2          | Evaluation2      | ["What is the color of the grass?","What is the color of the hair?"] |
    
Scenario: viewing the individual evaluation
  When I am on the Evaluations page
  And I follow "1"
  Then I should see "Evaluation 1: Testing1"
  And I should see "What is the color of the blood?"
  And I should see "What is the color of the hair?"
  And I should not see "What is the color of the grass?"
  And I should see "Blue"
  And I should see "Red"
  And I should not see "Green"

  