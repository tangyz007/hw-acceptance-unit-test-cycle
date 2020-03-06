Feature: Go back from detail page


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


Scenario: Go back from detail page
  Given I am on the details page for "Blade Runner"
  When  I follow "Back to movie list"
  Then  I should be on the home page