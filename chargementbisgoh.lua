local t = {}--chargement des unitées mechantes(donnes+image)
t.chargementbisgoh = function ()--chargementbis pour decomposer le premier bloc de chargement permet une plus grande fuildité de la barre de chargement

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
					l.attx=-4--deplacement de l'anim d'attaque pour qu'elle soit superposé a celle de deplacement
					l.atty=3
					l.timeatt=1200
					l.argent=5
					l.numframe=6
					l.centrex=5--centre du corps du personnage
					l.centrey=-4--y inversé plus le y est "fort", plus le centre est bas 
					l.tailleombre=0.9
					l.timedep=0.8
					l.depgauche=graphics.newImageSheet( "goh/AnimVF/mechant/assassin/assasinwal.png", { width=120, height=158, numFrames=4,sheetContentWidth=120,sheetContentHeight=632 } )
					l.attgauche=graphics.newImageSheet( "goh/AnimVF/mechant/assassin/assasinatt.png", { width=166, height=175, numFrames=6,sheetContentWidth=498,sheetContentHeight=350 } )
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
					l.timeatt=1100
					l.numframe=5
					l.argent=10
					l.agressivite=2
					l.message="Barbare: "
					l.timedep=0.5
					l.attscale=1.2
					l.centrex=7
					l.centrey=-3
					l.attx=-8
					l.atty=7
					l.attanim=0
					l.finatt=7
					l.attanimordre={1,2,3,3,3,4,5,5}
					l.depgauche=graphics.newImageSheet( "goh/AnimVF/mechant/barbare/barbarewal.png", { width=181, height=166, numFrames=4,sheetContentWidth=181,sheetContentHeight=664 } )
					l.attgauche=graphics.newImageSheet( "goh/AnimVF/mechant/barbare/barbareatt.png", { width=170, height=206, numFrames=5,sheetContentWidth=170,sheetContentHeight=1030 } )
				elseif k==2 then
					l.vie=40
					l.attaque=7
					l.vitesse=1.75--1
					l.timeatt=1000
					l.agressivite=1
					l.message="Druide: "
					l.scale=l.scale*0.8
					l.centrex=3--centre du corps du personnage
					l.centrey=-4--y inversé plus le y est "fort", plus le centre est bas 
					l.tailleombre=0.6
					l.timedep=1.1
					l.argent=5
					l.numframe=12
					l.attscale=0.9
					l.attx=-2
					l.atty=3
					l.depgauche=graphics.newImageSheet( "goh/AnimVF/mechant/druide/druidwal.png", { width=120, height=151, numFrames=4,sheetContentWidth=120,sheetContentHeight=604 } )
					l.attgauche=graphics.newImageSheet( "goh/AnimVF/mechant/druide/druidatt.png", { width=210, height=166, numFrames=12,sheetContentWidth=840,sheetContentHeight=498 } )
				elseif k==3 then
					l.vie=20--120
					l.attaque=3
					l.vitesse=3--1
					l.agressivite=1
					l.message="Gobelin: "
					l.argent=3
					l.numframe=8
					l.centrex=7
					l.centrey=-1
					l.tailleombre=0.4
					l.timedep=1.3
					l.scale=l.scale*0.6
					l.attx=-4.5
					l.atty=5.5
					l.depgauche=graphics.newImageSheet( "goh/AnimVF/mechant/gobelin/gobelinwal.png", { width=166, height=149, numFrames=4,sheetContentWidth=166,sheetContentHeight=596 } )
					l.attgauche=graphics.newImageSheet( "goh/AnimVF/mechant/gobelin/gobelinatt.png", { width=266, height=224, numFrames=8,sheetContentWidth=1064,sheetContentHeight=448 } )
				elseif k==4 then
					l.vie=5000
					l.attaque=33
					l.vitesse=0.7--1
					l.timeatt=1600
					l.agressivite=5
					l.porte=4
					l.message="Golem: "
					l.argent=25
					l.centrey=-6
					l.tailleombre=3
					l.timedep=0.2
					l.typedep=2
					l.attscale=1.4
					l.numframe=7
					l.atty=35
					l.attx=-13
					l.attanim=0
					l.finatt=8
					l.attanimordre={1,2,3,4,5,5,5,6,7,7}
					l.depgauche=graphics.newImageSheet( "goh/AnimVF/mechant/golem/golem1pwal.png", { width=248, height=316, numFrames=10,sheetContentWidth=496,sheetContentHeight=1580 } )
					l.attgauche=graphics.newImageSheet( "goh/AnimVF/mechant/golem/golem1patt.png", { width=334, height=366, numFrames=7,sheetContentWidth=668,sheetContentHeight=1464 } )
					l.depgauche1= graphics.newImageSheet( "goh/AnimVF/mechant/golem/golem1gwal.png", { width=234, height=316, numFrames=10,sheetContentWidth=468,sheetContentHeight=1580 } )
					l.attgauche1= graphics.newImageSheet( "goh/AnimVF/mechant/golem/golem1gatt.png", { width=334, height=366, numFrames=7,sheetContentWidth=668,sheetContentHeight=1464 } )
				elseif k==5 then
					l.vie=160
					l.attaque=10
					l.vitesse=1.3--1
					l.timeatt=1000
					l.agressivite=2
					l.message="Guerrier: "
					l.scale=l.scale*1.1
					l.centrex=6--centre du corps du personnage
					l.centrey=-3--y inversé plus le y est "fort", plus le centre est bas 
					l.argent=7
					l.numframe=7
					l.timedep=1.1
					l.attx=-4
					l.atty=5
					l.depgauche=graphics.newImageSheet("goh/AnimVF/mechant/guerrier/guerrierwal.png", { width=172, height=136, numFrames=4,sheetContentWidth=172,sheetContentHeight=544 } )
					l.attgauche=graphics.newImageSheet("goh/AnimVF/mechant/guerrier/guerrieratt.png", { width=205, height=196, numFrames=7,sheetContentWidth=820,sheetContentHeight=392 } )
				elseif k==6 then
					l.vie=45
					l.attaque=7
					l.vitesse=1.85--1
					l.timeatt=1000
					l.agressivite=1
					l.message="Mercenaire:"
					l.argent=5
					l.numframe=7
					l.centrex=8--centre du corps du personnage
					l.centrey=-3--y inversé plus le y est "fort", plus le centre est bas 
					l.timedep=0.7
					l.scale=l.scale*1.28
					l.attscale=0.84
					l.attx=-7
					l.atty=3
					l.depgauche=graphics.newImageSheet( "goh/AnimVF/mechant/mercenaire/mercenairewal.png", { width=137, height=116, numFrames=4,sheetContentWidth=137,sheetContentHeight=464 } )
					l.attgauche=graphics.newImageSheet( "goh/AnimVF/mechant/mercenaire/mercenaireatt.png", { width=193, height=196, numFrames=7,sheetContentWidth=772,sheetContentHeight=392 } )
				elseif k==7 then
					l.vie=120
					l.attaque=8
					l.vitesse=1--1
					l.timeatt=1100
					l.agressivite=3
					l.message="Orc: "
					l.centrex=3.5--centre du corps du personnage
					l.centrey=-4--y inversé plus le y est "fort", plus le centre est bas 
					l.timedep=0.7
					l.numframe=7
					l.argent=4
					l.tailleombre=1.4
					l.scale=l.scale*1.2
					l.attx=-13
					l.atty=4
					l.depgauche=graphics.newImageSheet( "goh/AnimVF/mechant/orc/orc1wal.png", { width=110, height=146, numFrames=4,sheetContentWidth=110,sheetContentHeight=584 } )
					l.attgauche=graphics.newImageSheet( "goh/AnimVF/mechant/orc/orc1att.png", { width=196, height=192, numFrames=7,sheetContentWidth=784,sheetContentHeight=384 } )
				elseif k==8 then
					l.vie=130
					l.attaque=12
					l.vitesse=1--1
					l.timeatt=1200
					l.agressivite=3
					l.message="Orc2: "					
					l.argent=4
					l.numframe=5
					l.centrex=6.5
					l.centrey=-3
					l.timedep=0.7
					l.tailleombre=1.4
					l.attscale=1.08
					l.attx=-21
					l.atty=3
					l.depgauche=graphics.newImageSheet( "goh/AnimVF/mechant/orc2/orc2wal.png", { width=180, height=173, numFrames=4,sheetContentWidth=180,sheetContentHeight=692 } )
					l.attgauche=graphics.newImageSheet( "goh/AnimVF/mechant/orc2/orc2att.png", { width=323, height=196, numFrames=5,sheetContentWidth=323,sheetContentHeight=980 } )
				elseif k==9 then
					-- paladin
					l.vie=70
					l.attaque=2
					l.charge=30
					l.vitesse=6
					l.agressivite=1
					l.argent=20
					l.numframe=7
					l.message="Greedy horse man:"
					l.centrex=13
					l.centrey=-6
					l.tailleombre=1.6
					l.attscale=0.9
					l.attx=-15
					l.atty=7
					l.depgauche=graphics.newImageSheet( "goh/AnimVF/mechant/greddy_human/greedy_horsemanwalk.png", { width=248, height=196, numFrames=8,sheetContentWidth=992,sheetContentHeight=392 } )
					l.attgauche=graphics.newImageSheet( "goh/AnimVF/mechant/greddy_human/greedy_horsemanatt.png", { width=269, height=196, numFrames=7,sheetContentWidth=1076,sheetContentHeight=392 } )
				end
			elseif j==1 then
				if k==0 then
					l.vie=15
					l.attaque=3
					l.vitesse=1.5--1
					l.timeatt=1200
					l.argent=2
					l.agressivite=10
					l.message="Paysan: "
					l.centrex=12.5--centre du corps du personnage
					l.centrey=-3--y inversé plus le y est "fort", plus le centre est bas 
					l.tailleombre=0.8
					l.numframe=6
					l.timedep=1.4
					l.attscale=0.88
					l.attx=-20
					l.atty=3
					l.depgauche=graphics.newImageSheet( "goh/AnimVF/mechant/paysan/paysanwal.png", { width=150, height=172, numFrames=4,sheetContentWidth=150,sheetContentHeight=688 } )
					l.attgauche=graphics.newImageSheet( "goh/AnimVF/mechant/paysan/paysanatt.png", { width=259, height=216, numFrames=6,sheetContentWidth=777,sheetContentHeight=432 } )
				elseif k==1 then
					l.vie=15
					l.attaque=3
					l.vitesse=1.6--1
					l.timeatt=1200
					l.argent=2
					l.agressivite=1
					l.message="Paysan: "
					l.centrex=12--centre du corps du personnage
					l.centrey=-3--y inversé plus le y est "fort", plus le centre est bas 
					l.tailleombre=0.8
					l.timedep=1.4
					l.numframe=6
					l.attscale=0.94
					l.attx=-21
					l.atty=3
					l.depgauche=graphics.newImageSheet( "goh/AnimVF/mechant/paysan2/paysan2wal.png", { width=150, height=181, numFrames=4,sheetContentWidth=150,sheetContentHeight=724 } )
					l.attgauche=graphics.newImageSheet( "goh/AnimVF/mechant/paysan2/paysan2att.png", { width=259, height=216, numFrames=6,sheetContentWidth=777,sheetContentHeight=432 } )
				elseif k==2 then
					l.vie=45
					l.attaque=3
					l.vitesse=1.3--1
					l.timeatt=1100
					l.agressivite=1
					l.charge=25
					l.message="Piquier: "
					l.numframe=7
					l.centrex=10.5--centre du corps du personnage
					l.centrey=-4--y inversé plus le y est "fort", plus le centre est bas 
					l.argent=7
					l.timedep=1
					l.scale=l.scale*1.28
					l.attscale=0.87
					l.attx=-19
					l.atty=8
					l.depgauche=graphics.newImageSheet( "goh/AnimVF/mechant/piquier/piquierwal.png", { width=140, height=160, numFrames=4,sheetContentWidth=140,sheetContentHeight=640 } )
					l.attgauche=graphics.newImageSheet( "goh/AnimVF/mechant/piquier/piquieratt.png", { width=216, height=183, numFrames=7,sheetContentWidth=864,sheetContentHeight=366 } )
				elseif k==3 then
					-- soudard
					l.vie=30 -- Wrong stat because wrong guy. The greedy gobelin isn't on horses!!!
					l.attaque=2
					l.charge=0
					l.vitesse=3
					l.agressivite=1
					l.scale=l.scale*0.5
					l.argent=15
					l.message="Greedy goblin:"
					l.numframe=8
					l.centrex=5
					l.centrey=0
					l.tailleombre=0.6
					l.attscale=1.46
					l.attx=-6
					l.atty=8
					l.depgauche=graphics.newImageSheet( "goh/AnimVF/mechant/greedy_goblin/greedy_goblinwal.png", { width=266, height=204, numFrames=4,sheetContentWidth=266,sheetContentHeight=832 } )
					l.attgauche=graphics.newImageSheet( "goh/AnimVF/mechant/greedy_goblin/greedy_goblinatt.png", { width=266, height=224, numFrames=8,sheetContentWidth=798,sheetContentHeight=672 } )
				elseif k==4 then
					l.vie=45
					l.attaque=3
					l.vitesse=1.2--1
					l.timeatt=1200
					l.agressivite=1
					l.charge=25
					l.message="Ulhan: "
					l.numframe=7
					l.centrex=13--centre du corps du personnage
					l.centrey=-3.5--y inversé plus le y est "fort", plus le centre est bas 
					l.tailleombre=0.9
					l.argent=7
					l.timedep=1
					l.attscale=0.91
					l.attx=-19
					l.atty=6
					l.depgauche=graphics.newImageSheet( "goh/AnimVF/mechant/uhlan/uhlanwal.png", { width=155, height=166, numFrames=4,sheetContentWidth=155,sheetContentHeight=664 } )
					l.attgauche=graphics.newImageSheet( "goh/AnimVF/mechant/uhlan/uhlanatt.png", { width=242, height=196, numFrames=7,sheetContentWidth=968,sheetContentHeight=392 } )
				elseif k==5 then
					l.vie=1000
					l.attaque=20
					l.vitesse=1.2--1
					l.timeatt=1400
					l.agressivite=6
					l.message="Uruk: "
					l.centrex=10--centre du corps du personnage
					l.centrey=-4--y inversé plus le y est "fort", plus le centre est bas 
					l.numframe=6
					l.argent=8
					l.timedep=1
					l.scale=l.scale*1.1
					l.attx=-12
					l.atty=5
					l.attanim=0
					l.finatt=7
					l.attanimordre={1,2,3,3,3,4,5,6,6}
					l.attgauche=graphics.newImageSheet( "goh/AnimVF/mechant/uruk/urukatt.png", { width=217, height=196, numFrames=6,sheetContentWidth=651,sheetContentHeight=392 } )
					l.depgauche=graphics.newImageSheet( "goh/AnimVF/mechant/uruk/urukwal.png", { width=150, height=155, numFrames=4,sheetContentWidth=150,sheetContentHeight=620 } )
				elseif k==6 then
					l.vie=700
					l.attaque=6
					l.vitesse=2.5--1
					l.agressivite=6
					l.message="Balrog: "
					l.centrex=12--centre du corps du personnage
					l.centrey=-3--y inversé plus le y est "fort", plus le centre est bas 
					l.numframe=5
					l.argent=12
					l.timedep=1.2
					l.attscale=1.17
					l.attx=-9
					l.atty=7
					l.attanim=0
					l.finatt=7
					l.attanimordre={1,2,3,3,3,4,5,5}
					l.attgauche=graphics.newImageSheet( "goh/AnimVF/mechant/balrog/balrogatt.png", { width=196, height=230, numFrames=5,sheetContentWidth=588,sheetContentHeight=460 } )
					l.depgauche=graphics.newImageSheet( "goh/AnimVF/mechant/balrog/balrogwal.png", { width=242, height=166, numFrames=4,sheetContentWidth=242,sheetContentHeight=664 } )
				elseif k==7 then
					l.vie=1300
					l.attaque=11
					l.vitesse=2.15--1
					l.timeatt=900
					l.agressivite=6
					l.message="Balrog 2: "
					l.centrex=11--centre du corps du personnage
					l.centrey=-2--y inversé plus le y est "fort", plus le centre est bas 
					l.numframe=5
					l.argent=8
					l.timedep=1.2
					l.scale=l.scale*1.2
					l.attscale=1.1
					l.attx=-9
					l.atty=5
					l.attanim=0
					l.finatt=7
					l.attanimordre={1,2,3,3,3,4,5,5}
					l.depgauche=graphics.newImageSheet( "goh/AnimVF/mechant/balrog2/balrog2wal.png",{ width=192, height=136, numFrames=4,sheetContentWidth=192,sheetContentHeight=544 } ) 
					l.attgauche=graphics.newImageSheet( "goh/AnimVF/mechant/balrog2/balrog2att.png",{ width=186, height=190, numFrames=5 ,sheetContentWidth=558,sheetContentHeight=380} )
				elseif k==8 then
					l.vie=600
					l.attaque=40
					l.vitesse=0.9--1
					l.timeatt=1200
					l.agressivite=5
					l.message="Boucher: "
					l.centrex=11--centre du corps du personnage
					l.centrey=-3--y inversé plus le y est "fort", plus le centre est bas 
					l.tailleombre=1.4
					l.numframe=7
					l.timedep=1
					l.argent=15
					l.attx=-6
					l.atty=5
					l.attanim=0
					l.finatt=9
					l.attanimordre={1,2,3,4,4,4,5,6,7,7,1}
					l.attgauche=graphics.newImageSheet( "goh/AnimVF/mechant/boucher/boucheratt.png", { width=216, height=224, numFrames=7,sheetContentWidth=864,sheetContentHeight=448 } )
					l.depgauche=graphics.newImageSheet( "goh/AnimVF/mechant/boucher/boucherwal.png", { width=179, height=146, numFrames=4,sheetContentWidth=179,sheetContentHeight=584 } )
				elseif k==9 then
					l.message="Piquier2: "
					l.vie=600
					l.attaque=8
					l.vitesse=1.3--1
					l.timeatt=1100
					l.agressivite=5
					l.charge=30
					l.numframe=6
					l.argent=15
					l.scale=l.scale*0.9
					l.centrex=6.5
					l.centrey=-1
					l.attscale=1.07
					l.attx=-20
					l.atty=7
					l.attgauche=graphics.newImageSheet( "goh/AnimVF/mechant/piquier2/piquier2att.png", { width=266, height=238, numFrames=7,sheetContentWidth=1064,sheetContentHeight=476 } )
					l.depgauche=graphics.newImageSheet( "goh/AnimVF/mechant/piquier2/piquier2wal.png", { width=148, height=216, numFrames=4,sheetContentWidth=148,sheetContentHeight=864 } )
				end	
			elseif j==2 then
				if k==0 then
					l.vie=100
					--l.scale=0.07
					l.vitesse=3
					l.message="Spider: "
					l.tailleombre=0.8
					l.numframe=8
					l.typedep=3
					l.attaque=3 
					l.agressivite=8
					l.argent=2
					l.centrex=1
					l.centrey=-6
					l.scale=l.scale*0.35
					l.attscale=1.07
					l.attx=-3
					l.atty=5
					l.depgauche=graphics.newImageSheet( "goh/AnimVF/mechant/araignee/araigneewal.png", { width=266, height=190, numFrames=6,sheetContentWidth=798,sheetContentHeight=380 } )
					l.attgauche=graphics.newImageSheet( "goh/AnimVF/mechant/araignee/araigneeatt.png", { width=266, height=164, numFrames=8,sheetContentWidth=1064,sheetContentHeight=328 } )
				elseif k==1 then
					l.vie=1000
					l.vitesse=3
					l.message="Spider1: "
					l.tailleombre=2
					l.numframe=6
					l.typedep=3
					l.attaque=6
					l.agressivite=10
					l.argent=5
					l.centrex=3
					l.centrey=-12
					l.typedep=3
					l.scale=l.scale*0.7
					l.attx=-3
					l.atty=10
					l.depgauche=image[nb-1].depgauche
					l.attgauche=image[nb-1].attgauche
				elseif k==2 then
					l.vie=500
					l.attaque=18
					l.vitesse=1.5--1
					l.timeatt=1500
					l.agressivite=5
					l.message="Skeleton2: "--66284635
					l.porte=2
					l.numframe=6
					l.argent=3
					l.scale=l.scale*0.8
					l.centrex=14
					l.centrey=-2
					l.attscale=1.2
					l.atty=10
					l.attx=-7
					l.attanim=0
					l.finatt=7
					l.attanimordre={1,2,3,3,3,4,5,6,6}
					l.depgauche=graphics.newImageSheet( "goh/AnimVF/mechant/squelette2/skeleton2wal.png", { width=200, height=223, numFrames=4,sheetContentWidth=200,sheetContentHeight=892 } )
					l.attgauche=graphics.newImageSheet( "goh/AnimVF/mechant/squelette2/skeleton2att.png", { width=305, height=266, numFrames=6,sheetContentWidth=915,sheetContentHeight=532 } )
				elseif k==3 then
					l.vie=650
					l.attaque=24
					l.vitesse=4--1
					l.timeatt=1500
					l.agressivite=5
					l.porte=2
					l.message="SkeletonHorse: "
					l.numframe=7
					l.argent=4
					l.typedep=3
					l.centrex=8
					l.centrey=-9
					l.tailleombre=2
					l.timedep=0.8
					l.attscale=1.14
					l.attx=-8
					l.atty=10
					l.attanim=0
					l.finatt=7
					l.attanimordre={1,2,3,3,3,4,5,6,6,7}
					l.depgauche=graphics.newImageSheet( "goh/AnimVF/mechant/squelette_monte/skeletonwal.png", { width=236, height=278, numFrames=6,sheetContentWidth=708,sheetContentHeight=556 } )
					l.attgauche=graphics.newImageSheet( "goh/AnimVF/mechant/squelette_monte/skeletonatt.png", { width=266, height=272, numFrames=7,sheetContentWidth=1064,sheetContentHeight=544 } )
				elseif k==4 then
					l.typedep=1
					l.vie=300
					l.charge=70
					l.attaque=70
					l.porte=4
					l.vitesse=6--1
					l.timeatt=1500
					l.agressivite=40
					l.typedep=3
					l.message="SkeletonTraine: "
					l.numframe=10
					l.tailleombre=1.5
					l.argent=2
					l.centrey=-14
					l.centrex=-6
					l.timedep=0.8
					l.depgauche=graphics.newImageSheet( "goh/AnimVF/mechant/squelette_traine/squelette_trainemvmg.png", { width=416, height=210, numFrames=6,sheetContentWidth=832,sheetContentHeight=630 } )
					l.attgauche=graphics.newImageSheet( "goh/AnimVF/mechant/squelette_traine/squelette_traineattg.png", { width=516, height=367, numFrames=10,sheetContentWidth=1032,sheetContentHeight=1835 } )
					l.transition=l.attgauche
					l.transitionseq={name="transition",frames={1,2,2,2,2,3,3,3,3,3},time=500,loopCount=1}
				elseif k==5 then
					l.typedep=4
					l.vie=40000
					l.attaque=300
					l.porte=30
					l.vitesse=1.3
					l.timeatt=1500
					l.agressivite=40
					l.message="Dragon: "
					l.numframe=7
					l.argent=500
					l.centrey=-25
					l.centrex=-7
					l.tailleombre=4
					l.typedep=3
					l.timedep=0.2
					l.attscale=1.3
					l.attx=-21
					l.atty=19
					l.depgauche=graphics.newImageSheet( "goh/AnimVF/mechant/dragon/dragonwal.png", { width=416, height=433, numFrames=6,sheetContentWidth=1248,sheetContentHeight=866 } )
					l.attgauche=graphics.newImageSheet( "goh/AnimVF/mechant/dragon/dragonatt.png", { width=516, height=338, numFrames=7,sheetContentWidth=2064,sheetContentHeight=678 } )
				elseif k==6 then
					l.vie=40
					l.attaque=1
					l.vitesse=3--1
					l.agressivite=3
					l.message="Bowman: "
					l.timeatt=1200
					l.argent=5
					l.numframe=6
					l.centrex=6.5
					l.centrey=-2.5
					l.depgauche=graphics.newImageSheet( "goh/AnimVF/mechant/archer/archerwal.png", { width=143, height=156, numFrames=4,sheetContentWidth=143,sheetContentHeight=624 } )
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
					l.tir.attscale=0.88
					l.tir.timean=1
					l.tirnbfr=6
					l.atttir=graphics.newImageSheet( "goh/AnimVF/mechant/archer/archertir.png", { width=174, height=166, numFrames=6,sheetContentWidth=522,sheetContentHeight=332 } )
				elseif k==7 then
					l.vie=40
					l.attaque=1
					l.vitesse=3--1
					l.agressivite=3
					l.message="Long Bowman: "
					l.centrex=1
					l.centrey=-3--y inversé plus le y est "fort", plus le centre est bas 
					l.timeatt=1200
					l.argent=5
					l.numframe=6
					l.timedep=1
					l.tailleombre=1.2
					l.depgauche=graphics.newImageSheet( "goh/AnimVF/mechant/archerot/archerwal.png", { width=120, height=179, numFrames=4,sheetContentWidth=120,sheetContentHeight=716 } )
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
					l.tir.x=0.6
					l.tirnbfr=6
					l.atttir=graphics.newImageSheet( "goh/AnimVF/mechant/archerot/archertir.png", { width=166, height=186, numFrames=6,sheetContentWidth=498,sheetContentHeight=372 } )
				elseif k==8 then
					l.vie=150
					l.attaque=1
					l.vitesse=1--1
					l.agressivite=3
					l.message="Witch: "
					l.centrex=5--centre du corps du personnage
					l.centrey=-4.5--y inversé plus le y est "fort", plus le centre est bas 
					l.timeatt=1200
					l.attanim=1--0 pour ordre special
					l.argent=5
					l.timedep=1
					l.centrey=-2
					l.depgauche=graphics.newImageSheet( "goh/AnimVF/mechant/impie/impiewal.png", { width=120, height=223, numFrames=4,sheetContentWidth=120,sheetContentHeight=892 } )
					l.tir=1 --1
					l.tir={}
					l.tir.agressivite=true
					l.tir.projscale=0.05
					l.tir.proj="04"
					l.tir.porte=20000
					l.tir.attaque=15
					l.tir.vitesse=1.5
					l.tir.cadence=10
					l.tir.nbfleche=1
					l.tir.combat=1
					l.tir.x=0.2
					l.tir.y=2
					l.tir.attscale=0.94
					l.tir.timean=0.3
					l.tirnbfr=10
					l.atttir=graphics.newImageSheet( "goh/AnimVF/mechant/impie/impietir.png", { width=136, height=226, numFrames=10,sheetContentWidth=680,sheetContentHeight=452 } )
				elseif k==9 then
					l.vie=35
					l.attaque=1
					l.charge=2
					l.vitesse=6.5
					l.agressivite=8
					l.argent=3
					l.scale=l.scale*0.5
					l.message="Beast"
					l.tailleombre=0.4
					l.numframe=6
					l.attscale=1.06
					l.attx=-4
					l.atty=2
					l.depgauche=graphics.newImageSheet( "goh/AnimVF/mechant/beast/beastwal.png", { width=100, height=176, numFrames=4,sheetContentWidth=100,sheetContentHeight=704 } )
					l.attgauche=graphics.newImageSheet( "goh/AnimVF/mechant/beast/beastatt.png", { width=229, height=166, numFrames=6,sheetContentWidth=687,sheetContentHeight=332 } )
				end
			elseif j==3 then --zone de test (automatiquement dans la carte 3 vague 1)--pour savoir quel soldat correspond au quel tu clic dessus et tu as test 1..
				if k==0 then -- prendre cette partie est la copité coller dans les 5 persos dispo ci-dessous si besoin de soldat test en plus faire idem 
					l.vie=2000
					l.attaque=15
					l.charge=0
					l.vitesse=1.3
					l.agressivite=8
					l.attnbennemi=3
					l.message="Fat orc:"
					l.scale=l.scale*1.7
					l.numframe=6
					l.centrex=18
					l.centrey=-5
					l.timedep=0.8
					l.tailleombre=1.5
					l.attx=-10
					l.atty=12
					l.attanim=0
					l.finatt=7
					l.attanimordre={1,2,3,3,3,4,5,5,6}
					l.depgauche=graphics.newImageSheet( "goh/AnimVF/mechant/fat_orc/fat_orcwal.png", { width=143, height=136, numFrames=4,sheetContentWidth=143,sheetContentHeight=544 } )
					l.attgauche=graphics.newImageSheet( "goh/AnimVF/mechant/fat_orc/fat_orcatt.png", { width=201, height=166, numFrames=6,sheetContentWidth=603,sheetContentHeight=332 } )
				elseif k==1 then
				
				elseif k==2 then

				elseif k==3 then

				elseif k==4 then

				elseif k==5 then
					l.message="White walker: "
					l.centrex=8.5--centre du corps du personnage
					l.centrey=-2--y inversé plus le y est "fort", plus le centre est bas 
					l.vie=80
					l.attaque=3
					l.vitesse=1.3--1
					l.timeatt=1100
					l.agressivite=5
					l.charge=12
					l.numframe=6
					l.argent=3
					l.scale=l.scale*0.8
					l.tailleombre=0.8
					l.timedep=1
					l.attx=-17
					l.atty=3
					l.attanim=0
					l.finatt=7
					l.attanimordre={1,2,3,3,3,4,5,5,6}
					l.depgauche=graphics.newImageSheet( "goh/AnimVF/mechant/white_walker/white_walkerwal.png", { width=150, height=195, numFrames=4,sheetContentWidth=150,sheetContentHeight=780 } )
					l.attgauche=graphics.newImageSheet( "goh/AnimVF/mechant/white_walker/white_walkeratt.png", { width=268, height=216, numFrames=6,sheetContentWidth=804,sheetContentHeight=432 } )
				elseif k==6 then
					l.message="Touareg: "
					l.numframe=4
					l.vie=140
					l.attaque=4
					l.vitesse=2--1
					l.timeatt=1000
					l.agressivite=2
					l.scale=l.scale*0.9
					l.centrex=9
					l.centrey=-2
					l.argent=7
					l.attx=-4
					l.atty=3
					l.depgauche=graphics.newImageSheet( "goh/AnimVF/mechant/touareg/touaregwal.png", { width=150, height=151, numFrames=4,sheetContentWidth=150,sheetContentHeight=604 } )
					l.attgauche=graphics.newImageSheet( "goh/AnimVF/mechant/touareg/touaregatt.png", { width=216, height=203, numFrames=8,sheetContentWidth=864,sheetContentHeight=406 } )
				elseif k==7 then
					l.vie=15
					l.attaque=4
					l.vitesse=2--1
					l.timeatt=1500
					l.agressivite=40
					l.message="Skeleton: "
					l.numframe=4
					l.argent=3
					l.scale=l.scale*0.4
					l.centrex=8
					l.centrey=-1
					l.tailleombre=0.5
					l.attscale=1.59
					l.attx=-2.5
					l.atty=6
					l.attanim=0
					l.finatt=7
					l.attanimordre={1,2,3,3,3,4,5,6,6,7}
					l.depgauche=graphics.newImageSheet( "goh/AnimVF/mechant/squelette/skeletonwal.png", { width=250, height=250, numFrames=4,sheetContentWidth=250,sheetContentHeight=1000 } )
					l.attgauche=graphics.newImageSheet( "goh/AnimVF/mechant/squelette/skeletonatt.png", { width=316, height=264, numFrames=7,sheetContentWidth=1264,sheetContentHeight=528 } )
				elseif k==8 then
					l.vie=40
					l.attaque=3
					l.vitesse=1--1
					l.timeatt=1200
					l.agressivite=40
					l.message="zombie: "
					l.centrex=10--centre du corps du personnage
					l.centrey=-2--y inversé plus le y est "fort", plus le centre est bas 
					l.numframe=6
					l.argent=3
					l.scale=l.scale*0.7
					l.timedep=1
					l.tailleombre=0.8
					l.attscale=0.88
					l.attx=-8
					l.atty=3
					l.depgauche=graphics.newImageSheet( "goh/AnimVF/mechant/zombie/zombiewal.png", { width=155, height=166, numFrames=4,sheetContentWidth=155,sheetContentHeight=664 } )
					l.attgauche=graphics.newImageSheet( "goh/AnimVF/mechant/zombie/zombieatt.png", { width=290, height=196, numFrames=6,sheetContentWidth=870,sheetContentHeight=392 } )
				elseif k==9 then --mini zombie (same image than normal zombie)
					l.vie=40
					l.attaque=1
					l.vitesse=3--1
					l.agressivite=3
					l.message="Bombs man: "
					l.timeatt=1200
					l.argent=5
					l.numframe=6
					l.scale=l.scale*0.8
					l.centrey=-3
					l.centrex=2
					l.tailleombre=0.8
					l.depgauche=graphics.newImageSheet( "goh/AnimVF/mechant/bombs_man/bombs_manwal.png", { width=100, height=166, numFrames=4,sheetContentWidth=100,sheetContentHeight=664 } )
					l.tir=1 --1
					l.tir={}
					l.tir.projscale=0.2
					l.tir.proj="12"
					l.tir.porte=10000
					l.tir.attaque=20
					l.tir.vitesse=1.5
					l.tir.cadence=1000
					l.tir.nbfleche=1
					l.tir.combat=1
					l.tir.attscale=0.87
					l.tir.timean=1
					l.tir.impact=14
					l.tir.x=0.6
					l.tir.y=2
					l.tirnbfr=6
					l.atttir=graphics.newImageSheet( "goh/AnimVF/mechant/bombs_man/bombs_manatt.png", { width=216, height=206, numFrames=6,sheetContentWidth=648,sheetContentHeight=412 } )
				end
			elseif j==4 then
				if k==0 then
					l.message="Egyptien1: "
					l.vie=90
					l.attaque=4
					l.vitesse=3.2--1
					l.numframe=6--nombre d'image de l'animation d'attaque (5 par defaut)
					l.timeatt=1100
					l.agressivite=4
					l.numframe=6
					l.argent=3
					l.centrex=11.5
					l.centrey=-2
					l.attscale=1.3
					l.attx=-18
					l.atty=4
					l.attanim=0
					l.finatt=7
					l.attanimordre={1,2,3,3,3,4,5,5,6}
					l.attgauche=graphics.newImageSheet( "goh/AnimVF/mechant/egyptien/egyptian1att.png", { width=266, height=198, numFrames=6,sheetContentWidth=798,sheetContentHeight=396 } )
					l.depgauche=graphics.newImageSheet( "goh/AnimVF/mechant/egyptien/egyptian1wal.png", { width=156, height=196, numFrames=4,sheetContentWidth=156,sheetContentHeight=784 } )	
				elseif k==1 then
					l.message="Egyptien2: "
					l.centrex=17--centre du corps du personnage
					l.centrey=-3--y inversé plus le y est "fort", plus le centre est bas 
					l.vie=175
					l.attaque=7
					l.vitesse=2--1
					l.timeatt=1100
					l.argent=6
					l.agressivite=5
					l.numframe=6
					l.scale=l.scale*1.25
					l.centrex=6
					l.centrey=-2
					l.timedep=1.2
					l.attscale=0.8
					l.attx=-14
					l.atty=3
					l.attanim=0
					l.finatt=7
					l.attanimordre={1,2,3,3,3,4,5,5,6}
					l.attgauche=graphics.newImageSheet( "goh/AnimVF/mechant/egyptien/egyptian2att.png", { width=291, height=219, numFrames=6,sheetContentWidth=873,sheetContentHeight=438 } )
					l.depgauche=graphics.newImageSheet( "goh/AnimVF/mechant/egyptien/egyptian2wal.png", { width=100, height=131, numFrames=4,sheetContentWidth=100,sheetContentHeight=524 } )
					l.transition=graphics.newImageSheet("goh/AnimVF/mechant/egyptien/transition.png", { width=279, height=416, numFrames=10,sheetContentWidth=558,sheetContentHeight=2080 } )
					l.transscale=0.5
				elseif k==2 then
					l.message="Egyptien3: "
					l.centrex=11--centre du corps du personnage
					l.centrey=-3--y inversé plus le y est "fort", plus le centre est bas 
					l.vie=350
					l.attaque=14
					l.vitesse=1.3--1
					l.numframe=6
					l.timeatt=1100
					l.argent=8
					l.agressivite=5
					l.timedep=1.2
					l.centrex=8
					l.attx=-14
					l.atty=3
					l.attanim=0
					l.finatt=7
					l.attanimordre={1,2,3,3,3,4,5,5,6}
					l.attgauche=graphics.newImageSheet( "goh/AnimVF/mechant/egyptien/egyptian3att.png", { width=291, height=216, numFrames=6,sheetContentWidth=873,sheetContentHeight=432 } )
					l.depgauche=graphics.newImageSheet( "goh/AnimVF/mechant/egyptien/egyptian3wal.png", { width=150, height=179, numFrames=4,sheetContentWidth=150,sheetContentHeight=716 } )
					l.transition=graphics.newImageSheet("goh/AnimVF/mechant/egyptien/transition.png", { width=279, height=416, numFrames=10,sheetContentWidth=558,sheetContentHeight=2080 } )
					l.transscale=0.5
				elseif k==3 then
					l.message="Egyptien4: "
					l.centrex=11--centre du corps du personnage
					l.centrey=-3--y inversé plus le y est "fort", plus le centre est bas 
					l.vie=700
					l.attaque=28
					l.vitesse=0.7--1
					l.timeatt=1100
					l.argent=10
					l.agressivite=6
					l.numframe=6
					l.timedep=0.7
					l.centrex=7
					l.attx=-14
					l.atty=3
					l.attanim=0
					l.finatt=7
					l.attanimordre={1,2,3,3,3,4,5,5,6}
					l.attgauche=graphics.newImageSheet( "goh/AnimVF/mechant/egyptien/egyptian4att.png", { width=291, height=216, numFrames=6,sheetContentWidth=873,sheetContentHeight=432 } )
					l.depgauche=graphics.newImageSheet( "goh/AnimVF/mechant/egyptien/egyptian4wal.png", { width=150, height=179, numFrames=4,sheetContentWidth=150,sheetContentHeight=716 } )
					l.transition=graphics.newImageSheet("goh/AnimVF/mechant/egyptien/transition.png", { width=279, height=416, numFrames=10,sheetContentWidth=558,sheetContentHeight=2080 } )
					l.transscale=0.5
				elseif k==4 then
					l.vie=15
					l.attaque=3
					l.vitesse=8--1
					l.timeatt=1200
					l.agressivite=2
					l.message="Ape: "
					l.argent=2
					l.numframe=7
					l.scale=l.scale*0.5
					l.centrex=3
					l.centrey=-2
					l.attscale=1.7
					l.attx=-2
					l.atty=4
					l.depgauche=graphics.newImageSheet( "goh/AnimVF/mechant/panique/apewal.png", { width=196, height=185, numFrames=9,sheetContentWidth=588,sheetContentHeight=555 } )
					l.attgauche=graphics.newImageSheet( "goh/AnimVF/mechant/panique/apeatt.png", { width=196, height=164, numFrames=7,sheetContentWidth=784,sheetContentHeight=328 } )	
				elseif k==5 then
					-- l.message="Plante: "
					-- l.vie=300
					-- l.attaque=30
					-- l.vitesse=1--1
					-- l.numframe=7
					-- l.timeatt=1100
					-- l.typedep=2
					-- l.argent=25
					-- l.attgauche=graphics.newImageSheet( "AnimVF/mechant/plante/planteatg.png", { width=674, height=511, numFrames=7,sheetContentWidth=1348,sheetContentHeight=2044 } )
					-- l.depgauche=graphics.newImageSheet( "AnimVF/mechant/plante/plantemvmg.png", { width=686, height=520, numFrames=3,sheetContentWidth=1372,sheetContentHeight=1040 } )
				elseif k==6 then
					-- l.message="Tete: "
					-- l.vie=30
					-- l.attaque=15
					-- l.vitesse=1.3--1
					-- l.numframe=6
					-- l.timeatt=1100
					-- l.typedep=2
					-- l.argent=2
					-- l.attgauche=graphics.newImageSheet( "AnimVF/mechant/plante/teteatg.png", { width=486, height=320, numFrames=6,sheetContentWidth=972,sheetContentHeight=960 } )
					-- l.depgauche=graphics.newImageSheet( "AnimVF/mechant/plante/tetemvmg.png", { width=486, height=320, numFrames=3,sheetContentWidth=486,sheetContentHeight=960 } )
				elseif k==7 then
					-- l.message="Main: "
					-- l.vie=25
					-- l.attaque=28
					-- l.vitesse=1.3--1
					-- l.numframe=7
					-- l.timeatt=1100
					-- l.typedep=2
					-- l.argent=2
					-- l.attgauche=graphics.newImageSheet( "AnimVF/mechant/plante/mainatg.png", { width=486, height=320, numFrames=7,sheetContentWidth=972,sheetContentHeight=1280 } )
					-- l.depgauche=graphics.newImageSheet( "AnimVF/mechant/plante/mainmvmg.png", { width=486, height=320, numFrames=3,sheetContentWidth=486,sheetContentHeight=960 } )
				elseif k==8 then
					-- l.message="Pied: "
					-- l.vie=14
					-- l.attaque=28
					-- l.vitesse=1.7--1
					-- l.timeatt=1100
					-- l.numframe=6
					-- l.typedep=2
					-- l.argent=2
					-- l.attgauche=graphics.newImageSheet( "AnimVF/mechant/plante/piedatg.png", { width=486, height=320, numFrames=6,sheetContentWidth=972,sheetContentHeight=1280 } )
					-- l.depgauche=graphics.newImageSheet( "AnimVF/mechant/plante/piedmvmg.png", { width=486, height=320, numFrames=3,sheetContentWidth=486,sheetContentHeight=960} )
				elseif k==9 then
					l.message="Pharaon: "
					l.centrex=5--centre du corps du personnage
					l.centrey=-3--y inversé plus le y est "fort", plus le centre est bas 
					l.vie=700
					l.attaque=28
					l.vitesse=0.7--1
					l.timeatt=1100
					l.argent=10
					l.agressivite=6
					l.numframe=11
					l.timedep=0.8
					l.centrex=4
					l.attscale=0.95
					l.attx=-7.5
					l.atty=6
					l.attgauche=graphics.newImageSheet( "goh/AnimVF/mechant/egyptienboss/pharaonatt.png", { width=196, height=270, numFrames=11,sheetContentWidth=784,sheetContentHeight=810 } )
					l.depgauche=graphics.newImageSheet( "goh/AnimVF/mechant/egyptienboss/pharaonwal.png", { width=120, height=178, numFrames=4,sheetContentWidth=120,sheetContentHeight=712 } )
				end	
			elseif j==5 then
				if k==0 then-- pas calibré
				elseif k==1 then
					l.message="Pirate: "
					l.centrex=7--centre du corps du personnage
					l.centrey=-3--y inversé plus le y est "fort", plus le centre est bas 
					l.vie=70
					l.attaque=2
					l.vitesse=3
					l.agressivite=3
					l.timeatt=1100
					l.argent=2
					l.agressivite=6
					l.numframe=8
					l.attscale=1.23
					l.tailleombre=1.2
					l.attx=-6
					l.atty=7
					l.attgauche=graphics.newImageSheet( "goh/AnimVF/mechant/pirate/pirate1att.png", { width=174, height=166, numFrames=8,sheetContentWidth=696,sheetContentHeight=332 } )
					l.depgauche=graphics.newImageSheet( "goh/AnimVF/mechant/pirate/pirate1wal.png", { width=152, height=166, numFrames=4,sheetContentWidth=152,sheetContentHeight=664 } )	
				elseif k==2 then
					l.message="Pirate2: "
					l.centrex=4--centre du corps du personnage
					l.centrey=-3--y inversé plus le y est "fort", plus le centre est bas 
					l.vie=180
					l.attaque=5
					l.vitesse=1.5--1
					l.timeatt=1100
					l.argent=4
					l.agressivite=5
					l.numframe=4
					l.attscale=1.07
					l.tailleombre=1.2
					l.attx=-11
					l.atty=5
					l.attgauche=graphics.newImageSheet( "goh/AnimVF/mechant/pirate/pirate2att.png", { width=216, height=199, numFrames=6,sheetContentWidth=648,sheetContentHeight=398 } )
					l.depgauche=graphics.newImageSheet( "goh/AnimVF/mechant/pirate/pirate2wal.png", { width=120, height=185, numFrames=4,sheetContentWidth=120,sheetContentHeight=740 } )	
				elseif k==3 then
					l.message="Pirate3: "
					l.centrex=5--centre du corps du personnage
					l.centrey=-2.5--y inversé plus le y est "fort", plus le centre est bas 
					l.vie=1100
					l.attaque=9
					l.vitesse=1--1
					l.numframe=6
					l.timeatt=1100
					l.argent=8
					l.agressivite=6
					l.scale=l.scale*0.94
					l.attscale=1.23
					l.attx=-11
					l.atty=5
					l.attgauche=graphics.newImageSheet( "goh/AnimVF/mechant/pirate/pirate3att.png", { width=213, height=196, numFrames=6,sheetContentWidth=639,sheetContentHeight=392 } )
					l.depgauche=graphics.newImageSheet( "goh/AnimVF/mechant/pirate/pirate3wal.png", { width=150, height=228, numFrames=4,sheetContentWidth=150,sheetContentHeight=912 } )	
				end
			elseif j==6 then--cavalier gobelin 
				if k==0 then
					l.vie=50
					l.attaque=10
					l.vitesse=6.5--1
					l.agressivite=1
					l.charge=2
					l.message="Loup gob: "
					l.argent=10
					l.numframe=7
					l.scale=l.scale*0.75
					l.typedep=3
					l.centrex=4
					l.centrey=-4
					l.timedep=0.7
					l.attx=-12
					l.atty=7
					l.depgauche=graphics.newImageSheet( "goh/AnimVF/mechant/cavalier_gobelin/loupwal.png", { width=216, height=250, numFrames=6,sheetContentWidth=648,sheetContentHeight=500 } )
					l.attgauche=graphics.newImageSheet( "goh/AnimVF/mechant/cavalier_gobelin/loupatt.png", { width=282, height=216, numFrames=7,sheetContentWidth=1128,sheetContentHeight=432 } )
				elseif k==1 then
					l.vie=200
					l.attaque=23
					l.vitesse=4--1
					l.agressivite=4
					l.charge=4
					l.message="Ours gob: "
					l.argent=12
					l.numframe=7
					l.typedep=4
					l.timedep=0.3
					l.centrex=5
					l.centrey=-5
					l.tailleombre=1.5
					l.attscale=1.11
					l.attx=-18
					l.atty=9
					l.depgauche=graphics.newImageSheet( "goh/AnimVF/mechant/cavalier_gobelin/ourswal.png", { width=216, height=242, numFrames=8,sheetContentWidth=864,sheetContentHeight=484 } )
					l.attgauche=graphics.newImageSheet( "goh/AnimVF/mechant/cavalier_gobelin/oursatt.png", { width=268, height=216, numFrames=7,sheetContentWidth=1072,sheetContentHeight=432 } )
				elseif k==2 then
					l.vie=800
					l.attaque=20
					l.vitesse=4--1
					l.agressivite=4
					l.charge=30
					l.message="Rhino gob: "
					l.numframe=6
					l.argent=18
					l.typedep=5
					l.timedep=0.75
					l.centrex=9
					l.centrey=-5
					l.tailleombre=2
					l.attscale=0.9
					l.attx=-10
					l.atty=7
					l.attanim=0
					l.finatt=8
					l.attanimordre={1,2,3,4,4,4,5,6,6}
					l.depgauche=graphics.newImageSheet( "goh/AnimVF/mechant/cavalier_gobelin/rhinowal.png", { width=227, height=216, numFrames=9,sheetContentWidth=681,sheetContentHeight=648 } )
					l.attgauche=graphics.newImageSheet( "goh/AnimVF/mechant/cavalier_gobelin/rhinoatt.png", { width=216, height=296, numFrames=6,sheetContentWidth=648,sheetContentHeight=592 } )
				elseif k==3 then
					l.vie=60
					l.attaque=2
					l.vitesse=6--1
					l.agressivite=2
					l.charge=15
					l.message="Sanch gob: "
					l.numframe=6
					l.argent=10
					l.scale=l.scale*0.65
					l.typedep=4
					l.timedep=0.75
					l.centrex=4
					l.centrey=-10
					l.tailleombre=1
					l.attscale=0.94
					l.attx=-3
					l.atty=10
					l.attanim=0
					l.finatt=8
					l.attanimordre={1,2,3,4,4,4,5,6,6}
					l.depgauche=graphics.newImageSheet( "goh/AnimVF/mechant/cavalier_gobelin/sanchonwal.png", { width=216, height=231, numFrames=8,sheetContentWidth=864,sheetContentHeight=462 } )
					l.attgauche=graphics.newImageSheet( "goh/AnimVF/mechant/cavalier_gobelin/sanchonatt.png", { width=216, height=292, numFrames=6,sheetContentWidth=648,sheetContentHeight=584 } )
				elseif k==4 then	--cavalier humain
					l.vie=50
					l.attaque=10
					l.vitesse=6.5--1
					l.agressivite=1
					l.charge=2
					l.message="Loup hum: "
					l.numframe=6
					l.argent=10
					l.scale=l.scale*0.75
					l.typedep=3
					l.timedep=0.75
					l.centrex=7
					l.centrey=-6
					l.attx=-15
					l.atty=7
					l.depgauche=graphics.newImageSheet( "goh/AnimVF/mechant/cavalier_humain/loupwal.png", { width=246, height=256, numFrames=6,sheetContentWidth=738,sheetContentHeight=512 } )
					l.attgauche=graphics.newImageSheet( "goh/AnimVF/mechant/cavalier_humain/loupatt.png", { width=286, height=216, numFrames=6,sheetContentWidth=858,sheetContentHeight=432 } )
				elseif k==5 then
					l.vie=200 
					l.attaque=25
					l.vitesse=4.1--1
					l.agressivite=3
					l.charge=4
					l.message="Ours hum: "
					l.numframe=7
					l.argent=12
					l.typedep=4
					l.timedep=0.35
					l.centrex=6
					l.centrey=-4
					l.tailleombre=1.2
					l.attx=-18
					l.atty=7
					l.depgauche=graphics.newImageSheet( "goh/AnimVF/mechant/cavalier_humain/ourswal.png", { width=216, height=242, numFrames=8,sheetContentWidth=648,sheetContentHeight=726 } )
					l.attgauche=graphics.newImageSheet( "goh/AnimVF/mechant/cavalier_humain/oursatt.png", { width=261, height=216, numFrames=7,sheetContentWidth=1044,sheetContentHeight=432 } )
				elseif k==6 then
					l.vie=800
					l.attaque=24
					l.vitesse=4--1
					l.agressivite=4
					l.charge=30
					l.message="Rhino hum: "
					l.numframe=5
					l.argent=18
					l.typedep=5
					l.timedep=0.75
					l.centrex=11
					l.centrey=-4.5
					l.tailleombre=2
					l.attx=-9
					l.atty=7.5
					l.attanim=0
					l.finatt=8
					l.attanimordre={1,2,3,4,4,4,5,6,6}
					l.depgauche=graphics.newImageSheet( "goh/AnimVF/mechant/cavalier_humain/rhinowal.png", { width=246, height=225, numFrames=9,sheetContentWidth=738,sheetContentHeight=675 } )
					l.attgauche=graphics.newImageSheet( "goh/AnimVF/mechant/cavalier_humain/rhinoatt.png", { width=187, height=266, numFrames=5,sheetContentWidth=561,sheetContentHeight=532 } )
				elseif k==7 then
					l.vie=60
					l.attaque=2
					l.vitesse=6--1
					l.agressivite=2
					l.charge=15
					l.message="sanch hum: "
					l.numframe=7
					l.argent=10
					l.scale=l.scale*0.65
					l.typedep=4
					l.timedep=1
					l.centrey=-5
					l.centrex=3
					l.tailleombre=1.2
					l.attx=-4
					l.atty=7
					l.attanim=0
					l.finatt=8
					l.attanimordre={1,2,3,4,4,4,5,6,6}
					l.depgauche=graphics.newImageSheet( "goh/AnimVF/mechant/cavalier_humain/sanchonwal.png", { width=216, height=231, numFrames=8,sheetContentWidth=864,sheetContentHeight=462 } )
					l.attgauche=graphics.newImageSheet( "goh/AnimVF/mechant/cavalier_humain/sanchonatt.png", { width=216, height=259, numFrames=7 ,sheetContentWidth=864,sheetContentHeight=518} )
				elseif k==8 then
					l.typedep=0
					l.vie=2000
					l.attaque=75
					l.vitesse=1--1
					l.agressivite=5
					l.message="Young Golem: "
					l.numframe=10
					l.attanim=0--0 pour ordre special
					l.finatt=14
					l.attanimordre={1,2,3,4,5,6,6,6,6,6,5,4,7,8,9,9,9,9,9,9,9,1,1,1,1,1}
					l.argent=40
					l.typedep=2
					l.timedep=0.2
					l.tailleombre=2.5
					l.centrex=3
					l.centrey=-4
					l.attscale=1.66
					l.scale=l.scale*0.7
					l.attx=-15
					l.atty=30
					l.attanim=0
					l.finatt=8
					l.attanimordre={1,2,3,4,5,5,5,6,7,7}
					l.depgauche1=graphics.newImageSheet( "goh/AnimVF/mechant/golem/golem2gwal.png", { width=230, height=316, numFrames=10,sheetContentWidth=460,sheetContentHeight=1580 } )
					l.attgauche1=graphics.newImageSheet( "goh/AnimVF/mechant/golem/golem2gatt.png", { width=289, height=316, numFrames=7,sheetContentWidth=578,sheetContentHeight=1264 } )
					l.depgauche= graphics.newImageSheet( "goh/AnimVF/mechant/golem/golem3gwal.png", { width=240, height=316, numFrames=10,sheetContentWidth=480,sheetContentHeight=1580 } )
					l.attgauche= graphics.newImageSheet( "goh/AnimVF/mechant/golem/golem3gatt.png", { width=288, height=316, numFrames=7,sheetContentWidth=576,sheetContentHeight=1264 } )
				elseif k==9 then
					l.vie=7000
					l.attaque=30
					l.vitesse=4--1
					l.agressivite=10
					l.charge=60
					l.message="Rhino gob2: "
					l.argent=25
					l.typedep=5
					l.scale=l.scale*0.7
					l.timedep=0.6
					l.tailleombre=1.7
					l.centrex=7
					l.centrey=-3
					l.attscale=1.08
					l.attx=-8
					l.atty=6
					l.attanim=0
					l.finatt=8
					l.attanimordre={1,2,3,4,4,4,5,6,6}
					l.depgauche=graphics.newImageSheet( "goh/AnimVF/mechant/cavalier_gobelin/rhino2wal.png", { width=316, height=296, numFrames=9,sheetContentWidth=948,sheetContentHeight=888 } )
					l.attgauche=graphics.newImageSheet( "goh/AnimVF/mechant/cavalier_gobelin/rhino2att.png", { width=233, height=316, numFrames=6,sheetContentWidth=699,sheetContentHeight=632 } )
				end
			elseif j==7 then
				if k==0 then
					l.vie=40
					l.attaque=3
					l.vitesse=6.5--1
					l.agressivite=4
					l.charge=2
					l.message="Dog: "
					l.scale=l.scale*0.6
					l.argent=4
					l.numframe=5
					l.typedep=6
					l.tailleombre=0.6
					l.centrey=-3
					l.attx=-4
					l.atty=3.5
					l.depgauche2=graphics.newImageSheet( "goh/AnimVF/mechant/chien/chien2wal.png", { width=130, height=128, numFrames=5,sheetContentWidth=130,sheetContentHeight=640 } )
					l.attgauche2=graphics.newImageSheet( "goh/AnimVF/mechant/chien/chien2att.png", { width=150, height=129, numFrames=5,sheetContentWidth=150,sheetContentHeight=645 } )
					l.depgauche1=graphics.newImageSheet( "goh/AnimVF/mechant/chien/chien1wal.png", { width=130, height=128, numFrames=5,sheetContentWidth=130,sheetContentHeight=640 } )
					l.attgauche1=graphics.newImageSheet( "goh/AnimVF/mechant/chien/chien1att.png", { width=150, height=129, numFrames=5,sheetContentWidth=150,sheetContentHeight=645 } )
					l.depgauche=graphics.newImageSheet( "goh/AnimVF/mechant/chien/chien3wal.png", { width=130, height=128, numFrames=5,sheetContentWidth=130,sheetContentHeight=640 } )
					l.attgauche=graphics.newImageSheet( "goh/AnimVF/mechant/chien/chien3att.png", { width=150, height=129, numFrames=5,sheetContentWidth=150,sheetContentHeight=645 } )
				elseif k==1 then
					l.typedep=3
					l.vie=400
					l.attaque=9
					l.vitesse=2.5--1
					l.agressivite=4
					l.charge=2
					l.message="Lion: "
					l.centrey=-7--y inversé plus le y est "fort", plus le centre est bas 
					l.argent=6
					l.numframe=5
					l.timeatt=1200
					l.timedep=0.4
					l.centrex=-1
					l.centrey=-6
					l.scale=l.scale*0.55
					l.tailleombre=1.7
					l.attscale=1.14
					l.attx=-6
					l.atty=10
					l.depgauche=graphics.newImageSheet( "goh/AnimVF/mechant/lion/lionwal.png", { width=278, height=216, numFrames=6,sheetContentWidth=834,sheetContentHeight=432 } )
					l.attgauche=graphics.newImageSheet( "goh/AnimVF/mechant/lion/lionatt.png", { width=319, height=216, numFrames=5,sheetContentWidth=319,sheetContentHeight=1080 } )
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
					l.scale=l.scale*0.7
					l.centrex=1
					l.centrey=-2
					l.depgauche=graphics.newImageSheet( "goh/AnimVF/mechant/kamikaze/kamikazemvmg.png", { width=115, height=216, numFrames=4,sheetContentWidth=115,sheetContentHeight=864 } )
					l.attgauche=l.depgauche --graphics.newImageSheet( "AnimVF/mechant/lion/lionatg.png", { width=686, height=420, numFrames=4,sheetContentWidth=1372,sheetContentHeight=840 } )
					l.transition=graphics.newImageSheet("goh/effets/kamikaze.png",{width=256,height=256,numFrames=6,sheetContentWidth=1536,sheetContentHeight=256})
					l.transitionseq={name="transition",frames= {1,2,3,4,5,6,6},time=1000,loopCount=1}
				elseif k==3 then
					-- sphere
				elseif k==4 then
					-- automate
				elseif k==5 then
					l.message="Amazon: "
					l.vie=400
					l.attaque=3
					l.vitesse=1.7--1
					l.timeatt=1100
					l.numframe=6
					l.argent=5
					l.scale=l.scale*0.8
					l.centrex=9
					l.centrey=-1
					l.regenevie=1 -- regeneration des vies des soldats dans le cercle cas special pas regeneration classique
					l.timedep=1
					l.attscale=1.08
					l.attx=-5
					l.atty=3
					l.attanim=0
					l.finatt=7
					l.attanimordre={1,2,2,2,3,4,5,5,6}
					l.attgauche=graphics.newImageSheet( "goh/AnimVF/mechant/amazone/amazoneatt.png", { width=266, height=259, numFrames=6,sheetContentWidth=798,sheetContentHeight=518 } )
					l.depgauche=graphics.newImageSheet( "goh/AnimVF/mechant/amazone/amazonewal.png", { width=170, height=266, numFrames=4,sheetContentWidth=170,sheetContentHeight=1064} )
				end
			end
			if l.depgauche==nil then
				l.numframe=6
				print("bug à corriger chargementbis 853")
				l.depgauche=graphics.newImageSheet( "goh/AnimVF/mechant/assassin/assasinwal.png", { width=120, height=158, numFrames=4,sheetContentWidth=120,sheetContentHeight=632 } )
				l.attgauche=graphics.newImageSheet( "goh/AnimVF/mechant/assassin/assasinatt.png", { width=166, height=175, numFrames=6,sheetContentWidth=498,sheetContentHeight=350 } )
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

	-- if true and issimulator then --mettre true pour generer fiche sur chaque perso
	-- 	local function espaceafaire(vie,alpha)
	-- 		local m1=" "
	-- 		if vie<10 then
	-- 			m1=m1.." "
	-- 		end
	-- 		if vie<100 and alpha<2 then
	-- 			m1=m1.." "
	-- 		end
	-- 		if vie<1000 and alpha==0 then
	-- 			m1=m1.." "
	-- 		end
	-- 		return m1
	-- 	--end
	-- 	end
	-- 	print("init")
	-- 	local nouveauperso=false ----------------------------------mettre sur true quand on ajoute ou supprime un soldat
	-- 	--fiche personnage
	-- 	--Nom vie attaque sec, agressiviter vitesse. Pour l'attaque le calcul prend en compte la charge et le nb dd'ennemi attaquer en meme temps
	-- 	local espace=false
	-- 	local nb=0
	-- 	local compteurnbvariable=0
	-- 	local i=1 --test=1
	-- 	for i=1,1,1 do
	-- 		--print("ici1")
	-- 		for j=0,19,1 do
	-- 			--print("ici2")
	-- 			for k=0,9,1 do
	-- 				--print("ici3")
	-- 				nb=k+j*10+i*100
	-- 				if espace==false then
	-- 					if k==0 then
	-- 						--print("classe "..j)
	-- 						espace=true
	-- 					end
	-- 				end
	-- 				--print("nb:"..nb)
	-- 				if tabsoldexist[nb] or (nouveauperso and image[nb].message~="soldat: ") then
	-- 					if true then --image[nb].message~="soldat: " then
	-- 						compteurnbvariable=compteurnbvariable+27
	-- 						if image[nb].tir~=0 then
	-- 							compteurnbvariable=compteurnbvariable+11
	-- 						end
	-- 						espace=false
	-- 						local attsec=mathfloor(image[nb].attaque*1000/image[nb].timeatt*(image[nb].attnbennemi^0.7)+image[nb].charge/4)
	-- 						if image[nb].tir~=0 then
	-- 							attsec=mathfloor(attsec+image[nb].tir.attaque*image[nb].tir.nbfleche*1000/(800*image[nb].tir.timean+image[nb].tir.cadence))
	-- 						end
	-- 						local agressivite=mathfloor(image[nb].blocnbennemi+image[nb].agressivite)
	-- 						local puissance=mathfloor((attsec+image[nb].vie/10+image[nb].vitesse/5)/20*2)/2+1
	-- 						if nb>240 and nb<244 then -- pour les egyptiens
	-- 							puissance=puissance+image[nb-1].puissance
	-- 						end
	-- 						local message=image[nb].message
	-- 						if nb==275 then
	-- 							puissance=puissance*2 -- prise en compte du bonus de regeneration des vies des soldats autour
	-- 						end
	-- 						if nb>=280 and nb<290 then
	-- 							local niveausquelette=nb-248
	-- 							attsec=mathfloor(image[237].attaque*1000*niveausquelette/image[237].timeatt*(image[237].attnbennemi^0.7)+image[237].charge/4)
	-- 							puissance=mathfloor((attsec+image[237].vie*(2^(niveausquelette-1))/10+image[nb].vitesse/niveausquelette/5)/20*2)/2+1
	-- 							image[nb].vitesse=image[237].vitesse/niveausquelette
	-- 							image[nb].scale=image[237].scale*mathsqrt(niveausquelette)
	-- 							agressivite=mathfloor(image[237].blocnbennemi+image[237].agressivite)
	-- 							message=image[237].message.." "..niveausquelette
	-- 						end
	-- 						if nb==224 then
	-- 							puissance=puissance+image[222].puissance
	-- 						end
	-- 						if nb==272 then
	-- 							puissance=30
	-- 						end
	-- 						image[nb].puissance=puissance
	-- 						image[nb].attsec=attsec
	-- 						local m=string.len(message)
	-- 						-- if puissance>9 then
	-- 						-- 	m=m+1
	-- 						-- end
	-- 						while m<13 do
	-- 							message=message.." "
	-- 							m=m+1
	-- 						end
							
	-- 						local m1=espaceafaire(image[nb].vie,0)
	-- 						local m2=espaceafaire(attsec,1)
	-- 						local m3=espaceafaire(agressivite,2)
	-- 						local m4=" "
	-- 						local m0="   "
	-- 						local m5=""
	-- 						if puissance~=mathfloor(puissance) then
	-- 							m0=" "
	-- 						end
	-- 						if puissance>9 then
	-- 							m0="  "
	-- 						end
	-- 						if puissance~=mathfloor(puissance) and puissance>9 then
	-- 							m0=""
	-- 						end
	-- 						if mathfloor(image[nb].vitesse)==image[nb].vitesse then
	-- 							m4=".0 "
	-- 						end
	-- 						local ratioimg=mathfloor(image[nb].scale/0.09*10)*0.1
	-- 						if ratioimg==mathfloor(ratioimg) then
	-- 							m5=".0"
	-- 						end
	-- 						print(" ID:"..nb.." niveau:"..puissance..m0..message.."vie:"..image[nb].vie..m1.."att:"..attsec..m2.."agre:"..agressivite..m3.."vitesse:"..image[nb].vitesse..m4.." Ratio "..ratioimg..m5)
	-- 					end
	-- 				end
	-- 				if nb==199 then
	-- 					print("          orientation==1 (unitées mechantes)")
	-- 					print("classe 0")
	-- 				end
	-- 			end
	-- 		end
	-- 	end
	-- 	print(" ")
	-- 	print("il y a "..compteurnbvariable.." variables pour tout les soldats")
	-- 	compteurnbvariable=nil
	-- 	for itest1=1,2,1 do
	-- 		for j=0,9,1 do
	-- 			for k=0,9,1 do
	-- 				nb=k+j*10+itest1*100
	-- 				if tabsoldexist[nb] or (nouveauperso and image[nb].message~="soldat: ") then
	-- 					if true then --image[nb].message~="soldat: " then
	-- 						local m0="   "
	-- 						if image[nb].puissance~=mathfloor(image[nb].puissance) then
	-- 							m0=" "
	-- 						end
	-- 						print("image["..nb.."].puissance="..image[nb].puissance..m0.."image["..nb.."].attsec="..image[nb].attsec) --copier l'affichage et le collé en dessous
	-- 						--print("image["..nb.."].attsec="..image[nb].attsec)
	-- 					end
	-- 				end
	-- 			end
	-- 		end
	-- 	end
	-- 	for i=280,289 do
	-- 		image[i]={}
	-- 		if i>280 then
	-- 			image[i].puissance=image[i-1].puissance*3
	-- 			image[i].attsec=image[i-1].attsec*2
	-- 		else
	-- 			image[i].puissance=image[237].puissance*3
	-- 			image[i].attsec=image[237].attsec*2
	-- 		end
	-- 		print("image["..i.."]={} image["..i.."].puissance="..image[i].puissance.."   image["..i.."].attsec="..image[i].attsec)
	-- 	end
	-- 	if true and nouveauperso then
	-- 		local chainecaract="tabsoldexist={"
	-- 		for i=1,2,1 do
	-- 			for j=0,9,1 do
	-- 				for k=0,9,1 do
	-- 					nb=k+j*10+i*100
	-- 					chainecaract=chainecaract.."["..nb.."]="
	-- 					if image[nb].message~="soldat: " then
	-- 						chainecaract=chainecaract.."true"
	-- 					else
	-- 						chainecaract=chainecaract.."false"
	-- 					end
	-- 					if nb~=299 then
	-- 						chainecaract=chainecaract..","
	-- 					else
	-- 						chainecaract=chainecaract.."}"
	-- 					end
	-- 				end
	-- 			end
	-- 		end
	-- 		print(chainecaract)
	-- 		local tabsoldexist=chainecaract 
	-- 	end
	-- end
	-- --mettre le resultat des calculs ici
	-- print("get time fin "..system.getTimer())

