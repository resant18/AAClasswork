require_relative "../class_AA_q.rb"

class Question_Follows 
  extend SQL_Com_Method
  attr_accessor :id, :users_id, :questions_id

  def initialize(options)
    @id, @users_id, @questions_id = options["id"], options["users_id"], options["questions_id"]
  end

  def self.followed_questions_for_user_id(user_id)
    data = AAQ_DBConnection.instance.execute(<<-SQL, user_id)
      SELECT *
      FROM
       question_follows 
      WHERE 
        users_id = ?
    SQL

    return nil unless data.length > 0
    data.map { |datum| Question_Follows.new(datum) }
  end

end

puts
puts  '-' * 150
puts
puts "Question_Follows_questions_for_user_id"
p Question_Follows.followed_questions_for_user_id(2)

