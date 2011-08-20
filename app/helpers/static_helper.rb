module StaticHelper
  def circonscription(bezierk)
    if bezierk == 'all' then
      'all'
    else
      case bezierk 
        when 'N'
          return 'Norden'
        when 'Z'
          return 'Zentrum'
        when 'S'
          return 'Süden'
        when 'O' 
          return "Osten"
      end
    end
  end
  
  def session_display(s)
    "#{s.start.strftime("%Y")}/#{s.end.strftime("%Y")}"
  end
end
