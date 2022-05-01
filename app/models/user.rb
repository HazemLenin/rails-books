class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy
  
  validates :email, uniqueness: true
  validates :username, uniqueness: true
  
  rolify

  has_many :book_statuses, dependent: :destroy
  
  def get_full_name
    self.first_name + ' ' + self.last_name
  end
  
  after_create :assign_default_role
  
  def assign_default_role
    self.add_role(:reader)
  end

  def admin?
    self.has_role?(:admin)
  end
end
