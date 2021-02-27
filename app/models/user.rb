class User < ActiveRecord::Base
    has_many :polls
    has_many :responses
    has_secure_password
    validates_uniqueness_of(:username)
end