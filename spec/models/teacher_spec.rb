require 'rails_helper'

  RSpec.describe Teacher, type: :model do
    subject { Teacher.new(name: "teacher", email: "teacher@example.com", password: "swordfish", password_confirmation: "swordfish") }

    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without a name" do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without an email" do
      subject.email = nil
      expect(subject).to_not be_valid
     end

    it "is not valid with a name letter count over 50" do
      subject.name = "a" * 51
      expect(subject).to_not be_valid
     end

    it "is not valid with an email character count over 255" do
      subject.email = "a" * 244 + "@example.com"
      expect(subject).to_not be_valid
     end

    it "should accept only valid email addresses" do
     valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
     valid_addresses.each do |valid_address|
      subject.email = valid_address
      expect(subject).to be_valid
      end
    end

    it 'should not accept an email with an invalid format' do
    subject.email = "bugs"
    expect(subject).to_not be_valid
   end

   describe '.validation' do

     context 'when email is not unique' do
       before { Teacher.create!(name: "teacher", email: "teacher@example.com", password: "swordfish", password_confirmation: "swordfish" ) }
      it {expect(subject).to be_invalid}
    end
  end

   context 'when email is unique' do
      before { Teacher.create!(name: "teacher", email: "teacher@example.com", password: "swordfish", password_confirmation: "swordfish" ) }
      it {expect(subject).to_not be_valid}
    end

    it " should have a password that is present (nonblank)" do
    subject.password = subject.password_confirmation = " " * 6
    expect(subject).to_not be_valid
   end

    it "should have a password with a minimum length" do
    subject.password = subject.password_confirmation = "a" * 5
    expect(subject).to_not be_valid
  end

end
