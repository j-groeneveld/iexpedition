require "csv"
Dir["./db/seeds/data/*region-highlights-#{TYPE}.csv"].each do |fn|
  CSV.foreach(fn, :headers => true) do |row|
    highlight_obj = clean_data row.to_hash.symbolize_keys!
    destination = extract_resource("Region", highlight_obj, "region_name")
    singleton = create_singleton("Highlight", highlight_obj)
    assocation_obj = { highlight_id: singleton.id }

    associate_singleton_with_groupings_collection(region.highlight_groupings, assocation_obj)
  end
end