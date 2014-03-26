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
        from_around(filename, options[:line].to_i, options[:radius].to_i)
      else
        RailsEmbedEditor::FileManager.new(filename, options[:first_line].to_i, options[:last_line].to_i)
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
        lines = f.readlines[@first_line-1...@last_line]
      end
      lines
    end

    def read_text
      read_lines.join()
    end

    def save_text(text)
      save_lines(text.split(/\r?\n/).map { |x| "#{x}\n" })
    end

    def save_lines(lines)
      all_lines = []
      File.open(@filename, 'r') do |f|
        all_lines = f.readlines
      end
      all_lines = all_lines[0...@first_line-1] + lines + all_lines[@last_line..-1]
      File.open(@filename, 'w') do |f|
        all_lines.each do |line|
          f.write(line)
        end
      end
    end
  end
end