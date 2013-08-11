Feature: display list of movies filtered by MPAA rating
 
  As a concerned parent
  So that I can quickly browse movies appropriate for my family
  I want to see movies matching only certain MPAA ratings

Background: movies have been added to database

  Given the following movies exist:
    | title                   | rating | release_date |
    | Aladdin                 | G      | 1992-11-25  |
    | The Terminator          | R      | 1984-10-26  |
    | When Harry Met Sally    | R      | 1989-07-21  |
    | The Help                | PG-13  | 2011-08-10  |
    | Chocolat                | PG-13  | 2001-01-05   |
    | Amelie                  | R      | 2001-04-25  |
    | 2001: A Space Odyssey   | G      | 1968-04-06   |
    | The Incredibles         | PG     | 2004-11-05   |
    | Raiders of the Lost Ark | PG     | 1981-06-12  |
    | Chicken Run             | G      | 2000-06-21  |

  And  I am on the RottenPotatoes home page
  
Scenario: restrict to movies with 'PG' or 'R' ratings
  # enter step(s) to check the 'PG' and 'R' checkboxes
  Given I check the following ratings: R, NC-17
  # enter step(s) to uncheck all other checkboxes
  And I uncheck the following ratings: G, PG, PG-13
  # enter step to "submit" the search form on the homepage
  And I press "submit"
#  # enter step(s) to ensure that PG and R movies are visible
  Then I see movies with the following ratings: R
  # enter step(s) to ensure that other movies are not visible
  And I don't see movies with the following ratings: G, PG, PG-13

Scenario: no ratings selected
 # see assignment

Scenario: all ratings selected
  Given I check the following ratings: G, PG, PG-13, R, NC-17
  And I press "submit"
  Then I should see all the movies
