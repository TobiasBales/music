# typed: strict
# frozen_string_literal: true

class Seeds
  extend T::Sig
  sig { params(name: String).returns(Author) }
  def author(name)
    author = Author.find_by(name: name)

    return author if author.present?

    author = Author.new(name: name)
    author.save!
    author
  end

  sig { params(name: String).returns(Instrument) }
  def instrument(name)
    instrument = Instrument.find_by(name: name)

    return instrument if instrument.present?

    instrument = Instrument.new(name: name)
    instrument.save!
    instrument
  end

  sig { params(author: Author, instrument: Instrument, name: String).returns(Course) }
  def course(author, instrument, name)
    course = Course.find_by(name: name)

    return course if course.present?

    course = Course.new(author: author, instrument: instrument, name: name)
    course.save!
    course
  end

  sig { params(course: Course, name: String, order: Integer, tab: String, bpm: Integer).void }
  def exercise(course, name, order, tab, bpm)
    exercise = Exercise.find_by(name: name)

    return if exercise.present?

    exercise = Exercise.new(course: course, name: name, order: order, bpm: bpm)
    exercise.tab.attach(io: File.open("db/seeds/#{tab}"), filename: tab)
    exercise.save!
    exercise
  end
end

seeds = Seeds.new

guitar = seeds.instrument("Guitar")
seeds.instrument("Bass")
seeds.instrument("Drums")

tobias = seeds.author("Tobias Bales")

warmups = seeds.course(tobias, guitar, "Warmups")

seeds.exercise(warmups, "Chromatic", 1, "chromatic.gp", 80)
