require "spec_helper"

describe WelcomeMailer do
  before(:each) do
    ActionMailer::Base.delivery_method = :test
    ActionMailer::Base.perform_deliveries = true
    ActionMailer::Base.deliveries = []
    user = create(:user)
    WelcomeMailer.welcome(user.id).deliver
  end
  after(:each) do
  ActionMailer::Base.deliveries.clear
  end
    it 'should send an email' do
      expect(ActionMailer::Base.deliveries.count).to eq 1
    end

    it 'should set the subject to the correct subject' do
      expect(ActionMailer::Base.deliveries.first.subject).to eq 'Welcome to My Awesome Site of Lists'
    end
  end
