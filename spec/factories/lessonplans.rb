FactoryBot.define do
  factory :lessonplan do
    name {"AnythingDoc"}
    association :teacher
    attachment {"AnythingDoc"}
    teacher {"Anything"}
  end
end

# FactoryBot.define do
#   factory :lessonplan do
#     sequence(:name) { |n| "Lessonplan Number #{n}" }
#     association :teacher
#     attachment {"AnythingDoc"}
#     teacher {"Anything"}
#   end
# end
