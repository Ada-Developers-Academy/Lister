require "spec_helper"

describe UserMailer do
  describe "welcome_email" do
    let(:user) { create :user }
    let(:mail) { UserMailer.welcome_email(user) }

    it "renders the headers" do
      mail.subject.should eq("Welcome to Lister!")
      mail.to.should eq([user.email])
      mail.from.should eq(["ListerApp@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("You have successfully signed up!")
    end
  end

end
