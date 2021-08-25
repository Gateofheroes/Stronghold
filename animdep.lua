local t={}--gestion du deplacement du personnage(anim plus interaction avec les autres personnages)
--determnie et genere l'anim de deplacement par rapport a la direction   Il faut trouver le moyen de renvoyer, l'anim
local function troisdimensiondepgoh(instance1,angle,numero)
	local angle1=0
	local angleabs=mathabs(angle)
	local angleoffset
	local angleoffsetsigne=1
	local anglesigne=1
	local dirx=1
	if instance1.xScale<0 then
		dirx=-1
	end
	if angle<0 then
		anglesigne=-1
	end
	if angle<0 then --or isoldat[numero].orientation==0 then
	else
		angle=0
		angleabs=0
		anglesigne=-anglesigne
	end
	if angleabs<30 then
		angle1=(30-angleabs)*(-anglesigne)*dirx
	elseif angleabs>70 then
		angle1=(angleabs-70)*(-anglesigne)*(-dirx)
	end
	--print("angle "..angle1)

 	local valeur0a20=angle1/3

 	local anglefinal=valeur0a20
	if instance1.rotateangle~=nil then
		anglefinal=valeur0a20-instance1.rotateangle
	end
	instance1:rotate(anglefinal)
	instance1.rotateangle=valeur0a20
end

local function troisdimensiondep(instance1,angle,numero)
	local angle1=angle
 	if angle>65 then 
 		angle=angle-(angle-65)*(angle-65) --^2-- -((angle-65)/(90-angle)*90/25)
 		if angle<1 then
 			angle=0
 		end
 	elseif angle<-65 then
 		angle=-angle
 		angle=angle-(angle-65)*(angle-65) --^2-- -((angle-65)/(90-angle)*90/25)
 		if angle<1 then
 			angle=0
 		end
 		angle=-angle
 		--angle=-(angle-((angle-65)/(90-angle)*90/25))
 	end

 	local valeur0a20=angle/4.5
 	--instance1.xScale=instance1.xScale*(1-valeur0a20/100)
 	--valeur0a20=4*valeur0a20
 	local angle2=angle1
 	if angle1<0 then
 		angle2=-angle2
 	end
 	if (fpschoisi-vitessejeu)<1.5 then
	 	local valeursqrt=mathsqrt(angle2*20+1)*isoldat[numero].eff3D -- mathsqrt(valeur0a20*isoldat[numero].eff3D*4)
	 	instance1.path.x1=valeursqrt
	 	instance1.path.x2=valeursqrt
	 	instance1.path.x3=-valeursqrt
	 	instance1.path.x4=-valeursqrt
	 	if angle1<0 then
	 		valeursqrt=-valeursqrt
	 	end
	 	instance1.path.y1=valeursqrt
	 	instance1.path.y2=-valeursqrt
	 	instance1.path.y3=valeursqrt
	 	instance1.path.y4=-valeursqrt
	end
 	if instance1.xScale<0 then
 		valeur0a20=-valeur0a20
 	end
 	local anglefinal=valeur0a20
	if instance1.rotateangle~=nil then
		anglefinal=valeur0a20-instance1.rotateangle
	end
	instance1:rotate(anglefinal)
	instance1.rotateangle=valeur0a20
end
local function calcabngledep(x1,x2,y1,y2,orientation)
	local angle,distance
	local condition=true
	if x2==nil then
		condition=false
		distance=1000
		angle=0
		x2=x1
	end
	while condition do
		distance=mathsqrt((x2-x1)*(x2-x1)+(y2-y1)*(y2-y1))
		if distance==0 then
		 	distance=1000
		end
		angle=math.acos((x2-x1)/distance)*180/3.14
		if y2>y1 then
			angle=-angle
		end
		if angle<110 and angle>70 and distance>60 and distance~=1000 and orientation==1 then
			--print("distance "..distance)
			x2=x2+((mathrandom(0,1)*2)-1)*5
		else
			condition=false
		end
	end
	--print("distancef "..distance.." angle "..angle)
	return angle,distance,x2
end
local function troisdimensionstat(instance1)
	instance1.path.x1=0
 	instance1.path.x2=0
 	instance1.path.x3=0
 	instance1.path.x4=0
 	instance1.path.y1=0
 	instance1.path.y2=0
 	instance1.path.y3=0
 	instance1.path.y4=0
 	local valeur0a20=0
 	local anglefinal=0
	if instance1.rotateangle~=nil then
		anglefinal=valeur0a20-instance1.rotateangle
	end
	instance1:rotate(anglefinal)
	instance1.rotateangle=valeur0a20
end
local function attributionzone(numero,x,y)
	local zone1bis=(y)/619*2 --deux données en une
	local zone1y=mathfloor(zone1bis)+2
	local zone2y=mathfloor((zone1bis)+0.5)+2
	zone1bis=(x)/1229*3 --deux données en une
	local zone1x=mathfloor(zone1bis)+3
	local zone2x=mathfloor(zone1bis+0.5)+3
	isoldat[numero].zone1=zone1y*4+zone1x
	isoldat[numero].zone2=zone2y*4+zone2x
	isoldat[numero].zone3=zone2y*4+zone1x
	isoldat[numero].zone4=zone1y*4+zone2x
