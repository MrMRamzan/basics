require 'open-uri'
require 'date'
# require 'nokogiri'
# require 'net/http'
# require 'watir'
# require "selenium-webdriver"
require 'byebug'

# str = "A-Be:"
# p str.include?('-')
# p str.size < 2

# p str = str.gsub(':','')

# cities = {"Aberdeen-County"=>["Aberdeen", "Aberdeen-Airport"]},
#   {"Aberdeenshire"=>["Aboyne", "Ballater", "Banchory", "Banff", "Braemar", "Ellon", "Fraserburgh", "Huntly", "Inverurie", "Peterhead", "Stonehaven", "Turriff"]},
#   {"Angus"=>["Arbroath", "Barry", "Brechin", "Carnoustie", "Forfar", "Kirriemuir", "Montrose"]},
#   {"Argyll-and-Bute"=>["Appin", "Arrochar", "Campbeltown", "Cardross", "Cove", "Dunoon", "Helensburgh", "Inveraray", "Isle-Of-Bute", "Isle-Of-Islay", "Isle-Of-Tiree", "Kilcreggan", "Lochgilphead", "Loch-Lomond", "Luss", "Oban", "Rhu", "Rothesay", "Tarbert", "Tobermory"]},
#   {"Bedfordshire"=>["Ampthill", "Arlesey", "Aspley-Guise", "Barton-Le-Clay", "Bedford", "Biddenham", "Biggleswade", "Bromham", "Caddington", "Clapham", "Clifton", "Clophill", "Cranfield", "Dunstable", "Eaton-Bray", "Flitwick", "Great-Barford", "Harlington", "Harrold", "Henlow", "Houghton-Regis", "Kempston", "Langford", "Leighton-Buzzard", "Linslade", "Luton", "Marston-Moretaine", "Maulden", "Oakley", "Potton", "Sandy", "Sharnbrook", "Shefford", "Shillington", "Silsoe", "Stotfold", "Toddington", "Turvey", "Woburn", "Wootton"]},
#   {"Berkshire"=>["Ascot", "Binfield", "Bracknell", "Burghfield-Common", "Calcot", "Caversham", "Caversham-Heights", "Cippenham", "Colnbrook", "Cookham", "Crowthorne", "Datchet", "Earley", "Finchampstead", "Hermitage", "Hungerford", "Langley", "Lower-Earley", "Maidenhead", "Mortimer", "Newbury", "Old-Windsor", "Pangbourne", "Reading", "Sandhurst", "Shinfield", "Slough", "Sunningdale", "Sunninghill", "Thatcham", "Theale", "Tilehurst", "Twyford", "Warfield", "Wargrave", "Windsor", "Winnersh", "Wokingham", "Woodley", "Wraysbury"]}

# p cities[0].keys[0]

# ***********************************************************

# Selenium::WebDriver::Chrome.driver_path = "/home/touqeer/Desktop/rightmove/chromedriver"
# url = "http://www.rightmove.co.uk/property-for-sale/Aberdeen-County.html"
# browser = Watir::Browser.new :chrome
# browser.goto(url)
# document = Nokogiri::HTML(browser.html)
# puts document

# ***********************************************************

# str = "The Policies, Dalmuinzie Road, Bieldside,  Aberdeen, AB15"
# p str = str.split("Aberdeen").first.reverse.sub(',', '').reverse

# str = "Bonnymuir House, 267A Westburn Road, ABERDEEN, AB25"
# city = "Aberdeen"
# p str = str.split(/#{city}/i).first.reverse.sub(',', '').reverse

# (0...5).each do |n|
#   puts n
# end


# str = "Â£1,600,000 - £1,600,000"
# puts str.partition("£").last
# puts str.split('-').first

# arr = []
# arr << ["asd", "wqe", "xzcv"]
# puts arr

# str = "\n    \n    Featured    \n            10\n                \n        \n            \n        \n    \n        \n        \n                \n        \n            \n        \n    \n        \n        \n                \n        \n            \n        \n    \n        \n    \n    \n"
# puts str.downcase.include?('featured')

# num = 357
# puts pages = (num.to_f/24).ceil


# str = "\n            3 bedroom apartment        "
# p str.strip

# p 'Once upon a time in a world far far away'.truncate(27)
# p truncate("Once upon a time in a world far far away", length: 17)

