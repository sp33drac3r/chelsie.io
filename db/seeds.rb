User.create(username: 'chelsie', email: 'chelsie@chelsie.com', password: '123')


#100 School Names
schools = ['American Public University System (American Military University)',  'American River College (ARC)', 'Arizona State University', 'Ashford University (AU)',  'Austin Community College District (ACC)',  'Boston University (BU)', 'Brigham Young University - Idaho (BYU-I) ',  'Brigham Young University (BYU) ',  'Broward College (BCC)',  'California State University - Fullerton (CSUF)', 'California State University - Long Beach (CSULB)', 'California State University - Northridge (CSUN)',  'California State University - Sacramento (Sacramento State)',  'Capella University', 'College of DuPage (C.O.D.)', 'College of Southern Nevada (CSN)', 'Colorado State University (CSU)',  'East Los Angeles College (ELAC)',  'Excelsior College (EC)', 'Florida Atlantic University (FAU)',  'Florida International University (FIU)', 'Florida State University (FSU)', 'George Mason University (Mason)',  'Georgia State University (GSU)', 'Grand Canyon University (GCU)',  'Houston Community College System ',  'Indiana University - Bloomington (IU)',  'Indiana University - Purdue University - Indianapolis (IUPUI)',  'Iowa State University',  'Kaplan University',  'Kent State University - Kent Campus',  'Liberty University (LU)',  'Lone Star College - Montgomery (LSC) ',  'Louisiana State University (LSU)', 'Miami Dade College (MDC) ',  'Michigan State University',  'New York University (NYU)',  'North Carolina State University at Raleigh (NC State)',  'Northern Virginia Community College (NVCC)', 'Ohio State University',  'Ohio University',  'Pennsylvania State University',  'Portland Community College (PCC)', 'Purdue University (Purdue-West Lafayette)',  'Rutgers University - New Brunswick (Rutgers, The State University)', 'Salt Lake Community College (SLCC) ',  'San Diego State University (SDSU)',  'San Francisco State University (SFSU)',  'San Jose State University (SJSU)', 'Santa Ana College (SAC)',  'Santa Monica College (SMC)', 'South Texas College',  'Southern New Hampshire University (SNHU)', 'St Petersburg College (SPC)',  'Tarrant County College (TCC) ',  'Temple University',  'Texas A&M University (Texas A&M) ',  'Texas State University (Texas State) ',  'Texas Tech University (TTU)',  'The University of Alabama',  'The University of Tennessee',  'The University of Texas at Arlington (UT Arlington)',  'The University of Texas at Austin (UT Austin)',  'University at Buffalo (UB)', 'University of Arizona (UA)', 'University of California - Berkeley (UC Berkeley)',  'University of California - Davis (UC Davis)',  'University of California - Irvine (UCI)',  'University of California - Los Angeles (UCLA)',  'University of California - San Diego (UCSD)',  'University of Central Florida (UCF) ', 'University of Cincinnati (UC)',  'University of Colorado at Boulder (CU Boulder)', 'University of Florida (UF)', 'University of Georgia (UGA)',  'University of Houston (UH) ',  'University of Illinois at Urbana - Champaign (UIUC)',  'University of Iowa (UI)',  'University of Kentucky (UK)',  'University of Maryland - College Park (UM)', 'University of Maryland - University College (UMUC)', 'University of Michigan - Ann Arbor (U-M)', 'University of Minnesota - Twin Cities (U of M)', 'University of Missouri - Columbia (Mizzou)', 'University of North Carolina at Chapel Hill (UNC)',  'University of North Texas (UNT)',  'University of South Carolina - Columbia (SC)', 'University of South Florida (USF)',  'University of Southern California (USC)',  'University of Utah (The U)', 'University of Washington - Seattle Campus (UW-Seattle)', 'University of Wisconsin',  'Utah Valley University (UVU) ',  'Valencia College (Valencia CC) ',  'Virginia Commonwealth University (VCU)', 'Virginia Polytechnic Institute and State University (Virginia Tech)',  'Walden University (Walden U)', 'West Virginia University (WVU)', 'Western Governors University (WGU) ']

#Create 100 Schools
schools.each do |school|
  School.create(name: school)
end

# Kenyon should be id 101
School.create(
  name: 'Kenyon College',
  address: "103 College Rd, Gambier, OH 43022",
  lat: 40.3719,
  lng: -82.3983
)

20.times do
  User.create(
    username: Faker::Internet.user_name,
    email: Faker::Internet.email,
    password: '123'
    )
end

