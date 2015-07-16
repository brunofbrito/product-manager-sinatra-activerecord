get "/" do
  @products = Product.all
  erb :index
end

get "/product/add" do
  @brands = Brand.all
  erb :add
end

post "/product/add" do
  product = Product.new({
      brand_id: params[:brand],
      name: params[:name],
      description: params[:description],
      price: params[:price]
    })
  product.save
  redirect "/"
end

get "/product/edit/:id" do
  @product = Product.find(params[:id])
  @brands = Brand.all
  erb :edit
end

post "/product/edit/:id" do
  p params
  Product.update(params[:id], params.slice("name", "description", "price", "brand_id"))
  redirect "/"
end