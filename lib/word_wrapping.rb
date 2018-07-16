# frozen_string_literal: true

require 'word_wrapping/version'

module WordWrapping
  class Word
    def self.wrap(string, max_col_length)
      string.length <= max_col_length ? string : column_break(string, max_col_length)
    end

    private_class_method

    def self.column_break(string, max_col_length)
      column_break = string[0...max_col_length].rindex(' ') || max_col_length
      string[0...column_break].strip + "\n" \
      + wrap(string[column_break..-1].strip, max_col_length)
    end
  end
end
