class User < ApplicationRecord
      has_secure_password

      has_many :posts
      validates :email, presence: true, uniqueness: true, format: { with: /[\w+|.]*\@+[\w+|.]*\.+[0-9a-zA-Z]{2,}/,
                                                                    message: "Invalid email format" }
      validates :password_digest, presence: true, length: { minimum: 3 }
end
