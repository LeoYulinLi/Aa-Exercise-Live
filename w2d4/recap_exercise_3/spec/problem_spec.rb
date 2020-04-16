require 'problem'

describe "Recap Exercise 3" do

  describe "General Problems" do
    describe "no_dupes?" do
      it "should accept an array of any type as an argument" do
        expect do
          no_dupes?([1, 1, 2, 1, 3, 2, 4])
          no_dupes?(%w(x x y z z))
          no_dupes?([true, true, true])
        end.to_not raise_error

        it "should return an new array containing the elements that were not repeated in the array" do
          expect(no_dupes?([1, 1, 2, 1, 3, 2, 4])).to eq([3, 4])
          expect(no_dupes?(%w(x x y z z))).to eq(['y'])
          expect(no_dupes?([true, true, true])).to eq([])
        end
      end
    end

    describe "no_consecutive_repeats?" do
      it "should accept an array of any type as an argument" do
        expect do
          no_consecutive_repeats?(%w(cat dog mouse dog))
          no_consecutive_repeats?([10, 42, 3, 3, 10, 3])
        end.to_not raise_error
      end

      context "when an element never appears consecutively in the array" do
        it "should return true" do
          expect(no_consecutive_repeats?(%w(cat dog mouse dog))).to be_truthy
          expect(no_consecutive_repeats?([10, 42, 3, 7, 10, 3])).to be_truthy
          expect(no_consecutive_repeats?(['x'])).to be_truthy
        end
      end

      context "when there exists at least one element that appears consecutively in the given array" do
        it "should return false" do
          expect(no_consecutive_repeats?(%w(cat dog dog mouse))).to be_falsey
          expect(no_consecutive_repeats?([10, 42, 3, 3, 10, 3])).to be_falsey
        end
      end
    end

    describe "char_indices" do
      it "should accept a string as an argument" do
        expect { char_indices('mississippi') }.to_not raise_error
      end

      it "should return a hash of list of indicies associated with each char in the string" do
        expect(char_indices('mississippi')).to eq({ "m" => [0], "i" => [1, 4, 7, 10], "s" => [2, 3, 5, 6], "p" => [8, 9] })
        expect(char_indices('classroom')).to eq({ "c" => [0], "l" => [1], "a" => [2], "s" => [3, 4], "r" => [5], "o" => [6, 7], "m" => [8] })
      end

    end

    describe "longest_streak" do
      it "should accept a string as an argument" do
        expect { longest_streak('a') }.to_not raise_error
      end

      it "should return the longest streak of consecutive characters in the string" do
        expect(longest_streak('a')).to eq('a')
        expect(longest_streak('accccbbb')).to eq('cccc')
        expect(longest_streak('aaaxyyyyyzz')).to eq('yyyyy')
      end

      it "should return the last occurrence if tie" do
        expect(longest_streak('aaabbb')).to eq('bbb')
        expect(longest_streak('abc')).to eq('c')
      end

    end

    describe "bi_prime?" do
      it "should accept a number as an argument" do
        expect { bi_prime?(14) }.to_not raise_error
      end

      context "when the number is a product of two prime numbers" do
        it "should return true" do
          expect(bi_prime?(14)).to be_truthy
          expect(bi_prime?(22)).to be_truthy
          expect(bi_prime?(25)).to be_truthy
          expect(bi_prime?(94)).to be_truthy
        end
      end

      context "when the number cannot be obtained by multiplying two prime numbers" do
        it "should return false" do
          expect(bi_prime?(24)).to be_falsey
          expect(bi_prime?(64)).to be_falsey
        end
      end
    end

    describe "vigenere_cipher" do
      it "should accept a string and an array of integer keys as arguments" do
        expect { vigenere_cipher("toerrishuman", [1]) }.to_not raise_error
      end

      it "should return the encrypted string base on the given key" do
        expect(vigenere_cipher("toerrishuman", [1])).to eq("upfssjtivnbo")
        expect(vigenere_cipher("toerrishuman", [1, 2])).to eq("uqftsktjvobp")
        expect(vigenere_cipher("toerrishuman", [1, 2, 3])).to eq("uqhstltjxncq")
        expect(vigenere_cipher("zebra", [3, 0])).to eq("ceerd")
        expect(vigenere_cipher("yawn", [5, 1])).to eq("dbbo")
      end
    end

    describe "vowel_rotate" do
      it "should accept a string as an argument" do
        expect { vowel_rotate('computer') }.to_not raise_error
      end

      it "should returns the string where every vowel is replaced with the vowel the appears before it sequentially in the original string" do
        expect(vowel_rotate('computer')).to eq("cempotur")
        expect(vowel_rotate('oranges')).to eq("erongas")
        expect(vowel_rotate('headphones')).to eq("heedphanos")
        expect(vowel_rotate('bootcamp')).to eq("baotcomp")
        expect(vowel_rotate('awesome')).to eq("ewasemo")
      end
    end
  end

  describe "Proc Problems" do
    describe "String#select" do
      it "should accept a optional block as an argument" do
        expect { "app academy".select { |ch| !"aeiou".include?(ch) } }.to_not raise_error
        expect { "app academy".select }.to_not raise_error
      end

      it "should return a string where each character evaluated true in block is retained" do
        expect("app academy".select { |ch| !"aeiou".include?(ch) }).to eq("pp cdmy")
        expect("HELLOworld".select { |ch| ch == ch.upcase }).to eq("HELLO")
        expect("HELLOworld".select).to eq("")
      end

    end

    describe "String#map!" do
      it "should accept a block as an argument" do
        expect { "hello".map!(&:upcase) }.to_not raise_error
      end

      it "should mutate the original string" do
        word = "hello"
        word.map!(&:upcase)
        expect(word).to eq("HELLO")
      end

      it "should accept a block that accepts a char" do
        word = "Lovelace"
        word.map! do |ch|
          if ch == 'e'
            '3'
          elsif ch == 'a'
            '4'
          else
            ch
          end
        end
        expect(word).to eq("Lov3l4c3")
      end

      it "should accept a block that accepts a char and an index" do
        word = "Dijkstra"
        word.map! do |ch, i|
          if i.even?
            ch.upcase
          else
            ch.downcase
          end
        end
        expect(word).to eq("DiJkStRa")
      end
    end
  end

  describe "Recursion Problems" do
    describe "multiply" do
      it "should takes in two numbers and returns their product" do
        expect(multiply(3, 5)).to eq(15)
        expect(multiply(5, 3)).to eq(15)
        expect(multiply(2, 4)).to eq(8)
        expect(multiply(0, 10)).to eq(0)
        expect(multiply(-3, -6)).to eq(18)
        expect(multiply(3, -6)).to eq(-18)
        expect(multiply(-3, 6)).to eq(-18)
      end
    end

    describe "lucas_sequence" do
      it "should take a number `length` as an argument" do
        expect { lucas_sequence(0) }.to_not raise_error
      end

      it "should return a lucas sequence" do
        expect(lucas_sequence(0)).to eq([])
        expect(lucas_sequence(1)).to eq([2])
        expect(lucas_sequence(2)).to eq([2, 1])
        expect(lucas_sequence(3)).to eq([2, 1, 3])
        expect(lucas_sequence(6)).to eq([2, 1, 3, 4, 7, 11])
        expect(lucas_sequence(8)).to eq([2, 1, 3, 4, 7, 11, 18, 29])
      end

    end

    describe "prime_factorization" do
      it "should accept a number as an argument" do
        expect { prime_factorization(12) }.to_not raise_error
      end

      it "should return an array of prime factors of the given number" do
        expect(prime_factorization(12)).to eq([2, 2, 3])
        expect(prime_factorization(24)).to eq([2, 2, 2, 3])
        expect(prime_factorization(25)).to eq([5, 5])
        expect(prime_factorization(60)).to eq([2, 2, 3, 5])
        expect(prime_factorization(7)).to eq([7])
        expect(prime_factorization(11)).to eq([11])
        expect(prime_factorization(2017)).to eq([2017])
      end
    end
  end

end