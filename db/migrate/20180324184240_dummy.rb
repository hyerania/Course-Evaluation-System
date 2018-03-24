class Dummy < ActiveRecord::Migration[5.1]
  def change
    Question.create :qid => 1002, :content => "What is the color of the grass?", :qtype => "ML", :answer => "Green", :c1 => "Blue", :c2 => "Green", :c3 => "Brown", :c4 => "Violet", :c5 => "Red", created_at: DateTime.strptime("03/24/2018 17:00", "%m/%d/%Y %H:%M"),updated_at: DateTime.strptime("03/24/2018 17:00", "%m/%d/%Y %H:%M")
    Question.create :qid => 1003, :content => "What is the color of the blood?", :qtype => "ML", :answer => "Green", :c1 => "Blue", :c2 => "Green", :c3 => "Brown", :c4 => "Violet", :c5 => "Red", created_at: DateTime.strptime("03/24/2018 17:00", "%m/%d/%Y %H:%M"),updated_at: DateTime.strptime("03/24/2018 17:00", "%m/%d/%Y %H:%M")
    Question.create :qid => 1004, :content => "What is the color of the hair?", :qtype => "ML", :answer => "Green", :c1 => "Blue", :c2 => "Green", :c3 => "Brown", :c4 => "Violet", :c5 => "Red", created_at: DateTime.strptime("03/24/2018 17:00", "%m/%d/%Y %H:%M"),updated_at: DateTime.strptime("03/24/2018 17:00", "%m/%d/%Y %H:%M")
    Question.create :qid => 1005, :content => "What is the color of the blood?", :qtype => "ML", :answer => "Green", :c1 => "Blue", :c2 => "Green", :c3 => "Brown", :c4 => "Violet", :c5 => "Red", created_at: DateTime.strptime("03/24/2018 17:00", "%m/%d/%Y %H:%M"),updated_at: DateTime.strptime("03/24/2018 17:00", "%m/%d/%Y %H:%M")
    Question.create :qid => 1006, :content => "What is the color of the blood?", :qtype => "ML", :answer => "Green", :c1 => "Blue", :c2 => "Green", :c3 => "Brown", :c4 => "Violet", :c5 => "Red", created_at: DateTime.strptime("03/24/2018 17:00", "%m/%d/%Y %H:%M"),updated_at: DateTime.strptime("03/24/2018 17:00", "%m/%d/%Y %H:%M")
  end
end
