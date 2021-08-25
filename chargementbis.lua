local t = {}--chargement des unitées mechantes(donnes+image)
t.chargementbis = function ()--chargementbis pour decomposer le premier bloc de chargement permet une plus grande fuildité de la barre de chargement

if issimulator then
	local memUsed = (collectgarbage("count")) / 1000
	local texUsed = system.getInfo( "textureMemoryUsed" ) / 1000000
	print("\n---------MEMORY USAGE INFORMATION chargementbis avant---------")
	print("System Memory Used:", string.format("%.03f", memUsed), "Mb")
	print("Texture Memory Used:", string.format("%.03f", texUsed), "Mb")
	print("------------------------------------------\n")
end
--print(coroutine.running())
local nb=0
	local i=2
	for j=0,9,1 do
		for k=0,9,1 do
			nb=k+j*10+i*100
			if tabsoldexist[nb] then
			local l=image[nb]
			if j==0 then
				if k==0 then
					l.vie=40
					l.attaque=2
					l.vitesse=3--1
					l.agressivite=3
					l.message="Assassin: "
					l.centrex=1--centre du corps du personnage
					l.centrey=1.2--y inversé plus le y est "fort", plus le centre est bas 
					l.tailleombre=0.7
					l.timeatt=1200
					l.attanim=0--0 pour ordre special
					l.finatt=31
					l.attanimordre={1,3,3,4,4,5,6,6,6,6,4,3,3,1,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,1,1,1,1,1,1,1,1,1}
					l.effetdure=2--14--variable non fonctionnelle permet de faire varier la dure de l'effet de variation de hauteur pendant que le personnage marche
					l.argent=5
					l.scale=0.109
					l.eff3D=0.12--variation de l'impact de 3D agit en multiplication
					l.numframe=6
					l.depgauche=graphics.newImageSheet( "AnimVF/mechant/assassin/assassinmvmg.png", { width=225, height=230, numFrames=6,sheetContentWidth=225,sheetContentHeight=1380 } )
					l.attgauche=graphics.newImageSheet( "AnimVF/mechant/assassin/assassinatg.png", { width=200, height=207, numFrames=6,sheetContentWidth=200,sheetContentHeight=1242 } )
					-- if issimulator then
					-- 	l.tir=1 --1
					-- 	l.tir={}
					-- 	l.tir.projscale=0.2
					-- 	l.tir.proj="12"
					-- 	l.tir.porte=60000
					-- 	l.tir.attaque=1
					-- 	l.tir.vitesse=1.5
					-- 	l.tir.cadence=10
					-- 	l.tir.nbfleche=1
					-- 	l.tir.combat=1
					-- 	l.tir.attscale=1
					-- 	l.tir.timean=1
					-- 	l.tir.y=5
					-- 	l.tirnbfr=6
					-- 	l.atttir=graphics.newImageSheet( "AnimVF/gentil/General/humain3/humantir.png", { width=280, height=403, numFrames=6,sheetContentWidth=560,sheetContentHeight=1209 } )
					-- end
				elseif k==1 then
					l.vie=150
					l.attaque=8
					l.vitesse=1--1
					l.timeatt=1100--duree de l'attaque en ms--800 par defaut-------------------------hugo si tu veux faire varier la durée d'attaque d'une unitée tu ajoute cette ligne apres "isoldat[numero].numframe=6" ou "isoldat[numero].vitesse=1" avec un espace
					l.attanim=0--0 pour ordre special
					l.finatt=17
					l.attanimordre={1,2,2,3,3,4,4,5,5,5,5,5,5,4,3,2,1,1,1,1,1,1,1,1,1}
					l.argent=10--argent gagner lors de la mort de l'unité--pour gain specifique au soldat faire pareil qu'au dessus
					l.agressivite=2
					l.message="Barbare: "
					l.timedep=0.9--coefficient du temps de l'animation plus le nb est grand(max20 )plus k'anim sera rapide min0.05
					l.centrex=.2--centre du corps du personnage
					l.centrey=5--y inversé plus le y est "fort", plus le centre est bas 
					l.tailleombre=1.0
					l.effetdure=10--14--variable non fonctionnelle permet de faire varier la dure de l'effet de variation de hauteur pendant que le personnage marche
					l.effetimpact=0.25--22--0.44--0.22--permet de faire varier la position en ordonnee du perso pendant qu'il avance pour qu'on ait pas l'impression qu'il se dep)lace lineairement
					l.eff3D=0.12--variation de l'impact de 3D agit en multiplication
					l.scale=0.14
					l.depgauche=graphics.newImageSheet( "AnimVF/mechant/barbare/barbaremvmg.png", { width=154, height=240, numFrames=6,sheetContentWidth=154,sheetContentHeight=1440 } )
					l.attgauche=graphics.newImageSheet( "AnimVF/mechant/barbare/barbareatg.png", { width=161, height=231, numFrames=5,sheetContentWidth=161,sheetContentHeight=1155 } )
				elseif k==2 then
					l.vie=40
					l.attaque=7
					l.vitesse=1.75--1
					l.timeatt=1000--duree de l'attaque en ms--800 par defaut-------------------------hugo si tu veux faire varier la durée d'attaque d'une unitée tu ajoute cette ligne apres "isoldat[numero].numframe=6" ou "isoldat[numero].vitesse=1" avec un espace
					l.attanim=0--0 pour ordre special
					l.finatt=31
					l.attanimordre={1,3,3,4,4,5,6,6,6,6,4,3,3,1,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,1,1,1,1,1,1,1,1,1}
					l.agressivite=1
					l.message="Druide: "
					l.timedep=1.3--coefficient du temps de l'animation plus le nb est grand(max20 )plus k'anim sera rapide min0.05
					l.centrex=0.5--centre du corps du personnage
					l.centrey=4--y inversé plus le y est "fort", plus le centre est bas 
					l.tailleombre=1.1
					l.effetdure=2--14--variable non fonctionnelle permet de faire varier la dure de l'effet de variation de hauteur pendant que le personnage marche
					l.eff3D=0.12--variation de l'impact de 3D agit en multiplication
					l.numframe=6
					l.scale=0.14
					l.argent=5
					l.depgauche=graphics.newImageSheet( "AnimVF/mechant/druide/druidemvmg.png", { width=192, height=225, numFrames=6,sheetContentWidth=192,sheetContentHeight=1350 } )
					l.attgauche=graphics.newImageSheet( "AnimVF/mechant/druide/druideatg.png", { width=201, height=212, numFrames=6,sheetContentWidth=201,sheetContentHeight=1272 } )
				elseif k==3 then
					l.vie=20--120
					l.attaque=3
					l.vitesse=3--1
					l.agressivite=1
					l.message="Gobelin: "
					l.centrex=-1--centre du corps du personnage
					l.centrey=-2--y inversé plus le y est "fort", plus le centre est bas 
					l.tailleombre=0.7
					l.attanim=0--0 pour ordre special
					l.finatt=17
					l.attanimordre={1,2,2,3,3,4,4,5,5,5,5,5,5,4,3,2,1,1,1,1,1,1,1,1,1}
					l.argent=3
					l.scale=0.07
					l.eff3D=0.12--variation de--variation de l'impact de 3D agit en multiplication
					l.depgauche=graphics.newImageSheet( "AnimVF/mechant/gobelin/gobelinmvmg.png", { width=129, height=230, numFrames=6,sheetContentWidth=129,sheetContentHeight=1380 } )
					l.attgauche=graphics.newImageSheet( "AnimVF/mechant/gobelin/gobelinatg.png", { width=174, height=211, numFrames=5,sheetContentWidth=174,sheetContentHeight=1055 } )
				elseif k==4 then
					l.scale=0.17
					l.vie=5000
					l.attaque=33
					l.vitesse=0.7--1
					l.timeatt=1600--duree de l'attaque en ms--800 par defaut-------------------------hugo si tu veux faire varier la durée d'attaque d'une unitée tu ajoute cette ligne apres "isoldat[numero].numframe=6" ou "isoldat[numero].vitesse=1" avec un espace
					l.agressivite=5
					l.porte=4
					l.timedep=0.5
					l.message="Golem: "
					l.centrex=-5--centre du corps du personnage
					l.centrey=17--y inversé plus le y est "fort", plus le centre est bas 
					l.atty=-15
					l.tailleombre=2
					l.eff3D=0.12--variation de l'impact de 3D agit en multiplication
					l.numframe=9
					l.attanim=0--0 pour ordre special
					l.finatt=14
					l.attanimordre={1,2,3,4,5,6,6,6,6,6,5,4,7,8,9,9,9,9,9,9,9,1,1,1,1,1}
					l.scale=0.15
					l.argent=25
					l.depgauche1=graphics.newImageSheet( "AnimVF/mechant/golem/golemm1mvmg.png", { width=354, height=417, numFrames=6,sheetContentWidth=1062,sheetContentHeight=834 } )
					l.attgauche1=graphics.newImageSheet( "AnimVF/mechant/golem/golemm1atg.png", { width=500, height=500, numFrames=9,sheetContentWidth=1500,sheetContentHeight=1500 } )
					l.depgauche=graphics.newImageSheet( "AnimVF/mechant/golem/golemmmvmg.png", { width=354, height=417, numFrames=6,sheetContentWidth=1062,sheetContentHeight=834 } )
					l.attgauche=graphics.newImageSheet( "AnimVF/mechant/golem/golemmatg.png", { width=500, height=500, numFrames=9,sheetContentWidth=1500,sheetContentHeight=1500 } )
				elseif k==5 then
					l.vie=160
					l.attaque=10
					l.vitesse=1.3--1
					l.timeatt=1000--duree de l'attaque en ms--800 par defaut-------------------------hugo si tu veux faire varier la durée d'attaque d'une unitée tu ajoute cette ligne apres "isoldat[numero].numframe=6" ou "isoldat[numero].vitesse=1" avec un espace
					l.agressivite=2
					l.message="Guerrier: "
					l.timedep=1--coefficient du temps de l'animation plus le nb est grand(max20 )plus k'anim sera rapide min0.05
					l.centrex=0--centre du corps du personnage
					l.centrey=3.5--y inversé plus le y est "fort", plus le centre est bas 
					l.tailleombre=1
					l.effetimpact=0.10--22--0.44--0.22--permet de faire varier la position en ordonnee du perso pendant qu'il avance pour qu'on ait pas l'impression qu'il se dep)lace lineairement
					l.attanim=0--0 pour ordre special
					l.finatt=17
					l.attanimordre={1,2,2,3,3,4,4,5,5,5,5,5,5,4,3,2,1,1,1,1,1,1,1,1,1}
					l.scale=0.141
					l.eff3D=0.12--variation de l'impact de 3D agit en multiplication
					l.argent=7
					l.depgauche=graphics.newImageSheet( "AnimVF/mechant/guerrier/guerriermvmg.png", { width=157, height=236, numFrames=6,sheetContentWidth=157,sheetContentHeight=1416 } )
					l.attgauche=graphics.newImageSheet("AnimVF/mechant/guerrier/guerrieratg.png", { width=176, height=222, numFrames=5,sheetContentWidth=176,sheetContentHeight=1110 } )
				elseif k==6 then
					l.vie=45
					l.attaque=7
					l.vitesse=1.85--1
					l.timeatt=1000--duree de l'attaque en ms--800 par defaut-------------------------hugo si tu veux faire varier la durée d'attaque d'une unitée tu ajoute cette ligne apres "isoldat[numero].numframe=6" ou "isoldat[numero].vitesse=1" avec un espace
					l.agressivite=1
					l.message="Mercenaire:"
					l.timedep=1.1--coefficient du temps de l'animation plus le nb est grand(max20 )plus k'anim sera rapide min0.05
					l.centrex=-0.5--centre du corps du personnage
					l.centrey=5--y inversé plus le y est "fort", plus le centre est bas 
					l.tailleombre=1.2
					l.attanim=0--0 pour ordre special
					l.finatt=17
					l.attanimordre={1,2,2,3,3,4,4,5,5,5,5,5,5,4,3,2,1,1,1,1,1,1,1,1,1}
					l.argent=5
					l.scale=0.141
					l.eff3D=0.12--variation de l'impact de 3D agit en multiplication
					l.depgauche=graphics.newImageSheet( "AnimVF/mechant/mercenaire/mercenairemvmg.png", { width=156, height=235, numFrames=6,sheetContentWidth=156,sheetContentHeight=1410 } )
					l.attgauche=graphics.newImageSheet( "AnimVF/mechant/mercenaire/mercenaireatg.png", { width=156, height=207, numFrames=5,sheetContentWidth=156,sheetContentHeight=1035 } )
				elseif k==7 then
					l.vie=120
					l.attaque=8
					l.vitesse=1--1
					l.timeatt=1100--duree de l'attaque en ms--800 par defaut-------------------------hugo si tu veux faire varier la durée d'attaque d'une unitée tu ajoute cette ligne apres "isoldat[numero].numframe=6" ou "isoldat[numero].vitesse=1" avec un espace
					l.agressivite=3
					l.message="Orc: "
					l.timedep=1.0--coefficient du temps de l'animation plus le nb est grand(max20 )plus k'anim sera rapide min0.05
					l.centrex=0--centre du corps du personnage
					l.centrey=7--y inversé plus le y est "fort", plus le centre est bas 
					l.tailleombre=1.2
					l.attanim=0--0 pour ordre special
					l.finatt=17
					l.attanimordre={1,2,2,3,3,4,4,5,5,5,5,5,5,4,3,2,1,1,1,1,1,1,1,1,1}
					l.argent=4
					l.atty=-2.7
					l.scale=0.1659
					l.eff3D=0.125--variation de l'impact de 3D agit en multiplication  
					l.depgauche=graphics.newImageSheet( "AnimVF/mechant/orc/orcmvmg.png", { width=159, height=230, numFrames=6,sheetContentWidth=159,sheetContentHeight=1380 } )
					l.attgauche=graphics.newImageSheet( "AnimVF/mechant/orc/orcatg.png", { width=176, height=262, numFrames=5,sheetContentWidth=176,sheetContentHeight=1310 } )
				elseif k==8 then
					l.vie=130
					l.attaque=12
					l.vitesse=1--1
					l.timeatt=1200--duree de l'attaque en ms--800 par defaut-------------------------hugo si tu veux faire varier la durée d'attaque d'une unitée tu ajoute cette ligne apres "isoldat[numero].numframe=6" ou "isoldat[numero].vitesse=1" avec un espace
					l.agressivite=3
					l.message="Orc2: "
					l.timedep=1.25--coefficient du temps de l'animation plus le nb est grand(max20 )plus k'anim sera rapide min0.05
					l.centrex=0--centre du corps du personnage
					l.centrey=7--y inversé plus le y est "fort", plus le centre est bas 
					l.tailleombre=1.2
					l.attanim=0--0 pour ordre special
					l.finatt=17
					l.attanimordre={1,2,2,3,3,4,4,5,5,5,5,5,5,4,3,2,1,1,1,1,1,1,1,1,1}
					l.argent=4
					l.scale=0.17
					l.eff3D=0.13--variation de l'impact de 3D agit en multiplication
					l.depgauche=graphics.newImageSheet( "AnimVF/mechant/orc2/orcmvmg.png", { width=159, height=220, numFrames=6,sheetContentWidth=159,sheetContentHeight=1320 } )
					l.attgauche=graphics.newImageSheet( "AnimVF/mechant/orc2/orcatg.png", { width=156, height=225, numFrames=5,sheetContentWidth=156,sheetContentHeight=1125 } )
				elseif k==9 then
					l.vie=48
					l.attaque=7
					l.vitesse=1.8--1
					l.timeatt=1100--duree de l'attaque en ms--800 par defaut-------------------------hugo si tu veux faire varier la durée d'attaque d'une unitée tu ajoute cette ligne apres "isoldat[numero].numframe=6" ou "isoldat[numero].vitesse=1" avec un espace
					l.agressivite=3
					l.message="Paladin: "
					l.timedep=1.25--coefficient du temps de l'animation plus le nb est grand(max20 )plus k'anim sera rapide min0.05
					l.centrex=0--centre du corps du personnage
					l.centrey=5--y inversé plus le y est "fort", plus le centre est bas 
					l.tailleombre=1.2
					l.attanim=0--0 pour ordre special
					l.finatt=17
					l.attanimordre={1,2,2,3,3,4,4,5,5,5,5,5,5,4,3,2,1,1,1,1,1,1,1,1,1}
					l.argent=5
					l.scale=0.14
					l.eff3D=0.12--variation de l'impact de 3D agit en multiplication
					l.depgauche=graphics.newImageSheet( "AnimVF/mechant/paladin/paladinmvmg.png", { width=158, height=230, numFrames=6,sheetContentWidth=158,sheetContentHeight=1380 } )
					l.attgauche=graphics.newImageSheet( "AnimVF/mechant/paladin/paladinatg.png", { width=158, height=228, numFrames=5,sheetContentWidth=158,sheetContentHeight=1140 } )
				end
			elseif j==1 then
				if k==0 then
					l.vie=15
					l.attaque=3
					l.vitesse=1.5--1
					l.timeatt=1200--duree de l'attaque en ms--800 par defaut-------------------------hugo si tu veux faire varier la durée d'attaque d'une unitée tu ajoute cette ligne apres "isoldat[numero].numframe=6" ou "isoldat[numero].vitesse=1" avec un espace
					l.argent=2--argent gagner lors de la mort de l'unité--pour gain specifique au soldat faire pareil qu'au dessus
					l.agressivite=1
					l.message="Paysan: "
					l.timedep=0.9--coefficient du temps de l'animation plus le nb est grand(max20 )plus k'anim sera rapide min0.05
					l.centrex=1--centre du corps du personnage
					l.centrey=3--y inversé plus le y est "fort", plus le centre est bas 
					l.tailleombre=0.9
					l.attanim=0--0 pour ordre special
					l.finatt=14
					l.attanimordre={1,1,2,2,3,3,3,4,4,4,4,3,2,1,1,1,1,1,1,1,1,1,1}
					l.scale=0.128
					l.eff3D=0.13--variation de l'impact de 3D agit en multiplication
					l.numframe=4
					l.depgauche=graphics.newImageSheet( "AnimVF/mechant/paysan/paysanmvmg.png", { width=231, height=230, numFrames=6,sheetContentWidth=231,sheetContentHeight=1380 } )
					l.attgauche=graphics.newImageSheet( "AnimVF/mechant/paysan/paysanatg.png", { width=233, height=223, numFrames=4,sheetContentWidth=233,sheetContentHeight=892 } )
				elseif k==1 then
					l.vie=15
					l.attaque=3
					l.vitesse=1.6--1
					l.timeatt=1200--duree de l'attaque en ms--800 par defaut-------------------------hugo si tu veux faire varier la durée d'attaque d'une unitée tu ajoute cette ligne apres "isoldat[numero].numframe=6" ou "isoldat[numero].vitesse=1" avec un espace
					l.argent=2--argent gagner lors de la mort de l'unité--pour gain specifique au soldat faire pareil qu'au dessus
					l.agressivite=1
					l.message="Paysan: "
					l.timedep=0.9--coefficient du temps de l'animation plus le nb est grand(max20 )plus k'anim sera rapide min0.05
					l.centrex=1--centre du corps du personnage
					l.centrey=3--y inversé plus le y est "fort", plus le centre est bas 
					l.tailleombre=0.9
					l.attanim=0--0 pour ordre special
					l.finatt=14
					l.attanimordre={1,1,2,2,3,3,3,4,4,4,4,3,2,1,1,1,1,1,1,1,1,1,1}
					l.scale=0.128
					l.eff3D=0.13--variation de l'impact de 3D agit en multiplication
					l.numframe=4
					l.depgauche=graphics.newImageSheet( "AnimVF/mechant/paysan2/paysanmvmg.png", { width=231, height=230, numFrames=6,sheetContentWidth=231,sheetContentHeight=1380 } )
					l.attgauche=graphics.newImageSheet( "AnimVF/mechant/paysan2/paysanatg.png", { width=233, height=223, numFrames=4,sheetContentWidth=233,sheetContentHeight=892 } )
				elseif k==2 then
					l.vie=45
					l.attaque=3
					l.vitesse=1.3--1
					l.timeatt=1100--duree de l'attaque en ms--800 par defaut-------------------------hugo si tu veux faire varier la durée d'attaque d'une unitée tu ajoute cette ligne apres "isoldat[numero].numframe=6" ou "isoldat[numero].vitesse=1" avec un espace
					l.agressivite=1
					l.charge=25
					l.message="Piquier: "
					l.centrex=5--centre du corps du personnage
					l.centrey=5.5--y inversé plus le y est "fort", plus le centre est bas 
					l.tailleombre=1.2
					l.tailleombre=0.85
					l.timedep=0.6
					l.attanim=0--0 pour ordre special
					l.finatt=14
					l.attanimordre={1,1,2,2,3,3,3,4,4,4,4,3,2,1,1,1,1,1,1,1,1,1}
					l.scale=0.14
					l.eff3D=0.13--variation de l'impact de 3D agit en multiplication
					l.numframe=4
					l.argent=7
					l.depgauche=graphics.newImageSheet( "AnimVF/mechant/piquier/piquiermvmg.png", { width=269, height=230, numFrames=6,sheetContentWidth=269,sheetContentHeight=1380 } )
					l.attgauche=graphics.newImageSheet( "AnimVF/mechant/piquier/piquieratg.png", { width=301, height=228, numFrames=4,sheetContentWidth=301,sheetContentHeight=912 } )
				elseif k==3 then
					l.vie=50
					l.attaque=7
					l.vitesse=1.8--1
					l.timeatt=1100--duree de l'attaque en ms--800 par defaut-------------------------hugo si tu veux faire varier la durée d'attaque d'une unitée tu ajoute cette ligne apres "isoldat[numero].numframe=6" ou "isoldat[numero].vitesse=1" avec un espace
					l.agressivite=2
					l.message="Soudard: "
					l.timedep=1--coefficient du temps de l'animation plus le nb est grand(max20 )plus k'anim sera rapide min0.05
					l.centrex=-1--centre du corps du personnage
					l.centrey=5.5--y inversé plus le y est "fort", plus le centre est bas 
					l.tailleombre=1.2
					l.attanim=0--0 pour ordre special
					l.finatt=17
					l.attanimordre={1,2,2,3,3,4,4,5,5,5,5,5,5,4,3,2,1,1,1,1,1,1,1,1,1}
					l.argent=5
					l.scale=0.14
					l.eff3D=0.13--variation de l'impact de 3D agit en multiplication
					l.depgauche=graphics.newImageSheet( "AnimVF/mechant/soudard/soudardmvmg.png", { width=171, height=230, numFrames=6,sheetContentWidth=171,sheetContentHeight=1380 } )
					l.attgauche=graphics.newImageSheet( "AnimVF/mechant/soudard/soudardatg.png", { width=157, height=212, numFrames=5,sheetContentWidth=157,sheetContentHeight=1060 } )
				elseif k==4 then
					l.vie=45
					l.attaque=3
					l.vitesse=1.2--1
					l.timeatt=1200--duree de l'attaque en ms--800 par defaut-------------------------hugo si tu veux faire varier la durée d'attaque d'une unitée tu ajoute cette ligne apres "isoldat[numero].numframe=6" ou "isoldat[numero].vitesse=1" avec un espace
					l.agressivite=1
					l.charge=25
					l.message="Ulhan: "
					l.timedep=1.1--coefficient du temps de l'animation plus le nb est grand(max20 )plus k'anim sera rapide min0.05
					l.centrex=10--centre du corps du personnage
					l.centrey=6--y inversé plus le y est "fort", plus le centre est bas 
					l.tailleombre=1.2
					l.attanim=0--0 pour ordre special
					l.finatt=14
					l.attanimordre={1,1,2,2,3,3,3,4,4,4,4,3,2,1,1,1,1,1,1,1,1,1,1}
					l.scale=0.14
					l.eff3D=0.13--variation de l'impact de 3D agit en multiplication
					l.attx=-23--deplacement de l'anim d'attaque pour qu'elle soit superposé a celle de deplacement
					l.atty=0
					l.numframe=4
					l.argent=7
					l.depgauche=graphics.newImageSheet( "AnimVF/mechant/uhlan/uhlanmvmg.png", { width=364, height=230, numFrames=6,sheetContentWidth=364,sheetContentHeight=1380 } )
					l.attgauche=graphics.newImageSheet( "AnimVF/mechant/uhlan/uhlanatg.png", { width=385, height=244, numFrames=4,sheetContentWidth=385,sheetContentHeight=976 } )
				elseif k==5 then
					l.vie=1000
					l.attaque=20
					l.vitesse=1.2--1
					l.timeatt=1400--duree de l'attaque en ms--800 par defaut-------------------------hugo si tu veux faire varier la durée d'attaque d'une unitée tu ajoute cette ligne apres "isoldat[numero].numframe=6" ou "isoldat[numero].vitesse=1" avec un espace
					l.agressivite=6
					l.message="Uruk: "
					l.timedep=1--coefficient du temps de l'animation plus le nb est grand(max20 )plus k'anim sera rapide min0.05
					l.centrex=0--centre du corps du personnage
					l.centrey=9--y inversé plus le y est "fort", plus le centre est bas 
					l.tailleombre=1.3
					l.scale=0.168
					l.eff3D=0.12--variation de l'impact de 3D agit en multiplication
					l.numframe=6
					l.argent=8
					l.attgauche=graphics.newImageSheet( "AnimVF/mechant/uruk/urukatg.png", { width=165, height=250, numFrames=6,sheetContentWidth=165,sheetContentHeight=1500 } )
					l.depgauche=graphics.newImageSheet( "AnimVF/mechant/uruk/urukmvmg.png", { width=153, height=250, numFrames=6,sheetContentWidth=153,sheetContentHeight=1500 } )
				elseif k==6 then
					l.vie=700
					l.attaque=6
					l.vitesse=2.5--1
					l.agressivite=6
					l.message="Balrog: "
					l.timedep=1--coefficient du temps de l'animation plus le nb est grand(max20 )plus k'anim sera rapide min0.05
					l.centrex=1--centre du corps du personnage
					l.centrey=9.86--y inversé plus le y est "fort", plus le centre est bas 
					l.atty=-9.86
					l.tailleombre=0.7
					l.scale=0.14
					l.eff3D=0.12--variation de l'impact de 3D agit en multiplication
					l.numframe=6
					l.argent=12
					l.attgauche=graphics.newImageSheet( "AnimVF/mechant/balrog/balrogatg.png", { width=169, height=300, numFrames=6,sheetContentWidth=169,sheetContentHeight=1800 } )
					l.depgauche=graphics.newImageSheet( "AnimVF/mechant/balrog/balrogmvmg.png", { width=146, height=300, numFrames=6,sheetContentWidth=146,sheetContentHeight=1800 } )
				elseif k==7 then
					l.vie=1300
					l.attaque=11
					l.vitesse=2.15--1
					l.timeatt=900--duree de l'attaque en ms--800 par defaut-------------------------hugo si tu veux faire varier la durée d'attaque d'une unitée tu ajoute cette ligne apres "isoldat[numero].numframe=6" ou "isoldat[numero].vitesse=1" avec un espace
					l.agressivite=6
					l.message="Balrog 2: "
					l.timedep=0.9--coefficient du temps de l'animation plus le nb est grand(max20 )plus k'anim sera rapide min0.05
					l.centrex=-1--centre du corps du personnage
					--l.centrey=8--y inversé plus le y est "fort", plus le centre est bas 
					l.centrey=10.61 
					l.atty=-10.61 
					l.tailleombre=0.7
					l.scale=0.145
					l.eff3D=0.12--variation de l'impact de 3D agit en multiplication
					l.numframe=6
					l.argent=8
					l.attgauche=graphics.newImageSheet( "AnimVF/mechant/balrog2/balrogatg.png", { width=179, height=300, numFrames=6,sheetContentWidth=179,sheetContentHeight=1800 } )
					l.depgauche=graphics.newImageSheet( "AnimVF/mechant/balrog2/balrogmvmg.png", { width=161, height=300, numFrames=6 ,sheetContentWidth=161,sheetContentHeight=1800} )
				elseif k==8 then
					l.vie=600
					l.attaque=40
					l.vitesse=0.9--1
					l.timeatt=1200--duree de l'attaque en ms--800 par defaut-------------------------hugo si tu veux faire varier la durée d'attaque d'une unitée tu ajoute cette ligne apres "isoldat[numero].numframe=6" ou "isoldat[numero].vitesse=1" avec un espace
					l.agressivite=5
					l.message="Boucher: "
					l.timedep=1--coefficient du temps de l'animation plus le nb est grand(max20 )plus k'anim sera rapide min0.05
				 	l.centrex=-1--centre du corps du personnage
					l.centrey=9--y inversé plus le y est "fort", plus le centre est bas 
					l.atty=-8
					l.tailleombre=1.5
					l.attanim=0--0 pour ordre special
					l.finatt=11
					l.attanimordre={1,2,2,3,3,4,4,4,3,2,1,1,1,1,1,1,1,1,1}
					l.scale=0.157
					l.eff3D=0.12--variation de l'impact de 3D agit en multiplication
					l.numframe=4
					l.argent=15
					l.attgauche=graphics.newImageSheet( "AnimVF/mechant/boucher/boucheratg.png", { width=186, height=220, numFrames=4,sheetContentWidth=186,sheetContentHeight=880 } )
					l.depgauche=graphics.newImageSheet( "AnimVF/mechant/boucher/bouchermvmg.png", { width=187, height=253, numFrames=6,sheetContentWidth=187,sheetContentHeight=1518 } )
				elseif k==9 then
					l.message="Piquier2: "
					l.vie=600
					l.attaque=8
					l.vitesse=1.3--1
					l.timeatt=1100--duree de l'attaque en ms--800 par defaut-------------------------hugo si tu veux faire varier la durée d'attaque d'une unitée tu ajoute cette ligne apres "isoldat[numero].numframe=6" ou "isoldat[numero].vitesse=1" avec un espace
					l.agressivite=5
					l.charge=30
					l.centrex=5--centre du corps du personnage
					l.centrey=5.5--y inversé plus le y est "fort", plus le centre est bas 
					l.tailleombre=1.2
					l.tailleombre=0.85
					l.timedep=0.6
					l.attanim=0--0 pour ordre special
					l.finatt=14
					l.attanimordre={1,1,2,2,3,3,3,4,4,4,4,3,2,1,1,1,1,1,1,1,1,1}
					l.scale=0.14
					l.eff3D=0.13--variation de l'impact de 3D agit en multiplication
					l.numframe=4
					l.argent=15
					l.attgauche=graphics.newImageSheet( "AnimVF/mechant/piquier2/uhlanatg.png", { width=385, height=244, numFrames=4,sheetContentWidth=385,sheetContentHeight=976 } )
					l.depgauche=graphics.newImageSheet( "AnimVF/mechant/piquier2/uhlanmvmg.png", { width=364, height=230, numFrames=6,sheetContentWidth=364,sheetContentHeight=1380 } )
				end	
			elseif j==2 then
				if k==0 then
					l.vie=100
					l.scale=0.07
					l.vitesse=3
					l.message="Spider: "
					l.numframe=6
					l.typedep=1
					l.timedep=0.5
					l.attaque=3 
					l.agressivite=8
					l.argent=2
					l.tailleombre=0.3
					l.centrey=-5
					l.depgauche=graphics.newImageSheet( "AnimVF/mechant/araignee/araigneemvmg.png", { width=276, height=193, numFrames=6,sheetContentWidth=828,sheetContentHeight=396 } )
					l.attgauche=graphics.newImageSheet( "AnimVF/mechant/araignee/araigneeattg.png", { width=305, height=231, numFrames=6,sheetContentWidth=915,sheetContentHeight=462 } )
				elseif k==1 then
					l.vie=1000
					l.scale=0.18
					l.vitesse=3
					l.message="Spider1: "
					l.numframe=6
					l.typedep=3
					l.timedep=0.5
					l.attaque=6
					l.agressivite=10
					l.argent=5
					l.tailleombre=1.2
					l.centrey=-2
					l.centrex=4
					l.depgauche=image[nb-1].depgauche
					l.attgauche=image[nb-1].attgauche
				elseif k==2 then
					l.vie=500
					l.attaque=18
					l.vitesse=1.5--1
					l.timeatt=1500--duree de l'attaque en ms--800 par defaut-------------------------hugo si tu veux faire varier la durée d'attaque d'une unitée tu ajoute cette ligne apres "isoldat[numero].numframe=6" ou "isoldat[numero].vitesse=1" avec un espace
					l.agressivite=5
					l.message="Skeleton2: "--66284635
					l.porte=2
					l.timedep=1--coefficient du temps de l'animation plus le nb est grand(max20 )plus k'anim sera rapide min0.05
					l.centrex=-12--centre du corps du personnage
					l.centrey=8--y inversé plus le y est "fort", plus le centre est bas 
					l.atty=-20
					l.tailleombre=1.8
					l.attanim=0 --0 pour ordre special
					l.attanimordre={1,1,1,1,1,1,1,2,2,3,3,4,5,6,6,6,6,6,6,6,6,6}
					l.finatt=13
					l.scale=0.16
					l.eff3D=0.13--variation de l'impact de 3D agit en multiplication
					l.numframe=6
					l.argent=3
					l.depgauche=graphics.newImageSheet( "AnimVF/mechant/squelette2/squelette2mvmg.png", { width=275, height=237, numFrames=6,sheetContentWidth=275,sheetContentHeight=1422 } )
					l.attgauche=graphics.newImageSheet( "AnimVF/mechant/squelette2/squelette2atg.png", { width=435, height=350, numFrames=6,sheetContentWidth=1305,sheetContentHeight=700 } )
				elseif k==3 then
					l.vie=650
					l.attaque=24
					l.vitesse=4--1
					l.timeatt=1500--duree de l'attaque en ms--800 par defaut-------------------------hugo si tu veux faire varier la durée d'attaque d'une unitée tu ajoute cette ligne apres "isoldat[numero].numframe=6" ou "isoldat[numero].vitesse=1" avec un espace
					l.agressivite=5
					l.porte=2
					l.message="SkeletonHorse: "
					l.timedep=0.5--coefficient du temps de l'animation plus le nb est grand(max20 )plus k'anim sera rapide min0.05
					l.centrex=1--centre du corps du personnage
					l.centrey=17--y inversé plus le y est "fort", plus le centre est bas 
					l.atty=-15
					l.attx=-8
					l.tailleombre=2.8
					l.attanim=0 --0 pour ordre special
					l.attanimordre={1,1,2,3,4,4,4,4,4,4,4,3,5,5,5,5,5,5,5,2,2,2}
					l.finatt=11
					l.scale=0.16
					l.eff3D=0.13--variation de l'impact de 3D agit en multiplication
					l.numframe=4
					l.argent=4
					l.typedep=1
					l.depgauche=graphics.newImageSheet( "AnimVF/mechant/squelette_monte/squelette_montemvmg.png", { width=500, height=371, numFrames=4,sheetContentWidth=500,sheetContentHeight=1484 } )
					l.attgauche=graphics.newImageSheet( "AnimVF/mechant/squelette_monte/squelette_monteatg.png", { width=450, height=371, numFrames=5,sheetContentWidth=1350,sheetContentHeight=742 } )
				elseif k==4 then
					l.typedep=1
					l.vie=300
					l.charge=70
					l.attaque=70
					l.porte=4
					l.vitesse=6--1
					l.timeatt=1500--duree de l'attaque en ms--800 par defaut-------------------------hugo si tu veux faire varier la durée d'attaque d'une unitée tu ajoute cette ligne apres "isoldat[numero].numframe=6" ou "isoldat[numero].vitesse=1" avec un espace
					l.agressivite=40
					l.message="SkeletonTraine: "
					l.timedep=1.5--coefficient du temps de l'animation plus le nb est grand(max20 )plus k'anim sera rapide min0.05
					l.centrex=-18--centre du corps du personnage
					l.centrey=8--y inversé plus le y est "fort", plus le centre est bas 
					l.tailleombre=2.5
					l.attanim=0 --0 pour ordre special
					l.attanimordre={1,2,2,2,2,3,3,3,3,3}
					l.scale=0.14
					l.eff3D=0.13--variation de l'impact de 3D agit en multiplication
					l.numframe=3
					l.argent=2
					l.depgauche=graphics.newImageSheet( "AnimVF/mechant/squelette_traine/squelette_trainemvmg.png", { width=606, height=267, numFrames=4,sheetContentWidth=1212,sheetContentHeight=534 } )
					l.attgauche=graphics.newImageSheet( "AnimVF/mechant/squelette_traine/squelette_traineattg.png", { width=636, height=371, numFrames=3,sheetContentWidth=636,sheetContentHeight=1113 } )
					l.transition=l.attgauche
					l.transitionseq={name="transition",frames={1,2,2,2,2,3,3,3,3,3},time=500,loopCount=1}
				elseif k==5 then
					l.typedep=4
					l.vie=40000
					l.attaque=300
					l.porte=30
					l.vitesse=1.3
					l.timeatt=1500--duree de l'attaque en ms--800 par defaut-------------------------hugo si tu veux faire varier la durée d'attaque d'une unitée tu ajoute cette ligne apres "isoldat[numero].numframe=6" ou "isoldat[numero].vitesse=1" avec un espace
					l.agressivite=40
					l.message="Dragon: "
					l.timedep=0.2--coefficient du temps de l'animation plus le nb est grand(max20 )plus k'anim sera rapide min0.05
					l.centrex=-13--centre du corps du personnage
					l.centrey=35--y inversé plus le y est "fort", plus le centre est bas 
					l.tailleombre=5
					l.attanim=0 --0 pour ordre special
					l.attanimordre={1,2,3,4,5,6}
					l.scale=0.28
					l.eff3D=0.13--variation de l'impact de 3D agit en multiplication
					l.numframe=6
					l.argent=2
					l.attscale=0.8
					l.atty=-30
					l.attx=20
					l.depgauche=graphics.newImageSheet( "AnimVF/mechant/dragon/dragonmvmg.png", { width=680, height=385, numFrames=9,sheetContentWidth=2040,sheetContentHeight=1155 } )
					l.attgauche=graphics.newImageSheet( "AnimVF/mechant/dragon/dragonattg.png", { width=743, height=451, numFrames=6,sheetContentWidth=1486,sheetContentHeight=1353 } )
				elseif k==6 then
					l.vie=40
					l.attaque=1
					l.vitesse=3--1
					l.agressivite=3
					l.message="Bowman: "
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
					l.tir.attaque=1
					l.tir.vitesse=1.5
					l.tir.cadence=0
					l.tir.nbfleche=1
					l.tir.combat=1
					l.tir.attscale=1
					l.tir.timean=1

					l.tirnbfr=6
					l.atttir=graphics.newImageSheet( "AnimVF/mechant/archer/archeratg.png", { width=173, height=201, numFrames=5,sheetContentWidth=173,sheetContentHeight=1005 } )
				elseif k==7 then
					l.vie=40
					l.attaque=1
					l.vitesse=3--1
					l.agressivite=3
					l.message="Long Bowman: "
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
					l.depgauche=graphics.newImageSheet( "AnimVF/mechant/archerot/archermvmg.png", { width=159, height=230, numFrames=6,sheetContentWidth=159,sheetContentHeight=1380 } )
					l.tir=1 --1
					l.tir={}
					l.tir.agressivite=true
					l.tir.projscale=0.2
					l.tir.proj="01"
					l.tir.porte=30000
					l.tir.attaque=3
					l.tir.vitesse=1.5
					l.tir.cadence=10
					l.tir.nbfleche=1
					l.tir.combat=1
					l.tir.attscale=1
					l.tir.timean=0.3
					l.tirnbfr=6
					l.atttir=graphics.newImageSheet( "AnimVF/mechant/archerot/archeratg.png", { width=173, height=201, numFrames=5,sheetContentWidth=173,sheetContentHeight=1005 } )
				elseif k==8 then
					l.vie=150
					l.attaque=1
					l.vitesse=1--1
					l.agressivite=3
					l.message="Witch: "
					l.centrex=1--centre du corps du personnage
					l.centrey=1.2--y inversé plus le y est "fort", plus le centre est bas 
					l.tailleombre=0.7
					l.timeatt=1200
					l.attanim=1--0 pour ordre special
					l.effetdure=2--14--variable non fonctionnelle permet de faire varier la dure de l'effet de variation de hauteur pendant que le personnage marche
					l.argent=5
					l.scale=0.109
					l.eff3D=0.12--variation de l'impact de 3D agit en multiplication
					l.numframe=2
					l.depgauche=graphics.newImageSheet( "AnimVF/mechant/impie/impiemvmg.png", { width=158, height=200, numFrames=6,sheetContentWidth=158,sheetContentHeight=1200 } )
					l.tir=1 --1
					l.tir={}
					l.tir.agressivite=true
					l.tir.projscale=0.05
					l.tir.proj="04"
					l.tir.porte=5000
					l.tir.attaque=15
					l.tir.vitesse=1.5
					l.tir.cadence=10
					l.tir.nbfleche=1
					l.tir.combat=1
					l.tir.attscale=1
					l.tir.timean=0.3
					l.tirnbfr=2
					l.atttir=graphics.newImageSheet( "AnimVF/mechant/impie/impieatg.png", { width=176, height=200, numFrames=2,sheetContentWidth=176,sheetContentHeight=400 } )
				end
			elseif j==3 then --zone de test (automatiquement dans la carte 3 vague 1)--pour savoir quel soldat correspond au quel tu clic dessus et tu as test 1..
				if k==0 then -- prendre cette partie est la copité coller dans les 5 persos dispo ci-dessous si besoin de soldat test en plus faire idem 
					-- l.message="Test1: "
					-- l.vitesse=1--1
					-- l.timeatt=1000--duree de l'attaque en ms--800 par defaut-------------------------hugo si tu veux faire varier la durée d'attaque d'une unitée tu ajoute cette ligne apres "isoldat[numero].numframe=6" ou "isoldat[numero].vitesse=1" avec un espace
					-- l.timedep=0.95--coefficient du temps de l'animation plus le nb est grand(max20 )plus k'anim sera rapide min0.05
					-- l.centrex=-0.5--centre du corps du personnage
					-- l.centrey=0--y inversé plus le y est "fort", plus le centre est bas 
					-- l.tailleombre=0.5
		
		
		
					-- l.eff3D=0.12--variation de l'impact de 3D agit en multiplication
		
					-- l.numframe=6

					-- l.depgauche=graphics.newImageSheet( "AnimVF/mechant/assassin/assassinmvmg.png", { width=225, height=230, numFrames=6,sheetContentWidth=225,sheetContentHeight=1380 } )
					-- l.attgauche=graphics.newImageSheet( "AnimVF/mechant/assassin/assassinatg.png", { width=200, height=207, numFrames=6,sheetContentWidth=200,sheetContentHeight=1242 } )
				elseif k==1 then
					-- l.message="test 2 "
					-- anim: exemple de simplifiacation
					-- l={scale=0.09,attscale=1,attx=0,atty=0,centrex=0,centrey=0,tailleombre=1}
					-- l={vitesse=1,timedep=1.5,effetdure=20,effetimpact=0.18,eff3D=1}
					-- l={numframe=5,timeatt=800,attanim=1,porte=1,message="soldat: ",tir=0}
					-- -- l.tir={} -- si tir==1
					-- -- l.tir={combat=0,attscale=1,projscale=0.1,proj="02",vitesse=1,cadence=2000,nbfleche=1,porte=50000,attaque=5}
					-- l={vie=100,attaque=10,agressivite=2,blocnbennemi=1,attnbennemi=1,charge=0,regenevie=0,regene=20,argent=10}
					
				elseif k==2 then
					-- l.message="test 3 "

				elseif k==3 then
					-- l.message="test 4 "

				elseif k==4 then
					-- l.message="test 5 "
				elseif k==5 then
					l.message="White walker: "
					l.vie=80
					l.attaque=3
					l.vitesse=1.3--1
					l.timeatt=1100--duree de l'attaque en ms--800 par defaut-------------------------hugo si tu veux faire varier la durée d'attaque d'une unitée tu ajoute cette ligne apres "isoldat[numero].numframe=6" ou "isoldat[numero].vitesse=1" avec un espace
					l.agressivite=5
					l.charge=12
					l.centrex=5--centre du corps du personnage
					l.centrey=2.5--y inversé plus le y est "fort", plus le centre est bas 
					l.tailleombre=1.2
					l.tailleombre=0.85
					l.timedep=0.6
					l.attanim=0--0 pour ordre special
					l.finatt=14
					l.attanimordre={1,1,2,2,3,3,3,4,4,4,4,3,2,1,1,1,1,1,1,1,1,1}
					l.scale=0.1
					l.eff3D=0.13--variation de l'impact de 3D agit en multiplication
					l.numframe=4
					l.argent=3
					l.depgauche=graphics.newImageSheet( "AnimVF/mechant/white_walker/piquermvmg.png", { width=382, height=230, numFrames=6,sheetContentWidth=382,sheetContentHeight=1380 } )
					l.attgauche=graphics.newImageSheet( "AnimVF/mechant/white_walker/piqueratg.png", { width=356, height=228, numFrames=4,sheetContentWidth=356,sheetContentHeight=912 } )
				elseif k==6 then
					l.message="Touareg: "
					l.numframe=4
					l.vie=140
					l.attaque=4
					l.vitesse=2--1
					l.timeatt=1000--duree de l'attaque en ms--800 par defaut-------------------------hugo si tu veux faire varier la durée d'attaque d'une unitée tu ajoute cette ligne apres "isoldat[numero].numframe=6" ou "isoldat[numero].vitesse=1" avec un espace
					l.agressivite=2
					l.timedep=1.2--coefficient du temps de l'animation plus le nb est grand(max20 )plus k'anim sera rapide min0.05
					l.centrex=0--centre du corps du personnage
					l.centrey=9--y inversé plus le y est "fort", plus le centre est bas 
					l.atty=-10
					l.tailleombre=1
					l.effetimpact=0.10--22--0.44--0.22--permet de faire varier la position en ordonnee du perso pendant qu'il avance pour qu'on ait pas l'impression qu'il se dep)lace lineairement
					l.attanim=0--0 pour ordre special
					l.finatt=11
					l.attanimordre={1,2,2,3,3,4,4,4,3,2,1,1,1,1,1,1,1,1,1}
					l.argent=7
					l.scale=0.141
					l.eff3D=0.12--variation de l'impact de 3D agit en multiplication
					l.depgauche=graphics.newImageSheet( "AnimVF/mechant/touareg/touaregmvmg.png", { width=160, height=300, numFrames=6,sheetContentWidth=160,sheetContentHeight=1800 } )
					l.attgauche=graphics.newImageSheet( "AnimVF/mechant/touareg/touaregatg.png", { width=160, height=300, numFrames=4,sheetContentWidth=160,sheetContentHeight=1200 } )
				elseif k==7 then
					l.vie=15
					l.attaque=4
					l.vitesse=2--1
					l.timeatt=1500--duree de l'attaque en ms--800 par defaut-------------------------hugo si tu veux faire varier la durée d'attaque d'une unitée tu ajoute cette ligne apres "isoldat[numero].numframe=6" ou "isoldat[numero].vitesse=1" avec un espace
					l.agressivite=40
					l.message="Skeleton: "
					l.timedep=1.5--coefficient du temps de l'animation plus le nb est grand(max20 )plus k'anim sera rapide min0.05
					l.centrex=1--centre du corps du personnage
					--l.centrey=1--y inversé plus le y est "fort", plus le centre est bas 
					l.tailleombre=0.9
					l.attanim=0 --0 pour ordre special
					l.attanimordre={1,1,1,1,2,3,3,3,3,3,2,4,4}
					l.scale=0.1
					l.eff3D=0.13--variation de l'impact de 3D agit en multiplication
					l.numframe=4
					l.argent=3
					l.depgauche=graphics.newImageSheet( "AnimVF/mechant/squelette/squelettemvmg.png", { width=210, height=225, numFrames=6,sheetContentWidth=210,sheetContentHeight=1350 } )
					l.attgauche=graphics.newImageSheet( "AnimVF/mechant/squelette/squeletteatg.png", { width=205, height=256, numFrames=4,sheetContentWidth=410,sheetContentHeight=512 } )
				elseif k==8 then
					l.vie=40
					l.attaque=3
					l.vitesse=1--1
					l.timeatt=1200--duree de l'attaque en ms--800 par defaut-------------------------hugo si tu veux faire varier la durée d'attaque d'une unitée tu ajoute cette ligne apres "isoldat[numero].numframe=6" ou "isoldat[numero].vitesse=1" avec un espace
					l.agressivite=40
					l.message="zombie: "
					l.timedep=0.9--coefficient du temps de l'animation plus le nb est grand(max20 )plus k'anim sera rapide min0.05
					l.centrex=1--centre du corps du personnage
					l.centrey=3--y inversé plus le y est "fort", plus le centre est bas 
					l.tailleombre=0.9
					l.attanim=1 --0 pour ordre special
					-- l.attanimordre={1,1,2,2,3,3,3,4,4,4,4,3,2,1,1,1,1,1,1,1,1,1,1}
					l.scale=0.128
					l.eff3D=0.13--variation de l'impact de 3D agit en multiplication
					l.numframe=5
					l.argent=3
					l.depgauche=graphics.newImageSheet( "AnimVF/mechant/zombie/zombiemvmg.png", { width=180, height=250, numFrames=6,sheetContentWidth=180,sheetContentHeight=1500 } )
					l.attgauche=graphics.newImageSheet( "AnimVF/mechant/zombie/zombieatg.png", { width=180, height=250, numFrames=5,sheetContentWidth=180,sheetContentHeight=1250 } )
				elseif k==9 then
					l.vie=7
					l.attaque=3
					l.vitesse=2--1
					l.timeatt=1200--duree de l'attaque en ms--800 par defaut-------------------------hugo si tu veux faire varier la durée d'attaque d'une unitée tu ajoute cette ligne apres "isoldat[numero].numframe=6" ou "isoldat[numero].vitesse=1" avec un espace
					l.agressivite=40
					l.message="zombie2: "
					l.timedep=0.9--coefficient du temps de l'animation plus le nb est grand(max20 )plus k'anim sera rapide min0.05
					l.centrex=0--centre du corps du personnage
					l.centrey=-3--y inversé plus le y est "fort", plus le centre est bas 
					l.tailleombre=0.2
					l.attanim=0--0 pour ordre special
					l.finatt=14
					l.effetimpact=0.10
					l.attanimordre={1,1,2,2,3,3,3,4,4,4,4,3,2,1,1,1,1,1,1,1,1,1,1}
					l.scale=0.06
					l.eff3D=0.13--variation de l'impact de 3D agit en multiplication
					l.numframe=5
					l.argent=3
					l.depgauche=graphics.newImageSheet( "AnimVF/mechant/zombie/zombiemvmg.png", { width=180, height=250, numFrames=6,sheetContentWidth=180,sheetContentHeight=1500 } )
					l.attgauche=graphics.newImageSheet( "AnimVF/mechant/zombie/zombieatg.png", { width=180, height=250, numFrames=5,sheetContentWidth=180,sheetContentHeight=1250 } )
				end
			elseif j==4 then
				if k==0 then
					l.message="Egyptien1: "
					l.vie=90
					l.attaque=4
					l.vitesse=3.2--1
					l.numframe=6--nombre d'image de l'animation d'attaque (5 par defaut)
					l.timeatt=1100--duree de l'attaque en ms--800 par defaut-------------------------hugo si tu veux faire varier la durée d'attaque d'une unitée tu ajoute cette ligne apres "isoldat[numero].numframe=6" ou "isoldat[numero].vitesse=1" avec un espace
					l.tailleombre=0.85
					l.centrey=9
					l.centrex=4
					l.atty=-9
					l.timedep=0.6
					l.scale=0.14
					l.agressivite=4
					l.eff3D=0.13--variation de l'impact de 3D agit en multiplication
					l.numframe=6
					l.argent=3
					l.attgauche=graphics.newImageSheet( "AnimVF/mechant/egyptien/egyptien1atg.png", { width=486, height=320, numFrames=6,sheetContentWidth=972,sheetContentHeight=960 } )
					l.depgauche=graphics.newImageSheet( "AnimVF/mechant/egyptien/egyptien1mvmg.png", { width=486, height=320, numFrames=6,sheetContentWidth=972,sheetContentHeight=960 } )	
				elseif k==1 then
					l.message="Egyptien2: "
					l.vie=175
					l.attaque=7
					l.vitesse=2--1
					l.numframe=6--nombre d'image de l'animation d'attaque (5 par defaut)
					l.timeatt=1100--duree de l'attaque en ms--800 par defaut-------------------------hugo si tu veux faire varier la durée d'attaque d'une unitée tu ajoute cette ligne apres "isoldat[numero].numframe=6" ou "isoldat[numero].vitesse=1" avec un espace
					l.argent=6--argent gagner lors de la mort de l'unité--pour gain specifique au soldat faire pareil qu'au dessus
					l.centrey=9
					l.centrex=4
					l.atty=-9
					l.tailleombre=0.85
					l.agressivite=5
					l.timedep=0.6
					l.scale=0.14
					l.eff3D=0.13--variation de l'impact de 3D agit en multiplication
					l.numframe=4
					l.attgauche=graphics.newImageSheet( "AnimVF/mechant/egyptien/egyptien2atg.png", { width=486, height=320, numFrames=6,sheetContentWidth=972,sheetContentHeight=960 } )
					l.depgauche=graphics.newImageSheet( "AnimVF/mechant/egyptien/egyptien2mvmg.png", { width=486, height=320, numFrames=6,sheetContentWidth=972,sheetContentHeight=960 } )
					l.transition=graphics.newImageSheet( "AnimVF/mechant/egyptien/transition1.png", { width=486, height=320, numFrames=3,sheetContentWidth=486,sheetContentHeight=960 } )
				elseif k==2 then
					l.message="Egyptien3: "
					l.vie=350
					l.attaque=14
					l.vitesse=1.3--1
					l.numframe=6--nombre d'image de l'animation d'attaque (5 par defaut)
					l.timeatt=1100--duree de l'attaque en ms--800 par defaut-------------------------hugo si tu veux faire varier la durée d'attaque d'une unitée tu ajoute cette ligne apres "isoldat[numero].numframe=6" ou "isoldat[numero].vitesse=1" avec un espace
					l.argent=8--argent gagner lors de la mort de l'unité--pour gain specifique au soldat faire pareil qu'au dessus
					l.centrey=9
					l.centrex=4
					l.atty=-9
					l.tailleombre=0.85
					l.agressivite=5
					l.timedep=0.6
					l.scale=0.14
					l.eff3D=0.13--variation de l'impact de 3D agit en multiplication
					l.numframe=6
					l.attgauche=graphics.newImageSheet( "AnimVF/mechant/egyptien/egyptien3atg.png", { width=486, height=320, numFrames=6,sheetContentWidth=972,sheetContentHeight=960 } )
					l.depgauche=graphics.newImageSheet( "AnimVF/mechant/egyptien/egyptien3mvmg.png", { width=486, height=320, numFrames=6,sheetContentWidth=972,sheetContentHeight=960 } )
					l.transition=graphics.newImageSheet( "AnimVF/mechant/egyptien/transition2.png", { width=486, height=320, numFrames=3,sheetContentWidth=486,sheetContentHeight=960 } ) -- transition de mort du sokdat
				elseif k==3 then
					l.message="Egyptien4: "
					l.vie=700
					l.attaque=28
					l.vitesse=0.7--1
					l.numframe=6--nombre d'image de l'animation d'attaque (5 par defaut)
					l.timeatt=1100--duree de l'attaque en ms--800 par defaut-------------------------hugo si tu veux faire varier la durée d'attaque d'une unitée tu ajoute cette ligne apres "isoldat[numero].numframe=6" ou "isoldat[numero].vitesse=1" avec un espace
					l.argent=10--argent gagner lors de la mort de l'unité--pour gain specifique au soldat faire pareil qu'au dessus
					l.centrey=9
					l.centrex=4
					l.atty=-9
					l.tailleombre=0.85
					l.agressivite=6
					l.timedep=0.6
					l.scale=0.14
					l.eff3D=0.13--variation de l'impact de 3D agit en multiplication
					l.numframe=6
					l.attgauche=graphics.newImageSheet( "AnimVF/mechant/egyptien/egyptien4atg.png", { width=486, height=320, numFrames=6,sheetContentWidth=972,sheetContentHeight=960 } )
					l.depgauche=graphics.newImageSheet( "AnimVF/mechant/egyptien/egyptien4mvmg.png", { width=486, height=320, numFrames=6,sheetContentWidth=972,sheetContentHeight=960 } )
					l.transition=graphics.newImageSheet( "AnimVF/mechant/egyptien/transition3.png", { width=486, height=320, numFrames=3,sheetContentWidth=486,sheetContentHeight=960 } )
				elseif k==4 then
					l.vie=15
					l.attaque=3
					l.vitesse=8--1
					l.timeatt=1200--duree de l'attaque en ms--800 par defaut-------------------------hugo si tu veux faire varier la durée d'attaque d'une unitée tu ajoute cette ligne apres "isoldat[numero].numframe=6" ou "isoldat[numero].vitesse=1" avec un espace
					l.agressivite=2
					l.message="Panique: "
					l.timedep=0.9--coefficient du temps de l'animation plus le nb est grand(max20 )plus k'anim sera rapide min0.05
					l.argent=2
					l.centrex=1--centre du corps du personnage
					l.centrey=3--y inversé plus le y est "fort", plus le centre est bas 
					l.tailleombre=0.9
					l.attanim=0--0 pour ordre special
					l.finatt=14
					l.attanimordre={1,1,2,2,3,3,3,4,4,4,4,3,2,1,1,1,1,1,1,1,1,1,1}
					l.scale=0.128
					l.eff3D=0.13--variation de l'impact de 3D agit en multiplication
					l.numframe=4
					l.depgauche=graphics.newImageSheet( "AnimVF/mechant/paysan/paysanmvmg.png", { width=231, height=230, numFrames=6,sheetContentWidth=231,sheetContentHeight=1380 } )
					l.attgauche=graphics.newImageSheet( "AnimVF/mechant/paysan/paysanatg.png", { width=233, height=223, numFrames=4,sheetContentWidth=233,sheetContentHeight=892 } )	
				elseif k==5 then
					l.message="Plante: "
					l.vie=300
					l.attaque=30
					l.vitesse=1--1
					l.numframe=4--nombre d'image de l'animation d'attaque (5 par defaut)
					l.timeatt=1100--duree de l'attaque en ms--800 par defaut-------------------------hugo si tu veux faire varier la durée d'attaque d'une unitée tu ajoute cette ligne apres "isoldat[numero].numframe=6" ou "isoldat[numero].vitesse=1" avec un espace
					l.tailleombre=1.2
					l.tailleombre=0.85
					l.timedep=0.6
					l.scale=0.14
					l.eff3D=0.13--variation de l'impact de 3D agit en multiplication
					l.numframe=7
					l.typedep=2
					l.argent=25
					l.attgauche=graphics.newImageSheet( "AnimVF/mechant/plante/planteatg.png", { width=674, height=511, numFrames=7,sheetContentWidth=1348,sheetContentHeight=2044 } )
					l.depgauche=graphics.newImageSheet( "AnimVF/mechant/plante/plantemvmg.png", { width=686, height=520, numFrames=3,sheetContentWidth=1372,sheetContentHeight=1040 } )
				elseif k==6 then
					l.message="Tete: "
					l.vie=30
					l.attaque=15
					l.vitesse=1.3--1
					l.numframe=4--nombre d'image de l'animation d'attaque (5 par defaut)
					l.timeatt=1100--duree de l'attaque en ms--800 par defaut-------------------------hugo si tu veux faire varier la durée d'attaque d'une unitée tu ajoute cette ligne apres "isoldat[numero].numframe=6" ou "isoldat[numero].vitesse=1" avec un espace
					l.tailleombre=1.2
					l.tailleombre=0.85
					l.timedep=0.6
					l.scale=0.14
					l.eff3D=0.13--variation de l'impact de 3D agit en multiplication
					l.numframe=6
					l.typedep=2
					l.argent=2
					l.attgauche=graphics.newImageSheet( "AnimVF/mechant/plante/teteatg.png", { width=486, height=320, numFrames=6,sheetContentWidth=972,sheetContentHeight=960 } )
					l.depgauche=graphics.newImageSheet( "AnimVF/mechant/plante/tetemvmg.png", { width=486, height=320, numFrames=3,sheetContentWidth=486,sheetContentHeight=960 } )
				elseif k==7 then
					l.message="Main: "
					l.vie=25
					l.attaque=28
					l.vitesse=1.3--1
					l.numframe=6--nombre d'image de l'animation d'attaque (5 par defaut)
					l.timeatt=1100--duree de l'attaque en ms--800 par defaut-------------------------hugo si tu veux faire varier la durée d'attaque d'une unitée tu ajoute cette ligne apres "isoldat[numero].numframe=6" ou "isoldat[numero].vitesse=1" avec un espace
					l.tailleombre=1.2
					l.tailleombre=0.85
					l.timedep=0.6
					l.scale=0.14
					l.eff3D=0.13--variation de l'impact de 3D agit en multiplication
					l.numframe=7
					l.typedep=2
					l.argent=2
					l.attgauche=graphics.newImageSheet( "AnimVF/mechant/plante/mainatg.png", { width=486, height=320, numFrames=7,sheetContentWidth=972,sheetContentHeight=1280 } )
					l.depgauche=graphics.newImageSheet( "AnimVF/mechant/plante/mainmvmg.png", { width=486, height=320, numFrames=3,sheetContentWidth=486,sheetContentHeight=960 } )
				elseif k==8 then
					l.message="Pied: "
					l.vie=14
					l.attaque=28
					l.vitesse=1.7--1
					l.numframe=6--nombre d'image de l'animation d'attaque (5 par defaut)
					l.timeatt=1100--duree de l'attaque en ms--800 par defaut-------------------------hugo si tu veux faire varier la durée d'attaque d'une unitée tu ajoute cette ligne apres "isoldat[numero].numframe=6" ou "isoldat[numero].vitesse=1" avec un espace
					l.tailleombre=1.2
					l.tailleombre=0.85
					l.timedep=0.6
					l.scale=0.14
					l.eff3D=0.13--variation de l'impact de 3D agit en multiplication
					l.numframe=6
					l.typedep=2
					l.argent=2
					l.attgauche=graphics.newImageSheet( "AnimVF/mechant/plante/piedatg.png", { width=486, height=320, numFrames=6,sheetContentWidth=972,sheetContentHeight=1280 } )
					l.depgauche=graphics.newImageSheet( "AnimVF/mechant/plante/piedmvmg.png", { width=486, height=320, numFrames=3,sheetContentWidth=486,sheetContentHeight=960} )
				elseif k==9 then
					l.message="Pharaon: "
					l.vie=700
					l.attaque=28
					l.vitesse=0.7--1
					l.numframe=6--nombre d'image de l'animation d'attaque (5 par defaut)
					l.timeatt=1100--duree de l'attaque en ms--800 par defaut-------------------------hugo si tu veux faire varier la durée d'attaque d'une unitée tu ajoute cette ligne apres "isoldat[numero].numframe=6" ou "isoldat[numero].vitesse=1" avec un espace
					l.argent=10--argent gagner lors de la mort de l'unité--pour gain specifique au soldat faire pareil qu'au dessus
					l.tailleombre=0.85
					l.agressivite=6
					l.centrey=14
					l.centrex=4
					l.timedep=0.6
					l.scale=0.16
					l.eff3D=0.13--variation de l'impact de 3D agit en multiplication
					l.numframe=4
					l.attgauche=graphics.newImageSheet( "AnimVF/mechant/egyptienboss/egyptien1at.png", { width=500, height=272, numFrames=4,sheetContentWidth=500,sheetContentHeight=1108 } )
					l.depgauche=graphics.newImageSheet( "AnimVF/mechant/egyptienboss/egyptien1mvm.png", { width=402, height=298, numFrames=6,sheetContentWidth=804,sheetContentHeight=894 } )
				end	
			elseif j==5 then
				if k==0 then-- pas calibré
				elseif k==1 then
					l.message="Pirate: "
					l.vie=70
					l.attaque=2
					l.vitesse=3
					l.agressivite=3
					l.numframe=6--nombre d'image de l'animation d'attaque (5 par defaut)
					l.timeatt=1100--duree de l'attaque en ms--800 par defaut-------------------------hugo si tu veux faire varier la durée d'attaque d'une unitée tu ajoute cette ligne apres "isoldat[numero].numframe=6" ou "isoldat[numero].vitesse=1" avec un espace
					l.argent=2--argent gagner lors de la mort de l'unité--pour gain specifique au soldat faire pareil qu'au dessus
					l.centrey=10
					l.agressivite=6
					l.timedep=0.6
					l.scale=0.14
					l.eff3D=0.13--variation de l'impact de 3D agit en multiplication
					l.numframe=5
					l.attgauche=graphics.newImageSheet( "AnimVF/mechant/pirate/pirate1att.png", { width=200, height=223, numFrames=5,sheetContentWidth=1000,sheetContentHeight=223 } )
					l.depgauche=graphics.newImageSheet( "AnimVF/mechant/pirate/pirate1mvm.png", { width=181, height=304, numFrames=6,sheetContentWidth=181,sheetContentHeight=1824 } )	
				elseif k==2 then
					l.message="Pirate2: "
					l.vie=180
					l.attaque=5
					l.vitesse=1.5--1
					l.numframe=6--nombre d'image de l'animation d'attaque (5 par defaut)
					l.timeatt=1100--duree de l'attaque en ms--800 par defaut-------------------------hugo si tu veux faire varier la durée d'attaque d'une unitée tu ajoute cette ligne apres "isoldat[numero].numframe=6" ou "isoldat[numero].vitesse=1" avec un espace
					l.argent=4--argent gagner lors de la mort de l'unité--pour gain specifique au soldat faire pareil qu'au dessus
					l.tailleombre=0.85
					l.agressivite=5
					l.centrey=8
					l.centrex=4
					l.timedep=0.8
					l.scale=0.16
					l.eff3D=0.13--variation de l'impact de 3D agit en multiplication
					l.numframe=6
					l.attgauche=graphics.newImageSheet( "AnimVF/mechant/pirate/pirate2att.png", { width=172, height=262, numFrames=6,sheetContentWidth=344,sheetContentHeight=786 } )
					l.depgauche=graphics.newImageSheet( "AnimVF/mechant/pirate/pirate2mvm.png", { width=196, height=234, numFrames=6,sheetContentWidth=196,sheetContentHeight=1404 } )	
				elseif k==3 then
					l.message="Pirate3: "
					l.vie=1100
					l.attaque=9
					l.vitesse=1--1
					l.numframe=6--nombre d'image de l'animation d'attaque (5 par defaut)
					l.timeatt=1100--duree de l'attaque en ms--800 par defaut-------------------------hugo si tu veux faire varier la durée d'attaque d'une unitée tu ajoute cette ligne apres "isoldat[numero].numframe=6" ou "isoldat[numero].vitesse=1" avec un espace
					l.argent=8--argent gagner lors de la mort de l'unité--pour gain specifique au soldat faire pareil qu'au dessus
					l.agressivite=6
					l.timedep=0.85
					l.centrey=11
					l.scale=0.14
					l.eff3D=0.13--variation de l'impact de 3D agit en multiplication
					l.numframe=6
					l.attgauche=graphics.newImageSheet( "AnimVF/mechant/pirate/pirate3att.png", { width=220, height=342, numFrames=6,sheetContentWidth=440,sheetContentHeight=1026 } )
					l.depgauche=graphics.newImageSheet( "AnimVF/mechant/pirate/pirate3mvm.png", { width=231, height=294, numFrames=6,sheetContentWidth=231,sheetContentHeight=1764 } )	
				end
			elseif j==6 then--cavalier gobelin 
				l.typedep=2
				if k==0 then
					l.vie=50
					l.attaque=10
					l.vitesse=6.5--1
					l.agressivite=1
					l.charge=2
					l.message="Loup gob: "
					l.timedep=1.3--coefficient du temps de l'animation plus le nb est grand(max20 )plus k'anim sera rapide min0.05
					l.centrex=-2--centre du corps du personnage
					l.centrey=1.8
					l.tailleombre=1.4
					l.eff3D=0.8--variation de l'impact de 3D agit en multiplication
					l.argent=10
					l.depgauche=graphics.newImageSheet( "AnimVF/mechant/cavalier_gobelin/Mvmg_Loup.png", { width=450, height=357, numFrames=3,sheetContentWidth=450,sheetContentHeight=1071 } )
					l.attgauche=graphics.newImageSheet( "AnimVF/mechant/cavalier_gobelin/Attaque/Atg_Loup.png", { width=500, height=308, numFrames=5,sheetContentWidth=500,sheetContentHeight=1540 } )
				elseif k==1 then
					l.scale=0.11
					l.vie=200
					l.attaque=23
					l.vitesse=4--1
					l.agressivite=4
					l.charge=4
					l.message="Ours gob: "
					l.timedep=1--coefficient du temps de l'animation plus le nb est grand(max20 )plus k'anim sera rapide min0.05
					l.centrex=-2--centre du corps du personnage
					l.centrey=2
					l.tailleombre=1.2
					l.eff3D=0.6--variation de l'impact de 3D agit en multiplication
					l.argent=12
					l.depgauche=graphics.newImageSheet( "AnimVF/mechant/cavalier_gobelin/Mvmg_Ours.png", { width=395, height=318, numFrames=3,sheetContentWidth=395,sheetContentHeight=954 } )
					l.attgauche=graphics.newImageSheet( "AnimVF/mechant/cavalier_gobelin/Attaque/Atg_Ours.png", { width=518, height=318, numFrames=5,sheetContentWidth=518,sheetContentHeight=1590 } )
				elseif k==2 then
					l.vie=800
					l.attaque=20
					l.vitesse=4--1
					l.agressivite=4
					l.charge=30
					l.message="Rhino gob: "
					l.timedep=1.1--coefficient du temps de l'animation plus le nb est grand(max20 )plus k'anim sera rapide min0.05
					l.centrex=2.4--centre du corps du personnage
					l.centrey=2.8
					l.tailleombre=1.1
					l.eff3D=0.6--variation de l'impact de 3D agit en multiplication
					l.argent=18
					l.depgauche=graphics.newImageSheet( "AnimVF/mechant/cavalier_gobelin/Mvmg_Rhino.png", { width=447, height=327, numFrames=3,sheetContentWidth=447,sheetContentHeight=981 } )
					l.attgauche=graphics.newImageSheet( "AnimVF/mechant/cavalier_gobelin/Attaque/Atg_Rhino.png", { width=590, height=305, numFrames=5,sheetContentWidth=590,sheetContentHeight=1525 } )
				elseif k==3 then
					l.vie=60
					l.attaque=2
					l.vitesse=6--1
					l.agressivite=2
					l.charge=15
					l.message="Sanch gob: "
					l.timedep=1.1--coefficient du temps de l'animation plus le nb est grand(max20 )plus k'anim sera rapide min0.05
					l.centrex=-3.2--centre du corps du personnage
					l.centrey=3
					l.tailleombre=0.95
					l.eff3D=0.6--variation de l'impact de 3D agit en multiplication
					l.argent=10
					l.depgauche=graphics.newImageSheet( "AnimVF/mechant/cavalier_gobelin/Mvmg_Sanchon.png", { width=348, height=300, numFrames=3,sheetContentWidth=348,sheetContentHeight=900 } )
					l.attgauche=graphics.newImageSheet( "AnimVF/mechant/cavalier_gobelin/Attaque/Atg_Sanchon.png", { width=470, height=300, numFrames=5,sheetContentWidth=470,sheetContentHeight=1500 } )
				elseif k==4 then	--cavalier humain
					l.vie=50
					l.attaque=10
					l.vitesse=6.5--1
					l.agressivite=1
					l.charge=2
					l.message="Loup hum: "
					l.timedep=1.3--coefficient du temps de l'animation plus le nb est grand(max20 )plus k'anim sera rapide min0.05
					l.centrex=-2--centre du corps du personnage
					l.centrey=1.8
					l.tailleombre=1.4
					l.eff3D=0.6--variation de l'impact de 3D agit en multiplication
					l.argent=10
					l.depgauche=graphics.newImageSheet( "AnimVF/mechant/cavalier_humain/Mvmg_Loup.png", { width=393, height=299, numFrames=3,sheetContentWidth=393,sheetContentHeight=897 } )
					l.attgauche=graphics.newImageSheet( "AnimVF/mechant/cavalier_humain/Attaque/Atg_Loup.png", { width=450, height=299, numFrames=5,sheetContentWidth=450,sheetContentHeight=1495 } )
				elseif k==5 then
					l.vie=200 
					l.attaque=25
					l.vitesse=4.1--1
					l.agressivite=3
					l.charge=4
					l.message="Ours hum: "
					l.timedep=1--coefficient du temps de l'animation plus le nb est grand(max20 )plus k'anim sera rapide min0.05
					l.centrex=-2--centre du corps du personnage
					l.centrey=2
					l.tailleombre=1.2
					l.eff3D=0.6--variation de l'impact de 3D agit en multiplication
					l.argent=12
					l.depgauche=graphics.newImageSheet( "AnimVF/mechant/cavalier_humain/Mvmg_Ours.png", { width=356, height=309, numFrames=3,sheetContentWidth=356,sheetContentHeight=927 } )
					l.attgauche=graphics.newImageSheet( "AnimVF/mechant/cavalier_humain/Attaque/Atg_Ours.png", { width=468, height=309, numFrames=5,sheetContentWidth=468,sheetContentHeight=1545 } )
				elseif k==6 then
					l.vie=800
					l.attaque=24
					l.vitesse=4--1
					l.agressivite=4
					l.charge=30
					l.message="Rhino hum: "
					l.timedep=1.1--coefficient du temps de l'animation plus le nb est grand(max20 )plus k'anim sera rapide min0.05
					l.centrex=2.4--centre du corps du personnage
					l.centrey=2.8
					l.tailleombre=1.1
					l.eff3D=0.6--variation de l'impact de 3D agit en multiplication
					l.argent=18
					l.depgauche=graphics.newImageSheet( "AnimVF/mechant/cavalier_humain/Mvmg_Rhino.png", { width=447, height=318, numFrames=3,sheetContentWidth=447,sheetContentHeight=954 } )
					l.attgauche=graphics.newImageSheet( "AnimVF/mechant/cavalier_humain/Attaque/Atg_Rhino.png", { width=540, height=296, numFrames=5,sheetContentWidth=540,sheetContentHeight=1480 } )
				elseif k==7 then
					l.vie=60
					l.attaque=2
					l.vitesse=6--1
					l.agressivite=2
					l.charge=15
					l.message="sanch hum: "
					l.timedep=1.1--coefficient du temps de l'animation plus le nb est grand(max20 )plus k'anim sera rapide min0.05
					l.centrex=-3.2--centre du corps du personnage
					l.centrey=3
					l.tailleombre=0.95
					l.eff3D=0.6--variation de l'impact de 3D agit en multiplication
					l.argent=10
					l.depgauche=graphics.newImageSheet( "AnimVF/mechant/cavalier_humain/Mvmg_Sanchon.png", { width=359, height=295, numFrames=3,sheetContentWidth=359,sheetContentHeight=885 } )
					l.attgauche=graphics.newImageSheet( "AnimVF/mechant/cavalier_humain/Attaque/Atg_Sanchon.png", { width=420, height=291, numFrames=5 ,sheetContentWidth=420,sheetContentHeight=1455} )
				elseif k==8 then
					l.typedep=0
					l.scale=0.17
					l.vie=2000
					l.attaque=75
					l.vitesse=1--1
					l.agressivite=5
					--l.attnbennemi=2--nombre d'ennemi qu'il peut attaquer en meme temps
					l.message="Young Golem: "
					l.centrex=-7--centre du corps du personnage
					l.centrey=33.91--y inversé plus le y est "fort", plus le centre est bas 
					l.atty=-38.67
					l.tailleombre=2
					l.eff3D=0.5--variation de l'impact de 3D agit en multiplication
					l.numframe=9
					l.attanim=0--0 pour ordre special
					l.finatt=14
					l.attanimordre={1,2,3,4,5,6,6,6,6,6,5,4,7,8,9,9,9,9,9,9,9,1,1,1,1,1}
					l.argent=40
					l.depgauche1=graphics.newImageSheet( "AnimVF/mechant/golem/golem1mvmg.png", { width=472, height=555, numFrames=6,sheetContentWidth=1416,sheetContentHeight=1110 } )
					l.attgauche1=graphics.newImageSheet( "AnimVF/mechant/golem/golem1atg.png", { width=667, height=667, numFrames=9,sheetContentWidth=2001,sheetContentHeight=2001 } )
					l.depgauche=graphics.newImageSheet( "AnimVF/mechant/golem/golemmvmg.png", { width=472, height=555, numFrames=6,sheetContentWidth=1416,sheetContentHeight=1110 } )
					l.attgauche=graphics.newImageSheet( "AnimVF/mechant/golem/golematg.png", { width=667, height=667, numFrames=9,sheetContentWidth=2001,sheetContentHeight=2001 } )
				elseif k==9 then
					l.vie=7000
					l.attaque=30
					l.vitesse=4--1
					l.agressivite=10
					l.charge=60
					l.message="Rhino gob2: "
					l.timedep=1.1--coefficient du temps de l'animation plus le nb est grand(max20 )plus k'anim sera rapide min0.05
					l.centrex=2.4--centre du corps du personnage
					l.centrey=14.4592
					l.atty=-14.45
					l.tailleombre=1.1
					l.eff3D=0.6--variation de l'impact de 3D agit en multiplication
					l.scale=0.15
					l.argent=25
					l.depgauche=graphics.newImageSheet( "AnimVF/mechant/cavalier_gobelin/Mvmg_Rhino2.png", { width=553, height=350, numFrames=3,sheetContentWidth=553,sheetContentHeight=1050 } )
					l.attgauche=graphics.newImageSheet( "AnimVF/mechant/cavalier_gobelin/Attaque/Atg_Rhino2.png", { width=591, height=350, numFrames=5,sheetContentWidth=591,sheetContentHeight=1750 } )
				end
			elseif j==7 then
				if k==0 then
					l.typedep=2
					l.vie=40
					l.attaque=3
					l.vitesse=6.5--1
					l.agressivite=4
					l.charge=2
					l.message="Dog: "
					l.centrey=-1.5
					l.tailleombre=0.8
					l.timedep=1.3--coefficient du temps de l'animation plus le nb est grand(max20 )plus k'anim sera rapide min0.05
					l.eff3D=0.6--variation de l'impact de 3D agit en multiplication
					l.argent=4
					l.scale=0.05
					l.numframe=4
					l.depgauche2=graphics.newImageSheet( "AnimVF/mechant/chien/chien2mvmg.png", { width=486, height=320, numFrames=3,sheetContentWidth=486,sheetContentHeight=960 } )
					l.attgauche2=graphics.newImageSheet( "AnimVF/mechant/chien/chien2atg.png", { width=486, height=320, numFrames=4,sheetContentWidth=972,sheetContentHeight=640 } )
					l.depgauche1=graphics.newImageSheet( "AnimVF/mechant/chien/chien1mvmg.png", { width=486, height=320, numFrames=3,sheetContentWidth=486,sheetContentHeight=960 } )
					l.attgauche1=graphics.newImageSheet( "AnimVF/mechant/chien/chien1atg.png", { width=486, height=320, numFrames=4,sheetContentWidth=972,sheetContentHeight=640 } )
					l.depgauche=graphics.newImageSheet( "AnimVF/mechant/chien/chienmvmg.png", { width=486, height=320, numFrames=3,sheetContentWidth=486,sheetContentHeight=960 } )
					l.attgauche=graphics.newImageSheet( "AnimVF/mechant/chien/chienatg.png", { width=486, height=320, numFrames=4,sheetContentWidth=972,sheetContentHeight=640 } )
				elseif k==1 then
					l.typedep=2
					l.vie=400
					l.attaque=9
					l.vitesse=2.5--1
					l.agressivite=4
					l.timedep=0.8
					l.charge=2
					l.message="Lion: "
					l.centrex=-2--centre du corps du personnage
					l.centrey=1.8
					l.tailleombre=2
					l.eff3D=0.6--variation de l'impact de 3D agit en multiplication
					l.argent=6
					l.numframe=5
					l.finatt=8
					l.attanim=0--0 pour ordre special
					l.attanimordre={1,1,1,2,3,4,4,4,5,5,5,3}
					l.timeatt=1200
					l.scale=0.11
					l.centrey=18
					l.centrex=3
					l.atty=-15
					l.attx=7
					l.depgauche=graphics.newImageSheet( "AnimVF/mechant/lion/lionmvmg.png", { width=379, height=524, numFrames=3,sheetContentWidth=379,sheetContentHeight=1572 } )
					l.attgauche=graphics.newImageSheet( "AnimVF/mechant/lion/lionatg.png", { width=598, height=522, numFrames=5,sheetContentWidth=1196,sheetContentHeight=1566 } )
				elseif k==2 then
					l.message="kamikaze"
					l.vie=50
					l.attaque=100 -- 1000 revoir leveldesign du level10 et 11
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
				elseif k==3 then
					l.typedep=1
					l.vie=400
					l.attaque=9
					l.vitesse=2.5--1
					l.agressivite=4
					l.timedep=0.5
					l.charge=2
					l.message="Sphere: "
					--l.centrex=-2--centre du corps du personnage
					l.centrey=9
					l.tailleombre=1
					l.eff3D=0.6--variation de l'impact de 3D agit en multiplication
					l.argent=6
					l.numframe=5
					l.attx=-5
					l.atty=-10
					-- l.attanim=0--0 pour ordre special
					-- l.attanimordre={1,2,3,3,1,4,4}
					l.timeatt=1200
					l.scale=0.15
					l.depgauche=graphics.newImageSheet( "AnimVF/mechant/sphere/spheremvmg.png", { width=190, height=258, numFrames=4,sheetContentWidth=380,sheetContentHeight=516}) --,sheetContentWidth=570,sheetContentHeight=516 } )
					l.attgauche=graphics.newImageSheet( "AnimVF/mechant/sphere/sphereattg.png", { width=272, height=273, numFrames=5,sheetContentWidth=816,sheetContentHeight=546}) --,sheetContentWidth=570,sheetContentHeight=516 } )
				elseif k==4 then
					l.typedep=1
					l.vie=400
					l.attaque=9
					l.vitesse=2.5--1
					l.agressivite=4
					l.timedep=0.8
					l.charge=2
					l.message="Automate: "
					l.centrex=-2--centre du corps du personnage
					l.centrey=10
					l.atty=-10
					l.attx=-5
					l.tailleombre=1.4
					l.eff3D=0.6--variation de l'impact de 3D agit en multiplication
					l.argent=6
					l.numframe=6
					l.attanim=0--0 pour ordre special
					l.finatt=10
					l.attanimordre={6,1,3,3,3,3,3,1,2,4,5,5,5,5,5,6,6}
					l.timeatt=1200
					l.scale=0.15
					l.depgauche=graphics.newImageSheet( "AnimVF/mechant/sphere/automatemvmg.png", { width=192, height=288, numFrames=4,sheetContentWidth=384,sheetContentHeight=576}) --,sheetContentWidth=570,sheetContentHeight=516 } )
					l.attgauche=graphics.newImageSheet( "AnimVF/mechant/sphere/automateatg.png", { width=279, height=288, numFrames=6,sheetContentWidth=558,sheetContentHeight=864}) --,sheetContentWidth=570,sheetContentHeight=516 } )
				elseif k==5 then
					l.message="Amazon: "
					l.vie=400
					l.attaque=3
					l.vitesse=1.7--1
					l.timeatt=1100--duree de l'attaque en ms--800 par defaut-------------------------hugo si tu veux faire varier la durée d'attaque d'une unitée tu ajoute cette ligne apres "isoldat[numero].numframe=6" ou "isoldat[numero].vitesse=1" avec un espace
					l.timedep=0.6
					l.scale=0.12
					l.eff3D=0.13--variation de l'impact de 3D agit en multiplication
					l.numframe=3
					l.centrey=7
					l.centrex=2
					l.argent=5
					l.regenevie=1 -- regeneration des vies des soldats dans le cercle cas special pas regeneration classique
					l.attgauche=graphics.newImageSheet( "AnimVF/mechant/amazone/amazoneatg.png", { width=345, height=300, numFrames=3,sheetContentWidth=1045,sheetContentHeight=300 } )
					l.depgauche=graphics.newImageSheet( "AnimVF/mechant/amazone/amazonemvmg.png", { width=300, height=300, numFrames=6,sheetContentWidth=300,sheetContentHeight=1800} )
				end
			end
			if l.depgauche==nil then
				l.numframe=6
				print("bug à corriger chargementbis 853")
				l.depgauche=graphics.newImageSheet( "AnimVF/mechant/assassin/assassinmvmg.png", { width=225, height=230, numFrames=6,sheetContentWidth=225,sheetContentHeight=1380 } )
				l.attgauche=graphics.newImageSheet( "AnimVF/mechant/assassin/assassinatg.png", { width=200, height=207, numFrames=6,sheetContentWidth=200,sheetContentHeight=1242 } )
			end
			image[nb]=l
			-- print("truc charger")
			-- print(coroutine.running().." "..nb)
			if not fullcouritine then
				coroutine.yield()
			end
		end
		end
	end
	-- tabsoldexist=nil -- suppression de l'element doit etre supprimer dans la version finale
	-- local chargementaffichage = require ( "chargementaff")
	-- chargementevo()
	-- local lancerNiveau1 = require ( "niveau1" )
	-- local function timerlancerniv2bis( event )
	-- 	-- local chargement1 = require ( "chargement1")
	-- 	-- chargement1.chargement1()
	-- 	--print("chargementdesfichier="..chargementdesfichier.." chargementbis")
	-- 	--while chargementdesfichier<=5 then
	-- 		print("here")
	-- 		if chargementdesfichiertt then
	-- 			donneecharger[31]=1
	-- 			print("mise a 1 du chargementdesfichier")
	-- 			-- lancerNiveau1.niveau1(0)
	-- 			-- chargementdesfichier=6
	-- 		else
	-- 			print("relance ecoute 5 chargementdesfichier")
	-- 			timerlancernivbis2=timer.performWithDelay( 50, timerlancerniv2bis )
	-- 		end
	-- 	--end

	-- end
	-- timerlancernivbis2=timer.performWithDelay( 50, timerlancerniv2bis )

	if true and issimulator then --mettre true pour generer fiche sur chaque perso
		local function espaceafaire(vie,alpha)
			local m1=" "
			if vie<10 then
				m1=m1.." "
			end
			if vie<100 and alpha<2 then
				m1=m1.." "
			end
			if vie<1000 and alpha==0 then
				m1=m1.." "
			end
			return m1
		--end
		end
		print("init")
		local nouveauperso=false ----------------------------------mettre sur true quand on ajoute ou supprime un soldat
		--fiche personnage
		--Nom vie attaque sec, agressiviter vitesse. Pour l'attaque le calcul prend en compte la charge et le nb dd'ennemi attaquer en meme temps
		local espace=false
		local nb=0
		local compteurnbvariable=0
		local i=1 --test=1
		for i=1,1,1 do
			--print("ici1")
			for j=0,19,1 do
				--print("ici2")
				for k=0,9,1 do
					--print("ici3")
					nb=k+j*10+i*100
					if espace==false then
						if k==0 then
							--print("classe "..j)
							espace=true
						end
					end
					--print("nb:"..nb)
					if tabsoldexist[nb] or (nouveauperso and image[nb].message~="soldat: ") then
						if true then --image[nb].message~="soldat: " then
							compteurnbvariable=compteurnbvariable+27
							if image[nb].tir~=0 then
								compteurnbvariable=compteurnbvariable+11
							end
							espace=false
							local attsec=mathfloor(image[nb].attaque*1000/image[nb].timeatt*(image[nb].attnbennemi^0.7)+image[nb].charge/4)
							if image[nb].tir~=0 then
								attsec=mathfloor(attsec+image[nb].tir.attaque*image[nb].tir.nbfleche*1000/(800*image[nb].tir.timean+image[nb].tir.cadence))
							end
							local agressivite=mathfloor(image[nb].blocnbennemi+image[nb].agressivite)
							local puissance=mathfloor((attsec+image[nb].vie/10+image[nb].vitesse/5)/20*2)/2+1
							if nb>240 and nb<244 then -- pour les egyptiens
								puissance=puissance+image[nb-1].puissance
							end
							local message=image[nb].message
							if nb==275 then
								puissance=puissance*2 -- prise en compte du bonus de regeneration des vies des soldats autour
							end
							if nb>=280 and nb<290 then
								local niveausquelette=nb-248
								attsec=mathfloor(image[237].attaque*1000*niveausquelette/image[237].timeatt*(image[237].attnbennemi^0.7)+image[237].charge/4)
								puissance=mathfloor((attsec+image[237].vie*(2^(niveausquelette-1))/10+image[nb].vitesse/niveausquelette/5)/20*2)/2+1
								image[nb].vitesse=image[237].vitesse/niveausquelette
								image[nb].scale=image[237].scale*mathsqrt(niveausquelette)
								agressivite=mathfloor(image[237].blocnbennemi+image[237].agressivite)
								message=image[237].message.." "..niveausquelette
							end
							if nb==224 then
								puissance=puissance+image[222].puissance
							end
							if nb==272 then
								puissance=30
							end
							image[nb].puissance=puissance
							image[nb].attsec=attsec
							local m=string.len(message)
							-- if puissance>9 then
							-- 	m=m+1
							-- end
							while m<13 do
								message=message.." "
								m=m+1
							end
							
							local m1=espaceafaire(image[nb].vie,0)
							local m2=espaceafaire(attsec,1)
							local m3=espaceafaire(agressivite,2)
							local m4=" "
							local m0="   "
							local m5=""
							if puissance~=mathfloor(puissance) then
								m0=" "
							end
							if puissance>9 then
								m0="  "
							end
							if puissance~=mathfloor(puissance) and puissance>9 then
								m0=""
							end
							if mathfloor(image[nb].vitesse)==image[nb].vitesse then
								m4=".0 "
							end
							local ratioimg=mathfloor(image[nb].scale/0.09*10)*0.1
							if ratioimg==mathfloor(ratioimg) then
								m5=".0"
							end
							print(" ID:"..nb.." niveau:"..puissance..m0..message.."vie:"..image[nb].vie..m1.."att:"..attsec..m2.."agre:"..agressivite..m3.."vitesse:"..image[nb].vitesse..m4.." Ratio "..ratioimg..m5)
						end
					end
					if nb==199 then
						print("          orientation==1 (unitées mechantes)")
						print("classe 0")
					end
				end
			end
		end
		print(" ")
		print("il y a "..compteurnbvariable.." variables pour tout les soldats")
		compteurnbvariable=nil
		for itest1=1,2,1 do
			for j=0,9,1 do
				for k=0,9,1 do
					nb=k+j*10+itest1*100
					if tabsoldexist[nb] or (nouveauperso and image[nb].message~="soldat: ") then
						if true then --image[nb].message~="soldat: " then
							local m0="   "
							if image[nb].puissance~=mathfloor(image[nb].puissance) then
								m0=" "
							end
							print("image["..nb.."].puissance="..image[nb].puissance..m0.."image["..nb.."].attsec="..image[nb].attsec) --copier l'affichage et le collé en dessous
							--print("image["..nb.."].attsec="..image[nb].attsec)
						end
					end
				end
			end
		end
		for i=280,289 do
			image[i]={}
			if i>280 then
				image[i].puissance=image[i-1].puissance*3
				image[i].attsec=image[i-1].attsec*2
			else
				image[i].puissance=image[237].puissance*3
				image[i].attsec=image[237].attsec*2
			end
			print("image["..i.."]={} image["..i.."].puissance="..image[i].puissance.."   image["..i.."].attsec="..image[i].attsec)
		end
		if true and nouveauperso then
			local chainecaract="tabsoldexist={"
			for i=1,2,1 do
				for j=0,9,1 do
					for k=0,9,1 do
						nb=k+j*10+i*100
						chainecaract=chainecaract.."["..nb.."]="
						if image[nb].message~="soldat: " then
							chainecaract=chainecaract.."true"
						else
							chainecaract=chainecaract.."false"
						end
						if nb~=299 then
							chainecaract=chainecaract..","
						else
							chainecaract=chainecaract.."}"
						end
					end
				end
			end
			print(chainecaract)
			local tabsoldexist=chainecaract 
		end
	end
	-- --mettre le resultat des calculs ici
	-- print("get time fin "..system.getTimer())
