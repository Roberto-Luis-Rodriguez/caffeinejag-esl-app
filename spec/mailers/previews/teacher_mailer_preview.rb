# Preview all emails at http://localhost:3000/rails/mailers/teacher_mailer
class TeacherMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/teacher_mailer/account_activation
  def account_activation
    teacher = Teacher.first
    teacher.activation_token = Teacher.new_token
    TeacherMailer.account_activation(teacher)
  end

  # Preview this email at http://localhost:3000/rails/mailers/teacher_mailer/password_reset
  def password_reset
    TeacherMailer.password_reset
  end

end

# # Preview all emails at http://localhost:3000/rails/mailers/teacher_mailer
# class TeacherMailerPreview < ActionMailer::Preview
#
#   # Preview this email at http://localhost:3000/rails/mailers/teacher_mailer/account_activation
#   def account_activation
#     TeacherMailerMailer.account_activation
#   end
#
#   # Preview this email at http://localhost:3000/rails/mailers/teacher_mailer/password_reset
#   def password_reset
#     TeacherMailerMailer.password_reset
#   end
#
# end
