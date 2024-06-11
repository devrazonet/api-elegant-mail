class Admin::LettersController < ApplicationController
  before_action :set_letter, only: %i[ show edit update destroy ]

  def index
    @letters = Letter.order(status: :desc)
  end

  def show
  end

  def new
    @letter = Letter.new
  end

  def edit
  end

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

  def set_letter
    @letter = Letter.find(params[:id])
  end

  def letter_params
    params.require(:letter).permit(:sender, :reciever, :message, :status, :public)
  end
end
