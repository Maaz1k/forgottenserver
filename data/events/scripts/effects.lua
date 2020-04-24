local position = {x=1000,y=1000, z=7, stackpos=1}
local text = {"Tiaptra", "Tiaptra", "Tiaptra"}

function onThink(interval, lastExecution)
        return doSendAnimatedText(position,text[math.random(1,#text)], math.random(10,66 ) )
end