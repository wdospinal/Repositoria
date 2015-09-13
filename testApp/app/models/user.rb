class User < ActiveRecord::Base
  
  validates(:name, presence: true)
  validates(:nickname, presence: true, uniqueness: true)
  has_secure_password
  validates(:password, presence: true, format: {with: /((?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[\W]).{4,64})/})

end
