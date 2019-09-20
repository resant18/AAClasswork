SQL
We'll first construct a series of tables. Write the table definitions in a SQL script named import_db.sql.

Add a users table.
Should track fname and lname attributes.
Add a questions table.
Track the title, the body, and the associated author (a foreign key).
Add a question_follows table.
This should support the many-to-many relationship between questions and users (a user can have many questions she is following, and a question can have many followers).
This is an example of a join table; the rows in question_follows are used to join users to questions and vice versa.
Add a replies table.
Each reply should contain a reference to the subject question.
Each reply should have a reference to its parent reply.
Each reply should have a reference to the user who wrote it.
Don't forget to keep track of the body of a reply.
"Top level" replies don't have any parent, but all replies have a subject question.
It's okay for a column to be self referential; a foreign key can point to a primary key in the same table.
Add a question_likes table.
Users can like a question.
Have references to the user and the question in this table
At the top of your import_db.sql file make sure you add the line PRAGMA foreign_keys = ON;. This statement makes sqlite3 actually respect the foreign key constraints you've added in your CREATE TABLE statements. Whenever we have a foreign key column in a table we want to make sure that the id we provide actually references a record in the corresponding table. If you plan on putting DROP TABLE statements at the top of your import_db.sql file you need to make sure you're dropping the tables in the right order. If you drop a table that is depended upon by a foreign key in another table, you will get an error telling you you've violated the foreign key constraint.

You will probably also want to write some INSERT statements at the bottom of your import_db.sql file, so that you have some data in each table to play with. We call this 'seeding the database'.

After you've written the SQL, don't forget to run the SQL commands and create the db - in terminal, run:

cat import_db.sql | sqlite3 questions.db
Now go into your shiny, new sqlite database and try making some basic queries to ensure that seeding proceeded as planned. Use sqlite3 questions.db to open the sqlite3 console with questions.db loaded.

NB Running .headers on and .mode column will greatly enhance the readability of the outputs: