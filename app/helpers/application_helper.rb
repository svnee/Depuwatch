module ApplicationHelper
  
  def vote_to_color_simple(v)
    if v == 1 then
      color = "339900"
    elsif v == -1 then
      color = "990000"
    else
      color = "cccccc"
    end
  end
  
  def vote_to_color(v)
    if v == 1 then
      color = "#339900"
    elsif v == -1 then
      color = "#990000"
    else
      color = "#cccccc"
    end
  end
end
