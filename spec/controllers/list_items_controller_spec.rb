require 'spec_helper'

describe ListItemsController do
  
  context 'POST "create"' do
    let(:list) { create(:list) }
    let(:valid_attributes) { { description: 'This is a thing for a list', list_id: 1 } }

    it 'is successful' do
      request.env["HTTP_REFERER"]

      expect { post :create, list_item: valid_attributes }.to change(ListItem, :count).by(1)
    end
  end
end