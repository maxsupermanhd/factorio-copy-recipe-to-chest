local containers = {}
for i, container in pairs(data.raw["logistic-container"]) do
  containers[i] = container.name
end
for _, assembler in pairs(data.raw["assembling-machine"]) do
  local entities = assembler.additional_pastable_entities
  if not entities then
    assembler.additional_pastable_entities = {}
    entities = assembler.additional_pastable_entities
  end
  for _, name in pairs(containers) do
    table.insert(entities, name)
  end
end
