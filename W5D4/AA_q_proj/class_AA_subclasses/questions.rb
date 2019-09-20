require_relative "../class_AA_q.rb"

class Questions   
  extend SQL_Com_Method

  attr_accessor :id, :title, :body 

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @body = options['body']
  end 

  def self.find_by_author_id(author_id)
    data = AAQ_DBConnection.instance.execute(<<-SQL, author_id) 
      SELECT * 
      FROM questions
      WHERE users_id = ?
    SQL

    return nil unless data.length > 0 
    # self.new(data.first)
    #self.new(data) 

    data.map { |datum| Questions.new(datum)}
  end
 
  # def self.find_by_question_id()
  # end


end 

puts
puts  '-' * 150
puts
puts "Find by ID:"
p Questions.find_by_id(1)
#p Question.new(5, "does this ORM work?", "Try me please").find_by_id(5)  
puts
puts  '-' * 150
puts
puts "Questions:: Find by Author"
p Questions.find_by_author_id(1)
