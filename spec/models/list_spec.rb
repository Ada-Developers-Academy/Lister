require 'spec_helper'

describe List do
  it "has no lists in the database" do
    expect(List).to have(:no).records
    expect(List).to have(0).records
  end

  it "has one record" do
    create(:list)
    expect(List).to have(1).record
  end
end
