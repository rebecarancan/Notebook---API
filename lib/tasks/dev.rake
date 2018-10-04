namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    puts "Resetando o banco de dados"

    # %x(rails db:drop db:create db:migrate)

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

    #############################################

    puts "Cadastrando telefones..."
    Contact.all.each do |contact|
      Random.rand(1..3).times do |i|
        Phone.create!(
        number: Faker::PhoneNumber.phone_number,
        contact: contact
        )
      end
    end
    puts "Telefones cadastrados com sucesso!"

    #############################################

    puts "Cadastrando endereços..."
    Contact.all.each do |contact|
        Address.create!(
        street: Faker::Address.street_address,
        city: Faker::Address.city,
        contact: contact
        )
    end
    puts "Endereços cadastrados com sucesso!"
  end

end
