require 'spec_helper'

describe ItemsController do

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
  end

  describe "GET 'create'" do
    it "returns http success" do
      get 'create'
      response.should be_success
    end
  end

  describe "GET 'destroy'" do
    it "returns http success" do
      get 'destroy'
      response.should be_success
    end
  end

  describe "DELETE 'destroy'" do
  let(:current_user) { create(:user) }
  let!(:list) { create(:list) }
  let!(:item) { create(:item) }

  before(:each) do
    controller.instance_variable_set(:@current_user, current_user)
    list.update(user_id: current_user.id)
    item.update(list_id: list.id)
  end

    context "you're trying to destroy your own item" do
      it "changes item count by -1" do
        expect { delete :destroy, id: item.id }.to change(Item, :count).by(-1)
      end
    end

    context "you're not signed in as the list's owner" do
      let(:other_user) { create(:user) }
      it "cannot be destroyed if you are signed in as other user " do
        list.update(user_id: other_user.id)
        expect { delete :destroy, id: item.id }.to change(Item, :count).by(0)
      end
    end
  end
end