image[101].puissance=2.5 image[101].attsec=30
image[102].puissance=1.5 image[102].attsec=9
image[103].puissance=2.5 image[103].attsec=19
image[104].puissance=2.5 image[104].attsec=22
image[105].puissance=1.5 image[105].attsec=13
image[106].puissance=2   image[106].attsec=25
image[107].puissance=2.5 image[107].attsec=30
image[108].puissance=3   image[108].attsec=36
image[112].puissance=3   image[112].attsec=21
image[113].puissance=4.5 image[113].attsec=36
image[114].puissance=5.5 image[114].attsec=50
image[116].puissance=2   image[116].attsec=23
image[117].puissance=2.5 image[117].attsec=30
image[118].puissance=3   image[118].attsec=36
image[122].puissance=3   image[122].attsec=30
image[123].puissance=3   image[123].attsec=30
image[124].puissance=4   image[124].attsec=41
image[126].puissance=401   image[126].attsec=8000
image[127].puissance=4001   image[127].attsec=80000
image[128].puissance=8001.5 image[128].attsec=160000
image[140].puissance=1.5 image[140].attsec=7
image[141].puissance=1.5 image[141].attsec=6
image[142].puissance=1.5 image[142].attsec=12
image[143].puissance=1.5 image[143].attsec=9
image[145].puissance=2   image[145].attsec=19
image[146].puissance=2   image[146].attsec=18
image[170].puissance=2   image[170].attsec=9
image[171].puissance=3   image[171].attsec=23
image[172].puissance=3   image[172].attsec=22
image[173].puissance=2   image[173].attsec=11
image[174].puissance=3   image[174].attsec=28
image[175].puissance=3   image[175].attsec=27
image[176].puissance=3   image[176].attsec=8
image[177].puissance=6   image[177].attsec=52
image[178].puissance=18.5 image[178].attsec=278
image[179].puissance=87.5 image[179].attsec=459
image[200].puissance=1   image[200].attsec=1
image[201].puissance=2   image[201].attsec=7
image[202].puissance=1.5 image[202].attsec=7
image[203].puissance=1   image[203].attsec=3
image[204].puissance=27   image[204].attsec=20
image[205].puissance=2   image[205].attsec=10
image[206].puissance=1.5 image[206].attsec=7
image[207].puissance=1.5 image[207].attsec=7
image[208].puissance=2   image[208].attsec=10
image[209].puissance=1.5 image[209].attsec=10
image[210].puissance=1   image[210].attsec=2
image[211].puissance=1   image[211].attsec=2
image[212].puissance=1.5 image[212].attsec=8
image[213].puissance=1   image[213].attsec=2
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
image[225].puissance=911   image[225].attsec=200
image[226].puissance=1   image[226].attsec=1
image[227].puissance=1.5 image[227].attsec=12
image[228].puissance=4.5 image[228].attsec=60
image[229].puissance=1   image[229].attsec=1
image[230].puissance=13   image[230].attsec=40
image[235].puissance=1.5 image[235].attsec=5
image[236].puissance=1.5 image[236].attsec=4
image[237].puissance=1   image[237].attsec=2
image[238].puissance=1   image[238].attsec=2
image[239].puissance=1.5 image[239].attsec=11
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



