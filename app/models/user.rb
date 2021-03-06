class User < ApplicationRecord
    validates :name, presence: true, length: { maximum: 15 }
    # validates :email, presence: true, format: { with: /\A[A-Za-z0-9._+]+@[A-Za-z]+\.[A-Za-z]\z/ }
    validates :email, presence: true, format: { with: /[a-zA-Z0-9._+]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*/ }
    validates :password, length: { in: 8..32 }, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }
    has_secure_password
    
    has_many :topics
    has_many :favorites
    has_many :favorite_topics, through: :favorites, source: 'topic'
end
