require 'rails_helper'

RSpec.describe User, type: :model do
  it "no es válido sin email" do
    user = User.new(password: "123456")

    expect(user).not_to be_valid
  end
end