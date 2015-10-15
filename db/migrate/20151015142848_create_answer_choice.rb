class CreateAnswerChoice < ActiveRecord::Migration
  def change
    create_table :answer_options do |t|
      t.integer :question_id, unique: true
      t.text :answer_option

      t.timestamps
    end
    add_index :answer_options, :question_id
    add_index :answer_options, :answer_option
  end
end
