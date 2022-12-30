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

roy_viz = seeds.author("Roy Viz")

speed_builder = seeds.course(roy_viz, guitar, "Speed builder")

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
seeds.exercise(speed_builder, "1 String Ascending Descending", <<~TAB)
  \\title "1 String Ascending Descending"
  \\tempo BPM
  \\instrument 29
  .
  \\ro \\rc 8 :16 5.1 6.1 7.1 8.1 9.1 8.1 7.1 6.1 5.1 r.8{d} r.4 | \\rc 5
TAB
seeds.exercise(speed_builder, "2 String 5 Note Ascending", <<~TAB)
  \\title "2 String 5 Note Ascending"
  \\tempo BPM
  \\instrument 29
  .
  \\ro \\rc 8 :16 6.2 7.2 8.2 9.2 5.1 r.8{d} r.4 r.4 | \\rc 5
TAB
seeds.exercise(speed_builder, "2 String Ascending", <<~TAB)
  \\title "2 String Ascending"
  \\tempo BPM
  \\instrument 29
  .
  \\ro \\rc 8 :16 6.2 7.2 8.2 9.2 5.1 6.1 7.1 8.1 9.1 r.8{d} r.4 | \\rc 5
TAB
seeds.exercise(speed_builder, "2 String Ascending Descending", <<~TAB)
  \\title "2 String Ascending Descending"
  \\tempo BPM
  \\instrument 29
  .
  \\ro :16 6.2 7.2 8.2 9.2 5.1 6.1 7.1 8.1 9.1 8.1 7.1 6.1 5.1 9.2 8.2 7.2 | \\rc 8 r.1 | \\rc 5
TAB
