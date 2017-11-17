module AttractionHelper
  def attraction_display(attraction)
    if current_user.admin == true
      "Show #{attraction.name}"
    else
      "Go on #{attraction.name}"
    end
  end
end
