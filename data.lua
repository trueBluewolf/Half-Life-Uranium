--#region item Uranium-235

-- Sets up spoil ticks (Ticks = 1/60 of a second)
data.raw.item["uranium-235"].spoil_ticks = 4 * 60^1 -- default value (4 Hours(4*60^3))

-- Makes Uranium-235 spoil to Uranium-238
data.raw.item["uranium-235"].spoil_result = "decaying-uranium"

-- Always creates fresh Uranium-235 every craft
data.raw.recipe["kovarex-enrichment-process"].result_is_always_fresh = true
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
decayingUranium.stack_size = 20
decayingUranium.spoil_ticks = 6 * 60^2 -- default value (6 Mins(6*60^2))

data:extend{decayingUranium}
--#endregion
