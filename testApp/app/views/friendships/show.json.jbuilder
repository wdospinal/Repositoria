json.array!(@friends) do |f|
  json.extract! f, :name, :nickname
end