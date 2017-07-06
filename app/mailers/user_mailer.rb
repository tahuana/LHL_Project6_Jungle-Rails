class UserMailer < ApplicationMailer

  def order_email(user, order)

    @user = user
    @order  = order
    mail(to: @user.email, subject: "Thank you for your order ##{@order.id}")
  end

end
