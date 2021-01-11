class TestsMailer < ApplicationMailer
  def completed_test(test_taking_session)
    @user = test_taking_session.user
    @test = test_taking_session.test

    mail to: @user.email, subject: 'You just completed the TestGuru test!'
  end
end
