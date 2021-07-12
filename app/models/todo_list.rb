class TodoList < ApplicationRecord
  has_many :todo_items
  has_rich_text :wedding_description
end
