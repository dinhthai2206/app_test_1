class MemberMailer < ApplicationMailer
  def welcome member, password
    @member = member
    @password = password
    mail to: member.email, subject: "Welcome"
  end
end
