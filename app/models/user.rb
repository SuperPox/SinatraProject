class User < ActiveRecord::Base
    has_many :polls
    has_many :responses, through :polls
    has_secure_password
end