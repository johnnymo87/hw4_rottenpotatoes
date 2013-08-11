Feature: display list of movies sorted by different criteria
 
  As an avid moviegoer
  So that I can quickly browse movies based on my preferences
  I want to see movies sorted by title or release date

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

  And I am on the RottenPotatoes home page

Scenario: sort movies alphabetically
  When I follow "Movie Title"
  Then I should see 'Aladdin' before 'Amelie'.

Scenario: sort movies in increasing order of release date
  When I follow "Release Date"
  Then I should see '1984-10-26' before '1992-11-25'.

