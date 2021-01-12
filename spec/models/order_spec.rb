require 'rails_helper'

RSpec.describe Order, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

 subject { Order.new( product_name: "gears", product_count: 7, customer: FactoryBot.create(:customer))}
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  it "is not valid without a product name" do
    subject.product_name=nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a product count" do
    subject.product_count=nil
    expect(subject).to_not be_valid
  end
 
  it "is not valid if the phone number is not an integer" do
    subject.phone="abc"
    expect(subject).to_not be_valid
  end
  
  it "returns the correct product_name" do
    expect(subject.product_name).to eq("gears")
  end
end
