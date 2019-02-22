require 'open-uri'
require 'date'
# require 'nokogiri'
# require 'net/http'
# require 'watir'
# require "selenium-webdriver"
require 'byebug'
require 'net/http'
require 'uri'
require 'json'

"http://linkedin.bitshare.cm/recommendations.php
https://www.vanling.net/LinkedIn.htm
https://socialrecommendator.com/"

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

# def find_lat_lon(str)
#   new_str = ""
#   open_br = 0
#   check = false
#   str.each_char do |s|
#     check = true if s == "{"
#     if check
#       new_str += s
#       open_br += 1 if s == "{"
#       open_br -= 1 if s == "}"
#       break if open_br == 0
#     end
#   end
#   str = 0

#   puts new_str

#   first_half = new_str.split("position:").first
#   last_half = new_str.split("position:").last

#   (0...last_half.length).each do |n|
#     open_br += 1 if last_half[n] == "{"
#     open_br -= 1 if last_half[n] == "}"
#     last_half[n] = ""
#     break if open_br == 0
#   end

#   new_str = first_half+last_half
# end
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

# p DateTime.now.strftime('%Y%m%d%H%M%S')
# p Time.parse("18:38:09").strftime()

# xlsm_file = 'https://s3.amazonaws.com/buildsourced-production-1/Tenna+Asset+Report+v18.6.5.xlsm'
# xlsx_file = "https://s3.amazonaws.com/buildsourced-production-1/Asset+Data+File.xlsx"
# p open(xlsm_file).read

# p download = open(xlsx_file).read
# File.open('/tmp/Asset Data File.xlsx', 'wb') {|f| f.write(open(xlsx_src).read) }
# p 'active', as: :select, collection: ['pending', 'active','block']

# p [*('a'..'z'),*('0'..'9')].sample(7).join
# p Date.today.strftime('%Y-%m-%d') == "2018-06-22"

# p Date.today
# p Time.now.strftime('%Y-%m-%d')


# p boys_sport = ['Baseball', 'Basketball', 'Football', 'Wrestling', 'Volleyball', 'Water Polo', 'Track & Field', 'Tennis', 'Swimming & Diving', 'Soccer', 'Lacrosse', 'Gymnastics', 'Golf']

# holiday_supplies = {
#   "winter" => { 
#     "Christmas" => ["lights", "tree"],
#     "New Years" => "champagne glasses"
#   },
#   "summer" => {
#     "July Fourth" => ["BBQ", "flags"]
#   },
#   "spring" => {
#     "Memorial Day" => "BBQ"
#   },
#   "fall" => {
#     "Labor Day" => "hot dogs"
#   }
# }

# text = "   asd asd asd    \n     \n"
# p text.strip
# p text.lstrip
# p text.rstrip
# p text.chomp
# p text.delete(" \t\r\n")
# p text.squeeze(' ')

# sport_type = {
#   "Boys" => ['Baseball', 'Basketball', 'Football', 'Wrestling', 'Volleyball', 'Water Polo', 'Track & Field', 'Tennis', 'Swimming & Diving', 'Soccer', 'Lacrosse', 'Gymnastics', 'Golf'],
#   "Girls" => ['Badmiton', 'Basketball', 'Golf', 'Gymnastics', 'Soccer', 'Softball', 'Swimming & Diving', 'Tennis', 'Track & Field ', 'Volleyball', 'Water Polo'],
#   "Others" => ['Band', 'Chorus', 'Cheerleading', 'Debate', 'Other', 'Marching Band', 'Dance']
# }

