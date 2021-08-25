local t = {}--chargement de donnée pour les gentils et une partie pour les mechants+ une parties des images
t.chargementter = function ()
--cochargementter=coroutine.create(function ()
print("chargementter")
if issimulator then
	local memUsed = (collectgarbage("count")) / 1000
	local texUsed = system.getInfo( "textureMemoryUsed" ) / 1000000
	print("\n---------MEMORY USAGE INFORMATION chargement avant---------")
	print("System Memory Used:", string.format("%.03f", memUsed), "Mb")
	print("Texture Memory Used:", string.format("%.03f", texUsed), "Mb")
	print("------------------------------------------\n")
end
print("\n\n\n\n\n\n\n\n_n_drgrsdgsdfghsgdrfhjhcskbjrcsegruk")
	local nb=0
	for i=1,2,1 do
		-- print("i")
		for j=0,9,1 do
			-- print("j")
			for k=0,9,1 do
				-- print("k")
				nb=k+j*10+i*100
				-- print("nb1 "..nb)
				if tabsoldexist[nb] then -- a enlever des qu'on ajoute un soldat
					-- print("nb"..nb)
					local l=image[nb]
					if i==1 then--i orientation
						if j~=7 then
							l.regenevie=0.2--regeneration des vies quand les personnages sont statiques(gentils)
							l.attanim=2
						end
						if j==7 then -- pour que ca soit chargé rapidement pour les menu de dev qu'on puisse voir combien attaque chaque general, pour modifie valeur aller dans chargement
							if k==0 then-- humain 
								-- l.message="Gene hum: "
								-- l.vie=220--0
								-- l.attaque=15
								-- l.vitesse=3
								-- -- l.tir=1
								-- -- l.tir={}
								-- -- l.tir.porte=50000
								-- -- l.tir.attaque=1
								-- -- l.tir.vitesse=1
								-- -- l.tir.cadence=2000
								-- -- l.tir.nbfleche=3
								-- l.centrex=5--centre du corps du personnage
								-- l.centrey=7-- y inversé plus le y est "fort", plus le centre est bas 
								-- l.tailleombre=1.3
								-- l.eff3D=0.22--variation de l'impact de 3D agit en multiplication
								-- l.scale=0.128
								-- l.numframe=9
								-- l.timeatt=2000
								-- l.attanim=0--0 pour ordre special
								-- l.atty=-6.4
								-- l.attanimordre={9,5,8,4,4,4,4,4,2,7,3,2,1,1,1,1,1}--ordre special
								l.depgauche=graphics.newImageSheet( "AnimVF/gentil/General/spartiate/spartiatemvmg.png", { width=345, height=350, numFrames=6 ,sheetContentWidth=1035,sheetContentHeight=700} )
								l.attgauche=graphics.newImageSheet( "AnimVF/gentil/General/spartiate/spartiateatg.png", { width=497, height=450, numFrames=9,sheetContentWidth=1491,sheetContentHeight=1350 } )--{ width=497, height=450, numFrames=10 } )
							elseif k==1 then--humain 2
								-- l.message="Gene hum2: "
								-- l.vie=880--0
								-- l.attaque=20
								-- l.vitesse=2
								-- -- l.tir=1
								-- -- l.tir={}
								-- -- l.tir.porte=50000
								-- -- l.tir.attaque=1
								-- -- l.tir.vitesse=1
								-- -- l.tir.cadence=2000
								-- -- l.tir.nbfleche=3
								-- l.centrey=0-- y inversé plus le y est "fort", plus le centre est bas 
								-- l.tailleombre=1.3
								-- l.eff3D=0.22--variation de l'impact de 3D agit en multiplication
								-- l.scale=0.1
								-- l.numframe=7
								-- l.timeatt=1500
								-- l.attanim=1--0 pour ordre special
								-- l.atty=-6.4
								-- l.timedep=0.6
								-- --l.attanimordre={3,2,1,6,5,5,9,8,7}--ordre special
								l.depgauche=graphics.newImageSheet( "AnimVF/gentil/General/humain2/humainmvmg.png", { width=500, height=441, numFrames=6,sheetContentWidth=1000,sheetContentHeight=1323} )
								l.attgauche=graphics.newImageSheet( "AnimVF/gentil/General/humain2/humainatt.png",  { width=419, height=443, numFrames=7,sheetContentWidth=1676,sheetContentHeight=886 } )--{ width=497, height=450, numFrames=10 } )
							elseif k==2 then --humain 3
								-- l.message="Gene hum3: "
								-- l.vie=880--0
								-- l.attaque=20
								-- l.vitesse=2
								-- -- l.tir=1
								-- -- l.tir={}
								-- -- l.tir.porte=50000
								-- -- l.tir.attaque=1
								-- -- l.tir.vitesse=1
								-- -- l.tir.cadence=2000
								-- -- l.tir.nbfleche=3
								-- l.centrey=0-- y inversé plus le y est "fort", plus le centre est bas 
								-- l.tailleombre=1.3
								-- l.eff3D=0.22--variation de l'impact de 3D agit en multiplication
								-- l.scale=0.1
								-- l.numframe=7
								-- l.timeatt=1500
								-- l.attanim=1--0 pour ordre special
								-- l.atty=-6.4
								-- l.timedep=0.6
								-- --l.attanimordre={3,2,1,6,5,5,9,8,7}--ordre special
								l.depgauche=graphics.newImageSheet( "AnimVF/gentil/General/humain3/humainmvmg.png", { width=180, height=303, numFrames=6,sheetContentWidth=540,sheetContentHeight=606} )
								l.attgauche=graphics.newImageSheet( "AnimVF/gentil/General/humain3/humainatt.png",  { width=280, height=403, numFrames=6,sheetContentWidth=560,sheetContentHeight=1209 } )--{ width=497, height=450, numFrames=10 } )
								l.atttir=graphics.newImageSheet( "AnimVF/gentil/General/humain3/humantir.png", { width=280, height=403, numFrames=6,sheetContentWidth=560,sheetContentHeight=1209 } )
							elseif k==3 then -- elfe
								-- l.message="Gene elfe: "
								-- l.vitesse=3
								-- l.vie=220
								-- l.centrex=5--centre du corps du personnage
								-- l.centrey=7-- y inversé plus le y est "fort", plus le centre est bas 
								-- l.tailleombre=1.3
								-- l.eff3D=0.22--variation de l'impact de 3D agit en multiplication
								-- l.scale=0.128
								-- l.numframe=6
								-- l.attanim=1--0 pour ordre special
								l.depgauche=graphics.newImageSheet( "AnimVF/gentil/General/elfe/elfemvmg.png", { width=400, height=350, numFrames=6,sheetContentWidth=1200,sheetContentHeight=700 } )
								l.attgauche=graphics.newImageSheet( "AnimVF/gentil/General/elfe/elfeatg.png", { width=400, height=350, numFrames=6,sheetContentWidth=1200,sheetContentHeight=700 } ) -- { width=497, height=450, numFrames=10 } )
							elseif k==4 then -- Necromancer
								-- l.message="Gene elfe2: "
								-- l.vie=220
								-- l.vitesse=3
								-- l.tir=1 --1
								-- l.tir={}
								-- l.tir.projscale=0.1
								-- l.tir.proj="01"
								-- l.tir.porte=30000
								-- l.tir.attaque=10
								-- l.tir.vitesse=1
								-- l.tir.cadence=4000
								-- l.tir.nbfleche=3
								-- l.tir.combat=1
								-- l.tir.attscale=1.2
								-- l.tir.timean=1
								-- l.centrex=5--centre du corps du personnage
								-- l.centrey=7-- y inversé plus le y est "fort", plus le centre est bas 
								-- l.tailleombre=1.3
								-- l.eff3D=0.22--variation de l'impact de 3D agit en multiplication
								-- l.scale=0.128
								-- l.numframe=6
								-- l.attanim=1--0 pour ordre special
								l.depgauche=graphics.newImageSheet( "AnimVF/gentil/General/elfe3/elfmvmg.png", { width=350, height=350, numFrames=6,sheetContentWidth=700,sheetContentHeight=1050 } )
								l.attgauche=graphics.newImageSheet( "AnimVF/gentil/General/elfe3/elfeatt.png", { width=500, height=441, numFrames=6,sheetContentWidth=1000,sheetContentHeight=1323 } ) -- { width=497, height=450, numFrames=10 } )
								-- l.atttir=graphics.newImageSheet( "AnimVF/gentil/General/elfe2/elfetir.png", { width=202, height=250, numFrames=3,sheetContentWidth=202,sheetContentHeight=750 } )
							elseif k==5 then -- elfe 2
								-- l.message="Gene elfemont: "
								-- l.vie=400
								-- l.vitesse=3
								-- l.timedep=0.4
								-- l.tir=1 --1
								-- l.tir={}
								-- l.tir.projscale=0.1
								-- l.tir.proj="01"
								-- l.tir.porte=30000
								-- l.tir.attaque=30
								-- l.tir.vitesse=1
								-- l.tir.cadence=4000
								-- l.tir.nbfleche=1
								-- l.tir.combat=1
								-- l.tir.attscale=1
								-- l.tir.timean=1
								-- l.tir.y=-1
								-- l.tir.x=3
								-- l.tailleombre=1.3
								-- l.eff3D=0.22--variation de l'impact de 3D agit en multiplication
								-- l.scale=0.128
								-- l.numframe=9
								-- l.attanim=0--0 pour ordre special
								-- l.attanimordre={1,1,1,1,6,5,4,3,2,3,6,7,8,9}
								-- l.typedep=1
								-- l.tirnbfr=5
								-- l.attx=-5
								l.depgauche=graphics.newImageSheet( "AnimVF/gentil/General/elfech/elfemvmg.png", { width=400, height=400, numFrames=4,sheetContentWidth=800,sheetContentHeight=800 } )
								l.attgauche=graphics.newImageSheet( "AnimVF/gentil/General/elfech/elfeatg.png", { width=500, height=400, numFrames=9,sheetContentWidth=1500,sheetContentHeight=1200 } ) -- { width=497, height=450, numFrames=10 } )
								l.atttir=graphics.newImageSheet( "AnimVF/gentil/General/elfech/elfetir.png", { width=359, height=334, numFrames=5,sheetContentWidth=1077,sheetContentHeight=668 } )
							elseif k==6 then--geant
								-- l.message="Gladiator:"
								-- l.vie=400
								-- l.attaque=7
								-- l.blocnbennemi=3--nombre d'ennemi bloquer par le soldat
								-- l.attnbennemi=2--nombre d'ennemi qu'il peut attaquer en meme temps
								-- l.vitesse=2.5
								-- l.numframe=7
								-- l.centrex=-2--centre du corps du personnage
								-- l.centrey=10-- y inversé plus le y est "fort", plus le centre est bas 
								-- l.tailleombre=1.2
								-- l.timedep=0.75
								-- l.attanim=1--0 pour ordre special
								-- l.scale=0.11
								-- l.eff3D=0.38
								-- l.porte=7
								l.depgauche=graphics.newImageSheet( "AnimVF/gentil/General/geant1/gladiateurmvmg.png", { width=600, height=500, numFrames=6,sheetContentWidth=1200,sheetContentHeight=1500 } )
								l.attgauche=graphics.newImageSheet( "AnimVF/gentil/General/geant1/gladiateuratg.png", { width=748, height=410, numFrames=7,sheetContentWidth=1496,sheetContentHeight=1640 } )
							elseif k==7 then -- geant 2
								-- l.message="Gene geant:"
								-- l.vie=800
								-- l.attaque=14
								-- l.blocnbennemi=4--nombre d'ennemi bloquer par le soldat
								-- l.attnbennemi=6--nombre d'ennemi qu'il peut attaquer en meme temps
								-- l.vitesse=4
								-- l.numframe=6
								-- l.centrex=4--centre du corps du personnage
								-- l.centrey=13-- y inversé plus le y est "fort", plus le centre est bas 
								-- l.tailleombre=2
								-- l.attanim=0--0 pour ordre special
								-- l.attanimordre={1,1,1,2,2,2,3,3,3,4,4,4,5,5,5,3,6,6,6,6}--ordre special
								-- l.scale=0.258
								-- l.eff3D=0.38
								-- l.porte=7
								-- l.atty=-25
								l.depgauche=graphics.newImageSheet( "AnimVF/gentil/General/geant2/geantmvmg.png", { width=237, height=243, numFrames=6,sheetContentWidth=237,sheetContentHeight=1458 } )
								l.attgauche=graphics.newImageSheet( "AnimVF/gentil/General/geant2/geantatg.png", { width=400, height=298, numFrames=6,sheetContentWidth=1200,sheetContentHeight=596 } )
							elseif k==8 then -- geant 3
								-- l.message="Gene geant3:"
								-- l.vie=800
								-- l.attaque=14
								-- l.blocnbennemi=4--nombre d'ennemi bloquer par le soldat
								-- l.attnbennemi=6--nombre d'ennemi qu'il peut attaquer en meme temps
								-- l.vitesse=4
								-- l.numframe=6
								-- l.centrex=4--centre du corps du personnage
								-- l.centrey=13-- y inversé plus le y est "fort", plus le centre est bas 
								-- l.tailleombre=2
								-- l.attanim=0--0 pour ordre special
								-- l.attanimordre={1,1,1,2,2,2,3,3,3,4,4,4,5,5,5,3,6,6,6,6}--ordre special
								-- l.scale=0.258
								-- l.eff3D=0.38
								-- l.porte=7
								-- l.atty=-25
								l.depgauche=graphics.newImageSheet( "AnimVF/gentil/General/geant3/geantmvmg.png", { width=508, height=502, numFrames=6,sheetContentWidth=1016,sheetContentHeight=1506 } )
								l.attgauche=graphics.newImageSheet( "AnimVF/gentil/General/geant3/geantatt.png", { width=600, height=616, numFrames=6,sheetContentWidth=1800,sheetContentHeight=1232 } )
							elseif k==9 then -- oliphan
								-- l.message="Gene dragon:"
								-- l.vie=800
								-- l.attaque=14
								-- l.blocnbennemi=4--nombre d'ennemi bloquer par le soldat
								-- l.attnbennemi=6--nombre d'ennemi qu'il peut attaquer en meme temps
								-- l.vitesse=4
								-- l.numframe=6
								-- l.centrex=4--centre du corps du personnage
								-- l.centrey=13-- y inversé plus le y est "fort", plus le centre est bas 
								-- l.tailleombre=2
								-- l.attanim=0--0 pour ordre special
								-- l.attanimordre={1,1,1,2,2,2,3,3,3,4,4,4,5,5,5,3,6,6,6,6}--ordre special
								-- l.scale=0.258
								-- l.eff3D=0.38
								-- l.porte=7
								-- l.atty=-25
								l.depgauche=graphics.newImageSheet( "AnimVF/gentil/General/oliphant/oliphantmvm.png", { width=486, height=420, numFrames=3,sheetContentWidth=972,sheetContentHeight=840 } )
								l.attgauche=graphics.newImageSheet( "AnimVF/gentil/General/oliphant/oliphantatg.png", { width=494, height=430, numFrames=4,sheetContentWidth=988,sheetContentHeight=860 } )
								l.atttir=graphics.newImageSheet( "AnimVF/gentil/General/oliphant/oliphanttir.png", { width=494, height=430, numFrames=4,sheetContentWidth=988,sheetContentHeight=860 } )
							end
						elseif j==0 then--j classe
							if k==0 then--k niveau		
							elseif k==1 then--attention au image trop grande
								-- ordre 
								-- l={scale=0.09,attscale=1,attx=0,atty=0,centrex=0,centrey=0,tailleombre=1}
								-- l={vitesse=1,timedep=1.5,effetdure=20,effetimpact=0.18,eff3D=1}
								-- l={numframe=5,timeatt=800,attanim=1,porte=1,message="soldat: ",tir=0}
								-- l.tir={} -- si tir==1
								-- l.tir={combat=0,attscale=1,projscale=0.1,proj="02",vitesse=1,cadence=2000,nbfleche=1,porte=50000,attaque=5}
								-- l={vie=100,attaque=10,agressivite=2,blocnbennemi=1,attnbennemi=1,charge=0,regenevie=0,regene=20,argent=10}
								--l={vie=125,attaque=15,vitesse=1,numframe=5,timeatt=800,regene=20,charge=0,regenevie=0,blocnbennemi=1,attnbennemi=1,message="soldat: ",timedep=1.5,centrex=0,centrey=-1.5,tailleombre=0.7,effetdure=20,effetimpact=0.18,attanim=1,tir=0,eff3D=0.4,attscale=1,attx=0,atty=0}
								l.vie=44
								l.attaque=7
								l.vitesse=3.5--1
								l.numframe=5--nombre d'image de l'animation d'attaque (5 par defaut)
								l.timeatt=1000--duree de l'attaque en ms--800 par defaut-------------------------hugo si tu veux faire varier la durée d'attaque d'une unitée tu ajoute cette ligne apres "isoldat[numero].numframe=6" ou "isoldat[numero].vitesse=1" avec un espace
								l.message=texttraduction.soldat[11]..": " --"Soldier: "
								l.timedep=1.25--1.5--coefficient du temps de l'animation plus le nb est grand(max20 )plus k'anim sera rapide min0.05
								l.centrex=1--centre du corps du personnage
								l.centrey=1-- y inversé plus le y est "fort", plus le centre est bas 
								l.tailleombre=0.8
								l.effetdure=12--10--14--variable non fonctionnelle permet de faire varier la dure de l'effet de variation de hauteur pendant que le personnage marche
								l.effetimpact=0.40--0.25--22--0.44--0.22--permet de faire varier la position en ordonnee du perso pendant qu'il avance pour qu'on ait pas l'impression qu'il se dep)lace lineairement
								l.attanim=0--0 ordre choisi,1 anim ordre normal, 2 ordre inverse, 3
								l.finatt=10
								l.attanimordre={1,2,3,4,5,5,5,5,3,2,2,2,2,2,2}
								l.eff3D=0.12--variation de l'impact de 3D agit en multiplication
								l.attx=0--deplacement de l'anim d'attaque pour qu'elle soit superposé a celle de deplacement
								l.atty=-3 --deplacement de l'anim d'attaque pour qu'elle soit superposé a celle de deplacement
								l.scale=0.11
								l.depgauche=graphics.newImageSheet( "AnimVF/gentil/Infanterie/soldat1/sol1mvmg/animsoldat1g.png", { width=156, height=206, numFrames=6,sheetContentWidth=156,sheetContentHeight=1236 } )
								l.attgauche=graphics.newImageSheet( "AnimVF/gentil/Infanterie/soldat1/sol1atg/soldat1atg.png", { width=170, height=260, numFrames=5,sheetContentWidth=170,sheetContentHeight=1300 } ) --260
								print("\n\n\n\n\nrdsgdgsrd,scjrhctskernvtsjbc")
							elseif k==2 then
								l.vie=63
								l.attaque=9
								l.vitesse=3.5--1
								l.numframe=5--nombre d'image de l'animation d'attaque (5 par defaut)
								l.timeatt=1000--duree de l'attaque en ms--800 par defaut-------------------------hugo si tu veux faire varier la durée d'attaque d'une unitée tu ajoute cette ligne apres "isoldat[numero].numframe=6" ou "isoldat[numero].vitesse=1" avec un espace
								l.message=texttraduction.soldat[12]..": " --"Militiaman: "
								l.timedep=1.25--coefficient du temps de l'animation plus le nb est grand(max20 )plus k'anim sera rapide min0.05
								l.centrex=1--centre du corps du personnage
								l.centrey=1-- y inversé plus le y est "fort", plus le centre est bas 
								l.tailleombre=0.9
								l.effetdure=12--14--variable non fonctionnelle permet de faire varier la dure de l'effet de variation de hauteur pendant que le personnage marche
								l.effetimpact=0.40--22--0.44--0.22--permet de faire varier la position en ordonnee du perso pendant qu'il avance pour qu'on ait pas l'impression qu'il se dep)lace lineairement
								l.attanim=0--0 ordre choisi,1 anim ordre normal, 2 ordre inverse, 3
								l.finatt=10
								l.attanimordre={1,2,3,4,5,5,5,5,3,2,2,2,2,2,2}
								l.eff3D=0.1--variation de l'impact de 3D agit en multiplication
								l.attx=0--deplacement de l'anim d'attaque pour qu'elle soit superposé a celle de deplacement
								l.atty=0--deplacement de l'anim d'attaque pour qu'elle soit superposé a celle de deplacement
								l.scale=0.18
								l.depgauche=graphics.newImageSheet( "AnimVF/gentil/Infanterie/soldat2/sol2mvmg.png", { width=101, height=138, numFrames=6,sheetContentWidth=101,sheetContentHeight=828 } )
								l.attgauche=graphics.newImageSheet( "AnimVF/gentil/Infanterie/soldat2/sol2atg.png", { width=121, height=132, numFrames=5,sheetContentWidth=121,sheetContentHeight=660 } )
							elseif k==3 then --soldat 3 humain
								l.vie=121
								l.attaque=19
								l.vitesse=3.5--1
								l.numframe=5--nombre d'image de l'animation d'attaque (5 par defaut)
								l.timeatt=1000--duree de l'attaque en ms--800 par defaut-------------------------hugo si tu veux faire varier la durée d'attaque d'une unitée tu ajoute cette ligne apres "isoldat[numero].numframe=6" ou "isoldat[numero].vitesse=1" avec un espace
								l.argent=10--argent gagner lors de la mort de l'unité--pour gain specifique au soldat faire pareil qu'au dessus
								l.message=texttraduction.soldat[13]..": " --"Swordsman: "
								l.timedep=1.25--coefficient du temps de l'animation plus le nb est grand(max20 )plus k'anim sera rapide min0.05
								l.centrex=1.2--centre du corps du personnage
								l.centrey=1.8-- y inversé plus le y est "fort", plus le centre est bas 
								l.tailleombre=1.1
								l.effetdure=12--14--variable non fonctionnelle permet de faire varier la dure de l'effet de variation de hauteur pendant que le personnage marche
								l.effetimpact=0.40--22--0.44--0.22--permet de faire varier la position en ordonnee du perso pendant qu'il avance pour qu'on ait pas l'impression qu'il se dep)lace lineairement
								l.eff3D=0.12--variation de l'impact de 3D agit en multiplication
								l.attx=0--deplacement de l'anim d'attaque pour qu'elle soit superposé a celle de deplacement
								l.atty=-4.32--deplacement de l'anim d'attaque pour qu'elle soit superposé a celle de deplacement
								l.scale=0.133
								l.depgauche=graphics.newImageSheet( "AnimVF/gentil/Infanterie/soldat3/sol3mvmg.png", { width=195, height=200, numFrames=6,sheetContentWidth=195,sheetContentHeight=1200 } )
								l.attgauche=graphics.newImageSheet( "AnimVF/gentil/Infanterie/soldat3/sol3atg.png", { width=167, height=265, numFrames=5,sheetContentWidth=167,sheetContentHeight=1325 } )
							elseif k==4 then --soldat 4 humain 
								l.vie=160
								l.attaque=34
								l.vitesse=3.5--1
								l.numframe=5--nombre d'image de l'animation d'attaque (5 par defaut)
								l.timeatt=1500 -- 1100--duree de l'attaque en ms--800 par defaut-------------------------hugo si tu veux faire varier la durée d'attaque d'une unitée tu ajoute cette ligne apres "isoldat[numero].numframe=6" ou "isoldat[numero].vitesse=1" avec un espace
								l.argent=10--argent gagner lors de la mort de l'unité--pour gain specifique au soldat faire pareil qu'au dessus
								l.agressivite=2
								l.message=texttraduction.soldat[14]..": " --"Champion: "
								l.centrex=1.5--centre du corps du personnage
								l.centrey=6-- y inversé plus le y est "fort", plus le centre est bas 
								l.tailleombre=1.5
								l.effetdure=12--14--variable non fonctionnelle permet de faire varier la dure de l'effet de variation de hauteur pendant que le personnage marche
								l.effetimpact=0.40--22--0.44--0.22--permet de faire varier la position en ordonnee du perso pendant qu'il avance pour qu'on ait pas l'impression qu'il se dep)lace lineairement
								l.attanim=0--0 ordre choisi,1 anim ordre normal, 2 ordre inverse, 3
								l.finatt=7
								l.attanimordre={1,2,3,4,4,4,5,5,5,5,5,5,3,1}
								l.eff3D=0.12--variation de l'impact de 3D agit en multiplication
								l.attx=-4--deplacement de l'anim d'attaque pour qu'elle soit superposé a celle de deplacement
								l.atty=0--deplacement de l'anim d'attaque pour qu'elle soit superposé a celle de deplacement
								l.scale=0.128
								l.depgauche=graphics.newImageSheet( "AnimVF/gentil/Infanterie/soldat4/sol4mvmg.png", { width=212, height=286, numFrames=6,sheetContentWidth=212,sheetContentHeight=1716 } )
								l.attgauche=graphics.newImageSheet( "AnimVF/gentil/Infanterie/soldat4/sol4atg.png", { width=276, height=286, numFrames=5,sheetContentWidth=276,sheetContentHeight=1430 } )
							elseif k==5 then
								l.vie=10
								l.attaque=1
								l.vitesse=3--1
								l.agressivite=3
								l.message="Bowman1: "
								l.centrex=1--centre du corps du personnage
								l.centrey=1.2--y inversé plus le y est "fort", plus le centre est bas 
								l.tailleombre=0.7
								l.timeatt=1200
								l.attanim=1--0 pour ordre special
								l.effetdure=2--14--variable non fonctionnelle permet de faire varier la dure de l'effet de variation de hauteur pendant que le personnage marche
								l.argent=5
								l.scale=0.109
								l.eff3D=0.12--variation de l'impact de 3D agit en multiplication
								l.numframe=5
								l.depgauche=graphics.newImageSheet( "AnimVF/mechant/archer/archermvmg.png", { width=158, height=225, numFrames=6,sheetContentWidth=158,sheetContentHeight=1350 } )
								l.tir=1 --1
								l.tir={}
								l.tir.projscale=0.2
								l.tir.proj="01"
								l.tir.porte=10000
								l.tir.attaque=24
								l.tir.vitesse=1.5
								l.tir.cadence=1000
								l.tir.nbfleche=1
								l.tir.combat=1
								l.tir.attscale=1
								l.tir.timean=1

								l.tirnbfr=5
								l.atttir=graphics.newImageSheet( "AnimVF/mechant/archer/archeratg.png", { width=173, height=201, numFrames=5,sheetContentWidth=173,sheetContentHeight=1005 } )
							elseif k==6 then
								l.vie=20
								l.attaque=1
								l.vitesse=3--1
								l.agressivite=3
								l.message="Bowman2: "
								l.centrex=1--centre du corps du personnage
								l.centrey=1.2--y inversé plus le y est "fort", plus le centre est bas 
								l.tailleombre=0.7
								l.timeatt=1200
								l.attanim=1--0 pour ordre special
								l.effetdure=2--14--variable non fonctionnelle permet de faire varier la dure de l'effet de variation de hauteur pendant que le personnage marche
								l.argent=5
								l.scale=0.109
								l.eff3D=0.12--variation de l'impact de 3D agit en multiplication
								l.numframe=5
								l.depgauche=graphics.newImageSheet( "AnimVF/mechant/archer/archermvmg.png", { width=158, height=225, numFrames=6,sheetContentWidth=158,sheetContentHeight=1350 } )
								l.tir=1 --1
								l.tir={}
								l.tir.projscale=0.2
								l.tir.proj="01"
								l.tir.porte=20000
								l.tir.attaque=46
								l.tir.vitesse=1.5
								l.tir.cadence=1000
								l.tir.nbfleche=1
								l.tir.combat=1
								l.tir.attscale=1
								l.tir.timean=1

								l.tirnbfr=5
								l.atttir=graphics.newImageSheet( "AnimVF/mechant/archer/archeratg.png", { width=173, height=201, numFrames=5,sheetContentWidth=173,sheetContentHeight=1005 } )
							elseif k==7 then
								l.vie=30
								l.attaque=1
								l.vitesse=3--1
								l.agressivite=3
								l.message="Bowman3: "
								l.centrex=1--centre du corps du personnage
								l.centrey=1.2--y inversé plus le y est "fort", plus le centre est bas 
								l.tailleombre=0.7
								l.timeatt=1200
								l.attanim=1--0 pour ordre special
								l.effetdure=2--14--variable non fonctionnelle permet de faire varier la dure de l'effet de variation de hauteur pendant que le personnage marche
								l.argent=5
								l.scale=0.109
								l.eff3D=0.12--variation de l'impact de 3D agit en multiplication
								l.numframe=5
								l.depgauche=graphics.newImageSheet( "AnimVF/mechant/archer/archermvmg.png", { width=158, height=225, numFrames=6,sheetContentWidth=158,sheetContentHeight=1350 } )
								l.tir=1 --1
								l.tir={}
								l.tir.projscale=0.2
								l.tir.proj="01"
								l.tir.porte=40000
								l.tir.attaque=55
								l.tir.vitesse=1.5
								l.tir.cadence=1000
								l.tir.nbfleche=1
								l.tir.combat=1
								l.tir.attscale=1
								l.tir.timean=1

								l.tirnbfr=5
								l.atttir=graphics.newImageSheet( "AnimVF/mechant/archer/archeratg.png", { width=173, height=201, numFrames=5,sheetContentWidth=173,sheetContentHeight=1005 } )
							elseif k==8 then
								l.vie=50
								l.attaque=1
								l.vitesse=3--1
								l.agressivite=3
								l.message="Bowman4: "
								l.centrex=1--centre du corps du personnage
								l.centrey=1.2--y inversé plus le y est "fort", plus le centre est bas 
								l.tailleombre=0.7
								l.timeatt=1200
								l.attanim=1--0 pour ordre special
								l.effetdure=2--14--variable non fonctionnelle permet de faire varier la dure de l'effet de variation de hauteur pendant que le personnage marche
								l.argent=5
								l.scale=0.109
								l.eff3D=0.12--variation de l'impact de 3D agit en multiplication
								l.numframe=5
								l.depgauche=graphics.newImageSheet( "AnimVF/mechant/archer/archermvmg.png", { width=158, height=225, numFrames=6,sheetContentWidth=158,sheetContentHeight=1350 } )
								l.tir=1 --1
								l.tir={}
								l.tir.projscale=0.2
								l.tir.proj="01"
								l.tir.porte=80000
								l.tir.attaque=66
								l.tir.vitesse=1.5
								l.tir.cadence=1000
								l.tir.nbfleche=1
								l.tir.combat=1
								l.tir.attscale=1
								l.tir.timean=1

								l.tirnbfr=5
								l.atttir=graphics.newImageSheet( "AnimVF/mechant/archer/archeratg.png", { width=173, height=201, numFrames=5,sheetContentWidth=173,sheetContentHeight=1005 } )
							end
							--vie=vie+bonus
						elseif j==1 then
							if k<=4 then
								l.scale=0.112
								l.blocnbennemi=3
								l.attnbennemi=3
								l.attanim=0--0 pour ordre special
								l.attanimordre={1,1,2,2,3,3,4,4,4,4,4,5}--ordre special
							end
							if k==0 then
							elseif k==2 then
								l.vie=237
								l.attaque=9
								l.vitesse=0.8--1
								l.timeatt=1000--duree de l'attaque en ms--800 par defaut-------------------------hugo si tu veux faire varier la durée d'attaque d'une unitée tu ajoute cette ligne apres "isoldat[numero].numframe=6" ou "isoldat[numero].vitesse=1" avec un espace
								l.charge=10
								l.blocnbennemi=2--nombre d'ennemi bloquer par le soldat
								l.attnbennemi=3--nombre d'ennemi qu'il peut attaquer en meme temps
								l.message=texttraduction.soldat[15]..": " --"Butcher: "
								l.timedep=1--coefficient du temps de l'animation plus le nb est grand(max20 )plus k'anim sera rapide min0.05
								l.centrex=2.3--centre du corps du personnage
								if goh then
									l.centrey=0
								else
									l.centrey=8.9-- y inversé plus le y est "fort", plus le centre est bas 
								end
								l.tailleombre=2
								l.effetdure=15--14--variable non fonctionnelle permet de faire varier la dure de l'effet de variation de hauteur pendant que le personnage marche
								l.effetimpact=0.30--22--0.44--0.22--permet de faire varier la position en ordonnee du perso pendant qu'il avance pour qu'on ait pas l'impression qu'il se dep)lace lineairement
								l.attanim=0--0 ordre choisi,1 anim ordre normal, 2 ordre inverse, 3
								l.finatt=10
								l.attanimordre={1,2,3,4,5,5,5,5,2,6,6,1,1}
								l.eff3D=0.20--variation de l'impact de 3D agit en multiplication
								l.numframe=6
								l.attanim=1
								l.attscale=0.75
								l.atty=-19 --deplacement de l'anim d'attaque pour qu'elle soit superposé a celle de deplacement
								l.attx=5--deplacement de l'anim d'attaque pour qu'elle soit superposé a celle de deplacement
								l.scale=0.126
								l.depgauche=graphics.newImageSheet( "AnimVF/gentil/Geant/geant1/geant1mvmg.png", { width=303, height=341, numFrames=6,sheetContentWidth=303,sheetContentHeight=2046 } )
								l.attgauche=graphics.newImageSheet( "AnimVF/gentil/Geant/geant1/geant1atg.png", { width=660, height=650, numFrames=6,sheetContentWidth=1980,sheetContentHeight=1300 } )
							elseif k==3 then
								l.vie=402
								l.attaque=16
								l.vitesse=0.8
								l.timeatt=1300--duree de l'attaque en ms--800 par defaut-------------------------hugo si tu veux faire varier la durée d'attaque d'une unitée tu ajoute cette ligne apres "isoldat[numero].numframe=6" ou "isoldat[numero].vitesse=1" avec un espace
								l.charge=15
								l.blocnbennemi=3--nombre d'ennemi bloquer par le soldat
								l.attnbennemi=4--nombre d'ennemi qu'il peut attaquer en meme temps
								l.message=texttraduction.soldat[16]..": " --"Ogre: "
								l.timedep=1--coefficient du temps de l'animation plus le nb est grand(max20 )plus k'anim sera rapide min0.05
								l.centrex=1.8--centre du corps du personnage
								l.centrey=8.9-- y inversé plus le y est "fort", plus le centre est bas 
								l.tailleombre=2
								l.effetdure=15--14--variable non fonctionnelle permet de faire varier la dure de l'effet de variation de hauteur pendant que le personnage marche
								l.effetimpact=0.30--22--0.44--0.22--permet de faire varier la position en ordonnee du perso pendant qu'il avance pour qu'on ait pas l'impression qu'il se dep)lace lineairement
								l.attanim=0--0 ordre choisi,1 anim ordre normal, 2 ordre inverse, 3
								l.finatt=10
								l.attanimordre={1,2,3,4,5,5,5,5,2,6,6,1,1}
								l.eff3D=0.20--variation de l'impact de 3D agit en multiplication
								l.numframe=6
								l.attanim=1
								l.attscale=0.75
								l.atty=-20.4
								l.attx=5
								l.scale=0.132
								l.depgauche=graphics.newImageSheet( "AnimVF/gentil/Geant/geant2/geant2mvmg.png", { width=315, height=341, numFrames=6,sheetContentWidth=315,sheetContentHeight=2046 } )
								l.attgauche=graphics.newImageSheet( "AnimVF/gentil/Geant/geant2/geant2atg.png", {width=650, height=620, numFrames=6,sheetContentWidth=1950,sheetContentHeight=1240 } )
							elseif k==4 then
								l.vie=457
								l.attaque=22
								l.vitesse=0.8
								l.timeatt=1500--duree de l'attaque en ms--800 par defaut-------------------------hugo si tu veux faire varier la durée d'attaque d'une unitée tu ajoute cette ligne apres "isoldat[numero].numframe=6" ou "isoldat[numero].vitesse=1" avec un espace
								l.charge=20
								l.blocnbennemi=4--nombre d'ennemi bloquer par le soldat
								l.attnbennemi=5--nombre d'ennemi qu'il peut attaquer en meme temps
								l.message=texttraduction.soldat[17]..": " --"Skinner: "
								l.timedep=1--coefficient du temps de l'animation plus le nb est grand(max20 )plus k'anim sera rapide min0.05
								l.centrex=3.8--centre du corps du personnage
								l.centrey=8.9-- y inversé plus le y est "fort", plus le centre est bas 
								l.tailleombre=2
								l.effetdure=15--14--variable non fonctionnelle permet de faire varier la dure de l'effet de variation de hauteur pendant que le personnage marche
								l.effetimpact=0.30--22--0.44--0.22--permet de faire varier la position en ordonnee du perso pendant qu'il avance pour qu'on ait pas l'impression qu'il se dep)lace lineairement
								l.attanim=0--0 ordre choisi,1 anim ordre normal, 2 ordre inverse, 3
								l.finatt=9
								l.attanimordre={1,2,3,4,5,5,5,5,2,6,6,1,1}
								l.eff3D=0.20--variation de l'impact de 3D agit en multiplication
								l.numframe=6
								l.attanim=1
								l.attscale=0.75
								l.atty=-21.6 --277
								l.attx=5
								l.scale=0.14
								l.depgauche=graphics.newImageSheet( "AnimVF/gentil/Geant/geant3/geant3mvmg.png", { width=333, height=341, numFrames=6,sheetContentWidth=333,sheetContentHeight=2046 } )
								l.attgauche=graphics.newImageSheet( "AnimVF/gentil/Geant/geant3/geant3atg.png", { width=668, height=618, numFrames=6,sheetContentWidth=2004,sheetContentHeight=1236 } )
							
							elseif k==6 then
								l.vie=20
								l.attaque=1
								l.vitesse=3--1
								l.agressivite=3
								l.message="Bowman2: "
								l.centrex=1--centre du corps du personnage
								l.centrey=1.2--y inversé plus le y est "fort", plus le centre est bas 
								l.tailleombre=0.7
								l.timeatt=1200
								l.attanim=1--0 pour ordre special
								l.effetdure=2--14--variable non fonctionnelle permet de faire varier la dure de l'effet de variation de hauteur pendant que le personnage marche
								l.argent=5
								l.scale=0.109
								l.eff3D=0.12--variation de l'impact de 3D agit en multiplication
								l.numframe=5
								l.depgauche=graphics.newImageSheet( "AnimVF/mechant/archer/archermvmg.png", { width=158, height=225, numFrames=6,sheetContentWidth=158,sheetContentHeight=1350 } )
								l.tir=1 --1
								l.tir={}
								l.tir.projscale=0.2
								l.tir.proj="01"
								l.tir.porte=10000
								l.tir.attaque=42
								l.tir.vitesse=1.5
								l.tir.cadence=1000
								l.tir.nbfleche=1
								l.tir.combat=1
								l.tir.attscale=1
								l.tir.timean=1
								l.tir.impact=10
								l.tir.typetra=0

								l.tirnbfr=5
								l.atttir=graphics.newImageSheet( "AnimVF/mechant/archer/archeratg.png", { width=173, height=201, numFrames=5,sheetContentWidth=173,sheetContentHeight=1005 } )
							elseif k==7 then
								l.vie=30
								l.attaque=1
								l.vitesse=3--1
								l.agressivite=3
								l.message="Bowman3: "
								l.centrex=1--centre du corps du personnage
								l.centrey=1.2--y inversé plus le y est "fort", plus le centre est bas 
								l.tailleombre=0.7
								l.timeatt=1200
								l.attanim=1--0 pour ordre special
								l.effetdure=2--14--variable non fonctionnelle permet de faire varier la dure de l'effet de variation de hauteur pendant que le personnage marche
								l.argent=5
								l.scale=0.109
								l.eff3D=0.12--variation de l'impact de 3D agit en multiplication
								l.numframe=5
								l.depgauche=graphics.newImageSheet( "AnimVF/mechant/archer/archermvmg.png", { width=158, height=225, numFrames=6,sheetContentWidth=158,sheetContentHeight=1350 } )
								l.tir=1 --1
								l.tir={}
								l.tir.projscale=0.2
								l.tir.proj="01"
								l.tir.porte=20000
								l.tir.attaque=55
								l.tir.vitesse=1.5
								l.tir.cadence=1000
								l.tir.nbfleche=1
								l.tir.combat=1
								l.tir.attscale=1
								l.tir.timean=1
								l.tir.timean=1
								l.tir.impact=14

								l.tirnbfr=5
								l.atttir=graphics.newImageSheet( "AnimVF/mechant/archer/archeratg.png", { width=173, height=201, numFrames=5,sheetContentWidth=173,sheetContentHeight=1005 } )
							elseif k==8 then
								l.vie=50
								l.attaque=1
								l.vitesse=3--1
								l.agressivite=3
								l.message="Bowman4: "
								l.centrex=1--centre du corps du personnage
								l.centrey=1.2--y inversé plus le y est "fort", plus le centre est bas 
								l.tailleombre=0.7
								l.timeatt=1200
								l.attanim=1--0 pour ordre special
								l.effetdure=2--14--variable non fonctionnelle permet de faire varier la dure de l'effet de variation de hauteur pendant que le personnage marche
								l.argent=5
								l.scale=0.109
								l.eff3D=0.12--variation de l'impact de 3D agit en multiplication
								l.numframe=5
								l.depgauche=graphics.newImageSheet( "AnimVF/mechant/archer/archermvmg.png", { width=158, height=225, numFrames=6,sheetContentWidth=158,sheetContentHeight=1350 } )
								l.tir=1 --1
								l.tir={}
								l.tir.projscale=0.2
								l.tir.proj="01"
								l.tir.porte=40000
								l.tir.attaque=66
								l.tir.vitesse=1.5
								l.tir.cadence=1000
								l.tir.nbfleche=1
								l.tir.combat=1
								l.tir.attscale=1
								l.tir.timean=1
								l.tir.timean=1
								l.tir.impact=20

								l.tirnbfr=5
								l.atttir=graphics.newImageSheet( "AnimVF/mechant/archer/archeratg.png", { width=173, height=201, numFrames=5,sheetContentWidth=173,sheetContentHeight=1005 } )
							end
						elseif j==2 then
							if k<=4 then
								l.typedep=1
							end
							if k==0 then
							elseif k==2 then
								l.vie=171
								l.attaque=32
								l.vitesse=7--1
								l.timeatt=1200--duree de l'attaque en ms--800 par defaut-------------------------hugo si tu veux faire varier la durée d'attaque d'une unitée tu ajoute cette ligne apres "isoldat[numero].numframe=6" ou "isoldat[numero].vitesse=1" avec un espace
								l.charge=15
								l.message=texttraduction.soldat[18]..": " --"Squire: "
								l.timedep=0.9--coefficient du temps de l'animation plus le nb est grand(max20 )plus k'anim sera rapide min0.05
								l.centrex=3.5--centre du corps du personnage
								l.centrey=8-- y inversé plus le y est "fort", plus le centre est bas 
								l.tailleombre=2.3
								l.effetimpact=0.24--22--0.44--0.22--permet de faire varier la position en ordonnee du perso pendant qu'il avance pour qu'on ait pas l'impression qu'il se dep)lace lineairement
								l.attanim=0--0 ordre choisi,1 anim ordre normal, 2 ordre inverse, 3
								l.finatt=17
								l.attanimordre={1,2,2,2,3,3,3,4,4,4,5,5,5,4,3,2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1}
								l.eff3D=0.30--variation de l'impact de 3D agit en multiplication
								l.numframe=5
								l.scale=0.094
								l.typedep=2
								l.depgauche=graphics.newImageSheet( "AnimVF/gentil/Cavalerie/cavalier1/cav1mvmg.png", { width=425, height=390, numFrames=3,sheetContentWidth=425,sheetContentHeight=1170 } )
								l.attgauche=graphics.newImageSheet( "AnimVF/gentil/Cavalerie/cavalier1/cav1atg.png", { width=415, height=390, numFrames=5,sheetContentWidth=415,sheetContentHeight=1950 } )
							elseif k==3 then
								l.vie=176
								l.attaque=35
								l.vitesse=7--1
								l.timeatt=1300--duree de l'attaque en ms--800 par defaut-------------------------hugo si tu veux faire varier la durée d'attaque d'une unitée tu ajoute cette ligne apres "isoldat[numero].numframe=6" ou "isoldat[numero].vitesse=1" avec un espace
								l.charge=15
								l.message=texttraduction.soldat[19]..": " --"Knight: "
								l.timedep=0.5--coefficient du temps de l'animation plus le nb est grand(max20 )plus k'anim sera rapide min0.05
								l.centrex=3.5--centre du corps du personnage
								l.centrey=8-- y inversé plus le y est "fort", plus le centre est bas 
								l.tailleombre=2.3
								l.effetimpact=0.24--22--0.44--0.22--permet de faire varier la position en ordonnee du perso pendant qu'il avance pour qu'on ait pas l'impression qu'il se dep)lace lineairement
								l.attanim=0--0 ordre choisi,1 anim ordre normal, 2 ordre inverse, 3
								l.finatt=5
								l.attanimordre={1,2,3,4,5,5,1,1,1,1,1,1}
								l.eff3D=0.30--variation de l'impact de 3D agit en multiplication
								l.scale=0.102
								l.depgauche=graphics.newImageSheet( "AnimVF/gentil/Cavalerie/cavalier2/cav2mvmg.png", { width=486, height=376, numFrames=4,sheetContentWidth=486,sheetContentHeight=1504 } )
								l.attgauche=graphics.newImageSheet( "AnimVF/gentil/Cavalerie/cavalier2/cav2atg.png", { width=550, height=400, numFrames=5,sheetContentWidth=550,sheetContentHeight=2000 } )
							elseif k==4 then
								l.vie=270 
								l.attaque=49
								l.vitesse=7--1
								l.timeatt=1400--duree de l'attaque en ms--800 par defaut-------------------------hugo si tu veux faire varier la durée d'attaque d'une unitée tu ajoute cette ligne apres "isoldat[numero].numframe=6" ou "isoldat[numero].vitesse=1" avec un espace
								l.charge=24
								l.message=texttraduction.soldat[20]..": " --"Paladin: "
								l.timedep=0.5--coefficient du temps de l'animation plus le nb est grand(max20 )plus k'anim sera rapide min0.05
								l.centrex=14--centre du corps du personnage
								l.centrey=8-- y inversé plus le y est "fort", plus le centre est bas 
								l.tailleombre=2.3
								l.effetdure=15--14--variable non fonctionnelle permet de faire varier la dure de l'effet de variation de hauteur pendant que le personnage marche
								l.effetimpact=0.30--22--0.44--0.22--permet de faire varier la position en ordonnee du perso pendant qu'il avance pour qu'on ait pas l'impression qu'il se dep)lace lineairement
								l.attanim=0--0 ordre choisi,1 anim ordre normal, 2 ordre inverse, 3
								l.finatt=8
								l.attanimordre={1,2,2,3,3,4,4,5,5,5,1,1,1,1,1,1,1}
								l.eff3D=0.30--variation de l'impact de 3D agit en multiplication
								l.scale=0.103
								l.attx=-27--deplacement de l'anim d'attaque pour qu'elle soit superposé a celle de deplacement
								l.atty=0
								l.depgauche=graphics.newImageSheet( "AnimVF/gentil/Cavalerie/cavalier3/cav3mvmg.png", { width=698, height=421, numFrames=4,sheetContentWidth=698,sheetContentHeight=1684 } )
								l.attgauche=graphics.newImageSheet( "AnimVF/gentil/Cavalerie/cavalier3/cav3atg.png", { width=654, height=409, numFrames=5,sheetContentWidth=654,sheetContentHeight=2045} )
							elseif k==6 then
								l.message="kamikaze1"
								l.vie=50
								l.attaque=400 -- 1000 revoir leveldesign du level10 et 11
								l.blocnbennemi=40
								l.vitesse=3
								l.argent=5
								l.agressivite=10
								l.timeatt=50
								l.numframe=4
								l.scale=0.15
								l.eff3D=0.25
								l.centrey=5
								l.depgauche=graphics.newImageSheet( "AnimVF/mechant/kamikaze/kamikazemvmg.png", { width=111, height=222, numFrames=6,sheetContentWidth=111,sheetContentHeight=1332 } )
								l.attgauche=l.depgauche --graphics.newImageSheet( "AnimVF/mechant/lion/lionatg.png", { width=686, height=420, numFrames=4,sheetContentWidth=1372,sheetContentHeight=840 } )
								l.transition=graphics.newImageSheet("effets/kamikaze.png",{width=256,height=256,numFrames=6,sheetContentWidth=1536,sheetContentHeight=256})
								l.transitionseq={name="transition",frames= {1,2,3,4,5,6,6},time=1000,loopCount=1}
							elseif k==7 then
								l.message="kamikaze2"
								l.vie=70
								l.attaque=800 -- 1000 revoir leveldesign du level10 et 11
								l.blocnbennemi=40
								l.vitesse=4
								l.argent=5
								l.agressivite=10
								l.timeatt=10
								l.numframe=4
								l.scale=0.15
								l.eff3D=0.25
								l.centrey=5
								l.depgauche=graphics.newImageSheet( "AnimVF/mechant/kamikaze/kamikazemvmg.png", { width=111, height=222, numFrames=6,sheetContentWidth=111,sheetContentHeight=1332 } )
								l.attgauche=l.depgauche --graphics.newImageSheet( "AnimVF/mechant/lion/lionatg.png", { width=686, height=420, numFrames=4,sheetContentWidth=1372,sheetContentHeight=840 } )
								l.transition=graphics.newImageSheet("effets/kamikaze.png",{width=256,height=256,numFrames=6,sheetContentWidth=1536,sheetContentHeight=256})
								l.transitionseq={name="transition",frames= {1,2,3,4,5,6,6},time=1000,loopCount=1}
							elseif k==8 then
								l.message="kamikaze3"
								l.vie=100
								l.attaque=1600 -- 1000 revoir leveldesign du level10 et 11
								l.blocnbennemi=40
								l.vitesse=6
								l.argent=5
								l.agressivite=10
								l.timeatt=10
								l.numframe=4
								l.scale=0.15
								l.eff3D=0.25
								l.centrey=5
								l.depgauche=graphics.newImageSheet( "AnimVF/mechant/kamikaze/kamikazemvmg.png", { width=111, height=222, numFrames=6,sheetContentWidth=111,sheetContentHeight=1332 } )
								l.attgauche=l.depgauche --graphics.newImageSheet( "AnimVF/mechant/lion/lionatg.png", { width=686, height=420, numFrames=4,sheetContentWidth=1372,sheetContentHeight=840 } )
								l.transition=graphics.newImageSheet("effets/kamikaze.png",{width=256,height=256,numFrames=6,sheetContentWidth=1536,sheetContentHeight=256})
								l.transitionseq={name="transition",frames= {1,2,3,4,5,6,6},time=1000,loopCount=1}
							end
						elseif j==4 then
							if k==0 then
								l.message=texttraduction.soldat[21]..": " --"RenfInf 1: "
								--soldat pv1
								l.vie=33
								l.attaque=7
								l.scale=0.172
								l.timeatt=1000
								l.eff3D=0.12
								l.numframe=6
								l.timedep=0.80
								l.centrex=1--centre du corps du personnage
								l.centrey=-1-- y inversé plus le y est "fort", plus le centre est bas 
								l.tailleombre=0.8
								l.attanim=0--0 pour ordre special
								l.atty=-1.3
								l.finatt=8
								l.attanimordre={1,2,2,3,3,4,5,3,6,6,6,1,1,1,1,1,1}--ordre special
								l.depgauche=graphics.newImageSheet( "AnimVF/gentil/Renfort/Renfort_Inf/renfortmvmg.png", { width=100, height=138, numFrames=6,sheetContentWidth=100,sheetContentHeight=828 } )
								l.attgauche=graphics.newImageSheet( "AnimVF/gentil/Renfort/Renfort_Inf/renfortatg.png", { width=183, height=153, numFrames=6,sheetContentWidth=549,sheetContentHeight=306 } )
							elseif k==1 then
								l.message=texttraduction.soldat[22]..": " --"RenfInf 2: "
								l.vie=39
								l.scale=0.1715
								l.attaque=7
								l.timeatt=1100
								l.eff3D=0.12
								l.numframe=6
								l.timedep=0.80
								l.centrex=1--centre du corps du personnage
								l.centrey=1.5-- y inversé plus le y est "fort", plus le centre est bas 
								l.tailleombre=0.8
								l.attanim=0--0 pour ordre special
								l.finatt=10
								l.attanimordre={1,1,1,2,2,3,3,4,5,6,6,6,1,1,1,1,1,1}--ordre special
								l.depgauche=graphics.newImageSheet( "AnimVF/gentil/Renfort/Renfort_Inf/renfort1mvmg.png", { width=179, height=150, numFrames=6,sheetContentWidth=179,sheetContentHeight=900 } )
								l.attgauche=graphics.newImageSheet( "AnimVF/gentil/Renfort/Renfort_Inf/renfort1atg.png", { width=245, height=156, numFrames=6,sheetContentWidth=735,sheetContentHeight=312 } )
							elseif k==2 then
								l.message=texttraduction.soldat[23]..": " --"RenfInf 3: "
								l.vie=44
								l.attaque=9
								l.timeatt=700
								l.scale=0.179
								l.eff3D=0.12
								l.numframe=8
								l.timedep=0.80
								l.centrex=1--centre du corps du personnage
								l.centrey=1.5-- y inversé plus le y est "fort", plus le centre est bas 
								l.atty=-7
								l.tailleombre=0.8
								l.attanim=0--0 pour ordre special
								l.finatt=14
								l.attanimordre={1,1,2,2,3,4,5,6,7,8,8,7,7,6,6,3,3,2,2}--ordre special
								--l.timeatt=1500
								l.depgauche=graphics.newImageSheet( "AnimVF/gentil/Renfort/Renfort_Inf/renfort2mvmg.png", { width=126, height=167, numFrames=6,sheetContentWidth=126,sheetContentHeight=1002 } )
								l.attgauche=graphics.newImageSheet( "AnimVF/gentil/Renfort/Renfort_Inf/renfort2atg.png", { width=345, height=246, numFrames=8,sheetContentWidth=1035,sheetContentHeight=738 } )
							elseif k==3 then
								l.message=texttraduction.soldat[24]..": " --"RenfArc 1: "
								l.vie=22
								l.tir=1
								l.tir={}
								l.tir.projscale=0.1 --taille du projectile
								l.timedep=0.80
								l.tir.proj="12" --image du projectile
								l.tir.porte=30000
								l.tir.attaque=9
								l.tir.vitesse=1
								l.tir.cadence=2000
								l.tir.nbfleche=1
								l.tir.combat=0
								l.tir.timean=1
								l.tir.attscale=1
								l.timeatt=1500
								l.centrey=1.5-- y inversé plus le y est "fort", plus le centre est bas 
								l.tailleombre=0.8
								l.attanim=0--0 pour ordre special
								l.attanimordre={1,2,3,4,5,6,7,8,9}--ordre special
								l.scale=0.182
								l.numframe=9
								l.attscale=0.5
								l.eff3D=0.12
								l.depgauche=graphics.newImageSheet( "AnimVF/gentil/Renfort/Renfort_Tir/renfortmvmg.png", { width=126, height=167, numFrames=6,sheetContentWidth=126,sheetContentHeight=1002 } )
								l.atttir=graphics.newImageSheet( "AnimVF/gentil/Renfort/Renfort_Tir/renfortatg.png", { width=148, height=123, numFrames=3,sheetContentWidth=444,sheetContentHeight=123 } )	
								-- l.attgauche=graphics.newImageSheet( "AnimVF/gentil/General/spartiate/spartiateatg.png", { width=497, height=450, numFrames=9,sheetContentWidth=1491,sheetContentHeight=1350 } ) -- { width=497, height=450, numFrames=10 } )				
							elseif k==4 then

							elseif k==6 then
								l.message=texttraduction.soldat[25]..": " --"RenfArc 2: "
								l.tir=1
								l.vie=25
								l.tir={}
								l.tir.projscale=0.1
								l.timedep=0.80
								l.tir.proj="02"
								l.tir.porte=30000
								l.tir.attaque=15
								l.tir.vitesse=1
								l.tir.cadence=2000
								l.tir.nbfleche=1
								l.tir.combat=0
								l.tir.timean=0.5
								l.tir.attscale=1
								l.centrex=.5--centre du corps du personnage
								l.centrey=2-- y inversé plus le y est "fort", plus le centre est bas 
								l.tailleombre=0.8
								l.attanim=0--0 pour ordre special
								l.attanimordre={1}--ordre special
								l.scale=0.183
								l.numframe=3
								l.eff3D=0.12
								l.depgauche=graphics.newImageSheet( "AnimVF/gentil/Renfort/Renfort_Tir/renfort1mvmg.png", { width=126, height=167, numFrames=6,sheetContentWidth=126,sheetContentHeight=1002 } )
								l.atttir=graphics.newImageSheet( "AnimVF/gentil/Renfort/Renfort_Tir/renfort1atg.png", { width=177, height=130, numFrames=3,sheetContentWidth=531,sheetContentHeight=130 } )
							elseif k==5 then
								l.message=texttraduction.soldat[26]..": " --"RenfArc 3: "
								l.tir=1
								l.vie=34
								l.tir={}
								l.tir.projscale=0.1
								l.tir.proj="03"
								l.tir.porte=30000
								l.tir.attaque=30
								l.tir.vitesse=1
								l.tir.cadence=3000
								l.tir.nbfleche=1
								l.tir.combat=0
								l.tir.attscale=1
								l.tir.timean=1
								l.timedep=0.80
								l.centrex=0.5--centre du corps du personnage
								l.centrey=1-- y inversé plus le y est "fort", plus le centre est bas 
								l.tailleombre=0.8
								l.scale=0.168
								l.numframe=3
								l.eff3D=0.12
								l.depgauche=graphics.newImageSheet( "AnimVF/gentil/Renfort/Renfort_Tir/renfort2mvmg.png", { width=119, height=167, numFrames=6,sheetContentWidth=119,sheetContentHeight=1002 } )
								l.atttir=graphics.newImageSheet( "AnimVF/gentil/Renfort/Renfort_Tir/renfort2atg.png", { width=181, height=180, numFrames=3,sheetContentWidth=181,sheetContentHeight=540 } )
							end
						elseif j==8 then -- mine
							-- rempli dans le fichier mine
						end

						if l.depgauche==nil then
							l.numframe=6
							l.depgauche=graphics.newImageSheet( "AnimVF/mechant/assassin/assassinmvmg.png", { width=225, height=230, numFrames=6,sheetContentWidth=225,sheetContentHeight=1380 } )
							l.attgauche=graphics.newImageSheet( "AnimVF/mechant/assassin/assassinatg.png", { width=200, height=207, numFrames=6,sheetContentWidth=200,sheetContentHeight=1242 } )
						end
					end
					image[nb]=l
					--print(coroutine.running().." nb "..nb)
					-- if issimulator then
					-- 	local memUsed = (collectgarbage("count")) / 1000
					-- 	local texUsed = system.getInfo( "textureMemoryUsed" ) / 1000000
					-- 	--print("\n---------MEMORY USAGE INFORMATION chargement1 avant---------")
					-- 	--print("System Memory Used:", string.format("%.03f", memUsed), "Mb")
					-- 	print("Texture Memory Used: "..nb.." ", string.format("%.03f", texUsed), "Mb")
					-- end
					if not fullcouritine then
						coroutine.yield()
					end
				end
		 	end
		end
	end
	-- local loadsavef=require("loadsave")
	-- loadsavef.print_r (image) 

	-- local chargementaffichage = require ( "chargementaff")
	-- chargementartha()
	-- chargementevo()
	chargementdesfichier[2]=1
	-- chargementdesfichier=chargementdesfichier+1
	-- --imgchargement1=display.newImage("choniveau/chargementbis.png",actualcontentwidth/2,actualcontentheight/2,true)
	-- local function timerlancerniv2ter( event )
	-- -- 	local chargementbis1 = require ( "chargementbis")
	-- -- 	chargementbis1.chargementbis()
	-- 	print("chargementdesfichier="..chargementdesfichier.." chargementter")
	-- 	if chargementdesfichier==5 then
	-- 		-- local lancerNiveau1 = require ( "niveau1" )
	-- 		-- lancerNiveau1.niveau1(0)
	-- 	end
	-- end
	-- timerlancernivter=timer.performWithDelay( 50, timerlancerniv2ter )
	--end)
	--coroutine.resume(cochargementter)
	--tabcorourtine[#tabcorourtine+1]=cochargementter
	end
return(t)