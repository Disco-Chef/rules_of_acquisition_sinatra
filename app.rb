require "sinatra"
require "sinatra/reloader" if development?
require "pry-byebug"
require "better_errors"
require 'json'
require 'html'

configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = File.expand_path('..', __FILE__)
end

before do
  content_type :json
end


get '/' do
  # link_to "Rules of Acquisition Index", "/api/v1/rules"
  # link_to "Random Rule of Acquisition", "/api/v1/rules/random"
  # link_to "Specific Rule of Acquisition", "/api/v1/rules/1"
  # "(change 1 to anything up to 286)"
end

get '/api/v1/rules/random' do
  rule_number = (1..286).to_a.sample.to_s
  serialized_rules = File.read("data/rules_of_acquisition.json")
  rules = JSON.parse(serialized_rules)
  {
    success: true,
    message: "Successfully got Rule of Acquisition",
    data: {
      rule_number: rule_number,
      scripture: rules[rule_number]
    }
  }.to_json
end

get '/api/v1/rules/:rule_number' do
  rule_number = params[:rule_number]
  serialized_rules = File.read("data/rules_of_acquisition.json")
  rules = JSON.parse(serialized_rules)
  {
    success: true,
    message: "Successfully got Rule of Acquisition",
    data: {
      rule_number: rule_number,
      scripture: rules[rule_number]
    }
  }.to_json
end

get '/api/v1/rules' do
  serialized_rules = File.read("data/rules_of_acquisition.json")
  rules = JSON.parse(serialized_rules)
  {
    success: true,
    message: "Successfully got Rule of Acquisition",
    data: rules
  }.to_json
end
