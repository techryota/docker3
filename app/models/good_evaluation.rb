class GoodEvaluation < ApplicationRecord
  belongs_to :evaluate_user, class_name: "User", foreign_key: :evaluate_id
  belongs_to :evaluated_user, class_name: "User", foreign_key: :user_id
end
