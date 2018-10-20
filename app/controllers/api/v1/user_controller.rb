class Api::V1::UserController < ApiController
    before_action :set_user, only: [:show]
    def show
    end

    def create
        user_params = params.require(:user).permit(:email, :password, :password_confirmation)
        user = User.new(user_params)
        if user.save
            render status: :created
        else
            render status: :bad_request
        end
    end

    private
    def set_user
        begin
            @user = User.find(params[:id])    
        rescue 
            render json: {}, status: :not_found
        end
    end
end
