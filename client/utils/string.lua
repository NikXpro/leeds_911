LEEDS.String = {};
local String = LEEDS.String;


function String.IsDate(str)  
	local d, m, y = str:match("(%d+)/(%d+)/(%d+)")
	
	d, m, y = tonumber(d) or 0, tonumber(m) or 0, tonumber(y) or 0
	if y < 1920 or y > 2030 then
	  return false
	else
	  if d <= 0 or d > 31 or m <= 0 or m > 12 or y <= 0 then
		return false
	  elseif m == 4 or m == 6 or m == 9 or m == 11 then 
		return d <= 30
	  elseif m == 2 then
		if y%400 == 0 or (y%100 ~= 0 and y%4 == 0) then
		  return d <= 29
		else
		  return d <= 28
		end
	  else 
		return d <= 31
	  end
	end
end
	

function String.Split(inputstr, sep)
	if sep == nil then
		sep = "%s"
	end
	local t={} ; i=1
	for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
		t[i] = str
		i = i + 1
	end

	return t
end