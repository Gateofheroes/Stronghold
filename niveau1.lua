---fonction gerant le lancement d'un niveau(pour lancer le niveau il recupere les donnees des fichiers level)
local t = {}--fonction qu'on declare, etudier facon de la declarer, obj trouver les void, fonction inutile
t.niveau1 = function (modedelancement)--mode de lancement indique si des elements sont deja charger, permet de faire des optimisation
--[[gameanalytics = require 'plugin.gameanalytics_v2'
gameanalytics.startSession()
gameanalytics.addProgressionEvent {
    progressionStatus = "Start",
    progression01 = ""..niveauch,
}
--]]
-- local stringt=""
-- for i=200,300 do
-- 	if tabsoldexist[i] then
-- 		stringt=stringt..i..",0,0,0,0,"
-- 	end
-- end
-- print(stringt)
	-- if goh then
	-- 	if (niveauch>16 or modezombie or modepanique or modeinfini or modesquelette ) then 

	-- 	else
	-- 		loadshortads()
	-- 	end
	-- end
	-- if not goh or (niveauch<=16 and not modezombie and not modepanique and not modeinfini and not modesquelette) then
	-- 	loadshortads()
	-- end
	loadadsnewlife()
	menuactuel=5
	print("collectgarbage niveau1 avant"..collectgarbage("count"))
	system.setIdleTimer( false )
	findelapartie=false
	mdmoyennechosi=1
	vitessejeu=2 --accelere le jeu
	vitessejeuin=1/vitessejeu --valeur de l'acceleration inversé (pour opt pour timer)

	numposi=1
	modedelancementinit=false
	if modedelancement==0 then--permet de gerer la taille et la position des boutons en fonctions de la taille de l'ecran
		modedelancementinit=true
	end

	-- debut retourdinformation
	 retinf=nil
	 retinf={}
	 -- for i=1,300 do
	 -- 	if tabsoldexist[i]~=nil then
	 -- 		if tabsoldexist[i] then
	 -- 			print(i)
	 -- 			print(i.." "..image[i].attsec)
	 -- 		end
	 -- 	end
	 -- end
	-- if retourinfo~=nil then
	-- 	-- nb heure de mise en place et perte de perf
	-- 	-- nbennemikill=0 0.5 1
	-- 	-- type de chaque batiment construit 1 0.5
	-- 	-- nb de vie restante 0.5 0
	-- 	-- tune restante a la fin 0.5 0
	-- 	-- vague testé 0.5 0
	-- 	-- race choisi 0.5 0
	-- 	-- duree de la partie (reel) 1 0.5
	-- 	-- temps mis en accelerer 2 2
	-- 	-- niveau du joueur (nombre de dev fait) 2 0.5
	-- 	-- nb d'utlisation de chauqe pouvoir (et nb de kill poour le pv2) 2 3
	-- 	-- total de tune gagné 1 1
	-- 	-- gene utilisé 0.5 0
	-- 	-- tune gagné par les mines (cumulé) 1 1
	-- 	-- temps ou la mine a pas 100% des vies 2 2
	-- 	-- temps ou la mine est pleinne 2 2
	-- 	-- si possible avoir le nb de vie enlever en cumuler par bat (de tir, contact) 4 6
	--  -- table regroupant le nb de perso sur le terrain de atteint un seuil de lag.
	-- 	if levelinf==true then
	-- 		-- type de niveau inf (gain...) 0.5 0
	-- 		-- map 0.5 0
	-- 		-- nb mine 0.5 0
	-- 		--puissance max 0.5 0
	-- 		--nbvague 0.5 0
	-- 		--tout info de la uissance de la derniere vague 1 0
	-- 	end

	-- partie utile--
		retinf.nbgenemort=0
		retinf.nbperte=0
		debutpartie=0 --os.clock()
		-- debutpartietemps
		retinf.attpv1=0
		retinf.pv1nb=0 -- nombre d'utilisation
		retinf.attpv2=0
		retinf.pv2nb=0
		retinf.attpv3=0
		retinf.pv3nb=0
		retinf.attgene=0
		retinf.ordredecrea="{" --tout les ordres de creation de batiment et de devellopement
		retinfordredecreanb=0
		retinf.laginfo="{"
		retinflaginfonb=0
		retinf.laginfohelp=1
		retinf.laginfohelp1=0
		retinf.victoire=0
		retinf.dureepause=0
		retinf.dureeacc=0
		retinf.nbpause=0
		retinf.nbacc=0
		retinf.date=gettime()
		retinfdureetempausetemp=0
		retinf.dureetempacc=0
		retinf.ordrespawn=[[{"vagueencours":"1"]]
		retinf.nbaction=0

	-- end
	-- fin retourdinformation

	--apparence=1.3
	if modedelancement==0 then
		-- local chargementaffichage = require ( "chargementaff")
		-- chargementevo()
		--local chargementaffichage = require ( "chargementaff")
		--chargementsup()
		--imgchargement:removeSelf()
		-- artha:removeSelf()
		-- bvide:removeSelf()
		-- bplein:removeSelf()
		-- bdeb:removeSelf()
	end
	removepartiel1=false
	removetotal=false
	--if modedelancement==0 then
	--	modeinfini=false
	--	dureepartie=1 --coefficient de duree de la partie, plus le nb est grand plus la partie dura longtemps (divise les gains par mort et mine par dureepartie)
	--	accelererenn=1 --coefficient d'acceleration des ennemis (spwan plus vite, temps entre vague plus vbite et dep plus vite)
	--end
	--local niveau=1
	if nbvague~=nil then
		nbvague=nbvague
	elseif multi==0  then
		if modewave then
			nbvague=1
		else
			nbvague=leveldata[niveauch].wave
		end
	else
		nbvague=3
	end 
	local level=nil
	if (niveauch>=1 and niveauch<=16) or tutolevel0 then
		strfile="level"..niveauch
		if goh then
			strfile=strfile.."goh"
			if modezombie or modepanique then
				strfile="level0goh"
			end
		end
		level=require(strfile)
	-- if niveauch==1 then
	-- 	level=require("level1")
	-- 	print("level1")
	-- elseif niveauch==2 then
	-- 	level=require("level2")
	-- 	print("level2")
	-- elseif niveauch==3 then
	-- 	level=require("level3")
	-- 	print("level3")
	-- elseif niveauch==4 then
	-- 	level=require("level4")
	-- 	print("level4")
	-- elseif niveauch==5 then
	-- 	level=require("level5")
	-- 	print("level5")
	-- elseif niveauch==6 then
	-- 	level=require("level6")
	-- 	print("level6")
	-- elseif niveauch==7 then
	-- 	level=require("level7")
	-- 	print("level7")
	-- elseif niveauch==8 then
	-- 	level=require("level8")
	-- 	print("level8")
	-- elseif niveauch==9 then
	-- 	level=require("level9")
	-- 	print("level9")
	-- elseif niveauch==10 then
	-- 	level=require("level10")
	-- 	print("level10")
	-- elseif niveauch==11 then
	-- 	level=require("level11")
	-- 	print("level11")
	-- elseif niveauch==12 then
	-- 	level=require("level12")
	-- 	print("level12")
	-- elseif niveauch==13 then
	-- 	level=require("level13")
	-- 	print("level13")
	-- elseif niveauch==14 then
	-- 	level=require("level14")
	-- 	print("level14")
	-- elseif niveauch==15 then
	-- 	level=require("level15")
	-- 	print("level15")
	-- elseif niveauch==16 then
	-- 	level=require("level16")
	-- 	print("level16")
	-- 	-- elseif niveauch==31 then
	-- 	-- 	level=require("level1inf")
	-- 	-- 	print("level1inf")
	-- 	-- elseif niveauch==32 then
	-- 	-- 	level=require("level2inf")
	-- 	-- 	print("level2inf")
	elseif niveauch==21 then
		level=require("levelmulti1")
		print("levelmulti1")
	elseif niveauch==22 then
		level=require("levelmulti2")
		print("levelmulti2")
	end
	if modedelancement==0 then
		infoniveaucolor={}
		if niveauch<=4 then
			infoniveaucolor={0.2,0.2,0.2}
			--removemodedejeutext1.modedejeutext:setFillColor(0.2,0.2,0.2)
		elseif niveauch<=8 then
			infoniveaucolor={0.2,0.2,0.2}
			--removemodedejeutext1.modedejeutext:setFillColor(0.2,0.2,0.2)
		elseif niveauch<=12 then
			infoniveaucolor={0.2,0.2,0.2}
			--removemodedejeutext1.modedejeutext:setFillColor(0.2,0.2,0.2)
		else
			infoniveaucolor={0.7,0.7,0.7}
			--removemodedejeutext1.modedejeutext:setFillColor(0.7,0.7,0.7)
		end
	end
	creationtime=0--permet de pas rentrer plein de fois dans la fin de touch de batiment dans creation
	nombredekill=0
	nombredeviett=0
	posi=0--position du soldat pour eviter qu'ils se suivent tous
	if modedelancement==0 then
		level:donneebase()
		if modewave then
			argentdep=-(leveldata[niveauch].wavetune)*3
		else
			if contreai==0 and modeinfini==false and aiactive==1 and contreaihaut==1 then
				argentdep=-(400)*3
				ennemipassedep=10
				nbvague=15
			end
			if contreai==1 and modeinfini==false and aiactive==1 and contreaihaut==1 then
				argentdep=-(400)*3
				ennemipassedep=10
			end
			if modezombie or modepanique then
				nbvague=10
			end
		end
		if modehard or modewave then
			ennemipassedep=1
		end
	end

	ennemipasse=ennemipassedep
	argent=argentdep
	if contreai==1 then
		argentai=argentdep
		ennemipasseai=ennemipassedep
	end
	--affinfotab={}
	nbfoisdiamantforlife=1 
	print("remise de la tune"..argentdep)

	if modedelancement==0 then
		level:new()--display.newImage( "carte/carte1a.png", 0,0,true )
		if issimulator then
			local memUsed = (collectgarbage("count")) / 1000
			local texUsed = system.getInfo( "textureMemoryUsed" ) / 1000000
			print("---------MEMORY USAGE INFORMATION donneebase apres---------")
			print("System Memory Used:", string.format("%.03f", memUsed), "Mb")
			print("Texture Memory Used:", string.format("%.03f", texUsed), "Mb")
			print("------------------------------------------")
			--local testzdsef=display.newEmbossedText(textUsed,0,0,fonttype,20)
		end
		level.affichagecarte (0)
		if contreai==1 then
			level.affichagecarte(1)
			map2.y=map2.y+2048
			map1:insert(map2)
			-- hg1=display.newImage(map1sheethg,1) --display.newImage( "carte/level2/hg.png", -1024,-512,true )
			-- hg1.x=-1024
			-- hg1.y=-512+2048
			-- hd1=display.newImage(map1sheethd,1) --display.newImage( "carte/level2/hd.png",1024,-512,true )
			-- hd1.x=1024
			-- hd1.y=-512+2048
			-- bg1=display.newImage(map1sheetbg,1) --display.newImage( "carte/level2/bg.png", -1024,512,true )
			-- bg1.x=-1024
			-- bg1.y=512+2048
			-- bd1=display.newImage(map1sheetbd,1) --display.newImage( "carte/level2/bd.png", 1024,512,true )
			-- bd1.x=1024
			-- bd1.y=512+2048
			-- map1:insert(hg1)
			-- map1:insert(hd1)
			-- map1:insert(bg1)
			-- map1:insert(bd1)

		end
		taille=1--zoom actuel
		map1.xScale = map1.xScale * 0.3---zoom par default
		map1.yScale = map1.yScale * 0.3----pb taille reste a 1 mais tt fonctionne car ca ete calibré
		if map1p~=nil then
			map1p.alpha=1--à 0.5 pour pouvoir posé les points d'obstacles
			map1p.xScale=map1.xScale
			map1p.yScale=map1.yScale
		end
		map1.dots={}

		background=display.newGroup()--creation du group contenant tout les obj qui sont sur la map
		background:insert(map1)
		grpartie=display.newGroup()
		grpartie:insert(background )
		if modedelancement==0 then
			if modezombie or modepanique then
				carre=display.newRect(grpartie,contentcenterx,contentcentery,xmaxscreen-xminscreen,ymaxscreen-yminscreen)
				carre:setFillColor(0)
				carre.alpha=0.2
			end
			if modepanique then
				carre:setFillColor(0.8,0.2,0.2)
			end
		end
		-- carre.fill.effect = "filter.bloom"
		-- carre.fill.effect.levels.white = 0.8
		-- carre.fill.effect.levels.black = 0.4
		-- carre.fill.effect.levels.gamma = 1
		-- carre.fill.effect.add.alpha = 0.8
		-- carre.fill.effect.blur.horizontal.blurSize = 20
		-- carre.fill.effect.blur.horizontal.sigma = 140
		-- carre.fill.effect.blur.vertical.blurSize = 20
		-- carre.fill.effect.blur.vertical.sigma = 240
		-- carre.fill.effect = "filter.exposure"
		-- carre.fill.effect.exposure = 1.2
		--transition.from(carre,{time=5000,alpha=1,fill.effect.intensity=0})
	end
	if modezombie or modepanique then
		carre.alpha=0
	end
	if modeinfini then
		print("formatage des vagues")
		vague=0
		vague={}
		local k=nil
		nbvague=200--nombre de vague dans le niveau--hugo--
		--on met -1 quand c'est le dernier soldat
		for k=1,leveldata[1].wave,1 do
			vague[k]={}
		end
	end
	if modeinfini or modesquelette or modezombie or modepanique then
		pouvoirdisp=3
	end
	-- if contreai==1 then
	-- 	pouvoirdisp=1
	-- end
	if contreai==0 and aiactive==1 and contreaihaut==1 then
		pouvoirdisp=0
	end
	if pouvoirdisp>=2 then
		if savegameall.bonuspouvoir[2].unlock==false and not tutolevel0 then --si il est debloquer
			pouvoirdisp=1
		end
	end
	if pouvoirdisp==3 then
		if savegameall.bonuspouvoir[3].unlock==false then --si il est debloquer
			pouvoirdisp=2
		end
	end
	if modewave then
		pouvoirdisp=0
	end
	if pouvoirdisp==3 then
		pv3carre=display.newRect(grpartie,contentcenterx,contentcentery,xmaxscreen-xminscreen,ymaxscreen-yminscreen)
		pv3carre:setFillColor(0.8,0.2,0.2)
		pv3carre.alpha=0.2
		pv3carre.isVisible=false
	end
	genepoint={}
	genepoint.x=0
	genepoint.y=0

	varminerevcorrectdif=1 -- ne change pas ce que rapporte une mine pendant une partie si le niveau de difficulté est abaisser suite a des echecs en mode normal
	numtapb=0--bouton
	numtapba=0--background
	boutondev=0--bouton d'affichage de devellopement sont afficher
	genetap=0--si on cliquer sur le general
	geneclic=0 --si on vient de cliquer sur le general
	drapeaugeneclic=0 -- si on est entrain de cliquer sur le bouton pour positionné le drapeau
	draptap=0--si on clique sur le bouton pour poser le drapeau d'un bat
	drapeausolclic=0--si on est entrain de cliquer sur le bouton pour positionné le drapeau
	clicpause=0
	batimenttap=0--si on est entrain de cliquer sur le batiment
	soldatclic=0--si on est entrain de cliquer sur un soldat
	nbbatiment=0--nombretotal de batiment
	cbatiment={}--tableau stoquant tout les class batiments
	ibatiment={}
	--drappos={}
	numdrap=nil--numero du drapeau actuelement afficher
	occupe={}--zone occupe des bat
	ombrebat={} --ombres des bat
	--plus optimiser de les appeler ici que dans chaque fichier, contraire a ce qu'on pensait
	clicsurdev=0--si on clicle sur les boutons construires
	prioclic1=require("prio")
	initclicprio()
	if modedelancement==0 and generalobligatoir>0 then
		general=require("general")
		general:general()
	end
	animdep1=require("animdep")
	animdepbis1=require("animdepbis")
	animdepter1=require("animdepter")
	combat1=require("combat")
	attbatiment1=require("attbatiment")
	atttir1=require("atttir")
	batiment1=require("batiment")
	batimentbis1=require("batimentbis")
	constructanim1=require("constructanim")
	soldat1=require("soldat")
	attliquide1=require("lacheliquide")


	if modedelancement==0 then
		pause1=require("pause")
		pause1:pause()
	else
		affplay()
	end
	if modeinfini and modedelancement==0 then
		levelinfini=require("levelinf")
		levelinfini.levelinf()
		print("chargement du niveau inf")
	end
	retourmenuprin1=require("retourmenuprin")
	if modedelancement==0 then
		initaffmenuprinjeu()
	end
	recommencer1=require("recommencer")
	if modedelancement==0 then
		initaffrecommencer()
	end
	reglage1=require("reglage")
	if modedelancement==0 then
		initaffreglage()
	end
	remove=require("remove")
	if modedelancement==0 then
		initfenetre()
	end
	initanimdep1=require("initanimdep")
	if modedelancement==0 then
		initsequence()
	end
	--	copouvoir=coroutine.create(function ()
		pouvoir=require("pouvoir")
		if modedelancement==0 then
			pouvoir:pouvoir()
		else
			local num={}
			chargementttpouvoir(num)
		end
	--end)
	--coroutine.resume(copouvoir)

	prixdev1=require("prixdev")
	if modedelancement==0 then
		prixdeve()
	end
	if modedelancement==0 then
		group={}--group de group permetatn de gere le faux 3D
		object={}
		for i=1,2048,1 do
			group[i]=display.newGroup()
			background:insert(group[i])
		end
		if map1p~=nil then
			group[2048]:insert(map1p)--------------------------------------------------------------------------------------------------------
		end
	end

	--local function point1( x,y )--devrait rester ici
	--	local lepoint=display.newCircle(x, y, 5 )
	--	lepoint.isVisible=false--true --pour test
	--	return lepoint
	--end

		--partie 2-----------------------------------------------------------------------------
		--reactiver pour aider le placement des points et modifier aussi le fichier point
		-- local function displaycircle(typecircle,i)
		-- 	local cercle
		-- 	local numerocercle=display.newText(i,0,0,fonttype)
		-- 	if typecircle==1 then
		-- 		local rayonobst=2000
		-- 		if chemin[i].rayon~=nil then
		-- 			rayonobst=chemin[i].rayon
		-- 		end
		-- 		local coef=1
		-- 		--if chemin[i].mechant~=nil and not modepanique then
		-- 		--	if chemin[i].mechant>1 then
		-- 		--		coef=chemin[i].mechant*0.9
		-- 		--	end
		-- 		--end
		-- 		-- if not modepanique and cheminlargeur~=nil then
		-- 		-- 	coef=coef*cheminlargeur
		-- 		-- end
		-- 		cercle=display.newGroup()
		-- 		cercle1=display.newCircle(chemin[i].x,chemin[i].y, mathsqrt(rayonobst*cheminlargeur*coef))
		-- 		cercle:insert(cercle1)
		-- 		numerocercle.x=cercle1.x+7
		-- 		numerocercle.y=cercle1.y+7
		-- 		numerocercle:setFillColor(0,0,0)
		-- 		local coef=1
		-- 		if chemin[i].mechant~=nil and not modepanique then
		-- 			if chemin[i].mechant>1 or goh then
		-- 				coef=chemin[i].mechant*chemin[i].mechant
		-- 			end
		-- 		end
		-- 		cercle2=display.newCircle(chemin[i].x,chemin[i].y, mathsqrt(400*coef*cheminlargeur))
		-- 		cercle2:setFillColor( 1,0,0 )
		-- 		cercle:insert(cercle2)
		-- 	elseif typecircle==2 then
		-- 		cercle=display.newCircle(obstacle[i].x,obstacle[i].y,mathsqrt(3000) )
		-- 		cercle:setFillColor(0,0.8,0)
		-- 		numerocercle:setFillColor(1,0.2,1)
		-- 	elseif typecircle==3 then
		-- 		cercle=display.newCircle(obstacle1[i].x,obstacle1[i].y, mathsqrt(20000) )
		-- 		cercle:setFillColor(0,1,0)
		-- 		numerocercle:setFillColor(1,0,1)
		-- 	elseif typecircle==4 then
		-- 		local rayonobst=1500
		-- 		if obstaclsold[i].rayon~=nil then
		-- 			rayonobst=obstaclsold[i].rayon
		-- 		end
		-- 		cercle=display.newCircle(obstaclsold[i].x,obstaclsold[i].y, mathsqrt(rayonobst) )
		-- 		cercle:setFillColor(1,0,0)
		-- 		numerocercle:setFillColor(0,1,1)
		-- 	elseif typecircle==5 then
		-- 		cercle=display.newCircle(obstacleim[i].x,obstacleim[i].y, mathsqrt(1000) )
		-- 		cercle:setFillColor(0,0,1)
		-- 		numerocercle:setFillColor(1,1,0)
		-- 	elseif typecircle==6 then
		-- 		local rayonobst=1500
		-- 		if obstaclegene[i].rayon~=nil then
		-- 			rayonobst=obstaclegene[i].rayon
		-- 		end
		-- 		cercle=display.newCircle(obstaclegene[i].x,obstaclegene[i].y, mathsqrt(rayonobst) )
		-- 		cercle:setFillColor(1,0,1)
		-- 		numerocercle:setFillColor(0,1,0)
		-- 	elseif typecircle==7 then
		-- 		cercle=display.newCircle(decoration[i].x,decoration[i].y, mathsqrt(1000) )
		-- 		cercle:setFillColor(0,0,1)
		-- 		numerocercle:setFillColor(1,1,0)
		-- 	end
		-- 	cercle.alpha=0.2
		-- 	if typecircle~=1 then
		-- 		numerocercle.x=cercle.x+7
		-- 		numerocercle.y=cercle.y+7
		-- 	end
		-- 	background:insert(cercle)
		-- 	background:insert(numerocercle)
		-- end
		--reactiver pour aider le placement des points et modifier aussi le fichier point

	--local coleveltest=coroutine.create(function ()
		if modedelancement==0 then
			obstaclegene=nil
			distancedetection=1
			pointdeppro=nil
			feupassesoldat=nil
			cheminlargeur=1
			decoration=nil -- donnees sur les objets sur la carte qui se supprime quand on construit un bat dessus
			decorationaff=nil -- les objets
			level:chemi()
			print("cheminlargeur\n\n\n\n\n"..cheminlargeur)
			if modepanique then
				for i=5,25,2 do -- mode zombie cheloux  et sans le 2 ca fait un truc normal
					chemin[i].mechant=10
				end
				for i=6,25,2 do
					chemin[i].mechant=-10
				end
			end
			-- 	elseif race==2 then
			-- 		for i=5,25 do -- mode zombie cheloux  et sans le 2 ca fait un truc normal
			-- 			chemin[i].mechant=10
			-- 		end
			-- 	end
			-- end
			if contreai==1 then
				-- local point= require( "point" )
				-- local j=#chemin
				-- for i=1,j do
				-- 	chemin[j+i]=point.new(chemin[i].x,chemin[i].y+2048*0.3)
				-- end
				-- if cheminarr==nil then
				-- 	cheminarr={}
				-- end
				-- cheminnb=#chemin-1
				-- cheminarr[#cheminarr+1]=j-1
				-- print("cheminarr "..#cheminarr)
				-- if pointdep==nil then
				-- 	pointdep={}--entré secondaire 
				-- end 
				-- print("j vaut "..j.." pointdep "..#pointdep)
				-- pointdep[#pointdep+1]=j+1
			end
				--partie 3-----------------------------------------------------------------------------
				--reactiver pour aider le placement des points et modifier aussi le fichier point
				-- for i=1,cheminnb+1,1 do
				-- 	displaycircle(1,i)
				-- 	background:insert(chemin[i])
				-- end
				-- for i=1,obstaclenb,1 do
				-- 	displaycircle(2,i)
				-- 	obstacle[i]:setFillColor(0,0.8,0)
				-- 	group[2048]:insert(obstacle[i])
				-- end
				-- for i=1,obstacle1nb,1 do
				-- 	displaycircle(3,i)
				-- 	obstacle1[i]:setFillColor(0,1,0)
				-- 	group[2048]:insert(obstacle1[i])
				-- end
				-- if obstaclsold~=nil then
				-- 	if obstaclsold.nb~=nil then
				-- 		if obstaclsold.nb~=0 then
				-- 			for i=1,obstaclsold.nb,1 do
				-- 				displaycircle(4,i)
				-- 				obstaclsold[i]:setFillColor(1,0,0)
				-- 				group[2048]:insert(obstaclsold[i])
				-- 			end
				-- 		end
				-- 	end
				-- end
				-- if obstacleim~=nil then
				-- 	for i=1,#obstacleim,1 do
				-- 		displaycircle(5,i)
				-- 	end
				-- end
				-- if obstaclegene~=nil then
				-- 	if obstaclegene.nb~=nil then
				-- 		if obstaclegene.nb~=0 then
				-- 			for i=1,obstaclegene.nb,1 do
				-- 				displaycircle(6,i)
				-- 				obstaclegene[i]:setFillColor(1,0,1)
				-- 				group[2048]:insert(obstaclegene[i])
				-- 			end
				-- 		end
				-- 	end
				-- end
				-- if decoration~=nil then
				-- 	if #decoration>=1 then
				-- 		for i=1,#decoration do
				-- 			displaycircle(7,i)
				-- 			--decoration[i]:setFillColor(0,0,1)
				-- 		end
				-- 	end
				-- end

			--assistance au placement des points
			print("level.obsim() bientot")
			if modedelancement==0 then
				obstacleim=nil
				obstacleanim=nil
				decoranim=nil
				level.obsim()
				if contreai==1 then
					level.obsim()
				end
				print("creation des obstacleim")
				if obstacleim~=nil then
					print("obstacleim dif nil")
					local obspole=0
					for i=1,#obstacleim,1 do
						if i>#obstacleim*0.5 and contreai==1 then
							obspole=614.4
						end

						obstacleim[i].x=obstacleim[i].x*map1.xScale
						obstacleim[i].y=obstacleim[i].y*map1.yScale+obspole
						if obstacleim[i].group==nil then
							obstacleim[i].group=mathfloor(obstacleim[i].y)+1024
						--	print("group")
						else
							obstacleim[i].group=obstacleim[i].group+mathfloor(obspole)
							if obstacleim[i].group>2048 then
								obstacleim[i].group=2048
								print("bug de definition de group obs niveau1 440")
							elseif obstacleim[i].group<1 then
								obstacleim[i].group=1
								print("bug de definition de group obs niveau1 443")
							end
						end
						obstacleim[i].xScale=obstacleim[i].xScale*map1.xScale
						obstacleim[i].yScale=obstacleim[i].yScale*map1.yScale
						group[obstacleim[i].group]:insert(obstacleim[i])
					end
				end
				if obstacleanim~=nil then
					local obspole=0
					for i=1,#obstacleanim do
						if i>#obstacleanim*0.5 and contreai==1 then
							obspole=614.4
						end
						obstacleanim[i].y=obstacleanim[i].y+obspole
						obstacleanim[i].group=obstacleanim[i].group+mathfloor(obspole)
						group[obstacleanim[i].group]:insert(obstacleanim[i])
					end
				end
				if decoration~=nil then
					decorationaff={}
					for i=1,#decoration do
						decorationaff[i]=display.newImage(objetdec[decoration[i].planche],decoration[i].type)
						if decoration[i].anchorY~=nil then
							decorationaff[i].anchorY=decoration[i].anchorY
						end
						decorationaff[i].x=decoration[i].x
						decorationaff[i].y=decoration[i].y
						decorationaff[i].xScale=decoration[i].scale
						decorationaff[i].yScale=decoration[i].scale
						if decoration[i].xScale~=nil then
							decorationaff[i].xScale=decorationaff[i].xScale*decoration[i].xScale
						end
						if decoration[i].yScale~=nil then
							decorationaff[i].yScale=decorationaff[i].yScale*decoration[i].yScale
						end
						if decoration[i].anchorY~=nil then
							decorationaff[i].group=mathfloor(decorationaff[i].y)+1024
						else
							decorationaff[i].group=mathfloor(decorationaff[i].y+decorationaff[i].height*0.5*decorationaff[i].yScale)+1024
						end
						group[decorationaff[i].group]:insert(decorationaff[i])
					end
				end
			end
			-- if obstacleim~=nil
			-- for i=0,contreai do
			-- 	local obspole=0
			-- 	if i==1 then
			-- 		obspole=614.4
			-- 	end
			-- 	level.obsim()
			-- 	for i=1,#obstacleim,1 do
			-- 		if obstacleim[i].group==nil then
			-- 			obstacleim[i].group=mathfloor(obstacleim[i].y)+1024
			-- 			print("group")
			-- 		end
			-- 		obstacleim[i].x=obstacleim[i].x*map1.xScale
			-- 		obstacleim[i].y=obstacleim[i].y*map1.yScale+obspole
			-- 		obstacleim[i].xScale=obstacleim[i].xScale*map1.xScale
			-- 		obstacleim[i].yScale=obstacleim[i].yScale*map1.yScale
			-- 		group[obstacleim[i].group]:insert(obstacleim[i])
			-- 	end
			-- 	for i=1,#obstacleanim do
			-- 		group[obstacleanim[i].group]:insert(obstacleanim[i])
			-- 	end
			-- end
			if modedelancement==0 then
				if encours==1 then --signifie tuto
					leveltuto1=require("leveltuto") -- signifie plus level encours
				end
			end
			--if grtunevie==nil then
			grtunevie=display.newGroup()
			--end
			grpartie:insert(grtunevie)
			if modehard then
				modehardfl=display.newSprite(effetexplo.fl1,effetexplo["fl1seq"])
				modehardfl.x=xmaxscreen-117+40
				modehardfl.y=yminscreen+14
				modehardfl.xScale=0.21
				if goh then
					modehardfl.xScale=modehardfl.xScale*0.8
				end
				modehardfl.yScale=modehardfl.xScale
				modehardfl:setSequence("levelup")
				spritegestion(modehardfl,-1,false)
				grtunevie:insert(modehardfl)
			end
			-- fondtunevie=display.newImage(imbouton.fondtunevie,1)
			-- fondtunevie.x=actualcontentwidth-150
			-- fondtunevie.y=yminscreen+10
			-- fondtunevie.xScale=1.5
			-- if multi==0 or multi==2 then
			-- 	fondtunevie.xScale=2
			-- end
			-- fondtunevie.yScale=1.1
			-- fondtunevie.alpha=0 --0.5
			-- grtunevie:insert(fondtunevie)
			tune=display.newEmbossedText(0,xmaxscreen-160+40,yminscreen+10,fonttype, 24*fontsize )--actualcontentwidth/20, 300
			vartune()
			tune.x1=tune.x
			tune.y1=tune.y
			tune:setFillColor(colortextfill[1],colortextfill[2],colortextfill[3])
			tune:setEmbossColor(colortextemb)
			--tune:setFillColor( 0.8, 0.8, 0 )
			tunemanque=false
			grtunevie:insert(tune)
			pieceor=display.newImage(imbouton.monnaie,3)
			pieceor.x=xmaxscreen-125+40
			pieceor.y=yminscreen+10
			pieceor.xScale=0.12
			pieceor.yScale=pieceor.xScale
			grtunevie:insert(pieceor)
			print("multi "..multi)
			print("multi "..multi)
			print("multi "..multi)
			print("multi "..multi)
			print("multi "..multi)
			if multi==0 or multi==2 or multi==1 then
				vagueinf=display.newEmbossedText( " ",xmaxscreen-125+40,yminscreen+ 28,fonttype, 14*fontsize )
				if niveauch>=5 and niveauch<=8 then
					vagueinf:setFillColor( 0.2 )
					vagueinf:setEmbossColor(colortextemb1)
				else
					vagueinf:setFillColor( 0.8 )
					vagueinf:setEmbossColor(colortextemb)
				end
				grtunevie:insert(vagueinf)
				vagueinfimg=display.newImage(imbouton.vaguesui,1)
				vagueinfimg.x=vagueinf.x+18
				vagueinfimg.y=vagueinf.y-1
				if goh then
					vagueinfimg.xScale=0.07
				else
					vagueinfimg.xScale=0.15
				end
				vagueinfimg.yScale=vagueinfimg.xScale
				grtunevie:insert(vagueinfimg)
			else
				print("multi="..multi)
			end
			if modeinfini then
				
			end
		else
			if decoration~=nil then
				for i=1,#decoration do
					if decorationaff[i]==nil then
						decorationaff[i]=display.newImage(objetdec[decoration[i].planche],decoration[i].type)
						if decoration[i].anchorY~=nil then
							decorationaff[i].anchorY=decoration[i].anchorY
						end
						decorationaff[i].x=decoration[i].x
						decorationaff[i].y=decoration[i].y
						decorationaff[i].xScale=decoration[i].scale
						decorationaff[i].yScale=decoration[i].scale
						if decoration[i].anchorY~=nil then
							decorationaff[i].group=mathfloor(decorationaff[i].y)+1024
						else
							decorationaff[i].group=mathfloor(decorationaff[i].y+decorationaff[i].height*0.5*decorationaff[i].yScale)+1024
						end
						group[decorationaff[i].group]:insert(decorationaff[i])
					end
				end
			end
			if goh and (niveauch==14 or niveauch==16) then
				if niveauch==14 then
					obstacleim[2]:setFrame(1)
					obstacleim[3]:setFrame(1)
				elseif niveauch==16 then
					obstacleim[6]:setFrame(1)
				end
			end
		end
		vartune()
			--tune.text=-argent/3
		--a ne pas suprimer--
		if modedelancement==0 then
			passe=display.newEmbossedText("",xmaxscreen-150+40,yminscreen+28,fonttype,18*fontsize)
			if multi==1 or multi==0 or multi==2 then
				passe.x=passe.x-20
			end
			passe:setEmbossColor(colortextemb)
			grtunevie:insert(passe)
		end
		passe:setFillColor(1,0.2,0.2)
		if modedelancement==0 then
			passeimg=display.newImage(imbouton.batiment,15)
			passeimg.y=passe.y
			passeimg.x=passe.x+20
			passeimg.xScale=0.1
			passeimg.yScale=passeimg.xScale
		end
		grtunevie:insert(passeimg)
		--passe.text=ennemipasse--=ennemipasse
		-- if ennemipasse>1 then
		-- 	passe.text="vies: "--display.newText("vies",actualcontentwidth/2+20,10,native.systemFontBold,12)
		-- else
		-- 	passe.text="vie: "--display.newText("vie",actualcontentwidth/2+20,10,native.systemFontBold,12)
		-- end
		passe.text=ennemipasse
	-- end)
	-- coroutine.resume(coleveltest)
	if feupassesoldat~=nil then
		for i=1,#feupassesoldat do
			feupassesoldat[i].etat=0
		end
	end
	--a ne pas suprimer--

	--composer.gotoScene( "zoom" )--lancement de la class zoom

	--local typebatiment=2--creation d'un batiment a temporaire, inutile mais c'est pour declarer les variables en global
	-- nbatiment=display.newImage(imgbat.inf,1)--display.newImage("batiment/4_archer/archers1.png",2000,2000)
	-- nbatiment.x=2000
	-- nbatiment.y=2000
	-- nbatiment.xScale = nbatiment.xScale * 0.15
	-- nbatiment.yScale = nbatiment.yScale * 0.15

	if modedelancement==0 then
		--vagsui=display.newGroup()
		vagsuib={}
		vagsuig=display.newGroup()
		vagsui=display.newImage(imbouton.vaguesui,1)--"choniveau/niv1.png",chemin[2].x,chemin[2].y)
		vagsui.x=chemin[2].x
		vagsui.y=chemin[2].y
		if goh then
			vagsui.xScale=0.15*apparence
		else
			vagsui.xScale=0.3*apparence
		end
		vagsui.yScale=vagsui.xScale
		vagsui.scale=vagsui.xScale
		vagsui.compteur=0
		--print("vagsuinext ")
		local compteur=0
		if contreai==1 and contreaihaut==1 then
		--	print("sdthqdhqdthqdthqdthqddhdtrth")
			compteur=compteur+1
			vagsuib[compteur]=display.newImage(imbouton.vaguesui,1)--"choniveau/niv1.png",chemin[2].x,chemin[2].y)
			vagsuib[compteur].x=chemin[2].x
			vagsuib[compteur].y=chemin[2].y+614
			vagsuib[compteur].xScale=vagsui.xScale
			vagsuib[compteur].yScale=vagsui.xScale
			vagsuib[compteur].compteur=compteur
			vagsuig:insert(vagsuib[compteur])
		end
		if pointdep~=nil then
		--	print("vagsuinext ")
			
			for i=1,#pointdep do
				print("vagsuinext "..i)
				if ((vagsui.x-chemin[pointdep[i]+1].x)*(vagsui.x-chemin[pointdep[i]+1].x)+(vagsui.y-chemin[pointdep[i]+1].y)*(vagsui.y-chemin[pointdep[i]+1].y))>5000 then
					compteur=compteur+1
					vagsuib[compteur]=display.newImage(imbouton.vaguesui,1)--"choniveau/niv1.png",chemin[2].x,chemin[2].y)
					vagsuib[compteur].x=chemin[pointdep[i]+1].x
					vagsuib[compteur].y=chemin[pointdep[i]+1].y
					vagsuib[compteur].xScale=vagsui.xScale
					vagsuib[compteur].yScale=vagsui.xScale
					vagsuib[compteur].compteur=compteur
					vagsuig:insert(vagsuib[compteur])
					if contreai==1 and contreaihaut==1 then
						compteur=compteur+1
						vagsuib[compteur]=display.newImage(imbouton.vaguesui,1)--"choniveau/niv1.png",chemin[2].x,chemin[2].y)
						vagsuib[compteur].x=chemin[pointdep[i]+1].x
						vagsuib[compteur].y=chemin[pointdep[i]+1].y+614.4
						vagsuib[compteur].xScale=vagsui.xScale
						vagsuib[compteur].yScale=vagsui.xScale
						vagsuib[compteur].compteur=compteur
						vagsuig:insert(vagsuib[compteur])
					end
				end
			end
		end
		 vagsuig:insert(vagsui)
		--group[2048]:insert(vagsui)
		group[2048]:insert(vagsuig)

	end
	if encours==0 then
		vagsuig.isVisible=true
	else
		vagsuig.isVisible=false
	end
	local cocreation=coroutine.create(function ()
		print("yoooooooooooooooooooooooooooooooooo")
		-- if coroutine.running()~=nil then
		-- 	print("coroutine niveau1 creation: "..coroutine.running())
		-- else
		-- 	print("coroutine niveau1 creation: nil")
		-- end
		local creationfunc = require ( "creation" )
		if modedelancement==0 then
			creationfunc.creation()
		end
		print("yo2")
		-- if coroutine.running()~=nil then
		-- 	print("coroutine niveau1 creation: "..coroutine.running())
		-- else
		-- 	print("coroutine niveau1 creation: nil")
		-- end
	end)
	coroutine.resume(cocreation)
	--group[2048]:insert(nbatiment)

	--local point= require( "point" )
	--point4 = point.new( 100,100 )--utile?

	nbsoldat=0
	nbsoldatg=0
	isoldat={}
	isoldat[0]={}
	isoldat[0].vivant=false
	isoldat[0].orientation=0
	isoldat[0].zone1=0
	isoldat[0].zone2=0
	isoldat[0].zone3=0
	isoldat[0].zone4=0
	isoldat[0].ennemi=0
	isoldat[0].pole=1
	isoldat[0].direction=1
	--permet a isoldat de recevoir plusieurs type d'information et d'etre un tableau a plusieurs dimension
	-- for i=0,300,1 do--les elements avec posi permet que les unité ne se superpose pas et ne se suive pas
	-- 	isoldat[i]={} --display.newCircle(-1000,-1000,0.5)
	-- 	--isoldat[i].posi=posi
	-- 	--isoldat[i].xposi=mathrandom(26)-13
	-- 	--isoldat[i].yposi=mathrandom(26)-13
	-- 	local xposi=0
	-- 	local yposi=0
	-- 	if posi~=0 then
	-- 	if posi==1 then
	-- 		xposi=13
	-- 	else
	-- 		if posi==2 then
	-- 			xposi=-13
	-- 		else
	-- 			if posi==3 then
	-- 				yposi=13
	-- 			else
	-- 				if posi==4 then
	-- 					yposi=-13
	-- 				else
	-- 					if posi==5 then
	-- 						xposi=13
	-- 						yposi=13
	-- 					else
	-- 						if posi==6 then
	-- 							xposi=13
	-- 							yposi=-13
	-- 						else
	-- 							if posi==7 then
	-- 								xposi=-13
	-- 								yposi=13
	-- 							else
	-- 								if posi==8 then
	-- 									xposi=-13
	-- 									yposi=-13
	-- 								end
	-- 							end
	-- 						end
	-- 					end
	-- 				end
	-- 			end
	-- 		end
	-- 	end
	-- 	end
	-- 	isoldat[i].xposi=xposi
	-- 	isoldat[i].yposi=yposi
	-- 	if posi<8 then
	-- 		posi=posi+1
	-- 	else
	-- 		posi=0
	-- 	end
	-- 	isoldat[i].effetvern=0--effet verticale du perso quand il se deplace le nb
	-- 	isoldat[i].effetvero=0--effet verticale en ordonnee
	-- 	--isoldat[i].ombre=display.newImage(imbouton.ombresld,1)
	-- 	--isoldat[i].ombre.alpha=0.5
	-- 	--isoldat[i].ombre.isVisible=false
	-- 	--isoldat[i].ombre.alpha=0
	--  	--group[2]:insert(isoldat[i].ombre )
	--end
	--local soldatt=require("soldat")
	if generalobligatoir>0 then
		nbsoldatg=nbsoldatg-1
		num=nbsoldatg
		local hello=nil
		print("spawn general")
		local legeneral=savegameall.generalch[race+1]
		if legeneral==nil then
			legeneral=savegameall.general[race+1]
		end
		print("legeneral "..legeneral.." generalobligatoir "..generalobligatoir)
		while legeneral>generalobligatoir do
			legeneral=legeneral-1
		end
		print("legeneral "..legeneral)
		local generalid=retournenumgene(race,legeneral)
		if generaltest~=0 then
			genepointinit=nil
			print("\n\n\n\n\n\n\n\n\nGeneral test id "..generaltest)
			generalid=generaltest
		end
		hello=soldat1.new(num,generalid,0)
		-- if race==0 then--general
		-- 	if savegameall.general[race+1]==1 then
		-- 		hello=soldat1.new(num,170,0)
		-- 	elseif savegameall.general[race+1]==2 then
		-- 		hello=soldat1.new(num,171,0)
		-- 	elseif savegameall.general[race+1]==3 then
		-- 		hello=soldat1.new(num,172,0)
		-- 	end
		-- elseif race==1 then
		-- 	if savegameall.general[race+1]==1 then
		-- 		local numgene=173
		-- 		local numdev=320+race*10+savegameall.general[race+1]
		-- 		print("le general à "..savegamedev[numdev].." d'experience")
		-- 		savegamedev[numdev]=tonumber(savegamedev[numdev])
		-- 		local testcpt=1
		-- 		local level=1
		-- 		while testcpt<#savegameall.generalxp do
		-- 			if savegamedev[numdev]<=savegameall.generalxp[testcpt] then
		-- 				level=testcpt
		-- 				testcpt=#savegameall.generalxp+1
		-- 			end
		-- 			testcpt=testcpt+1
		-- 		end
		-- 		if level>=5 then
		-- 			numgene=174
		-- 		end
		-- 		hello=soldat1.new(num,numgene,0)
		-- 	elseif savegameall.general[race+1]>=2 then
		-- 		hello=soldat1.new(num,175,0)
		-- 	end
		-- elseif race==2 then
		-- 	if savegameall.general[race+1]==1 then
		-- 		hello=soldat1.new(num,176,0)
		-- 	elseif  savegameall.general[race+1]==2 then
		-- 		hello=soldat1.new(num,177,0)
		-- 	elseif  savegameall.general[race+1]==3 then
		-- 		hello=soldat1.new(num,178,0)
		-- 	end
		-- end
		genenum=num
		--genepoint={}
		genepoint.ini=1
		if genepointinit==nil then
			genepointinit=mathfloor(cheminnb*0.5)
		end
		genepoint.x=chemin[genepointinit].x--point d'apparition du general en debut de partie
		genepoint.y=chemin[genepointinit].y
		if genepoint.x==nil then
			genepoint.x=0
			genepoint.y=0
		end
		--print(genepoint.y)
		--isoldat[numero].point=10
		hello:debut(num)
		-- if modedelancement==0 then -- ici 07/04/16
		-- 	general=require("general")
		-- 	general:general()
		-- end
		genexpdeb=savegamedev[isoldat[num].numdev]
	else
		genenum=0
		isoldat[genenum]={}
		isoldat[genenum].typesoldat=0
		--genepoint={}
		genepoint.ini=1
		if genepointinit==nil then
			genepointinit=mathfloor(cheminnb*0.5)
		end
		genepoint.x=chemin[genepointinit].x--point d'apparition du general en debut de partie
		genepoint.y=chemin[genepointinit].y
		if genepoint.x==nil then
			genepoint.x=0
			genepoint.y=0
		end
		genexpdeb=0
	end

	--affinfoetat=0--si il y a qqc d'afficher
	--initialisation des information

	if modedelancement==0 then
		affinfotab={}
		affinfogr=display.newGroup()
		affinfotab.fond=display.newImage(imbouton.affinfofond,1)
		affinfotab.fond.xScale=0.65*1/apparence*1.08
		affinfotab.fond.yScale=0.4*0.53
		affinfotab.fond.x=(xminscreen)+200*0.1+10+2*(10+400*0.1)+30+400*0.65*0.5 --300
		affinfotab.fond.y=ymaxscreen-50*0.4
		--affinfotab.fond.alpha=0.5
		--affinfotab.timer=nil
		affinfogr:insert(affinfotab.fond)
		affinfotab.objet=display.newEmbossedText("a",affinfotab.fond.x, affinfotab.fond.y,fonttype, 50*fontsize )
		affinfotab.objet:setEmbossColor(colortextemb)
		affinfotab.objet.xScale=0.5
		affinfotab.objet.yScale=affinfotab.objet.xScale
		affinfotab.objet:setFillColor(0.8)
		-- if niveauch<=4 then
		-- 	affinfotab.objet:setFillColor(0.7)
		-- elseif niveauch<=8 then
		-- 	affinfotab.objet:setFillColor(0.2)
		-- elseif niveauch<=12 then
		-- 	affinfotab.objet:setFillColor(0.7)
		-- else
		-- 	affinfotab.objet:setFillColor(0.7)
		-- end
		--local function 
		--affinfo(1,true)
		affinfotab.type=0--0 pour unité et 1 pour batiment
		affinfotab.num=1--numero dont les informations sont afficher
		affinfogr:insert(affinfotab.objet)
		grpartie:insert(affinfogr)
		affinfogr.isVisible=false
		lancervague1=display.newImage(imbouton.vague1,1)
		lancervague1.x=contentcenterx
		if goh then
			lancervague1.xScale=actualcontentwidth/4*apparence/lancervague1.width
			lancervague1.yScale=0.3*apparence
		else
			lancervague1.xScale=0.3*apparence
			lancervague1.yScale=0.3*apparence
		end
		lancervague1.y=contentcentery-actualcontentheight/2.1+lancervague1.yScale*lancervague1.height*0.5
		lancervague1chaine=display.newImage(imagemenu.chaine,1)
		lancervague1chaine.x=lancervague1.x
		lancervague1chaine.y=yminscreen+(lancervague1.y-yminscreen)*0.5
		lancervague1chaine.xScale=lancervague1.xScale*lancervague1.width/lancervague1chaine.width
		lancervague1chaine.yScale=lancervague1chaine.xScale
		grpartie:insert(lancervague1chaine)
		grpartie:insert(lancervague1)
		lancervague1chaine.y1=lancervague1chaine.y
		lancervague1.y1=lancervague1.y
		transition.from(lancervague1chaine,{time=500,transition=easing.outQuad, y=yminscreen-lancervague1chaine.yScale*lancervague1chaine.height*0.5})
		transition.from(lancervague1,{time=500,transition=easing.outQuad, y=yminscreen-lancervague1.yScale*lancervague1.height*0.5})
	end
	affinfotab.timer=nil
	-- if true and modedelancement==0 then --permet de connaitre la puissance de chaque bat
	-- 	ibatiment[1]={}
	-- 	ibatiment[1].pv3=false
	-- 	ibatiment[1].x=0
	-- 	ibatiment[1].y=0
	-- 	ibatiment[1].numsol=1
	-- 	local attaquesec={}
	-- 	for k=1,4 do -- pour la race prise en ocmpte du bonus de rage, 4 pour sans race
	-- 		attaquesec[k]={}
	-- 		for i=1,3 do
	-- 			attaquesec[k][i]={}
	-- 			for j=1,3 do
	-- 				attaquesec[k][i][j]={}
	-- 			end
	-- 		end
	-- 	end
	-- 	print("/n Statistique des valeurs des batiments/n")
	-- 	for l=1,4 do
	-- 		race=l-1
	-- 		print("Race "..race)
	-- 		for i=1,3 do
	-- 			ibatiment[1].type1=i
	-- 			print("Type1:"..i)
	-- 			local j=0
	-- 			while j<=2 do
	-- 				ibatiment[1].type2=j
	-- 				print("     Type2:"..j)
	-- 				local k=1
	-- 				while k<=4 do
	-- 				--for k=1,4 do
	-- 					if i==3 or j==1 or j==2 then
	-- 						if k==1 then
	-- 							k=2
	-- 						end
	-- 					end
	-- 					ibatiment[1].niveau=k
	-- 					miseajourvalevol(1,true)
	-- 					local attaquedubat=0
	-- 					local textstat=" attaque sec: "
	-- 					if i==1 then
	-- 						local nbsoldatdubat=ibatiment[1].nbunit
	-- 						-- if j==1 then 
	-- 						-- 	nbsoldatdubat=2
	-- 						-- elseif j==2 then
	-- 						-- 	nbsoldatdubat=1
	-- 						-- end
	-- 						attaquedubat=nbsoldatdubat*mathfloor(image[100+j*10+k].attaque*1000/image[100+j*10+k].timeatt*(image[100+j*10+k].attnbennemi^0.7)+image[100+j*10+k].charge/5)
	-- 					elseif i==2 then
	-- 						attaquedubat=mathfloor(ibatiment[1].attaque*1000/ibatiment[1].cadence*ibatiment[1].nbfleche)
	-- 						if j==1 then
	-- 							attaquedubat=mathfloor(attaquedubat*ibatiment[1].impact^0.5/10)
	-- 						elseif j==2 then
	-- 							attaquedubat=mathfloor(attaquedubat*ibatiment[1].porte^0.3/10*ibatiment[1].dureeliq/1000*1000/3000) --3000 duree anim de preparation d'attaque
	-- 						end
	-- 					elseif i==3 then
	-- 						attaquedubat=ibatiment[1].argentsec*4
	-- 						textstat=" gain par sec: "
	-- 						-- if k==4 then
	-- 						-- 	j=3
	-- 						-- end
	-- 					end
	-- 					print("          niveau"..k.." Rayon "..ibatiment[1].porte..textstat..attaquedubat)
	-- 					print("l"..l.."i "..i.." j "..j.." k "..k)
	-- 					attaquesec[l][i][j+1][k]=attaquedubat
	-- 					if i==3 then
	-- 						if k==4 then
	-- 							j=3
	-- 						end
	-- 					end
	-- 					k=k+1
	-- 				end
	-- 				j=j+1
	-- 			end
	-- 		end
	-- 	end
	-- 	ibatiment[1]=nil
	-- 	local printchaine=""
	-- 	for i=1,3 do
	-- 		for j=1,3 do
	-- 			for k=1,4 do
	-- 				for l=1,4 do
	-- 					if attaquesec[l][i][j][k]~=nil then
	-- 						printchaine=printchaine.."\n"
	-- 						printchaine=printchaine.."attaquebatsec["..l.."]["..i.."]["..j.."]["..k.."]="..attaquesec[l][i][j][k] -- copier les données dans initanimdep l 188
	-- 					end
	-- 				end
	-- 			end
	-- 		end
	-- 	end
	-- 	print(printchaine)
	-- end

	-- mine={}
	-- mine.nb=0
	minelancement=require("mine")
	minecreation()
	-- integrer les mines commes des batiments

	if encours==0 then
		lancervague1.isVisible=true
		lancervague1.isVisible1=true
		if lancervague1chaine~=nil then
			lancervague1chaine.isVisible=true
			lancervague1chaine.y=lancervague1chaine.y1
			transition.from(lancervague1chaine,{time=500,transition=easing.outQuad, y=yminscreen-lancervague1chaine.yScale*lancervague1chaine.height*0.5})
		end

		lancervague1.y=lancervague1.y1
		transition.from(lancervague1,{time=500,transition=easing.outQuad, y=yminscreen-lancervague1.yScale*lancervague1.height*0.5})
	else
		lancervague1.isVisible1=false
		lancervague1.isVisible=false
		if lancervague1chaine~=nil then
			lancervague1chaine.isVisible=false
		end
	end
	--textblabla=isoldat[1].vie+"general"
	--affinfotab.vie=display.newText(textblabla ,"/",240, actualcontentheight-50*0.4, native.systemFontBold, 12 )
	--affinfogr:insert(affinfotab.vie)

	--newvar=display.newText( 0,actualcontentwidth/2,actualcontentheight/2,native.systemFontBold,32 )
	--pour test
	if false then-- issimulator then
		local tailledelecran=display.newText("dia"..tailleecran,50,30,native.systemFontBold,10 )
	end

			--partie 4-----------------------------------------------------------------------------
			-- 	--permet de recuperer les coordonnees du clic
			-- local pointi=1 --numero du point de depart
			-- local pointj=0
			-- local typeobs=3  --choisir le type de point a créé
			-- local typeobsta={}
			-- typeobsta[1]="chemin["
			-- typeobsta[2]="obstacle["
			-- typeobsta[3]="obstacle1["
			-- typeobsta[4]="mineinfo["
			-- typeobsta[5]="obstaclsold["
			-- typeobsta[6]="obstaclegene["
			-- typeobsta[7]="decoration["
			-- typedeco=1
			-- typeplanche=1
			-- scaleco=0.2
			-- print("creation listener")
			-- function background:tap(event)
			-- 	if pointj==0 then
			-- 		pointj=1
			-- 		local x=mathfloor((-background.x+event.x)/taille)
			-- 		local y=mathfloor((-background.y+event.y)/taille)
			-- 		if typeobs~=7 then
			-- 			local string1=typeobsta[typeobs]..pointi.."]=point.new("..x..","..y..")"
			-- 			if typeobs==1 then
			-- 				string1=string1.."\t"..typeobsta[typeobs]..pointi.."].mechant="..1
			-- 				string1=string1.."\t"..typeobsta[typeobs]..pointi.."].rayon="..1000
			-- 			end
			-- 			print(string1)
			-- 		else
			-- 			print(typeobsta[typeobs]..pointi.."]={}")
			-- 			print(typeobsta[typeobs]..pointi.."].x="..x)
			-- 			print(typeobsta[typeobs]..pointi.."].y="..y)
			-- 		end
			-- 		if typeobs==1 then
			-- 			chemin[pointi]=display.newCircle(x, y, 2 )
			-- 			background:insert(chemin[pointi])
			-- 			--cheminnb=cheminnb+1
			-- 		elseif typeobs==2 then
			-- 			obstacle[pointi]=display.newCircle(x, y, 2 )
			-- 			obstacle[pointi]:setFillColor(0,0.8,0)
			-- 			background:insert(obstacle[pointi])
			-- 			--obstaclenb=obstaclenb+1
			-- 		elseif typeobs==3 then
			-- 			obstacle1[pointi]=display.newCircle(x, y, 2 )
			-- 			obstacle1[pointi]:setFillColor(0,1,0)
			-- 			background:insert(obstacle1[pointi])
			-- 			--obstacle1nb=obstacle1nb+1
			-- 		elseif typeobs==4 then
			-- 			obstaclsold[pointi]=display.newCircle(x, y, 2 )
			-- 			obstaclsold[pointi]:setFillColor(1,0,0)
			-- 			background:insert(obstaclsold[pointi])
			-- 			--obstaclsold.nb=obstaclsold.nb+1
			-- 		elseif typeobs==5 then
			-- 			obstacleim[pointi]=display.newCircle(x, y, 2 )
			-- 			--#obstacleim=#obstacleim+1
			-- 			background:insert(obstacleim[pointi])
			-- 		elseif typeobs==6 then
			-- 			obstaclegene[pointi]=display.newCircle(x, y, 2 )
			-- 			--#obstacleim=#obstacleim+1
			-- 			background:insert(obstaclegene[pointi])
			-- 		else
			-- 			print(typeobsta[typeobs]..pointi.."].type="..typedeco)
			-- 			print(typeobsta[typeobs]..pointi.."].planche="..typeplanche)
			-- 			print(typeobsta[typeobs]..pointi.."].scale="..scaleco)
			-- 			decoration[pointi]=display.newCircle(x, y, 2 )
			-- 			background:insert(decoration[pointi])
			-- 		end
			-- 		displaycircle(typeobs,pointi)
			-- 		pointi=pointi+1
			-- 	else
			-- 		pointj=0
			-- 	end
			-- end
			-- background:addEventListener("tap",background)
			--	fin assistance au placement



			--recupere juste coordonnée du clic
			-- if issimulator then
			-- 	function background:tap(event)
			-- 		local x=mathfloor((-background.x+event.x)/taille)
			-- 		local y=mathfloor((-background.y+event.y)/taille)
			-- 		print("clic au coordonnée "..x..","..y)
			-- 	end
			-- 	background:addEventListener("tap",background)
			-- end
			-- fin de recuperation de coordonnée du clic


	-- general=require("general")
	-- if modedelancement==0 then
	-- 	general:general()
	-- end
	if modedelancement==0 then
		if decoranim~=nil then
			local function chgroupdecoranim(i) --spritereceive1)
				if decoranim[i]~=nil then
					if decoranim[i].groupe==nil then
					--	print("spritereceive1.group nil")
					else
					--	print("spritereceive1.group "..spritereceive1.group)
					end
					--print("ici le groupe vaut "..decoranim[i].groupe)
					--group[decoranim[i].groupe].remove(decoranim[i])
					group[decoranim[i].groupe]:remove(decoranim[i])
					--print("ici pas le bon groupe??"..decoranim[i].groupe.." decoranim["..i.."] niveau1 946")
					if decoranim[i].legroup~=nil then
						-- print("a un group relier"..spritereceive1.legroup.."niveau1 948")
						if decoranim[i].legroup<0 then
							decoranim[i].groupe=mathfloor(decoranim[i].y)+1024-decoranim[i].legroup
						else
							decoranim[i].groupe=decoranim[i].legroup
						end
					else
						decoranim[i].groupe=mathfloor(decoranim[i].y)+1024
					end
					group[decoranim[i].groupe]:insert(decoranim[i])
				end
			end
			local function aleaconst(oldx,oldy)
				local autorise=0
				local cpttest=0
				local testy
				local testx
				while (autorise==1 and cpttest<20) or cpttest==0   do
					cpttest=cpttest+1
					testy=mathrandom(mayminuspos2,maypos2)
					testx=mathrandom(maxminuspos2,maxpos2)
					--print("testx"..testx.."testy"..testy.."mayminuspos2"..mayminuspos2.."maypos2"..maypos2.."maxminuspos2"..maxminuspos2.."maxpos2"..maxpos2)
					if autorise==0 then
						local i=1
						while i<=cheminnb+1 do
						--for i=1,cheminnb+1,1 do 
							if 2200>((testx-chemin[i].x)^2+(testy+30-chemin[i].y)^2)then
								autorise=1
								i=cheminnb+2
							end
							i=i+1
						end
					end
					if autorise==0 then
						local i=1
						while i<=obstaclenb do
						--for i=1,obstaclenb,1 do--wandrille le 11 correspond au nb de point de collision (obstacle)------------------------------------------------------------------------------------------------------------
							if 3100>((testx-obstacle[i].x)^2+(testy+30-obstacle[i].y)^2)then
								autorise=1
								i=obstaclenb+1
							end
							i=i+1
						end
					end
					if autorise==0 then
						local i=1
						while i<=obstacle1nb do
						--for i=1,obstacle1nb,1 do--wandrille le 1 correspond au nb de point de collison(obstacle1)----------------------------------------------------------------------------------------------------------------
							if 21000>((testx-obstacle1[i].x)^2+(testy+30-obstacle1[i].y)^2)then
								autorise=1
								i=obstacle1nb+1
							end
							i=i+1
						end
					end
					if autorise==0 then
						local i=1
						while i<=#obstacleim do
						--for i=1,#obstacleim,1 do
							if 1100>((testx-obstacleim[i].x)^2+(testy+30-obstacleim[i].y)^2)then
								autorise=1
								i=#obstacleim+1
							end
							i=i+1
						end
					end
					if autorise==0 then
						if nbbatiment>0 then
							local i=1
							while i<=nbbatiment do
								if ibatiment[i]~=nil then
								--for i=1,nbbatiment do//for remplacer par while
									if ibatiment[i].x~=nil and ibatiment[i].y~=nil then
										if 11000>((testx-ibatiment[i].x)^2+(1.25*(testy-ibatiment[i].y))^2) then
											autorise=1
											i=nbbatiment+1
										end
									end
								end
								i=i+1
							end
						end
					end
				end
				if cpttest>=20 then
					testx=oldx
					testy=oldy
				end
				return testx,testy
			end
			local function aleaconst1(oldx,oldy)
				local autorise=1
				local cpttest=0
				local testy
				local testx
				while autorise==1 and cpttest<20   do
					cpttest=cpttest+1
					testy=mathrandom(mayminuspos2+30,maypos2-30)
					testx=mathrandom(maxminuspos2+30,maxpos2-30)
					local i=1
					while i<=cheminnb+1 do
						local rayonauto=1700
						if chemin[i].rayon~=nil then 
							rayonauto=chemin[i].rayon
						end
						if rayonauto>((testx-chemin[i].x)^2+(testy-chemin[i].y)^2)then
							autorise=0
							i=cheminnb+1
						end
						i=i+1
					end
				end

				if cpttest>=20 then
					--print("prend oldx")
					testx=oldx
					testy=oldy
				end
				--print("oldx "..oldx.." testx "..testx)
				return testx,testy
			end
			local function spritelistenerended(i)--selfevent)
				decoranim[i].isVisible=false
				--selfevent.isVisible=false
				--print("test3")
				if jeupause.etat==0 and removetotal==false then
					local function spritereceivetimer1( event )
						jeupause.timerlibre[event.source.nbtimer]=0
						--print("spritereceivetimer1( event )")
						if removetotal==false then
							if jeupause.etat==0 then
								--if jeupause.etat==0 and removetotal==false then
									if fpschoisicycle<1 then
										--selfevent.x=selfevent.x+100
										--selfevent.y=selfevent.y+100
										testcoor=0
										if decoranim[i]~=nil then
											local oldx=decoranim[i].x
											local oldy=decoranim[i].y
											if decoranim[i].posi~=0 and decoranim[i].posi~=-1 then
												while testcoor<3 do
													if decoranim[i].posi==1 or decoranim[i].posi==-2 or decoranim[i].posi==-5 then
														decoranim[i].x,decoranim[i].y=aleaconst(decoranim[i].x,decoranim[i].y)
													elseif decoranim[i].posi==2 then
														decoranim[i].x,decoranim[i].y=aleaconst1(decoranim[i].x,decoranim[i].y)
													elseif decoranim[i].posi==-3 or decoranim[i].posi==-6 then
														--print("recherche alea "..i)
														decoranim[i].xdep,decoranim[i].ydep=aleaconst1(decoranim[i].xdep,decoranim[i].ydep)
													end
													testcoor=testcoor+1
													if decoranim[i].x~=oldx or decoranim[i].y~=oldy then
														testcoor=4
													end
												end
											-- else
											-- 	if selfevent.posi==-1 then
											-- 		-- selfevent.x=selfevent.x1
											-- 		-- selfevent.y=selfevent.y1
											-- 		-- if oldx~=0 then
											-- 		-- 	print("test 5")
											-- 		-- 	chgroupdecoranim(selfevent)
											-- 		-- 	selfevent.x=selfevent.x1
											-- 		-- 	selfevent.y=selfevent.y1
											-- 		-- end
											-- 	end
											end
											--if testinbatiment.y+30<mayminuspos2 or testinbatiment.y+30>maypos2-30 or testinbatiment.x<maxminuspos2+30 or testinbatiment.x>maxpos2-30 then
											if decoranim[i].posi~=0 and decoranim[i].posi~=-1 then
												chgroupdecoranim(i)
											end
											decoranim[i].isVisible=true
											if decoranim[i].posi>=0 or decoranim[i].posi<-3 then
												-- print("selfevent.posi "..selfevent.posi)
												decoranim[i]:play()
											end
											if decoranim[i].posi<0 then
												local finanim = function( obj )
												    obj.isVisible=false
												    if obj.posi>=-3 then 
												    spritelistenerended(obj.i)
												end
												    obj.anim1=false
												   -- print("test5")
												end
												--print("test")
												--if oldx
												decoranim[i].x=decoranim[i].xdep
												decoranim[i].y=decoranim[i].ydep
												--print("selfevent "..selfevent.x.."selfevent.x1")
												decoranim[i].para.x=decoranim[i].x+decoranim[i].para.x1
												decoranim[i].para.y=decoranim[i].y+decoranim[i].para.y1
												if decoranim[i].para.rotation~=nil then
													decoranim[i]:rotate(-decoranim[i].para.rotation)
												end
												decoranim[i].para.onComplete=finanim
												decoranim[i].para.onCancel=finanim
												decoranim[i].para.tag="element"
												decoranim[i].anim1=true
												decoranim[i].anim=transition.to(decoranim[i],decoranim[i].para)
											end
										end
									end
								--elseif removetotal==true then
									-- print("removetotal!!")
									-- selfevent:removeSelf()
									-- selfevent=nil
								--end
							--else
								--spritereceivetimer1a=timer.performWithDelay( selfevent.cadence*vitessejeuin, spritereceivetimer1 )
								--spritereceivetimer1a.nbtimer=timerpause(3,spritereceivetimer1a,nil)
								--spritereceivetimer1a.cpt=event.source.cpt+1
							end
						end
					end
					if decoranim[i]~=nil and removetotal==false then
						if decoranim[i].cadence~=nil then
							-- print("ajout d'un timer")
							spritereceivetimer1a=timer.performWithDelay( decoranim[i].cadence*vitessejeuin, spritereceivetimer1 )
							spritereceivetimer1a.nbtimer=timerpause(3,spritereceivetimer1a,nil)
							--spritereceivetimer1a.cpt=0
						end
					end
				end
			end
			local function spritereceive(i)--spritereceive1)
				local selfevent=decoranim[i] --spritereceive1
				selfevent.i=i
				function spritelistenerdecoranim(event)
					if event.phase=="ended" and not removetotal then
						--print("ici!")
						--if selfevent.posi>=0 then
							spritelistenerended(selfevent.i)
						--end
					end
					--print(event.sprite.sequence)
				end
				if selfevent.posi>=0 or selfevent.posi<-3 then
					decoranim[i]:addEventListener("sprite",spritelistenerdecoranim)
					--spritereceive1:addEventListener("sprite",spritelistenerdecoranim)
				else
					--print("test2")

					spritelistenerended(i)
				end
			end
			if true then
				local i=nil
				for i=1,#decoranim do
					
					if decoranim[i].posi<0 then
						decoranim[i].x=decoranim[i].xdep
						decoranim[i].y=decoranim[i].ydep
						decoranim[i].anim1=false
						--print("decoranim[i] "..decoranim[i].x)
					end
					-- print("fait ci")
					
					if decoranim[i].groupe==nil then
						decoranim[i].groupe=2000
					end
					decoranim[i].i=i
					--print("avant")
					group[decoranim[i].groupe]:insert(decoranim[i])
					---group[decoranim[i].groupe]:remove(decoranim[i])
				--	group[decoranim[i].groupe]:insert(decoranim[i])
				--	print("decoranim insertion group "..decoranim[i].groupe.." niveau1 1194")
					decoranim[i].isVisible=false
					chgroupdecoranim(i)--decoranim[i])
					spritereceive(i)--decoranim[i])
				end
			end
		end
	end
	if modedelancement==0 then
		-- print("!/n!/n!/n!")
		animfond={}
		animfond.nb=0
		local function aleapos()
			local x1,x2,y1,y2
			y1=mathrandom(700)-300
			x1=700
			if mathrandom(2)==1 then
				x1=-x1
			end
			x2=-x1
			y2=mathrandom(700)-300
			local angle=math.acos((x2-x1)/(mathsqrt((x1-x2)^2+(y1-y2)^2)))*180/3.14
			return x1,x2,y1,y2,angle
		end
		local function animfondtimer(event)
			-- print("animation fond "..event.source.nbtimer)
			if not removetotal then
				jeupause.timerlibre[event.source.nbtimer]=2
				local numero=event.source.numero
				--if event.source.cpt>=10 then
					if fpschoisicycle==0 and event.source.notbegan and jeupause.etat==0 then
					event.source.cpt=0
					local numero1=0
					for i=1,animfond.nb do
						if animfond[i].lib then
							numero1=i
						end
					end
					if numero1==0 then
						animfond.nb=animfond.nb+1
						numero1=animfond.nb
					end
					animfond[numero1]=display.newSprite(imaanim[numero].sheet,imaanim[numero].seq)
					animfond[numero1].alpha=imaanim[numero].alpha
					animfond[numero1].lib=false
					animfond[numero1].xScale=imaanim[numero].scale
					animfond[numero1].yScale=imaanim[numero].scale
					local x1,x2,y1,y2,angle=aleapos()
					animfond[numero1].x=x1 -- -(700+animfond[numero1].width*animfond[numero1].xScale)
					animfond[numero1].y=y1 --mathrandom(615)-307
					if x1>x2 then
						animfond[numero1].yScale=-animfond[numero1].yScale
					end
					if y1>y2 then
						angle=-angle
					end
					animfond[numero1]:rotate(angle)
					if imaanim[numero].group~=nil then
						animfond[numero1].group=imaanim[numero].group
					end
					if animfond[numero1].group==nil then
						animfond[numero1].group=2048
					end
					group[animfond[numero1].group]:insert(animfond[numero1])
					-- animfond[numero1].group=2048 --inutile?
					animfond[numero1]:play()
					local removeanim=function (obj)
						group[2048]:remove(obj)
						obj:removeSelf()
						obj.lib=true
					end
					animfond[numero1].anim=transition.to(animfond[numero1],{ x=x2,y=y2, time=10000*imaanim[numero].vitesse*vitessejeuin, iterations=1,onComplete=removeanim, onCancel=removeanim,tag="element" } ) -- { x=-animfond[numero1].x, time=10000*imaanim[numero].vitesse*vitessejeuin, iterations=1,onComplete=removeanim, onCancel=removeanim,tag="element" } )
					end
				--end
				animfondtimer1=timer.performWithDelay( imaanim[numero].cadence, animfondtimer )
				timerpause(3,animfondtimer1,event.source.nbtimer)
				animfondtimer1.numero=numero
				animfondtimer1.nbtimer=event.source.nbtimer
				-- animfondtimer1.cpt=event.source.cpt+1
				animfondtimer1.notbegan=true
			end
		end
		for i=1,#imaanim do
			-- print("animation "..i)
			if imaanim[i].carte[niveauch] then
				animfondtimer1=timer.performWithDelay( mathrandom(10000), animfondtimer )
				animfondtimer1.nbtimer=timerpause(3,animfondtimer1,nil)
				animfondtimer1.numero=i
				--animfondtimer1.cpt=0
				animfondtimer1.notbegan=false
			end
		end
	end

	-- for i=1,#obstacleim do
	-- 	if obstacleim[i].nature~=nil then
	-- 		print("lancement de l'anim")
	-- 		obstacleim[i].anim=transition.to( obstacleim[i], { rotation=obstacleim[i].rotation, time=obstacleim[i].time, iterations=obstacleim[i].iterations } )
	-- 	end
	-- end
	-- local function listener212( event )
	-- 	obstacleim[5].anim=transition.to( obstacleim[5], { rotation=-100, time=3000, iterations=1 } )
	-- end
	-- local letimerssdfg1=timer.performWithDelay( 3000, listener212 )

	-- decoranim[1]:play()
	-- decoranim[1].x=0
	-- decoranim[1].y=0
	-- decoranim[1].xScale=0.2
	-- decoranim[1].yScale=decoranim[1].xScale
	-- decoranim[1].posi=0 --0 pour coordonnée donnée donc decoranim[1].x1=XX et decoranim[1].x2=XX ,1 pour random sur les zones contructible, 2 pour sur le chemin
	-- decoranim[1].cadence=10000 
	-- --decoranim[1].legroup= <0 pour group y-.group et >0 pour que ca soit group=.group 
	if multifichier==nil then
		multifichier=require("multi")
	end
	--nouvague=0-----------------
	if modedelancement==0 then
		if multi==1 or ( aiactive==1 and contreaihaut==1) then
			multicreation()
		end
	else
		vagueencours=1
		grouppvaction.isVisible=true
	end
	if multi==1 or ( aiactive==1 and contreaihaut==1) then
		lancervague1.isVisible=false
		lancervague1.isVisible1=false
		if lancervague1chaine~=nil then
			lancervague1chaine.isVisible=false
		end
		vagsuig.isVisible=false
		
		multisave()
	end
	if  contreaihaut==1 then
		vagsuig.isVisible=true
	end
	if multi==2 then
		lancervague1.isVisible=true
		lancervague1.isVisible1=true
		if lancervague1chaine~=nil then
			lancervague1chaine.isVisible=true
		end
		if modedelancement==0 then
			multilaunch()
		end
	end
	local cozoom=coroutine.create(function ()
		local zoomfunc = require ( "zoom" )
		if modedelancement==0 then
			if multi~=0 then
				zoomfunc.zoom(2)
			else
				zoomfunc.zoom(1)
			end
		end
	end)
	coroutine.resume(cozoom)

	aidevbat=0
	if aiactive==1 then
		if modedelancement==0 then
			local aidaide = require ( "aidaide")
			aidaide.aidaide()
		else
			-- aidaidereinit=true
		end
		iniai()
		lanceai()
		print( "Lancement de l'ai^\n\n\n\n\n\n" )
	end
	print("\n\n\n\n\n\n\n aiactive "..aiactive.." modedelancement "..modedelancement.."\n\n\n\n\n")
	if modedelancement==0 then
		if multi~=0 then
			--zoomfunc.zoom(2)
		else
			--zoomfunc.zoom(1)
		end
		linftabpro={} --table de correspondance entre l'avancement et le numero de point, ne se retrouve pas dans l'apk car on copie le resultat du print pour chaque carte dans level


		-- debut de recalcul des points
		if issimulator then -- aucune optimisation chercher car est exectuté que dans le simulateur
			local commencementtime=gettime()
			local function initpointdepos()
				local pointdarr={} -- tableau avec tout les points du chemin considerer comme la sortie
				pointdarr[1]=#chemin -- considere que le dernier point du chemin est une sortie
				if cheminarr~=nil then
					for i=1,#cheminarr do
						pointdarr[i+1]=cheminarr[i] -- copie dans un tableau toute les autres sorties
					end
				end
				local function unchemin(pointactuel,distpoint,pointdarr)
					local pasarriver=true
					local pointactuel1=pointactuel
					local distpoint1=distpoint
					while pasarriver and pointactuel1<150 do
						distpoint1=distpoint1+1
						--print("iteration"..pointactuel1.." "..distpoint1)
						if linftabpro[pointactuel1]==nil then
							linftabpro[pointactuel1]=distpoint1
						elseif linftabpro[pointactuel1]>distpoint1 then
							linftabpro[pointactuel1]=distpoint1
						end
						for i=1,#pointdarr do
							if pointactuel1==pointdarr[i] then
								pasarriver=false
								--print("arriver")
							end
						end
						local dansinter=false
						if intersection~=nil then
							for i=1,#intersection do
								if intersection[i].pt==pointactuel1 then
									dansinter=true
									--print("dans une intersection")
									if intersection[i].ty==0 then
										pointactuel1=intersection[i].un

									else
										pointactuel1=intersection[i].un
										unchemin(intersection[i].deux,distpoint1,pointdarr)
									end
								end
							end
						end
						if dansinter==false then
							pointactuel1=pointactuel1+1
						end
					end
				end
				local nbpointdep=1 -- nombre de point de depart des chemins
				if pointdep~=nil then -- si il y a plus d'une entré
					nbpointdep=#pointdep+1
				end
				for i=1,nbpointdep do -- pour chacune des entré on va parcourir le chemin
					local pointactuel
					local distpoint=0
					if i==1 then
						pointactuel=1
					else
						pointactuel=pointdep[i-1]
					end
					unchemin(pointactuel,distpoint,pointdarr)
				end
				for i=1,#linftabpro do -- on regarde si aucun a ete oublié d etre calcule
					if linftabpro[i]==nil then -- on considere dans ce cas que le point est adjacent au precedent
						linftabpro[i]=linftabpro[i-1]+1
						if linftabpro[i]==nil then
							linftabpro[i]=1
							print("point pas defini correctif bug11 (numero="..i) -- nous indique qu'il y a un point vraiment bizarre et qu'il faut jeter un serieux coup d'oeil
						end
						print("point pas defini correctif bug1 (numero="..i)
					end
				end
				for i=1,#chemin do -- deuxieme verification (on s'enfiche des perf)
					if linftabpro[i]==nil then
						linftabpro[i]=linftabpro[i-1]+1
						if linftabpro[i]==nil then
							linftabpro[i]=1
							print("point pas defini correctif bug21 (numero="..i)
						end
						print("point pas defini correctif bug2 (numero="..i)
					end
				end
				local stringlinftabpro="linftabpro={"
				for i=1,#linftabpro do --copier ces lignes dans level pour optimiser (ne pas avoir a le calculer a chaque fois qu'on lance un niveau)
					if i~=1 then
						stringlinftabpro=stringlinftabpro..","
					end
					stringlinftabpro=stringlinftabpro..linftabpro[i]
				end
				print(stringlinftabpro.."}")
			end
			initpointdepos()
			print("temps de calcul des points: "..(gettime()-commencementtime))
		end
		-- fin de recalcul


		local initrecherche=require("initrecherche")
		initrecherche.new(niveauch)
	end
	--if modedelancement==0 then
		if encours==1 then
			lancertuto()
		end
	--end
	local function affinfomode(event)

		local function removemodedejeutext(event)
			--jeupause.timerlibre[event.source.nbtimer]=0
			display.remove(event.source.modedejeutext)
			event.source.modedejeutext=nil
			-- if grpartie~=nil then

			-- 	grpartie:remove(event.source.modedejeutext)
			-- 	event.source.modedejeutext:removeSelf()
			-- 	event.source.modedejeutext=nil
			-- end
		end
		local removemodedejeutext1=timer.performWithDelay( 2500,removemodedejeutext)
		--removemodedejeutext1.nbtimer=timerpause(1,removemodedejeutext1,nil)
		local datatext
		if isiphone then
			datatext={
				text="",
				x=contentcenterx,
				y=contentcentery,
				width=actualcontentwidth*0.65,
				height=0,
				font=fonttype,
				fontSize=48*fontsize,
				align="center"
			}
		else
			datatext={
				text="",
				x=contentcenterx,
				y=contentcentery,
				font=fonttype,
				fontSize=48*fontsize,
				align="center"
			}
		end
		removemodedejeutext1.modedejeutext =display.newEmbossedText(datatext) -- "", contentcenterx, contentcentery,fonttype, 48,"center" )
		removemodedejeutext1.modedejeutext:setEmbossColor(colortextemb)
		grpartie:insert(removemodedejeutext1.modedejeutext)

		varattgent=varattgentdeb
		cadencegent=cadencegentdeb
		agressivite=agressivitedeb
		accelererenn=accelererenndeb

		if modepanique then
			removemodedejeutext1.modedejeutext.text=texttraduction.modedejeu[1] or "Mode Panique!"
			if savegame.lvlpanique>1 then
				removemodedejeutext1.modedejeutext.text=removemodedejeutext1.modedejeutext.text.."\nLevel "..savegame.lvlpanique
			end
		elseif modezombie then
			removemodedejeutext1.modedejeutext.text=texttraduction.modedejeu[2] --"Mode Zombie!"
			if savegame.lvlzombie>1 then
				removemodedejeutext1.modedejeutext.text=removemodedejeutext1.modedejeutext.text.."\nLevel "..savegame.lvlzombie
			end
		elseif modesquelette then
			removemodedejeutext1.modedejeutext.text=texttraduction.modedejeu[3] -- "Mode Skeleton!"
			if savegame.lvlsquelette>1 then
				removemodedejeutext1.modedejeutext.text=removemodedejeutext1.modedejeutext.text.."\nLevel "..savegame.lvlsquelette
			end
		elseif modeperftest then
			removemodedejeutext1.modedejeutext.text="Test de performance"
			argent=argent+(-(100)*3)
		elseif modeinfini then
			if modearmy then -- contreai==1 and aiactive==1 then --1vs1 
				removemodedejeutext1.modedejeutext.text=texttraduction.modedejeu[4] -- "Mode Inf VS AI!"
			elseif modexp>=2.5 then
				removemodedejeutext1.modedejeutext.text=texttraduction.modedejeu[5] -- "Mode MegaXP!"
			elseif -argentdep/3>2000 then
				removemodedejeutext1.modedejeutext.text=texttraduction.modedejeu[6] -- "Mode Millionnaire!"
			else
				removemodedejeutext1.modedejeutext.text=texttraduction.modedejeu[7] -- "Mode Infini!"
			end
		elseif not modeinfini and aiactive==1 and contreaihaut==1 and contreai==0 then
			removemodedejeutext1.modedejeutext.text=texttraduction.modedejeu[8] -- "Mode Attaque!"
		elseif not modeinfini and contreai==1 and aiactive==1 and contreaihaut==1 then
			removemodedejeutext1.modedejeutext.text=texttraduction.modedejeu[9] -- "Mode 1VS1!"
			--debutpartie=1
		else
			if not issimulator and not tutolevel0 then
				-- savegameresul[(niveauch)+64]=1.5
				if savegameresul[(niveauch)+64]==nil then
					savegameresul[(niveauch)+64]=1
				end
				local difmod=mathfloor(savegameresul[(niveauch)+64]*100)*0.01
				local diftxt=display.newText(difmod,xmaxscreen-20,ymaxscreen-5,fonttype,10*fontsize)
				local function timerremoveevent(event)
					diftxt:removeSelf()
				end
				timer.performWithDelay(3000,timerremoveevent)
				if modehard or modewave then
					varattgent=varattgentdeb
				else
					varattgent=varattgentdeb*difmod --mathfloor(savegameresul[(niveauch)+64]*100)*0.01
				end
				local accelererenn1=accelererenndeb
				accelererenn=accelererenndeb/(0.8+varattgent*0.2)
				print("la difficultée du niveau est de "..varattgent.." accelererenn "..accelererenn)
				varminerevcorrectdif=accelererenn/accelererenn1
				print("varminerevcorrectdif "..varminerevcorrectdif)
				if varattgent>1.19 then -- deja perdu 3 fois
					agressivite=agressivitedeb*mathfloor((difmod-1.1)*10)
					cadencegent=cadencegentdeb*(1-(difmod-1.19))
				end
			else
				local difmod=1.05^(3-1) -- 3 nb parties --1  --mathfloor(savegameresul[(niveauch)+64]*100)*0.01
				local diftxt=display.newText(difmod,xmaxscreen-20,ymaxscreen-5,fonttype,10*fontsize)
				local function timerremoveevent(event)
					diftxt:removeSelf()
				end
				timer.performWithDelay(3000,timerremoveevent)
				if modehard or modewave then
					varattgent=varattgentdeb
				else
					varattgent=varattgentdeb*difmod --mathfloor(savegameresul[(niveauch)+64]*100)*0.01
				end
				local accelererenn1=accelererenndeb
				accelererenn=accelererenndeb/(0.8+varattgent*0.2)
				print("la difficultée du niveau est de "..varattgent.." accelererenn "..accelererenn)
				varminerevcorrectdif=accelererenn/accelererenn1
				print("varminerevcorrectdif "..varminerevcorrectdif)
				if varattgent>1.19 then -- deja perdu 3 fois
					agressivite=agressivitedeb*mathfloor((difmod-1.1)*10)
					cadencegent=cadencegentdeb*(1-(difmod-1.19))
				end
			end
			if tuto==0 and not tutolevel0 then
				removemodedejeutext1.modedejeutext.text="Niveau "..niveauch.."\n"..savegameall.mapname[niveauch]
				if modehard then
					removemodedejeutext1.modedejeutext.text=removemodedejeutext1.modedejeutext.text.."\n"..texttraduction.modedejeu[10]
				elseif modewave then
					removemodedejeutext1.modedejeutext.text=removemodedejeutext1.modedejeutext.text.."\n"..texttraduction.bonusrace[10]
				end
			else
				removemodedejeutext1.modedejeutext.text=""
			end
		end
		
		removemodedejeutext1.modedejeutext:setFillColor(infoniveaucolor[1],infoniveaucolor[2],infoniveaucolor[3])
		infoniveautxt=removemodedejeutext1.modedejeutext.text

		-- local removemodedejeutext=function (obj )
		-- 	grpartie:remove(obj)
		-- 	obj:removeSelf()
		-- 	obj=nil
		-- end
		--transition.to( removemodedejeutext1.modedejeutext, {delay=2000, time=1500, y=yminscreen-24*2,transition=easing.inCirc } ) -- , onComplete=removemodedejeutext,transition=easing.inCirc } )
		transition.to( removemodedejeutext1.modedejeutext, {delay=2000, time=500, xScale=5,yScale=0.5,alpha=0}) --,transition=easing.inCirc } )
		print("aff du niveau")
		if infoniveau~=nil then
			infoniveau.isVisible=false
		end
	end
	timer.performWithDelay( 100,affinfomode)
	

	if modedelancement==0 then
		local pressbouton=false
		function onKeyEvent( event )
		    -- If the "back" key was pressed on Android or Windows Phone, prevent it from backing out of the app
		    if ( event.keyName == "back" or event.keyName=="search" or event.keyName=="menu" ) then
		        local platformName = system.getInfo( "platformName" )
		        if isandroid or ( platformName == "WinPhone" ) then
		        	if not pressbouton then
		        		pressbouton=true
		        		local function timerbouton( event )
		        			pressbouton=false
						end
						timer.performWithDelay( 750, timerbouton )
		        		appuipause()
		        	end
		            return true
		        end
		    end

		    -- IMPORTANT! Return false to indicate that this app is NOT overriding the received key
		    -- This lets the operating system execute its default handling of the key
		    return false
		end

		-- Add the key event listener
		Runtime:addEventListener( "key", onKeyEvent )
	end
	if tuto==1 or tuto==2 then
		if modedelancement==0 then
			tuto1=require("tuto")
			tuto1:tuto()
			chargementtuto()
		end
		local function timer1tuto(event)
			if niveauch==1 then
				argent=argent+(-3*100)
				print("tuto part 2")
				lancervague1.isVisible=false
				--lancervague1.isVisible1=false
				if lancervague1chaine~=nil then
					lancervague1chaine.isVisible=false
				end
				appuipause()
				lancementtuto(0)
			elseif niveauch==2 then
				lancervague1.isVisible=false
				--lancervague1.isVisible1=false
				if lancervague1chaine~=nil then
					lancervague1chaine.isVisible=false
				end
				appuipause()
				lancementtuto(5)
			elseif niveauch==3 then
				--appuipause()
				lancementtuto(11)
			end
		end
		timer.performWithDelay(1000,timer1tuto)
	end
	if multi==0 and not(aiactive==1 and contreaihaut==1) then
		if spwanfile==nil then
			spwanfile=require("spawnfile")
			initspawn(level,true)
			spawndebut(modedelancement)
		else
			initspawn(level,true)
			spawndebut(modedelancement)
		end
		if niveauch==15 and goh then
			level15renfort()
		end
		if tutolevel0 then
			leveltutorenfort()
		end
	end
	print("collectgarbage niveau1 apres"..collectgarbage("count"))
	print("collectgarbage collect"..collectgarbage("collect"))
	--print("debug"..debug.getmetatable ())
	local function affinfotips(event)
		affinfo(0,true)
	end
	timer.performWithDelay(200,affinfotips)
	if tutolevel0 then -- niveau 0 (tuto avant tuto) level16 pour stronghold
		vitessejeu=0.5
		-- mdmoyennechosi=4
		-- fpschoisi=4.5
		-- fpschoisicycle=2
		-- moyennefps=2
		local cpt30sec=0
		local function timercpt30sec(event)
			if removetotal==false and removepartiel1==false and not findelapartie then
				if jeupause.etat==1 then
					cpt30sec=1000
				end
				cpt30sec=cpt30sec+1
				if cpt30sec>4*15 then
					if jeupause.etat==0 then
						appuipause()
					end
					affmenuconf(-1)
					menuprinclic=true
				else
					timer.performWithDelay(250,timercpt30sec)
				end
			end
		end
		timer.performWithDelay(250,timercpt30sec)
	end
end
print("tuto="..tuto)
return (t)