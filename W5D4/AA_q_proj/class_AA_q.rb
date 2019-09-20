require "sqlite3"
require "singleton"
# Below requires not workin WHYYYYYY?????
# require_relative "class_AA_subclasses/users.rb"
# require_relative "class_AA_subclasses/questions.rb"
# require_relative "class_AA_subclasses/questions_follows.rb"
# require_relative "class_AA_subclasses/replies.rb"
# require_relative "class_AA_subclasses/questions_likes.rb"

module SQL_Com_Method 
  def find_by_id(id) #tested successfully
    class_name = self.name.to_s
   #  p class_name
    data = AAQ_DBConnection.instance.execute(<<-SQL, id) 
      SELECT * 
      FROM #{class_name}
      WHERE id = ?
    SQL
    
    return nil unless data.length > 0
    self.new(data.first)
  end
end

class AAQ_DBConnection < SQLite3::Database
  include Singleton

  def initialize
    super('questions.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end


############ TESTS #######
