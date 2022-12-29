# typed: strict
# frozen_string_literal: true

class Seeds
  extend T::Sig
  sig { params(name: String).returns(Instrument) }
  def instrument(name)
    instrument = Instrument.find_by(name: name)

    return instrument if instrument.present?

    instrument = Instrument.new(name: name)
    instrument.save!
    instrument
  end

  sig { params(instrument: Instrument, name: String).returns(Course) }
  def course(instrument, name)
    course = Course.find_by(name: name)

    return course if course.present?

    course = Course.new(instrument: instrument, name: name)
    course.save!
    course
  end

  sig { params(course: Course, name: String, tab: String).void }
  def exercise(course, name, tab)
    exercise = Exercise.find_by(name: name)

    return if exercise.present?

    Exercise.new(course: course, name: name, tab: tab).save!
  end
end

seeds = Seeds.new
guitar = seeds.instrument("Guitar")
seeds.instrument("Bass")
seeds.instrument("Drums")

speed_builder = seeds.course(guitar, "Speed builder")

seeds.exercise(speed_builder, "1 String Ascending", <<~TAB)
  \\title "1 String Ascending"
  \\tempo BPM
  \\instrument 29
  .
  \\ro \\rc 8 :16 5.1 6.1 7.1 8.1 9.1 r.8{d} r.4 r.4 | \\rc 5
TAB
seeds.exercise(speed_builder, "1 String Descending", <<~TAB)
  \\title "1 String Descending"
  \\tempo BPM
  \\instrument 29
  .
  \\ro \\rc 8 :16 9.1 8.1 7.1 6.1 5.1 r.8{d} r.4 r.4 | \\rc 5
TAB
