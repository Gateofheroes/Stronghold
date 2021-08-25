local swipemulti = {}
function initaff()

end
local function ordreapplic(inf1,inf2,inf3,prix)
	if inf1==4 then
		savegamemulti.dev[inf3]=true
		if inf3>6 then
			savegamemulti.map=savegamemulti.map+1
		end
		local loadsave = require("loadsave")
		loadsave.saveTable(savegame, "undeuxtroissoleil.json" )
		loadsave.saveTable(savegamedev, "undeuxtroissoleilbis.json" )
		loadsave.saveTable(savegamemulti, "undeuxtroissoleilmulti.json" )
	elseif inf1==2 then
		if prix=="edit" then
			multi=1
			typemulti=1
		else 
			multi=2
			typemulti=2
		end	
		niveauch=21
		mapmultisave=inf2
		numsavegame=inf3
		fricmulticreation=savegameall.multidata[mapmultisave][numsavegame].fric --200 --fricmulti.valeur
		modenormal=false
		varviemech=1 -- a ne pas toucher pour level inf
		multi=typemulti
		local menucarte = require ( "menucarte" )
		menucarte.ordre(0,1,niveauch,1,typemulti)
		multivaguemax=savegameall.multidata[mapmultisave][numsavegame].vaguemax

		pouvoirdisp=0
		local i=1
		while savegamemulti.dev[i] do
			pouvoirdisp=pouvoirdisp+1
			i=i+1
		end
		i=4
		generalobligatoir=0-- niveau du gene autorisé 0 pour pas de gene, 1 pour de level1, 2 de deuxieme niveau...
		while savegamemulti.dev[i] do
			generalobligatoir=generalobligatoir+1
			i=i+1
		end	
		dureepartie=0.5
		accelererenn=1.7
		--multivaguemax=100
	elseif inf1==3 then
		savegamemulti.unit[inf2][inf3]=true
		local loadsave = require("loadsave")
		loadsave.saveTable(savegame, "undeuxtroissoleil.json" )
		loadsave.saveTable(savegamedev, "undeuxtroissoleilbis.json" )
		loadsave.saveTable(savegamemulti, "undeuxtroissoleilmulti.json" )
	end
end
swipemulti.ordre = function (inf1,inf2,inf3,prix)
	ordreapplic(inf1,inf2,inf3,prix)
end
return swipemulti