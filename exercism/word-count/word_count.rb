class Phrase
  VERSION = 1

  def initialize(word)
    @word = word
    @hash = {}
    clean_phrase
    fill_hash
  end

  def word_count
    @hash
  end

  def clean_phrase
    remove_punctuation
    discover_cramped_lists
    normalize_strings
    remove_quotations
  end

  def remove_punctuation
    '!!&@$%^&:.'.chars.each do |char|
      @word.delete!(char)
    end
  end

  def discover_cramped_lists
    @word.gsub!(',',' ')
  end

  def normalize_strings
    @word.downcase!
  end

  def remove_quotations
    @word.gsub!(" '"," ")
    @word.gsub!("' "," ")
  end

  def fill_hash
    @word.split(" ").each do |val|
      @hash[val] ? @hash[val] += 1 : @hash[val] = 1
    end
  end
end