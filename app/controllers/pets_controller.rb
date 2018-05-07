class PetsController < ApplicationController
  def index
    # @pets = Pet.all
    # render json: @pets.as_json

    pets = Pet.all
    render json: pets.as_json(only: [:id, :name, :age, :human]), status: :ok
  end

  def show
    pet = Pet.find_by(id: params[:id])
    if pet.nil?
      render json: {
        errors: {
          id: ["No pet with ID #{params[:id]}"]
        }
        }, status: :not_found
    else
      render json: pet.as_json(only: [:id, :name, :age, :human]), status: :ok
    end
  end

  def new
  end
end
