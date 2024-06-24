class Admin::LettersController < ApplicationController
  before_action :get_items

  def index; end

  def show; end

  def new; end

  def edit; end

  def create
    @letter = Letter.new(letter_params)

    @letter.save
    redirect_to admin_letters_path
  end

  def update
    @letter.update(letter_params)

    redirect_to admin_letters_path
  end

  def destroy
    @letter.update(status: "archived")

    redirect_to admin_letters_path
  end

  private

  def get_items
    @letters = Letter.order(status: :desc)
    @letter = Letter.find(params[:id]) rescue Letter.new
  end

  def letter_params
    params.require(:letter).permit(:sender, :reciever, :message, :status, :public)
  end
end
