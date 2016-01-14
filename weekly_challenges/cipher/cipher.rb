# class Cipher
class Cipher
  attr_reader :key
  ALPHABET = ('a'..'z').to_a

  def initialize(key = nil)
    validate_key(key)
    @key = key || generate_key
  end

  def encode(text)
    shift_text(text)
  end

  def decode(text)
    shift_text(text, false)
  end

  private

  def shift_text(text, encode = true)
    str = ''
    text.chars.each_with_index do |letter, idx|
      str += find_shifted_letter(letter, idx, encode)
    end
    str
  end

  def find_shifted_letter(letter, idx, encode = true)
    if encode
      ALPHABET[find_letter(letter) + find_letter(key[idx]) % 26]
    else
      ALPHABET[find_letter(letter) - find_letter(key[idx]) % 26]
    end
  end

  def find_letter(letter)
    ALPHABET.find_index[letter]
  end

  def validate_key(key)
    return if key.nil?
    fail ArgumentError, 'Invalid key' if key.match(/[A-Z0-9\s]|^$/)
  end

  def generate_key
    ALPHABET.sample(100).join
  end
end