def find_lat_lon(str)
  new_str = ""
  open_br = 0
  check = false
  str.each_char do |s|
    check = true if s == "{"
    if check
      new_str += s
      open_br += 1 if s == "{"
      open_br -= 1 if s == "}"
      break if open_br == 0
    end
  end
  str = 0

  puts new_str

  first_half = new_str.split("position:").first
  last_half = new_str.split("position:").last

  (0...last_half.length).each do |n|
    open_br += 1 if last_half[n] == "{"
    open_br -= 1 if last_half[n] == "}"
    last_half[n] = ""
    break if open_br == 0
  end

  new_str = first_half+last_half
end
# str = ":{attachToElement:.js-streetview,streetViewPointOfView:{heading:0.0,pitch:0.0,zoom:1,position:{latitude:57.120951,longitude:-2.209209}},latitude:57.12100498080078,longitude:-2.2090583588012533,showOnInit:true,motionTracking:false},\r\nmarketInfoController:marketInfoController,\r\nchannel:gaTrackingChannel,\r\ntabsContainer:similarNearbyTabs,\r\n\t\tnearBySchools:nearBySchools,\r\n\t\tknockoutJsUrl:/ps/js18101/concat/js_main_v1/knockout-3.3.0.js,\r\n\t\tlocationTabContentsModel:{mapLocation:{latitude:57.120951,longitude:-2.209209,zoom:14,exact:true},streetViewPointOfView:{heading:0.0,pitch:0.0,zoom:1,position:{latitude:57.120951,longitude:-2.209209}},nearbyTubeLine:false,showStreetViewOption:true,defaultStreetView:false},\r\n\t\tbroadbandCtmUrl:https://partnerships-broadband.sergei.io/v1/broadband/rightmove/AB159BQ?apikey=45a4a9f3ccf90bcb9d27f8800a6670"
# str = find_lat_lon(str)
# latitude = str.split("latitude:").last.to_f
# longitude = str.split("longitude:").last.to_f

# str = "3 Bedroom semi-detached house for sale"
# puts str.downcase.include?("bedroom")
# puts str.to_i

# require 'rubygems'
# require 'nokogiri'
# require 'open-uri'
# require 'json'

# url = "http://www.rightmove.co.uk/property-for-sale/property-71126420.html"

# # Open the initial page to grab the cookie from it
# p1 = open(url)

# # Save the cookie
# cookie = p1.meta['set-cookie'].split('; ',2)[0]

# # Open the JSON data page using our cookie we just obtained
# p2 = open(url, 'Cookie' => cookie)

# # Get the raw JSON
# json = p2.read

# # Parse it
# data = JSON.parse(json)

# # Feed the html portion to Nokogiri
# puts doc = Nokogiri.parse(data['html'])


# require 'httparty'
# require 'nokogiri'
# require 'watir'
# require "selenium-webdriver"
# require 'byebug'

# Selenium::WebDriver::Chrome.driver_path = "/home/touqeer/Desktop/rightmove/chromedriver"
# url = "http://www.rightmove.co.uk/property-for-sale/property-71126420.html"
# browser = Watir::Browser.new :chrome
# browser.goto(url)
# browser.execute_script("$('#historyMarketTab').click()")
# browser.div(:class => "ajaxLoadingSpinner"  ).wait_while_present
# document = Nokogiri::HTML(browser.html)


# url = "http://www.rightmove.co.uk/property-for-sale/property-71126420.html"
# p url.split('property-').last.to_i
#  property_data = {
#                   id_from_rightmove: "id_from_rightmove",
#                   property_link: "property_link",
#                   latitude: "latitude,",
#                   longitude: "longitude," ,
#                   address: "address," ,
#                   postal_code: "postal_code," ,
#                   road: "road," ,
#                   city: "city," ,
#                   country: "country," ,
#                   state: "state," ,
#                   listed_on: "listed_on," ,
#                   asking_price: "asking_price," ,
#                   description: "description," ,
#                   beds: "beds," ,
#                   last_sold_price: "last_sold_price," ,
#                   last_sold_date: "last_sold_dat"
#                 }

# p property_data
# p property_data.merge!(image_url: "image_url")
# p property_data

# puts "£745,000".gsub("£","").gsub(",","").to_i

p DateTime.now.strftime('%Y%m%d%H%M%S')
# xlsm_file = 'https://s3.amazonaws.com/buildsourced-production-1/Tenna+Asset+Report+v18.6.5.xlsm'
# xlsx_file = "https://s3.amazonaws.com/buildsourced-production-1/Asset+Data+File.xlsx"
# p open(xlsm_file).read

# p download = open(xlsx_file).read
# File.open('/tmp/Asset Data File.xlsx', 'wb') {|f| f.write(open(xlsx_src).read) }
p 'active', as: :select, collection: ['pending', 'active','block']
