-- Time Script for Fireplace
commandArray = {} 
time = os.date("*t") 

-- Fireplace: Shut off after 10pm once the TV turns off, otherwise turn on after 7am if under 50F
if (otherdevices['Fireplace'] ~= 'Off') and ((time.hour >= 22) or (time.hour < 7)) and (otherdevices['TV'] == 'Off') then
		commandArray['Fireplace']='Off' 
elseif (otherdevices['Fireplace'] == 'Off') and (time.hour < 22) and (time.hour > 6) and (otherdevices_temperature['Online Weather'] < 50) then
		commandArray['Fireplace']='On'
		print('Its cold outside, turning on fireplace..')
end

-- Fireplace: Shutoff if its warmer than 60F outside
if (otherdevices['Fireplace'] ~= 'Off') and (otherdevices_temperature['Online Weather'] > 60) then
		commandArray['Fireplace']='Off' 
		print('Too warm outside for fireplace, shutting off..')
end

return commandArray
