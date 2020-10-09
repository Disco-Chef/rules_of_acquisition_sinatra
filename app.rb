require 'sinatra'
require 'json'

get '/' do
  'Hello world!'
end

get '/api/v1/rules/:rule_number' do
  rule_number = params[:rule_number].to_s
  serialized_rules = File.read("rules_of_acquisition.json")
  rules = JSON.parse(serialized_rules)
  {
    rule_number => rules[rule_number]
  }
end

get '/api/v1/rules/' do
  rule_number = params[:rule_number].to_s
  serialized_rules = File.read("rules_of_acquisition.json")
  rules = JSON.parse(serialized_rules)
  {
    rule_number => rules[rule_number]
  }
end
