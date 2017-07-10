class User < ActiveRecord::Base

  has_secure_password

  has_many :reviews

  validates :first_name, :last_name, :email, :password, :password_confirmation, presence: true
  validates :email, :uniqueness => {:case_sensitive => false}
  validates :password, :password_confirmation, length: { minimum: 4 }

end
