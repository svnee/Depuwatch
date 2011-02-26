module SessionsHelper
  def duration(s, e)
    h = ((e - s) / 3600).floor
    m = (((e - s) % 3600) / 60).floor
    
    "#{"%02d" % h}:#{"%02d" % m}"
  end
end
