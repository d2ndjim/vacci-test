require 'rails_helper'

RSpec.describe Ward, type: :model do
  @user = User.create(first_name: 'Eid', last_name: 'Hachem', relationship: 'Father', email: 'test@test.com', password: '123456')
  subject do
    Ward.new(first_name: 'Junior', last_name: 'Jimoh', user_id: @user, date_of_birth: '2023-01-01', gender: 'Male', weight: '20.0', height: '23.0')
  end
  before { subject.save }

  it 'first name should be present' do
    subject.first_name = nil
    expect(subject).to_not be_valid
  end

  it 'last name should be present' do
    subject.last_name = nil
    expect(subject).to_not be_valid
  end

  it 'date of birth should be present' do
    subject.date_of_birth = nil
    expect(subject).to_not be_valid
  end

  it 'ward should belongs to a user' do
    subject.user_id = nil
    expect(subject).to_not be_valid
  end

  it 'ward gender should be present' do
    subject.gender = nil
    expect(subject).to_not be_valid
  end
end
