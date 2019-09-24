## RDBMS Intro

**RM:** Relational Management. Relating tables together (via linking tables)

**Relational Data Base Management System:** EX: SQLITE

SQLITE: serverless. Good for mobile and small stuff. Bad for anything that'll have simultaneous requests or intense.

**DDL:** Data Definition Language
  Define the structure of the database. What tables to have, columns to include...
    Describes structure of the tables, and
    where we build the table.
  EX:
    CREATE table
    DROP

**DML:** Data Management Language
  Add, edit, delete data in TABLES.
  EX:
    SELECT, INSERT, UPDATE, DELETE FROM,

________________
## Building a database

### From within a import_db.sql file, we SEED the database via:
```
CREATE TABLE #
  col_1
  col_2
  col_3

  FOREIGN KEY (col_3) REFERENCES other_table(ID) /* any foreign keys if we want */


  ; /* end this clause chain */

INSERT INTO
  table_name (col_1, col_2, ...)
VALUES
  (),   /* put in each row of data here */
  (), ...
  ();
```
If we have a foreign key we want to reference, we'll need to SELECT for the corresponding KEY.
  Why? Because we haven't made the foreign keys yet, don't know what it will be, so to make the actual reference, we'll need to query for it (via SELECT).
   This will get executed either when we make the db or when we add new entries I think...
   This [LINK](https://www.red-gate.com/simple-talk/sql/t-sql-programming/questions-about-primary-and-foreign-keys-you-were-too-shy-to-ask/#sixth) just states
   the foreign keys need to be unique, and don't even have to technically reference another table...

14:50 (timestamp in the video)

  We can just directly call `INSERT INTO` in our

What if we want to run SQL from RUBY? ~17:59

```
pry # starts RUBY up in terminal
require 'sqlite3' # a gem to access SQLITE3 within RUBY

plays_db = SQLite3::Database.new('file_name') # Calling a new database class from class SQLite3 ?!? (QUESTION)
```
To access something in the database, we do something like:
```
 plays_db.execute("SQL COMMAND AS A STRING")
 plays_db.execute("SELECT * FROM plays")
```

________________
## ORM Intro: Object RElational Mapping

In Ruby, when we query a table, we get an array in response.
How do we know which entry in the array corresponds to which column?

What if we create a new instance of the database (as a class)? Where we could have all these attributes defined.
We wouldn't have to embed SQL code into quotes.

If we want an instance of a database table play, we need to have a class play.

```class Play```  singular because we want an instance of Play.

 We want to call things directly on an instance (a result of a column?)

What methods will we need? \
*  ```::all```
* ```#initialize``` (to make new instances)
* ```#create``` (to save this into the database.
  * Create a database, and it will somehow know everything in the initialize)

* ```#update``` (to update the instance of the play we created)

__________________
## ORM DEMO (in RUBY)

require 'sqlite3'
require 'singleton'  # only one instance of our database via Singleton
```
class PlayDBConnection < SQLite3::Database # inherit from previous class in PRY.
  include

  def initialize
  super('plays.db')   # passing in the parent initialized version.

    # Properties of our database, to receive results
    self.type_translation = true  # make sure all data we get out is the same as what we return. Pass in integer, return integer (not string)
    self.results_as_hash = true  # we got results back as an array previously. Every column is the key, and values will be values...
  end
end
```
The lecture will focus on below: (in RUBY)

   (SIMILAR TO the HW on playwrights)
```
class Play
  attr_accessor: title, year, playwright_id # to make updates to our table...

  Shows every entry we have in the database
  def self.all
    data_instance = PlayDBConnection.instance  # grab an instance of the class DB (SINGLETON)
    data = data_instance.execute("SELECT * FROM plays") # SELECT QUERY. We want an ORM, an INSTANCE of the play class

    data.map { |datum| Play.new(datun) } # we have to define an initialize to run this display. We create this class based upon the data...
  end

  # new instance of the play class
  def initialize(options)
  # column titles will be passed in.
  # We won't always define the ID because that's defined by the class... or we set it to NIL because we are just adding a new row...?

    @id            = options['id']
    @title         = options['title']
    @year          = options['year']
    @playwright_id = options['playwright_id]
  end

  # save that instance to our DB
  def create
    # Raise an error if @id already exists (meaning it has already been placed into the table)
    raise "#{self} already in database" if @id # if @id exists. truthy
    PlayDBConnection.instance.execute(<<-SQL, @title, @year, @playwright_id )
                                               # heredoc; pass in our previous variables from initialize to create a new row...
                                               # embed a bunch of code to be read as a string.


    INSERT INTO
      plays (title, year, playwright_id)
    VALUES
      (?, ?, ?) # title, year, playwright in the same order as we did in LINE 28.
      # Questions will santize our input. Escape character any keywords or phrases to
      # prevent a SQL injection attack. Ex: Bobby Tables...
    SQL
    @id - PlayDBConnection.instance.last_insert_row_id # Get us id of last row inserted.

  end



  # update a row or entry.
  # we have the id and use it to update the table...
  def update
    rause "#{self} not in database" unless @id
    PlayDBConnection.instance.execute(<<-SQL, @title, @year, @playwright_id, @id) # pass in id because this entry exists already.
                                # we know it exists already
    UPDATE
      plays
    SET
      title = ?, year = ?, playwright_id = ?
    WHERE
      id = ?
    SQL
  end
end
```
### Running things in PRY.
Used these commands to add a value and update an entry...
To update the table, we need to call the table.update
To add a new entry, we have to call .create ... An okay start.

____________________

## SQLite3

SQLite3 is an implementation of SQL. Serverless, so super fast. Crap query planner.
  Only useful for prototyping or as an embedded db distributed alongside another program
    (ex: firefox has a sqlite db for your preferences)

Aside: In Shell, `command 1 | command 2` takes the result of command 1 and puts it into command 2
So in terminal, we can do something like:
 cat create_tables.sql | sqlite3 school.db
to make the database using sqlite3.

Commands here are mostly the same, but there are two new meta commands:
`.tables` and `.schema`

To get RUBY to interact with sqlite3, we'll need the gem.
  `gem install sqlite3`

Unfortunately, SQLite3 isn't full featured.
  - Older versions don't enforce foreign key constraints
  - Drop columns is a bitch (rebuild the table?!?)
  - You can insert whatever into columns, so you create mayhem...
Quick Intro: https://www.sqlite.org/cli.html

_____________________
## Heredocs
[Useful Link](https://www.rubyguides.com/2018/11/ruby-heredoc/ )

They let us embed multi-line strings as code. This is useful if we want to place
  HTML or SQL code literally into our ruby.

```
query =  <<-SQL  # SQL to say it's sql

     # `SQL Code`
     SELECT * FROM tablename
SQL #
```

You can pass in variables as key-value pairs:

```
db.execute(<<-SQL, post_id: post_id)
SELECT
  *
FROM
  posts
JOIN
  comments ON comments.post_id = posts.id
WHERE
  posts.id = :post_id
SQL
```
And just as we saw in the video, using ? instead of the key-value pair will
help prevent SQL injection attacks.

Because these heredocs are strings, we can also use string interpolation... (not covered
by AA for now)
