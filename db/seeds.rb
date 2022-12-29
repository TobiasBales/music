# typed: strict
# frozen_string_literal: true

class Seeds
  extend T::Sig
  sig { params(name: String, tab: String).void }
  def exercise(name, tab)
    exercise = Exercise.find_by(name: name)

    return if exercise.present?

    Exercise.new(name: name, tab: tab).save!
  end
end

seeds = Seeds.new
seeds.exercise("1 String Ascending", <<~TAB)
  \\title "1 String Ascending"
  \\tempo BPM
  \\instrument 29
  .
  \\ro \\rc 8 :16 5.1 6.1 7.1 8.1 9.1 r.8{d} r.4 r.4 | \\rc 5
TAB
seeds.exercise("1 String Descending", <<~TAB)
  \\title "1 String Descending"
  \\tempo BPM
  \\instrument 29
  .
  \\ro \\rc 8 :16 9.1 8.1 7.1 6.1 5.1 r.8{d} r.4 r.4 | \\rc 5
TAB
