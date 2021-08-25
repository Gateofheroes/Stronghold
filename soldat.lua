-- gere la creation de nouveau soldat(de la gestion de leur variable au spawn)
local soldat = {}
local soldat_mt = { __index = soldat }	-- metatable
local animdep1=require("animdep")
-- if not functionload then
-- function vie(numero,perte)--pas utiliser
-- 	isoldat[numero].vie=isoldat[numero].vie-perte
-- 	if isoldat[numero].vie<=0 then
		
-- 	end
-- end
-- end
function findnbsoldat(orientation)
	local varlib=0
	local num=nil
	local k=1
	if orientation==0 then
		k=-1
	end
	if orientation~=0 then
		while k<=nbsoldat do--permet de ralouer les numero
			if isoldat[k].remp==1 then
			--if isoldat[k].vie==-133 and isoldat[k].orientation==1 then
				varlib=1
				num=k
				k=nbsoldat+1
				--print("numero trouver")
			end
			k=k+1
		end
	else
		while k>=nbsoldatg do--permet de ralouer les numero
			if isoldat[k].remp==1 then
			--if isoldat[k].vie==-133 and isoldat[k].orientation==1 then
				varlib=1
				num=k
				k=nbsoldatg-1
				--print("numero trouver")
			end
			k=k-1
		end
	end
	if varlib==0 then
		if orientation==0 then
			nbsoldatg=nbsoldatg-1
			num=nbsoldatg
		else
			nbsoldat=nbsoldat+1
			num=nbsoldat
		end
	end
	return num
end
local function xposiyposi(numero)
	local xposi=0
	local yposi=0
	if numposi~=0 then
	if numposi==1 then
		xposi=12
	else
		if numposi==2 then
			xposi=-12
		else
			if numposi==3 then
				yposi=12
			else
				if numposi==4 then
					yposi=-12
				else
					if numposi==5 then
						xposi=12
						yposi=12
					else
						if numposi==6 then
							xposi=12
							yposi=-12
						else
							if numposi==7 then
								xposi=-12
								yposi=12
							else
								if numposi==8 then
									xposi=-12
									yposi=-12
								end
							end
						end
					end
				end
			end
		end
	end
	end
	isoldat[numero].xposi=xposi
	isoldat[numero].yposi=yposi
	if numposi<8 then
		numposi=numposi+1
	else
		numposi=0
	end
