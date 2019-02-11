class TodoList < ApplicationRecord
  validates :title, presence: true, uniqueness: { case_sensitive: false }, length: {maximum: 50}

  validates :description, presence: true, uniqueness: { case_sensitive: false }, length: {minimum: 5, maximum:50}

  has_many :todo_items, dependent: :destroy
end
