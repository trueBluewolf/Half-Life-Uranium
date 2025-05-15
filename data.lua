--#region Uranium-235

-- Sets up spoil ticks (Ticks = 1/60 of a second)
data.raw.item["uranium-235"].spoil_ticks = 4 * 60^1 -- default value (4 Hours(4*60^3))

-- Adds uranium-235 as a spoilable item through runtime-spoilage-library
rsl.register_spoilable_item(data.raw.item["uranium-235"])

-- Always creates fresh Uranium-235 every craft
data.raw.recipe["kovarex-enrichment-process"].result_is_always_fresh = true

--#endregion