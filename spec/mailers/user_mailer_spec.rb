require "spec_helper"

describe UserMailer do
  describe "welcome_email" do
    let(:user) { create :user }
    let(:mail) { UserMailer.welcome_email(user) }

    it "renders the headers" do
      mail.subject.should eq("Lists!")
      mail.to.should eq([user.email])
      mail.from.should eq(["elizabeth.uselton@gmail.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Great work signing up for Lists! This application is great!")
    end
  end

end
