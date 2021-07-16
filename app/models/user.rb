class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def is_superadmin?
    self.role == 'superadmin'
  end

  def is_admin? 
    self.role == 'admin'
  end
end
