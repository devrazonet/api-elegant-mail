class LettersController < ApplicationController
  before_action :set_letter, only: %i[ show edit update destroy ]

  def index
    @letters = Letter.where(public: true, status: "approved")
  end

  def new
    @letter = Letter.new
  end

  def create
    @letter = Letter.new(letter_params)

    @letter.save
    redirect_to letters_path
  end

  private

  # def set_letter
  #   @letter = Letter.find(params[:id])
  # end

  def letter_params
    params.require(:letter).permit(:sender, :reciever, :message, :status, :public)
  end
end
