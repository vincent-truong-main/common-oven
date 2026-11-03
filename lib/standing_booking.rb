class StandingBooking
  def initialize(member:, equipment:, day_of_week:, time_range:)
    @member = member
    @equipement = equipment
    @day_of_week = day_of_week
    @time_range = time_range
    @skipped = []
  end
   
  def skip(date)
    @skipped << date
  end
  
  def who_has(date)
    if @skipped.include?(date)
      nil
    else
     @member
    end
  end
end