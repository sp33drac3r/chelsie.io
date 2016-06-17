require 'rubygems'
require 'mechanize'
require 'nokogiri'
require 'open-uri'
require 'watir-webdriver'
require "google_places"
require 'csv'

# CSV.foreach("db/RAINN_centers.csv") do |row|

# end

browser = Watir::Browser.new

browser.goto('http://centers.rainn.org/details.cfm/rape-crisis-center-details/PPC-Violence-Free-Network-Oil-City-PA_100810')
sleep(rand(1..4))
doc = Nokogiri::HTML.parse(browser.html)

service_provider = {}

text             = doc.xpath("//address").first.text
info        = doc.xpath("//small")
services         = info[0].text.gsub(/\s+/, ' ')
populations        = info[2].text.gsub(/\s+/, ' ')
service_provider["name"]               = doc.xpath('//h3').children.text
service_provider["zip"]                = /\b\d{5}\b/.match(text).to_s
service_provider["telephone"]          = /(?<= Telefonico : ).{14}/.match(text).to_s
service_provider["tty"]                = /(?<= Ayuda: ).{14}/.match(text).to_s
service_provider["website"]            = /(http|www).*/.match(text).to_s
service_provider["services_offered"]   = /(?<= offered: ).*/.match(services).to_s
service_provider["populations_served"] = /(?<= served: ).*/.match(populations).to_s

@client = GooglePlaces::Client.new("AIzaSyB8UGiauKQqA9PWgPY2MD0ZPMQMCcGMKcM")
@gp_result = @client.spots_by_query("#{service_provider["name"]} #{service_provider["zip"]}")


service_provider["address"] = @gp_result[0].formatted_address
service_provider["lat"] = @gp_result[0].lat
service_provider["lng"] = @gp_result[0].lng
service_provider["place_id"] = @gp_result[0].place_id

test = ServiceProvider.new(service_provider)

p test

sleep(rand(1..4))


# service_provider = ServiceProvider.new
# This is the name of the service provider


# p test.to_s
# p text.gsub(/\s+/, ' ') # this is if we want everything. But we don't



# doc.xpath("//small").each do |small|
#   fixed_string = small.text.gsub(/\s+/, ' ')
#   # p fixed_string
# end

# # puts b.form(:name, "center_search").when_present.text

# rainn_agent = Mechanize.new

# page = Mechanize::Page.new(nil, {'content-type' => 'text/hmtl'}, html, nil, rainn_agent)

# # def select_option(form, field_value, text)
# #   value = nil
# #   form.field_with(:value => field_value).options.each{|o| value = o if o.text == text }

# #   raise ArgumentError, "No option with text '#{text}' in field '#{field_value}'" unless value
# #   form.field_with(:value => field_value).value = value
# # end

# form = page.forms.first
# form.field_with(:name => 'state') do |field|
# field.value = 'AL'
# end.submit

# # .option_with(:value => 'AL')


# # b.goto(request2)
# # response2 = mechanize.urlopen(request2)

# # print response2.geturl



# # # form do |f|
# # #   select_option(f, 'AL', 'Alabama')
# # # end.submit

# # select_list = form.field_with(:name => 'state')
# # # # p select_list.option_with(:value => 'Alabama')
# # select_list(:value => 'AL').click


# # # puts page.uri

# # # form.field_with(:name => 'state').options[0].select
