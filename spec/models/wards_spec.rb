require 'rails_helper'

RSpec.describe Ward, type: :model do
  @user = User.create(first_name: 'Eid', last_name: 'Hachem', relationship: 'Father', email: 'test@test.com', password: '123456')
  subject { Watd.new(first_name: 'Junior', last_name: 'Jimoh', user_id: @user, date_of_birth: @hall) }
  before { subject.save }

  it 'reservation date should be present' do
    subject.reserve_date = nil
    expect(subject).to_not be_valid
  end

  it 'reservation status should be present' do
    subject.status = nil
    expect(subject).to_not be_valid
  end

  it 'reservation status should not be more than 20 characters' do
    subject.status = 'a' * 21
    expect(subject).to_not be_valid
  end

  it 'Reservation should belongs to a user' do
    subject.user_id = nil
    expect(subject).to_not be_valid
  end

  it 'Reservation should belongs to a hall' do
    subject.hall_id = nil
    expect(subject).to_not be_valid
  end
end
