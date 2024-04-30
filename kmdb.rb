# In this assignment, you'll be using the domain model from hw1 (found in the hw1-solution.sql file)
# to create the database structure for "KMDB" (the Kellogg Movie Database).
# The end product will be a report that prints the movies and the top-billed
# cast for each movie in the database.

# To run this file, run the following command at your terminal prompt:
# `rails runner kmdb.rb`

# Requirements/assumptions
#
# - There will only be three movies in the database – the three films
#   that make up Christopher Nolan's Batman trilogy.
# - Movie data includes the movie title, year released, MPAA rating,
#   and studio.
# - There are many studios, and each studio produces many movies, but
#   a movie belongs to a single studio.
# - An actor can be in multiple movies.
# - Everything you need to do in this assignment is marked with TODO!
# - Note rubric explanation for appropriate use of external resources.

# Rubric
# 
# There are three deliverables for this assignment, all delivered within
# this repository and submitted via GitHub and Canvas:
# - Generate the models and migration files to match the domain model from hw1.
#   Table and columns should match the domain model. Execute the migration
#   files to create the tables in the database. (5 points)
# - Insert the "Batman" sample data using ruby code. Do not use hard-coded ids.
#   Delete any existing data beforehand so that each run of this script does not
#   create duplicate data. (5 points)
# - Query the data and loop through the results to display output similar to the
#   sample "report" below. (10 points)
# - You are welcome to use external resources for help with the assignment (including
#   colleagues, AI, internet search, etc). However, the solution you submit must
#   utilize the skills and strategies covered in class. Alternate solutions which
#   do not demonstrate an understanding of the approaches used in class will receive
#   significant deductions. Any concern should be raised with faculty prior to the due date.

# Submission
# 
# - "Use this template" to create a brand-new "hw2" repository in your
#   personal GitHub account, e.g. https://github.com/<USERNAME>/hw2
# - Do the assignment, committing and syncing often
# - When done, commit and sync a final time before submitting the GitHub
#   URL for the finished "hw2" repository as the "Website URL" for the 
#   Homework 2 assignment in Canvas

# Successful sample output is as shown:

# Movies
# ======

# Batman Begins          2005           PG-13  Warner Bros.
# The Dark Knight        2008           PG-13  Warner Bros.
# The Dark Knight Rises  2012           PG-13  Warner Bros.

# Top Cast
# ========

# Batman Begins          Christian Bale        Bruce Wayne
# Batman Begins          Michael Caine         Alfred
# Batman Begins          Liam Neeson           Ra's Al Ghul
# Batman Begins          Katie Holmes          Rachel Dawes
# Batman Begins          Gary Oldman           Commissioner Gordon
# The Dark Knight        Christian Bale        Bruce Wayne
# The Dark Knight        Heath Ledger          Joker
# The Dark Knight        Aaron Eckhart         Harvey Dent
# The Dark Knight        Michael Caine         Alfred
# The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
# The Dark Knight Rises  Christian Bale        Bruce Wayne
# The Dark Knight Rises  Gary Oldman           Commissioner Gordon
# The Dark Knight Rises  Tom Hardy             Bane
# The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
# The Dark Knight Rises  Anne Hathaway         Selina Kyle

# Delete existing data, so you'll start fresh each time this script is run.
# Use `Model.destroy_all` code.
# TODO!

Studio.destroy_all
Movie.destroy_all
Actor.destroy_all
Role.destroy_all


# Generate models and tables, according to the domain model.
# TODO!
#I did this part directly in the terminal as shown in class
# rails generate model Studio
# rails generate model Movie
# rails generate model Actor
# rails generate model Role

#rails db:migrate


# Insert data into the database that reflects the sample data shown above.
# Do not use hard-coded foreign key IDs.
# TODO!

new_row_studios_table = Studio.new
    new_row_studios_table["name"] = "Warner Bros."
new_row_studios_table.save


get_studios_table = Studio.all
get_warnerbros_row = get_studios_table.find_by({"name" => "Warner Bros."})
get_warnerbros_studioid = get_warnerbros_row["id"]

new_row_movies_table = Movie.new
    new_row_movies_table["title"] = "Batman Begins"
    new_row_movies_table["year_released"] = 2005
    new_row_movies_table["rated"] = "PG-13"
    new_row_movies_table["studio_id"] = get_warnerbros_studioid
new_row_movies_table.save

new_row_movies_table = Movie.new
    new_row_movies_table["title"] = "The Dark Knight"
    new_row_movies_table["year_released"] = 2008
    new_row_movies_table["rated"] = "PG-13"
    new_row_movies_table["studio_id"] = get_warnerbros_studioid
new_row_movies_table.save

