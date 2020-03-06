Feature: have additional test 


Background: movies in database

  Given the following movies exist:
  | title        | rating | director     | release_date |
  | Star Wars    | PG     | George Lucas |   1977-05-25 |
  | Blade Runner | PG     | Ridley Scott |   1982-06-25 |
  | Alien        | R      |              |   1979-05-25 |
  | THX-1138     | R      | George Lucas |   1971-03-11 |
  | test         | R      | Ann          |   1973-03-11 |
  | test1        | R      | Ann          |   1972-03-11 |
  | test2        | R      |              |   1972-03-11 |


Scenario: find movie with same director with only one record
  Given I am on the details page for "Blade Runner"
  When  I follow "Find Movies With Same Director"
  Then  I should be on the Similar Movies page for "Blade Runner"
  And   I should see "Blade Runner"
  But   I should not see "Alien"
  
  Scenario: find movie with same director
  Given I am on the details page for "test"
  When  I follow "Find Movies With Same Director"
  Then  I should be on the Similar Movies page for "test"
  And   I should see "test1"
  But   I should not see "Alien"
  
  
  Scenario: delete a movie
  Given I am on the details page for "test2"
  Then  I should not see "test1"
  And  I press "Delete"
  Then  I should be on the home page
  And   I should see "Movie 'test2' deleted."