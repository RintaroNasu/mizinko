class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
        validates :name, presence: true #追記
        validates :profile, length: { maximum: 200 } 
        has_many :posts,dependent: :destroy
end
