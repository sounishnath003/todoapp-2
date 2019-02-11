class TodoList < ApplicationRecord
  validates :title, presence: true, uniqueness: { case_sensitive: false }, length: {maximum: 50}

  validates :description, presence: true, uniqueness: { case_sensitive: false }, length: {minimum: 5, maximum:50}

  has_many :todo_items, dependent: :destroy

  # def self.search(search)
  #   todo_list = TodoList.find_by(title: search)
  #   if todo_list
  #     self.where(todo_list_id: todo_list)
  #   else
  #     todo_list.all
  # end
  # else
  #   todo_list.all
  # end
end
