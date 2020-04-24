local position = {x=1048,y=1010, z=7, stackpos=6}
local text = {"Tiaptra", "Tiaptra", "Tiaptra"}

function onThink(interval, lastExecution)
        return doSendAnimatedText(position,text[math.random(1,#text)], math.random(10,66 ) )
end