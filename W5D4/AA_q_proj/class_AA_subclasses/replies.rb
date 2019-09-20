require_relative "../class_AA_q.rb"
class Replies 
  extend SQL_Com_Method
  attr_accessor :id, :reference_subject_id, :reference_parent_id, :reference_user_id, :body
  
  def initialize(options) 
    @id, @reference_subject_id, @reference_parent_id, @reference_user_id, @body = options["id"], options["reference_subject_id"], options["reference_parent_id"], options["reference_user_id"], options["body"]
  end

  def self.find_by_user_id(user_id)
    data = AAQ_DBConnection.instance.execute(<<-SQL, user_id)
      SELECT * 
      FROM replies 
      WHERE reference_user_id = ?
    SQL

    return nil unless data.length > 0
    data.map { |datum| Replies.new(datum) }
  end 

  def self.find_by_question_id(question_id)
    data = AAQ_DBConnection.instance.execute(<<-SQL, question_id)
    SELECT * 
    FROM replies 
    WHERE reference_subj_id = ?
    SQL

    return nil unless data.length > 0
    data.map { |datum| Replies.new(datum) }
  end 

end

puts
puts  '-' * 150
puts
puts "Replies:: Find by Ref User ID"
# p Replies.find_by_user_id(1)
p Replies.find_by_user_id(3)

puts
puts  '-' * 150
puts
puts "Find by Question ID:"
p Replies.find_by_question_id(1)
#p Question.new(5, "does this ORM work?", "Try me please").find_by_id(5)  
