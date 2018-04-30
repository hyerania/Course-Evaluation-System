Feature: Export data to csv

Background: students in database
  Given the following students exist:
  | uin          | name               | section      |    attempts  | score|last_start              |last_end                |created_at |updated_at|
  | 123000123    | Ruth Morris        | 500          |   0          |  -1  |2018-03-10 17:00:00 UTC |2018-03-10 20:00:00 UTC |           |          |
  | 122009410    | Amulya Agarwal     | 500          |   0          |  -1  |2018-03-10 17:00:00 UTC |2018-03-10 20:00:00 UTC |           |          |

   Given the following evaluations exist:
  | eid        | title            |access_code         | content                                                               |
  | 1          | Evaluation 1     |CSCE120             | ["What is the color of the blood?","What is the color of the hair?"]  |
  Given the following admin_keys exist:
    |key                                      |
    |99f427c0c6a2411bc8a046f26c8aa4cb45bba27f |

Scenario: export student records
  Given I am on the admin login page
  And I fill in "key" with "dshell"
  And I press "Login"
  Then I should be on the admin page
  And I follow "Export Students to CSV"
  And I press "Export to CSV"
  Then I should get a download with the filename "students.csv"
  
Scenario: export questions
  Given I am on the admin login page
  And I fill in "key" with "dshell"
  And I press "Login"
  Then I should be on the admin page
  And I follow "Questions Manager"
  And I follow "Export Questions to CSV"
  Then I should get a download with the filename "questions.csv"

Scenario: Display all the students
  Given I am on the admin login page
  And I fill in "key" with "dshell"
  And I press "Login"
  Then I should be on the admin page
  And I follow "Export Students to CSV"
  And I press "Display all"
  Then I should see all the students

Scenario: Update the students
  Given I am on the admin login page
  And I fill in "key" with "dshell"
  And I press "Login"
  Then I should be on the admin page
  And I follow "Export Students to CSV"
  Then I uncheck the first student
  Then I press "Update"
  Then I should not see "123000123"
  And I press "Export to CSV"
  Then I should get a download with the filename "students.csv"
  
Scenario: First Display all the students
  Given I am on the admin login page
  And I fill in "key" with "dshell"
  And I press "Login"
  Then I should be on the admin page
  And I follow "Export Students to CSV"
  Then I should see all the students