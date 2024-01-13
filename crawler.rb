require 'nokogiri'
require 'open-uri'
require 'openssl'


puts "Enter a search term"
search_term = gets.chomp

url = "https://www.amazon.com/iphone/s?k=#{search_term}"
content = open(url, ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE, 'User-Agent' => 'firefox')
doc = Nokogiri::HTML(content)
product_names = []
product_prices = []

doc.xpath('//h2/a').each do |node|
    product_names << node.text
end

doc.xpath('//span[@class="a-offscreen"]').each do |node|
    product_prices << node.text
end
  

product_names.each_with_index do |name, index|
    puts "Product Name: #{name}, Price: #{product_prices[index]}"
end
