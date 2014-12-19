class User < ActiveRecord::Base
    has_many :items, :foreign_key => :created_user
end
