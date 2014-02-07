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
        expect(response).to redirect_to new_list_path
      end
    end
  end

  describe "GET show" do
    before :each do
      @list = create(:list) 
    end

    it "is successful" do
      get :show, id: @list.id
      expect(response).to be_successful
    end

    it "locates the requested list" do
      get :show, id: @list.id
      expect(assigns(:list).id).to eq(@list.id)
    end
  end

  describe "GET index" do
    it "populates the lists array" do
      list = create(:list)
      get :index
      expect(assigns(:lists)).to eq([list])
    end

    it "renders the index view" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe "GET edit" do
    before :each do
      @list = create(:list) 
    end

    it "is successful" do
      get :edit, id: @list.id
      expect(response).to be_successful
    end

    it "locates the requested list" do
      get :edit, id: @list.id
      expect(assigns(:list).id).to eq(@list.id)
    end
  end

  describe "PATCH update" do
    before :each do
      @list = create(:list) 
    end

    context "with valid attributes" do
      it "locates the requested list" do
        patch :update, id: @list.id, list: attributes_for(:list)
        expect(assigns(:list).id).to eq(@list.id)
      end

      it "updates the list's attributes" do
        patch :update, id: @list.id, list: attributes_for(:list, title: "Films", user_id: 1)
        @list.reload
        expect(@list.title).to eq("Films")
      end

      it "redirects user to list's show page" do
        patch :update, id: @list.id, list: attributes_for(:list)
        expect(response).to redirect_to @list
      end
    end

    context "with invalid attributes" do
      it "locates the requested list" do
        patch :update, id: @list.id, list: {title: nil, user_id: 1}
        expect(assigns(:list)).to eq(@list)
      end

      it "does NOT update the list's attributes" do
        patch :update, id: @list.id, list: attributes_for(:list, title: nil, user_id: 1)
        @list.reload
        expect(@list.title).to eq("Books")
      end

      it "re-renders the list's show page" do
        patch :update, id: @list.id, list: {title: nil, user_id: 1}
        expect(response).to render_template :edit
      end
    end
  end

  describe "DELETE destroy" do
    before :each do
      @list = create(:list) 
    end

    it "decreases the list count by 1" do
      expect{delete :destroy, id: @list.id}.to change(List, :count).by(-1)
    end

    it "redirects to the index list page" do
      delete :destroy, id: @list.id
      expect(response).to redirect_to lists_url
    end
  end
end