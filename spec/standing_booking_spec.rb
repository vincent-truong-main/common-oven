RSpec.describe "StandingBooking" do
  context "when Dee skips one Saturday of Priya's standing booking" do
    # Given Priya has a standing booking for the 6-burner every Saturday, 6 to noon
    let(:standing_booking) do
      StandingBooking.new(
        member: "Priya",
        equipment: "6-burner",
        day_of_week: :saturday,
        time_range: "06:00".."12:00"
      )
    end

    # When Dee skips Priya's booking for Saturday Oct 11
    before do
      standing_booking.skip(Date.new(2025, 10, 11))
    end

    # Then on Oct 11, the 6-burner from 6 to noon is open
    it "leaves the 6-burner open on the skipped Saturday" do
      expect(standing_booking.who_has(Date.new(2025, 10, 11))).to be_nil
    end

    # And on Oct 18, the 6-burner from 6 to noon is still Priya's
    it "keeps the 6-burner as Priya's on the following Saturday" do
      expect(standing_booking.who_has(Date.new(2025, 10, 18))).to eq("Priya")
    end
  end
end
