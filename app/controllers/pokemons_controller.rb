class PokemonsController < ApplicationController
  include Pagy::Backend
  before_action :find_pokemon, only: [:show, :update, :destroy]

  def index
    if params.has_key?(:page) && params.has_key?(:pokemonsPerPage)
      @pagy, @pokemons = pagy(Pokemon.all, page: params[:page], items: params[:pokemonsPerPage])
      render json: { page: params[:page], pokemons: @pokemons }
    else
      render json: { message: 'Params page and pokemonsPerPage are mandatory' }, status: :bad_request
    end
  end

  def show
    render json: @pokemon
  end

  def create
    begin
      @pokemon = Pokemon.create!(pokemon_params)
      render json: @pokemon, status: :ok
    rescue ActiveRecord::RecordInvalid => e
      render json: { error: e.message }, status: :unprocessable_entity
    end
  end

  def update
    begin
      @pokemon.update!(pokemon_params)
      render json: @pokemon, status: :ok
    rescue ActiveRecord::RecordInvalid => e
      render json: { error: e.message }, status: :unprocessable_entity
    end
  end

  def destroy
    @pokemon.destroy
    render status: :ok
  end

  private

  def pokemon_params
    params.require(:pokemon).permit(:number, :name, :type_1, :type_2, :total, :hp, :attack, :defense, :sp_atk,
                                    :sp_def, :speed, :generation, :legendary)
  end

  def find_pokemon
    begin
      @pokemon = Pokemon.find(params[:id])
    rescue ActiveRecord::RecordNotFound => e
      render json: { error: e.message }, status: :not_found
    end
  end
end