image[101].puissance=1.5 image[101].attsec=7
image[102].puissance=1.5 image[102].attsec=9
image[103].puissance=2.5 image[103].attsec=19
image[104].puissance=2.5 image[104].attsec=22
image[105].puissance=2.5 image[105].attsec=22
image[106].puissance=2.5 image[106].attsec=22
image[107].puissance=2.5 image[107].attsec=22
image[108].puissance=2.5 image[108].attsec=22
image[112].puissance=3   image[112].attsec=21
image[113].puissance=4.5 image[113].attsec=36
image[114].puissance=5.5 image[114].attsec=50
image[116].puissance=5.5 image[116].attsec=50
image[117].puissance=5.5 image[117].attsec=50
image[118].puissance=5.5 image[118].attsec=50
image[122].puissance=15.5 image[122].attsec=276
image[123].puissance=3   image[123].attsec=30
image[124].puissance=4   image[124].attsec=41
image[126].puissance=4   image[126].attsec=41
image[127].puissance=4   image[127].attsec=41
image[128].puissance=4   image[128].attsec=41
image[140].puissance=1.5 image[140].attsec=7
image[141].puissance=1.5 image[141].attsec=6
image[142].puissance=1.5 image[142].attsec=12
image[143].puissance=1.5 image[143].attsec=9
image[145].puissance=2   image[145].attsec=19
image[146].puissance=2   image[146].attsec=18
image[170].puissance=2   image[170].attsec=9
image[171].puissance=2.5 image[171].attsec=14
image[172].puissance=3   image[172].attsec=22
image[173].puissance=2   image[173].attsec=11
image[174].puissance=3   image[174].attsec=28
image[175].puissance=3   image[175].attsec=24
image[176].puissance=3   image[176].attsec=8
image[177].puissance=6   image[177].attsec=52
image[178].puissance=18.5 image[178].attsec=278
image[179].puissance=32   image[179].attsec=459
image[200].puissance=1   image[200].attsec=1
image[201].puissance=2   image[201].attsec=7
image[202].puissance=1.5 image[202].attsec=7
image[203].puissance=1   image[203].attsec=3
image[204].puissance=27   image[204].attsec=20
image[205].puissance=2   image[205].attsec=10
image[206].puissance=1.5 image[206].attsec=7
image[207].puissance=1.5 image[207].attsec=7
image[208].puissance=2   image[208].attsec=10
image[209].puissance=1.5 image[209].attsec=6
image[210].puissance=1   image[210].attsec=2
image[211].puissance=1   image[211].attsec=2
image[212].puissance=1.5 image[212].attsec=8
image[213].puissance=1.5 image[213].attsec=6
image[214].puissance=1.5 image[214].attsec=8
image[215].puissance=6.5 image[215].attsec=14
image[216].puissance=4.5 image[216].attsec=7
image[217].puissance=8   image[217].attsec=12
image[218].puissance=5.5 image[218].attsec=33
image[219].puissance=4.5 image[219].attsec=14
image[220].puissance=1.5 image[220].attsec=3
image[221].puissance=6   image[221].attsec=7
image[222].puissance=4   image[222].attsec=12
image[223].puissance=5   image[223].attsec=16
image[224].puissance=9.5 image[224].attsec=64
image[225].puissance=211   image[225].attsec=200
image[226].puissance=1   image[226].attsec=1
image[227].puissance=1.5 image[227].attsec=12
image[228].puissance=4.5 image[228].attsec=60
image[235].puissance=1.5 image[235].attsec=5
image[236].puissance=1.5 image[236].attsec=4
image[237].puissance=1   image[237].attsec=2
image[238].puissance=1   image[238].attsec=2
image[239].puissance=1   image[239].attsec=2
image[240].puissance=1.5 image[240].attsec=3
image[241].puissance=3.5 image[241].attsec=6
image[242].puissance=6.5 image[242].attsec=12
image[243].puissance=12   image[243].attsec=25
image[244].puissance=1   image[244].attsec=2
image[249].puissance=5.5 image[249].attsec=25
image[251].puissance=1   image[251].attsec=1
image[252].puissance=2   image[252].attsec=4
image[253].puissance=6.5 image[253].attsec=8
image[260].puissance=1.5 image[260].attsec=13
image[261].puissance=3   image[261].attsec=29
image[262].puissance=6.5 image[262].attsec=32
image[263].puissance=1.5 image[263].attsec=6
image[264].puissance=1.5 image[264].attsec=13
image[265].puissance=3.5 image[265].attsec=32
image[266].puissance=6.5 image[266].attsec=37
image[267].puissance=1.5 image[267].attsec=6
image[268].puissance=15.5 image[268].attsec=93
image[269].puissance=38.5 image[269].attsec=52
image[270].puissance=1   image[270].attsec=4
image[271].puissance=3   image[271].attsec=8
image[272].puissance=30   image[272].attsec=2000
image[275].puissance=6   image[275].attsec=2
image[280]={} image[280].puissance=3   image[280].attsec=4
image[281]={} image[281].puissance=9   image[281].attsec=8
image[282]={} image[282].puissance=27   image[282].attsec=16
image[283]={} image[283].puissance=81   image[283].attsec=32
image[284]={} image[284].puissance=243   image[284].attsec=64
image[285]={} image[285].puissance=729   image[285].attsec=128
image[286]={} image[286].puissance=2187   image[286].attsec=256
image[287]={} image[287].puissance=6561   image[287].attsec=512
image[288]={} image[288].puissance=19683   image[288].attsec=1024
image[289]={} image[289].puissance=59049   image[289].attsec=2048

