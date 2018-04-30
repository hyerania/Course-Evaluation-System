Feature: update instructions
  
Background: students and sections in database
  Given the following admin_keys exist:
    |key                                      |
    |99f427c0c6a2411bc8a046f26c8aa4cb45bba27f |
  
  Given the following instructions exist:
    |content                  |
    |"This exam is not timed" |

Scenario: View and update instructions
 Given I am on the admin login page
  And I fill in "key" with "dshell"
  And I press "Login"
  Then I should be on the admin page
  And I follow "Evaluations Manager"
  Then I should be on the Evaluations page
  And I should see "This exam is not timed"
  And I fill in "content" with "Press begin to blow up"
  And I press "Update Instruction"
  Then I should see "Instruction updated!"