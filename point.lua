--------CLASS definissant les point(sert a definir les points pour les de la ccarte(zone non constructible...))
local point={}
--ocal point_mt = { __index = point }

function point.new( x, y )
	--partie 1-----------------------------------------------------------------------------
	--local lepoint=display.newCircle(x, y, 2 ) --enlever les commentaires
	local lepoint={}--mettre en commentaire
	lepoint.x=x
	lepoint.y=y
	--print("point yop")
	return lepoint
end
return point--lepoint
