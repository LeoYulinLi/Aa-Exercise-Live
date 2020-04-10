require "meddling_medley"

describe "Meddling Medley" do
  describe "Phase 1: Modest problems" do

    describe "duo" do
      it "should take one string as argument" do
        expect { duos("bootcamp") }.to_not raise_error
      end

      it "should count the number of times the same character appears consecutively in the given string" do
        expect(duos('bootcamp')).to eq(1)
        expect(duos('wxxyzz')).to eq(2)
        expect(duos('hoooraay')).to eq(3)
        expect(duos('dinosaurs')).to eq(0)
        expect(duos('e')).to eq(0)
      end

    end

    describe "sentence_swap" do

      it "should accept a sentence and a hash as arguments" do
        expect do
          sentence_swap(
            'anything you can do I can do',
            'anything' => 'nothing', 'do' => 'drink', 'can' => 'shall'
          )
        end.to_not raise_error
      end

      it "return a new sentence where every word is replaced with it's corresponding value in the hash" do
        expect(sentence_swap(
                 'anything you can do I can do',
                 'anything' => 'nothing', 'do' => 'drink', 'can' => 'shall'
               )).to eq('nothing you shall drink I shall drink')

        expect(sentence_swap('what a sad ad',
                             'cat' => 'dog', 'sad' => 'happy', 'what' => 'make'
               )).to eq('make a happy ad')

        expect(sentence_swap('keep coding okay',
                             'coding' => 'running', 'kay' => 'pen'
               )).to eq('keep running okay')
      end

    end

    describe "hash_mapped" do

      double = proc { |n| n * 2 }
      first = proc { |a| a[0] }

      it "should accept a sentence and a hash as arguments" do
        expect { hash_mapped({ 'a' => 4, 'x' => 7, 'c' => -3 }, double) { |k| k.upcase + '!!' } }.to_not raise_error
      end

      it "should return a new hash where each key is the result of the original key when given to the block" do
        expect(hash_mapped({ 'a' => 4, 'x' => 7, 'c' => -3 }, double) { |k| k.upcase + '!!' })
          .to eq({ "A!!" => 8, "X!!" => 14, "C!!" => -6 })
        expect(hash_mapped({ -5 => ['q', 'r', 's'], 6 => ['w', 'x'] }, first) { |n| n * n })
          .to eq({ 25 => "q", 36 => "w" })
      end

    end

    describe "counted_characters" do
      it "should take one string as argument" do
        expect { counted_characters("that's alright folks") }.to_not raise_error
      end

      it "should return an array containing the characters of the string that appeared more than twice" do
        expect(counted_characters("that's alright folks")).to eq(["t"])
        expect(counted_characters("mississippi")).to eq(["i", "s"])
        expect(counted_characters("hot potato soup please")).to eq(["o", "t", " ", "p"])
        expect(counted_characters("runtime")).to eq([])
      end

    end

    describe "triplet_true?" do
      it "should take one string as argument" do
        expect { triplet_true?("bootcamp") }.to_not raise_error
      end

      it "should return true when the string contains three of the same character consecutively" do
        expect(triplet_true('caaabb')).to eq(true)
        expect(triplet_true('terrrrrible')).to eq(true)
        expect(triplet_true('runninggg')).to eq(true)
      end

      it "should return false when the string doesn't contain three of the same character consecutively" do
        expect(triplet_true('bootcamp')).to eq(false)
        expect(triplet_true('e')).to eq(false)
      end

    end

    describe "energetic_encoding" do
      it "should take one string as argument" do
        expect { duos("bootcamp") }.to_not raise_error
      end
    end

    describe "uncompress" do
      it "should take one string as argument" do
        expect { duos("bootcamp") }.to_not raise_error
      end
    end

  end

  describe "Phase 2: More difficult, maybe?" do

    describe "conjunct_select" do
      it "should take one string as argument" do
        expect { duos("bootcamp") }.to_not raise_error
      end
    end

    describe "convert_pig_latin" do
      it "should take one string as argument" do
        expect { duos("bootcamp") }.to_not raise_error
      end
    end

    describe "reverberate" do
      it "should take one string as argument" do
        expect { duos("bootcamp") }.to_not raise_error
      end
    end

    describe "disjunct_select" do
      it "should take one string as argument" do
        expect { duos("bootcamp") }.to_not raise_error
      end
    end

    describe "alternating_vowel" do
      it "should take one string as argument" do
        expect { duos("bootcamp") }.to_not raise_error
      end
    end

    describe "silly_talk" do
      it "should take one string as argument" do
        expect { duos("bootcamp") }.to_not raise_error
      end
    end

    describe "compress" do
      it "should take one string as argument" do
        expect { duos("bootcamp") }.to_not raise_error
      end
    end

  end

end