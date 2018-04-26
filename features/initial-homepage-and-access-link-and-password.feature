Feature: login and access quiz
  
Background: students in database
  Given the following students exist:
    |uin        |name           |section    |attempts   |score  |last_start                 |last_end                   |created_at     |updated_at  |
    |123000123  |Ruth Morris    |500        |0          |-1     |2018-03-10 17:00:00 UTC    |2018-03-10 20:00:00 UTC    |               |            |
  
  Given the following questions exist:
  | qid   | content                               | answer|c1     | c2   | c3    | c4    | c5    |
  | 1002  | "What is the color of the blood?"     | Green | Green | Pink |"White"|"Blue" |"Red"  |
  | 1003  | "What is the color of the hair?"      | Black | Black | Pink |"White"|"Blue" |"Red"  |
 
  Given the following evaluations exist:
  | eid        | title            |access_code         | content                                                               |
  | 1          | Evaluation 1     |CSCE120             | ["What is the color of the blood?","What is the color of the hair?"]  |
  
  Given the following admin_keys exist:
    |key                                      |
    |99f427c0c6a2411bc8a046f26c8aa4cb45bba27f |
  
Scenario: Login to student page
  Given I am on the home page
  And I follow "For Students"
  Then I should be on the student login page
  And I fill in "uin" with "123000123"
  And I press "Login"
  Then I should be on the student personal page

Scenario: View and change access code
  Given I am on the home page
  And I follow "For Professor"
  And I fill in "key" with "dshell"
  And I press "Login"
  Then I should be on the admin page
  And I follow "Evaluations Manager"
  And I should be on the Evaluations page
  And I fill in "access_code" with "eval1"
  And I press "Update"
  Then the access code of "1" should be "eval1"

Scenario: Enter an access_code that is already assigned to one of the evaluation
  Given I am on the home page
  And I follow "For Professor"
  And I fill in "key" with "dshell"
  And I press "Login"
  Then I should be on the admin page
  And I follow "Evaluations Manager"
  And I should be on the Evaluations page
  And I fill in "access_code" with "CSCE120"
  And I press "Update"
  Then I should see "Access code already exists for another evaluation!"
  
Scenario: Enter invalid uin
  Given I am on the student login page
  And I fill in "uin" with "123"
  And I press "Login"
  And I should see "Please enter a valid UIN!"
  
Scenario: Enter unregistered uin
  Given I am on the student login page
  And I fill in "uin" with "123123123"
  And I press "Login"
  And I should see "UIN not registered!"
  
Scenario: Enter access code
  Given I am on the home page
  And I follow "For Students"
  Then I should be on the student login page
  And I fill in "uin" with "123000123"
  And I press "Login"
  Then I should be on the student personal page
  And I fill in "access_code" with "CSCE120"
  And I press "Begin"
  Then I should be on the student questions page
  
Scenario: Enter invalid access code
  Given I am on the home page
  And I follow "For Students"
  Then I should be on the student login page
  And I fill in "uin" with "123000123"
  And I press "Login"
  Then I should be on the student personal page
  And I fill in "access_code" with "CSCE606"
  And I press "Begin"
  Then I should see "Error: No evaluation exists with the corresponding access code!"

Scenario: Empty access_code field
  Given I am on the home page
  And I follow "For Students"
  Then I should be on the student login page
  And I fill in "uin" with "123000123"
  And I press "Login"
  Then I should be on the student personal page
  And I fill in "access_code" with ""
  And I press "Begin"
  Then I should see "Please enter an access code!"
  
Scenario: Logout
  Given I am on the student login page
  And I fill in "uin" with "123000123"
  And I press "Login"
  Then I should be on the student personal page
  And I follow "Logout"
  Then I should be on the student login page