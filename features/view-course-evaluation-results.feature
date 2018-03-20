Feature: View the course evaluation results

Background: students in database
  Given the following students exist:
    |uin        |name           |section    |attempts   |score  |last_start                 |last_end                   |created_at     |updated_at  |
    |123000123  |Ruth Morris    |500        |0          |-1     |2018-03-10 17:00:00 UTC    |2018-03-10 20:00:00 UTC    |               |            |
  
Scenario:Performance of the students
  When I am on the student page 
  Then I should see all the students
  And I should see the average is "-1"
  