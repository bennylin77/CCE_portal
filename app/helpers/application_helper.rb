module ApplicationHelper
  def domain
    'http://140.113.151.76:10103'
  end
  def showBlank(hash={})
    if hash[:data].blank?
      '--'
    else  
      simple_format(hash[:data], {}, wrapper_tag: "span")
    end
  end  
  
  def boxBgColor
    case rand(6)
    when 0
      '#198EB9' 
    when 1    
      'rgb(241, 140, 54)'  
    when 2
      'rgb(220, 67, 133)'      
    when 3
      'rgb(255, 169, 40)'
    when 4
      'rgb(210, 129, 179)'     
    when 5
      'rgb(114, 193, 53)'        
    end  
  end
end