if issimulator and false then
	local ombreimg=display.newImage(imbouton.ombresld,1)
	for i=100,300 do
		if tabsoldexist[i] then
			print("i "..i)
			local imagedutruc=display.newImage(image[i].depgauche,1)
			local bas=mathfloor((imagedutruc.height*0.5*image[i].scale-10-ombreimg.height*0.2*0.22*image[i].tailleombre)*100)*0.01
			local atty=0
			if image[i].attgauche~=nil then
				local imagedutrucatt=display.newImage(image[i].attgauche,1)
				atty=mathfloor((-((imagedutrucatt.height-imagedutruc.height)*image[i].attscale*image[i].scale)*0.25-image[i].centrey)*100)*0.01 --bas au lieu de centrey
				imagedutrucatt:removeSelf()
				--image[i].atty=atty
			end
			imagedutruc:removeSelf()
			print("image["..i.."].centrey="..bas.." \timage["..i.."].atty="..atty)--.."\tdif centrey"..(mathfloor((image[i].centrey-bas)*100)*0.01).."\tdif atty "..(mathfloor((image[i].atty-atty)*100)*0.01))
			--if i==179 then
			--	image[i].atty=-atty
			--end

			--image[i].centrey=bas
		end
	end
	ombreimg:removeSelf()
	--image[204].centrey=21