end
local function redirect(instance1,x1,x2,y1,y2,numero)
	if genenum==numero then
		--print("numero "..numero.." x1 "..x1.." x2 "..x2.." y1 "..y1.." y2 "..y2)
	end
	--local animdep2=require("animdepbis")
	local directionold=isoldat[numero].direction
	 local xy=nil
	 local direction=1
	 local angle,distance,x2=calcabngledep(x1,x2,y1,y2,isoldat[numero].orientation)
				--print("angle "..angle)
	--end
	 -- local vectx=x2-x1
	 -- local vecty=y2-y1
	 -- local distance=mathsqrt(vectx*vectx+vecty*vecty)

	 local dirx=(x2-x1)/distance--(y1-y2)
	 local diro=(y2-y1)/distance--(x1-x2)
	 local dir1,dir2
	 if(x1>x2)then
		dir1=1
	 else
		dir1=2
		direction=-1
	 end
	 if(y1>y2)then
		dir2=1
	  else
		dir2=2
	 end

	 local absc=0--on a atteint le point
	 local ordo=0--on a atteint le point

	 local statique=nil
	 if x1-x2<20 and x1-x2>-20 and y1-y2>-20 and y1-y2<20 and isoldat[numero].orientation==0 then
		statique=1--1 si le personnage ne bouge pas
		isoldat[numero].effetvern=isoldat[numero].effetdure
		isoldat[numero].effetvern=0
		isoldat[numero].effetvero=0
		-- isoldat[numero].ombre.xScale=isoldat[numero].tailleombre
		-- isoldat[numero].effetdure*0.5*0.5
		isoldat[numero].ombre.xScale=isoldat[numero].tailleombre -- +isoldat[numero].effetimpact*0.15*isoldat[numero].effetdure*0.35

	else
		statique=0
	end
	-- if statique==0 then
	-- 	--if dir1==1 then
			
	-- 	--else
	-- 		--sheet1=isoldat[numero].depgauche
	-- 		--sheet1=isoldat[numero].depdroite
	-- 	end
	-- elseif mathrandom(0,2)>1 then
	-- 	sheet1=isoldat[numero].depgauche
	-- else
	-- 	sheet1=isoldat[numero].depgauche
	-- 	--sheet1=isoldat[numero].depdroite
	-- end
	isoldat[numero].direction=direction
	if statique==0 then
		if dir1==1 then
			isoldat[numero].direction=1
		else
			isoldat[numero].direction=-1
		end
		-- isoldat[numero].endeplacement=0
	-- elseif mathrandom(0,2)>1 then
	-- 	isoldat[numero].direction=1
	-- else
	-- 	isoldat[numero].direction=-1
	end
	local instance1init=false
	if instance1==nil then
		-- local sheet1=nil --graphics.newImageSheet( "AnimVF/mechant/veteran/Veteranmvmd.png", { width=154, height=219, numFrames=6 } )
		-- sheet1=isoldat[numero].depgauche
		local sequenceData={}
		if goh then
			sequenceData=sequence.infwalk
			if image[isoldat[numero].typesoldat].typedep==1 then
				sequenceData=sequence.cavgent
			elseif image[isoldat[numero].typesoldat].typedep==-1 then
				sequenceData=sequence.elf2
			elseif image[isoldat[numero].typesoldat].typedep==2 then
				sequenceData=sequence.golem
			elseif image[isoldat[numero].typesoldat].typedep==3 then
				sequenceData=sequence.araigne
			elseif image[isoldat[numero].typesoldat].typedep==4 then
				sequenceData=sequence.ours
			elseif image[isoldat[numero].typesoldat].typedep==5 then
				sequenceData=sequence.rhino
			elseif image[isoldat[numero].typesoldat].typedep==6 then
				sequenceData=sequence.chien
			end
		else
			if image[isoldat[numero].typesoldat].typedep==1 then
				sequenceData=sequence.cavgent
				print("set sequence cavgent")
			elseif image[isoldat[numero].typesoldat].typedep==2 then
				sequenceData =sequence.cav
			elseif image[isoldat[numero].typesoldat].typedep==3 then
				sequenceData=sequence.araigne
			elseif image[isoldat[numero].typesoldat].typedep==4 then
				sequenceData=sequence.dragon
			else
				if isoldat[numero].orientation==0 then
					sequenceData=sequence.inf
				else
					sequenceData=sequence.infme
				end
			end
		end
		instance1 = display.newSprite(isoldat[numero].depgauche, sequenceData )
		if goh then
			instance1.anchorY=1
			isoldat[numero].height=instance1.height*isoldat[numero].scale
			isoldat[numero].width=instance1.width*isoldat[numero].scale
		end
	else
		instance1init=true
	end
	if instance1init==false then
		instance1.x = x1--absc
	end
	-- if fpschoisicycle==0 then
	-- 	if isoldat[numero].orientation==1 then
	-- 		instance1.alpha=0.95
	-- 	else
	-- 		instance1.alpha=0.95
	-- 	end
	-- 	--print("transparent")
	-- end
	instance1.statique=statique
	if not instance1init then
		instance1.y = y1--ordo
		isoldat[numero].y1=instance1.y
		instance1.y=instance1.y+isoldat[numero].effetvero -- +isoldat[numero].centrey
		isoldat[numero].x1=instance1.x
		--instance1.x=instance1.x+isoldat[numero].centrex
		isoldat[numero].rectvie.x=isoldat[numero].x1-5+isoldat[numero].direction*isoldat[numero].centrex
		if goh then
			isoldat[numero].rectvie.y=isoldat[numero].y1-2-isoldat[numero].height
		else
			isoldat[numero].rectvie.y=isoldat[numero].y1-20+isoldat[numero].centrey
		end
		if isoldat[numero].orientation==0 and (savegameall.xpactive or isoldat[numero].gene==1) then
			isoldat[numero].rectxp.x=isoldat[numero].x1-5+isoldat[numero].direction*isoldat[numero].centrex
			if goh then
				isoldat[numero].rectxp.y=isoldat[numero].rectvie.y+2
			else
				isoldat[numero].rectxp.y=isoldat[numero].y1-18+isoldat[numero].centrey
			end
		end
	end
	-- if genenum==numero then
	-- 	if genepoint.nb==-2 then
	-- 		geneb=display.newRect(instance1.x, instance1.y, 45, 45 )
	-- 		geneb.xScale=apparence
	-- 		geneb.yScale=apparence
	-- 		print("apparence "..apparence)
	-- 		group[1]:insert(geneb)
	-- 		geneb.alpha=0.01
	-- 		genepoint.nb=-1
	-- 		general=require("general")
	-- 		general:general()
	-- 	else
	-- 		geneb.x=instance1.x
	-- 		geneb.y=instance1.y
	-- 	end
	-- 	print("fonction general")
	-- end
	instance1.x2=x2
	instance1.y2=y2
	instance1.diro=diro
	instance1.dirx=dirx
	instance1.absc=absc
	instance1.ordo=ordo
	instance1.dir1=dir1
	instance1.dir2=dir2
	isoldat[numero].reut=false
	if isoldat[numero].scale<0.05 then
		isoldat[numero].scale=0.05
		print("le scale du personnage num"..numero.." de type "..isoldat[numero].typesoldat)
	end
	instance1.xScale=isoldat[numero].scale*isoldat[numero].direction
	instance1.yScale=isoldat[numero].scale 
	--print("xScale4")


	isoldat[numero].cpt1=3--10--recalcul pour trouver d'un adversaire
	isoldat[numero].cpt2=0--compte le nb de fois que cpt1 atteint son max
	instance1.effet=0--test d'effet
	instance1.gros=0--grossisement des soldats lors de l'activation du pouvoir 3
	instance1.supression=0
	instance1.pause1=0
	instance1.pausecpt=0
	local fin=0
	local ennemideb=nil--es ce que le soldat à un ennemi en debut d'instance
	if isoldat[numero].orientation==0 and isoldat[numero].classe>7 then
		--print("general dans animdep")
	end
	 pouvoirgros(numero,instance1)
	 if isoldat[numero].tir~=0 then
	 	instance1.cpttir=isoldat[numero].tir.cadence
	 	isoldat[numero].tir.tirer=0
	 	isoldat[numero].tir.ennemi=0
	 	--timersoldatatt(numero,1)
	 	isoldat[numero].tir.test=1
	 	isoldat[numero].tir.instance=instance1
	 end
	 if not instance1init then
		isoldat[numero].ombre.x=instance1.x+isoldat[numero].direction*isoldat[numero].centrex
		if goh then
			isoldat[numero].ombre.y=instance1.y+isoldat[numero].centrey
		else
			isoldat[numero].ombre.y=instance1.y+10+isoldat[numero].centrey
		end
	end
	if fpschoisicycle~=0 or ((fpschoisi-vitessejeu)>1.3 and isoldat[numero].pole~=0) then
		isoldat[numero].ombre.isVisible=false
		-- print("ombre pas aff")
	else
		-- print("ombre aff "..fpschoisicycle.." "..fpschoisi)
	end

	instance1.frameold=nil
	instance1.nouveau=true
	isoldat[numero].cptbase=0
	attributionzone(numero,instance1.x,instance1.y)
	if angle>90 then
		angle=180-angle
	elseif angle<-90 then
		angle=-180-angle
	end
	if instance1.statique==1 then
		isoldat[numero].ombre.x=instance1.x+isoldat[numero].direction*isoldat[numero].centrex
		if goh then
			isoldat[numero].ombre.y=instance1.y+isoldat[numero].centrey
		else	
			isoldat[numero].ombre.y=instance1.y+10+isoldat[numero].centrey
		end
	end

	--print("typesoldat "..isoldat[numero].typesoldat)
	if goh then
		if instance1.statique==1 then
			if instance1.sequence~="arret" then
				instance1:setSequence( "arret" )
			end
			troisdimensionstat(instance1)
		else
			if ((fpschoisi-vitessejeu)<1.5 and isoldat[numero].pole==0) or ((fpschoisi-vitessejeu)<1.3 and isoldat[numero].pole~=0)then
				troisdimensiondepgoh(instance1,angle,numero)
			end
			if instance1.sequence~="walk" then
				instance1:setSequence( "walk" )
			end
		end
	else
	    if 	image[isoldat[numero].typesoldat].typedep==1 then
	    	if instance1.statique==1 then
	    		print("animation cavalier gentils stat")
	    		instance1:setSequence( "arret" )
	    		troisdimensionstat(instance1)
	    	else
	    		if ((fpschoisi-vitessejeu)<1.5 and isoldat[numero].pole==0) or ((fpschoisi-vitessejeu)<1.3 and isoldat[numero].pole~=0)then
		    		troisdimensiondep(instance1,angle,numero)
		    	end
	    		-- if angle>65 or angle<-65 then
	    		-- 	instance1.xScale=instance1.xScale*0.8
	    		-- 	instance1:rotate(10) 
	    		-- elseif angle>22 then
	    		-- 	instance1.xScale=instance1.xScale*0.9 
	    		-- elseif angle<-22 then
	    		-- 	instance1.xScale=instance1.xScale*1.1
	    		-- end
	    		print("animation cavalier gentils")
	    		instance1:setSequence( "cavmouv" )
	    	end
		elseif 	image[isoldat[numero].typesoldat].typedep==2 then
	   		if instance1.statique==0 then
				instance1:setSequence( "cavamechant" )
				if (fpschoisicycle==0 and (fpschoisi-vitessejeu)<=1.15) or ((fpschoisi-vitessejeu)<1.3 and isoldat[numero].pole~=0) then
					troisdimensiondep(instance1,angle,numero)
				end
			else
				instance1:setSequence( "arret" )
				troisdimensionstat(instance1)
			end
			-- print("anim ccavamechant")
			
		else
			if instance1.statique==1 then
				instance1:setSequence( "arret" )--
				troisdimensionstat(instance1)
			else
			 	if angle>65 or angle<-65 then
					instance1:setSequence( "verticale" )
				elseif angle<22 and angle>-22 then
					if ((fpschoisi-vitessejeu)<1.5 and isoldat[numero].pole==0) or ((fpschoisi-vitessejeu)<1.3 and isoldat[numero].pole~=0)then
						troisdimensiondep(instance1,angle,numero)
					end
					instance1:setSequence( "horizontale" )
				elseif angle>0 then
					if ((fpschoisi-vitessejeu)<1.5 and isoldat[numero].pole==0) or ((fpschoisi-vitessejeu)<1.3 and isoldat[numero].pole~=0)then
						troisdimensiondep(instance1,angle,numero)
					end
					instance1:setSequence( "diagonalehaut" )
				else
					if ((fpschoisi-vitessejeu)<1.5 and isoldat[numero].pole==0) or ((fpschoisi-vitessejeu)<1.3 and isoldat[numero].pole~=0)then
						troisdimensiondep(instance1,angle,numero)
					end
					instance1:setSequence( "diagonalebas" )
				end
			end
		end
	end
	instance1.timeScale=isoldat[numero].timedep*vitessejeu
	if (fpschoisi-vitessejeu)<1.5 or isoldat[numero].pole==0 then
		if not instance1.isPlaying then 
			instance1:play()
		end
	end
	if not instance1init then
		--isoldat[numero].numgroup=mathfloor(isoldat[numero].y1)+1024
		group[isoldat[numero].numgroup]:insert(instance1)
	end
	return instance1
