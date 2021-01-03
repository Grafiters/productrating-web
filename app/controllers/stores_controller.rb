
# TODO: Implement 
class StoresController < ApplicationController

    before_action do
        case action_name.to_sym
        when :new, :create
            @store = Store.new
        when :show,
            @store = Store.find_by(params[:id])
            
        end
    end

    def index
        @store = Store.all
    end

    def new
    end

    def show
    end

    def create
        @store.assign_attributes(product_params)
        if @store.save
            redirect_to store_url
        else
            flash[:error] = @store.errors.full_messages.join(', ')
            render :new
        end
    end
    private
        def product_params
            params.require(:store).permit(:name, :description)
        end
end