new_row_movies_table = Movie.new
    new_row_movies_table["title"] = "The Dark Knight Rises"
    new_row_movies_table["year_released"] = 2012
    new_row_movies_table["rated"] = "PG-13"
    new_row_movies_table["studio_id"] = get_warnerbros_studioid
new_row_movies_table.save


new_row_actors_table = Actor.new
    new_row_actors_table["name"] = "Christian Bale"
new_row_actors_table.save

new_row_actors_table = Actor.new
    new_row_actors_table["name"] = "Michael Caine"
new_row_actors_table.save

new_row_actors_table = Actor.new
    new_row_actors_table["name"] = "Liam Neeson"
new_row_actors_table.save

new_row_actors_table = Actor.new
    new_row_actors_table["name"] = "Katie Holmes"
new_row_actors_table.save

new_row_actors_table = Actor.new
    new_row_actors_table["name"] = "Gary Oldman"
new_row_actors_table.save

new_row_actors_table = Actor.new
    new_row_actors_table["name"] = "Heath Ledger"
new_row_actors_table.save

new_row_actors_table = Actor.new
    new_row_actors_table["name"] = "Aaron Eckhart"
new_row_actors_table.save

new_row_actors_table = Actor.new
    new_row_actors_table["name"] = "Maggie Gyllenhaal"
new_row_actors_table.save

new_row_actors_table = Actor.new
    new_row_actors_table["name"] = "Tom Hardy"
new_row_actors_table.save

new_row_actors_table = Actor.new
    new_row_actors_table["name"] = "Joseph Gordon-Levitt"
new_row_actors_table.save

new_row_actors_table = Actor.new
    new_row_actors_table["name"] = "Anne Hathaway"
new_row_actors_table.save


get_movie_table = Movie.all

get_batmanbegins_row = get_movie_table.find_by({"title" => "Batman Begins"})
get_batmanbegins_movieid = get_batmanbegins_row["id"]

get_thedarkknight_row = get_movie_table.find_by({"title" => "The Dark Knight"})
get_thedarkknight_movieid = get_thedarkknight_row["id"]

get_thedarkknightrises_row = get_movie_table.find_by({"title" => "The Dark Knight Rises"})
get_thedarkknightrises_movieid = get_thedarkknightrises_row["id"]


get_actors_table = Actor.all

get_christianbale_row = get_actors_table.find_by({"name" => "Christian Bale"})
get_christianbale_actorid = get_christianbale_row["id"]

get_michaelcaine_row = get_actors_table.find_by({"name" => "Michael Caine"})
get_michaelcaine_actorid = get_michaelcaine_row["id"]

get_liamneeson_row = get_actors_table.find_by({"name" => "Liam Neeson"})
get_liamneeson_actorid = get_liamneeson_row["id"]

get_katieholmes_row = get_actors_table.find_by({"name" => "Katie Holmes"})
get_katieholmes_actorid = get_katieholmes_row["id"]

get_garyoldman_row = get_actors_table.find_by({"name" => "Gary Oldman"})
get_garyoldman_actorid = get_garyoldman_row["id"]

get_heathledger_row = get_actors_table.find_by({"name" => "Heath Ledger"})
get_heathledger_actorid = heathledger_row["id"]

get_aaroneckhart_row = get_actors_table.find_by({"name" => "Aaron Eckhart"})
get_aaroneckhart_actorid = aaroneckhart_row["id"]

get_maggiegyllenhaal_row = get_actors_table.find_by({"name" => "Maggie Gyllenhaal"})
get_maggiegyllenhaal_actorid = maggiegyllenhaal_row["id"]

get_tomhardy_row = get_actors_table.find_by({"name" => "Tom Hardy"})
get_tomhardy_actorid = tomhardy_row["id"]

get_josephgordonlevitt_row = get_actors_table.find_by({"name" => "Joseph Gordon-Levitt"})
get_josephgordonlevitt_actorid = josephgordonlevitt_row["id"]

get_annehathaway_row = get_actors_table.find_by({"name" => "Anne Hathaway"})
get_annehathaway_actorid = annehathaway_row["id"]














new_row_roles_table = Role.new
    new_row_roles_table["movie_id"] = get_batmanbegins_movieid
    new_row_roles_table["actor_id"] = get_christianbale_actorid
    new_row_roles_table["character_name"] = "Bruce Wayne"
new_row_roles_table.save


new_row_roles_table = Role.new
    new_row_roles_table["movie_id"] = get_batmanbegins_movieid
    new_row_roles_table["actor_id"] = get_michaelcaine_actorid
    new_row_roles_table["character_name"] = "Alfred"
new_row_roles_table.save



# Prints a header for the movies output
puts "Movies"
puts "======"
puts ""

# Query the movies data and loop through the results to display the movies output.
# TODO!

# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""

# Query the cast data and loop through the results to display the cast output for each movie.
# TODO!
