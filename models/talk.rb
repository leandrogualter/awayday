class Talk
  include Mongoid::Document
  field :title, type: String
  field :summary, type: String
  field :category, type: String
  field :duration, type: Integer
  field :languages, type: Array

  belongs_to :presenter

  DURATIONS = {:lightning => 15, :talk => 45}

  CATEGORIES = [
    "Technical",
    "Non-Technical"
  ]

  LANGUAGES = [
    "English",
    "Portuguese",
    "Spanish"
  ]

  validates_presence_of :title
  validates_presence_of :summary
  validates_presence_of :category
  validates_presence_of :duration
  validates_presence_of :presenter

  validates_inclusion_of :category, in: CATEGORIES
  validates_inclusion_of :duration, in: DURATIONS.values

  validates_length_of :summary, within: 50..400
  validates_length_of :languages, minimum: 1, message: "Select at least one language"

end
