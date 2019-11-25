class GoodEvaluation < ApplicationRecord
  belongs_to :user 
  belongs_to :evaluate_user, class_name: :user, foreign_key: :evaluate_user_id
  
  validates :evaluate_user_id, uniqueness: true
end
