category_title = ["Animal", "Science", "Economic", "Culture", "Logistics", "Music", "People", "Galaxy"]
category_title.length.times do |n|
  Category.create! title: category_title[n]
end

Admin.create!(name: "Admin", email: "admin@gmail.com", password: "123456",
  password_confirmation: "123456", gender: 1)

30.times do |n|
  Member.create!(name: Faker::Name.unique.name, email: "member#{n+1}@gmail.com",
    password: "123456", password_confirmation: "123456", gender: rand(0..1))
end

40.times do
  Test.create!(
    category_id: rand(Category.first.id..Category.last.id),
    status: rand(0..1),
    questions_attributes:[
      {
        content: Faker::Lorem.question, 
        options_attributes:[
          {content: Faker::Lorem.sentence, correct: 1},
          {content: Faker::Lorem.sentence, correct: 0},
          {content: Faker::Lorem.sentence, correct: 0},
          {content: Faker::Lorem.sentence, correct: 0}
        ]
      },
      {
        content: Faker::Lorem.question, 
        options_attributes:[
          {content: Faker::Lorem.sentence, correct: 1},
          {content: Faker::Lorem.sentence, correct: 0},
          {content: Faker::Lorem.sentence, correct: 0},
          {content: Faker::Lorem.sentence, correct: 0}
        ]
      },
      {
        content: Faker::Lorem.question, 
        options_attributes:[
          {content: Faker::Lorem.sentence, correct: 1},
          {content: Faker::Lorem.sentence, correct: 0},
          {content: Faker::Lorem.sentence, correct: 0},
          {content: Faker::Lorem.sentence, correct: 0}
        ]
      },
      {
        content: Faker::Lorem.question, 
        options_attributes:[
          {content: Faker::Lorem.sentence, correct: 1},
          {content: Faker::Lorem.sentence, correct: 0},
          {content: Faker::Lorem.sentence, correct: 0},
          {content: Faker::Lorem.sentence, correct: 0}
        ]
      },
      {
        content: Faker::Lorem.question, 
        options_attributes:[
          {content: Faker::Lorem.sentence, correct: 1},
          {content: Faker::Lorem.sentence, correct: 0},
          {content: Faker::Lorem.sentence, correct: 0},
          {content: Faker::Lorem.sentence, correct: 0}
        ]
      }
    ]
  )
end

published_test_id = Test.publish.pluck(:id)
member_id = Member.pluck(:id)
a = member_id.product(published_test_id)
(a.size - 100).times do |n|
  UserTest.create!(
    user_id: a[n-1][0],
    test_id: a[n-1][1]
  )
end
