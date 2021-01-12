class OrdersController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :catch_not_found
    before_action :set_order, only: [:show, :edit, :update, :destroy]
    
    def index
        @orders = Order.all
    end
    
    def show
    end
    
    def new
        @order = Order.new
    end
    
    def edit
    end
    
    def create
        @order = Order.new(customer_params)
        if @order.save
            flash.notice = "The order record was created successfully."
            redirect_to @order
        else
            flash.now.alert = @order.errors.full_messages.to_sentence
            render :new
        # flash.alert = "Customer record could not be created."
        # render :new
    end
        # @order = Order.new(customer_params) #customer params will include all of the customer argument/parameters/attributes
        #     if @order.save
        #         flash.notice = "The order record was created successfully."
        #         redirect_to @order
        #     else
        #         flash.alert = "Order record could not be created."
        #         render :new #renders a form that will allow us to create a new order and submit
        #     end
    end
    
    def update
        if @order.update(order_params)
            flash.notice = "The order record was updated successfully."
            redirect_to @order
        else
            flash.now.alert = @order.errors.full_messages.to_sentence
            render :edit
        end
        # if @order.update(order_params)
        #     flash.notice = "The order record was updated successfully."
        #     redirect_to @order
        # else
        #     flash.alert = "The order record was not updated successfully."
        #     render :edit #renders a form that you will be able to edit and submit
        # end
    end

    def destroy
        @order.destroy
        respond_to do |format|
            format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
            format.json { head :no_content }
        end
    end

    def set_order
        @order = Order.find(params[:id])
    end
    
    def order_params
      params.require(:order).permit(:product_name, :product_count, :customer_id)
    end

  def catch_not_found(e)
      Rails.logger.debug("We had a not found exception.")
      flash.alert = e.to_s
      redirect_to orders_path
  end
end
