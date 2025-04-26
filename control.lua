
local function rsl_RemoteCall()
    remote.call("rsl_registry", "register_rsl_definition", "uranium-235", {
        mode = { random = true, conditional = false, weighted = false},
        condition = true,
        possible_results = {
            [true] = {{ name = "iron-plate" }},
            [false] = {{ name = "copper-plate" }}
        }
    })
end

--#region on_init and on_change
script.on_init(function()
    rsl_RemoteCall()
end)

script.on_configuration_changed(function()
    rsl_RemoteCall()
end)
--#endregion