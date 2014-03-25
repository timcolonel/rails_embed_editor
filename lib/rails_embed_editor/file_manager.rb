module RailsEmbedEditor
  class FileManager
    attr_accessor :first_line, :last_line

    def initialize(filename, first_line = nil, last_line=nil)
      @filename = filename
      @first_line = first_line
      @last_line = last_line
    end

    def self.from_options(filename, options)
      if options[:first_line].nil?
        from_around(filename, options[:line], options[:radius])
      else
        RailsEmbedEditor::FileManager.new(filename, options[:first_line], options[:last_line])
      end
    end

    def self.from_around(filename, line, radius=2)
      first_line = line - radius
      last_line = line + radius
      RailsEmbedEditor::FileManager.new(filename, first_line, last_line)
    end

    def read_lines
      lines = []
      File.open(@filename, 'r') do |f|
        puts 'lines:'
        puts @first_line
        puts @last_line
        lines = f.readlines[@first_line-1...@last_line]
      end
      lines
    end

    def read_text
      read_lines.join()
    end
  end
end