require_relative "../class_AA_q.rb"
class Questions_Likes
  extend SQL_Com_Method
  attr_accessor :id, :user_id, :question 

  def initialize(options)
    @id = id  
    @user_id = user_id
    @question = question
  end

end