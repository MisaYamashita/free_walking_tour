module ToursHelper
  def organizer?
   @tour.user_id == current_user.id
  end
 
end
