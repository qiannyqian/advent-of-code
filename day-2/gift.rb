class Gift
  def parse_line(line)
    line.strip.split("x").map(&:to_i)
  end
  
  def compute_present_paper(l,w,h)
    2 * l * w + 2 * w * h + 2 * h * l
  end
  
  def compute_slack(l,w,h)
    [l * w, w * h, h * l].min
  end
  
  def compute_ribbon_wrap(l,w,h)
    arr = [l, w, h]
    arr = arr.sort
    arr[0] * 2 + arr[1] * 2
  end
  
  def compute_bow(l,w,h)
    l * w * h
  end
  
  def total_ribbon_length
    total_ribbon = 0
    
    File.open("input", "r") do |f|
      f.each_line do |line|
        l,w,h = parse_line(line)
        ribbon_wrap = compute_ribbon_wrap(l,w,h)
        bow = compute_bow(l,w,h)
        total_ribbon += ribbon_wrap + bow
      end
    end
    
    total_ribbon
  end
  
  def total_wrap_paper
    total_paper = 0

    File.open("input", "r") do |f|
      f.each_line do |line|
        l,w,h = parse_line(line)
        present_paper = compute_present_paper(l,w,h)
        small_face = compute_slack(l,w,h)
        total_paper += present_paper + small_face
      end
    end
    
    total_paper
  end
end