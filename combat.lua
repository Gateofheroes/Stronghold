local t={}--gestion des combats entre soldat
if not functionload then
local animdep2=require("animdepbis")
local animdep3=require("animdepter")
--local soldatt=require("soldat")
local pause1=require("pause")
function combatbis(numero,numero1,pointx,pointy,fixcoor)
	print("combat numero "..numero)
	isoldat[numero].encombat=1
	isoldat[numero].reut=false
	local sheet1=isoldat[numero].attgauche  --=graphics.newImageSheet( "AnimVF/mechant/veteran/Veteranatg.png", { width=162, height=226, numFrames=5 } )
	if sheet1==nil then
		sheet1=isoldat[numero].tir.atttir
	end
	-- if isoldat[numero].x1 <= isoldat[numero1].x1 then
	-- 	sheet1 = isoldat[numero].attdroite--graphics.newImageSheet( "Golematg.png", { width=378, height=333, numFrames=6 })--
	-- else
	-- 	sheet1 = isoldat[numero].attgauche--graphics.newImageSheet( "Golematd.png", { width=378, height=333, numFrames=6 } )
	-- end
	local sequenceData=seqdata
	local finatt
	--print("numframe"..isoldat[numero].numframe)
	if image[isoldat[numero].typesoldat].attanim==0 then
		sequenceData.frames=image[isoldat[numero].typesoldat].attanimordre--frames= {1,4,5,3}, -- frame indexes of animation, in image sheet
		if image[isoldat[numero].typesoldat].finatt~=nil then
			finatt=image[isoldat[numero].typesoldat].finatt
		else
			finatt=image[isoldat[numero].typesoldat].numframe-2
		end
    	--print("attauque anim 0")
	else
		--print("attaque anim :"..isoldat[numero].attanim.." "..isoldat[numero].numframe.." "..image[201].numframe.." "..isoldat[numero].typesoldat)
		--print("sequence data"..isoldat[numero].numframe)
		--sequenceData=seqdata--sequence.att[isoldat[numero].attanim][isoldat[numero].numframe]
		sequenceData.frames=sequence.att[image[isoldat[numero].typesoldat].attanim][image[isoldat[numero].typesoldat].numframe].frames--ordreframes
		if not goh then 
			finatt=1+image[isoldat[numero].typesoldat].numframe
		else
			finatt=image[isoldat[numero].typesoldat].numframe-1
		end
	end
	sequenceData.time=isoldat[numero].timeatt --*vitessejeuin
	local instance1 = display.newSprite( sheet1, sequenceData )
	print("sequence soldat attaque"..instance1.sequence)
	instance1.xScale=isoldat[numero].scale*image[isoldat[numero].typesoldat].attscale
	instance1.yScale=instance1.xScale
	instance1.timeScale=vitessejeu
	isoldat[numero].tscale=vitessejeuin
	isoldat[numero].tscalein=vitessejeu
	if isoldat[numero].orientation==0 and vitessejeu>1.2 then
		isoldat[numero].tscalein=isoldat[numero].tscalein*0.9
	end
	-- if fpschoisicycle==0 then
	-- 	if isoldat[numero].orientation==1 then
	-- 		instance1.alpha=0.95
	-- 	else
	-- 		instance1.alpha=0.95
	-- 	end
	-- 	--print("transparent")
	-- end
	--test:

	-- if isoldat[numero].x1+isoldat[numero].centrex <= isoldat[numero1].x1+isoldat[numero1].centrex then
	-- 	instance1.xScale=-instance1.xScale
	-- 	isoldat[numero].direction=-1
	-- 	--sheet1 = isoldat[numero].attdroite--graphics.newImageSheet( "Golematg.png", { width=378, height=333, numFrames=6 })--
	-- else
	-- 	isoldat[numero].direction=1
	-- 	--sheet1 = isoldat[numero].attgauche--graphics.newImageSheet( "Golematd.png", { width=378, height=333, numFrames=6 } )
	-- end
	isoldat[numero1].ennemicombat=numero
	if not fixcoor then
		if isoldat[numero1].ennemi~=numero or isoldat[isoldat[numero].ennemi].mine==true then
			if isoldat[numero].x1+isoldat[numero].centrex <= isoldat[numero1].x1+isoldat[numero1].centrex*isoldat[numero1].direction then
				isoldat[numero].direction=-1
			else
				isoldat[numero].direction=1
			end
			if isoldat[numero1].mine==true then
				--print("dist mine "..((isoldat[numero1].x1)-(isoldat[numero].x1+isoldat[numero].direction*isoldat[numero].centrex))^2+((isoldat[numero1].y1)-(isoldat[numero].y1-isoldat[numero].centrey))^2)
				if 4300<((isoldat[numero1].x1)-(isoldat[numero].x1+isoldat[numero].direction*isoldat[numero].centrex))^2+((isoldat[numero1].y1)-(isoldat[numero].y1-isoldat[numero].centrey))^2 or mathrandom(3)==1 then
					isoldat[numero].x1=isoldat[numero1].x1+(isoldat[numero].centrex+45)*isoldat[numero].direction+mathrandom(20)-10
					isoldat[numero].y1=isoldat[numero1].y1+mathrandom(20)-10
					print("correctif")
				end
			end
			-- instance1.x=isoldat[numero].x1+(isoldat[numero].attx+isoldat[numero].centrex)*isoldat[numero].direction
			-- instance1.y=isoldat[numero].y1+isoldat[numero].atty+isoldat[numero].centrey
		else
			--test:
			if isoldat[numero1].encombat==1 then
				isoldat[numero].direction=-isoldat[numero1].direction
				print("-direction"..isoldat[numero].orientation.." "..isoldat[numero].direction.." "..isoldat[numero].scale)
			else
				
				print("direction"..isoldat[numero].orientation)
				if isoldat[numero].x1<=isoldat[numero1].x1 then --isoldat[numero].x1+isoldat[numero].centrex <= isoldat[numero1].x1+isoldat[numero1].centrex*isoldat[numero1].direction then
					isoldat[numero].direction=-1
				else
					isoldat[numero].direction=1
				end
			end
			local offsetx
			if not goh then
				offsetx=(isoldat[numero1].centrex-5)
			else
				offsetx=-isoldat[numero].width*0.25-isoldat[numero1].width*0.25
			end

			isoldat[numero].x1=isoldat[numero1].x1+offsetx*(-isoldat[numero].direction)
			isoldat[numero].y1=isoldat[numero1].y1+isoldat[numero1].centrey-isoldat[numero].centrey
			
			-- instance1.xScale=instance1.xScale*isoldat[numero].direction
			-- instance1.x=isoldat[numero1].x1+(isoldat[numero1].centrex-5)*isoldat[numero1].direction+(isoldat[numero].attx+isoldat[numero].centrex)*isoldat[numero].direction
			-- instance1.y=isoldat[numero1].y1+(isoldat[numero1].centrey+isoldat[numero1].atty)-(isoldat[numero].atty+isoldat[numero].centrey)
			-- isoldat[numero].x1=isoldat[numero1].x1+(isoldat[numero1].centrex-5)*isoldat[numero1].direction --isoldat[numero1].x1-(-isoldat[numero].attx+isoldat[numero1].centrex*isoldat[numero1].direction) --instance1.x
			-- isoldat[numero].y1=isoldat[numero1].y1+(isoldat[numero1].centrey+isoldat[numero1].atty) --isoldat[numero1].y1+isoldat[numero1].centrey-isoldat[numero].atty --instance1.y
		end
	end
	if goh then
		instance1.anchorY=1
	end
	instance1.x=isoldat[numero].x1+(image[isoldat[numero].typesoldat].attx+isoldat[numero].centrex)*isoldat[numero].direction
	instance1.y=isoldat[numero].y1+image[isoldat[numero].typesoldat].atty+isoldat[numero].centrey
	instance1.xScale=instance1.xScale*isoldat[numero].direction
	if not fixcoor then
		isoldat[numero].ombre.x=isoldat[numero].x1+isoldat[numero].direction*isoldat[numero].centrex
		if goh then
			isoldat[numero].ombre.y=isoldat[numero].y1+isoldat[numero].centrey
			isoldat[numero].rectvie.y=isoldat[numero].y1-2-isoldat[numero].height
		else
			isoldat[numero].ombre.y=isoldat[numero].y1+10+isoldat[numero].centrey
			isoldat[numero].rectvie.y=isoldat[numero].y1-10-isoldat[numero].centrey
		end
		isoldat[numero].rectvie.x=isoldat[numero].x1-5+isoldat[numero].direction*isoldat[numero].centrex
		if isoldat[numero].orientation==0 and (savegameall.xpactive or isoldat[numero].gene==1)  then
			isoldat[numero].rectxp.x=isoldat[numero].x1-5+isoldat[numero].direction*isoldat[numero].centrex
			if goh then
				isoldat[numero].rectxp.y=isoldat[numero].rectvie.y+2
			else
				isoldat[numero].rectxp.y=isoldat[numero].y1-8-isoldat[numero].centrey
			end
		end
	end
	instance1.compteur=3
	instance1.att=0
	instance1.testenne=0
	--instance1.evol=0
	instance1.batsupr=0
	instance1.gros=0
	instance1.supprimer=0
	instance1.pause1=0
	instance1.gagner=0--quand le soldat gagne un combat (effet de dep pas en meme temps que les autre soldats qui se battent en meme temps)
	instance1.num1nbenn=isoldat[numero1].nbennemi--nombre d'adversaire qu'a l'adversaire
	 pouvoirgros(numero,instance1)--initialisation
	 instance1.frameold=1
	 instance1.premiercoup=0

	 sonattds=sonattds+1
	 local alea=mathrandom(4)
	 audio.play( son.combatsword[alea],{channel=2+alea}) --mathrandom(3,4)})
	 print("lancement d'un combat de "..numero.." et "..numero1.." type "..isoldat[numero].typesoldat)
	local function moveun(event)--listener sur le rafraichissement de l'affichage
		--print("out")
		if jeupause.etat==1 then--technique numero 3 de mise en pause(plus de probleme avec les processeurs mtk et probleme de deferencement)
			if instance1.pause1==0 then
				instance1.pause1=1
				instance1:pause()
			end
		else
			if instance1.pause1==1 then
				instance1.pause1=0
				instance1.timeScale=vitessejeu
				isoldat[numero].tscale=vitessejeuin
				isoldat[numero].tscalein=vitessejeu
				if isoldat[numero].orientation==0 and vitessejeu>1.2 then
					isoldat[numero].tscalein=isoldat[numero].tscalein*0.9
				end
				instance1:play()
			end
			if instance1.frameold~=instance1.frame then
				--print("in")
				
				--if instance1.pause1==0 then
				if isoldat[numero].vie>0 and isoldat[numero].vivant==true then 
					if isoldat[numero1].mine==true then
						isoldat[numero1].encombat=1
					end
					if isoldat[numero].cpt3==20 then
						 pouvoirgros(numero,instance1)
					end
					--permet de generer l'attaque au bon moment
					if isoldat[numero].typesoldat==178 then
						print("\n\nimage en cours == "..instance1.frame)
					end
					if instance1.frame>=finatt then --isoldat[numero].numframevie then --
						--if instance1.premiercoup==1 then
							if instance1.att==0 then
								instance1.att=1
							end
						--else
						--	instance1.premiercoup=1
						--end
					elseif instance1.att==-1 then--plus utile avec l optimisatio (a verifier)
						instance1.att=0
					end
					--attaque
					if instance1.att==1 then

						sonattds=sonattds+1
						local alea=mathrandom(4)
						audio.play( son.combatsword[alea],{channel=alea+2})
						
						instance1.att=-1
						--if instance1.compteur==isoldat[numero].numframe+3 then
						local vieenlever=0
						if isoldat[numero1].vie>0 then
							print("soldat "..numero1.." perd vie de "..numero)
							if isoldat[numero].typesoldat==101 then
								print("soldat 101 num\n\n\n\n\n\n\n\n")
							end
							vieenlever=pertevie(numero1,isoldat[numero].attaque*0.5*(vitessejeu/isoldat[numero].tscalein)) --(1+vitessejeuin-isoldat[numero].tscale)) --(1+fpschoisi-isoldat[numero].tscale)) --*fpschoisi)--ne pas diviser par 2
							--print("fpschoisi "..fpschoisi)
							if isoldat[numero1].vivant==false then
								if isoldat[numero].typesoldat==238 or isoldat[numero].typesoldat==239 then
									--un zombie a tué un gentil
									spawnsoldat(numero,238)
								elseif isoldat[numero].typesoldat==245 then
									-- une plante tue un gentil
									spawnsoldat(numero,246)
									spawnsoldat(numero,247)
									spawnsoldat(numero,248)
								end
							end
							animmortchoix(numero1,numero,1)
						end
						-- debut retourinformation
						if isoldat[numero].orientation==0 then
							--print("enleve vie de "..numero1.."de la part"..numero)
							if isoldat[numero].classe<4 then
								ibatiment[isoldat[numero].numbat].vieenlever=ibatiment[isoldat[numero].numbat].vieenlever+vieenlever --*(1+fpschoisi-isoldat[numero].tscale)
							elseif isoldat[numero].classe<7 then
								--vie enlever par le pv1
								retinf.attpv1=retinf.attpv1+vieenlever --*(1+fpschoisi-isoldat[numero].tscale)
							else
								retinf.attgene=retinf.attgene+vieenlever --*(1+fpschoisi-isoldat[numero].tscale)
								--vie enlever par le general
							end	
							enlevevie(numero,vieenlever) --*(1+fpschoisi-isoldat[numero].tscale))
						end
							if isoldat[numero].typesoldat==272 or isoldat[numero].typesoldat==126 or isoldat[numero].typesoldat==127 or isoldat[numero].typesoldat==128 then
								-- for i=1,nbsoldat,1 do
								-- 	if isoldat[i].vivant==true and isoldat[numero].pole==isoldat[i].pole then -- and (zone1==isoldat[i].zone1 or zone2==isoldat[i].zone2) then
								-- 		local distanceprosold=mathabs((isoldat[i].x1+isoldat[i].direction*isoldat[i].centrex)-(isoldat[numero].x1+isoldat[numero].direction*isoldat[numero].centrex))+mathabs((isoldat[i].y1+isoldat[i].centrey)-(isoldat[numero].y1+isoldat[numero].centrey))
								-- 		if isoldat[numero].blocnbennemi>distanceprosold then
								-- 			if distanceprosold<1 then
								-- 				distanceprosold=1
								-- 			end
								-- 			local attaquereel=mathfloor(isoldat[numero].attaque*(isoldat[numero].blocnbennemi+3)/(isoldat[numero].blocnbennemi+2*distanceprosold))
								-- 			print("soldat "..i.." perd "..attaquereel)
								-- 			pertevie(i,attaquereel)
								-- 		end
								-- 		print("distanceprosold "..distanceprosold)
								-- 	end
								-- end
								print("kamikaze")
								isoldat[numero].vie=0
								pertevie(numero,1)
							end
						--end
						-- fin retourdinformation
						
						if isoldat[numero].attnbennemi>1 then
							print("\n\n\nnum "..numero.." attque (nombre d'ennemi"..isoldat[numero].attnbennemi.." type "..isoldat[numero].typesoldat)
							local rayonatt=20
							if isoldat[numero].typesoldat==178 then
								rayonatt=50
								local poussiere=display.newImage(impro.poussiere,1)
								poussiere.xScale=0.01
								poussiere.yScale=poussiere.xScale
								poussiere.alpha=1
								poussiere:setFillColor(0)
								poussiere.x=isoldat[numero].x1+isoldat[numero].centrex*isoldat[numero].direction*2+20*isoldat[numero].direction
								poussiere.y=isoldat[numero].y1+isoldat[numero].centrey+10
								local latransition=transition.to(poussiere,{time=300*vitessejeuin,transition=easing.outQuad,alpha=0.5,xScale=0.20,yScale=0.20,onComplete=destructeurpartieltran,onCancel=destructeurpartieltran,tag="elementtype"})
								poussiere.group=mathfloor(poussiere.y-10+1024)
								group[poussiere.group]:insert(poussiere)
								if jeupause.etat==1 then
									transition.pause(latransition)
								end
							end
							local nbennemiattaque=1
							local mini=1
							local maxi=nbsoldat
							if isoldat[numero].orientation==1 then
								mini=nbsoldatg
								maxi=0
							end
							for i=mini,maxi do
							--while i<=nbsoldat do
								if isoldat[i].orientation~=isoldat[numero].orientation and isoldat[i].encombat==1 and isoldat[numero].ennemi~=i and isoldat[i].vivant then
									if isoldat[i].ennemi==numero or rayonatt>mathabs((isoldat[i].x1+isoldat[i].direction*isoldat[i].centrex)-(isoldat[numero].x1+isoldat[numero].direction*isoldat[numero].centrex))+mathabs((isoldat[i].y1+isoldat[i].centrey)-(isoldat[numero].y1+isoldat[numero].centrey)) then
										nbennemiattaque=nbennemiattaque+1
										--print("enleve vie de "..numero1.."de la part"..numero)
										-- debut retourinformation
										local vieenlever=pertevie(i,isoldat[numero].attaque*0.5*(vitessejeu/isoldat[numero].tscalein))  --(1+vitessejeuin-isoldat[numero].tscale)) --(1+fpschoisi-isoldat[numero].tscale))--*fpschoisi)--ne pas diviser par 2
										if isoldat[numero].orientation==0 then
											--print("enleve vie de "..numero1.."de la part"..numero)
											if isoldat[numero].classe<4 then
												ibatiment[isoldat[numero].numbat].vieenlever=ibatiment[isoldat[numero].numbat].vieenlever+vieenlever --*(1+fpschoisi-isoldat[numero].tscale)--*fpschoisi
											elseif isoldat[numero].classe<7 then
												--vie enlever par le pv1
												retinf.attpv1=retinf.attpv1+vieenlever --*(1+fpschoisi-isoldat[numero].tscale)--*fpschoisi
											else
												enlevevie(numero,vieenlever) --*(1+fpschoisi-isoldat[numero].tscale))
												retinf.attgene=retinf.attgene+vieenlever --*(1+fpschoisi-isoldat[numero].tscale)--*fpschoisi
												--vie enlever par le general
											end	
										end
										animmortchoix(i,numero,2)
										-- fin retourdinformation
										print("soldat "..i.." perd vie de "..numero.." ( "..isoldat[numero].typesoldat.." ) attaque multiple ".."ennemi a pour ennemi "..isoldat[i].ennemi.."distance de "..((isoldat[i].x1+isoldat[i].direction*isoldat[i].centrex)-(isoldat[numero].x1+isoldat[numero].direction*isoldat[numero].centrex))+((isoldat[i].y1+isoldat[i].centrey)-(isoldat[numero].y1+isoldat[numero].centrey)))
										
										if nbennemiattaque>=isoldat[numero].attnbennemi then -- (0.25-1) -0.75 -> 4 -- 4/1
											--i=nbsoldat+2									 -- (1-0.25) 0.75 -> 0.25 -- 1/4
											break
										end
									end
								end
							end
							if isoldat[numero].typesoldat==179 then
								for i=-3,3 do
									affbrouillardglob(numero,isoldat[numero].x1+isoldat[numero].centrex*isoldat[numero].direction*2+20*isoldat[numero].direction+i*10,isoldat[numero].y1+isoldat[numero].centrey+10+i*5,isoldat[numero].numgroup)
								end
							end
						end
					end
					if isoldat[numero].cpt3==20 and  isoldat[numero].orientation==0 and isoldat[numero].classe<4 and instance1.supprimer==0 then
						if ibatiment[isoldat[numero].numbat].supprimer==1 then
							instance1.batsupr=1
							isoldat[numero].vivant=false
							isoldat[numero].vie=0-- -133
							instance1.supprimer=1
							libnum(numero)
						end
					end
				elseif isoldat[numero].classe>=7 then
					if isoldat[numero].endeplacement==1 then
						isoldat[numero].encombat=0
						if isoldat[numero1].ennemicombat==numero then
							isoldat[numero1].ennemicombat=0
						end
						isoldat[numero].ennemi=0
						isoldat[numero].nbennemi=0
						isoldat[numero].ennemipb=false
						isoldat[numero].x1=isoldat[numero].x1 -- -isoldat[numero].centrex
						isoldat[numero].y1=isoldat[numero].y1 -- -isoldat[numero].centrey
						retouractnormale(numero,true)
						instance1.supprimer=1
					end
				elseif isoldat[numero].classe<4 then
					if isoldat[numero].endeplacement==1 then
						isoldat[numero].encombat=0
						if isoldat[numero1].ennemicombat==numero then
							isoldat[numero1].ennemicombat=0
						end
						isoldat[numero].ennemi=0
						isoldat[numero].nbennemi=0
						isoldat[numero].ennemipb=false
						isoldat[numero].x1=isoldat[numero].x1 -- -isoldat[numero].centrex
						isoldat[numero].y1=isoldat[numero].y1-- -isoldat[numero].centrey
						retouractnormale(numero,true)
						instance1.supprimer=1
					end 
				end
				--cas ou le soldat est mort
				if isoldat[numero].vie<=0 then
					print("je suis mort")
					if isoldat[numero1].mine==true then
						isoldat[numero1].encombat=0
					end
					isoldat[numero].ombre.isVisible=false
					if isoldat[numero].orientation==0  and (savegameall.xpactive or isoldat[numero].gene==1) then
						isoldat[numero].rectxp.width=0
						isoldat[numero].rectxp.alpha=0
					end
					isoldat[numero].rectvie.width=0
					isoldat[numero].rectvie.alpha=0
					isoldat[numero].encombat=0
					if isoldat[numero1].ennemicombat==numero then
						isoldat[numero1].ennemicombat=0
					end
					isoldat[numero].ennemi=0
					isoldat[numero].ennemipb=false
					if instance1.supprimer==0 then
						instance1.supprimer=1
					end
					if isoldat[numero].vivant==true then
						mort(numero)
					end
				end
				if instance1.num1nbenn<2 then
					instance1.num1nbenn=isoldat[numero1].nbennemi
				end
				--cas ou l'adversaire est mort
				if instance1.frame>=image[isoldat[numero].typesoldat].numframe or instance1.frameold>instance1.frame then --isoldat[numero].numframevie then --
					--if instance1.premiercoup==1 then
						if instance1.testenne==0 then
							instance1.testenne=1
						end
					--else
					--	instance1.premiercoup=1
					--end
				elseif instance1.testenne==-1 then--plus utile avec l optimisatio (a verifier)
					instance1.testenne=0
				end
				--attaque
				if instance1.testenne==1 then
				--if instance1.frame==image[isoldat[numero].typesoldat].numframe then
					instance1.testenne=-1
					if (isoldat[numero1].vie<=0 or isoldat[numero1].vivant==false) and instance1.supprimer==0 then--or isoldat[numero1].ennemi==0  then
						print("l'ennemi est mort")
						if isoldat[numero1].mine==true then
							isoldat[numero1].encombat=0
						end
						instance1.supprimer=1
						isoldat[numero].encombat=0
						--local evol=instance1.evol
						if isoldat[numero1].orientation==0 then
							isoldat[numero1].rectvie.width=0
							isoldat[numero1].rectvie.alpha=0
						end
						isoldat[numero1].rectvie.width=0
						isoldat[numero1].rectvie.alpha=0
						if isoldat[numero1].vivant==true then
							mort(numero1)
						end
						--isoldat[numero1].ennemi=0
						if isoldat[numero1].ennemicombat==numero then
							isoldat[numero1].ennemicombat=0
						end
						isoldat[numero].ennemi=0
						isoldat[numero].ennemipb=false
						isoldat[numero].randeffety=0
						isoldat[numero].randeffetx=0
						--print("retouractnormale")
						--print(numero)

						-- trouve des adversaires se battant contre lui
						local mini=1
						local maxi=nbsoldat
						if isoldat[numero].orientation==1 then
							mini=nbsoldatg
							maxi=0
						end
						local tableennemi={}
						for i2=mini,maxi,1 do
							if isoldat[i2].encombat==1 then
								if isoldat[i2].ennemi==numero and isoldat[i2].vivant==true then
									print("add "..i2)
									tableennemi[#tableennemi+1]=i2
								end
							end
						end
						print("#tableennemi "..#tableennemi)
						local ennemitrouve=0
						local direction=false -- direction opposé
						if #tableennemi>1 then
							print("size >1")
							local distmin=10000000
							local directionlocal=false
							local distancelocal
							for i,v in ipairs(tableennemi) do
								print("v "..v)
								directionlocal=false
								if isoldat[v].direction~=isoldat[numero].direction then
									directionlocal=true
									--direction=true
								end
								if not direction or directionlocal then
									local xennemi=(isoldat[v].x1+(image[isoldat[v].typesoldat].attx+isoldat[v].centrex)*isoldat[v].direction)
									local yennemi=(isoldat[v].y1+image[isoldat[v].typesoldat].atty+isoldat[v].centrey)
									local xnumero=instance1.x
									local ynumero=instance1.y
									if goh then
										xennemi=xennemi-isoldat[v].width*0.25*isoldat[v].direction
										xnumero=instance1.x-isoldat[numero].width*0.25*isoldat[numero].direction
									end
									distancelocal=(xnumero-xennemi)^2+(1.25*(instance1.y-yennemi))^2
									if distmin>distancelocal or (not direction and directionlocal) then
										if directionlocal then
											direction=true
										end
										distmin=distancelocal
										ennemitrouve=v
									end
								end
							end
						elseif #tableennemi==1 then
							print("here")
							ennemitrouve=tableennemi[#tableennemi]
							if isoldat[ennemitrouve].direction~=isoldat[numero].direction then
								direction=true
							end
							print("ajoute "..ennemitrouve)
						end
						if ennemitrouve~=0 then
							print("ennemitrouve "..ennemitrouve)
							isoldat[numero].ennemi=ennemitrouve
							if direction then
								isoldat[numero].encombat=1
								instance1.supprimer=0
								numero1=ennemitrouve
							else
								instance1.attsuite=true

								--combatbis(numero,isoldat[numero].ennemi,0,0,direction)
							end
						else
							if instance1.num1nbenn>=2 then
								print("instance1.num1nbenn>=2")
								instance1.gagner=1
								local num
								local function retnorm( event )
									jeupause.timerlibre[num]=0
									--if isoldat[numero].tir~=0 then
					 				--	isoldat[numero].tir.tirer=2
									--end
									if isoldat[numero].tir~=0 then
										--isoldat[numero].tir.tirer=1
										isoldat[numero].tir.tirer=0
									end
									--print("retouractnormale2"..numero)
									isoldat[numero].x1=isoldat[numero].x1 -- -isoldat[numero].centrex
									isoldat[numero].y1=isoldat[numero].y1 -- -isoldat[numero].centrey
									retouractnormale(numero,true)
								end
								retnorm=timer.performWithDelay( isoldat[numero].effetvern*20, retnorm )
								num=timerpause(1,retnorm,nil)
							else
								print("retouractnormale1"..numero)
								isoldat[numero].x1=isoldat[numero].x1 -- -isoldat[numero].centrex
								isoldat[numero].y1=isoldat[numero].y1 -- -isoldat[numero].centrey
								retouractnormale(numero,true)
							end	
						end	
					end
				end

				instance1.frameold=instance1.frame
				--supression de l'instance
				if instance1.supprimer==1 then
					local continuelance=false or instance1.attsuite 
					Runtime:removeEventListener( "enterFrame",moveun)
					Runtime:removeEventListener( "tap",tapsoldat)
					Runtime:removeEventListener("touch",instance1)
					if instance1.isFocus~=nil then
						if instance1.isFocus then
							print("instance1.isFocus ")
							display.getCurrentStage():setFocus( nil )
							instance1.isFocus = false
							if genedrap~=nil then
								group[genedrap.group]:remove(genedrap)
								genedrap:removeSelf()
								genedrap=nil
								genetap=0
							end
							if solenmov then
								removesoldrap()
								solenmov=false
							end
						else
							print("not instance1.isFocus")
						end
					end
					if instance1.gagner==1 then
						instance1:pause()
						local function retnorm1( event )
							instance1:removeSelf()
							instance1=nil
						end
						retnorm1=timer.performWithDelay( isoldat[numero].effetvern*20, retnorm1 )
					else
						instance1:removeSelf()
						instance1=nil
					end	
					if continuelance then
						--retouractnormale(numero,true)
						combatbis(numero,isoldat[numero].ennemi,0,0)
					end	
				else
					isoldat[numero].cpt3=isoldat[numero].cpt3+1
					if isoldat[numero].cpt3>20 then
						isoldat[numero].cpt3=0
					end
				end
			end
		end
	end

	instance1:play()
	group[isoldat[numero].numgroup]:remove( isoldat[numero].rectvie )
	if isoldat[numero].orientation==0 and (savegameall.xpactive or isoldat[numero].gene==1)  then
		group[isoldat[numero].numgroup]:remove( isoldat[numero].rectxp )
	end
	isoldat[numero].numgroup=mathfloor(isoldat[numero].y1+isoldat[numero].centrey)+1024 --mathfloor(isoldat[numero].y1)+1024
	group[isoldat[numero].numgroup]:insert(instance1)
	
	group[isoldat[numero].numgroup]:insert( isoldat[numero].rectvie)
	if isoldat[numero].orientation==0 and (savegameall.xpactive or isoldat[numero].gene==1)  then
		group[isoldat[numero].numgroup]:insert( isoldat[numero].rectxp)
	end
	Runtime:addEventListener("enterFrame",moveun)
	local function tapsoldat( event )
		instance1.fill.effect = "filter.sepia"
		instance1.fill.effect.intensity=-2.5
		transition.to(instance1.fill.effect, { time=500, intensity=0 } )
		affinfo(numero,true,true)
		affinfotab.num=numero
		affinfotab.type=0
		if genenum==numero then
			if contreaihaut==0 or contreai==1 then --and contreaihaut==1) then
				genetaptest(event)
				--geneb:addEventListener( "tap", geneb )
				print("contreaihaut 1")
			else
				print("contreaihaut 0")
			end
		end
	end
	instance1:addEventListener( "tap", tapsoldat )
	if contreaihaut==0 or contreai==1 then
		if numero==genenum then
			print("créé un listener" )
			function instance1:touch(event)
				--print("dans la fonction ori")
				if event.phase=="began" then
					print("swipe sur gene")
					--print("began endeplacement"..self.statique)
					display.getCurrentStage():setFocus( self )
					self.isFocus = true
					generalenmov1=true
					local function timerdefocus(event)
						generalenmov1=false
					end
					timer.performWithDelay( 400, timerdefocus)
				else
					--print("phase "..event.phase)
				end
				print("phase "..event.phase)
				--print("self "..self.x)
				if event.phase~="cancelled" then
					generalmove(event,self)
				end
				if event.phase=="ended" or event.phase=="cancelled" then
					display.getCurrentStage():setFocus( nil )
					self.isFocus = false
					print("fin de deplacement du gene")
					if genedrap~=nil then
						group[genedrap.group]:remove(genedrap)
						genedrap:removeSelf()
						genedrap=nil
						genetap=0
					end
					generalenmov=false
				end
			end
			instance1:addEventListener( "touch",instance1)
			print("cree les listener")
		elseif isoldat[numero].orientation==0 and isoldat[numero].classe<4  and isoldat[numero].numbat>0 then
			function instance1:touch(event)
				--print("dans la fonction ori")
				if event.phase=="began" and event.target.supprimer==0 and fenaff==false and  clicpause==0 and pv1clic==0 and pv2clic==0 and pv3clic==0 and clicconstruire==0 and clicinfanterie==0 and clicarcher==0 and clicpouvoir1==0 and clicpouvoir2==0 and clicpouvoir3==0 and pv2clicactiver==0 and pv1clicactiver==0 and boutondev==0 and drapeausolclic==0 then 
					print("swipe sur sol")
					solenmov=true
					--print("began endeplacement"..self.statique)
					display.getCurrentStage():setFocus( self )
					self.isFocus = true
					solenmov1=true
					local function timerdefocus(event)
						solenmov1=false
					end
					timer.performWithDelay( 400, timerdefocus)
				else
					--print("phase "..event.phase)
				end
				print("phase "..event.phase)
				--print("self "..self.x)
				if event.phase~="cancelled" and solenmov then
					soldatdeplacer(event,self)
				end
				if event.phase=="ended" or event.phase=="cancelled" or event.target.supprimer==1 then
					display.getCurrentStage():setFocus( nil )
					self.isFocus = false
					if solenmov then
						local event1=event
						event1.phase="ended"
						soldatdeplacer(event1,self)
					end
					solenmov=false
					print("fin de deplacement du sol")
				end
			end
			instance1.id=numero
			instance1:addEventListener( "touch",instance1)
		end
	end
	t=1
	--isoldat[numero].encombat=0
end
end
t.combat = function(numero,numero1,pointx,pointy)--numero=le personnage et numero1 est l'adversaire

end


return t