# p sport_type["Boys"].include?('Baseball')

  # def get_live_streams_codes
  #   require 'httparty'
  #   response = HTTParty.get("http://192.168.1.101:8087/v2/servers/_defaultServer_/vhosts/_defaultVHost_/applications/live/instances/_definst_",
  #                         headers:
  #                         {
  #                           "Content-Type" => "application/json"
  #                         })
  #   response
  # end

  # def response_verification(response)
  #   response
  #   names = []
  #   parsed_res = response.parsed_response["Instance"]["IncomingStreams"] if response.code == 200
  #   p parsed_res["IncomingStream"].nil?
  #   if response.code == 200 && !parsed_res.nil? && !parsed_res["IncomingStream"].nil?
  #     names << get_streams_name(response)
  #   end
  #   names.flatten
  # end

  # def get_streams_name(response)
  #   streams = response.parsed_response["Instance"]["IncomingStreams"]["IncomingStream"]
  #   streams = streams.collect { |stream| stream["Name"] }
  #   streams = streams.delete_if { |stream| stream.include? ("_") }
  #   streams.uniq
  # end

  # p response_verification(get_live_streams_codes)

require 'active_support/core_ext/hash'

# url = URI("http://192.168.0.118:1935/converter.xml?command=convert&streamname=1mtqywr_720p&startoffset=32000")
# p response = Hash.from_xml(Net::HTTP.get(url))
# p '*'*100
# url = URI("http://192.168.0.118:1935/converter.xml?command=expire&streamname=xPIJm0E_720p")
# p response = Hash.from_xml(Net::HTTP.get(url))

# url = URI("http://192.168.0.118:1935/converter.xml?command=expire&streamname=xPIJm0E_720p")
# p response = Hash.from_xml(Net::HTTP.get(url))

# response = {"WowzaMediaServer"=>{"status"=>"200", "ApplicationName"=>"live", "InstanceName"=>"_definst_", "DVR"=>{"ContextObject"=>"com.wowza.wms.dvr.DvrApplicationConverterContext@7e711f2f", "StoreName"=>["1mtqywr contains version 0", "1mtqywr_360p contains version 0", "1mtqywr_720p contains version 0", "xPIJm0E contains version 0", "xPIJm0E_360p contains version 0", "xPIJm0E_720p contains version 0"], "ForceExpirePreviousConversions"=>{"CurrentStore"=>"xPIJm0E_720p.0", "State"=>"RUNNING"}, "ForcingExpiry"=>{"UnexpiredStore"=>"xPIJm0E_720p.0", "State"=>"RUNNING"}}}}
# response = {"WowzaMediaServer"=>{"status"=>"200", "ApplicationName"=>"live", "InstanceName"=>"_definst_", "DVR"=>{"ContextObject"=>"com.wowza.wms.dvr.DvrApplicationConverterContext@7e711f2f", "StoreName"=>["1mtqywr contains version 0", "1mtqywr_360p contains version 0", "1mtqywr_720p contains version 0", "xPIJm0E contains version 0", "xPIJm0E_360p contains version 0", "xPIJm0E_720p contains version 0"], "ForceExpirePreviousConversions"=>{"CurrentStore"=>["xPIJm0E_720p.0", "1mtqywr_720p.0"], "State"=>["RUNNING", "RUNNING"]}, "ForcingExpiry"=>{"UnexpiredStore"=>["xPIJm0E_720p.0", "1mtqywr_720p.0"], "State"=>["RUNNING", "RUNNING"]}}}}
# response = {"WowzaMediaServer"=>{"status"=>"200", "ApplicationName"=>"live", "InstanceName"=>"_definst_", "DVR"=>{"ContextObject"=>"com.wowza.wms.dvr.DvrApplicationConverterContext@7e711f2f", "StoreName"=>["1mtqywr contains version 0", "1mtqywr_360p contains version 0", "1mtqywr_720p contains version 0", "xPIJm0E contains version 0", "xPIJm0E_360p contains version 0", "xPIJm0E_720p contains version 0"], "ForceExpirePreviousConversions"=>nil, "ForcingExpiry"=>nil}}}
# p response["WowzaMediaServer"]["DVR"]["ForceExpirePreviousConversions"]["CurrentStore"].include?("xPIJm0E_720p.0")
# p response["WowzaMediaServer"]["DVR"]["ForceExpirePreviousConversions"]["State"]
# p response["WowzaMediaServer"]["DVR"]["ForceExpirePreviousConversions"]["CurrentStore"].include?("xPIJm0E_720p.0")
# p i = response["WowzaMediaServer"]["DVR"]["ForceExpirePreviousConversions"]["CurrentStore"].find_index("xPIJm0E_720p.0")
# p response["WowzaMediaServer"]["DVR"]["ForceExpirePreviousConversions"]["State"][0]
# unless response["WowzaMediaServer"]["error"].present?
#   ndvrStore = response["WowzaMediaServer"]["DVR"]["ForceExpirePreviousConversions"]
#   if ndvrStore.present? && ndvrStore["CurrentStore"].include?("xPIJm0E_720p.0")
#     if ndvrStore["CurrentStore"].kind_of?(Array)
#       p i = ndvrStore["CurrentStore"].find_index("xPIJm0E_720p.0")
#       if ndvrStore["State"][i] == "RUNNING"
#         sleep(2) 
#         response = Hash.from_xml(Net::HTTP.get(url))
#         puts "next request"
#       end
#     else
#       if ndvrStore["CurrentStore"] == "xPIJm0E_720p.0" && ndvrStore["State"] == "RUNNING"
#         sleep(2) 
#         response = Hash.from_xml(Net::HTTP.get(url))
#         puts "next request"
#       end
#     end
#   end
# end

