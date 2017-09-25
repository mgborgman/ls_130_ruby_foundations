class TextAnalyzer
  def process
    file = File.open("sample_text.txt")
    yield(file.read)
    file.close
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |file| paragraphs = file.split("\n\r").count; puts "#{paragraphs} paragraphs"  }
# analyzer.process { puts # your implementation }
# analyzer.process { puts # your implementation }