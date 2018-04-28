Feature: Prohibit from accessing unauthorized pages by entering URL
Background:
  Given the following sections exist:
    |section_number    |
    |501               |
  
  Given the following admin_keys exist:
    |key                                      |
    |99f427c0c6a2411bc8a046f26c8aa4cb45bba27f |
  
#### admin side ###

Scenario: admin pages
  Given I am on the admin page
  Then I should be on the admin login page
  
Scenario: questions manager
  Given I am on the questions manager page
  Then I should be on the admin login page
  
Scenario: add questions page
  Given I am on the new question page
  Then I should be on the admin login page
  
Scenario: evaluations manager
  Given I am on the Evaluations page
  Then I should be on the admin login page
  
Scenario: add new evaluation page
  # terrible path name: the New Page
  Given I am on the New page 
  Then I should be on the admin login page
  
#back button
Scenario: press back button should not allow delete to modify db
  Given I am on the admin login page
  And I fill in "key" with "dshell"
  And I press "Login"
  Then I should be on the admin page
  And I should see "501"
  And I follow "Logout"
  Then I should be on the admin login page
  #And I hard code the link

### student side ###
Scenario: student personal page
  Given I am on the student personal page
  Then I should be on the student login page

Scenario: the student questions page
  Given I am on the student questions page
  Then I should be on the student login page
  