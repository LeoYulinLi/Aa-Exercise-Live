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
      it "should take one string as argument" do
        expect do
          sentence_swap(
            'anything you can do I can do',
            'anything' => 'nothing',
            'do' => 'drink',
            'can' => 'shall'
          )
        end.to_not raise_error
      end
    end

    describe "hash_mapped" do
      it "should take one string as argument" do
        expect { duos("bootcamp") }.to_not raise_error
      end
    end

    describe "counted_characters" do
      it "should take one string as argument" do
        expect { duos("bootcamp") }.to_not raise_error
      end
    end

    describe "triplet_true?" do
      it "should take one string as argument" do
        expect { duos("bootcamp") }.to_not raise_error
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