titles = ["A reason for all of us to speak louder",  "Campus drinking culture is not the problem.", "My damage is internal. I carry it with me.",  "Still learning to accept victim as part of my identity.", "What he did to me doesn’t expire.", "To my incredible parents who teach me how to turn pain into strength.", "To girls everywhere, I am with you.", "On nights when you feel alone, I am with you.", "Never stop fighting. I believe you.", "Do not be tricked out of your own self-worth.", "Trouble connecting with friends and loved ones around me.", "Tired of explaining to people why I lost so much weight.", "I just wish I could ease my familys pain.",  "The untold heroes from that night.",  "Why do I still feel so much shame?",  "Feeling utterly defenseless.",  "Unable to cope with the way the defense attorney is portraying me.",  "I just want my perpetrator to KNOW HOW THIS FEELS.",  "To all the people who still go out of their way to support me."]

School.all.each do |school|
  titles.each do |title|
    Post.create(
      title: title,
      body: "You cannot give me back my sleepless nights. The way I have broken down sobbing uncontrollably if I’m watching a movie and a woman is harmed, to say it lightly, this experience has expanded my empathy for other victims. I have lost weight from stress, when people would comment I told them I’ve been running a lot lately. There are times I did not want to be touched. I have to relearn that I am not fragile, I am capable, I am wholesome, not just livid and weak.",
      user_id: rand(1..10),
      school_id: school.id
      )
  end
end

Post.create(
  title: "I have to relearn that I am not fragile, I am capable, I am wholesome.",
  body: "You have no idea how hard I have worked to rebuild parts of me that are still weak. It took me eight months to even talk about what happened. I could no longer connect with friends, with everyone around me. I would scream at my boyfriend, my own family whenever they brought this up. You never let me forget what happened to me. At the of end of the hearing, the trial, I was too tired to speak. I would leave drained, silent. I would go home turn off my phone and for days I would not speak. You bought me a ticket to a planet where I lived by myself. Every time a new article come out, I lived with the paranoia that my entire hometown would find out and know me as the girl who got assaulted. I didn’t want anyone’s pity and am still learning to accept victim as part of my identity. You made my own hometown an uncomfortable place to be.
You cannot give me back my sleepless nights. The way I have broken down sobbing uncontrollably if I’m watching a movie and a woman is harmed, to say it lightly, this experience has expanded my empathy for other victims. I have lost weight from stress, when people would comment I told them I’ve been running a lot lately. There are times I did not want to be touched. I have to relearn that I am not fragile, I am capable, I am wholesome, not just livid and weak.
When I see my younger sister hurting, when she is unable to keep up in school, when she is deprived of joy, when she is not sleeping, when she is crying so hard on the phone she is barely breathing, telling me over and over again she is sorry for leaving me alone that night, sorry sorry sorry, when she feels more guilt than you, then I do not forgive you. That night I had called her to try and find her, but you found me first. Your attorney’s closing statement began, '[Her sister] said she was fine and who knows her better than her sister.' You tried to use my own sister against me? Your points of attack were so weak, so low, it was almost embarrassing. You do not touch her.
You should have never done this to me. Secondly, you should have never made me fight so long to tell you, you should have never done this to me. But here we are. The damage is done, no one can undo it. And now we both have a choice. We can let this destroy us, I can remain angry and hurt and you can be in denial, or we can face it head on, I accept the pain, you accept the punishment, and we move on.",
  user_id: 1,
  school_id: School.find_by(name: 'Kenyon College').id
  )

50.times do
  Comment.create(
    body: ["You are not alone.", "Sending so much love your way.  You have no idea how empowering it is to read these words.", "Thank you for sharing. I've been struggling to open up similarly.", "You're words are inspiring. I think I want to reach out to more people to offer my support.", "I promise you will only feel stronger as time goes on."].sample,
    user_id: rand(1..20),
    post_id: rand(5..1500)
    )
end



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


# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# require 'csv'

# @client = GooglePlaces::Client.new(ENV["GP_BROWSER_API_KEY"])

# CSV.foreach("db/cities.csv", :headers => true, :header_converters => :symbol, :converters => :all) do |row|

#   @centers = @client.spots_by_query("Rape crisis center near " + row[:city] + " " + row[:state])

#     @centers.each do |center|
#       ServiceProvider.create(name: center["name"], address: center["formatted_address"], lat: center["lat"], lng: center["lng"], place_id: center["place_id"])
#     end

# end

# CSV.foreach("db/centers.csv", :headers => true, :header_converters => :symbol, :converters => :all) do |row|

#   ServiceProvider.create(name: row[:name], address: row[:address], lat: row[:lat], lng: row[:lng], place_id: row[:place_id])

# end



