json.myrese "v1.0"
json.extract! @publication.infohash, :htype
json.extract! @publication, :pubtype, :publication_profiles, :infohash, :title, :ctitle, :year, :doi, :created_at, :updated_at

