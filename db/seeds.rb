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
    [{ name: 'Thinknetica' },
     { name: 'Bill Gates' },
     { name: 'Sergey Antonov' }],
    [:name]
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
     { text: 'Test question #33', test: tests[2] }],
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
    { text: 'A wrong answer', question: questions[8], correct: false }
  ],
  %i[question text]
)
create_array_of!(
  TestTakingSession,
  [
    { user: users[2], test: tests[0] },
    { user: users[2], test: tests[1] },
    { user: users[2], test: tests[2] }
  ],
  %i[user test]
)
