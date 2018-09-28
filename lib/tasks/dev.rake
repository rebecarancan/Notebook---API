namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do

    puts "Cadastrando tipos de contatos..."
    kinds = %w(Amigo Comercial Conhecido)

    kinds.each do |kind|
      Kind.create!(
        description: kind
        )
    end
    puts "Tipos de contatos cadastrados com sucesso!"

    ##############################################

    puts "Cadastrando contatos..."
    100.times do |i|
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.birthday(18, 65),
        kind: Kind.all.sample
        )
    end
    puts "Contatos cadastrados com sucesso!"
  end

end
