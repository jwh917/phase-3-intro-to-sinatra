require 'sinatra'

class App < Sinatra::Base

  # Add this line to set the Content-Type header for all responses
  set :default_content_type, 'application/json'

  get '/whop' do
    '<h2>WHOP <em>that</em> TRICK!</h2>'
  end

  get '/hard' do
    "<p>You know it's hard out here for a pimp!</p>"
  end

  get '/diceDOM' do
    dice_roll = rand(1..6)
    if dice_roll == 1
      "<h2>Snake EYE!</h2>"
    else
      "<h2>You rolled a #{dice_roll}</h2>"
    end
  end

  get '/diceJSON' do
    dice_roll = rand(1..6)
    { roll: dice_roll }.to_json
  end

  get '/add/1/2' do
    sum = 1 + 2
    { result: sum }.to_json
  end

  # :num1 and :num2 are named parameters
  get '/add/:num1/:num2' do
    num1 = params[:num1].to_i
    num2 = params[:num2].to_i

    sum = num1 + num2
    { result: sum }.to_json
  end

  
end

run App
