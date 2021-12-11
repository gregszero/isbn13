# frozen_string_literal: true
include 'bin/isbn_checker'
barcode = 0

while barcode.zero?
  puts 'Type the barcode: '
  barcode = gets.to_i
  puts 'Numbers only' if barcode.zero?
end
puts barcode
puts check(barcode)

