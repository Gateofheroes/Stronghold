local t={}--fonction dispo pour animdep batiment et combat
if not functionload then
function copy(obj, seen)
  if type(obj) ~= 'table' then return obj end
  if seen and seen[obj] then return seen[obj] end
  local s = seen or {}
  local res = setmetatable({}, getmetatable(obj))
  s[obj] = res
  for k, v in pairs(obj) do
  	res[copy(k, s)] = copy(v, s)
  end
  return res
end
function animgainfric(event) -- piece qui se deplace
	local pieceor=display.newImage(imbouton.monnaie,3)
	pieceor.x=(event.x)+7-mathrandom(15) -- (event.x)/taille+7-mathrandom(15) --pieceor.x=vagsui.x+7-mathrandom(15)
	pieceor.y=(event.y)+7-mathrandom(15) -- (event.y)/taille+7-mathrandom(15)+10 -- le +10 pour la postion de l'ombre
	if not goh then
		pieceor.y=pieceor.y+10
	else
		pieceor.y=pieceor.y-10
	end
	pieceor.xScale=0.06
	pieceor.yScale=pieceor.xScale
	pieceor.xscaleevol=-0.01
	pieceor.signe=1
	pieceor.group=2048 --mathfloor(pieceor.y)+1024+5
	group[pieceor.group]:insert(pieceor)
	pieceor.cpt=1
	local function destrucblood2(event)
		if pieceor.cpt<40 and  removetotal==false then
			pieceor.y=pieceor.y-0.5
			if -pieceor.yScale>pieceor.xScale then
				pieceor.signe=-1
				print("met le signe a -1")
			elseif pieceor.yScale<pieceor.xScale then
				pieceor.signe=1
				print("met le signe a 1")
			end
			local xscale=pieceor.xScale+pieceor.xscaleevol*pieceor.signe
			if xscale>-0.005 and xscale<0.005 then
				xscale=0.005*-pieceor.signe
			end
			pieceor.xScale=xscale
			if pieceor.cpt>20 then
				pieceor.alpha=pieceor.alpha-0.05
			end
			pieceor.cpt=pieceor.cpt+1
			local destrucblood2=timer.performWithDelay(30,destrucblood2)
		else
			--group[pieceor.group]:remove(pieceor) 
			display.remove(pieceor)--:removeSelf()
			pieceor=nil
		end
	end
	local destrucblood2=timer.performWithDelay(30,destrucblood2)
end
function spawnsoldat(numero,typeso,yspawn,orientationo)
	local orientation=orientationo or 0
	if typeso>=200 and orientationo==nil then
		orientation=1
	end
	print("spawnsoldat "..numero.." typeso "..typeso.." orientation")
	local num=findnbsoldat(orientation)
	local pole
	if yspawn==nil then
		pole= isoldat[numero].pole
	end
	local hello=soldat1.new(num,typeso,0,pole) --239
	hello:debut(num,-numero,yspawn)
	return num
end
local affinfogrdisp=function(obj)
	--print("enleve l'aff du group par animdepter")
	affinfogr.isVisible=false
end
local function affinfodisp( event )
	if affinfotab.timer~=nil then
		jeupause.timerlibre[affinfotab.timer]=2
	end
	transition.to(affinfogr,{time=500,transition=easing.outBack, y=affinfotab.fond.yScale*affinfotab.fond.height,onComplete=affinfogrdisp})
