def create_customer(attributes = {})
  attrs = {
    email: 'example@example.com',
    password: 'changeme',
    password_confirmation: 'changeme',
    rating: 'Good',
  }.merge(attributes)
  @user = User.create(attrs)
  attrs
end

def create_product(attributes = {})
  attrs = {
    name: 'Product Name',
    price: 0,
  }.merge(attributes)
  Product.create(attrs)
end

def sign_in(visitor)
  visit '/users/sign_in'
  fill_in 'user_email', with: visitor[:email]
  fill_in 'user_password', with: visitor[:password]
  click_button 'Log in'
end

Dado('Eu como um cliente com rating {string}') do |client_rating|
  @visitor = create_customer(rating: client_rating)
  sign_in(@visitor)
end

Dado('Eu adicionei um produto no valor de {float}') do |product_price|
  @product = create_product(price: product_price)
  visit "/product/#{@product.id}/buy"
end

Quando('Eu clico no link para fechar a compra') do
  visit '/checkout'
end

Então('Eu devo ter um desconto de {int}%') do |discount_percentage|
  expect(page).to have_css '#discount', text: "Desconto de #{discount_percentage}%"
end