# def convert_ndvr(code)
#   url = URI("http://192.168.0.118:1935/converter.xml?command=convert&streamname=#{code}&startoffset=32000")
#   response = Hash.from_xml(Net::HTTP.get(url))
#   if response["WowzaMediaServer"]["error"].present?
#     return false
#   else
#     return response["WowzaMediaServer"]["DVR"]["StoreConversionSelected"]["ConversionStarted"]["FileName"] == code+".0"
#   end
# end


# if convert_ndvr("xPIJm0E_720p")
# else
#   "error"
# end

# file_name = "asyu7h_720p.0.mp4"
# file_name = "asyu7h_720p.0_0.mp4"
# file_name = "asyu7h_720p.0_1.mp4"
# clip_no = file_name.split(".")[1]
# file_name = file_name.gsub(clip_no, (clip_no.size > 1 ? "0_"+(clip_no.split("_")[1].to_i+1).to_s : clip_no+"_0"))

# # p file_name


# p file_name = "xPIJm0E_720p.0.mp4"
# p clip_no = file_name.split(".")[1]
# file_name = file_name.gsub('.'+clip_no, '.'+(clip_no.size > 1 ? "0_"+(clip_no.split("_")[1].to_i+1).to_s : clip_no+"_0"))
# p file_name

  

# @sport_type = ['Baseball', 'Basketball', 'Football', 'Wrestling', 'Volleyball', 'Water Polo', 'Track & Field', 'Tennis', 'Swimming & Diving', 'Soccer', 'Lacrosse', 'Gymnastics', 'Golf']

# @sport_type.each_with_index.map {|k, v| 
#   p k.humanize.capitalize
#   p v
# }


# str = "asda-asda! asd@asdsa"
# p str.sub(/.*?@/, '') #remove every before @
# p str[/[^@]+/] #remove every after @
# p str[/[^@]+/] #remove every after @ and if there is nothing before @ return ""
# str = "@asdsa"
# p str[/[^@]+/]

# t = "2018-10-04 07:00 AM -05:00"
# p Time.parse(t).in_time_zone("Asia/Karachi").strftime("%m/%d/%g %I:%M%P")
# video_url = "https://s3.amazonaws.com/zoom-aws-bucket/schools/5/events/168/video/01xRu8V.mp4"
# p video_url.gsub("https://s3.amazonaws.com/zoom-aws-bucket/schools/5/events/168/video/", "").gsub(".mp4", "")

# arr = [5,3,1,4,6,7,43,56,8,85,3]
# p arr.drop(2)
# p arr

# p raw "Please provide <b>Home</b> & Away Team OR Participants"


