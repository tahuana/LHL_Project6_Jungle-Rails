class UserMailer < ApplicationMailer

  def order_email(user_name, user_email, order, total_amount)

      @user_name = user_name
      @order = order
      @total_amount = total_amount
      mail(to: user_email, subject: "Thank you for your order ##{@order.id}")

  end

end
