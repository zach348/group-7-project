require 'rails_helper'

RSpec.describe User, type: :model do

  describe User do
    it { should have_valid(:first_name).when('john', 'Sally') }
    it { should_not have_valid(:first_name).when(nil, '') }

    it { should have_valid(:last_name).when('smith', 'Swanson') }
    it { should_not have_valid(:last_name).when(nil, '') }

    it { should have_valid(:email).when('user@example.com', 'another@gmail.com') }
    it { should_not have_valid(:email).when(nil, '', 'urser', 'asdfas') }

    it 'has a matching password confirmation for the password' do
      user = User.new
      user.password = 'password'
      user.password_confirmation = "another password"

      expect(user).to_not be_valid
      expect(user.errors[:password_confirmation]).to_not be_blank
    end
  end

  describe '#admin?' do
    it 'is not an admin if the role is not admin' do
      user = FactoryGirl.create(:user, role: 'member')
      expect(user.admin?).to eq(false)
    end

    it 'is an admin if the role is admin' do
      user = FactoryGirl.create(:user, role: 'admin')
      expect(user.admin?).to eq(true)
    end
  end
end
