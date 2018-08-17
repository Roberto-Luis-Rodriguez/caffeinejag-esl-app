require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the TeachersHelper. For example:
#
# describe TeachersHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end

RSpec.describe TeachersHelper, type: :helper do

# Returns true if a test user is signed in.
  def is_signed_in?
    !session[:teacher_id].nil?
  end

  # Log in as a particular user.
 def signed_in_as(teacher)
   session[:teacher_id] = teacher.id
 end
end
 
