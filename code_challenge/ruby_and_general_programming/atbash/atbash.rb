# Atbash Cipher Coding Challenge
# https://gist.github.com/RicardoRojo/3fd2469e9d611c2ec0ac
class Atbash
  LETTER_ARRAY = ('a'..'z').to_a

  def self.encode(word)
    clean_word!(word)
    word = cipher_word(word.chars)
    divide_word(word)
  end

  def self.switch_letter(letter)
    letter_position = LETTER_ARRAY.find_index(letter.downcase)
    LETTER_ARRAY[25 - letter_position]
  end

  def self.clean_word!(word)
    word.gsub!(/[\s.,]/, '')
  end

  def self.cipher_word(word)
    word.inject('') do |decoded, letter|
      decoded + (num?(letter) ? letter : switch_letter(letter))
    end
  end

  def self.divide_word(encoded_word)
    encoded_word.scan(/.{1,5}/).join(' ')
  end

  def self.num?(char)
    char.to_i.to_s == char
  end
end