-- if issimulator and true then
-- 	local ombreimg=display.newImage(imbouton.ombresld,1)
-- 	for i=100,300 do
-- 		if tabsoldexist[i] then
-- 			--print("i "..i)
-- 			local imagedutruc=display.newImage(image[i].depgauche,1)
-- 			local bas=mathfloor((imagedutruc.height*0.5*image[i].scale-10-ombreimg.height*0.2*0.22*image[i].tailleombre)*100)*0.01
-- 			local atty=0
-- 			if image[i].attgauche~=nil then
-- 				local imagedutrucatt=display.newImage(image[i].attgauche,1)
-- 				atty=mathfloor((-((imagedutrucatt.height-imagedutruc.height)*image[i].attscale*image[i].scale)*0.25-image[i].centrey)*100)*0.01 --bas au lieu de centrey
-- 				imagedutrucatt:removeSelf()
-- 				--image[i].atty=atty
-- 			end
-- 			imagedutruc:removeSelf()
-- 			print("image["..i.."].centrey="..bas.." \timage["..i.."].atty="..atty)--.."\tdif centrey"..(mathfloor((image[i].centrey-bas)*100)*0.01).."\tdif atty "..(mathfloor((image[i].atty-atty)*100)*0.01))
-- 			--if i==179 then
-- 			--	image[i].atty=-atty
-- 			--end

