# frozen_string_literal: true

require_relative 'ISBN13/version'

module ISBN13


  # Calculate the check digit for an ISBN13
  # Filters out all non-numeric characters
  # Multiplies the digits in odd positions by 3
  # Sums the digits
  # Take modulo 10 of the sum and subtract from 10
  # If the result is 10, the check digit is 0
  def self.calculate(isbn)
    isbn = isbn.gsub(/[^0-9]/, '')
    return nil if isbn.length != 12

    sum = 0
    isbn.split('').each_with_index do |digit, index|
      sum += index.even? ? digit.to_i : digit.to_i * 3
    end
    sum = 10 - (sum % 10)
    sum = 0 if sum == 10
    sum
  end

  # Add the check digit to the end of the ISBN13
  def self.complete(isbn)
    isbn + calculate(isbn).to_s
  end

end
