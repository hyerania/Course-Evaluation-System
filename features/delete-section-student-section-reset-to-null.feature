Feature: Deleting an existing section should reset students's section with the corresponding section number to null
  
Background: students and sections in database
  Given the following students exist:
    |uin        |name           |section    |attempts   |score  |last_start                 |last_end                   |created_at     |updated_at  |
    |123000123  |Ruth Morris    |500        |0          |-1     |2018-03-10 17:00:00 UTC    |2018-03-10 20:00:00 UTC    |               |            |

  Given the following sections exist:
    |section_number    |
    |500               |

  Given the following access_code exist:
    |code       |
    |CSCE120    | 
  
  Given the following admin_keys exist:
    |key                                      |
    |99f427c0c6a2411bc8a046f26c8aa4cb45bba27f |

Scenario: Delete a section in used
  Given I am on the admin login page
  And I fill in "key" with "dshell"
  And I press "Login"
  Then I should be on the admin page
  And I press "Delete"
  Then the section of "Ruth Morris" should be ""
  
Scenario: Reset Database
  Given I am on the admin login page
  And I fill in "key" with "dshell"
  And I press "Login"
  Then I should be on the admin page
  And I fill in "disclaimer" with "I want to delete all students in the database, and I understand that once deleted, they are not recoverable."
  And I press "Reset Student Database"
  And I should see "Databse Reset"
  
Scenario: Reset Database with invalid disclaimer
  Given I am on the admin login page
  And I fill in "key" with "dshell"
  And I press "Login"
  Then I should be on the admin page
  And I fill in "disclaimer" with "Random Text."
  And I press "Reset Student Database"
  And I should see "Disclaimer does not match. Database unchanged."