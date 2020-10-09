get '/' do
  'Sinatra sees your attempt and raises you 100'
end

get '/api/v1/rules/random' do
  rule_number = (1..286).to_a.sample.to_s
  serialized_rules = File.read("rules_of_acquisition.json")
  rules = JSON.parse(serialized_rules)
  "#{rule_number}: #{rules[rule_number]}"
end

get '/api/v1/rules/:rule_number' do
  rule_number = params[:rule_number]
  serialized_rules = File.read("rules_of_acquisition.json")
  rules = JSON.parse(serialized_rules)
  "#{rule_number}: #{rules[rule_number]}"
end
