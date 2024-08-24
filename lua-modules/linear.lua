--linear.lua
linear = {}
--control variables/settings
linear.ox = 400
linear.oy = 300
linear.unit = 1
--arithmetic metamethods
linear.__index = linear
linear.__add = function(a, b)
	return linear.line(a.x+b.x, a.y+b.y)
end
linear.__sub = function(a, b)
	return linear.line(a.x-b.x, a.y-b.y)
end
linear.__mul = function(a, b)
	if type(a) == "number" then
		return linear.line(b.x * (a* linear.unit), b.y * (a * linear.unit))
	elseif type(b) == "number" then
   	 	return linear.line(a.x * (b * linear.unit), a.y * (b * linear.unit))
	else
  		error("Attempted to multiply vector by non-scalar.")
	end
end
linear.__div = function(a, b)
	if type(b) == "number" and b ~= 0 then
		return linear.line(a.x / (b * linear.unit), a.y / (b * linear.unit))
	else
  		error("Attempted to divide vector by a invalid operand.")
	end
end
linear.__unm = function(v)
	return line(-v.x, -v.y)
end
--relational metamethods
linear.__eq = function(a, b)
	return a.x == b.x and a.y == b.y
end
linear.__lt = function(a, b)
	return a.x < b.x and a.y < b.y
end
linear.__le = function(a, b)
	return a.x <= b.x and a.y <= b.y
end
--vector constructor
function linear.line(i, j)
	return setmetatable({x = i, y = j}, linear)
end
--linear algebra functions
function linear.mag(v)
	return math.sqrt(v.x^2+v.y^2)
end
function linear.angle(a, b)
	return math.acos((linear.dot(a, b))/(linear.mag(a))*(linear.mag(b)))
end
function linear.normal(v)
	return v/linear.mag(v)
end
function linear.dot(a, b)
	return a.x*b.x + a.y*b.y
end
--boolean functions
function linear.isUnit(v)
	return linear.mag(v) == linear.unit
end
function linear.isOrigin(v)
	return v == linear.line(linear.ox, linear.oy)
end
return linear
