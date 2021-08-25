local t={}--alege le fichier batiment
if not functionload then
local soldatt=require("soldat")

-- local affinfogrdisp=function(obj)
-- 	print("enleve l'aff du group")
-- 	affinfogr.isVisible=false
-- end
-- local function affinfodisp( event )
-- 	jeupause.timerlibre[affinfotab.timer]=2
-- 	transition.to(affinfogr,{time=500,transition=easing.outBack, y=affinfotab.fond.yScale*affinfotab.fond.height,onComplete=affinfogrdisp})
-- end
-- function affinfobat(numero)--affichage des informations sur le batiment
-- 	--print("affinfobat")
-- 	if fenconf.isVisible==false then
-- 		--print("affinfobat apres 1")
-- 		--print("affin"..numero)
-- 		affinfogr.isVisible=true
-- 		affinfogr.y=0
-- 		-- affinfogr.alpha=1
-- 		--affinfotab.objet.text="he ho je rentre du boulot"
-- 		if ibatiment[numero].type1==1 then
-- 			affinfotab.objet.text=ibatiment[numero].message.." Attaque: "..attaquebatsec[race+1][ibatiment[numero].type1][ibatiment[numero].type2+1][ibatiment[numero].niveau] --ibatiment[numero].pole
-- 		elseif ibatiment[numero].type1==2 then
-- 			affinfotab.objet.text=ibatiment[numero].message.." Attaque:"..attaquebatsec[race+1][ibatiment[numero].type1][ibatiment[numero].type2+1][ibatiment[numero].niveau] --mathfloor(ibatiment[numero].attaque).." Cadence:"..mathfloor(ibatiment[numero].cadence)
-- 		elseif ibatiment[numero].type1==3 then
-- 			affinfotab.objet.text=ibatiment[numero].message.." Vie:"..isoldat[ibatiment[numero].numsol].vie.." Argent:"..mathfloor(ibatiment[numero].argentcum)
-- 		end
-- 		if affinfotab.timer~=nil then
-- 			if jeupause.timerlibre[affinfotab.timer]~=2 then
-- 				-- print("timer remove")
-- 				timer.cancel(jeupause.timer[affinfotab.timer])
-- 				jeupause.timerlibre[affinfotab.timer]=2
-- 			end
-- 		end
-- 		local timeraffinfodisp=timer.performWithDelay(3000, affinfodisp )
-- 		affinfotab.timer=timerpause(1, timeraffinfodisp,affinfotab.timer)
-- 	end
-- end
function generersoldat(numero,niveau)--demande de la part de la fonction d'en dessous de creation et spawn de soldat
	--local animdep1 = require ( "animdep" )
	if (ibatiment[numero].type1==1 or modearmy) and ibatiment[numero].niveau==niveau and ibatiment[numero].endev==0 then
		--nbsoldat=nbsoldat+1
		local num=findnbsoldat(0)
		-- local varlib=0
		-- local num=nil
		-- k=1
		-- while k<=nbsoldat do--permet de ralouer les numero
		-- 	if isoldat[k].remp==1 then
		-- 	--if isoldat[k].vie==-133 and isoldat[k].orientation==1 then
		-- 		varlib=1
		-- 		num=k
		-- 		k=nbsoldat+1
		-- 		--print("numero trouver")
		-- 	end
		-- 	k=k+1
		-- end
		-- if varlib==0 then
		-- 	nbsoldat=nbsoldat+1
		-- 	num=nbsoldat
		-- end
		local typeso=100+ibatiment[numero].type2*10+ibatiment[numero].niveau+(ibatiment[numero].type1-1)*4
		local hello=soldatt.new(num,typeso,numero,ibatiment[numero].pole)
		hello:debut(num)
	end
	--local typesoldat=100+ibatiment[numero].type2*10+ibatiment[numero].niveau
	--print(typesoldat)
	

	--isoldat[nbsoldat].typesoldat=100+ibatiment[numero].type2*10+ibatiment[numero].niveau
	--animdep1.animdep(0,ibatiment[numero].x,chemin[chemini].x,ibatiment[numero].y,chemin[chemini].y,ibatiment[numero].xScale,ibatiment[numero].yScale,ibatiment[numero].niveau,nbsoldat)--,typesoldat)
end
function gerergenerersoldat(numero,niveau)--genere les soldats pour chaque batiment de type contact
	--local pause1=require("pause")
	local num
	local nbsoldatspawn=0
	--if removepartiel1==false then
	local function listener1( event )
		if ibatiment[numero].endev==0 and ibatiment[numero].nbunit>nbsoldatspawn then
			generersoldat(ibatiment[numero].num,niveau)
			nbsoldatspawn=nbsoldatspawn+1
			if ibatiment[numero].nbunit>nbsoldatspawn then
				letimer=timer.performWithDelay( 500*vitessejeuin, listener1 )
				local num1=timerpause(1,letimer,num)
			else
				jeupause.timerlibre[num]=0
			end
		else
			jeupause.timerlibre[num]=0
		end
	end
	-- local function listener1( event )
	-- 	--ibatiment[numero].evol=0
	-- 	if ibatiment[numero].endev==0 then
	-- 	generersoldat(ibatiment[numero].num,niveau)
	-- 	end
	-- 	if ibatiment[numero].endev==0 and (ibatiment[numero].type2==2 or ibatiment[numero].type2==0) then
	-- 		local function listener1( event )
	-- 			if ibatiment[numero].endev==0 then
	-- 			generersoldat(ibatiment[numero].num,niveau)
	-- 			end
	-- 			if ibatiment[numero].endev==0 and ibatiment[numero].type2==0 then
	-- 				local function listener1( event )
	-- 					if ibatiment[numero].endev==0 then
	-- 					generersoldat(ibatiment[numero].num,niveau)
	-- 					end
	-- 					jeupause.timerlibre[num]=0
	-- 				end
	-- 				letimer2=timer.performWithDelay( 500, listener1 )
	-- 				local num1=timerpause(1,letimer,num)
	-- 			else
	-- 				jeupause.timerlibre[num]=0
	-- 			end
	-- 		end
	-- 		letimer1=timer.performWithDelay( 500, listener1 )
	-- 		local num1=timerpause(1,letimer1,num)
	-- 	else
	-- 		jeupause.timerlibre[num]=0
	-- 	end
	-- end
	local letimer=timer.performWithDelay( 500*vitessejeuin, listener1 )
	num=timerpause(1,letimer,nil)
	--end
end
function generersoldatarmy(numero,niveau)
	generersoldat(ibatiment[numero].num,niveau)
end
end

t.batimentbis= function()
local a=1
end
return t