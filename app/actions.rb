# # Homepage (Root path)
get '/' do
  erb :index
end

get '/messages' do
  @messages = Message.all 
  erb :'messages/index'
end

get '/messages/new' do
  @messages = Message.all 
  erb :'messages/new'
end

get '/messages/:id' do 
  @message = Message.find params[:id]
  erb :'messages/show'
end

post '/messages' do 

  @message = Message.new(
    title: params[:title],
    content: params[:content],
    author: params[:author]
)
@message.save 
redirect '/messages'
end

post '/messages' do 
  @messages = Message.new(
    title: params[:title],
    content: params[:content],
    author: params[:author]
    )
  if @message.save 
    redirect '/messages'
  else
    erb :'messages/new'
  end
end