end
local function caracteristiqueSoldat ( numero, typesoldat,numbat,pole,levelsoldbat )--donne les carracteristiques de chaque personnage
	print("numero "..numero.." typesoldat "..typesoldat)
	if levelsoldbat~=nil then
		print("\n\n\n\nisoldat[numero].levelc"..levelsoldbat)
	end
	--print(numbat)
	--partie constante quel que soit le personnage
	if numero==nbsoldat or numero==nbsoldatg then
		if isoldat[numero]==nil then
			isoldat[numero]={}
		
			xposiyposi(numero)
			isoldat[numero].effetvern=0--effet verticale du perso quand il se deplace le nb
			isoldat[numero].effetvero=0--effet verticale en ordonnee
		end
		if typesoldat==275 or (typesoldat>=170 and typesoldat<180) then
			isoldat[numero].ombre=display.newGroup()
			isoldat[numero].ombre.ombre=display.newImage(imbouton.ombresld,1)
			isoldat[numero].ombre.cercleaction=display.newImage(impro.poussiere,1)
			isoldat[numero].ombre.cercleaction.alpha=0.8
			isoldat[numero].ombre.cercleaction:setFillColor(0,1,0)
			isoldat[numero].ombre.cercleaction.xScale=0.5
			isoldat[numero].ombre.cercleaction.yScale=isoldat[numero].ombre.cercleaction.xScale
			isoldat[numero].ombre:insert(isoldat[numero].ombre.cercleaction)
			isoldat[numero].ombre:insert(isoldat[numero].ombre.ombre)
		else
			isoldat[numero].ombre=display.newImage(imbouton.ombresld,1)
		end
		isoldat[numero].ombre.alpha=0.5
		isoldat[numero].ombre.isVisible=false
		--isoldat[i].ombre.alpha=0
 		group[2]:insert(isoldat[numero].ombre )
	else
		if mathabs(isoldat[numero].xposi)>12 or mathabs(isoldat[numero].yposi)>12 then
			xposiyposi(numero)
		end
		if typesoldat==275 or (typesoldat>=170 and typesoldat<180) then
			if isoldat[numero].ombre.ombre==nil then
				isoldat[numero].ombre:removeSelf()
				isoldat[numero].ombre=nil
				isoldat[numero].ombre=display.newGroup()
				isoldat[numero].ombre.ombre=display.newImage(imbouton.ombresld,1)
				isoldat[numero].ombre.cercleaction=display.newImage(impro.poussiere,1)
				isoldat[numero].ombre.cercleaction:setFillColor(0,1,0)
				isoldat[numero].ombre.cercleaction.xScale=0.5
				isoldat[numero].ombre.cercleaction.yScale=isoldat[numero].ombre.cercleaction.xScale
				isoldat[numero].ombre:insert(isoldat[numero].ombre.cercleaction)
				isoldat[numero].ombre:insert(isoldat[numero].ombre.ombre)
				isoldat[numero].ombre.alpha=0.5
				isoldat[numero].ombre.isVisible=false
				group[2]:insert(isoldat[numero].ombre )
			end
		elseif isoldat[numero].ombre.ombre~=nil then
			isoldat[numero].ombre:remove(isoldat[numero].ombre.cercleaction)
			isoldat[numero].ombre.cercleaction:removeSelf()
			isoldat[numero].ombre.cercleaction=nil
			isoldat[numero].ombre:remove(isoldat[numero].ombre.ombre)
			isoldat[numero].ombre.ombre:removeSelf()
			isoldat[numero].ombre.ombre=nil
			isoldat[numero].ombre:removeSelf()
			isoldat[numero].ombre=nil
			isoldat[numero].ombre=display.newImage(imbouton.ombresld,1)
			isoldat[numero].ombre.alpha=0.5
			isoldat[numero].ombre.isVisible=false
			group[2]:insert(isoldat[numero].ombre )
		end
	end
	local taillesquelette
	if typesoldat==237 then
		taillesquelette=1
	end
	if not tabsoldexist[typesoldat] then -- version finale du jeu ne doit pas exister. doit etrre supprimer a la fin de chargementbis
		if typesoldat>=280 and typesoldat<290 then -- squelette
			taillesquelette=typesoldat-278
			typesoldat=237
		else
			print("le soldat "..typesoldat.." n'existe pas !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
			typesoldat=201
		end
	end
	local type1=typesoldat

	if pole==nil then
		pole=0
	end
	isoldat[numero].pole=pole --numero de pole si 1 depend de si on joue contre l'ai
	isoldat[numero].cptunadv=0
	isoldat[numero].effetvern=0
	isoldat[numero].effetvero=0
	isoldat[numero].depcorr=false
	isoldat[numero].typesoldat=typesoldat
	isoldat[numero].ennemi=0 	-- si 0 : pas de conflit en cours sinon : numero du soldat
	isoldat[numero].ennemipb=false -- false si pas de pb avec l'adversaire. true si l'adversaire est en dehors du cercle
	isoldat[numero].direction=1
	isoldat[numero].vitesse=1
	isoldat[numero].mine=false
	isoldat[numero].nbennemi=0  -- nb d'ennemis que le soldat a
	isoldat[numero].actcharge=0--si le pouvoir de charge est activer
	isoldat[numero].remp=0--si il peut etre remplacer
	isoldat[numero].cpt=20--si il peut se rediriger vers un ennemi
	isoldat[numero].cpt3=0--reverifie dans information pas tres importante quand on atteint un certain nombre
	isoldat[numero].numgroup=nil--position dans le group
	isoldat[numero].vivant=true--unité encore vivante(permet d'etre plus optimiser car on compare plus la variable vie et permet de ne pas faire 2 fois les elements en cas de mort(avant on mettait un chiffre premier negatif pour indiquer qu'il etait officelement mort))
	--isoldat[numero].agressivite=2 -- agressivité : si le soldat a une agressivité inferieure au nb de soldat assailant son ennemi, il n'ira pas au combat
	--isoldat[numero].chargeact=0--a ne pas touchez permet de savoir si on active le bonus de charge
	isoldat[numero].pv3=false--si le pouvoir 3 est activer
	isoldat[numero].reut=false
	isoldat[numero].zone1=-1
	-- isoldat[numero].zone1y=-1
	-- isoldat[numero].zone1x=-1
	isoldat[numero].zone2=-1
	isoldat[numero].zone3=-1
	isoldat[numero].zone4=-1

	isoldat[numero].point=1--dernier point ou le soldat est passer
	-- isoldat[numero].zone2y=-1
	-- isoldat[numero].zone2x=-1
	isoldat[numero].ennemicombat=0 -- quand un ennemi est entrain de t'attaquer
	-- isoldat[numero].ennemiennemi=0 -- quand un ennemi 
	--permet de definir des variable propre a leur orientation, classe et niveau
	isoldat[numero].height=0
	isoldat[numero].width=0
	if typesoldat>=200 then-- mechant
		type1=type1-200
		isoldat[numero].orientation=1 --mechant
		isoldat[numero].numbat=0--pas de batiment rataché
	else
		type1=type1-100
		isoldat[numero].orientation=0--gentil
		isoldat[numero].numbat=numbat
	end
	isoldat[numero].classe=mathfloor((type1)*0.1)
	isoldat[numero].niveau=type1-10*isoldat[numero].classe
	if isoldat[numero].orientation==0 and isoldat[numero].classe==4 then
		isoldat[numero].pouvoir=numbat
	end
	-- if type1<10 then
	-- 	isoldat[numero].classe=0--infanterie
	-- 	isoldat[numero].niveau=type1
	-- else
	-- 	if type1<20 then
	-- 		isoldat[numero].classe=1--geant
	-- 		isoldat[numero].niveau=type1-10
	-- 	else
	-- 		if type1<30 then
	-- 			isoldat[numero].classe=2--cavalrie
	-- 			isoldat[numero].niveau=type1-20
	-- 		else 
	-- 			if type1<40 then
	-- 				isoldat[numero].classe=3--cavalrie
	-- 				isoldat[numero].niveau=type1-30
	-- 			else 
	-- 				if type1<50 then--type renfort    de 0 a 2 renfort humain, de 3 a 5 elfe de 6 a 9 geant
	-- 					isoldat[numero].classe=4--cavalrie
	-- 					isoldat[numero].niveau=type1-40
	-- 					if isoldat[numero].orientation==0 then
	-- 						isoldat[numero].pouvoir=numbat
	-- 					end
	-- 				else
	-- 					if type1<60 then
	-- 						isoldat[numero].classe=5--mine
	-- 						isoldat[numero].niveau=type1-50
	-- 					else 
	-- 						if type1<70	then
	-- 							isoldat[numero].classe=6--cavalrie
	-- 							isoldat[numero].niveau=type1-60
	-- 						else
	-- 							if type1<80 then
	-- 								isoldat[numero].classe=7--cavalrie
	-- 								isoldat[numero].niveau=type1-70
	-- 							else
	-- 								if type1<90 then
	-- 									isoldat[numero].classe=8--cavalrie
	-- 									isoldat[numero].niveau=type1-80
	-- 								else
	-- 									if type1<100 then
	-- 										isoldat[numero].classe=9--cavalrie
	-- 										isoldat[numero].niveau=type1-90
	-- 									end
	-- 								end
	-- 							end
	-- 						end
	-- 					end
	-- 				end
	-- 			end
	-- 		end
	-- 	end
	-- end
	if modezombie then
		if isoldat[numero].orientation==0 or isoldat[numero].typesoldat~=238 then -- pour mode zoombie qui ne marchent pas sur le terrain on peut faire ca mais il faut que le chemin soit droit
			isoldat[numero].xposi=mathrandom(-1,1)*13
			isoldat[numero].yposi=mathrandom(-1,1)*13
		else
			isoldat[numero].xposi=mathrandom(-1,1)*13
			isoldat[numero].yposi=mathrandom(-10,10)*12
		end
	end
	if modepanique then
		if isoldat[numero].orientation==0 then
			isoldat[numero].xposi=mathrandom(-1,1)*13
			isoldat[numero].yposi=mathrandom(-1,1)*13
		else
			--isoldat[numero].typesoldat=244
			isoldat[numero].xposi=mathrandom(-10,10)*13*0.2
			isoldat[numero].yposi=mathrandom(-10,10)*13*0.1
			if isoldat[numero].orientation==1 then -- pour mode zoombie qui ne marchent pas sur le terrain on peut faire ca mais il faut que le chemin soit droit
				if isoldat[numero].yposi==0 then
					isoldat[numero].yposi=13
				end
			end
		end
	end

	isoldat[numero].gene=0--1 si le soldat est un general
	if isoldat[numero].gene==1 then
		isoldat[numero].endeplacement=0
	end
	if isoldat[numero].classe<4 then
		isoldat[numero].endeplacement=0
	end
	if typesoldat==270 then
		local randomvaleur=mathrandom(1,3)
		if randomvaleur==1 then
			isoldat[numero].depgauche=image[typesoldat].depgauche
			isoldat[numero].attgauche=image[typesoldat].attgauche
		elseif randomvaleur==2 then
			isoldat[numero].depgauche=image[typesoldat].depgauche1
			isoldat[numero].attgauche=image[typesoldat].attgauche1
		else
			isoldat[numero].depgauche=image[typesoldat].depgauche2
			isoldat[numero].attgauche=image[typesoldat].attgauche2
		end
	elseif typesoldat==204 or typesoldat==268 then
		if niveauch<=4 or niveauch>=9 then
			isoldat[numero].depgauche=image[typesoldat].depgauche
			isoldat[numero].attgauche=image[typesoldat].attgauche
		else
			isoldat[numero].depgauche=image[typesoldat].depgauche1
			isoldat[numero].attgauche=image[typesoldat].attgauche1
		end
	else
		isoldat[numero].depgauche=image[typesoldat].depgauche--graphics.newImageSheet( "AnimVF/mechant/veteran/Veteranmvmg.png", { width=154, height=219, numFrames=6 } )
		--isoldat[numero].depdroite=image[typesoldat].depdroite--graphics.newImageSheet( "AnimVF/mechant/veteran/Veteranmvmd.png", { width=154, height=219, numFrames=6 } )
		isoldat[numero].attgauche=image[typesoldat].attgauche--graphics.newImageSheet( "AnimVF/mechant/veteran/Veteranatg.png", { width=162, height=226, numFrames=5 } )
		--isoldat[numero].attdroite=image[typesoldat].attdroite--graphics.newImageSheet( "AnimVF/mechant/veteran/Veteranatd.png", { width=162, height=226, numFrames=5 } )
	end
	--isoldat[numero].scale=0.09

	--variable par defaut, varie pour chage personnage(info venant de chargement est chagementbis)
	--if image[typesoldat].transition~=nil then
	-- isoldat[numero].transition=image[typesoldat].transition
	--end
	isoldat[numero].x1=700
	isoldat[numero].y1=700
	isoldat[numero].attsec=image[typesoldat].attsec
	-- isoldat[numero].typedep=image[typesoldat].typedep
	isoldat[numero].scale=image[typesoldat].scale
	isoldat[numero].vie=image[typesoldat].vie--100 
	isoldat[numero].attaque=image[typesoldat].attaque--10
	isoldat[numero].vitesse=image[typesoldat].vitesse--1
	-- isoldat[numero].numframe=image[typesoldat].numframe--5--nombre d'image de l'animation d'attaque (5 par defaut)
	isoldat[numero].timeatt=image[typesoldat].timeatt--800--duree de l'attaque en ms--800 par defaut-------------------------hugo si tu veux faire varier la durée d'attaque d'une unitée tu ajoute cette ligne apres "isoldat[numero].numframe=6" ou "isoldat[numero].vitesse=1" avec un espace
	isoldat[numero].argent=image[typesoldat].argent--10--argent gagner lors de la mort de l'unité--pour gain specifique au soldat faire pareil qu'au dessus
	if modewave then
		isoldat[numero].argent=0
	end
	isoldat[numero].regene=image[typesoldat].regene--20--duree de la regeneration du soldat en 0.5 sec
	isoldat[numero].agressivite=image[typesoldat].agressivite+agressivite ----2
	isoldat[numero].charge=image[typesoldat].charge--0
	isoldat[numero].regenevie=image[typesoldat].regenevie--1--regeneration des vies quand les personnages sont statiques(gentils)
	isoldat[numero].blocnbennemi=image[typesoldat].blocnbennemi--1--nombre d'ennemi bloquer par le soldat
	isoldat[numero].attnbennemi=image[typesoldat].attnbennemi--1--nombre d'ennemi qu'il peut attaquer en meme temps
	-- isoldat[numero].message=image[typesoldat].message
	isoldat[numero].timedep=image[typesoldat].timedep or 1
	isoldat[numero].centrex=image[typesoldat].centrex--centre du personnage permet au fleche ou au coup d'etre centrer sur le soldat
	isoldat[numero].centrey=image[typesoldat].centrey
	isoldat[numero].tailleombre=image[typesoldat].tailleombre*0.22
	isoldat[numero].ombre.xScale=isoldat[numero].tailleombre
	isoldat[numero].ombre.yScale=isoldat[numero].ombre.xScale
	isoldat[numero].ombre.isVisible=true
	isoldat[numero].effetdure=image[typesoldat].effetdure
	isoldat[numero].effetimpact=image[typesoldat].effetimpact
	-- isoldat[numero].attanim=image[typesoldat].attanim--type d'anim afficher
	isoldat[numero].eff3D=image[typesoldat].eff3D--variation de l'impact de 3D agit en multiplication
	-- isoldat[numero].attscale=image[typesoldat].attscale -- variation de la taille de l'anim entre le deplacement et l'attaque
	-- isoldat[numero].attx=image[typesoldat].attx--deplacement de l'anim d'attaque pour qu'elle soit superposé a celle de deplacement
	-- isoldat[numero].atty=image[typesoldat].atty--deplacement de l'anim d'attaque pour qu'elle soit superposé a celle de deplacement
	isoldat[numero].porte=image[typesoldat].porte --porte de l'arme il s'arretera plus loin de l'adversaire si ca porte est grande
	--isoldat[numero].numframevie=image[typesoldat].numframevie --image sur laquel on enleve des vies a l'adversaire
	-- if isoldat[numero].attanim==0 then
	-- 	isoldat[numero].attanimordre=image[typesoldat].attanimordre--ordre special
	-- end
	isoldat[numero].tiragressivite=true -- si recherche des adversaires
	isoldat[numero].tir=image[typesoldat].tir
	if isoldat[numero].tir~=0 then--gestion des soldats pouvant tirer
		isoldat[numero].tir={}
		isoldat[numero].tir.porte=image[typesoldat].tir.porte
		isoldat[numero].tir.attaque=image[typesoldat].tir.attaque
		isoldat[numero].tir.vitesse=image[typesoldat].tir.vitesse
		isoldat[numero].tir.cadence=image[typesoldat].tir.cadence
		isoldat[numero].tir.nbfleche=image[typesoldat].tir.nbfleche
		isoldat[numero].tir.proj=image[typesoldat].tir.proj
		isoldat[numero].tir.projscale=image[typesoldat].tir.projscale
		isoldat[numero].tir.atttir=image[typesoldat].atttir
		isoldat[numero].tir.combat=image[typesoldat].tir.combat
		isoldat[numero].tir.attscale=image[typesoldat].tir.attscale
		isoldat[numero].tir.timean=image[typesoldat].tir.timean
		isoldat[numero].tiragressivite=false
		isoldat[numero].tiragressivite=image[typesoldat].tir.agressivite
		isoldat[numero].tir.typetra=image[typesoldat].tir.typetra
		if isoldat[numero].tir.typetra==nil then
			isoldat[numero].tir.typetra=1
		end
		isoldat[numero].tir.impact=image[typesoldat].tir.impact
		if isoldat[numero].tir.impact==nil then
			isoldat[numero].tir.impact=0
		end
		--isoldat[numero].tir.charge=0--a 0 si on est pas entrain de charger
		--isoldat[numero].tir.ennemi=0
		isoldat[numero].tir.chargement=0
		isoldat[numero].tir.tirer=0
			isoldat[numero].tir.fleche={}
			isoldat[numero].tir.flecheinf={}
			for i=1,isoldat[numero].tir.nbfleche,1 do
				isoldat[numero].tir.fleche[i]=0
			end
		local sequenceData1 =
		{
		    name="bras",
		    frames= {1,2,3,1,1}, -- frame indexes of animation, in image sheet
		    time = 800*isoldat[numero].tir.timean,           -- Optional. In ms.  If not supplied, then sprite is frame-based.
		    loopCount = 1        -- Optional. Default is 0.
		}
		if image[isoldat[numero].typesoldat].tirnbfr~=nil then
			if not goh then
				if image[isoldat[numero].typesoldat].tirnbfr==5 then
					sequenceData1 =
					{
					    name="bras",
					    frames= {1,2,3,4,4,4,5}, -- frame indexes of animation, in image sheet
					    time = 800*isoldat[numero].tir.timean,           -- Optional. In ms.  If not supplied, then sprite is frame-based.
					    loopCount = 1        -- Optional. Default is 0.
					}
				elseif image[isoldat[numero].typesoldat].tirnbfr==6 then
					sequenceData1 =
					{
					    name="bras",
					    frames= {1,2,3,4,5,6,6,6,6,6,6,6}, -- frame indexes of animation, in image sheet
					    time = 1300*isoldat[numero].tir.timean,           -- Optional. In ms.  If not supplied, then sprite is frame-based.
					    loopCount = 1        -- Optional. Default is 0.
					}
				end
			else
				if image[isoldat[numero].typesoldat].tirnbfr==6 then
					sequenceData1.frames={1,2,3,4,5,6,6}
				elseif image[isoldat[numero].typesoldat].tirnbfr==6.1 then
					sequenceData1.frames={1,2,3,4,5,5,6,6}	
				elseif image[isoldat[numero].typesoldat].tirnbfr==5 then
					sequenceData1.frames={1,2,3,4,5,5}
				end
			end
		end
		isoldat[numero].tir.bras=display.newSprite(isoldat[numero].tir.atttir,sequenceData1) --imgbat.brascata, sequenceData1 )
		if goh then
			isoldat[numero].tir.bras.anchorY=1
			if image[isoldat[numero].typesoldat].tir.x~=nil then
				if image[isoldat[numero].typesoldat].tir.x>0 and image[isoldat[numero].typesoldat].tir.x<1 then
					isoldat[numero].tir.bras.anchorX=image[isoldat[numero].typesoldat].tir.x
				end
			end
		end
		isoldat[numero].tir.bras.xscalepos=1
		isoldat[numero].tir.bras.x=0
		isoldat[numero].tir.bras.y=0
		isoldat[numero].tir.bras.xScale=isoldat[numero].scale*isoldat[numero].tir.attscale
		isoldat[numero].tir.bras.yScale=isoldat[numero].tir.bras.xScale
		isoldat[numero].tir.bras.isVisible=false
		isoldat[numero].tir.bras.angle=0
		isoldat[numero].tir.bras.pause1=0
		isoldat[numero].tir.bras.play1=false
		isoldat[numero].tir.bras.oldframe=nil
		isoldat[numero].tir.bras.group=mathfloor(0)+1024
		group[isoldat[numero].tir.bras.group+1]:insert(isoldat[numero].tir.bras)
		-- local function animtirsolbras( event )
		-- 	if isoldat[numero].vie>0 then	
		-- 		if isoldat[numero].tir.bras.play1==true then
		-- 			if jeupause.etat==1 then--technique numero 3 de mise en pause(plus de probleme avec les processeurs mtk et probleme de deferencement)
		-- 				if isoldat[numero].tir.bras.pause1==0 then
		-- 					isoldat[numero].tir.bras.pause1=1
		-- 					isoldat[numero].tir.bras:pause()
		-- 				end
		-- 			else
		-- 				if isoldat[numero].tir.bras.pause1==1 then
		-- 					isoldat[numero].tir.bras.pause1=0
		-- 					isoldat[numero].tir.bras:play()
		-- 				end
		-- 				-- if jeupause.etat==1 then
		-- 				-- 	jeupause.nb=jeupause.nb+1
		-- 				-- 	jeupause.anim[jeupause.nb]=isoldat[numero].tir.bras
		-- 				-- 	isoldat[numero].tir.bras:pause()
		-- 				-- 	--instance2.pause1=1
		-- 				-- end
		-- 				--print("la frame est:"..isoldat[numero].tir.bras.frame)
		-- 				if isoldat[numero].tir.bras.frame==4 and isoldat[numero].tir.bras.oldframe~=4 then
		-- 					--print("fin de l'anim de tir")
		-- 					isoldat[numero].tir.bras.oldframe=4
		-- 					isoldat[numero].tir.bras.play1=false
		-- 				-- if("ended" == event.phase or "cancelled" == event.phase) then
		-- 					demandepro(0,numero,isoldat[numero].x1,isoldat[numero].y1,isoldat[numero].tir,isoldat[numero].pole) --,isoldat[numero].zone1,isoldat[numero].zone2)
		-- 					--group[isoldat[numero].tir.anim.group]:remove(isoldat[numero].tir.anim)
		-- 					--isoldat[numero].tir.anim.isVisible=false
		-- 					print("demande de pro avec un pole de "..pole)
		-- 					isoldat[numero].tir.bras.isVisible=false
		-- 					isoldat[numero].tir.instance.isVisible=true
		-- 					--demandepro(1,numero,isoldat[numero].x1,isoldat[numero].y1,isoldat[numero].tir)
		-- 					--Runtime:removeEventListener( "sprite",instance)
		-- 				else
		-- 					isoldat[numero].tir.bras.oldframe=nil
		-- 				end
		-- 			end
		-- 		end
		-- 	else
		-- 		isoldat[numero].tir.bras.isVisible=false
		-- 		Runtime:removeEventListener( "enterFrame",animtirsolbras)
		-- 	end
		-- end
		-- --isoldat[numero].tir.bras:addEventListener( "sprite", animtirsolbras )
		-- Runtime:addEventListener("enterFrame",animtirsolbras)
	end
	if isoldat[numero].orientation==0 then
		if isoldat[numero].classe==7 then
			isoldat[numero].gene=1
			isoldat[numero].endeplacement=0
			local legeneral=savegameall.generalch[race+1]
			if legeneral==nil then
				legeneral=savegameall.general[race+1]
			end
			isoldat[numero].numdev=320+race*10+legeneral --savegameall.general[race+1]
			local attaquegene
			local viegene
			local levelgene
			attaquegene,viegene,levelgene=attviegene(isoldat[numero].numdev,typesoldat,false)
			isoldat[numero].attaque=attaquegene
			isoldat[numero].vie=viegene
			isoldat[numero].level=levelgene
			-- print("le general à "..savegamedev[isoldat[numero].numdev].." d'experience")
			-- savegamedev[isoldat[numero].numdev]=tonumber(savegamedev[isoldat[numero].numdev])
			-- local testcpt=1
			-- while testcpt<#savegameall.generalxp do
			-- 	if savegamedev[isoldat[numero].numdev]<=savegameall.generalxp[testcpt] then
			-- 		isoldat[numero].level=testcpt
			-- 		testcpt=#savegameall.generalxp+1
			-- 	end
			-- 	testcpt=testcpt+1
			-- end
			-- print("vie avant: "..isoldat[numero].vie.." attaque "..isoldat[numero].attaque)
			-- isoldat[numero].attaque=mathfloor(isoldat[numero].attaque*(1-0.1+isoldat[numero].level*0.1))
			isoldat[numero].attsec=mathfloor(isoldat[numero].attaque*1000/isoldat[numero].timeatt*(isoldat[numero].attnbennemi^0.7)+isoldat[numero].charge/4)
			-- isoldat[numero].vie=mathfloor(isoldat[numero].vie*(1-0.1+isoldat[numero].level*0.1))
			print("vie apres: "..isoldat[numero].vie.." attaque "..isoldat[numero].attaque)

		elseif savegameall.xpactive then
			isoldat[numero].xp=0
			isoldat[numero].level=1
			if levelsoldbat~=nil then
				print("\n\n\n\nisoldat[numero].levelc"..levelsoldbat)
				isoldat[numero].level=levelsoldbat
			end
		end
	end
	-------------------
	-- developpements--
	-------------------
	-- orientation = type1
	if isoldat[numero].orientation==0 then
		print("application des bonus unitee")
		if savegameall.bonussoldat[isoldat[numero].typesoldat-99]~=nil then
			print("bonus existant")
			for i=1,#savegameall.bonussoldat.tableaucont do
				print("recherche bonus "..savegameall.bonussoldat.tableaucont[i])
				if isoldat[numero][savegameall.bonussoldat.tableaucont[i]]~=nil then
					print("isoldat[numero][savegameall.bonussoldat.tableaucont[i]]="..isoldat[numero][savegameall.bonussoldat.tableaucont[i]])
				end
				if savegameall.bonussoldat[isoldat[numero].typesoldat-99][savegameall.bonussoldat.tableaucont[i]]~=nil then
					print("savegameall.bonussoldat[isoldat[numero].typesoldat-99][savegameall.bonussoldat.tableaucont[i]]="..savegameall.bonussoldat[isoldat[numero].typesoldat-99][savegameall.bonussoldat.tableaucont[i]])
				end
				if savegameall.bonussoldat[isoldat[numero].typesoldat-99][savegameall.bonussoldat.tableaucont[i]]~=nil and isoldat[numero][savegameall.bonussoldat.tableaucont[i]]~=nil then
					isoldat[numero][savegameall.bonussoldat.tableaucont[i]]=isoldat[numero][savegameall.bonussoldat.tableaucont[i]]+ savegameall.bonussoldat[isoldat[numero].typesoldat-99][savegameall.bonussoldat.tableaucont[i]]
					print("application bonus"..savegameall.bonussoldat.tableaucont[i])
				end
			end
			if isoldat[numero].tir~=0 then
				if savegameall.bonussoldat[isoldat[numero].typesoldat-99].tir~=nil then
					for i=1,#savegameall.bonussoldat.tableaudist do
						if savegameall.bonussoldat[isoldat[numero].typesoldat-99].tir[savegameall.bonussoldat.tableaudist[i]]~=nil then
							isoldat[numero].tir[savegameall.bonussoldat.tableaudist[i]]=isoldat[numero].tir[savegameall.bonussoldat.tableaudist[i]]+ savegameall.bonussoldat[isoldat[numero].typesoldat-99].tir[savegameall.bonussoldat.tableaudist[i]]
						end
					end
				end
			end
		end
	end

	if isoldat[numero].orientation==0 and not issimulator then
		if race==0 and isoldat[numero].classe==0 then --bonus de race
			isoldat[numero].vie=isoldat[numero].vie*1.1
			isoldat[numero].attaque=isoldat[numero].attaque*1.1
		elseif race==1 and isoldat[numero].classe==1 then
			isoldat[numero].vie=isoldat[numero].vie*1.1
			isoldat[numero].attaque=isoldat[numero].attaque*1.1
		elseif race==2 and isoldat[numero].classe==2 then
			isoldat[numero].vie=isoldat[numero].vie*1.1
			isoldat[numero].attaque=isoldat[numero].attaque*1.1
		end
		isoldat[numero].timeatt=isoldat[numero].timeatt*cadencegent
	end
	--print("attaque = ",isoldat[numero].attaque,"( ajout de ",bonus[D_SOLDAT][0][1][S_ATTAQUE],")")
	------------------------
	-- fin developpements --
	if typesoldat==237 then --squelette gestion taille...
		isoldat[numero].taillesquelette=taillesquelette
		if taillesquelette~=1 then
			isoldat[numero].vie=isoldat[numero].vie*2.5^(taillesquelette-1)
			isoldat[numero].attaque=isoldat[numero].attaque*taillesquelette
			isoldat[numero].scale=isoldat[numero].scale*mathsqrt(taillesquelette)
			isoldat[numero].centrey=taillesquelette*2
			isoldat[numero].vitesse=isoldat[numero].vitesse/taillesquelette^0.2
			isoldat[numero].timedep=isoldat[numero].timedep/taillesquelette^0.2
			isoldat[numero].argent=0
		end
	end

	if isoldat[numero].orientation==0 and isoldat[numero].classe<4 then
		if savegameall.xpactive then
			if isoldat[numero].level>1 then
				for i=2,isoldat[numero].level do
					print("ici ma gueule")
					isoldat[numero].attaque=mathfloor(isoldat[numero].attaque*1.1)
					isoldat[numero].attsec=mathfloor(isoldat[numero].attaque*1000/isoldat[numero].timeatt*(isoldat[numero].attnbennemi^0.7)+isoldat[numero].charge/4)
					print("isoldat[numero].vietotale "..isoldat[numero].vie)
					isoldat[numero].vie=mathfloor(isoldat[numero].vie*1.1)
					print("isoldat[numero].vietotale "..isoldat[numero].vie)
				end
			end
		end
		if modearmy then
			ibatiment[isoldat[numero].numbat].numsolarmy=ibatiment[isoldat[numero].numbat].numsolarmy*1.1
			--ibatiment[isoldat[numero].numbat].nbunit=ibatiment[isoldat[numero].numbat].numsolarmy
			ibatiment[isoldat[numero].numbat].armytt=ibatiment[isoldat[numero].numbat].numsolarmy+ibatiment[isoldat[numero].numbat].armyt*0.8
		end
	end
	if modezombie or modepanique then
		if isoldat[numero].typesoldat==238 or isoldat[numero].typesoldat==244 then
			local puissancezombie=vagueencours
			if puissancezombie>=10 then
				puissancezombie=puissancezombie+(puissancezombie-9)
			end
			if puissancezombie>=20 then
				puissancezombie=puissancezombie+(puissancezombie-19)
			end
			if vagueencours>=30 then
				puissancezombie=puissancezombie+(puissancezombie-25)*1.2
			end
			if vagueencours>=40 then
				puissancezombie=(puissancezombie+(puissancezombie-30))*1.2
			end
			if vagueencours>=50 then
				puissancezombie=(puissancezombie+(puissancezombie-40))*1.5
			end
			isoldat[numero].vie=isoldat[numero].vie*mathsqrt(puissancezombie)
			isoldat[numero].attaque=isoldat[numero].attaque*(1+puissancezombie*0.25)
			isoldat[numero].attsec=mathfloor(isoldat[numero].attaque*1000/isoldat[numero].timeatt)
			isoldat[numero].vitesse=isoldat[numero].vitesse*(1+puissancezombie*0.01)
			print("vagueencours")
		end
	end
	isoldat[numero].vie=mathfloor(isoldat[numero].vie)
	isoldat[numero].vietotale=isoldat[numero].vie
	isoldat[numero].vitesse=isoldat[numero].vitesse*0.3+mathrandom(-2,2)*0.05--*0.5--*0.3
	isoldat[numero].vie=isoldat[numero].vie+1
	isoldat[numero].attaque=mathfloor(isoldat[numero].attaque)
	if isoldat[numero].typesoldat==275 or (isoldat[numero].typesoldat>=170 and isoldat[numero].typesoldat<180) then
		local regenerationviesol
		local typedebonus=1 -- 1 regenere vie, 2 augmente l'attaque, 3 bloque plus d'ennemi
		if isoldat[numero].typesoldat==275 then
			regenerationviesol=isoldat[numero].regenevie
			isoldat[numero].regenevie=0
		elseif isoldat[numero].typesoldat==173 or isoldat[numero].typesoldat==174 or isoldat[numero].typesoldat==175 then
			regenerationviesol=15
		elseif isoldat[numero].typesoldat==171 or isoldat[numero].typesoldat==170 or isoldat[numero].typesoldat==172 then
			regenerationviesol=1
			typedebonus=2
		elseif isoldat[numero].typesoldat==176 or isoldat[numero].typesoldat==177 or isoldat[numero].typesoldat==178 then
			regenerationviesol=1
			typedebonus=3
		end
		local numerosoldat=numero
		local compteur=30
		local compteur1=3
		local tabsoldbonus={}
		local fpschoisitest=false
		local function regenerationviecercle( event )
			if not removetotal then
				if isoldat[numerosoldat].vivant then -- or isoldat[numerosoldat].endeplacement==1 then
					if jeupause.etat==0 then
						if compteur>=60 then
							--print("yo")
							compteur=0
							compteur1=compteur1+1
							if compteur1>=2 then
								compteur1=0
								if fpschoisicycle<1 then
									fpschoisitest=true
								else
									fpschoisitest=false
								end
							else
								fpschoisitest=false
							end

							-- local poussiere
							-- if fpschoisitest then
							-- 	poussiere=display.newImage(impro.poussiere,1)
							-- 	poussiere.xScale=0.01
							-- 	poussiere.yScale=poussiere.xScale
							-- 	poussiere.alpha=0.8
							-- 	poussiere.x=isoldat[numerosoldat].x1
							-- 	poussiere.y=isoldat[numerosoldat].y1+10+isoldat[numerosoldat].centrey
							-- 	poussiere.group=mathfloor(poussiere.y+1024)
							-- 	group[poussiere.group]:insert(poussiere)
							-- 	if typedebonus==1 then
							-- 		poussiere:setFillColor(0,1,0)
							-- 	elseif typedebonus==2 then
							-- 		poussiere:setFillColor(0.8,0,0)
							-- 	else
							-- 		poussiere:setFillColor(0,0,0.8)
							-- 	end
							-- 	local latransition=transition.to(poussiere,{time=1500*vitessejeuin,transition=easing.outQuad,alpha=0.5,xScale=0.28,yScale=0.28,y=poussiere.y-10,onComplete=destructeurpartieltran,onCancel=destructeurpartieltran,tag="elementtype"})
							-- 	if jeupause.etat==1 then
							-- 		transition.pause(latransition)
							-- 	end
							-- end

							--print("typedebonus "..typedebonus)
							if typedebonus==1 then

								-- if fpschoisitest then
								-- 	local latransition=transition.to(poussiere,{time=1500*vitessejeuin,transition=easing.outQuad,alpha=0.5,xScale=0.28,yScale=0.28,y=poussiere.y-10,onComplete=destructeurpartieltran,onCancel=destructeurpartieltran,tag="elementtype"})
								-- 	poussiere:setFillColor(0,1,0)
								-- 	if jeupause.etat==1 then
								-- 		transition.pause(latransition)
								-- 	end
								-- end
								local mini=1
								local maxi=nbsoldat
								if isoldat[numerosoldat].orientation==1 then
									mini=nbsoldatg
									maxi=-1
								end	
								for i=mini,maxi do	
								--for i=1,nbsoldat do
									if isoldat[i].zone1==isoldat[numerosoldat].zone1 or isoldat[i].zone2==isoldat[numerosoldat].zone2  or isoldat[i].zone3==isoldat[numerosoldat].zone3 or i==numerosoldat then
										if isoldat[i].vivant and isoldat[numerosoldat].orientation==isoldat[i].orientation then
											if 2500>(isoldat[i].x1-isoldat[numerosoldat].x1)*(isoldat[i].x1-isoldat[numerosoldat].x1)+(isoldat[i].y1-isoldat[numerosoldat].y1)*(isoldat[i].y1-isoldat[numerosoldat].y1)*0.8 then
												regenerationvie(i,regenerationviesol)
												--print("regenerationvie "..i)
											end
										end
									end
								end
							elseif typedebonus==2 or typedebonus==3 then
								-- if fpschoisitest then
								-- 	if typedebonus==2 then
								-- 		poussiere:setFillColor(0.8,0,0)
								-- 	else
								-- 		poussiere:setFillColor(0,0,0.8)
								-- 	end
								-- 	poussiere.xScale=0.24
								-- 	poussiere.yScale=poussiere.xScale
								-- 	poussiere.alpha=0.4
								-- 	print("yo\n\n\n\n\n\n")
								-- 	local latransition=transition.to(poussiere,{time=3000*vitessejeuin,alpha=0.1,xScale=0.28,yScale=0.28,y=poussiere.y-10,onComplete=destructeurpartieltran,onCancel=destructeurpartieltran,tag="elementtype"})
								-- 	if jeupause.etat==1 then
								-- 		transition.pause(latransition)
								-- 	end
								-- end
								local mini=1
								local maxi=nbsoldat
								if isoldat[numerosoldat].orientation==1 then
									mini=nbsoldatg
									maxi=-1
								end	
								for i=mini,maxi do
								--for i=1,nbsoldat do
									if isoldat[i].zone1==isoldat[numerosoldat].zone1 or isoldat[i].zone2==isoldat[numerosoldat].zone2  or isoldat[i].zone3==isoldat[numerosoldat].zone3 or i==numerosoldat then
										if isoldat[i].vivant and isoldat[numerosoldat].orientation==isoldat[i].orientation and not isoldat[i].mine then
											if 2500>(isoldat[i].x1-isoldat[numero].x1)*(isoldat[i].x1-isoldat[numero].x1)+(isoldat[i].y1-isoldat[numero].y1)*(isoldat[i].y1-isoldat[numero].y1)*0.8 then
												if typedebonus==2 and tabsoldbonus[i]~=true then
													isoldat[i].attaque=isoldat[i].attaque+isoldat[i].niveau*regenerationviesol
													isoldat[i].attsec=mathfloor(isoldat[i].attaque*1000/isoldat[i].timeatt*(isoldat[i].attnbennemi^0.7)+isoldat[i].charge/4)
												elseif tabsoldbonus[i]~=true then
													isoldat[i].blocnbennemi=isoldat[i].blocnbennemi+isoldat[i].niveau*regenerationviesol
												end
												if fpschoisitest then
												-- 		-- local regeneanim=display.newSprite(effetexplo.regene,effetexplo.regeneseq)
												-- 		-- if typedebonus==2 then
												-- 		-- 	regeneanim:setFillColor(1,0,0)
												-- 		-- else
												-- 		-- 	regeneanim:setFillColor(0,0,1)
												-- 		-- end
												-- 		-- regeneanim.xScale=0.1
												-- 		-- regeneanim.alpha=0.5
												-- 		-- regeneanim.yScale=regeneanim.xScale
												-- 		-- regeneanim:setSequence("levelup")
												-- 		-- regeneanim.x=isoldat[i].x1
												-- 		-- regeneanim.y=isoldat[i].y1-2*isoldat[i].centrey
												-- 		-- regeneanim.group=mathfloor(regeneanim.y+1035)
												-- 		-- group[regeneanim.group]:insert(regeneanim)
												-- 		-- spritegestion(regeneanim)
														local regeneanim
														--print("ici")
														if typedebonus==2 then
															regeneanim=display.newImage(effetexplo.regenevie,3)
															regeneanim:setFillColor(1,0,0)
															regeneanim.xScale=0.40
														else
															regeneanim=display.newImage(effetexplo.regenevie,2)
															regeneanim:setFillColor(0,0,1)
															regeneanim.xScale=0.30 --0.22
														end
														
														regeneanim.yScale=regeneanim.xScale
														regeneanim.alpha=0.8
														regeneanim.x=isoldat[i].x1+mathrandom(-2,2)*5
														regeneanim.y=isoldat[i].y1-2*isoldat[i].centrey
														regeneanim.group=mathfloor(regeneanim.y+1035)
														group[regeneanim.group]:insert(regeneanim)
														local latransition=transition.to(regeneanim,{time=1500*vitessejeuin,alpha=0.1,y=regeneanim.y-10,onComplete=destructeurpartieltran,onCancel=destructeurpartieltran,tag="elementtype"})
														if jeupause.etat==1 then
															transition.pause(latransition)
														end
												end
												if affinfotab.num==i and affinfotab.type==0 and affinfogr.isVisible then
													affinfo(i,true,true)
												end
												tabsoldbonus[i]=true
											end
										end
									elseif tabsoldbonus[i]~=nil then
										if isoldat[i].vivant then
											if typedebonus==2 then
												isoldat[i].attaque=isoldat[i].attaque-isoldat[i].niveau*regenerationviesol
												if affinfotab.num==i and affinfotab.type==0 and affinfogr.isVisible then
													affinfo(i,true,true)
												end
											else
												isoldat[i].blocnbennemi=isoldat[i].blocnbennemi-isoldat[i].niveau*regenerationviesol
											end
										end
										tabsoldbonus[i]=nil
									end
								end
							end
						else
							compteur=compteur+1
						end
					end
				else
					if typedebonus==2 or typedebonus==3 then
						for i=nbsoldatg,nbsoldat do
							if tabsoldbonus[i]~=nil then
								if isoldat[i].vivant then
									if typedebonus==2 then
										isoldat[i].attaque=isoldat[i].attaque-isoldat[i].niveau*regenerationviesol
										if affinfotab.num==i and affinfotab.type==0 and affinfogr.isVisible then
											affinfo(i,true,true)
										end
									else
										isoldat[i].blocnbennemi=isoldat[i].blocnbennemi-isoldat[i].niveau*regenerationviesol
									end
								end
							end
							tabsoldbonus[i]=nil
						end
					end
					Runtime:removeEventListener("enterFrame",regenerationviecercle)
					tabsoldbonus=nil
				end
			else
				Runtime:removeEventListener("enterFrame",regenerationviecercle)
				tabsoldbonus=nil
			end
		end
		Runtime:addEventListener( "enterFrame", regenerationviecercle )
	end
	if isoldat[numero].typesoldat==172 then
		isoldat[numero].tir.vitesse=1.5+0.1*isoldat[numero].level
		isoldat[numero].tir.cadence=1500-140*isoldat[numero].level^0.5
		isoldat[numero].tir.timean=1.5-0.14*isoldat[numero].level^0.5
		isoldat[numero].tir.porte=30000*(1+isoldat[numero].level*0.08)
	end
	--isoldat[numero].vie=1000
	-- if modepanique and isoldat[numero].orientation==1 then
	-- 	isoldat[numero].vitesse=isoldat[numero].vitesse*2
	-- end
	return numero
