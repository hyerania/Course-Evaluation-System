Feature: View registered students

Background: student records in database
 
  Given the following students exist:
  | uin          | name            | section      |    attempts  | score|last_start              |last_end                |created_at |updated_at|
  | 123000123    | Ruth Morris     | 500          |   0          |  -1  |2018-03-10 17:00:00 UTC |2018-03-10 20:00:00 UTC |           |          |
  | 123000124    | Amulya Agarwal  | 500          |   0          |  -1  |2018-03-10 17:00:00 UTC |2018-03-10 20:00:00 UTC |           |          |
  | 123000125    | Siru Li         | 500          |   0          |  -1  |2018-03-10 17:00:00 UTC |2018-03-10 20:00:00 UTC |           |          |
  
