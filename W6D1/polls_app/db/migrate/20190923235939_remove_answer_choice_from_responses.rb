class RemoveAnswerChoiceFromResponses < ActiveRecord::Migration[5.2]
  def change
    remove_column :responses, :answer_choice, :integer
  end
end
