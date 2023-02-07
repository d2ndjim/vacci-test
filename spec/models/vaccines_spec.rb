require 'rails_helper'

RSpec.describe Vaccine, type: :model do
  @user = User.create(first_name: 'Eid', last_name: 'Hachem', relationship: 'Father', email: 'test@test.com', password: '123456')
  @ward = Ward.create(first_name: 'Junior', last_name: 'Jimoh', user_id: @user, date_of_birth: '2023-01-01', gender: 'Male', weight: '20.0',
                      height: '23.0')
  subject { Vaccine.new(name: 'Polio', ward_id: @ward, vaccination_date: '2023-02-14', vaccination_type: 'Week 6') }
  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'date of vaccination should be present' do
    subject.vaccination_date = nil
    expect(subject).to_not be_valid
  end

  it 'vaccine should belongs to a ward' do
    subject.ward_id = nil
    expect(subject).to_not be_valid
  end

  it 'completion status should be false by default' do
    expect(subject.completed).to eq(false)
  end

  it 'vaccine type should be present' do
    subject.vaccination_type = nil
    expect(subject).to_not be_valid
  end
end
