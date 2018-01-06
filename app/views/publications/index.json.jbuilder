json.array!(@publications) do |publication|
  json.myrese "v1.0"
  json.extract! publication, :pubtype, :title, :ctitle, :year, :volume, :number, :issn, :isbn, :publisher, :doi
  json.publication_profiles do
    json.array! (publication.publication_profiles.sort_by{|o| o[:orderv]}) do |pp|
      json.(pp, :author)
    end
  end
  json.url publication_url(publication, format: :json)
end

