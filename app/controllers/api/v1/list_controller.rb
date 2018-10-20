class Api::V1::ListController < ApiController
    before_action :set_user
    before_action :set_list, only: [:show, :destroy, :update]
    def index
        @lists = @user.lists
    end

    def show
    end

    def create
        list_params = params.require(:list).permit(:name, :description)
        list = @user.lists.new(list_params)
        if list.save
            render json:{}, status: :created
        else
            render json:{}, status: :bad_request
        end
    end

    def update
        list_params = params.require(:list).permit(:name, :description)
        if @list.update(list_params)
            render json:{}, status: :ok
        else
            render json:{}, status: :bad_request
        end
    end

    def destroy
        if @list.delete
            render json:{}, status: :ok
        else
            render json:{}, status: :bad_request
        end
    end

    private 
    def set_user
        @user = current_user
    end

    def set_list
        begin
            @list = @user.lists.find(params[:id])
        rescue => exception
            render json: {}, status: :not_found
        end
    end
end
