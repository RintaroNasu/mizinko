class Post < ApplicationRecord
    belongs_to :user
    include Discard::Model
end
