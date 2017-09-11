class TextAnalyzer
  def process
    File.open("sample_text.txt", "r") do |file|
      yield(file.read)
    end
  end
end

analyzer = TextAnalyzer.new
analyzer.process do |file|
  paragraph_count = file.split(/\r\n+\r\n/).count
  puts "#{paragraph_count} paragraphs"
end
analyzer.process { |text| puts "#{text.split("\n").count} lines" }
analyzer.process { |text| puts "#{text.split(' ').count} words" }
