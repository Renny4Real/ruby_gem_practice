# frozen_string_literal: true

RSpec.describe WordWrapping do
  it "has a version number" do
    expect(WordWrapping::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(false).to eq(true)
  end
  
  context 'Word wrap function' do
    describe 'when called with nothing' do
      it 'returns an empty string when called with nothing' do
        expect(wrap('', 1)).to eq('')
      end
    end

    describe 'when called with a word shorter than the max column length' do
      it 'returns the complete word' do
        expect(wrap('abcd', 5)).to eq('abcd')
      end
    end

    describe 'when max column length falls between two words on a space' do
      it 'splits the two words on the space' do
        expect(wrap('abcd efgh', 5)).to eq("abcd\nefgh")
      end
    end

    describe 'when max column length falls on the space between multiple words' do
      it 'splits these words on the space' do
        expect(wrap('abcd efgh ijkl', 5)).to eq("abcd\nefgh\nijkl")
      end
    end

    describe 'when many words are on a line within the max column length' do
      it 'keeps as many words on the line as possible' do
        expect(wrap('abcd efgh ijkl mnop', 10)).to eq("abcd efgh\nijkl mnop")
      end
    end

    describe 'when the max column length falls within a word' do
      it 'splits the word at the max column length' do
        expect(wrap('abcdefgh', 6)).to eq("abcdef\ngh")
      end
    end

    describe 'when max column length is after a space and the remaining characters also fall within the max column length' do
      it 'splits early on the word at that space and strips the whitespace before adding the new line' do
        expect(wrap('abcd efgh', 7)).to eq("abcd\nefgh")
      end
    end

    describe 'when max column length is immediatley before a space and remaining characters also fall within the max column length' do
      it 'splits the word at that space and strips the whitespace before adding the new line' do
        expect(wrap('abcd efgh', 4)).to eq("abcd\nefgh")
      end
    end

    describe 'when max column length falls on a really long word' do
      it 'splits the long word at every instance that the max column point is reached' do
        expect(wrap('abcdefghijklmnopqrstuvwxyz', 2)).to eq("ab\ncd\nef\ngh\nij\nkl\nmn\nop\nqr\nst\nuv\nwx\nyz")
      end
    end
  end

end
