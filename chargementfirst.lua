local variationtune=false
function vartune(diam)
	local valeurfinale
	if diam~=nil then
		valeurfinale=savegame.monney
	else
		valeurfinale=-argent/3
	end
	if valeurfinale>-1 and valeurfinale<1  then
		valeurfinale=0
	end
	--print("from "..tune.text.." to ".. valeurfinale)
	local valeurbegin
	if diam then
		valeurbegin=tonumber(lefrictext.text)
	else
		valeurbegin=tonumber(tune.text)
	end
	local begin
	local letexttext
	if variationtune then
		Runtime:removeEventListener( "enterFrame", variationtunelist )
	end
	local varsec=1
	local diffric=mathabs(valeurfinale-valeurbegin)
	if diffric<20 then
		varsec=0.6
	elseif diffric<50 then
		varsec=1.2
	elseif diffric<150 then
		varsec=3.2
	elseif diffric<300 then
		varsec=5.9
	elseif diffric<500 then
		varsec=12
	elseif diffric<1000 then
		varsec=123
	elseif diffric<10000 then
		varsec=511
	else
		varsec=12345
	end
	if diam then
		varsec=varsec*0.5
	end
	print("varsec "..varsec)
	local signe=1
	if valeurfinale-valeurbegin<0 then
		signe=-1
	end
	print("signe "..signe)
	variationtune=true
	function variationtunelist( event )
		if begin==nil then
			begin=event.time
		end
		valeurbegin=valeurbegin+varsec*signe
		-- print("valeurbegin "..valeurbegin)
		letexttext=mathfloor(valeurbegin)
		if (letexttext>=valeurfinale and signe==1) or (letexttext<=valeurfinale and signe==-1) then
			if diam then
				if lefrictext~=nil then
					lefrictext.text=valeurfinale
				end
			else
				tune.text=valeurfinale
			end
			variationtune=false
			Runtime:removeEventListener( "enterFrame", variationtunelist )
		else
			if letexttext>-1 and letexttext<1  then
				letexttext=0
			end
			if diam then
				if lefrictext~=nil then
					lefrictext.text=letexttext
				end
			else
				tune.text=letexttext
			end
		end
		--print("tune.text "..tune.text)
	end 
	Runtime:addEventListener( "enterFrame", variationtunelist )
end
function retournenumgene(racech,niveaugene)
	print("racech "..racech.." niveaugene "..niveaugene)
	local numgene=173
	--local numsave=350
	if racech==0 then--general
		if niveaugene==1 then
			numgene=170
		elseif niveaugene==2 then
			numgene=171
		elseif niveaugene==3 then
			numgene=172
		elseif niveaugene>=4 then
			numgene=179
		end
	elseif racech==1 then
		if niveaugene==1 then
			numgene=173
		elseif niveaugene==2 then
			numgene=175
		elseif niveaugene==3 then
			numgene=174
		elseif niveaugene>=4 then
			numgene=179
		end
	elseif racech==2 then
		if niveaugene==1 then
			numgene=176
		elseif  niveaugene==2 then
			numgene=177
		elseif  niveaugene==3 then
			numgene=178
		elseif niveaugene>=4 then
			numgene=179
		end
	end
	print("numgene "..numgene)
	return numgene
end
function attviegene(numdev,numimage,infosurlevelup)
	local viegene
	local attaquegene
	local levelgene
	local vieplus
	local attaqueplus
	local xpmanquant
	local xpactuel
	local xpppourlevelup

	local charge
	print("le general à "..savegamedev[numdev].." d'experience")
	savegamedev[numdev]=tonumber(savegamedev[numdev])
	local testcpt=1
	while testcpt<#savegameall.generalxp do
		if savegamedev[numdev]<=savegameall.generalxp[testcpt] then
			levelgene=testcpt
			testcpt=#savegameall.generalxp+1
		end
		testcpt=testcpt+1
	end
	if levelgene==nil then
		levelgene=1
	end
	print("vie avant: "..image[numimage].vie.." attaque "..image[numimage].attaque.."lvl gene"..levelgene)
	if image[numimage].charge==0 then
		attaquegene=mathfloor(image[numimage].attaque*(1-0.1+levelgene*0.1))
	else
		attaquegene=mathfloor(image[numimage].attaque*(1-0.1+levelgene*0.05))
		charge=mathfloor(image[numimage].charge*(1-0.1+levelgene*0.05))
	end
	--attaquegene=mathfloor(image[numimage].attaque*(1-0.1+levelgene*0.1))
	viegene=mathfloor(image[numimage].vie*(1-0.1+levelgene*0.1))
	if infosurlevelup then
		if image[numimage].charge==0 then
			attaqueplus=mathfloor(image[numimage].attaque*(1-0.1+(levelgene+1)*0.1))-attaquegene
		else
			attaqueplus=mathfloor(image[numimage].attaque*(1-0.1+(levelgene+1)*0.05))-attaquegene
		end
		--attaqueplus=mathfloor(image[numimage].attaque*(1-0.1+(levelgene+1)*0.1))-attaquegene
		print("attaquegene"..attaquegene.."attplustt"..mathfloor(image[numimage].attaque*(1-0.1+(levelgene+1)*0.1)).." attp "..attaqueplus)
		vieplus=mathfloor(image[numimage].vie*(1-0.1+(levelgene+1)*0.1))-viegene
		xpmanquant=mathfloor(savegameall.generalxp[levelgene]*0.2)-mathfloor(savegamedev[numdev]*0.2)
		local xplevelavant=0
		if levelgene>1 then
			xplevelavant=mathfloor(savegameall.generalxp[levelgene-1]*0.2)

		end
		xpactuel=mathfloor(savegamedev[numdev]*0.2)-xplevelavant
		xpppourlevelup=mathfloor(savegameall.generalxp[levelgene]*0.2)-xplevelavant -- -mathfloor(savegamedev[numgene-1]*0.01)
	end
	return attaquegene,viegene,levelgene,vieplus,attaqueplus,xpmanquant,xpactuel,xpppourlevelup,charge
end
local t = {}--chargement de donnée pour les gentils et une partie pour les mechants+ une parties des images

t.chargementfirst = function ()
end
return(t)