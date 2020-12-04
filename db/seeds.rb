Category.create!([
                   { name: 'Frontend' },
                   { name: 'Backend' },
                   { name: 'Business' }
                 ])
User.create!([
               { name: 'Thinknetica' },
               { name: 'Bill Gates' },
               { name: 'Sergey Antonov' }
             ])
Test.create!([
               { name: 'Ruby for beginners', category_id: 2, user_id: 1, level: 0 },
               { name: 'Getting Rich: bird-eye perspective', category_id: 3, user_id: 2, level: 1 },
               { name: "How to write computer programs in HTML: Tips for Pro's", category_id: 1, user_id: 3, level: 3 }
             ])
Question.create!([
                   { text: 'Test question #11', test_id: 1 },
                   { text: 'Test question #21', test_id: 1 },
                   { text: 'Test question #31', test_id: 1 },

                   { text: 'Test question #12', test_id: 2 },
                   { text: 'Test question #22', test_id: 2 },
                   { text: 'Test question #32', test_id: 2 },

                   { text: 'Test question #13', test_id: 3 },
                   { text: 'Test question #23', test_id: 3 },
                   { text: 'Test question #33', test_id: 3 }
                 ])
Answer.create!([
                 { text: 'The right answer', question_id: 1, correct: true },
                 { text: 'A wrong answer', question_id: 1, correct: false },
                 { text: 'The right answer', question_id: 2, correct: true },
                 { text: 'A wrong answer', question_id: 2, correct: false },
                 { text: 'The right answer', question_id: 3, correct: true },
                 { text: 'A wrong answer', question_id: 3, correct: false },

                 { text: 'The right answer', question_id: 4, correct: true },
                 { text: 'A wrong answer', question_id: 4, correct: false },
                 { text: 'The right answer', question_id: 5, correct: true },
                 { text: 'A wrong answer', question_id: 5, correct: false },
                 { text: 'The right answer', question_id: 6, correct: true },
                 { text: 'A wrong answer', question_id: 6, correct: false },

                 { text: 'The right answer', question_id: 7, correct: true },
                 { text: 'A wrong answer', question_id: 7, correct: false },
                 { text: 'The right answer', question_id: 8, correct: true },
                 { text: 'A wrong answer', question_id: 8, correct: false },
                 { text: 'The right answer', question_id: 9, correct: true },
                 { text: 'A wrong answer', question_id: 9, correct: false }
               ])
TestTakingSession.create!([
                            { user_id: 3, test_id: 1 },
                            { user_id: 3, test_id: 2 },
                            { user_id: 3, test_id: 3 }
                          ])
