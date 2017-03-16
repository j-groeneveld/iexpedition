require "csv"
Dir["./db/seeds/data/*regions-#{TYPE}.csv"].each do |fn|
  new_file(fn)
  CSV.foreach(fn, :headers => true) do |row|
    region_obj = clean_data row.to_hash.symbolize_keys!
    highlights = extract_named_resources(region_obj, :highlight_names, "Highlight")
    destination = extract_resource("Destination", region_obj, "destination_name")
    singleton = create_singleton("Region", region_obj)

    associate_singleton_with_collection(destination.regions, singleton) if destination.try(:valid?)
    highlights.each do |highlight|
      associate_singleton_with_collection(singleton.highlights, highlight) unless highlight.nil?
    end
  end
end