# frozen_string_literal: true

class CargoTrain < Train
  def add_vagon(vagon)
    super(vagon) if vagon.class == CargoCarriage
  end
end
