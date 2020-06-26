# frozen_string_literal: true

class PassengerTrain < Train
  def add_vagon(vagon)
    super(vagon) if vagon.class == PassengerCarriage
  end
end