# 1850
# 1739
# shipping price 339
# fees_in_cent 607
# 256


# p 1850 - (1739 + 399  + 607 + 256)

startClip = 1542897861572
endClip = 1542897992328

startClip = 1546338718923
endClip = 1546338820884

"1546338718923
1546338760884"

startoffset = 0
endoffset = 0

p endAt = (endClip - endoffset)
p startAt = startClip

p (endClip - endoffset - startoffset)..(endClip - endoffset)

# p res =  endClip - startClip
# p "total is 1:15"
# # p "total is 1:21"
# p "diff: #{ (res/1000)/60 }:#{ (res/1000)-60 }"

# startAt = endClip - 40000;
# if(startAt <  startClip)
#   startAt = startClip
# end

# p "#{(81600/1000)/60}:#{(81600/1000)-60}"

# require 'ostruct'
# # authorization.plan.amount
# hash = {created_at: Date.today, status: 'active'}
# authorization = OpenStruct.new(hash)
# p authorization.created_at

authorization = OpenStruct.new({created_at: Date.today, status: 'active', plan: OpenStruct.new(amount: 33.0)})
# p authorization.plan.amount

# p '*************'
# begin
#   p Time.parse("23:2323")
# rescue
#   begin
#     p Time.parse("23:2323")
#     # p '2'
#   rescue
#     p '3'
#   end
# ensure
#   p '4'
# end

# p '************'
# a = 3
# b = 3
# a = b = 5 if false
# p a
# p b






# str = "asd-asd as asd_asd asd.s"
# p str.humanize
# p str.capitalize
# p str.titleize
# p str.gsub(/\b('?[a-z])/) { $1.capitalize }


# home_team = "FC asd"
# # home_team = "FC"
# res = home_team[0..2].strip
# p res.length
# p res[0]+" "+res[1]
# p res+"."
# p ".F."


# arr = [1,2,3,5]
# arr.each do |n|
#   p n
# end

# arr.map { |n| p n }

=begin
  http://13.52.116.110:8086/AutoRecordPath.xml?streamName=7GZP0l9&s3path=/s3usWest1/schools/9/events/184/video/&action=add&app=livehttporigin
  *1.* rtmp://13.52.116.110:1935/livehttporigin/7GZP0l9
  *2.* https://d2pe448uhcdckv.cloudfront.net/livehttporigin/ngrp:7GZP0l9_all/playlist.m3u8?DVR
  *3.* http://13.52.116.110:8086/inject.xml?streamName=7GZP0l9&text=AB%2001%20XYZ%2002%2012:59%20P%20stop  _(replace `stop` with `start` to start clock on scoreboard)_
=end


pprice = ""
p pprice.present?

p !!authorization.sb


# authorization = OpenStruct.new({application_fee_percent: nil, billing: "charge_automatically", billing_cycle_anchor: 1538842309, billing_thresholds: nil, cancel_at_period_end: false, canceled_at: nil, created: 1538583109, current_period_end: 1549469509, current_period_start: 1546791109, customer: "cus_DieFlyos04IaW7", days_until_due: nil, default_source: nil, discount: nil, ended_at: nil, id: "sub_DieFnHrZ6Dtu1H", 
#       items: OpenStruct.new({
#         data: OpenStruct.new([billing_thresholds: nil, created: 1538583109, id: "si_DieFLs967sckEX", 
#           metadata: OpenStruct.new({object: "subscription_item", plan: active: true, aggregate_usage: nil, amount: 6900, billing_scheme: "per_unit", created: 1497399714, currency: "usd", id: "zen-dvd-us", interval:"month", interval_count; 1, livemode: false, 
#             metadata: OpenStruct.new({name: "Zen Arbitrage: DVDs", nickname: nil, object: "plan", product: "prod_BUF1xawdjsv0wP", statement_descriptor: nil, tiers: nil, tiers_mode: nil. transform_usage: nil, trial_period_days: 3, usage_type: "licensed", quantity: 1, subscription: "sub_DieFnHrZ6Dtu1H"})
#           has_more: false, object: "list", total_count: 1, url: "/v1/subscription_items?subscription=sub_DieFnHrZ6Dtu1H", livemode: false, 
#             metadata: OpenStruct.new({object: "subscription", 
#               plan: OpenStruct.new({active: true, aggregate_usage: nil, amount: 6900, billing_scheme: "per_unit", created: 1497399714, currency: "usd", id: "zen-dvd-us", interval: "month", interval_count: 1, livemode: false, 
#                 metadata: OpenStruct.new({name=: "Zen Arbitrage: DVDs", nickname: nil, object: "plan", product: "prod_BUF1xawdjsv0wP", statement_descriptor: nil, tiers: nil, tiers_mode: nil, transform_usage: nil, trial_period_days: 3, usage_type: "licensed", quantity: 1, start: 1538583109, status: "active", tax_percent: nil, trial_end: 1538842309, trial_start: 1538583109})
#     }