end
local function debut(x1,x2,y1,y2,numero)--,typesoldat)--vitesse--soldat
local instance1=nil
instance1=redirect(instance1,x1,x2,y1,y2,numero)
-- detection(numero) -- utile ou pas?? bah non mais bug tjours present acc en 
local function move(event)--listener qui se passe tout les rafraichissement de l'affichage
	if jeupause.etat==1 then--technique numero 3 de mise en pause(plus de probleme avec les processeurs mtk et probleme de deferencement)
		if instance1.pause1==0 then
			instance1.pause1=1
			instance1:pause()
		end
	else
		if instance1.pause1==1 then
			instance1.pause1=0
			--if fpschoisi<=1 then
			instance1.timeScale=isoldat[numero].timedep*vitessejeu
			instance1:play()
			--end
		end
		--isoldat[numero].cptbase=isoldat[numero].cptbase+1
		--if isoldat[numero].cptbase>1 then
			--isoldat[numero].cptbase=0
		--vie de l'unité-- lorsque un soldat est mlort, augmenter l'argent du joueur si c'est un mechant
		if isoldat[numero].vie<=0 then
			instance1.supression=1
			isoldat[numero].actcharge=0
			isoldat[numero].ombre.isVisible=false
			isoldat[numero].rectvie.width=0
			isoldat[numero].rectvie.alpha=0
			if isoldat[numero].orientation==0 and (savegameall.xpactive or isoldat[numero].gene==1) then
				isoldat[numero].rectxp.width=0
				isoldat[numero].rectxp.alpha=0
			end
			if isoldat[numero].vivant==true then
				mort(numero)
			end
		end
		--verification si pas d'ennemi ce battent contre lui
		local testcombat=0
		if isoldat[numero].tir~=0 then
			if isoldat[numero].tir.combat==1 then
				testcombat=1
			end
		else
			testcombat=1
		end
		if isoldat[numero].vivant==true and instance1.supression==0 and testcombat==1 then -- serai plus adapter dans combat, moins de test et pas while
			if isoldat[numero].ennemicombat~=0 then
				if isoldat[isoldat[numero].ennemicombat].encombat==1 and isoldat[isoldat[numero].ennemicombat].ennemi==numero and isoldat[isoldat[numero].ennemicombat].vivant==true then
					print("animdep 453, changement d'ennemi "..numero.." ennemi="..isoldat[numero].ennemicombat)
					isoldat[numero].ennemi=isoldat[numero].ennemicombat
					isoldat[numero].cpt=20
					if isoldat[numero].cptobj~=nil  then
						isoldat[numero].cpt=isoldat[numero].cptobj
					end
					if isoldat[numero].nbennemi==0 then
						isoldat[numero].nbennemi=1
					end
					if instance1.supression~=1 then
						instance1.supression=1
						attaque(numero,instance1)
					end
				else
					 isoldat[numero].ennemicombat=0
				end
			end
			if  instance1.nouveau then
				instance1.nouveau=false
				local mini=1
				local maxi=nbsoldat
				if isoldat[numero].orientation==1 then
					mini=nbsoldatg
					maxi=0
				end
				for i2=mini,maxi,1 do
					if isoldat[i2].encombat==1 then
						if isoldat[i2].ennemi==numero and isoldat[i2].vivant==true then
							print("enne bat contre"..numero.." ennemi "..i2)
							isoldat[numero].ennemi=i2
							isoldat[numero].cpt=20
							if isoldat[numero].cptobj~=nil  then
								isoldat[numero].cpt=isoldat[numero].cptobj
							end
							if isoldat[numero].nbennemi==0 then
								isoldat[numero].nbennemi=1
							end
							if instance1.supression~=1 then
								instance1.supression=1
								attaque(numero,instance1)
							end
							break
							--i2=nbsoldat*2*signe
						end
					end
				end
			end
		end
		--end
		--deplacement du soldat
		local endep=false
		if isoldat[numero].vivant==true and instance1.supression==0 then -- si le soldat est en vie
			deplacement(numero,instance1)
			--	
		elseif isoldat[numero].classe>=7 or isoldat[numero].classe==6 and instance1.supression==0 then
			if isoldat[numero].endeplacement==1 then
				deplacement(numero,instance1)
				endep=true
			end
		elseif isoldat[numero].classe<4 and instance1.supression==0 then
			if isoldat[numero].endeplacement==1 then
				deplacement(numero,instance1)
				endep=true
			end
		end
		--arriver à l'objectif
		-- dans le cas ou le soldat arrive a son objectif : prise de decision sur où aller 
		if instance1.ordo==1 and instance1.absc==1 and (endep or isoldat[numero].vie>0 and instance1.supression==0 and ((isoldat[numero].ennemi==0 or not isoldat[numero].tiragressivite ))) then --isoldat[numero].tir~=0))) then
			--print("arriver "..statique)
			if instance1.statique==0 then--signifie qui sont en mouvement
				instance1.supression=1
				arriver(numero)
				--print("arriver")
			else-- soldat est statique :
				if isoldat[numero].orientation==0 and isoldat[numero].regenevie~=0 and (isoldat[numero].tir==0 or (isoldat[numero].tir~=0 and isoldat[numero].ennemi==0)) then--regeneration des vies des gentils quand ils sont statiques
					regenerationvie(numero)
				end
			end
		end
		if instance1.ordo==1 and instance1.absc==1 and isoldat[numero].vie>0 and instance1.supression==0 and (isoldat[numero].ennemi~=0 and isoldat[numero].tiragressivite) then-- isoldat[numero].tir==0) then
			isoldat[numero].cpt=20
			if isoldat[numero].cptobj~=nil then
				isoldat[numero].cpt=isoldat[numero].cptobj
			end
		end
		--if isoldat[numero].cptbase>1 then
		--	isoldat[numero].cptbase=0
			--optimisation pour eviter qu'il recalcul des dellements 30 fois par sec
		if instance1.frameold~=instance1.frame then
			instance1.frameold=instance1.frame
			-- if	instance1.statique~=1 then
			-- 	local zone1bis=(instance1.y)/619*4 --deux données en une
			-- 	local zone1y=mathfloor(zone1bis*0.5)+2
			-- 	local zone2y=mathfloor((zone1bis)*0.5+0.5)+2
			-- 	zone1bis=(instance1.x)/1229*6 --deux données en une
			-- 	local zone1x=mathfloor(zone1bis*0.5)+2
			-- 	local zone2x=mathfloor((zone1bis)*0.5+0.5)+2
			-- 	isoldat[numero].zone1=zone1y*3+zone1x
			-- 	isoldat[numero].zone2=zone2y*3+zone2x
			-- end
			ennemideb=isoldat[numero].ennemi
				pouvoirgros(numero,instance1)
			--verification de l'ennnemi(2)
			if isoldat[numero].ennemi~=0 then
				if isoldat[isoldat[numero].ennemi].vie<=0 or isoldat[isoldat[numero].ennemi].vivant==false or isoldat[numero].orientation==isoldat[isoldat[numero].ennemi].orientation then--a peu etre optimiser
					isoldat[numero].ennemi=0
					isoldat[numero].actcharge=0
					isoldat[numero].ennemipb=false
				end
			end
			--if isoldat[numero].cpt3==5 then
				--cas ou vend le batiment --on pourrai ajouter un liberation de la variable
				if isoldat[numero].orientation==0 and instance1.supression==0 then
					if isoldat[numero].classe<4 then
						if ibatiment[isoldat[numero].numbat].sup1==1 then
							isoldat[numero].vivant=false
							isoldat[numero].vie=0-- -133
							isoldat[numero].rectvie.width=0
							isoldat[numero].rectvie.alpha=0
							if isoldat[numero].orientation==0 and (savegameall.xpactive or isoldat[numero].gene==1)  then
								isoldat[numero].rectxp.width=0
								isoldat[numero].rectxp.alpha=0
							end
							if isoldat[numero].ennemi~=0 then
								isoldat[isoldat[numero].ennemi].nbennemi=isoldat[isoldat[numero].ennemi].nbennemi-1
							end
							isoldat[numero].ennemi=0
							isoldat[numero].nbennemi=0
							isoldat[numero].ennemipb=false
							isoldat[numero].actcharge=0
							instance1.supression=1
							isoldat[numero].ombre.isVisible=false
							libnum(numero)
						end
					end
				end
				--dev du bat donc soldat sup
				if isoldat[numero].orientation==0 and  instance1.supression==0 then
					if isoldat[numero].classe<4 and not modearmy then
						if ibatiment[isoldat[numero].numbat].niveau~=isoldat[numero].niveau then-- ibatiment[isoldat[numero].numbat].evol==1 then
							isoldat[numero].vivant=false
							isoldat[numero].vie=0-- -133
							isoldat[numero].rectvie.width=0
							isoldat[numero].rectvie.alpha=0
							if isoldat[numero].orientation==0 and (savegameall.xpactive or isoldat[numero].gene==1) then
								isoldat[numero].rectxp.width=0
								isoldat[numero].rectxp.alpha=0
							end
							if isoldat[numero].ennemi~=0 then
								isoldat[isoldat[numero].ennemi].nbennemi=isoldat[isoldat[numero].ennemi].nbennemi-1
							end
							isoldat[numero].ennemi=0
							isoldat[numero].nbennemi=0
							isoldat[numero].ennemipb=false
							isoldat[numero].actcharge=0
							instance1.supression=1
							isoldat[numero].ombre.isVisible=false
							libnum(numero)
						end
					end
				end
			--si il a pas d'ennemi mais qu'il au moins un adversaire
			if isoldat[numero].ennemi==0 and isoldat[numero].nbennemi~=0 and instance1.supression==0 then
				local mini=1
				local maxi=nbsoldat
				if isoldat[numero].orientation==1 then
					mini=nbsoldatg
					maxi=0
				end
				local find=false
				for i1=mini,maxi,1 do	
					if isoldat[i1].ennemi==numero and isoldat[i1].vivant==true and isoldat[i1].vie>0 then
						if not isoldat[i1].ennemipb then
							isoldat[numero].ennemi=i1
							print("animdep 615 numero "..numero.." ennemi "..i1)
							isoldat[numero].cpt=20
							if isoldat[numero].cptobj~=nil then
								isoldat[numero].cpt=isoldat[numero].cptobj
							end
							find=true
							break 
							--i1=nbsoldat+2
						end
					end
				end
				if not find then
					--print("bug il a un adversaire mais personne ne la comme adversaire direct ou que son autre adversaire est mort")
					isoldat[numero].nbennemi=0
				end
			end
			--recherche d'un adversaire
			if isoldat[numero].ennemi==0 and isoldat[numero].vie>0 and isoldat[numero].tiragressivite and isoldat[numero].vivant then --isoldat[numero].tir==0
				--if isoldat[numero].cpt1<3 then 
				if isoldat[numero].cpt1<4 and not (isoldat[numero].cpt1>=2 and isoldat[numero].orientation==0 and instance1.statique==1) then --if (isoldat[numero].orientation==1 and isoldat[numero].cpt1<4) or ((isoldat[numero].cpt1<4 and instance1.statique==0 or isoldat[numero].cpt1<6 and instance1.statique==1) and isoldat[numero].orientation==0) then
					if isoldat[numero].vitesse<1.5 then
						isoldat[numero].cpt1=isoldat[numero].cpt1+0.25
					elseif isoldat[numero].vitesse<3 then
						isoldat[numero].cpt1=isoldat[numero].cpt1+0.75
					elseif  isoldat[numero].vitesse<4.5 then
						isoldat[numero].cpt1=isoldat[numero].cpt1+1.25
					elseif isoldat[numero].vitesse<6 then
						isoldat[numero].cpt1=isoldat[numero].cpt1+1.75
					else
						isoldat[numero].cpt1=isoldat[numero].cpt1+2.5
					end
				else-- end
					if isoldat[numero].vitesse>2.5 and instance1.statique==0 then
						attributionzone(numero,instance1.x,instance1.y)
					end
					isoldat[numero].cpt1=0
					detection(numero)
					-- if issimulator then
					-- 	local lecercle=display.newCircle(group[2048],instance1.x,instance1.y,5)
					-- 	local function letimercercle(event)
					-- 		event.source.lecercle:removeSelf()
					-- 		event.source.lecercle=nil
					-- 	end
					-- 	local lecercledata=timer.performWithDelay(100,letimercercle)
					-- 	lecercledata.lecercle=lecercle
					-- end
				end
			end
			--test d'unité pouvant tiré
			if (not isoldat[numero].tiragressivite or isoldat[numero].ennemi==0 ) and isoldat[numero].tir~=0 and instance1.supression==0 and (instance1.statique==1 or isoldat[numero].orientation~=0) then
				if isoldat[numero].tir.chargement==0 and isoldat[numero].tir.tirer<=0 then
					timersoldatattaque(numero,isoldat[numero].tir.tirer)
				end
				if isoldat[numero].tir.test==0 then
					if instance1.frame==1 or instance1.frame==4 then
						isoldat[numero].tir.test=1
					end
				end
				if isoldat[numero].tir.tirer==1 and isoldat[numero].tir.test==1 and not isoldat[numero].tir.bras.isVisible then
					isoldat[numero].tir.test=0
					--print("recherche adversaire")
					if goh and (isoldat[numero].typesoldat==179 or isoldat[numero].typesoldat==175) then
						--print("ici")
						rechercheverif(0,numero,isoldat[numero].x1,isoldat[numero].y1)--instance1.x,instance1.y)
					else
						rechercheverif(0,numero,isoldat[numero].x1+isoldat[numero].direction*image[isoldat[numero].typesoldat].attx,isoldat[numero].y1+image[isoldat[numero].typesoldat].atty)--instance1.x,instance1.y)
					end
					--isoldat[isoldat[numero].tir.fleche[1]].x1
					if isoldat[numero].tir.bras.isVisible then
						local rotateangle=instance1.rotateangle
						if rotateangle==nil then
							rotateangle=0
						end
						if instance1.rotateangle~=nil then
							if isoldat[numero].tir.rotateangle==nil then
								isoldat[numero].tir.rotateangle=0
							end
							isoldat[numero].tir.bras:rotate(instance1.rotateangle-isoldat[numero].tir.rotateangle)
							isoldat[numero].tir.rotateangle=instance1.rotateangle
						end
						if isoldat[numero].tir.bras.xscalepos~=isoldat[numero].direction then
							isoldat[numero].direction=-isoldat[numero].direction
							--isoldat[numero].x1=isoldat[numero].x1+
							instance1.xScale=-instance1.xScale
							-- print("inversion "..numero)
						end
					end
					-- print("direction"..numero)
				end
				if isoldat[numero].orientation~=0 then
					if isoldat[numero].tir.bras.isVisible then
						isoldat[numero].cptobj=nil
						instance1.supression=1
						--isoldat[numero].encombat=1
						isoldat[numero].reut=false
					end
				end
			end
			-- if isoldat[numero].depcorr then
			-- 	print("isoldat[numero].depcorr true")
			-- else
			-- 	print("isoldat[numero].depcorr false")
			-- end
				if isoldat[numero].depcorr==false then
					if instance1.supression==0 and isoldat[numero].tiragessivite or(ennemideb==0 and isoldat[numero].ennemi==0) and isoldat[numero].orientation==0 and (isoldat[numero].cpt2==0 or isoldat[numero].classe>4) then --tir~=0
						--print("opt")
						if isoldat[numero].orientation==0 then
							if isoldat[numero].classe>4 and isoldat[numero].classe<7 then
								print("deb retour intenpestif")
							end

							if isoldat[numero].classe<4 then
								if instance1.x2~=((ibatiment[isoldat[numero].numbat].drap.x or isoldat[numero].xposi) +isoldat[numero].xposi) or instance1.y2~=ibatiment[isoldat[numero].numbat].drap.y+isoldat[numero].yposi-isoldat[numero].centrey then
									instance1.supression=1
									print("retour normal animdep 375 intenpestif?")
									retouractnormale(numero)
								end
							elseif isoldat[numero].classe>=7 then
								local objectifx=genepoint.x
								local objectify=genepoint.y
								if isoldat[numero].gene==0 then
									objectifx=objectifx+isoldat[numero].xposi
									objectify=objectify+isoldat[numero].yposi
								end
								if instance1.x2~= objectifx or instance1.y2~=objectify-isoldat[numero].centrey then
									instance1.supression=1
									print("retour normal animdep 381 intenpestif?")
									retouractnormale(numero)
								end
							elseif isoldat[numero].classe==6 then
								--print("ici")
								if isoldat[numero].vivant==false then
									print("soldat mort")
									if isoldat[numero].vie>0 then
									--	isoldat[numero].vivant=true
									end
								end
								--isoldat[numero].depcorr=true
								-- local objectifx=isoldat[numero].coorx
								-- local objectify=isoldat[numero].coory
								-- if instance1.x2~=objectifx or instance1.y2~=objectify-isoldat[numero].centrey then
								-- 	instance1.supression=1
								-- 	print("retour normal animdep 381 intenpestif?")
								-- 	retouractnormale(numero)
								-- end
							end
						else
							-- isoldat[numero].cptobj=nil
							-- instance1.supression=1
							-- isoldat[numero].encombat=1
							-- isoldat[numero].reut=false
						end
					end
				end
			--end
			--cas ou l'adversaire que l'on avait est mort
			if instance1.supression==0 and ennemideb~=0 and isoldat[numero].ennemi==0 then
				--print("retour normal"..numero)
				instance1.supression=1
				isoldat[numero].actcharge=0
				retouractnormale(numero)
			end
			--regeneration des vies des ennemis
			if isoldat[numero].orientation==1 and instance1.supression==0 and isoldat[numero].regenevie~=0 then--regeneration des vies des mechants
				regenerationvie(numero)
			end
			isoldat[numero].cpt3=5--isoldat[numero].cpt3+1--faut il le reinserer modifier ou le suprimer
			--isoldat[numero].cpt1=10
			--if isoldat[numero].cpt3>5 then
			--	isoldat[numero].cpt3=2
			--end
		end
			--que faire quand j'ai un ennemi
		if isoldat[numero].ennemi~=0 and isoldat[numero].vivant==true and isoldat[numero].tiragressivite then -- isoldat[numero].tir==0 then
			if instance1.supression==0 then
				if isoldat[isoldat[numero].ennemi].vivant==true and isoldat[isoldat[numero].ennemi].orientation~=isoldat[numero].orientation then--isoldat[isoldat[numero].ennemi].vie>0
					unadversaire(numero,instance1)
				-- else
				-- 	instance1.supression=1
				-- 	isoldat[numero].actcharge=0
				-- 	isoldat[numero].ennemi=0
				-- 	retouractnormale(numero)
				-- else
				-- 	instance1.supression=1
				-- 	retouractnormale(numero)
				end
			end
		end
		if isoldat[numero].ennemi==0 and isoldat[numero].orientation==0 and instance1.supression==0 and ((isoldat[numero].cpt1>=1 and instance1.statique==0) or (isoldat[numero].cpt2==0 and isoldat[numero].depcorr)) then
			local lancementdutest=false
			if obstaclsold~=nil then
				if obstaclsold.nb>0 then
					lancementdutest=true
	     		end
	     	end
	     	if obstaclegene~=nil and genenum==numero then
		    	if obstaclegene.nb>0 then
		    		lancementdutest=true
		    	end
	     	end
	     	if lancementdutest then
				obstaclsoldtest(numero,instance1,0,0,true)
			end
	    end
		--end
		if instance1.supression==1 then
			--print("remove animation "..numero)
			--print("supression instance")
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
			-- print("demande de supression ---------------------------------")
			if 	isoldat[numero].reut then
				--print("suppression element "..numero)
				instance1:pause()
				-- print("met en pause l'anim")
				--print("rediriger")
	     		instance1=redirect(instance1,isoldat[numero].x1,isoldat[numero].x3,isoldat[numero].y1,isoldat[numero].y3,numero)
	     		isoldat[numero].reut=false
	     		Runtime:removeEventListener("touch",instance1)
	     	else
	     		--print("suppression element "..numero.." non reu")
	    	 	--group[isoldat[numero].numgroup]:remove(instance1)
				Runtime:removeEventListener( "enterFrame",move)
				Runtime:removeEventListener( "tap",tapsoldat)
				Runtime:removeEventListener("touch",instance1)
				instance1:removeSelf( )
				instance1=nil
			end
		end
	end
