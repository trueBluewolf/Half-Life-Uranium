data:extend({
    {
        type = "int-setting",
        name = "decay-timer-setting",
        setting_type = "runtime-global",
        default_value = 4 * 60 * 60 * 60, -- In ticks, (60 ticks is 1 second), default is 4 hours
        minimum_value = 1,
        maximum_value = 10 * 60 * 60 * 60
    }
})
