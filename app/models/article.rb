class Article < ActiveRecord::Base
  belongs_to :user
  validates :title, presence: true, length: { minimum: 3, maxmum: 50 }
  validates :description, presence: true, length: { minimum: 10, maxmum: 300 }
  validates :user_id, presence: true
end