end

	Runtime:addEventListener("enterFrame",move)
	local function tapsoldat( event )
		instance1.fill.effect = "filter.sepia"
		instance1.fill.effect.intensity=-2.5
		transition.to(instance1.fill.effect, { time=500, intensity=0 } )
		affinfo(numero,true,true)
		affinfotab.num=numero
		affinfotab.type=0
		if genenum==numero then
			if contreaihaut==0 or contreai==1 then --and contreaihaut==1) then
				print("tap sur gene")
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
				if event.phase=="began" and self.statique==1 and isoldat[genenum].endeplacement==0 then
					retinf.nbaction=retinf.nbaction+1
					print("swipe sur gene")
					print("began endeplacement"..self.statique)
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
				if event.phase~="cancelled" and self.statique==1 then
					generalmove(event,self)
				end
				if event.phase=="ended" or event.phase=="cancelled" or self.statique==0 or isoldat[genenum].endeplacement==1 then
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
		elseif isoldat[numero].orientation==0 and isoldat[numero].classe<4 and isoldat[numero].numbat>0 then
			--self.nbtouche=0
			function instance1:touch(event)
				--print("dans la fonction ori")
				if event.phase=="began" and self.statique==1 and isoldat[event.target.id].endeplacement==0 and fenaff==false and  clicpause==0 and pv1clic==0 and pv2clic==0 and pv3clic==0 and clicconstruire==0 and clicinfanterie==0 and clicarcher==0 and clicpouvoir1==0 and clicpouvoir2==0 and clicpouvoir3==0 and pv2clicactiver==0 and pv1clicactiver==0 and boutondev==0 and drapeausolclic==0 then 
					retinf.nbaction=retinf.nbaction+1
					print("swipe sur sol")
					solenmov=true
					print("began endeplacement"..self.statique)
					display.getCurrentStage():setFocus( self )
					self.isFocus = true
					solenmov1=true
					local function timerdefocus(event)
						solenmov1=false
					end
					timer.performWithDelay( 400, timerdefocus)
					--local param=timer.performWithDelay(200,timerfocalisation,-1)
					--param.self=self
				else
					--print("phase "..event.phase)
				end
				--self.nbtouche=self.nbtouche+1
				print("phase "..event.phase)
				--print("self "..self.x)
				if event.phase~="cancelled" and self.statique==1 and solenmov then
					soldatdeplacer(event,self)
				end
				if event.phase=="ended" or event.phase=="cancelled" or self.statique==0 or isoldat[event.target.id].endeplacement==1 then
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
end
t.animdep = function(x1,x2,y1,y2,numero)--x1 coordonnée de depart--soldat c'est le numero du point d'objectif
debut(x1,x2,y1,y2,numero)--vitesse--soldat
end
return t