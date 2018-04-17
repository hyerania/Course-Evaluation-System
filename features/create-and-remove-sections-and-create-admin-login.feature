Feature: create and remove sections and create admin login
  
Background: students and sections in database
  Given the following students exist:
    |uin        |name           |section    |attempts   |score  |last_start                 |last_end                   |created_at     |updated_at  |
    |123000123  |Ruth Morris    |500        |0          |-1     |2018-03-10 17:00:00 UTC    |2018-03-10 20:00:00 UTC    |               |            |

  Given the following sections exist:
    |section_number    |
    |501               |

  Given the following access_code exist:
    |code       |
    |CSCE120    | 
  
  Given the following admin_keys exist:
    |key                                      |
    |99f427c0c6a2411bc8a046f26c8aa4cb45bba27f |

Scenario: update section through student portal
  Given I am on the student login page
  And I fill in "uin" with "123000123"
  And I press "Login"
  Then I should be on the student personal page
  And I select "501" from "section"
  And I press "Update"
  Then the section of "Ruth Morris" should be "501"
  
Scenario: Login with wrong key
  Given I am on the admin login page
  And I fill in "key" with "123"
  And I press "Login"
  Then I should see "Incorrect Key!"
  
Scenario: Non-existing session
  Given I am on the admin page
  Then I should be on the admin login page

Scenario: Add a new section
  Given I am on the admin login page
  And I fill in "key" with "dshell"
  And I press "Login"
  Then I should be on the admin page
  And I fill in "section_number" with "503"
  And I press "Add"
  Then I should see "503"

Scenario: Add an existing section
  Given I am on the admin login page
  And I fill in "key" with "dshell"
  And I press "Login"
  Then I should be on the admin page
  And I fill in "section_number" with "501"
  And I press "Add"
  Then I should see "501"

Scenario: Delete a section
  Given I am on the admin login page
  And I fill in "key" with "dshell"
  And I press "Login"
  Then I should be on the admin page
  And I press "Delete"
  Then I should not see "501"
  
Scenario: Update a student's section from admin
  Given I am on the admin login page
  And I fill in "key" with "dshell"
  And I press "Login"
  Then I should be on the admin page
  And I select "501" from "section"
  And I press "Update"
  Then the section of "Ruth Morris" should be "501"

Scenario: Admin logout
  Given I am on the admin login page
  And I fill in "key" with "dshell"
  And I press "Login"
  Then I should be on the admin page
  And I follow "Logout"
  Then I should be on the admin login page