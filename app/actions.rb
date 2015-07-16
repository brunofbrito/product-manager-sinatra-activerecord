get "/" do
  @products = Product.all
  @brands = Brand.all
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
  Product.update(params[:id], params.slice("name", "description", "price", "brand_id"))
  redirect "/"
end

get "/brand/show/:id" do
  @products = Product.all
  @brands = Brand.all
  @brand = Brand.find(params[:id])
  erb :showbrand
end

get "/brand/add" do
  erb :addbrand
end

post "/brand/add" do
  brand = Brand.new({
    name: params[:brandname]
    })
  brand.save
  redirect "/"
end