-- 			--image[i].centrey=bas
-- 		end
-- 	end
-- 	ombreimg:removeSelf()
-- 	--image[204].centrey=21
-- end
-- if issimulator and true then -- genere une fiche de chaque soldat avec tout les spec
-- 	print("ID\tHP\t\tATK\tCHARGE\tVITESSE\tagressivity\tnbAtkEnnemi\tblocnbennemi\tname")
-- 	for i=100,300 do
-- 		if tabsoldexist[i] then
-- 			local stringaff=""
-- 			local vie=""..image[i].vie
-- 			if image[i].vie<1000 then
-- 				vie=vie.." "
-- 			end
-- 			if image[i].vie<100 then
-- 				vie=vie.." "
-- 			end
-- 			if image[i].vie<10 then
-- 				vie=vie.." "
-- 			end
-- 			stringaff=i..",\t"..vie.."\t"..image[i].attsec.."\t"..image[i].charge.."\t"..image[i].vitesse.."\t"..image[i].agressivite.."\t"..image[i].attnbennemi.."\t"..image[i].blocnbennemi.."\t"..image[i].message
-- --			stringaff="id "..i.."\tHP "..vie.."\tatk "..image[i].attsec.."\tcharge "..image[i].charge.."\tvitesse "..image[i].vitesse.."\tagressivity "..image[i].agressivite.."\tnbAtkEnnemi "..image[i].attnbennemi.."\tblocnbennemi "..image[i].blocnbennemi.."\tName "..image[i].message
-- 			print(stringaff)
-- 		end
-- 	end
-- end
chargementdesfichier[1]=1
end
return (t)
--beast fat_orc