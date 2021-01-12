require 'rails_helper'

RSpec.describe "Orders", type: :request do
    describe "GET /orders" do
     it "renders the index view" do
      FactoryBot.create_list(:orders, 10)
      get orders_path
      expect(response.status).to eq(200)
     end
  end
  
  describe "get order_path" do
    it "renders the :show template" do
      order = FactoryBot.create(:order)
      get order_path(id: order.id)
      expect(response.status).to eq(200)
    end
  
    it "redirects to the index path if the order id is invalid" do
      get order_path(id: 5000) #an ID that doesn't exist
      expect(response).to redirect_to orders_path
    end
   # it "works! (now write some real specs)" do
    #  get customers_path
     # expect(response).to have_http_status(200)
  #  end
    end
end

describe "get new_order_path" do
    it "renders the :new template" do
      get new_order_path
      expect(response).to render_template(:new)
  end
end
  describe "get edit_order_path" do
    it "renders the :edit template" do
      order=FactoryBot.create(:order)
      get edit_order_path(customer.id), params: {order: {product_name: "washers"}}
      expect(response).to render_template(:edit)
  end
end
  describe "post orders_path with valid data" do
    it "saves a new entry and redirects to the show path for the entry" do
      order_attributes = FactoryBot.attributes_for(:order)
      expect { post order_path, params: {order: order_attributes}
    }.to change(Order, :count)
      expect(response).to redirect_to order_path(id: Order.last.id)
    end
  end
  
  describe "post orders_path with invalid data" do
    it "does not save a new entry or redirect" do
      order_attributes = FactoryBot.attributes_for(:order)
      order_attributes.delete(:first_name)
      expect { post customers_path, params: {order: order_attributes}
    }.to_not change(Order, :count)
      expect(response.status).to eq(200)
    end
  end
  
  describe "put order_path with valid data" do
    it "updates an entry and redirects to the show path for the order" do
      order=FactoryBot.create(:order)
      put order_path(order.id), params: {order: {product_count: 11}}
      order.reload
      expect(order.product_count).to eq(11)
      expect(response).to redirect_to order_path(order.id)
    end
  end
  describe "put order_path with invalid data" do
    it "does not update the order record or redirect" do
      order=FactoryBot.create(:order)
      put order_path(order.id), params: {order: {customer_id: "123456789"}}
      order.reload
      expect(order.customer_id).to_not eq("123456789")
      expect(response.status).to eq(200)
    end
  end
  describe "delete a order record" do
    it "deletes a order record" do
      customer=FactoryBot.create(:order)
      expect { delete order_path(customer.id) }.to change(Order, :count)
      expect(response).to redirect_to orders_path
    end
  end

