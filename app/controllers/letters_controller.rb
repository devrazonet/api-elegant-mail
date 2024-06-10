class LettersController < ApplicationController
  before_action :set_letter, only: %i[ show update destroy ]

  def index
    @letters = Letter.where(status: true)

    render json: @letters
  end

  def show
    render json: @letter
  end

  def create
    @letter = Letter.new(letter_params)

    if @letter.save
      render json: @letter, status: :created, location: @letter
    else
      render json: @letter.errors, status: :unprocessable_entity
    end
  end

  def update
    if @letter.update(letter_params)
      render json: @letter
    else
      render json: @letter.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @letter.destroy
  end

  private

  def set_letter
    @letter = Letter.find(params[:id])
  end

  def letter_params
    params.require(:letter).permit(:sender, :reciever, :message, :status)
  end
end
