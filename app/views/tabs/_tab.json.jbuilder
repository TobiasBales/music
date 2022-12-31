# frozen_string_literal: true

json.extract! tab, :id, :artist, :album, :song, :created_at, :updated_at
json.url tab_url(tab, format: :json)
