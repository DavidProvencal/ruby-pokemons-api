require 'rails_helper'

RSpec.describe Pokemon, type: :model do
  before(:each) do
    @pokemon = build(:pokemon)
  end

  context 'Presence validation' do
    it 'is invalid without a number' do
      @pokemon.number = nil
      expect(@pokemon).to_not be_valid
    end

    it 'is invalid without a name' do
      @pokemon.name = nil
      expect(@pokemon).to_not be_valid
    end

    it 'is invalid without a type 1' do
      @pokemon.type_1 = nil
      expect(@pokemon).to_not be_valid
    end

    it 'is invalid without a total' do
      @pokemon.total = nil
      expect(@pokemon).to_not be_valid
    end

    it 'is invalid without a hp' do
      @pokemon.hp = nil
      expect(@pokemon).to_not be_valid
    end

    it 'is invalid without an attack' do
      @pokemon.attack = nil
      expect(@pokemon).to_not be_valid
    end

    it 'is invalid without a defense' do
      @pokemon.defense = nil
      expect(@pokemon).to_not be_valid
    end

    it 'is invalid without a sp_atk' do
      @pokemon.sp_atk = nil
      expect(@pokemon).to_not be_valid
    end

    it 'is invalid without a sp_def' do
      @pokemon.sp_def = nil
      expect(@pokemon).to_not be_valid
    end

    it 'is invalid without a speed' do
      @pokemon.speed = nil
      expect(@pokemon).to_not be_valid
    end

    it 'is invalid without a generation' do
      @pokemon.generation = nil
      expect(@pokemon).to_not be_valid
    end
  end

  context 'Inclusion validation' do
    it 'is valid if legendary is true' do
      @pokemon.legendary = true
      expect(@pokemon).to be_valid
    end

    it 'is valid if legendary is false' do
      @pokemon.legendary = false
      expect(@pokemon).to be_valid
    end
  end

  context 'Uniqueness validation' do
    it 'is not valid if a pokemon has the same name' do
      @pokemon = create(:pokemon)
      @pokemon_copy = @pokemon.dup
      expect(@pokemon_copy).to_not be_valid
    end
  end
end
