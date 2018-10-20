json.items do
    json.array! @items, :id, :name, :status
end