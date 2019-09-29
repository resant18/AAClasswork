# == Schema Information
#
# Table name: actors
#
#  id          :integer      not null, primary key
#  name        :string
#
# Table name: movies
#
#  id          :integer      not null, primary key
#  title       :string
#  yr          :integer
#  score       :float
#  votes       :integer
#  director_id :integer
#
# Table name: castings
#
#  movie_id    :integer      not null, primary key
#  actor_id    :integer      not null, primary key
#  ord         :integer

require_relative './sqlzoo.rb'

def example_join
  execute(<<-SQL)
    SELECT
      *
    FROM
      movies
    JOIN
      castings ON movies.id = castings.movie_id
    JOIN
      actors ON castings.actor_id = actors.id
    WHERE
      actors.name = 'Sean Connery'
  SQL
end

def ford_films
  # List the films in which 'Harrison Ford' has appeared.
  execute(<<-SQL)
    SELECT
      movies.title
    FROM
      movies INNER JOIN castings
                ON  movies.id = castings.movie_id
              INNER JOIN actors
                ON castings.actor_id = actors.id
    WHERE
      actors.name = 'Harrison Ford'
  SQL
end

def ford_supporting_films
  # List the films where 'Harrison Ford' has appeared - but not in the star
  # role. [Note: the ord field of casting gives the position of the actor. If
  # ord=1 then this actor is in the starring role]
  execute(<<-SQL)
    SELECT
      movies.title
    FROM
      movies INNER JOIN castings
                ON  movies.id = castings.movie_id
              INNER JOIN actors
                ON castings.actor_id = actors.id
    WHERE
      actors.name = 'Harrison Ford' 
        AND castings.ord <> 1
  SQL
end

def films_and_stars_from_sixty_two
  # List the title and leading star of every 1962 film.
  execute(<<-SQL)
  SELECT
    movies.title, actors.name
  FROM movies INNER JOIN castings
                ON  movies.id = castings.movie_id
              INNER JOIN actors
                ON castings.actor_id = actors.id
  WHERE
    movies.yr = 1962 
      AND castings.ord = 1

  SQL
end

def travoltas_busiest_years
  # Which were the busiest years for 'John Travolta'? Show the year and the
  # number of movies he made for any year in which he made at least 2 movies.
  execute(<<-SQL)
  SELECT
    movies.yr, COUNT(*) AS num_movies
  FROM movies INNER JOIN castings
                ON  movies.id = castings.movie_id
              INNER JOIN actors
                ON castings.actor_id = actors.id
  WHERE
    actors.name = 'John Travolta'
  GROUP BY 
    movies.yr
  HAVING
    COUNT(*) >= 2

  SQL
end

def andrews_films_and_leads
  # List the film title and the leading actor for all of the films 'Julie
  # Andrews' played in.
  execute(<<-SQL)
    SELECT
      movies.title, actors.name
    FROM movies INNER JOIN 
          castings ON  movies.id = castings.movie_id INNER JOIN 
          actors ON castings.actor_id = actors.id 
    WHERE castings.ord = 1 AND movies.title IN
                              (
                                SELECT
                                  movies.title 
                                FROM movies INNER JOIN 
                                    castings ON  movies.id = castings.movie_id INNER JOIN 
                                    actors ON castings.actor_id = actors.id 
                                WHERE actors.name = 'Julie Andrews'
                              )
  SQL
end

def prolific_actors
  # Obtain a list in alphabetical order of actors who've had at least 15
  # starring roles.
  execute(<<-SQL)
    SELECT 
      a.name
    FROM 
      actors a
        INNER JOIN castings c ON a.id = c.actor_id
        INNER JOIN movies m ON c.movie_id = m.id
    WHERE 
      c.ord = 1
    GROUP BY 
      a.name    
    HAVING 
      COUNT(*) >= 15
    ORDER BY
      a.name
  SQL
end

def films_by_cast_size
  # List the films released in the year 1978 ordered by the number of actors
  # in the cast (descending), then by title (ascending).
  execute(<<-SQL)
    SELECT
      m.title, COUNT(*) AS num_movies
    FROM movies m INNER JOIN
        castings c ON m.id = c.movie_id INNER JOIN
        actors a ON c.actor_id = a.id
    WHERE
        m.yr = 1978
    GROUP BY
      m.title
    ORDER BY
      COUNT(*) DESC, m.title ASC
          
  SQL
end

def colleagues_of_garfunkel
  # List all the people who have played alongside 'Art Garfunkel'.
  execute(<<-SQL)
    SELECT 
      actors.name
    FROM
      actors garfunkel_actors INNER JOIN
      castings garfunkel_castings ON garfunkel_actors.id = garfunkel_castings.actor_id AND garfunkel_actors.name = 'Art Garfunkel' INNER JOIN
      movies garfunkel_movies ON garfunkel_movies.id = garfunkel_castings.movie_id INNER JOIN
      castings ON garfunkel_movies.id = castings.movie_id INNER JOIN
      actors ON castings.actor_id = actors.id AND actors.name <> 'Art Garfunkel'
  SQL
end


# To better understand the relation:
# SELECT 
#       garfunkel_actors.name, garfunkel_movies.title, actors.name, garfunkel_castings.ord, castings.ord
#     FROM
#       actors garfunkel_actors INNER JOIN
#       castings garfunkel_castings ON garfunkel_actors.id = garfunkel_castings.actor_id INNER JOIN
#       movies garfunkel_movies ON garfunkel_movies.id = garfunkel_castings.movie_id INNER JOIN
#       castings ON garfunkel_movies.id = castings.movie_id INNER JOIN
#       actors ON castings.actor_id = actors.id      
#     WHERE garfunkel_actors.name = 'Art Garfunkel' AND castings.ord <> 1 AND actors.name <> 'Art Garfunkel'

