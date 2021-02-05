def create_array_of!(klass, params_hashes_array, array_of_required_params)
  params_hashes_array.map do |params_hash|
    create_if_not_created!(klass, params_hash, array_of_required_params)
  end
end

def create_if_not_created!(klass, params_hash, array_of_required_params)
  klass.find_by(params_hash.slice(*array_of_required_params)) || klass.create!(params_hash)
end

categories =
  create_array_of!(
    Category,
    [{ name: 'Frontend' },
     { name: 'Backend' },
     { name: 'Business' }],
    [:name]
  )

users =
  create_array_of!(
    User,
    [{ name: 'Thinknetica', password: 'Thinknetica', email: 'think@neti.ca', type: 'Admin' },
     { name: 'Bill Gates', password: '1xCD9k44jd', email: 'bill@gat.es', type: 'Admin' },
     { name: 'Sergey Antonov', password: '123qwe', email: 'sergey@anton.ov', type: 'Admin' }],
    [:email]
  )

tests =
  create_array_of!(
    Test,
    [{ name: 'Ruby for beginners',
       category: categories[1],
       author: users[0],
       level: 2 },
     { name: 'Getting Rich: bird-eye perspective',
       category: categories[2],
       author: users[1],
       level: 1 },
     { name: 'My second test',
       category: categories[2],
       author: users[1],
       level: 2 },
     { name: "How to write computer programs in HTML: Tips for Pro's",
       category: categories[0],
       author: users[2],
       level: 3 }],
    %i[name level]
  )

questions =
  create_array_of!(
    Question,
    [{ text: 'Test question #11', test: tests[0] },
     { text: 'Test question #21', test: tests[0] },
     { text: 'Test question #31', test: tests[0] },

     { text: 'Test question #12', test: tests[1] },
     { text: 'Test question #22', test: tests[1] },
     { text: 'Test question #32', test: tests[1] },

     { text: 'Test question #13', test: tests[2] },
     { text: 'Test question #23', test: tests[2] },
     { text: 'Test question #33', test: tests[2] },
    
     { text: 'Test question #14', test: tests[3]}],
    %i[text test]
  )

create_array_of!(
  Answer,
  [
    { text: 'The right answer', question: questions[0], correct: true },
    { text: 'A wrong answer', question: questions[0], correct: false },
    { text: 'The right answer', question: questions[1], correct: true },
    { text: 'A wrong answer', question: questions[1], correct: false },
    { text: 'The right answer', question: questions[2], correct: true },
    { text: 'A wrong answer', question: questions[2], correct: false },

    { text: 'The right answer', question: questions[3], correct: true },
    { text: 'A wrong answer', question: questions[3], correct: false },
    { text: 'The right answer', question: questions[4], correct: true },
    { text: 'A wrong answer', question: questions[4], correct: false },
    { text: 'The right answer', question: questions[5], correct: true },
    { text: 'A wrong answer', question: questions[5], correct: false },

    { text: 'The right answer', question: questions[6], correct: true },
    { text: 'A wrong answer', question: questions[6], correct: false },
    { text: 'The right answer', question: questions[7], correct: true },
    { text: 'A wrong answer', question: questions[7], correct: false },
    { text: 'The right answer', question: questions[8], correct: true },
    { text: 'A wrong answer', question: questions[8], correct: false },

    { text: 'The right answer', question: questions[9], correct: true}
  ],
  %i[question text]
)
create_array_of!(
  TestTakingSession,
  [
    { user: users[2], test: tests[0], current_question: tests[0].questions.last, correct_questions: 2 },
    { user: users[2], test: tests[1], current_question: nil, correct_questions: 3, success: true },
    { user: users[2], test: tests[2], current_question: nil, correct_questions: 3, success: true }
  ],
  %i[user test]
)
create_array_of!(
  Gist,
  [
    {creator: users[2], gist_hash: '0e9a5d0173d6a4dbff1b72436c2a070b', question: questions[6]}
  ],
  [:url]
)

badges =
  create_array_of!(
    Badge,
    [
      {
        name: 'Badge for solving all the Business tests',
        image_url: "http://localhost:3000/smile.bmp",
        condition_type: 'category',
        condition_parameter: categories[2].id
      },
      {
        name: 'Badge for the 1st triers',
        image_url: "http://localhost:3000/smile.bmp",
        condition_type: 'tries_count',
        condition_parameter: 1
      },
      {
        name: 'For passing all level 2 tests',
        image_url: "http://localhost:3000/smile.bmp",
        condition_type: 'level',
        condition_parameter: 2
      }
    ],
    [:name]
  )

create_array_of!(
  Rewarding,
  [
    {user: users[2], badge: badges[0]},
    {user: users[2], badge: badges[1]}
  ],
  [:user, :badge]
)
