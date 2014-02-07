require 'spec_helper'
describe UsersController do

  describe "GET 'new'" do
    it "is successful" do
      get :new
      expect(response).to be_successful
    end
  end

  describe "POST 'create'" do
    context "with valid attributes" do
      let(:valid_attributes) { {username: "bookis", email: "b@c.com", password: "gogo1234", password_confirmation: "gogo1234"} }
      # let(:user){ create(:user) }
      before(:each) do
        ActionMailer::Base.delivery_method = :test
        ActionMailer::Base.perform_deliveries = true
        ActionMailer::Base.deliveries = []
      end

      after(:each) do
        ActionMailer::Base.deliveries.clear
      end

      before do
        ResqueSpec.reset!
        # ListMailer.welcome(user.id).deliver
      end

      it "is a redirect" do
        post :create, user: valid_attributes
        expect(response.status).to eq 302 # This is a redirect
      end
    
      it "changes user count by 1" do
        expect { post :create, user: valid_attributes }.to change(User, :count).by(1)
      end
    
      it "sets a flash message" do
        post :create, user: valid_attributes
        expect(flash[:notice]).to_not be_blank
      end

      it "sends to user's email address" do
        without_resque_spec do
          post :create, user: valid_attributes
            ListMailer.welcome(assigns(:user).id).deliver
            ActionMailer::Base.deliveries.last.to.should == [assigns(:user).email]
          end
      end

      it 'should send an email' do
        without_resque_spec do
          post :create, user: valid_attributes
          expect { ListMailer.welcome(assigns(:user).id).deliver }.to change(ActionMailer::Base.deliveries, :count).by(1)
          # expect { post :create, user: valid_attributes }.to change(ActionMailer::Base.deliveries, :count).by(1)
        end
      end

      it "should have a queue size of 1" do
        post :create, user: valid_attributes
        EmailJob.should have_queue_size_of(1)
      end

      it "adds ListMailer.welcome to the Email queue" do
        post :create, user: valid_attributes
        EmailJob.should have_queued(assigns(:user).id)
      end
    
    end
  
    context "with invalid attributes" do
      it "renders the new template" do
        post :create, user: {username: "b"}
        expect(response).to render_template :new
      end
    
      it "does not create a user" do
        expect { post :create, user: {username: "b"} }.to change(User, :count).by(0)
      end
    end

  end

  describe "GET 'show'" do
    let(:user) { create(:user) }
    it "is successful" do
      get :show, id: user.id
      expect(response).to be_successful
    end

    it "shows users' lists" do
      get :show, id: user.id
      assigns(:lists).should_not be_nil
    end
  end
end