end
function affinfo(numero,typeaff,soldatbool)--affichage d'information lorsqu'on clique sur le personnage+ rafraichissement de ses informations
	soldatclic=1
	if fenconf.isVisible==false then
		affinfogr.isVisible=true
		affinfogr.y=0
		local textgene=""
		if typeaff==true then
			local function timersoldatclic(event)
				soldatclic=0
			end
			local letimersoldat=timer.performWithDelay(50,timersoldatclic)
			--print("numero"..numero.."vie"..isoldat[numero].vie.."encombat"..isoldat[numero].ennemi.."sup")
			if soldatbool then --numero>0 then
				affinfotab.type=0
				affinfotab.num=numero
				-- if isoldat[numero].gene==1 then
				-- 	local xptest=savegamedev[isoldat[numero].numdev]*0.01
				-- 	if xptest<100 then
				-- 		xptest=mathfloor(xptest*10)*0.1
				-- 	else
				-- 		xptest=mathfloor(xptest)
				-- 	end
				-- 	textgene=" lvl:"..isoldat[numero].level.." xp:"..xptest
				if isoldat[numero].orientation==0 and (savegameall.xpactive or isoldat[numero].classe>=7) then --elseif
					textgene=texttraduction.message[6]..isoldat[numero].level
				end
				local textfin=""
				if issimulator then-------------------------------------------- then
					textfin=" "..isoldat[numero].pole.." ID:"..isoldat[numero].typesoldat.." num:"..numero.." zone1 "..isoldat[numero].zone1.." "..isoldat[numero].zone2.." "..isoldat[numero].zone3.." "..isoldat[numero].zone4
				end
				textgene=image[isoldat[numero].typesoldat].message..textgene..texttraduction.message[4]..mathfloor(isoldat[numero].vie).."/"..isoldat[numero].vietotale..texttraduction.message[5]..isoldat[numero].attsec..textfin
				
			else
				print("temps d'aff var")
				--tempsdafftest=20000 --tempsdaff*(-numero)
				textgene=savegameall.tips[mathrandom(1,#savegameall.tips)]
			end
		else
			affinfotab.type=1
			affinfotab.num=numero
			if ibatiment[numero].type1==1 then
				if ibatiment[numero].attsec==nil then
					ibatiment[numero].attsec=0
				end
				textgene=ibatiment[numero].message..texttraduction.message[3]..ibatiment[numero].attsec --attaquebatsec[race+1][ibatiment[numero].type1][ibatiment[numero].type2+1][ibatiment[numero].niveau] --ibatiment[numero].pole
			elseif ibatiment[numero].type1==2 then
				local attsec=ibatiment[numero].attsec or 0
				textgene=ibatiment[numero].message..texttraduction.message[3]..attsec --attaquebatsec[race+1][ibatiment[numero].type1][ibatiment[numero].type2+1][ibatiment[numero].niveau] --mathfloor(ibatiment[numero].attaque).." Cadence:"..mathfloor(ibatiment[numero].cadence)
			elseif ibatiment[numero].type1==3 then
				textgene=ibatiment[numero].message..texttraduction.message[4]..mathfloor(isoldat[ibatiment[numero].numsol].vie).." $:"..mathfloor(ibatiment[numero].argentcum)
			end
		end
		local policesize -- =string.len(textgene)
		-- -- if policesize<11 then
		-- -- 	policesize=1
		-- -- else
		-- print("policesize "..policesize)
		-- if policesize<=13 then
		-- 	policesize=0.9
		-- elseif policesize<=15 then
		-- 	policesize=0.8
		-- elseif policesize<=17 then
		-- 	policesize=0.7
		-- elseif policesize<=19 then
		-- 	policesize=0.6
		-- elseif policesize<=23 then
		-- 	policesize=0.5
		-- elseif policesize<=28 then
		-- 	policesize=0.4
		-- elseif policesize<=35 then
		-- 	policesize=0.3
		-- elseif policesize<=56 then
		-- 	policesize=0.2
		-- else

		-- end
		affinfotab.objet.text=textgene
		policesize=(affinfotab.fond.xScale*affinfotab.fond.width)/(affinfotab.objet.width*1.1)
		if policesize>0.9 then
			policesize=0.9
		end
		--print("policesize "..policesize)
		--policesize=30
		affinfotab.objet.xScale=policesize
		affinfotab.objet.yScale=affinfotab.objet.xScale
		--affinfotab.objet.fontSize=policesize

		if affinfotab.timer~=nil then
			if jeupause.timerlibre[affinfotab.timer]~=2 then
				timer.cancel(jeupause.timer[affinfotab.timer])
				--print("timercancel")
				jeupause.timerlibre[affinfotab.timer]=2
			end
		end
		local timeraffinfodisp=nil
		if numero>0 then
			timeraffinfodisp=timer.performWithDelay(3000, affinfodisp )
			--print("pas celui la")
		else
			timeraffinfodisp=timer.performWithDelay(10000, affinfodisp )
			--print("le timer d'ici")
		end
		--print("tempsdaff "..tempsdafftest)
		affinfotab.timer=timerpause(1,timeraffinfodisp,affinfotab.timer)
	end
end
function libnum(numero)--liberer le numero du soldat
	local num
	local function listener( event )
		jeupause.timerlibre[num]=0
		if removepartiel1==false then
			isoldat[numero].remp=1
		end
	end
	letimer=timer.performWithDelay( 3000, listener )
	num=timerpause(1,letimer,nil)
end
function animationlevelup(x,y,taille)
	if (fpschoisi-vitessejeu)<1.15 then
		local animlevelup=display.newSprite(imgbat.levelup,imgbat.levelupseq)
		animlevelup:setSequence( "levelup" )
		if taille==1 then
			animlevelup:setFillColor(1,1,0)
		elseif taille==0 then
			animlevelup:setFillColor(1,0.5,0)
		elseif taille==2 then
			animlevelup:setFillColor(0,1,0)
		else
			animlevelup:setFillColor(0,0,1)
		end
		--animlevelup:play()
		animlevelup.x=x
		animlevelup.group=2048
		group[animlevelup.group]:insert(animlevelup)
		animlevelup.xScale=0.6
		animlevelup.yScale=-animlevelup.xScale
		animlevelup.y=y-animlevelup.height*0.40*animlevelup.xScale
		animlevelup.xScale=animlevelup.xScale*0.7
		--animlevelup.alpha=taille
		spritegestion(animlevelup)
		-- local function supranimlevelup(event)
		-- 	group[2048]:remove(event.source.obj)
		-- 	event.source.obj:removeSelf()
		-- 	event.source.obj=nil
		-- end
		-- local timerdata=timer.performWithDelay(800,supranimlevelup)
		-- timerdata.obj=animlevelup
		--local levelupremove=function(obj)
			-- group[2048]:remove(obj)
			-- obj:removeSelf()
			-- obj=nil
		--end
		--transition.to(animlevelup,{time=2000,alpha=0,xScale=1*taille,yScale=1*taille,onComplete=levelupremove,onCancel=levelupremove,tag="element"})
	end
end
local function destrucblood2(event)
	jeupause.timerlibre[event.source.num]=0
	display.remove(event.source.sang)
	--if event.source.sang~=nil then
	--	group[event.source.sang.group]:remove(event.source.sang) 
	--	event.source.sang:removeSelf()
		event.source.sang=nil
	--end
end
function affsang(numerobis,coef)
	if fpschoisicycle==0 and ((fpschoisi-vitessejeu)<1.2 and isoldat[numerobis].pole==0) then
		local coefi=1
		if coef~=nil then
			coefi=coef
		end
		--sang={}
		--sang.group=
		-- if groupsang==nil then
		-- 	groupsang=display.newGroup()
		-- 	groupsang.group=mathfloor(isoldat[numerobis].y1+1024)
		-- 	group[2048]:insert(groupsang)--groupsang.group
		-- end
		if isoldat[numerobis].x1~=nil and isoldat[numerobis].y1~=nil then
			for i=1, mathrandom(10) do
				local sang=display.newCircle(isoldat[numerobis].x1-isoldat[numerobis].direction*isoldat[numerobis].centrex+7*coefi-mathrandom(15*coefi),isoldat[numerobis].y1+isoldat[numerobis].centrey+7*coefi-mathrandom(15*coefi),mathrandom(50*coefi)/30)
				sang:setFillColor(0.55,0.042,0.042,0.9)
				sang.alpha=0.8
				--groupsang:insert(sang)
				sang.group=mathfloor(sang.y)+1024+10
				group[sang.group]:insert(sang)
				-- local function destrucblood2(event)
				-- 	jeupause.timerlibre[event.source.num]=0
				-- 	group[sang.group]:remove(sang) 
				-- 	sang:removeSelf()
				-- 	sang=nil
				-- end
				local destrucblood2=timer.performWithDelay(300*mathrandom(1,4)*vitessejeuin,destrucblood2)
				destrucblood2.sang=sang
				destrucblood2.num=timerpause(3,destrucblood2)
			end
		end
	end
end

local function affbrouillard(numero,x,y,numgroup,dist,coef) -- dist largeur du brouillard, coef densité
	local autorie=true
	if numero~=nil then
		if isoldat[numero].pole~=0 then
			autorie=false
		end
	end
	local fpsvaleur=fpschoisi-vitessejeu
	print("fps valeur "..fpsvaleur)
	if fpsvaleur>1 then
		fpsvaleur=mathrandom(1,((fpsvaleur-1)*50))
	end
	print("fps choisi "..fpschoisi.." fpsvaleur "..fpsvaleur)
	if fpschoisicycle==0 or (fpsvaleur==1 and autorise) then --(fpschoisi-vitessejeu)<=1.2 
		local coef1=coef or 1
		local distdefaut=dist or 1
		local dist1=10*distdefaut
		local dist3=20
		local randomvalue=-1
		local randomvalue1=0
		local posix
		local posiy
		if x~=nil then
			posix=x
			posiy=y
		else
			if not isoldat[numero].mine or isoldat[numero].ennemi==0 then
				posix=isoldat[numero].x1 --+(image[isoldat[numero].typesoldat].attx+isoldat[numero].centrex)*isoldat[numero].direction
				posiy=isoldat[numero].y1 -- +image[isoldat[numero].typesoldat].atty+isoldat[numero].centrey
				if goh then
					posiy=posiy-isoldat[numero].height*0.5
				else
					posiy=posiy+10
				end
			else
				posix=isoldat[isoldat[numero].ennemi].x1 -- +(image[isoldat[isoldat[numero].ennemi].typesoldat].attx+isoldat[isoldat[numero].ennemi].centrex)*isoldat[isoldat[numero].ennemi].direction
				posiy=isoldat[isoldat[numero].ennemi].y1 -- +image[isoldat[isoldat[numero].ennemi].typesoldat].atty+isoldat[isoldat[numero].ennemi].centrey
				if goh then
					posiy=posiy-isoldat[isoldat[numero].ennemi].height*0.5
				end
			end
		end
		local imax=3*coef1
		local alpha
		local alphavar=math.log(coef1-1)*0.5+1
		if alphavar<1 then
			alphavar=1
		end

		if niveauch<=4 or niveauch>8 then
			alpha=0.1*alphavar
		else
			alpha=0.05*alphavar
		end
		if alpha>1 then
			alpha=1
		end
		for i=1,imax do
			randomvalue1=randomvalue
			randomvalue=mathrandom(0,dist1) -- -dist1*3
			-- print("randomvalue "..randomvalue)

			local sang=display.newCircle(posix+randomvalue-dist1*0.5,posiy+randomvalue1*0.8-dist1*0.5*0.8,dist3)
			dist1=dist1+30
			dist3=dist3-6
			if dist3<2 then
				dist3=20
				dist1=10*distdefaut
			end
			---print("dist3 "..dist3)
			sang:setFillColor(0.5,0.5,0.5,alpha)
			--groupsang:insert(sang)
			if numgroup==nil then
				sang.group=mathfloor(sang.y)+1024+2
			else
				sang.group=numgroup
			end
			group[sang.group]:insert(sang)
			local destrucblood2=timer.performWithDelay(2500/(imax+1-i)*vitessejeuin,destrucblood2)
			destrucblood2.sang=sang
			destrucblood2.num=timerpause(3,destrucblood2)
		end
		-- 	local centretest=0.3
		-- local randomvalue=0
		-- local randomvalue1=0
		-- local randomvalue2=2
		-- for i=1,mathrandom(70) do
		-- 	if i==10 then
		-- 		centretest=0.6
		-- 	elseif i==20 then
		-- 		centretest=0.7
		-- 	elseif i==30 then
		-- 		centretest=0.8
		-- 	elseif i==40 then
		-- 		centretest=1
		-- 	elseif i==50 then
		-- 		centretest=1.2
		-- 	elseif i==60 then
		-- 		centretest=1.5
		-- 	end
		-- 	randomvalue2=randomvalue1
		-- 	randomvalue1=randomvalue
		-- 	randomvalue=mathrandom(0,10)
		-- 	local sang=display.newCircle(isoldat[numero].x1+7*(randomvalue-5)*centretest,isoldat[numero].y1+5*(randomvalue1-5)*centretest,randomvalue1*0.5+1)
		-- 	sang:setFillColor(0.5,0.5,0.5,0.1)
		-- 	--groupsang:insert(sang)
		-- 	sang.group=mathfloor(sang.y)+1024+2
		-- 	group[sang.group]:insert(sang)
		-- 	local function destrucblood2(event)
		-- 		group[sang.group]:remove(sang) 
		-- 		sang:removeSelf()
		-- 		sang=nil
		-- 	end
		-- 	local destrucblood2=timer.performWithDelay(500*(randomvalue*0.5+0.2),destrucblood2)
		-- end
	end
end
function affbrouillardglob(numero,x,y,numgroup,dist,coef)
	print("brouillard")
	affbrouillard(numero,x,y,numgroup,dist,coef)
end
function animchargemort(numero,numerobis,direct,intensite,rebond)
	if true then --issimulator then
		if fpschoisicycle==0 and ((fpschoisi-vitessejeu)<=1.15 and isoldat[numerobis].pole==0) and not isoldat[numero].mine then
			if direct==nil then
				direct=0
			end
			if intensite==nil then
				intensite=1
			end
			if rebond==nil then
				rebond=false
			end
			print("animchargemort")
			local imagecorps=display.newImage(isoldat[numero].depgauche,1)
			imagecorps.x=isoldat[numero].x1
			imagecorps.y=isoldat[numero].y1
			if goh then
				imagecorps.y=imagecorps.y-10
			end
			imagecorps.xScale=isoldat[numero].scale*isoldat[numero].direction*0.8
			imagecorps.yScale=isoldat[numero].scale
			imagecorps.group=mathfloor(imagecorps.y)+1024
			imagecorps.rotate1=60
			group[imagecorps.group]:insert(imagecorps)
			local duree=750*vitessejeuin*intensite
			local direction=isoldat[numero].direction
			local affiimpact=function(obj)
				local animsplashseq={name="levelup",
			    	frames={3,4,5,5,5,5,5,5},--frames= {1,4,5,3}, -- frame indexes of animation, in image sheet
			    	time = 1000*vitessejeuin,
			    	loopCount = 1, }
				local animsplash=display.newSprite(imgbat.pique3,animsplashseq)
				animsplash.x=obj.x
				animsplash.y=obj.y+3
				animsplash.xScale=0.14*intensite
				animsplash.yScale=0.14*intensite
				animsplash:setFillColor(0)
				animsplash.alpha=0.3
				animsplash:setSequence("levelup")
				spritegestion(animsplash,0)
				animsplash.group=mathfloor(obj.y)+1000
				group[animsplash.group]:insert(animsplash)
			end
			if direct==0 then
				imagecorps.x1=imagecorps.x+isoldat[numero].direction*50*intensite
				imagecorps.y1=imagecorps.y
			else
				imagecorps.x1=imagecorps.x+isoldat[numero].direction*50*intensite*math.cos(direct)
				imagecorps.y1=imagecorps.y+50*intensite*math.sin(direct)*0.8
			end
			if direct~=0 then
				imagecorps.rotate1=imagecorps.rotate1*math.cos(direct)
			end
			imagecorps:rotate(imagecorps.rotate1*isoldat[numero].direction)
			local transitionrebond=easing.outSine
			local dureerebond=0.4
			if rebond then
				transitionrebond=easing.outBounce
				dureerebond=0.5
			end
			local latransition=transition.to(imagecorps,{transition=easing.outQuad,x=imagecorps.x1,time=duree,onComplete=destructeurpartieltran,onCancel=destructeurpartieltran,tag="elementtype"})
			local latransition1=transition.to(imagecorps,{transition=easing.outSine,y=imagecorps.y+(imagecorps.y1-imagecorps.y)*0.5-7*intensite,time=duree*0.5,tag="elementtype"})
			local latransition2=transition.to(imagecorps,{transition=transitionrebond,y=imagecorps.y1,time=duree*dureerebond,delay=duree*0.5,tag="elementtype"})
			local latransition3=transition.to(imagecorps,{rotation=160*isoldat[numero].direction,time=duree*0.8,tag="elementtype",onComplete=affiimpact})
			if rebond then
				local latransition6=transition.to(imagecorps,{rotation=140*isoldat[numero].direction,time=duree*0.05,delay=0.8*duree,tag="elementtype"})
			end
			local latransition4=transition.to(imagecorps,{xScale=imagecorps.xScale*1.3*intensite,yScale=imagecorps.yScale*1.3*intensite,time=duree*0.4,tag="elementtype"})
			local latransition5=transition.to(imagecorps,{xScale=imagecorps.xScale,yScale=imagecorps.yScale,time=duree*0.5,delay=duree*0.6,tag="elementtype"})
			local latransition7=transition.to(imagecorps,{yScale=imagecorps.yScale*0.9,time=duree*0.1,delay=0.8*duree,tag="elementtype"})
			if jeupause.etat==1 then
				transition.pause(latransition)
			end
			local num
			local cpt=0
			local duree1=150*vitessejeuin*intensite
			local function listener( event )
				if removepartiel1==false then
					if cpt<duree/duree1 and imagecorps~=nil then
						if imagecorps.x~=nil then
							print("brouillard de charge")
							cpt=cpt+1
							--for i=1,4 do
								affbrouillard(nil,imagecorps.x+direction*10,imagecorps.y,imagecorps.group)
							--end
							local letimer=timer.performWithDelay(duree1, listener )
							num=timerpause(1,letimer,num)
						else
							jeupause.timerlibre[num]=0
						end
					else
						jeupause.timerlibre[num]=0
					end
				else
					jeupause.timerlibre[num]=0
				end
			end
			local letimer=timer.performWithDelay(duree1, listener )
			num=timerpause(1,letimer,nil)
		end
	end
end
function animmortchoix(i,numero,proba)
	if not isoldat[i].vivant then
		local probaresul=false
		if proba>0 then
			local probacalc=mathfloor(isoldat[i].vietotale/(isoldat[numero].attaque*0.5)/proba)*2
			if probacalc==nil then
				probacalc=2
			end
			if probacalc<2 then
				probacalc=2
			end
			if mathrandom(0,probacalc)==0 then
				probaresul=true
			end
		else
			probaresul=true
		end
		if probaresul then
			local direct=isoldat[i].y1-isoldat[numero].y1
			if mathabs(direct)<3 then
				direct=0
			elseif mathabs(direct)<5 then
				direct=direct/10
			else
				direct=0.8
				if direct<0 then
					direct=-direct
				end
			end
			local intensite=(isoldat[numero].attaque*0.5)/isoldat[i].vietotale
			if intensite<=0.7 then
				intensite=0.7
			elseif intensite>1.3 then
				intensite=1.3
			end
			animchargemort(i,numero,direct,intensite)
		end
	end
end
function mort(numero)--cas ou un soldat meurt
	--local pause1=require("pause")
	if isoldat[numero].mine==true then
		isoldat[numero].encombat=0
		isoldat[numero].ennemi=0
		isoldat[numero].nbennemi=0 
		isoldat[numero].ennemipb=false
		isoldat[numero].vivant=false
		isoldat[numero].vie=0
	else
	sonattds=sonattds+1	
	local alea=mathrandom(4)
	local alea1=alea
	if alea1<=2 then
		alea1=1
	else
		alea1=2
	end
	audio.play(son.combatcriti[alea],{channel=alea1+10})
	isoldat[numero].ombre.isVisible=false
	if isoldat[numero].rectxp~=nil then
		isoldat[numero].rectxp.isVisible=false
	end
	isoldat[numero].encombat=0
	isoldat[numero].ennemi=0
	isoldat[numero].ennemipb=false
	isoldat[numero].zone1=-1
	isoldat[numero].zone2=-1
	isoldat[numero].zone3=-1
	isoldat[numero].zone4=-1
	isoldat[numero].endeplacement=0
	if isoldat[numero].vivant==true then--if isoldat[numero].vie~=-133 then--regarde si il est deja mort officiellement
		local numerut=false
		if fpschoisi<1.5 then
			if genenum==numero then
				isoldat[numero].pierretombale=display.newImage(imbouton.pierretombalegene,1)
			else
				isoldat[numero].pierretombale=display.newImage(imbouton.pierretombale,1)
			end
			isoldat[numero].pierretombale.x=isoldat[numero].ombre.x
			isoldat[numero].pierretombale.y=isoldat[numero].ombre.y-6
			if genenum==numero then
				if goh then
					isoldat[numero].pierretombale.xScale=0.3
				else
					isoldat[numero].pierretombale.xScale=0.23
				end
				isoldat[numero].pierretombale.yScale=isoldat[numero].pierretombale.xScale
			else
				if goh then
					isoldat[numero].pierretombale.xScale=0.2
				else
					isoldat[numero].pierretombale.xScale=0.07
				end
				isoldat[numero].pierretombale.yScale=isoldat[numero].pierretombale.xScale
			end
			isoldat[numero].pierretombale.group=mathfloor(isoldat[numero].pierretombale.y-3)+1024
			group[isoldat[numero].pierretombale.group]:insert(isoldat[numero].pierretombale)
			local numtimer
			local function pierretombaletimer( event )
				if removetotal==false and removepartiel1==false then
					jeupause.timerlibre[numtimer]=0
					if isoldat[numero].pierretombale~=nil then
						group[isoldat[numero].pierretombale.group]:remove(isoldat[numero].pierretombale)
						isoldat[numero].pierretombale:removeSelf()
						isoldat[numero].pierretombale=nil
					end
				end
			end
			if genenum~=numero then
				if modezombie then
					local pierretombaletimer1=timer.performWithDelay(30000,pierretombaletimer )
					numtimer=timerpause(1,pierretombaletimer1,nil)
				else
					local pierretombaletimer1=timer.performWithDelay(1500,pierretombaletimer )
					numtimer=timerpause(1,pierretombaletimer1,nil)
				end
			end
		end
		isoldat[numero].vivant=false
		isoldat[numero].vie=0-- -133
		--group[2]:remove(isoldat[numero].ombre )
		nombredekill=nombredekill+1
		nombredeviett=nombredeviett+isoldat[numero].vietotale
		isoldat[numero].encombat=0
		--local soldatt=require("soldat")
		if isoldat[numero].orientation==1 then
			if modeinfini then
				if modeinfdif==0 then 
					if moyennesoldatmort==0 then
						moyennesoldatmort=linftabpro[isoldat[numero].point]
					else
						moyennesoldatmort=mathfloor((moyennesoldatmort*0.9+linftabpro[isoldat[numero].point]*0.1)*100)*0.01
					end
				end
			end
			local argentgagnermort=isoldat[numero].argent
			local clicsurpiece=false
			if argentgagnermort>12 and argentgagnermort/dureepartie*clicpiececoef>5 then
				clicsurpiece=true
			end
			if argentgagnermort>0 and fpschoisi<1.5 and not clicsurpiece then
				sonattds=sonattds+1
				audio.play(son.eventcoin,{channel=mathrandom(13,14)})
				if isoldat[numero].x1~=nil and isoldat[numero].y1~=nil then
					local nbpiece=mathfloor(argentgagnermort*0.1)
					if nbpiece<1 then
						nbpiece=1
					end
					for i=1,nbpiece ,1 do
						local event1={}
						event1.x=isoldat[numero].x1+isoldat[numero].direction*isoldat[numero].centrex
						event1.y=isoldat[numero].y1+isoldat[numero].centrey
						animgainfric(event1)
						-- local pieceor=display.newImage(imbouton.monnaie,3)
						-- pieceor.x=isoldat[numero].x1+isoldat[numero].direction*isoldat[numero].centrex+7-mathrandom(15)
						-- pieceor.y=isoldat[numero].y1+isoldat[numero].centrey+7-mathrandom(15)+10 -- le +10 pour la postion de l'ombre
						-- pieceor.xScale=0.06
						-- pieceor.yScale=pieceor.xScale
						-- pieceor.xscaleevol=-0.01
						-- pieceor.signe=1
						-- pieceor.group=isoldat[numero].numgroup+2 --mathfloor(pieceor.y)+1024+5
						-- group[pieceor.group]:insert(pieceor)
						-- pieceor.cpt=1
						-- local function destrucblood2(event)
						-- 	if pieceor.cpt<40 and not findelapartie then
						-- 		pieceor.y=pieceor.y-0.5
						-- 		if -pieceor.yScale>pieceor.xScale then
						-- 			pieceor.signe=-1
						-- 			print("met le signe a -1")
						-- 		elseif pieceor.yScale<pieceor.xScale then
						-- 			pieceor.signe=1
						-- 			print("met le signe a 1")
						-- 		end
						-- 		local xscale=pieceor.xScale+pieceor.xscaleevol*pieceor.signe
						-- 		if xscale>-0.005 and xscale<0.005 then
						-- 			xscale=0.005*-pieceor.signe
						-- 		end
						-- 		pieceor.xScale=xscale
						-- 		if pieceor.cpt>20 then
						-- 			pieceor.alpha=pieceor.alpha-0.05
						-- 		end
						-- 		pieceor.cpt=pieceor.cpt+1
						-- 		local destrucblood2=timer.performWithDelay(30,destrucblood2)
						-- 	else
						-- 		group[pieceor.group]:remove(pieceor) 
						-- 		pieceor:removeSelf()
						-- 		pieceor=nil
						-- 	end
						-- end
						-- local destrucblood2=timer.performWithDelay(30,destrucblood2)
					end
				end
			end
			if multi~=0 then
				argentgagnermort=2*argentgagnermort
			elseif modeinfini==true then
				argentgagnermort=0.5*argentgagnermort
				if mathfloor(argentgagnermort)~=argentgagnermort then
					argentgagnermort=argentgagnermort+0.5
				end
			end
			argentgagnermort=mathfloor(argentgagnermort/dureepartie)
			print("dureepartie "..dureepartie)
			if argentgagnermort==0 then
				argentgagnermort=1
			end
			if not clicsurpiece then
				if contreai==1 then
					if isoldat[numero].pole~=0 then
						argentai=argentai+(-(argentgagnermort)*3)
					else
						argent=argent+(-(argentgagnermort)*3)
						vartune()
						--tune.text=-argent/3 --.." d'or"
					end
				else

					argent=argent+(-(argentgagnermort)*3)
					vartune()
					--tune.text=-argent/3 --.." d'or"
				end
			else
				local pieceacliquer=display.newImage(imbouton.monnaie,3)
				pieceacliquer.x=isoldat[numero].x1+isoldat[numero].direction*isoldat[numero].centrex+7-mathrandom(15)
				pieceacliquer.y=isoldat[numero].y1+isoldat[numero].centrey+7-mathrandom(15)+10 -- le +10 pour la postion de l'ombre
				pieceacliquer.xScale=0.2
				pieceacliquer.yScale=pieceacliquer.xScale*0.36
				local rectanglepiece=display.newRect(group[2],pieceacliquer.x,pieceacliquer.y,pieceacliquer.xScale*pieceacliquer.width*2,pieceacliquer.yScale*pieceacliquer.height*2)
				rectanglepiece.isVisible=false
				rectanglepiece.isHitTestable = true
				
				pieceacliquer.group=2 --mathfloor(pieceor.y)+1024+5
				group[2]:insert(pieceacliquer)
				pieceacliquer.cpt=0
				rectanglepiece.tune=argentgagnermort
				local pieceacliquerfini=false
				local num
				local function destrucblood2(event)
					if not pieceacliquerfini then
						if pieceacliquer.cpt<75 and not findelapartie and not removepartiel1 then
							pieceacliquer.cpt=pieceacliquer.cpt+1
							local destrucblood2=timer.performWithDelay(100,destrucblood2)
							num=timerpause(1,destrucblood2,num)
						else
							jeupause.timerlibre[num]=0
							group[pieceacliquer.group]:remove(rectanglepiece) 
							rectanglepiece:removeSelf()
							rectanglepiece=nil
							group[pieceacliquer.group]:remove(pieceacliquer) 
							pieceacliquer:removeSelf()
							pieceacliquer=nil
						end
					end
				end
				local destrucblood2=timer.performWithDelay(100,destrucblood2)
				num=timerpause(1,destrucblood2,nil)
				local function onObjectTap( event )
					jeupause.timerlibre[num]=0
					pieceacliquerfini=true
					fricanim(2,event.target.x,event.target.y)
					group[pieceacliquer.group]:remove(rectanglepiece) 
					rectanglepiece:removeSelf()
					rectanglepiece=nil
					group[pieceacliquer.group]:remove(pieceacliquer) 
					pieceacliquer:removeSelf()
					pieceacliquer=nil
					if contreai==1 then
						if isoldat[numero].pole~=0 then
							argentai=argentai+(-(event.target.tune)*3)
						else
							argent=argent+(-(event.target.tune)*3)
							vartune()
							--tune.text=-argent/3 --.." d'or"
						end
					else
						argent=argent+(-(event.target.tune)*3)
						vartune()
						--tune.text=-argent/3 --.." d'or"
					end
				    return true
				end
				rectanglepiece:addEventListener( "tap", onObjectTap )
			end
			--tune:removeSelf( )
			--tune=display.newText( argent,actualcontentwidth-100, 10, native.systemFontBold, 12 )
			if isoldat[numero].typesoldat==237 then -- capacité special spawn mini mi
				if isoldat[numero].taillesquelette>1 then
					numerut=true
					for i=1,2 do
						if isoldat[numero].taillesquelette==2 then
							spawnsoldat(numero,237)
						else
							spawnsoldat(numero,277+isoldat[numero].taillesquelette)
						end
					end
					local poussiere=display.newImage(imbouton.ombresld,1)
					poussiere.xScale=0.23
					poussiere.yScale=poussiere.xScale
					poussiere:setFillColor(0)
					poussiere.x=isoldat[numero].x1+isoldat[numero].centrex
					poussiere.y=isoldat[numero].y1+isoldat[numero].centrey
					local latransition=transition.to(poussiere,{time=1200*vitessejeuin,transition=easing.inCubic,xScale=0.01,yScale=0.01,onComplete=destructeurpartieltran,onCancel=destructeurpartieltran,tag="elementtype"})
					poussiere.group=mathfloor(poussiere.y-30+1024)
					group[poussiere.group]:insert(poussiere)
					if jeupause.etat==1 then
						transition.pause(latransition)
					end
				end
			elseif isoldat[numero].typesoldat==241 then
				numerut=true
				spawnsoldat(numero,240)
			elseif isoldat[numero].typesoldat==242 then
				numerut=true
				spawnsoldat(numero,241)
			elseif isoldat[numero].typesoldat==243 then
				numerut=true
				spawnsoldat(numero,242)
			elseif isoldat[numero].typesoldat==221 then
				numerut=true
				for i=1,8 do
					spawnsoldat(numero,220)
				end
			elseif isoldat[numero].typesoldat==224 then
				numerut=true
				spawnsoldat(numero,222)
				affsang(numero,3)
				affbrouillard(numero)
				affbrouillard(numero)
			end
			if image[isoldat[numero].typesoldat].transition~=nil then
				local sequenceData
				if image[isoldat[numero].typesoldat].transitionseq==nil then
					sequenceData=
					{
					name="transition",
					frames= {1,2,3}, -- frame indexes of animation, in image sheet
					time = 1500,           -- Optional. In ms.  If not supplied, then sprite is frame-based.
					loopCount =1        -- Optional. Default is 0.
					}
				else
					sequenceData=image[isoldat[numero].typesoldat].transitionseq
				end
				local sheet1 =image[isoldat[numero].typesoldat].transition-- graphics.newImageSheet( "batiment/projectiles/foudre.png", { width=50, height=50, numFrames=2 } )
				local transitionsoldat=display.newSprite(sheet1,sequenceData)
				if goh then
					transitionsoldat.anchorY=1
				end
				local scaletra=1
				if image[isoldat[numero].typesoldat].transscale~=nil then
					scaletra=image[isoldat[numero].typesoldat].transscale
				end
				transitionsoldat.x=isoldat[numero].x1
				transitionsoldat.y=isoldat[numero].y1
				transitionsoldat.yScale=isoldat[numero].scale*scaletra
				transitionsoldat.xScale=transitionsoldat.yScale*isoldat[numero].direction
				print("direction soldat "..isoldat[numero].direction)
				transitionsoldat.group=mathfloor(transitionsoldat.y)+1024
				group[transitionsoldat.group]:insert(transitionsoldat)
				spritegestion(transitionsoldat)
				-- transitionsoldat:play()
				-- transitionsoldat.pause1=0
				-- local function spriteListener( event )
				-- 	if jeupause.etat==1 then--technique numero 3 de mise en pause(plus de probleme avec les processeurs mtk et probleme de deferencement)
				-- 		if transitionsoldat.pause1==0 then
				-- 			transitionsoldat.pause1=1
				-- 			transitionsoldat:pause()
				-- 		end
				-- 	else
				-- 		if transitionsoldat.pause1==1 then
				-- 			transitionsoldat.pause1=0
				-- 			--if fpschoisi<=1 then
				-- 				transitionsoldat:play()
				-- 			--end
				-- 		end
				-- 		if transitionsoldat.frame==3 then
				-- 			group[transitionsoldat.group]:remove(transitionsoldat)
				-- 			transitionsoldat:removeSelf()
				-- 			transitionsoldat=nil
				-- 			Runtime:removeEventListener( "enterFrame",spriteListener)
				-- 		end
				-- 	end
				-- end
				-- Runtime:addEventListener("enterFrame",spriteListener)
				-- -- Add sprite listener
				-- transitionsoldat:addEventListener( "sprite", spriteListener )
				print("play")
			end
			if isoldat[numero].typesoldat==272 or isoldat[numero].typesoldat==126 or isoldat[numero].typesoldat==127 or isoldat[numero].typesoldat==128 then
				orientation=0
				if isoldat[numero].typesoldat==272 then
					orientation=-1
				end
				local mini=1
				local maxi=nbsoldat
				if isoldat[numero].orientation==1 then
					mini=nbsoldatg
					maxi=0
				end	
				for i=mini,maxi do
				--for i=1,nbsoldat,1 do
					if isoldat[i].vivant==true and isoldat[i].vie>0 and i~=numero and isoldat[numero].pole==isoldat[i].pole then --and orientation~=isoldat[i].orientation then -- and (zone1==isoldat[i].zone1 or zone2==isoldat[i].zone2) then
						
						local ennemimine=false
						if isoldat[i].mine and isoldat[numero].ennemi==i then
							ennemimine=true
						end

						local distanceprosold=mathabs((isoldat[i].x1+isoldat[i].direction*isoldat[i].centrex)-(isoldat[numero].x1+isoldat[numero].direction*isoldat[numero].centrex))+mathabs((isoldat[i].y1+isoldat[i].centrey)-(isoldat[numero].y1+isoldat[numero].centrey))
						
						if isoldat[numero].blocnbennemi>distanceprosold or ennemimine then
							if isoldat[i].mine then
								pertevie(i,300)
							else
								if distanceprosold<1 then
									distanceprosold=1
								end
								local attaquereel=mathfloor(isoldat[numero].attaque*(isoldat[numero].blocnbennemi+3)/(isoldat[numero].blocnbennemi+1.5*distanceprosold))
								print("soldat "..i.." perd "..attaquereel)
								pertevie(i,attaquereel)
							end
						end
						print("distanceprosold "..distanceprosold)
					end
				end
			end
		end
		--isoldat[numero].vie=0
		isoldat[numero].rectvie.width=0
		isoldat[numero].rectvie.alpha=0
		if isoldat[numero].orientation==0 and (savegameall.xpactive or isoldat[numero].gene==1)  then
			isoldat[numero].rectxp.width=0
			isoldat[numero].rectxp.alpha=0
		end
		--print("le soldat ",numero,"est mort")
		if isoldat[numero].ennemi~=0 then
			isoldat[isoldat[numero].ennemi].nbennemi=isoldat[isoldat[numero].ennemi].nbennemi-1
		end
		isoldat[numero].ennemi=0
		isoldat[numero].ennemipb=false
		isoldat[numero].nbennemi=0
		local letimer=nil
		---- regeneration des soldats mort qui sortent des tours
		if isoldat[numero].orientation==0 and not modearmy then
			--print("entrer")

			-- debut retourdinformation
			retinf.nbperte=retinf.nbperte+1
			-- fin retourdinformation

			if isoldat[numero].classe<4 or (isoldat[numero].classe>=7 and numero==genenum) then
				--print("entrer1")
				if isoldat[numero].classe>=7 then
					-- geneb.isVisible=false
					isoldat[numero].endeplacement=0

					-- debut retourdinformation
					retinf.nbgenemort=retinf.nbgenemort+1
					-- fin retourdinformation
				end
				local sup=0
				local i=0
				--print("entrer2")
				local num
				local level=isoldat[numero].level
				if level==nil or (isoldat[numero].classe>=7 and numero==genenum) then
					level=1
				end
				
				local tempsderespawn=(2/(1+4*math.exp(-0.3*(level-6)))+1)*isoldat[numero].regene
				print("tempsderespawn "..tempsderespawn.." image[isoldat[numero].regene "..isoldat[numero].regene)
				local function listener( event )
					if removepartiel1==false then
					if isoldat[numero].classe<4 then
						if ibatiment[isoldat[numero].numbat].supprimer==1 then --or ibatiment[isoldat[numero].numbat].evol==1 then
							sup=1
							--isoldat[numero].remp=1--permet de liberer
							--print("gentil num liberer"..numero)
							i=100
						end
						if ibatiment[isoldat[numero].numbat].niveau~=isoldat[numero].niveau then --or ibatiment[numero].evol==1 then
							sup=1
							i=100
						end
					end
					if sup==0 then
						if i<tempsderespawn then --image[isoldat[numero].typesoldat].regene then
							--print(i)
							i=i+1
							letimer=timer.performWithDelay( 500*vitessejeuin, listener )
							local num1=timerpause(1,letimer,num)
							--jeupause.timer[num]=letimer
							--jeupause.timerlibre[num]=1
						else
							jeupause.timerlibre[num]=0
							if i>=tempsderespawn then --image[isoldat[numero].typesoldat].regene then
								--local require()
								local hello=nil
								if isoldat[numero].classe<7 then
									if savegameall.xpactive then
										print("\n\n\n\nisoldat[numero].levelb"..level)
										hello=soldat1.new(numero,isoldat[numero].typesoldat,isoldat[numero].numbat,isoldat[numero].pole,level)--local 
									else
										hello=soldat1.new(numero,isoldat[numero].typesoldat,isoldat[numero].numbat,isoldat[numero].pole)
									end
								else
									-- geneb.isVisible=true

									hello=soldat1.new(numero,isoldat[numero].typesoldat,isoldat[numero].pole)
								end
								hello:debut(numero)
								if isoldat[numero].classe==7 then
									if isoldat[numero].pierretombale~=nil then
										if isoldat[numero].pierretombale~=nil then
											group[isoldat[numero].pierretombale.group]:remove(isoldat[numero].pierretombale)
											isoldat[numero].pierretombale:removeSelf()
											isoldat[numero].pierretombale=nil
										end
									end
									animationapparition(isoldat[numero].x1,isoldat[numero].y1,2)
								end
								--print("soldat regenerer")
							end
						end
					end
					--print("le soldat va etre generer")
				else
					jeupause.timerlibre[num]=0
				end
				end
				letimer=timer.performWithDelay( 500*vitessejeuin, listener )
				num=timerpause(1,letimer,nil)
			elseif isoldat[numero].classe>=6 then
				libnum(numero)
			else
				print("un renfort est mort")
			end
		end
		if isoldat[genenum].typesoldat==174 then
			print("le bon general\n\n\n\n")
			if isoldat[genenum].vivant and isoldat[numero].orientation~=isoldat[genenum].orientation then
				print("fpschoisicycle "..fpschoisicycle.." fpschoisi"..fpschoisi)
				if fpschoisicycle==0 and (fpschoisi-vitessejeu)<1.2 then
				if isoldat[numero].typesoldat~=237 and isoldat[numero].typesoldat~=222 and isoldat[numero].typesoldat~=223 and isoldat[numero].typesoldat~=224 then
					print("etape 3\n\n\n\n")
					if (isoldat[numero].x1-isoldat[genenum].x1)^2+(isoldat[numero].y1-isoldat[genenum].y1)^2<2500 then
						numerut=true
						local typedesoldat
						local minalea=0
						if isoldat[genenum].level>18 then
							minalea=isoldat[genenum].level-18
							if minalea>9 then
								minalea=9
							end
						end
						local maxalea=isoldat[genenum].level
						if maxalea>18 then
							maxalea=18
						end
						local valeuralea=mathrandom(minalea,maxalea)
						if valeuralea<10 then
							typedesoldat=237
						elseif valeuralea<15 then
							typedesoldat=222
						elseif valeuralea<18 then
							typedesoldat=223
						else
							typedesoldat=224
						end
						local numnew=spawnsoldat(numero,typedesoldat,nil,0)
						-- for i=1,4 do
						-- 	spawnsoldat(numero,140)
						-- end
						convertunit(numnew)
						animationlevelup(isoldat[numero].x1+isoldat[numero].centrex,isoldat[numero].y1+isoldat[numero].centrey,2)
						local maxrandom=3
						if retinf.attgene>100 then
							maxrandom=3+(retinf.attgene*0.01)^0.2
							if maxrandom>10 then
								maxrandom=10
							end
						end
						isoldat[numnew].xposi=isoldat[numnew].xposi*mathrandom(1,maxrandom)
						isoldat[numnew].yposi=isoldat[numnew].yposi*mathrandom(1,maxrandom)
					end
				end
				end
			end
		end
		if isoldat[numero].orientation==1 then -- and not numerut then--liberation d'un numero
			libnum(numero)
		end
		if not numerut then
			print("numero non dispo")
		end
	end
	end
end
function pertevie(numerobis,attaque,poussiereact)--enlever des vies à un soldat, poussiereact nil pour normal, 0 pour normal (sang + brouillard), 1 pour ne pas afficher fumé, 2 ni brouillard ni sang
	local vieenlever=attaque
	if poussiereact==nil then
		poussiereact=0
	end
	--if modeinfini then
		--if modeinfdif==0 then
			if varattgent~=1 then
				if isoldat[numerobis].orientation==1 then
					attaque=attaque*varattgent
				else
					attaque=attaque/varattgent
				end
			end
		--end
	--end
	print("soldat "..numerobis.." perd "..attaque)
	isoldat[numerobis].vie=isoldat[numerobis].vie-mathfloor(attaque)
	if isoldat[numerobis].vie>0 then 						 -- si le soldat est vivant : diminution et changement de couleur de sa barre de vie
		if isoldat[numerobis].mine==false then
			if poussiereact<2 then
				affsang(numerobis)
			end
			if fpschoisicycle<2 then
				-- local function destrucblood1(event)
				-- 		group[2048]:remove(groupsang)
				-- 		groupsang:removeSelf()
				-- 		groupsang=nil
				-- end
				-- local destrucblood=timer.performWithDelay(500,destrucblood1)

			 	isoldat[numerobis].rectvie.width=mathfloor(isoldat[numerobis].vie/isoldat[numerobis].vietotale*20)
				isoldat[numerobis].rectvie.alpha=1
				isoldat[numerobis].rectvie:setFillColor(1-isoldat[numerobis].vie/isoldat[numerobis].vietotale,isoldat[numerobis].vie/isoldat[numerobis].vietotale,0 )
				if affinfotab.num==numerobis and affinfotab.type==0 and affinfogr.isVisible then
					affinfo(numerobis,true,true)
				end
			else
				isoldat[numerobis].rectvie.alpha=0
			end
		else
			local etatan=false
			print("vie enlever a la mine")
			if ibatiment[isoldat[numerobis].numbat].etat==-1 then
				if not goh then
					ibatiment[isoldat[numerobis].numbat].anim=display.newSprite(effetexplo.ff,effetexplo.ffseq)
				else
					ibatiment[isoldat[numerobis].numbat].anim=display.newSprite(effetexplo.fl1,effetexplo.fl1seq)
				end
				ibatiment[isoldat[numerobis].numbat].anim:setSequence("levelup")
				ibatiment[isoldat[numerobis].numbat].anim.x=ibatiment[isoldat[numerobis].numbat].xf
				ibatiment[isoldat[numerobis].numbat].anim.y=ibatiment[isoldat[numerobis].numbat].yf
				if not goh then
					ibatiment[isoldat[numerobis].numbat].anim.xScale=-0.4 --ibatiment[isoldat[numerobis].numbat].xScale
					ibatiment[isoldat[numerobis].numbat].anim.yScale=0.01 --feupassesoldat[imin].yScale
					ibatiment[isoldat[numerobis].numbat].anim.yScale1=0.35 --ibatiment[isoldat[numerobis].numbat].yScale
				else
					ibatiment[isoldat[numerobis].numbat].anim.xScale=0.2
					ibatiment[isoldat[numerobis].numbat].anim.yScale1=0.17
					ibatiment[isoldat[numerobis].numbat].anim.yScale=0.01 --feupassesoldat[imin].yScale
				end
				ibatiment[isoldat[numerobis].numbat].anim.xScale1=ibatiment[isoldat[numerobis].numbat].anim.xScale
				ibatiment[isoldat[numerobis].numbat].anim.alpha=0
				ibatiment[isoldat[numerobis].numbat].anim.group=mathfloor(ibatiment[isoldat[numerobis].numbat].y1+1024)
				group[ibatiment[isoldat[numerobis].numbat].anim.group]:insert(ibatiment[isoldat[numerobis].numbat].anim)
				spritegestion(ibatiment[isoldat[numerobis].numbat].anim,-1) -- ajouter option pour fuilidifier
				ibatiment[isoldat[numerobis].numbat].etat=0
				etatan=true
				print("sprite mise en route")
			end
			if ibatiment[isoldat[numerobis].numbat].etat<9.5-10*(isoldat[numerobis].vie/isoldat[numerobis].vietotale) or etatan then
				ibatiment[isoldat[numerobis].numbat].anim.isVisible=true
				ibatiment[isoldat[numerobis].numbat].etat=ibatiment[isoldat[numerobis].numbat].etat+1
				ibatiment[isoldat[numerobis].numbat].anim.yScale1=ibatiment[isoldat[numerobis].numbat].anim.yScale1+0.05
				ibatiment[isoldat[numerobis].numbat].anim.xScale1=ibatiment[isoldat[numerobis].numbat].anim.xScale1-0.05
				ibatiment[isoldat[numerobis].numbat].anim.y1=ibatiment[isoldat[numerobis].numbat].yf-ibatiment[isoldat[numerobis].numbat].anim.height*ibatiment[isoldat[numerobis].numbat].anim.yScale1*0.5
				--feupassesoldat[imin].anim.xScale1=feupassesoldat[imin].anim.xScale1+0.5
				if fpschoisi<1.3 then
					-- print("fpschoisi "..fpschoisi.." feupassesoldat[imin].anim.yScale="..feupassesoldat[imin].anim.yScale)
					local latransition1=transition.to(ibatiment[isoldat[numerobis].numbat].anim,{time=500*vitessejeuin,alpha=0.9,y=ibatiment[isoldat[numerobis].numbat].anim.y1,xScale=ibatiment[isoldat[numerobis].numbat].anim.xScale1,yScale=ibatiment[isoldat[numerobis].numbat].anim.yScale1,tag="elementtype"})
					if jeupause.etat==1 then
						transition.pause(latransition1)
					end
				else
					ibatiment[isoldat[numerobis].numbat].anim.yScale=ibatiment[isoldat[numerobis].numbat].anim.yScale1
					ibatiment[isoldat[numerobis].numbat].anim.xScale=ibatiment[isoldat[numerobis].numbat].anim.xScale1
					ibatiment[isoldat[numerobis].numbat].anim.y=ibatiment[isoldat[numerobis].numbat].anim.y1
					ibatiment[isoldat[numerobis].numbat].anim.alpha=0.9
					--	print("fpschoisi "..fpschoisi.." feupassesoldat[imin].anim.yScale="..feupassesoldat[imin].anim.yScale.." feupassesoldat[imin].anim.xScale="..feupassesoldat[imin].anim.xScale)
				end
				print("animation mise en route")
			end
		end
	else
		
		local coef=1
		if varattgent~=1 then
			if isoldat[numerobis].orientation==1 then
				coef=varattgent
			else
				coef=varattgent
			end
		end
		vieenlever=vieenlever+isoldat[numerobis].vie/coef
		if isoldat[numerobis].mine==true then
			--print("vie-mine")
			if ibatiment[isoldat[numerobis].numbat].chargement1.cpt>0 then
				ibatiment[isoldat[numerobis].numbat].argentcum=0
				ibatiment[isoldat[numerobis].numbat].chargement1.cpt=0
				ibatiment[isoldat[numerobis].numbat].chargement1.height=ibatiment[isoldat[numerobis].numbat].chargement1.cpt*0.5
				ibatiment[isoldat[numerobis].numbat].chargement1.y=ibatiment[isoldat[numerobis].numbat].y1+25-ibatiment[isoldat[numerobis].numbat].chargement1.cpt*0.25
				--ibatiment[isoldat[numerobis].numbat].chargement1.y=ibatiment[isoldat[numerobis].numbat].y+25-ibatiment[isoldat[numerobis].numbat].chargement1.cpt/2
			end
		end
		--isoldat[numerobis].rectvie.width=0
		--isoldat[numerobis].rectvie.alpha=0		 
		
		if affinfotab.num==numerobis and affinfotab.type==0 and affinfogr.isVisible then
			isoldat[numerobis].vie=0
			affinfogr.isVisible=false
			--affinfo(numerobis)
		end
		mort(numerobis)
	end
	if isoldat[numerobis].mine==true then
		local calcul=mathfloor(isoldat[numerobis].vie/isoldat[numerobis].vietotale*40)
		if calcul<=0 then
			calcul=1
		end
		isoldat[numerobis].rectvie.width=calcul

		isoldat[numerobis].rectvie.alpha=1
		isoldat[numerobis].rectvie:setFillColor(1-isoldat[numerobis].vie/isoldat[numerobis].vietotale,isoldat[numerobis].vie/isoldat[numerobis].vietotale,0 )
		if affinfotab.num==numerobis and affinfotab.type==1 then
			affinfo(numerobis)
		end
		--print("vie-mine"..isoldat[numerobis].rectvie.width)
		if ibatiment[isoldat[numerobis].numbat].chargement1.cpt>0 then
			ibatiment[isoldat[numerobis].numbat].argentcum=ibatiment[isoldat[numerobis].numbat].argentcum-ibatiment[isoldat[numerobis].numbat].argentsec
			if ibatiment[isoldat[numerobis].numbat].argentcum<0 then
				ibatiment[isoldat[numerobis].numbat].argentcum=0
			end
			ibatiment[isoldat[numerobis].numbat].chargement1.cpt=ibatiment[isoldat[numerobis].numbat].chargement1.cpt-1
			ibatiment[isoldat[numerobis].numbat].chargement1.height=ibatiment[isoldat[numerobis].numbat].chargement1.cpt*0.5
			ibatiment[isoldat[numerobis].numbat].chargement1.y=ibatiment[isoldat[numerobis].numbat].y1+25-ibatiment[isoldat[numerobis].numbat].chargement1.cpt*0.25
		end
	end
	if poussiereact==0 then
		affbrouillard(numerobis)
	end
	return vieenlever
end
function enlevevie(numero,attaque) -- si general quand enleve vie on va la dedans atrtaque reel sans coef de bonus pour reequilibre le jeu
	if isoldat[numero].gene==1 and generaltest==0 then
		savegamedev[isoldat[numero].numdev]=savegamedev[isoldat[numero].numdev]+attaque
		print("le general a maintenant "..savegamedev[isoldat[numero].numdev].." d'experience")
		local j=1
		while savegamedev[isoldat[numero].numdev]>=savegameall.generalxp[isoldat[numero].level] and j<5 do
			isoldat[numero].level=isoldat[numero].level+1
			print("general passe au niveau "..isoldat[numero].level.." avec une experience de "..savegamedev[isoldat[numero].numdev])
			--savegamedev[isoldat[numero].numdev]=mathfloor(savegamedev[isoldat[numero].numdev])
			animationlevelup(isoldat[numero].x1,isoldat[numero].y1,1)
			print("vie avant: "..isoldat[numero].vie.." attaque "..isoldat[numero].attaque)
			if isoldat[numero].charge==0 then
				isoldat[numero].attaque=mathfloor(isoldat[numero].attaque*1.1)
			else
				isoldat[numero].attaque=mathfloor(isoldat[numero].attaque*1.05)
				isoldat[numero].charge=mathfloor(isoldat[numero].charge*1.05)
			end
			isoldat[numero].attsec=mathfloor(isoldat[numero].attaque*1000/isoldat[numero].timeatt*(isoldat[numero].attnbennemi^0.7)+isoldat[numero].charge/4)
			isoldat[numero].vietotale=mathfloor(isoldat[numero].vietotale*1.1)
			print("vie apres: "..isoldat[numero].vietotale.." attaque "..isoldat[numero].attaque)
			j=j+1
		end
		local largeurbar=isoldat[numero].level
		if largeurbar==1 then
			largeurbar=mathfloor(savegamedev[isoldat[numero].numdev]/savegameall.generalxp[largeurbar]*10)*0.1
		else
			largeurbar=mathfloor((savegamedev[isoldat[numero].numdev]-savegameall.generalxp[largeurbar-1])/(savegameall.generalxp[largeurbar]-savegameall.generalxp[largeurbar-1])*10)*0.1
		end
		isoldat[numero].rectxp.width=20*largeurbar
		isoldat[numero].rectxp.alpha=1
	elseif savegameall.xpactive then -- and isoldat[numero].classe<7 then
		local coefxp=1
		if isoldat[numero].classe<4 then
			coefxp=ibatiment[isoldat[numero].numbat].nbunit/ibatiment[isoldat[numero].numbat].niveau
		end
		if isoldat[numero].xp==nil then
			isoldat[numero].xp=0
		end
		isoldat[numero].xp=isoldat[numero].xp+attaque*coefxp*modexp
		local j=1
		while isoldat[numero].xp>=savegameall.unitxp[isoldat[numero].level] and j<5 do
			isoldat[numero].xp=mathfloor(isoldat[numero].xp-savegameall.unitxp[isoldat[numero].level])
			isoldat[numero].level=isoldat[numero].level+1
			animationlevelup(isoldat[numero].x1,isoldat[numero].y1,0.2)
			-- ici ma gueule
			isoldat[numero].attaque=mathfloor(isoldat[numero].attaque*1.1)
			isoldat[numero].attsec=mathfloor(isoldat[numero].attaque*1000/isoldat[numero].timeatt*(isoldat[numero].attnbennemi^0.7)+isoldat[numero].charge/4)
			isoldat[numero].vietotale=mathfloor(isoldat[numero].vietotale*1.1)
			j=j+1
		end
		isoldat[numero].rectxp.width=20*mathfloor(isoldat[numero].xp/savegameall.unitxp[isoldat[numero].level]*10)*0.1
		isoldat[numero].rectxp.alpha=1
	end
end
function convertunit(numero,typeconvert) --typeconvert nil ou true pour raliment au general, false pour independant
	if typeconvert==nil then 
		typeconvert=true
	end
	print("convertunit "..numero)
	if numero>0 then
		local numerotrouver=findnbsoldat(0)
		isoldat[num]=copy(isoldat[numero])
		isoldat[numero].vivant=false
		isoldat[numero].reut=true
		numero=num
	end
	print("converti unit "..numero)
	isoldat[numero].orientation=0

	if typeconvert then
		isoldat[numero].classe=7
	else
		isoldat[numero].classe=6
		isoldat[numero].coorx=isoldat[numero].x1+2*isoldat[numero].xposi
		isoldat[numero].coory=isoldat[numero].y1+2*isoldat[numero].yposi
	end
	isoldat[numero].xp=0
	isoldat[numero].level=1
	if isoldat[numero].rectxp==nil and savegameall.xpactive then
		isoldat[numero].rectxp=display.newRect(genepoint.x-5, genepoint.y+18, 0, 1 )
	elseif savegameall.xpactive then
		isoldat[numero].rectxp.x=genepoint.x-5
		isoldat[numero].rectxp.y=genepoint.y+18
		isoldat[numero].rectxp.width=0
	end
	if savegameall.xpactive then
		isoldat[numero].rectxp.isVisible=true
		isoldat[numero].rectxp:setFillColor( 0,0,1 )
		isoldat[numero].rectxp.alpha=0
		group[isoldat[numero].numgroup]:insert(isoldat[numero].rectxp)
	end
	if typeconvert then
		isoldat[numero].endeplacement=1
		isoldat[numero].vivant=false
	end
	-- if isoldat[numero].endeplacement==1 then
	-- 	isoldat[numero].encombat=0
	-- 	if isoldat[numero].ennemi~=0 then
	-- 		if isoldat[isoldat[numero].ennemi].ennemicombat==numero then
	-- 			isoldat[isoldat[numero].ennemi].ennemicombat=0
	-- 		end
	-- 	end
	-- 	isoldat[numero].ennemi=0
	-- 	isoldat[numero].nbennemi=0
	-- 	isoldat[numero].x1=isoldat[numero].x1-isoldat[numero].centrex
	-- 	isoldat[numero].y1=isoldat[numero].y1-isoldat[numero].centrey
	-- 	retouractnormale(numero)
	-- 	--instance1.supprimer=1
	-- end
end
destructeurpartieltran=function(obj)
	display.remove(obj)
	-- group[obj.group]:remove(obj)
	-- obj:removeSelf()
	obj=nil
end
end
t.animdepbis = function()
local a=1
end
return t