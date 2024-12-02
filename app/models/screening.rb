class Screening < ApplicationRecord
  enum :weekday, [:sunday, :monday, :tuesday, :wednesday, :thursday, :friday, :saturday]
  belongs_to :movie
  belongs_to :room
end
