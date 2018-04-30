Feature: delete question from evaluation
  
Background: evaluations in database
  Given the following questions exist:
    | qid   | content                               | answer  |c1     | c2   | c3    | c4    | c5    |c1_count|c2_count|c3_count|c4_count|c5_count| numAnswers |
    | 1001  | "What is the color of the grass?"     | "Green" |"Green"|"black"|"red" |"blue" | "white"|0|0|0|0|0| 5          |
    | 1002  | "What is the color of the grass?"     | "Green" |"Green"|"black"|"red" |"blue" | "white"|0|0|0|0|0| 5          |

  Given the following evaluations exist:
    | eid        | title            | content                            | qids   | scales |
    | 1          | Evaluation 1     | ["What is the color of the hair?"] | [1001] | [1 ] |
    | 2          | Evaluation 1     | ["What is the color of the hair?", "What is the color of the hair?"] | [1001, 1002] | [1 ] |

  Given the following admin_keys exist:
    |key                                      |
    |99f427c0c6a2411bc8a046f26c8aa4cb45bba27f |
  
  Given the following instructions exist:
    |content                  |
    |"This exam is not timed" |

# Scenario: deleting a question from an evaluation
#   Given I am on the admin login page
#   And I fill in "key" with "dshell"
#   And I press "Login"
#   Then I should be on the admin page
#   And I follow "Questions Manager"
#   And I follow "Remove"
#   Then evaluation "1" should have "0" questions
  
Scenario: deleting a question from an evaluation with one question
  Given I am on the admin login page
  And I fill in "key" with "dshell"
  And I press "Login"
  Then I should be on the admin page
  And I follow "Questions Manager"
  And I follow "remove1001"
  And I am on the admin login page
  And I fill in "key" with "dshell"
  And I press "Login"
  Then I should be on the admin page
  Then I should not see "Evaluation 1"
  
Scenario: deleting a question from an evaluation with multiple questions
  Given I am on the admin login page
  And I fill in "key" with "dshell"
  And I press "Login"
  Then I should be on the admin page
  And I follow "Questions Manager"
  And I follow "remove1001"
  And I am on the admin login page
  And I fill in "key" with "dshell"
  And I press "Login"
  Then I should be on the admin page
  Then I should not see "1001"