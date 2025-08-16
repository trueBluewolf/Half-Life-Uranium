local uranium_235DecayTimerSetting = 
{
    type = "int-setting",
    name = "uranium-235-decay-timer-setting",
    setting_type = "runtime-global",
    default_value = 4 * 60^2,        -- In Seconds, default is 4 hours, which is 4 * 60 * 60 seconds or 14400 seconds
    minimum_value = 1,                  -- Minimum value is 1 second
    maximum_value = 52596 * 10^9     -- 1,666,667 years in seconds this is supposed to be related with time of half-life on uranium-235 of
    -- 700 million years to factorio 7 min day cycle, so if you want a realstic decay time this would be it for the funny
}

data:extend{uranium_235DecayTimerSetting}

local uraniumDecayingTimerSetting = 
{
    type = "int-setting",
    name = "uranium-decaying-timer-setting",
    setting_type = "runtime-global",
    default_value = 6 * 60,             -- In Seconds, default is 6 minutes, which is 6 * 60 seconds or 360 seconds
    minimum_value = 1,                  -- Minimum value is 1 second
    maximum_value = 100 * 60^2          -- 100 hours in seconds, which is 360000 seconds
}

data:extend{uraniumDecayingTimerSetting}