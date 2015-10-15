# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


#destroy
User.destroy_all
Poll.destroy_all
Question.destroy_all
AnswerOption.destroy_all

#users
new_users = []
10.times do |i| new_users << User.create!(:name => "NamedUser#{i}") end

#polls
new_polls = []
3.times do |i|
  new_polls << Poll.create!(:author_id => new_users[i].id, :title => "Title #{i}") end

#questions
new_questions = []
3.times do |i|
  new_questions << Question.create!(:poll_id => new_polls[i].id, :question => "#{i} primaries in a row will Hillary?")
end

#answer_options
new_options = []
5.times do |a_num|
  new_questions.each do |q_id|
    new_options << AnswerOption.create!(:question_id => q_id.id, :answer_option => "Yes of course #{q_id.id} AND #{a_num}" )
  end
end
