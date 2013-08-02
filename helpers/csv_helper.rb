require 'csv'

class CsvHelper
  def self.csv_from(talks)

    csv_data = CSV.generate do |csv|
      csv << [
        "Title",
        "Summary",
        "Category",
        "Duration",
        "Presenter",
        "Email",
        "Languages"
      ]

      talks.each do |talk|
        csv << [
          talk.title,
          talk.summary,
          talk.category,
          talk.duration,
          talk.presenter.name,
          talk.presenter.email,
          talk.languages.join(", ")
        ]
      end
    end

    csv_data

  end
end