p "******************************"

class User
  funs = ['id', 'first_name', 'last_name', 'created_at', 'updated_at']
  funs.each do |n|
    (class << self; self; end).instance_eval do
      define_method("find_by_#{n}") do |arg=nil|
        p "Select * From User Where #{n} = #{arg};"
      end
    end
  end
end

User.find_by_last_name 'tqr'

class Book
  def self.send arg=nil
    p 'war jao tum'
  end
  def send arg=nil
    p 'war jao tum'
  end
  private
  def self.set_book
    p "###"
  end
end

Book.new.send :set_book
Book.send :set_book



user = {name: 'asd'}
# user.name

user = OpenStruct.new({name: 'asd'})
p user.name

all_filters = [:min_price, :max_price, :new_min_price, :new_max_price, :profit_optimizer_new, :profit_optimizer_used, :profit_optimizer_new_min, :profit_optimizer_used_min]

filters = {:min_price=>"$0.00", :max_price=>"$100.00", :new_min_price=>"$0.00", :new_max_price=>"$100.00", :with_trade_in_value=>"1", :profit_optimizer_new=>"$100.00", :profit_optimizer_used=>"$100.00", :browse_nodes=>["1000"], :page=>1}
p filters

filt = filters.map { |k, v| "#{all_filters.include?(k) ? v.gsub('$', '').to_f : v}" }
  # p v = v.gsub('$', '').to_f if all_filters.include?(k)
  # [k, v.gsub('$', '').to_f if all_filters.include?(k)]
  # if v.respond_to?(:to_str) && all_filters.includes(k)

  # end
# } 

filters.each{ |key, val| (filters[key] = val.gsub('$', '').to_f) if all_filters.include?(key) }

p filters
p filt

p "12.3".include?('$')


sort_params = {asd: 123}
p sort_params[:asd]
p sort_params

p parms = {user: {a: 1, b: 2, c: 3}}
p parms[:user].merge(d: 4)
p parms[:user].merge(d: 4)

p wer ||= 2
p wer ||= 3

i=0
b = ++i
p b


# p "School Name" == "school Name"
result = []
p result.is_a? Array
p result[0].nil?

faulty_schools = []
faulty_schools << { row: 0, error: "e.message" }
faulty_schools << { row: 1, error: "e.message" }
faulty_schools.map{|r| p r[:row] }
faulty_schools = []
faulty_schools << 1
faulty_schools << 2
p faulty_schools.first.class



class User
  funs = ['id', 'first_name', 'last_name', 'created_at', 'updated_at']
  funs.each do |n|
    (class << self; self; end).instance_eval do
      define_method("find_by_#{n}") do |arg=nil|
        p "Select * From User Where #{n} = #{arg};"
      end
    end
  end
end

User.find_by_last_name 'tqr'

p ['purchased', 'recieved', 'sold'].include?('purchaseds')

# (0..200).each do |i|
#   if(i%3 == 0)
#     p ((i%9)/3)+1
#   end
# end

"12:56 am"
"00:56"
