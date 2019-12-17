class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :groups
  has_many :messages
  has_many :good_evaluations
  has_many :counts
  has_many :scores
  
  mount_uploader :image, ImageUploader
  validates :name, presence: true

  def good_evaluation_count
    self.good_evaluations.count
  end
end
