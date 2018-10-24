# require 'rails_helper'
#
# RSpec.describe "Sessions" do
#
#   it "signs user in and out" do
#     teacher = FactoryBot.create(:teacher)
#     teacher.confirm
#
#     sign_in teacher
#     get authenticated_root_path
#     expect(controller.current_teacher).to eq(teacher)
#
#     sign_out teacher
#     get authenticated_root_path
#     expect(controller.current_teacher).to be_nil
#   end
# end
