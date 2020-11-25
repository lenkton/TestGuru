# README

Ruby version used: 2.7.2

In the model of the project the following entities are created:

* Category is a set of tests which have some common property.

* Test - contains the questions and right answers.
Also has an author (or several authors), a set of connected categories
and a set of links to results.

  * Question is the text, which has a set of right answers.

  * Answer is a text or an option, connected with one of the questions.
If not in the set of the right answers, considered to be wrong.

  * Result is a set of answers with corresponding marks (each answer is either right or wrong).

* User is the registered (or not) user of the service.
If registered, has a set of results.

* Author is a user who has created a test (or several tests).
