Feature: Prohibit from accessing unauthorized pages by entering URL
  
  
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
  
### student side ###
Scenario: student personal page
  Given I am on the student personal page
  Then I should be on the student login page

Scenario: the student questions page
  Given I am on the student questions page
  Then I should be on the student login page