end
if issimulator and true then -- genere une fiche de chaque soldat avec tout les spec
	print("ID\tHP\t\tATK\tCHARGE\tVITESSE\tagressivity\tnbAtkEnnemi\tblocnbennemi\tname")
	for i=100,300 do
		if tabsoldexist[i] then
			local stringaff=""
			local vie=""..image[i].vie
			if image[i].vie<1000 then
				vie=vie.." "
			end
			if image[i].vie<100 then
				vie=vie.." "
			end
			if image[i].vie<10 then
				vie=vie.." "
			end
			stringaff=i..",\t"..vie.."\t"..image[i].attsec.."\t"..image[i].charge.."\t"..image[i].vitesse.."\t"..image[i].agressivite.."\t"..image[i].attnbennemi.."\t"..image[i].blocnbennemi.."\t"..image[i].message
--			stringaff="id "..i.."\tHP "..vie.."\tatk "..image[i].attsec.."\tcharge "..image[i].charge.."\tvitesse "..image[i].vitesse.."\tagressivity "..image[i].agressivite.."\tnbAtkEnnemi "..image[i].attnbennemi.."\tblocnbennemi "..image[i].blocnbennemi.."\tName "..image[i].message
			print(stringaff)
		end
	end
end
chargementdesfichier[1]=1
end
return (t)