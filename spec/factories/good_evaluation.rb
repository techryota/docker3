FactoryBot.define do

  factory :good_evaluation do
    good               {"1"}
    evaluate_user
    evaluated_user
  end

end