--#region Items

--#region item Uranium-235

-- Sets up spoil ticks (Ticks = 1/60 of a second)
data.raw.item["uranium-235"].spoil_ticks = 4 * 60^1 -- default value (4 Hours(4*60^3))

-- Makes Uranium-235 spoil to Uranium-238
data.raw.item["uranium-235"].spoil_result = "decaying-uranium"

--#endregion

--#region item Decaying Uranium
local decayingUranium = table.deepcopy(data.raw["item"]["uranium-ore"]) -- copies the item uranium-ore

decayingUranium.name = "decaying-uranium"
decayingUranium.icons = {
    {
        icon = decayingUranium.icon,
        icon_size = decayingUranium.icon_size,
        tint = { r = .5, g = .5, b = .8, a = 1 }
    }
}
decayingUranium.pictures = {
    { size = 64, filename = "__base__/graphics/icons/uranium-ore.png",   scale = 0.5, tint = { r = .5, g = .5, b = .8, a = 1 } },
    { size = 64, filename = "__base__/graphics/icons/uranium-ore-1.png", scale = 0.5, tint = { r = .5, g = .5, b = .8, a = 1 } },
    { size = 64, filename = "__base__/graphics/icons/uranium-ore-2.png", scale = 0.5, tint = { r = .5, g = .5, b = .8, a = 1 } },
    { size = 64, filename = "__base__/graphics/icons/uranium-ore-3.png", scale = 0.5, tint = { r = .5, g = .5, b = .8, a = 1 } }
}
decayingUranium.subgroup = "uranium-processing"

decayingUranium.stack_size = 20
decayingUranium.spoil_ticks = 6 * 60^2 -- default value (6 Mins(6*60^2))
decayingUranium.spoil_result = "nothing"

data:extend{decayingUranium}
--#endregion

--#region item Nothing
local nothing = table.deepcopy(data.raw["item"]["iron-plate"])

nothing.name = "nothing"
nothing.icons = {
    {
        icon = nothing.icon,
        icon_size = nothing.icon_size,
        tint = {r = 0, g = 0, b = 0, a = 0}
    }
}
nothing.subgroup = "uranium-processing"
nothing.order = "zzz"

nothing.spoil_ticks = 1 -- 1 tick (1/60 of a second)

data:extend{nothing}
--#endregion

--#endregion

--#region Recipes

--#region kovarex enrichment process

-- Always creates fresh Uranium-235 every craft
data.raw.recipe["kovarex-enrichment-process"].result_is_always_fresh = true

--#endregion

--#endregion