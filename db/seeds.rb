categories =
  Category.create!([
                     { name: 'Frontend' },
                     { name: 'Backend' },
                     { name: 'Business' }
                   ])
users =
  User.create!([
                 { name: 'Thinknetica' },
                 { name: 'Bill Gates' },
                 { name: 'Sergey Antonov' }
               ])
tests =
  Test.create!([
                 { name: 'Ruby for beginners',
                   category_id: categories[1].id,
                   author_id: users[0].id,
                   level: 0 },
                 { name: 'Getting Rich: bird-eye perspective',
                   category_id: categories[2].id,
                   author_id: users[1].id,
                   level: 1 },
                 { name: "How to write computer programs in HTML: Tips for Pro's",
                   category_id: categories[0].id,
                   author_id: users[2].id,
                   level: 3 }
               ])
questions =
  Question.create!([
                     { text: 'Test question #11', test_id: tests[0].id },
                     { text: 'Test question #21', test_id: tests[0].id },
                     { text: 'Test question #31', test_id: tests[0].id },

                     { text: 'Test question #12', test_id: tests[1].id },
                     { text: 'Test question #22', test_id: tests[1].id },
                     { text: 'Test question #32', test_id: tests[1].id },

                     { text: 'Test question #13', test_id: tests[2].id },
                     { text: 'Test question #23', test_id: tests[2].id },
                     { text: 'Test question #33', test_id: tests[2].id }
                   ])
Answer.create!([
                 { text: 'The right answer', question_id: questions[0].id, correct: true },
                 { text: 'A wrong answer', question_id: questions[0].id, correct: false },
                 { text: 'The right answer', question_id: questions[1].id, correct: true },
                 { text: 'A wrong answer', question_id: questions[1].id, correct: false },
                 { text: 'The right answer', question_id: questions[2].id, correct: true },
                 { text: 'A wrong answer', question_id: questions[2].id, correct: false },

                 { text: 'The right answer', question_id: questions[3].id, correct: true },
                 { text: 'A wrong answer', question_id: questions[3].id, correct: false },
                 { text: 'The right answer', question_id: questions[4].id, correct: true },
                 { text: 'A wrong answer', question_id: questions[4].id, correct: false },
                 { text: 'The right answer', question_id: questions[5].id, correct: true },
                 { text: 'A wrong answer', question_id: questions[5].id, correct: false },

                 { text: 'The right answer', question_id: questions[6].id, correct: true },
                 { text: 'A wrong answer', question_id: questions[6].id, correct: false },
                 { text: 'The right answer', question_id: questions[7].id, correct: true },
                 { text: 'A wrong answer', question_id: questions[7].id, correct: false },
                 { text: 'The right answer', question_id: questions[8].id, correct: true },
                 { text: 'A wrong answer', question_id: questions[8].id, correct: false }
               ])
TestTakingSession.create!([
                            { user_id: users[2].id, test_id: tests[0].id },
                            { user_id: users[2].id, test_id: tests[1].id },
                            { user_id: users[2].id, test_id: tests[2].id }
                          ])
