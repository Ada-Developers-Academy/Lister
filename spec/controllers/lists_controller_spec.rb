require 'spec_helper'

describe ListsController do

  describe "GET new" do
    it "is successful" do
      get :new
      expect(response).to be_successful
    end
  end

  describe "POST create" do
    context "with valid attributes" do
      let(:valid_attributes) { {id: 1, title: "Books to Read", user_id: 1} }
      it "changes count of lists by 1" do
        expect { post :create, list: valid_attributes }.to change(List, :count).by(1)
      end

      it "has a flash message" do
        post :create, list: valid_attributes
        expect(flash[:notice]).to_not be_blank
      end

      it "takes user to List show page" do
        post :create, list: valid_attributes
        expect(response).to redirect_to list_path(assigns(:list).id)
      end
    end

    context "with invalid attributes" do
      let(:no_title) { {title: nil, user_id: 1}}
      it "does not save to the database" do
        expect { post :create, list: no_title}.to_not change(List, :count).by(1)
      end

      it "has a flash message" do
        post :create, list: no_title
        expect(flash[:notice]).to_not be_blank
      end

      it "renders new template" do
        post :create, list: no_title
        expect(response).to render :new
      end
    end
  end

  describe "GET show" do
    it "is successful" do
      get :show
      expect(response).to be_successful
    end
  end

  describe "GET index" do
    it "is successful" do
      get :index
      expect(response).to be_successful
    end
  end

  describe "GET edit" do
    it "is successful" do
      get :edit
      expect(response).to be_successful
    end
  end

  describe "PATCH update" do
    before :each do
      @list = create(:list) 
    end

    context "with valid attributes" do
      it "locates the requested list" do
        put :update, id: @list.id, list: attributes_for(:list)
        expect(assigns(:list).id).to eq(@list.id)
      end

      it "updates the list's attributes" do
        put :update, id: @list.id, list: attributes_for(:list, title: "Films", user_id: 1)
        @list.reload
        expect(@list.title).to eq("Films")
      end

      it "redirects user to list's show page" do
        put :update, id: @list.id, list: attributes_for(:list)
        expect(response).to redirect_to @list
      end
    end

    context "with invalid attributes" do
      it "locates the requested list" do
        put :update, id: @list.id, list: attributes_for(:blank_list)
        expect(assigns(:list)).to eq(@list)
      end

      it "does NOT update the list's attributes" do
        put :update, id: @list.id, list: attributes_for(:list, title: nil, user_id: 1)
        @list.reload
        expect(@list.title).to eq("Books")
      end

      it "re-renders the list's show page" do
        put :update, id: @list.id, contact: attributes_for(:blank_list) 
        expect(response).to render_template :edit
      end
    end
  end

  describe "DELETE destroy" do
    before :each do
      @list = create(:list) 
    end

    it "decreases the list count by 1" do
      delete :destroy, id: @list.id
      expect{delete :destroy, id: @list.id}.to change(List, :count).by(-1)
    end

    it "redirects to the index list page" do
      delete :destroy, id: @list.id
      expect(response).to redirect_to lists_url
    end
  end
end