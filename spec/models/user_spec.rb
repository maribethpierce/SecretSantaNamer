require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many :friends_groups }
  # it { should have_many :groups, through: :friends_groups } ?? how ??

  it { should have_valid(:email).when("email@gmail.com", "gmail@email.com") }
  it { should_not have_valid(:email).when(nil, '', 'zest.com') }

  it { should have_valid(:password).when("awefsdfs", "2133fewfs") }
  it { should_not have_valid(:password).when(nil, '', '16', 'pwd') }

  it "should default to admin false" do
    user = User.create!(name: "Bernie", email: "bernie@gmail.com", password: "password")
    expect(user.admin?).to eq(false)
  end

  it "should not accept nonunique emails" do
    User.create!(name: "Jen", email: "jen@gmail.com", password: "password")
    user = User.new(name: "Jen", email: "jen@gmail.com", password: "wordpass")
    expect(user.valid?).to eq(false)
    expect(user.errors.full_messages[0]).to eq("Email has already been taken")
  end
end
