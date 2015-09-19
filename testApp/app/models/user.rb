class User < ActiveRecord::Base
  has_many :friendships
  has_many :friends, :through => :friendships
  validates(:name, presence: true)
  validates(:nickname, presence: true, uniqueness: true)
  has_secure_password
  validates(:password, presence: true, format: {with: /((?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[\W]).{4,64})/ , message: 'invalid'})

end
