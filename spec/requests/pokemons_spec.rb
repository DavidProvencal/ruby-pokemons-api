require 'swagger_helper'

RSpec.describe 'Pokemons API', type: :request do
  POKEMON_NAME_CONST = 'Pokemon request test'

  before(:all) do
    create(:pokemon, name: POKEMON_NAME_CONST)
  end

  path '/pokemons' do

    get('paginated pokemons list') do
      produces 'application/json'
      parameter name: :page, in: :query, type: :string, required: true
      parameter name: :pokemonsPerPage, in: :query, type: :string, required: true

      response 200, 'successful' do
        schema type: :object,
               properties: {
                 page: { type: :string },
                 pokemons: { type: :array,
                             items: {
                               properties: {
                                 id: { type: :integer },
                                 number: { type: :integer },
                                 name: { type: :string },
                                 type_1: { type: :string },
                                 type_2: { type: :string },
                                 total: { type: :integer },
                                 hp: { type: :integer },
                                 attack: { type: :integer },
                                 defense: { type: :integer },
                                 sp_atk: { type: :integer },
                                 sp_def: { type: :integer },
                                 speed: { type: :integer },
                                 generation: { type: :integer },
                                 legendary: { type: :boolean }
                               }
                             }
                 }
               }
        let(:page) { 1 }
        let(:pokemonsPerPage) { 1 }
        run_test!
      end

    end

    post('create pokemon') do
      produces 'application/json'
      consumes 'application/json'
      parameter name: :pokemon, in: :body, schema: {
        type: :object,
        properties: {
          number: { type: :integer },
          name: { type: :string },
          type_1: { type: :string },
          type_2: { type: :string },
          total: { type: :integer },
          hp: { type: :integer },
          attack: { type: :integer },
          defense: { type: :integer },
          sp_atk: { type: :integer },
          sp_def: { type: :integer },
          speed: { type: :integer },
          generation: { type: :integer },
          legendary: { type: :boolean }
        }
      }

      response(200, 'successful') do
        schema type: :object,
               properties: {
                 page: { type: :string },
                 pokemons: { type: :array,
                             items: {
                               properties: {
                                 id: { type: :integer },
                                 number: { type: :integer },
                                 name: { type: :string },
                                 type_1: { type: :string },
                                 type_2: { type: :string },
                                 total: { type: :integer },
                                 hp: { type: :integer },
                                 attack: { type: :integer },
                                 defense: { type: :integer },
                                 sp_atk: { type: :integer },
                                 sp_def: { type: :integer },
                                 speed: { type: :integer },
                                 generation: { type: :integer },
                                 legendary: { type: :boolean }
                               }
                             }
                 }
               }
        let(:id) { 1 }
        let(:pokemon) { build(:pokemon) }
        run_test!
      end

      response(422, 'unprocessable entity') do
        let(:id) { 1 }
        let(:pokemon) { { pokemon: { name: POKEMON_NAME_CONST } } }
        run_test!
      end
    end
  end

  path '/pokemons/{id}' do
    get('show pokemon') do
      produces 'application/json'
      parameter name: 'id', in: :path, type: :string

      response(200, 'successful') do
        schema type: :object,
               properties: {
                 page: { type: :string },
                 pokemons: { type: :array,
                             items: {
                               properties: {
                                 id: { type: :integer },
                                 number: { type: :integer },
                                 name: { type: :string },
                                 type_1: { type: :string },
                                 type_2: { type: :string },
                                 total: { type: :integer },
                                 hp: { type: :integer },
                                 attack: { type: :integer },
                                 defense: { type: :integer },
                                 sp_atk: { type: :integer },
                                 sp_def: { type: :integer },
                                 speed: { type: :integer },
                                 generation: { type: :integer },
                                 legendary: { type: :boolean }
                               }
                             }
                 }
               }
        let(:id) { 1 }
        run_test!
      end

      response(404, 'not found') do
        let(:id) { '99' }
        run_test!
      end
    end

    patch('update pokemon') do
      produces 'application/json'
      consumes 'application/json'
      parameter name: 'id', in: :path, type: :string
      parameter name: :pokemon, in: :body, schema: {
        type: :object,
        properties: {
          number: { type: :integer },
          name: { type: :string },
          type_1: { type: :string },
          type_2: { type: :string },
          total: { type: :integer },
          hp: { type: :integer },
          attack: { type: :integer },
          defense: { type: :integer },
          sp_atk: { type: :integer },
          sp_def: { type: :integer },
          speed: { type: :integer },
          generation: { type: :integer },
          legendary: { type: :boolean }
        }
      }

      response(200, 'successful') do
        schema type: :object,
               properties: {
                 page: { type: :string },
                 pokemons: { type: :array,
                             items: {
                               properties: {
                                 id: { type: :integer },
                                 number: { type: :integer },
                                 name: { type: :string },
                                 type_1: { type: :string },
                                 type_2: { type: :string },
                                 total: { type: :integer },
                                 hp: { type: :integer },
                                 attack: { type: :integer },
                                 defense: { type: :integer },
                                 sp_atk: { type: :integer },
                                 sp_def: { type: :integer },
                                 speed: { type: :integer },
                                 generation: { type: :integer },
                                 legendary: { type: :boolean }
                               }
                             }
                 }
               }
        let(:id) { 1 }
        let(:pokemon) { { pokemon: { attack: '100' } } }
        run_test!
      end

      response(404, 'not found') do
        let(:id) { '99' }
        let(:pokemon) { { pokemon: { attack: '100' } } }
        run_test!
      end
    end

    delete('delete pokemon') do
      parameter name: 'id', in: :path, type: :string

      response(200, 'successful') do
        let(:id) { '1' }
        run_test!
      end

      response(404, 'not found') do
        let(:id) { '99' }
        run_test!
      end
    end
  end
end
