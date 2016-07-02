######### RAINN CENTERS SCRAPE - DO NOT UNCOMMENT ##############
# CSV.foreach("db/RAINN_centers.csv") do |row|
#   browser = Watir::Browser.new

#   browser.goto(row[0])
#   sleep(rand(1..4))
#   doc = Nokogiri::HTML.parse(browser.html)

#   service_provider = {}

#   text                                  = doc.xpath("//address").first.text
#   info                                  = doc.xpath("//small")
#   services                              = info[0].text.gsub(/\s+/, ' ')
#   populations                            = info[2].text.gsub(/\s+/, ' ')
#   service_provider[:name]               = doc.xpath('//h3').children.text
#   service_provider[:telephone]          = /(?<= Telefonico : ).{14}/.match(text).to_s
#   service_provider[:tty]                = /(?<= Ayuda: ).{14}/.match(text).to_s
#   service_provider[:zip]                = /\b\d{5}\b/.match(text).to_s
#   service_provider[:website]            = /(http|www).*/.match(text).to_s
#   service_provider[:services_offered]   = /(?<= offered: ).*/.match(services).to_s
#   service_provider[:populations_served] = /(?<= served: ).*/.match(populations).to_s

#   @client = GooglePlaces::Client.new(ENV["RILEY_GP_API_KEY"])
#   @gp_result = @client.spots_by_query("#{service_provider[:name]} #{service_provider[:zip]}")

#   unless @gp_result.empty?
#     service_provider[:address]  = @gp_result[0].formatted_address
#     service_provider[:lat]      = @gp_result[0].lat
#     service_provider[:lng]      = @gp_result[0].lng
#     service_provider[:place_id] = @gp_result[0].place_id
#   end

#   @service_provider = ServiceProvider.new(service_provider)

#   if @service_provider.save
#     p @service_provider
#   else
#     p @service_provider
#     break
#   end

#   sleep(rand(1..4))
# end




