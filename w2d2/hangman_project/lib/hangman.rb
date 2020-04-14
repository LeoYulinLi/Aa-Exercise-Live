class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  def self.random_word()
    DICTIONARY.sample
  end

  attr_reader :guess_word, :attempted_chars, :remaining_incorrect_guesses

  def initialize()
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length) { "_" }
    @attempted_chars = Array.new
    @remaining_incorrect_guesses = 5
  end

  def already_attempted?(char)
    self.attempted_chars.include?(char)
  end

  def get_matching_indices(char)
    final_array = Array.new
    @secret_word.each_char.with_index { |c, i| final_array << i if char == c }
    final_array
  end

  def fill_indices(char, idx_array)
    idx_array.each do |i|
      @guess_word[i] = char
    end
  end

  def try_guess(char)
    if already_attempted?(char)
      p "that has already been attempted"
      return false
    else
      @attempted_chars << char
      if get_matching_indices(char).length == 0
        @remaining_incorrect_guesses -= 1
        return true
      else
        self.fill_indices(char, get_matching_indices(char))
        return true
      end
    end
  end

  def ask_user_for_guess
    p "Enter a char:"
    try_guess(gets.chomp)
  end

  def win?
    if @guess_word.join == @secret_word
      p "WIN"
      return true
    else
      return false
    end
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      p "LOSE"
      return true
    else
      return false
    end
  end

  def game_over?
    p @secret_word
    win? || lose?
  end

end
