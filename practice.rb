require 'line/bot'  # gem 'line-bot-api'
require 'open-uri'
require 'kconv'
require 'rexml/document'

def callback
  url  = "https://www.drk7.jp/weather/xml/13.xml"
  xml  = open( url ).read.toutf8
  doc = REXML::Document.new(xml)
  xpath = 'weatherforecast/pref/area[4]/'
  el = doc.elements[xpath + 'info[2]/rainfallchance/period[2]'].text
  el.to_i
end
pp callback