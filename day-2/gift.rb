class Gift
  attr_reader :total_paper, :total_ribbon
  def initialize filename
    @input_file = filename
    @total_paper = 0
    @total_ribbon = 0
  end
  
  def run
    File.open(@input_file, "r") do |f|
      f.each_line do |line|
        l,w,h = parse_line(line)
        @total_paper += compute_present_paper l, w, h
        @total_ribbon += compute_ribbon l, w, h
      end
    end
  end
  
  def parse_line(line)
    line.strip.split("x").map(&:to_i).sort
  end
  
  def compute_present_paper(l,w,h)
    total_surface_area = 2 * l * w + 2 * w * h + 2 * h * l
    total_slack = l*w
    total_surface_area + total_slack
  end
  
  def compute_ribbon(l, w, h)
    ribbon_length = 2*l + 2*w
    bow_length = l * w * h
    ribbon_length + bow_length
  end
end


#gift = Gift.new 'input'
#gift.run
#puts "#{gift.total_paper}, #{gift.total_ribbon}"