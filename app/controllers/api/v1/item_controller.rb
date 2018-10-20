class Api::V1::ItemController < ApiController
    before_action :set_user
    before_action :set_list
    before_action :set_item, only: [:show, :destroy, :update]
    
    def index
        @items = @list.items
    end

    def show
    end

    def destroy
        if @item.destroy
            render json: {}, status: :ok
        else
            error_bad_request
        end
    end

    def create
        item_params = params.require(:item).permit(:name)
        item = @list.items.new(item_params)
        if item.save
            render json: {}, status: :created
        else
            error_bad_request
        end
    end

    def update
        item_params = params.require(:item).permit(:name, :status)
        if @item.update(item_params)
            render json: {}, status: :ok
        else
            error_bad_request
        end
    end

    private 
    def set_user
        @user = current_user
    end

    def set_list
        begin
            @list = @user.lists.find(params[:list_id])
        rescue => exception
            error_not_found
        end
    end

    def set_item
        begin
            @item = @list.items.find(params[:id])
        rescue => exception
            error_not_found
        end
    end

    def error_not_found
        render json:{}, status: :not_found
    end

    def error_bad_request
        render json:{}, status: :bad_request
    end
end
