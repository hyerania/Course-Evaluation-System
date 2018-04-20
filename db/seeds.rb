# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Student.create([{
    uin: 123000123,
    name: 'Ruth Morris',
    section: 500,
    attempts: 0,
    score: -1,
    last_start: DateTime.strptime("03/10/2018 17:00", "%m/%d/%Y %H:%M"),
    last_end: DateTime.strptime("03/10/2018 20:00", "%m/%d/%Y %H:%M")
}])

Question.create([{
    qid: 1001,
    content: "What is the color of the sky?",
    qtype: "MC",
    answer: "Blue",
    created_at: DateTime.strptime("03/10/2018 17:00", "%m/%d/%Y %H:%M"),
    updated_at: DateTime.strptime("03/10/2018 17:00", "%m/%d/%Y %H:%M"),
    c1: "Red",
    c2: "Blue",
    c3: "White",
    c4: "Pink",
    c5: "Orange",
    c1_count:0,
    c2_count:0,
    c3_count:0,
    c4_count:0,
    c5_count:0,
},
    {qid: 1002, content: "What is the color of the grass?", qtype: "ML", answer: "Green", c1: "Blue", c2: "Green", c3: "Brown", c4: "Violet", c5: "Red", created_at: DateTime.strptime("03/24/2018 17:00", "%m/%d/%Y %H:%M"),updated_at: DateTime.strptime("03/24/2018 17:00", "%m/%d/%Y %H:%M"), c1_count:0,c2_count:0,c3_count:0,c4_count:0,c5_count:0},
    {qid: 1003, content: "What is the color of the blood?", qtype: "ML", answer: "Green", c1: "Blue", c2: "Green", c3: "Brown", c4: "Violet", c5: "Red", created_at: DateTime.strptime("03/24/2018 17:00", "%m/%d/%Y %H:%M"),updated_at: DateTime.strptime("03/24/2018 17:00", "%m/%d/%Y %H:%M"), c1_count:0,c2_count:0,c3_count:0,c4_count:0,c5_count:0},
    {qid: 1004, content: "What is the color of the hair?", qtype: "ML", answer: "Green", c1: "Blue", c2: "Green", c3: "Brown", c4: "Violet", c5: "Red", created_at: DateTime.strptime("03/24/2018 17:00", "%m/%d/%Y %H:%M"),updated_at: DateTime.strptime("03/24/2018 17:00", "%m/%d/%Y %H:%M"), c1_count:0,c2_count:0,c3_count:0,c4_count:0,c5_count:0},
    {qid: 1005, content: "What is the color of the blood2?", qtype: "ML", answer: "Green", c1: "Blue", c2: "Green", c3: "Brown", c4: "Violet", c5: "Red", created_at: DateTime.strptime("03/24/2018 17:00", "%m/%d/%Y %H:%M"),updated_at: DateTime.strptime("03/24/2018 17:00", "%m/%d/%Y %H:%M"), c1_count:0,c2_count:0,c3_count:0,c4_count:0,c5_count:0},
    {qid: 1006, content: "What is the color of the blood3?", qtype: "ML", answer: "Green", c1: "Blue", c2: "Green", c3: "Brown", c4: "Violet", c5: "Red", created_at: DateTime.strptime("03/24/2018 17:00", "%m/%d/%Y %H:%M"),updated_at: DateTime.strptime("03/24/2018 17:00", "%m/%d/%Y %H:%M"), c1_count:0,c2_count:0,c3_count:0,c4_count:0,c5_count:0}
])

AccessCode.create([{
    code: "CSCE120-2018"
}])

AdminKey.create([{
    key: "99f427c0c6a2411bc8a046f26c8aa4cb45bba27f"
}])