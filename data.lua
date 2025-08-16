--#region item Uranium-235

-- Sets up spoil ticks (Ticks = 1/60 of a second)
data.raw.item["uranium-235"].spoil_ticks = settings.startup["uranium-235-decay-timer-setting"].value * 60 -- multiply the value by 60 ticks

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
        tint = { r = 1, g = .65, b = .3, a = 1 }
    }
}
decayingUranium.pictures = {
    { size = 64, filename = "__base__/graphics/icons/uranium-ore.png",   scale = 0.5, tint = { r = 1, g = .65, b = .3, a = 1 } },
    { size = 64, filename = "__base__/graphics/icons/uranium-ore-1.png", scale = 0.5, tint = { r = 1, g = .65, b = .3, a = 1 } },
    { size = 64, filename = "__base__/graphics/icons/uranium-ore-2.png", scale = 0.5, tint = { r = 1, g = .65, b = .3, a = 1 } },
    { size = 64, filename = "__base__/graphics/icons/uranium-ore-3.png", scale = 0.5, tint = { r = 1, g = .65, b = .3, a = 1 } }
}
decayingUranium.subgroup = "uranium-processing"

decayingUranium.stack_size = 100
decayingUranium.spoil_ticks = settings.startup["uranium-decaying-timer-setting"].value * 60
--decayingUranium.spoil_result = "nothing"

data:extend{decayingUranium}
--#endregion

--#region Recipes

--#region Kovarex Enrichment Process
-- Always creates fresh Uranium-235 every craft
data.raw.recipe["kovarex-enrichment-process"].result_is_always_fresh = true
--#endregion

--#region Decaying Uranium Enrichment Process
local decayingUraniumEnrichmentProcess = {
    name = "decaying-uranium-enrichment-process",
    type = "recipe",
    category = "centrifuging",
    enabled = false,
    icon = "__base__/graphics/icons/uranium-processing.png",
    subgroup = "uranium-processing",
    order = "a[uranium-processing]-b[uranium-products]",

    ingredients = {
        {type = "item", name = "decaying-uranium", amount = 10 }
    },

    energy_required = 60,

    results = {
        {type = "item", name = "uranium-235", amount = 1, probability = .10},
        {type = "item", name = "uranium-238", amount = 1, probability = .85}
    },

    result_is_always_fresh = true
}

decayingUraniumEnrichmentProcess.icons = {
    {
        icon = decayingUraniumEnrichmentProcess.icon,
        tint = { r = 1, g = .65, b = .3, a = 1 }
    }
}

data:extend{decayingUraniumEnrichmentProcess}
--#endregion

--#endregion

--#region Tech
table.insert(data.raw.technology["uranium-processing"].effects, {
    type = "unlock-recipe",
    recipe = "decaying-uranium-enrichment-process"
})

--#endregion