class Contact < ApplicationRecord
  validates :email, :title, :body, presence: true
  validates :title, length: {minimum: 10 , too_short: "Minimo de caracteres %{count} caracteres."}
  validates :body, length: {minimum: 100, too_short: "Minimo de caracteres %{count} caracteres."}
end
