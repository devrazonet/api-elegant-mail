class LettersController < ApplicationController
  before_action :set_letter, only: %i[ show edit update destroy ]
  before_action :get_items

  def index; end

  def new; end

  def create
    @letter = Letter.new(letter_params)
    @letter.save
    flash[:notice] = "Parabéns! Sua mensagem foi enviada. Assim que for aprovada, todos poderão vê-la :D"
    redirect_to new_letter_path
  end

  private

  def get_items
    letters = Letter.where(public: true, status: "approved").order(created_at: :desc)
    @letters = letters.limit(3)
    @letter = letters.first
  end

  def letter_params
    params.require(:letter).permit(:sender, :reciever, :message, :status, :public)
  end
end
