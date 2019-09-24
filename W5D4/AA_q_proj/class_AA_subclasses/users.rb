require_relative "../class_AA_q.rb"
require_relative "questions.rb"
require_relative "replies.rb"
require_relative "users.rb"

class Users 
  extend SQL_Com_Method
  attr_accessor :id, :fname, :lname

  def initialize(options)
    @id = options['id']
    @fname = options['fname']
    @lname = options['lname']
  end

  def self.find_by_name(fname, lname)
    data = AAQ_DBConnection.instance.execute(<<-SQL, fname, lname)
      SELECT *
      FROM
       users 
      WHERE 
        fname = ? AND lname = ?
    SQL

    return nil unless data.length > 0
    Users.new(data.first)
  end

  def authored_questions(id)
    Questions.find_by_author_id(id)    
  end

  def authored_replies(id)
    Replies.find_by_question_id(id)
  end

end

## Tests

puts
puts  '-' * 150
puts
puts "Find by ID:"
p Users.find_by_id(2)

puts
puts  '-' * 150
puts
puts "USERS::Find_by_name"
p Users.find_by_name("Alex", "Duveneck") 


puts
puts  '-' * 150
puts
puts "USERS#authored_questions"

user1 = Users.find_by_id(1)
p user1.authored_questions(2) 

puts
puts  '-' * 150
puts
puts "USERS#authored_replies"

p user1.authored_replies(2) 