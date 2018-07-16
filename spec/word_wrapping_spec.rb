RSpec.describe WordWrapping do
  it "has a version number" do
    expect(WordWrapping::VERSION).not_to be nil
  end

  describe WordWrapping::Word do
    it 'returns an empty string when called with nothing' do
      expect(WordWrapping::Word.wrap('', 1)).to eq('')
    end
  end

end
