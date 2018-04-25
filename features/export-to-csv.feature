Feature: Export data to csv

Background: students in database
  Given the following students exist:
  | uin          | name            | section      |    attempts  | score|last_start              |last_end                |created_at |updated_at|
  | 123000123    | Ruth Morris     | 500          |   0          |  -1  |2018-03-10 17:00:00 UTC |2018-03-10 20:00:00 UTC |           |          |

  Given the following access_code exist:
    |code       |
    |CSCE120    | 
  Given the following admin_keys exist:
    |key                                      |
    |99f427c0c6a2411bc8a046f26c8aa4cb45bba27f |

Scenario: export student records
  Given I am on the admin login page
  And I fill in "key" with "dshell"
  And I press "Login"
  Then I should be on the admin page
  And I follow "Export data"
  Then I should be on the students page
  And I follow "Export to CSV"
  Then I should get a download with the filename "students.csv"