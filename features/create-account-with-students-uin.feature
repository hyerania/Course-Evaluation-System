Feature: create account with students uin
  
Background: students in database
  Given the following students exist:
    |uin        |name           |section    |attempts   |score  |last_start                 |last_end                   |created_at     |updated_at  |
    |123000123  |Ruth Morris    |500        |0          |-1     |2018-03-10 17:00:00 UTC    |2018-03-10 20:00:00 UTC    |               |            |

Scenario: add student with non-existing uin
  When I am on the student registration page
  And I fill in "UIN" with "222007338"
  And I fill in "Name" with "Siru Li"
  And I fill in "Section" with "500"
  And I press "Create Student"
  Then I should see "Student Added!"
  
Scenario: add student with invalid uin
  When I am on the student registration page
  And I fill in "UIN" with "123"
  And I fill in "Name" with "Siru Li"
  And I fill in "Section" with "500"
  And I press "Create Student"
  And I should see "Invalid UIN!"
  But I should not see "Student Added!"

Scenario: add student with existing uin
  When I am on the student registration page
  And I fill in "UIN" with "123000123"
  And I fill in "Name" with "Siru Li"
  And I fill in "Section" with "500"
  And I press "Create Student"
  And I should see "UIN already exist!"
  But I should not see "Student Added!"
  
Scenario: contain a nil fields
  When I am on the student registration page
  And I fill in "UIN" with ""
  And I fill in "Name" with "Siru Li"
  And I fill in "Section" with "500"
  And I press "Create Student"
  And I should see "Please fill in all required fields!!"
  But I should not see "Student Added!"