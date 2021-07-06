require 'csv'

puts "Start seeding pokemons..."
CSV.foreach(Rails.root.join('lib/seed/pokemon.csv'), headers: true) do |row|
  Pokemon.create({
                   number: row["#"],
                   name: row["Name"],
                   type_1: row["Type 1"],
                   type_2: row["Type 2"],
                   total: row["Total"],
                   hp: row["HP"],
                   attack: row["Attack"],
                   defense: row["Defense"],
                   sp_atk: row["Sp. Atk"],
                   sp_def: row["Sp. Def"],
                   speed: row["Speed"],
                   generation: row["Generation"],
                   legendary: row["Legendary"]
                 })
end
puts "Seeding pokemons completed"
