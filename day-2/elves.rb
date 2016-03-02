class Elves

  def parse_line line
    line.split("x").map { |s| s.to_i }
  end

  def calculate_total_order filename
    file = File.new(filename, "r")
    total_count = 0
    while (line = file.gets)
      total_count = total_count + calculate_total(parse_line(line))
    end
    file.close
    return total_count
  end

  def calculate_total_box_area line
    (line[0]*line[1])*2+(line[0]*line[2])*2+(line[1]*line[2])*2
  end

  def calculate_slack line
    tomin = line.sort
    return tomin[0]*tomin[1]
  end

  def calculate_total line
    box_val    = calculate_total_box_area line
    slack_val  = calculate_slack line
    return box_val + slack_val
  end

end