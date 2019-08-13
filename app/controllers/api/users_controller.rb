class Api::UsersController < ApplicationController
  # skip_before_action :verify_authenticity_token

  before_action :authenticate_user,  only: [:index, :update]
  before_action :authorize,          only: [:update, :destroy]

  def index
    render  status: :ok, json: 'Logged-in.'
  end

  def create
    @user = User.new(user_params)

    if @user.save
      render status: :created, json: 'User was successfully created'.to_json
    else
      render status: :unprocessable_entity, json: @user.errors.full_messages
    end
  end

  def update
    @user = User.find(params[:id])
    render status: :ok, json: 'User details have been updated.' if user.update(user_params)
  end

  def destroy
    @user = User.find(params[:id])
    render status: :ok, json: 'User has been deleted.' if user.destroy
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
