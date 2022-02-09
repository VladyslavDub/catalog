require "open-uri"
if Rails.env.development?
  AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

  pp "start seed category"
  6.times do
    Category.create!(name: Faker::Computer.type)
  end
  pp "#{Category.count} categories seeded"

  pp "start seed maker"
  4.times do
    Maker.create!(name: Faker::Device.manufacturer)
  end
  pp "#{Maker.count} makers seeded"


  20.times do
    product = Product.create(
      name: Faker::Device.model_name,
      category: Category.all.sample,
      maker: Maker.all.sample,
      price: rand(1000...10000000),
      available: rand(2).odd?
    )

    image =  URI.open(Faker::LoremFlickr.image(search_terms: ['devise']))
    product.image.attach(io: image, filename: "#{product.name}.jpg")
    # product.images.attach(io: image, filename: "#{product.name}.jpg")

    2.times do
      image =  URI.open(Faker::LoremFlickr.image(search_terms: ['devise']))
      product.images.attach(io: image, filename: "#{product.name}.jpg")
    end
  end
end