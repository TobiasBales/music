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

    Exercise.new(course: course, name: name, order: order, tab: tab, bpm: bpm).save!
  end
end

seeds = Seeds.new

guitar = seeds.instrument("Guitar")
seeds.instrument("Bass")
seeds.instrument("Drums")

tobias = seeds.author("Tobias Bales")

warmups = seeds.course(tobias, guitar, "Warmups")

seeds.exercise(warmups, "Chromatic", 1, <<~TAB, 80)
  \\title "Chromatic"
  \\tempo BPM
  \\instrument 29
  .
  \\ro :8 1.6 2.6 3.6 4.6 1.5 2.5 3.5 4.5 | 1.4 2.4 3.4 4.4 1.3 2.3 3.3 4.3 | \\rc 4 1.2 2.2 3.2 4.2 1.1 2.1 3.1 4.1
TAB