end

function soldat.new (numero,typesoldat,numbat,pole,level)--demande du creation d'un nouveau soldat
	-- creation de la classe
	--peu etre la cause du bug des soldats du pouvoir 1
	local etapesui=true
	if isoldat[numero]~=nil then
		if isoldat[numero].vie==nil or isoldat[numero].vie<=0 then
			
		else
			etapesui=false
		end
	end
	if etapesui then
	local newSoldat = 
	{
		-- caracteristique est un tableau contenant toutes les variables liés a un soldat, retourné par la fonction caracteristiqueSoldat
		caracteristique= caracteristiqueSoldat (numero, typesoldat,numbat,pole,level)
	}
	return setmetatable( newSoldat, soldat_mt )
	else
		local newSoldat={1,2}
		return setmetatable( newSoldat, soldat_mt )
	end
end
function soldat:debut(numero,poitspawn,yspawn)--demande de spawn du soldat -- si yspawn alors poitspawn correspond au x du spawn
	if isoldat[numero].vie==nil or isoldat[numero].vie==isoldat[numero].vietotale+1 then
		isoldat[numero].vie=isoldat[numero].vie-1
		if isoldat[numero].orientation==1 then
			if modeinfini then
				if modeinfdif==0 then
					if varviemech~=1 then
						isoldat[numero].vie=mathfloor(isoldat[numero].vie*varviemech)
						isoldat[numero].vietotale=isoldat[numero].vie
						isoldat[numero].argent=mathfloor(isoldat[numero].argent/varviemech)
					end
				end
			end
			isoldat[numero].vitesse=isoldat[numero].vitesse*accelererenn
			isoldat[numero].timedep=isoldat[numero].timedep*accelererenn
			if isoldat[numero].typesoldat==275 and isoldat[numero].ombre.ombre~=nil then
				isoldat[numero].ombre.ombre:setFillColor(1,0,0)
			else
				isoldat[numero].ombre:setFillColor(1,0,0)
			end
			if isoldat[numero].rectvie==nil then
				--print("pas de bar de vie!")
				isoldat[numero].rectvie=display.newRect( chemin[1].x-5, chemin[1].y+20+isoldat[numero].pole, 20, 1 )
			else
				isoldat[numero].rectvie.x=chemin[1].x-5
				isoldat[numero].rectvie.y=chemin[1].y-10+isoldat[numero].pole
				isoldat[numero].rectvie.width=20
				-- isoldat[numero].rectvie.height=1 -- pas besoin car la bar de vie ne change jamais de taille
				--("bar de vie!")
			end
			if isoldat[numero].rectxp~=nil then
				isoldat[numero].rectxp.isVisible=false
			end
			--isoldat[numero].rectvie=display.newRect( chemin[1].x-5, chemin[1].y+20+isoldat[numero].pole, 20, 1 )
			isoldat[numero].rectvie:setFillColor( 0,1,0 )
			isoldat[numero].rectvie.alpha=0--
			isoldat[numero].numgroup=mathfloor(chemin[1].y+isoldat[numero].pole)+1024
			group[isoldat[numero].numgroup]:insert(isoldat[numero].rectvie)
			isoldat[numero].point=1
			local spawnpasreal=true
			if poitspawn~=nil then
				if yspawn~=nil then
					spawnpasreal=false
					animdep1.animdep(-poitspawn,-poitspawn+isoldat[numero].xposi,yspawn,yspawn+isoldat[numero].yposi-isoldat[numero].centrey+isoldat[numero].pole,numero)
				else
					if poitspawn>1 then
						if poitspawn<10 then
							if poitspawn-1>#pointdep then
								isoldat[numero].point=1
							else
								isoldat[numero].point=pointdep[poitspawn-1]	
							end
						else
							isoldat[numero].point=poitspawn-10
						end
					elseif poitspawn<0 then
						spawnpasreal=false
						print("numero"..numero)
						isoldat[numero].point=isoldat[-poitspawn].point
						print("point")
						animdep1.animdep(isoldat[-poitspawn].x1,chemin[isoldat[numero].point+1].x+isoldat[numero].xposi,isoldat[-poitspawn].y1,chemin[isoldat[numero].point+1].y+isoldat[numero].yposi-isoldat[numero].centrey+isoldat[numero].pole,numero)
					end
				end		
			end
			if spawnpasreal then
				if isoldat[numero].point>cheminnb then
					isoldat[numero].point=cheminnb-1
				end
				print("\nnumero "..numero.." point "..isoldat[numero].point)
				animdep1.animdep(chemin[isoldat[numero].point].x+isoldat[numero].xposi,chemin[isoldat[numero].point+1].x+isoldat[numero].xposi,chemin[isoldat[numero].point].y+isoldat[numero].yposi-isoldat[numero].centrey+isoldat[numero].pole,chemin[isoldat[numero].point+1].y+isoldat[numero].yposi-isoldat[numero].centrey+isoldat[numero].pole,numero)--,200)--background.xScale*0.3  isoldat[numero].vitesse,
			end
		else--1
			if isoldat[numero].classe<4 then
				if isoldat[numero].niveau>4 then
					isoldat[numero].niveau=isoldat[numero].niveau-4
				end
				local xdeb,ydeb,xfin,yfin
				if poitspawn~=nil then
					if yspawn~=nil then
						spawnpasreal=false
						xdeb=-poitspawn
						xfin=-poitspawn+isoldat[numero].xposi
						ydeb=yspawn
						yfin=yspawn+isoldat[numero].yposi-isoldat[numero].centrey+isoldat[numero].pole
					else
						if poitspawn>1 then
							if poitspawn<10 then
								isoldat[numero].point=pointdep[poitspawn-1]	
							else
								isoldat[numero].point=poitspawn-10
							end
							xdeb=chemin[isoldat[numero].point].x
							xfin=chemin[isoldat[numero].point+1].x+isoldat[numero].xposi
							ydeb=chemin[isoldat[numero].point].y
							yfin=chemin[isoldat[numero].point+1].y+isoldat[numero].yposi-isoldat[numero].centrey+isoldat[numero].pole
						elseif poitspawn<0 then
							isoldat[numero].point=isoldat[-poitspawn].point
							xdeb=isoldat[-poitspawn].x1
							xfin=chemin[isoldat[numero].point+1].x+isoldat[numero].xposi
							ydeb=isoldat[-poitspawn].y1
							yfin=chemin[isoldat[numero].point+1].y+isoldat[numero].yposi-isoldat[numero].centrey+isoldat[numero].pole
						end
					end		
				end
				if xdeb==nil then
					xdeb=ibatiment[isoldat[numero].numbat].x1
					xfin=ibatiment[isoldat[numero].numbat].drap.x+isoldat[numero].xposi
					ydeb=ibatiment[isoldat[numero].numbat].y1+10
					yfin=ibatiment[isoldat[numero].numbat].drap.y+isoldat[numero].yposi-isoldat[numero].centrey
					if goh then
						ydeb=ydeb+50
					end
					if fpschoisicycle==0 then
						print("cherche")
						local xouy=true
						local xsigne=(mathrandom(1,2)-1)*2-1
						local ysigne=(mathrandom(1,2)-1)*2-1
				
						local trouver=true
						while trouver do
							trouver=false
							for i=nbsoldatg,-1 do
								if isoldat[i].orientation==0 and isoldat[i].classe<4 and i~=numero and isoldat[i].vivant then
									if isoldat[i].xposi==isoldat[numero].xposi and isoldat[i].yposi==isoldat[numero].yposi and isoldat[numero].numbat==isoldat[i].numbat then
										if mathrandom(2)==1 then
											isoldat[numero].xposi=isoldat[numero].xposi+xsigne*6
										else
											isoldat[numero].yposi=isoldat[numero].yposi+ysigne*6
										end
										trouver=true
									end
								end
							end
						end
					end
				end

				isoldat[numero].ombre:setFillColor(0,0.6,0)
				if isoldat[numero].rectvie==nil then
					isoldat[numero].rectvie=display.newRect(xdeb-5,ydeb-20,20,1)-- ibatiment[isoldat[numero].numbat].x-5, ibatiment[isoldat[numero].numbat].y-10, 20, 1 )
				else
					isoldat[numero].rectvie.x=xdeb-5 --ibatiment[isoldat[numero].numbat].x-5
					isoldat[numero].rectvie.y=ydeb-20 --ibatiment[isoldat[numero].numbat].y-10
					isoldat[numero].rectvie.width=20
				end
				isoldat[numero].rectvie:setFillColor( 0,1,0 )
				isoldat[numero].rectvie.alpha=0
				if isoldat[numero].rectxp==nil and savegameall.xpactive then
					isoldat[numero].rectxp=display.newRect(xdeb-5,ydeb-18,0,1) -- ibatiment[isoldat[numero].numbat].x-5, ibatiment[isoldat[numero].numbat].y-8, 0, 1 )
				elseif savegameall.xpactive then
					isoldat[numero].rectxp.x=xdeb-5 -- ibatiment[isoldat[numero].numbat].x-5
					isoldat[numero].rectxp.y=ydeb-18 --ibatiment[isoldat[numero].numbat].y-8
					isoldat[numero].rectxp.width=0
				end
				if not savegameall.xpactive and isoldat[numero].rectxp~=nil then
					isoldat[numero].rectxp.isVisible=false
				end
				isoldat[numero].numgroup=mathfloor(ydeb-10)+1024 --ibatiment[isoldat[numero].numbat].y)+1024
				group[isoldat[numero].numgroup]:insert(isoldat[numero].rectvie)
				if savegameall.xpactive then
					isoldat[numero].rectxp.isVisible=true
					isoldat[numero].rectxp:setFillColor( 0,0,1 )
					isoldat[numero].rectxp.alpha=0
					group[isoldat[numero].numgroup]:insert(isoldat[numero].rectxp)
				end
				animdep1.animdep(xdeb,xfin,ydeb,yfin,numero) --ibatiment[isoldat[numero].numbat].x,ibatiment[isoldat[numero].numbat].drap.x+isoldat[numero].xposi,ibatiment[isoldat[numero].numbat].y+10,ibatiment[isoldat[numero].numbat].drap.y+isoldat[numero].yposi-isoldat[numero].centrey,numero)--,ibatiment[isoldat[numero].numbat].niveau
			elseif isoldat[numero].classe<7 then--0
				print("soldat "..numero.." est ici")
				-- local x
				-- local y
				-- if isoldat[numero].classe<6 then
				-- 	x=pouvoir1action[isoldat[numero].pouvoir].x
				-- 	y=pouvoir1action[isoldat[numero].pouvoir].y
				-- end
				isoldat[numero].ombre:setFillColor(0,0.6,0)
				if isoldat[numero].rectvie==nil then
					isoldat[numero].rectvie=display.newRect( pouvoir1action[isoldat[numero].pouvoir].x-5, pouvoir1action[isoldat[numero].pouvoir].y-10, 20, 1 )
				else
					isoldat[numero].rectvie.x=pouvoir1action[isoldat[numero].pouvoir].x-5
					isoldat[numero].rectvie.y=pouvoir1action[isoldat[numero].pouvoir].y-10
					isoldat[numero].rectvie.width=20
				end
				isoldat[numero].rectvie:setFillColor( 0,1,0 )
				isoldat[numero].rectvie.alpha=0
				if isoldat[numero].rectxp==nil and savegameall.xpactive then
					isoldat[numero].rectxp=display.newRect( pouvoir1action[isoldat[numero].pouvoir].x-5, pouvoir1action[isoldat[numero].pouvoir].y-8, 0, 1 )
				elseif savegameall.xpactive then
					isoldat[numero].rectxp.x=pouvoir1action[isoldat[numero].pouvoir].x-5
					isoldat[numero].rectxp.y=pouvoir1action[isoldat[numero].pouvoir].y-8
					isoldat[numero].rectxp.width=0
				end
				isoldat[numero].numgroup=mathfloor( pouvoir1action[isoldat[numero].pouvoir].y)+1024
				group[isoldat[numero].numgroup]:insert(isoldat[numero].rectvie)
				if savegameall.xpactive then
					isoldat[numero].rectxp.isVisible=true
					isoldat[numero].rectxp:setFillColor( 0,0,1 )
					isoldat[numero].rectxp.alpha=0
					group[isoldat[numero].numgroup]:insert(isoldat[numero].rectxp)
				end
				local xdepart=pouvoir1action[isoldat[numero].pouvoir].x-isoldat[numero].xposi*2
				local ydepart=pouvoir1action[isoldat[numero].pouvoir].y-isoldat[numero].yposi*2
				local xarrive=pouvoir1action[isoldat[numero].pouvoir].x+isoldat[numero].xposi+2
				local yarrive=pouvoir1action[isoldat[numero].pouvoir].y+isoldat[numero].yposi+2
				if isoldat[numero].typesoldat==143 or isoldat[numero].typesoldat==145 or isoldat[numero].typesoldat==146 then
					xdepart=pouvoir1action[isoldat[numero].pouvoir].x+isoldat[numero].xposi
					ydepart=pouvoir1action[isoldat[numero].pouvoir].y+isoldat[numero].yposi
				end

				animdep1.animdep(xdepart,xarrive,ydepart,yarrive,numero)
			else--0
				if (isoldat[numero].typesoldat>=170 and isoldat[numero].typesoldat<180) then
					isoldat[numero].ombre.ombre:setFillColor(0,0,1)
				else
					isoldat[numero].ombre:setFillColor(0,0,1)
				end
				-- if genepoint.nb~=-1 then 
				-- 	genepoint.nb=-2
				-- end
				if isoldat[numero].rectvie==nil then
					isoldat[numero].rectvie=display.newRect( genepoint.x-5, genepoint.y-10, 20, 1 )
				else
					isoldat[numero].rectvie.x=genepoint.x-5
					isoldat[numero].rectvie.y=genepoint.y-10
					isoldat[numero].rectvie.width=20
				end
				if isoldat[numero].rectxp==nil then
					isoldat[numero].rectxp=display.newRect( genepoint.x-5, genepoint.y-8,40, 1 )
				else
					isoldat[numero].rectxp.x=genepoint.x-5
					isoldat[numero].rectxp.y=genepoint.y-8
					isoldat[numero].rectxp.width=40
				end
				isoldat[numero].rectxp.isVisible=true
				isoldat[numero].rectxp:setFillColor( 0,0,1 )
				isoldat[numero].rectxp.alpha=0
				local largeurbar=isoldat[numero].level
				if largeurbar==1 then
					largeurbar=mathfloor(savegamedev[isoldat[numero].numdev]/savegameall.generalxp[largeurbar]*10)*0.1
				else
					largeurbar=mathfloor((savegamedev[isoldat[numero].numdev]-savegameall.generalxp[largeurbar-1])/(savegameall.generalxp[largeurbar]-savegameall.generalxp[largeurbar-1])*10)*0.1
				end
				isoldat[numero].rectxp.width=40*largeurbar

				isoldat[numero].rectvie:setFillColor( 0,1,0 )
				isoldat[numero].rectvie.alpha=0
				
				isoldat[numero].numgroup=mathfloor(genepoint.y)+1024
				group[isoldat[numero].numgroup]:insert(isoldat[numero].rectvie)
				group[isoldat[numero].numgroup]:insert(isoldat[numero].rectxp)
				animdep1.animdep(genepoint.x+isoldat[numero].xposi,genepoint.x,genepoint.y+isoldat[numero].yposi,genepoint.y-isoldat[numero].centrey,numero)
			end--0
		end
	end
end
return soldat