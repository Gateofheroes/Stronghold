local t = {}--chargement de donnée pour les gentils et une partie pour les mechants+ une parties des images
t.chargementtergoh = function ()
	--cochargementter=coroutine.create(function ()
	print("chargementtergoh")
	if issimulator then
		local memUsed = (collectgarbage("count")) / 1000
		local texUsed = system.getInfo( "textureMemoryUsed" ) / 1000000
		print("\n---------MEMORY USAGE INFORMATION chargement avant---------")
		print("System Memory Used:", string.format("%.03f", memUsed), "Mb")
		print("Texture Memory Used:", string.format("%.03f", texUsed), "Mb")
		print("------------------------------------------\n")
	end
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
							--l.attanim=2
						end
						if j==7 then -- pour que ca soit chargé rapidement pour les menu de dev qu'on puisse voir combien attaque chaque general, pour modifie valeur aller dans chargement
							if k==0 then-- humain
								l.centrex=0
								l.centrey=-5
								l.tailleombre=1.5
								l.attx=-14
								l.atty=3
								l.attanim=0
								l.finatt=7
								l.attanimordre={1,2,3,4,5,6,7,8}
								l.depgauche=graphics.newImageSheet( "goh/AnimVF/gentil/General/spartiate/humain1wal.png", { width=104, height=190, numFrames=4 ,sheetContentWidth=104,sheetContentHeight=760} )
								l.attgauche=graphics.newImageSheet( "goh/AnimVF/gentil/General/spartiate/humain1att.png", { width=216, height=165, numFrames=8,sheetContentWidth=432,sheetContentHeight=660 } )--{ width=497, height=450, numFrames=10 } )
							elseif k==1 then--humain 2
								l.centrex=3
								l.centrey=-4
								l.tailleombre=1.7
								l.timedep=1.2
								l.attscale=0.89
								l.attx=-8
								l.atty=18
								l.attanim=0
								l.finatt=9
								l.attanimordre={1,1,2,2,2,3,4,5,5}
								l.depgauche=graphics.newImageSheet( "goh/AnimVF/gentil/General/humain2/humain2wal.png", { width=100, height=161, numFrames=4,sheetContentWidth=100,sheetContentHeight=644} )
								l.attgauche=graphics.newImageSheet( "goh/AnimVF/gentil/General/humain2/humain2att.png",  { width=246, height=266, numFrames=5,sheetContentWidth=738,sheetContentHeight=532 } )--{ width=497, height=450, numFrames=10 } )
							elseif k==2 then --humain 3
								l.centrex=-3
								l.centrey=-5
								l.tailleombre=2.2
								l.tir.attscale=0.8
								l.tir.y=-5
								l.tir.x=0.8
								l.timedep=1.2
								l.attx=-12
								l.atty=6
								l.depgauche=graphics.newImageSheet( "goh/AnimVF/gentil/General/humain3/humain3wal.png", { width=120, height=152, numFrames=4,sheetContentWidth=120,sheetContentHeight=608} )
								l.attgauche=graphics.newImageSheet( "goh/AnimVF/gentil/General/humain3/humain3att.png",  { width=201, height=166, numFrames=5,sheetContentWidth=603,sheetContentHeight=332 } )--{ width=497, height=450, numFrames=10 } )
								l.atttir=graphics.newImageSheet( "goh/AnimVF/gentil/General/humain3/humain3tir.png", { width=166, height=352, numFrames=10,sheetContentWidth=332,sheetContentHeight=1760 } )
							elseif k==3 then -- elfe
								l.centrex=-1
								l.centrey=-5
								l.tailleombre=1.5
								l.attscale=1.14
								l.attx=-2
								l.atty=6
								l.attanim=0
								l.finatt=12
								l.attanimordre={1,1,2,2,3,4,4,5,5,6,6,7,8,8}
								l.depgauche=graphics.newImageSheet( "goh/AnimVF/gentil/General/elfe/elf1wal.png", { width=80, height=180, numFrames=4,sheetContentWidth=80,sheetContentHeight=720 } )
								l.attgauche=graphics.newImageSheet( "goh/AnimVF/gentil/General/elfe/elf1att.png", { width=166, height=184, numFrames=8,sheetContentWidth=664,sheetContentHeight=368 } ) -- { width=497, height=450, numFrames=10 } )
							elseif k==4 then -- Necromancer
								l.centrex=2
								l.centrey=-5
								l.tailleombre=2.2
								l.timedep=1
								l.attx=-16
								l.atty=6
								l.attanim=0
								l.finatt=5
								l.attanimordre={1,2,2,2,3,4,4,5}
								l.depgauche=graphics.newImageSheet( "goh/AnimVF/gentil/General/elfe3/elf3wal.png", { width=99, height=166, numFrames=4,sheetContentWidth=99,sheetContentHeight=664 } )
								l.attgauche=graphics.newImageSheet( "goh/AnimVF/gentil/General/elfe3/elf3att.png", { width=218, height=246, numFrames=5,sheetContentWidth=654,sheetContentHeight=492 } ) -- { width=497, height=450, numFrames=10 } )
								-- l.atttir=graphics.newImageSheet( "AnimVF/gentil/General/elfe2/elfetir.png", { width=202, height=250, numFrames=3,sheetContentWidth=202,sheetContentHeight=750 } )
							elseif k==5 then -- elfe 2
								l.centrex=7
								l.centrey=-10
								l.tailleombre=2.8
								l.typedep=-1
								l.vitesse=9
								l.timedep=0.8
								l.attscale=1.2
								l.attx=-11
								l.atty=10
								l.tir.attscale=1.06
								l.tirnbfr=6
								l.attanim=0
								l.finatt=6
								l.attanimordre={1,2,3,3,3,4,5,5,6}
								l.depgauche=graphics.newImageSheet( "goh/AnimVF/gentil/General/elfech/elf2wal.png", { width=266, height=257, numFrames=7,sheetContentWidth=1064,sheetContentHeight=514 } )
								l.attgauche=graphics.newImageSheet( "goh/AnimVF/gentil/General/elfech/elf2att.png", { width=266, height=234, numFrames=6,sheetContentWidth=798,sheetContentHeight=468 } ) -- { width=497, height=450, numFrames=10 } )
								l.atttir=graphics.newImageSheet( "goh/AnimVF/gentil/General/elfech/elf2tir.png", { width=191, height=266, numFrames=6,sheetContentWidth=573,sheetContentHeight=532 } )
							elseif k==6 then--geant
								l.centrex=-4
								l.centrey=-4
								l.tailleombre=1.6
								l.timedep=1
								l.attscale=1.08
								l.attx=-6
								l.atty=8
								l.attanim=0
								l.finatt=6
								l.attanimordre={1,2,3,3,3,4,5,5,6}
								l.depgauche=graphics.newImageSheet( "goh/AnimVF/gentil/General/geant1/geant1wal.png", { width=130, height=177, numFrames=4,sheetContentWidth=130,sheetContentHeight=708 } )
								l.attgauche=graphics.newImageSheet( "goh/AnimVF/gentil/General/geant1/geant1att.png", { width=216, height=232, numFrames=6,sheetContentWidth=648,sheetContentHeight=464 } )
							elseif k==7 then -- geant 2
								l.centrex=-6
								l.centrey=-5
								l.tailleombre=2
								l.attscale=1.05
								l.attx=-4
								l.atty=10
								l.attanim=0
								l.finatt=6
								l.attanimordre={1,2,3,3,3,4,5,5,6}
								l.depgauche=graphics.newImageSheet( "goh/AnimVF/gentil/General/geant2/geant2wal.png", { width=150, height=190, numFrames=4,sheetContentWidth=150,sheetContentHeight=760 } )
								l.attgauche=graphics.newImageSheet( "goh/AnimVF/gentil/General/geant2/geant2att.png", { width=216, height=236, numFrames=6,sheetContentWidth=648,sheetContentHeight=472 } )
							elseif k==8 then -- geant 3
								l.centrex=-7
								l.centrey=-4
								l.tailleombre=1.8
								l.attx=-4
								l.atty=10
								l.timedep=1.2
								l.attanim=0
								l.finatt=6
								l.attanimordre={1,2,3,3,3,4,5,5,6}
								l.depgauche=graphics.newImageSheet( "goh/AnimVF/gentil/General/geant3/geant3wal.png", { width=178, height=216, numFrames=4,sheetContentWidth=178,sheetContentHeight=864 } )
								l.attgauche=graphics.newImageSheet( "goh/AnimVF/gentil/General/geant3/geant3att.png", { width=246, height=266, numFrames=6,sheetContentWidth=738,sheetContentHeight=532 } )
							elseif k==9 then -- oliphan
								l.centrex=12
								l.centrey=-12
								l.tailleombre=3
								l.attscale=0.9
								l.tir.x=0.7
								l.tir.y=0
								l.attx=-10
								l.atty=15
								l.tirnbfr=6.1
								l.depgauche=graphics.newImageSheet( "goh/AnimVF/gentil/General/oliphant/oliphantwal.png", { width=200, height=268, numFrames=4,sheetContentWidth=200,sheetContentHeight=1072 } )
								l.attgauche=graphics.newImageSheet( "goh/AnimVF/gentil/General/oliphant/oliphantatt.png", { width=266, height=371, numFrames=7,sheetContentWidth=1064,sheetContentHeight=742 } )
								l.atttir=graphics.newImageSheet( "goh/AnimVF/gentil/General/oliphant/oliphanttir.png", { width=266, height=326, numFrames=6,sheetContentWidth=798,sheetContentHeight=652 } )
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
								l.timeatt=1000
								l.centrex=2
								l.centrey=-10
								l.tailleombre=1.5
								l.atty=5
								l.message=texttraduction.soldat[11]..": " --"Soldier: "
								l.depgauche=graphics.newImageSheet( "goh/AnimVF/gentil/Infanterie/soldat1/soldat1wal.png", { width=94, height=166, numFrames=4,sheetContentWidth=94,sheetContentHeight=664 } )
								l.attgauche=graphics.newImageSheet( "goh/AnimVF/gentil/Infanterie/soldat1/soldat1att.png", { width=87, height=166, numFrames=5,sheetContentWidth=87,sheetContentHeight=830 } ) --260
							elseif k==2 then
								l.vie=63
								l.attaque=9
								l.vitesse=3.5--1
								l.numframe=5
								l.timeatt=1000
								l.centrex=2
								l.centrey=-4
								l.tailleombre=1.5
								l.atty=5
								l.message=texttraduction.soldat[12]..": " --"Militiaman: "
								l.depgauche=graphics.newImageSheet( "goh/AnimVF/gentil/Infanterie/soldat2/soldat2wal.png", { width=123, height=166, numFrames=4,sheetContentWidth=123,sheetContentHeight=664 } )
								l.attgauche=graphics.newImageSheet( "goh/AnimVF/gentil/Infanterie/soldat2/soldat2att.png", { width=119, height=196, numFrames=5,sheetContentWidth=119,sheetContentHeight=980 } )
							elseif k==3 then --soldat 3 humain
								l.vie=121
								l.attaque=19
								l.vitesse=3.5--1
								l.numframe=7
								l.timeatt=1000
								l.argent=10
								l.centrex=8
								l.centrey=-4
								l.tailleombre=1.5
								l.atty=5
								l.message=texttraduction.soldat[13]..": " --"Swordsman: "
								l.depgauche=graphics.newImageSheet( "goh/AnimVF/gentil/Infanterie/soldat3/soldat3wal.png", { width=180, height=179, numFrames=4,sheetContentWidth=180,sheetContentHeight=716 } )
								l.attgauche=graphics.newImageSheet( "goh/AnimVF/gentil/Infanterie/soldat3/soldat3att.png", { width=226, height=220, numFrames=7,sheetContentWidth=904,sheetContentHeight=440 } )
							elseif k==4 then --soldat 4 humain 
								l.vie=160
								l.attaque=34
								l.vitesse=3.5--1
								l.numframe=8--nombre d'image de l'animation d'attaque (5 par defaut)
								l.timeatt=1500 -- 1100
								l.argent=10--argent gagner lors de la mort de l'unité--pour gain specifique au soldat faire pareil qu'au dessus
								l.agressivite=2
								l.scale=l.scale*1.15
								l.centrex=0
								l.centrey=-4
								l.tailleombre=1.4
								l.atty=5
								l.message=texttraduction.soldat[14]..": " --"Champion: "
								l.depgauche=graphics.newImageSheet( "goh/AnimVF/gentil/Infanterie/soldat4/soldat4wal.png", { width=76, height=173, numFrames=4,sheetContentWidth=76,sheetContentHeight=692 } )
								l.attgauche=graphics.newImageSheet( "goh/AnimVF/gentil/Infanterie/soldat4/soldat4att.png", { width=216, height=215, numFrames=8,sheetContentWidth=432,sheetContentHeight=860 } )
							elseif k==5 then
								l.vie=10
								l.attaque=1
								l.vitesse=3--1
								l.agressivite=3
								l.message="Bowman1: "
								l.timeatt=1200
								l.argent=5
								l.depgauche=graphics.newImageSheet( "goh/AnimVF/mechant/archer/archerwal.png", { width=143, height=156, numFrames=4,sheetContentWidth=143,sheetContentHeight=624 } )
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
								l.atttir=graphics.newImageSheet( "goh/AnimVF/mechant/archer/archertir.png", { width=174, height=166, numFrames=6,sheetContentWidth=522,sheetContentHeight=332 } )
							elseif k==6 then
								l.vie=20
								l.attaque=1
								l.vitesse=3--1
								l.agressivite=3
								l.message="Bowman2: "
								l.timeatt=1200
								l.argent=5
								l.depgauche=graphics.newImageSheet( "goh/AnimVF/mechant/archer/archerwal.png", { width=143, height=156, numFrames=4,sheetContentWidth=143,sheetContentHeight=624 } )
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
								l.tirnbfr=6
								l.atttir=graphics.newImageSheet( "goh/AnimVF/mechant/archer/archertir.png", { width=174, height=166, numFrames=6,sheetContentWidth=522,sheetContentHeight=332 } )
							elseif k==7 then
								l.vie=30
								l.attaque=1
								l.vitesse=3--1
								l.agressivite=3
								l.message="Bowman3: "
								l.timeatt=1200
								l.argent=5
								l.depgauche=graphics.newImageSheet( "goh/AnimVF/mechant/archerot/archerwal.png", { width=120, height=179, numFrames=4,sheetContentWidth=120,sheetContentHeight=716 } )
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
								l.tirnbfr=6
								l.atttir=graphics.newImageSheet( "goh/AnimVF/mechant/archerot/archertir.png", { width=166, height=186, numFrames=6,sheetContentWidth=498,sheetContentHeight=372 } )
							elseif k==8 then
								l.vie=50
								l.attaque=1
								l.vitesse=3--1
								l.agressivite=3
								l.message="Bowman4: "
								l.timeatt=1200
								l.argent=5
								l.depgauche=graphics.newImageSheet( "goh/AnimVF/mechant/archerot/archerwal.png", { width=120, height=179, numFrames=4,sheetContentWidth=120,sheetContentHeight=716 } )
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
								l.tirnbfr=6
								l.atttir=graphics.newImageSheet( "goh/AnimVF/mechant/archerot/archertir.png", { width=166, height=186, numFrames=6,sheetContentWidth=498,sheetContentHeight=372 } )
							end
							--vie=vie+bonus
						elseif j==1 then
							if k<=4 then
								l.blocnbennemi=3
								l.attnbennemi=3
							end
							if k==0 then
							elseif k==2 then
								l.vie=237
								l.attaque=9
								l.vitesse=0.8--1
								l.timeatt=1000
								l.charge=10
								l.blocnbennemi=2--nombre d'ennemi bloquer par le soldat
								l.attnbennemi=3--nombre d'ennemi qu'il peut attaquer en meme temps
								l.message=texttraduction.soldat[15]..": " --"Butcher: "
								l.numframe=5		
								l.scale=l.scale*0.92
								l.centrex=2--centre du corps du personnage
								l.centrey=-4--y inversé plus le y est "fort", plus le centre est bas 
								l.tailleombre=2
								l.timedep=0.6
								l.attscale=0.9
								l.atty=7
								l.attanim=0
								l.finatt=10
								l.attanimordre={1,1,1,2,2,3,3,3,3,4,5,5}
								l.depgauche=graphics.newImageSheet( "goh/AnimVF/gentil/Geant/geant1/geant1wal.png", { width=150, height=240, numFrames=4,sheetContentWidth=150,sheetContentHeight=960 } )
								l.attgauche=graphics.newImageSheet( "goh/AnimVF/gentil/Geant/geant1/geant1att.png", { width=200, height=360, numFrames=5,sheetContentWidth=200,sheetContentHeight=1800 } )
							elseif k==3 then
								l.vie=402
								l.attaque=16
								l.vitesse=0.8
								l.timeatt=1300
								l.charge=15
								l.blocnbennemi=3--nombre d'ennemi bloquer par le soldat
								l.attnbennemi=4--nombre d'ennemi qu'il peut attaquer en meme temps
								l.message=texttraduction.soldat[16]..": " --"Ogre: "
								l.numframe=6
								l.centrex=-3--centre du corps du personnage
								l.centrey=-4--y inversé plus le y est "fort", plus le centre est bas 
								l.tailleombre=2.3
								l.scale=l.scale*1.08
								l.timedep=0.5
								l.attscale=1.17
								l.atty=7
								l.attanim=0
								l.finatt=9
								l.attanimordre={1,2,2,3,3,3,3,3,4,5,5,5,5,6}
								l.depgauche=graphics.newImageSheet( "goh/AnimVF/gentil/Geant/geant2/geant2wal.png", { width=150, height=202, numFrames=4,sheetContentWidth=150,sheetContentHeight=808 } )
								l.attgauche=graphics.newImageSheet( "goh/AnimVF/gentil/Geant/geant2/geant2att.png", {width=184, height=236, numFrames=6,sheetContentWidth=552,sheetContentHeight=472 } )
							elseif k==4 then
								l.vie=457
								l.attaque=22
								l.vitesse=0.8
								l.timeatt=1500
								l.charge=20
								l.blocnbennemi=4--nombre d'ennemi bloquer par le soldat
								l.attnbennemi=5--nombre d'ennemi qu'il peut attaquer en meme temps
								l.message=texttraduction.soldat[17]..": " --"Skinner: "
								l.numframe=5
								l.centrex=-7--centre du corps du personnage
								l.centrey=-5--y inversé plus le y est "fort", plus le centre est bas 
								l.tailleombre=2.3
								l.scale=l.scale*1.2
								l.timedep=0.4
								l.atty=7
								l.attanim=0
								l.finatt=10
								l.attanimordre={1,1,1,2,2,3,3,3,3,4,5,5}
								l.depgauche=graphics.newImageSheet( "goh/AnimVF/gentil/Geant/geant3/geant3wal.png", { width=150, height=181, numFrames=4,sheetContentWidth=150,sheetContentHeight=724 } )
								l.attgauche=graphics.newImageSheet( "goh/AnimVF/gentil/Geant/geant3/geant3att.png", { width=200, height=253, numFrames=5,sheetContentWidth=200,sheetContentHeight=1265 } )
							elseif k==6 then
								l.vie=20
								l.attaque=1
								l.vitesse=3--1
								l.agressivite=3
								l.message="Bombs man: "
								l.timeatt=1200
								l.argent=5
								l.depgauche=graphics.newImageSheet( "goh/AnimVF/mechant/bombs_man/bombs_manwal.png", { width=100, height=166, numFrames=4,sheetContentWidth=100,sheetContentHeight=664 } )
								l.tir=1 --1
								l.tir={}
								l.tir.projscale=0.2
								l.tir.proj="12"
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
								l.tirnbfr=6
								l.atttir=graphics.newImageSheet( "goh/AnimVF/mechant/bombs_man/bombs_manatt.png", { width=216, height=206, numFrames=6,sheetContentWidth=648,sheetContentHeight=412 } )
							elseif k==7 then
								l.vie=30
								l.attaque=1
								l.vitesse=3--1
								l.agressivite=3
								l.message="Bombs man: "
								l.timeatt=1200
								l.effetdure=2--14--variable non fonctionnelle permet de faire varier la dure de l'effet de variation de hauteur pendant que le personnage marche
								l.argent=5
								l.depgauche=graphics.newImageSheet( "goh/AnimVF/mechant/bombs_man/bombs_manwal.png", { width=100, height=166, numFrames=4,sheetContentWidth=100,sheetContentHeight=664 } )
								l.tir=1 --1
								l.tir={}
								l.tir.projscale=0.2
								l.tir.proj="12"
								l.tir.porte=20000
								l.tir.attaque=55
								l.tir.vitesse=1.5
								l.tir.cadence=1000
								l.tir.nbfleche=1
								l.tir.combat=1
								l.tir.attscale=1
								l.tir.timean=1
								l.tir.impact=14
								l.tirnbfr=6
								l.atttir=graphics.newImageSheet( "goh/AnimVF/mechant/bombs_man/bombs_manatt.png", { width=216, height=206, numFrames=6,sheetContentWidth=648,sheetContentHeight=412 } )
							elseif k==8 then
								l.vie=50
								l.attaque=1
								l.vitesse=3--1
								l.agressivite=3
								l.message="Bombs man: "
								l.timeatt=1200
								l.argent=5
								l.depgauche=graphics.newImageSheet( "goh/AnimVF/mechant/bombs_man/bombs_manwal.png", { width=100, height=166, numFrames=4,sheetContentWidth=100,sheetContentHeight=664 } )
								l.tir=1 --1
								l.tir={}
								l.tir.projscale=0.2
								l.tir.proj="12"
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
								l.tirnbfr=6
								l.atttir=graphics.newImageSheet( "goh/AnimVF/mechant/bombs_man/bombs_manatt.png", { width=216, height=206, numFrames=6,sheetContentWidth=648,sheetContentHeight=412 } )
							end
						elseif j==2 then
							if k==0 then
							
							elseif k==2 then
								l.vie=171
								l.attaque=19 --32
								l.vitesse=7--1
								l.timeatt=700 --1200
								l.charge=15
								l.message=texttraduction.soldat[18]..": " --"Squire: "
								l.numframe=5
								l.scale=l.scale*0.84
								l.centrex=8
								l.centrey=-11
								l.tailleombre=2
								l.typedep=1
								l.attscale=1.14
								l.atty=10
								l.attx=-10
								l.depgauche=graphics.newImageSheet( "goh/AnimVF/gentil/Cavalerie/cavalier1/cav1wal.png", { width=200, height=232, numFrames=4,sheetContentWidth=200,sheetContentHeight=928 } )
								l.attgauche=graphics.newImageSheet( "goh/AnimVF/gentil/Cavalerie/cavalier1/cav1att.png", { width=200, height=233, numFrames=5,sheetContentWidth=200,sheetContentHeight=1165 } )
							elseif k==3 then
								l.vie=176
								l.attaque=27 --35
								l.vitesse=7--1
								l.timeatt=1000 --1300
								l.charge=15
								l.message=texttraduction.soldat[19]..": " --"Knight: "
								l.numframe=5
								l.scale=l.scale*0.84
								l.centrex=9
								l.centrey=-9
								l.tailleombre=2.3
								l.typedep=1
								l.attscale=1.14
								l.atty=10
								l.attx=-10
								l.attanim=0
								l.finatt=9
								l.attanimordre={1,1,1,1,1,1,2,3,4,4,4,3,3,5,5,5,5,5,5}
								l.depgauche=graphics.newImageSheet( "goh/AnimVF/gentil/Cavalerie/cavalier2/cav2wal.png", { width=250, height=229, numFrames=4,sheetContentWidth=250,sheetContentHeight=916 } )
								l.attgauche=graphics.newImageSheet( "goh/AnimVF/gentil/Cavalerie/cavalier2/cav2att.png", { width=266, height=184, numFrames=5,sheetContentWidth=266,sheetContentHeight=920 } )
							elseif k==4 then
								l.vie=270 
								l.attaque=39 --49
								l.vitesse=7--1
								l.timeatt=1200 --1400
								l.charge=24
								l.message=texttraduction.soldat[20]..": " --"Paladin: "
								l.numframe=6
								l.centrex=14
								l.centrey=-9
								l.tailleombre=2.5
								l.typedep=1
								l.attscale=1.14
								l.atty=12
								l.attx=-18
								l.attanim=0
								l.finatt=13
								l.attanimordre={1,1,1,1,1,1,2,3,4,4,4,5,5,6,6,6,6,6,6,6,6,6}
								l.depgauche=graphics.newImageSheet( "goh/AnimVF/gentil/Cavalerie/cavalier3/cav3wal.png", { width=250, height=226, numFrames=4,sheetContentWidth=250,sheetContentHeight=904 } )
								l.attgauche=graphics.newImageSheet( "goh/AnimVF/gentil/Cavalerie/cavalier3/cav3att.png", { width=266, height=197, numFrames=6,sheetContentWidth=266,sheetContentHeight=1182} )
							elseif k==6 then
								l.message="kamikaze1"
								l.vie=50
								l.attaque=400 -- 1000 revoir leveldesign du level10 et 11
								l.blocnbennemi=40
								l.vitesse=3
								l.argent=5
								l.agressivite=10
								l.timeatt=50
								l.depgauche=graphics.newImageSheet( "goh/AnimVF/mechant/kamikaze/kamikazemvmg.png", { width=115, height=216, numFrames=4,sheetContentWidth=115,sheetContentHeight=864 } )
								l.attgauche=l.depgauche --graphics.newImageSheet( "AnimVF/mechant/lion/lionatg.png", { width=686, height=420, numFrames=4,sheetContentWidth=1372,sheetContentHeight=840 } )
								l.transition=graphics.newImageSheet("goh/effets/kamikaze.png",{width=256,height=256,numFrames=6,sheetContentWidth=1536,sheetContentHeight=256})
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
								l.depgauche=graphics.newImageSheet( "goh/AnimVF/mechant/kamikaze/kamikazemvmg.png", { width=115, height=216, numFrames=4,sheetContentWidth=115,sheetContentHeight=864 } )
								l.attgauche=l.depgauche --graphics.newImageSheet( "AnimVF/mechant/lion/lionatg.png", { width=686, height=420, numFrames=4,sheetContentWidth=1372,sheetContentHeight=840 } )
								l.transition=graphics.newImageSheet("goh/effets/kamikaze.png",{width=256,height=256,numFrames=6,sheetContentWidth=1536,sheetContentHeight=256})
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
								l.depgauche=graphics.newImageSheet( "goh/AnimVF/mechant/kamikaze/kamikazemvmg.png", { width=115, height=216, numFrames=4,sheetContentWidth=115,sheetContentHeight=864 } )
								l.attgauche=l.depgauche --graphics.newImageSheet( "AnimVF/mechant/lion/lionatg.png", { width=686, height=420, numFrames=4,sheetContentWidth=1372,sheetContentHeight=840 } )
								l.transition=graphics.newImageSheet("goh/effets/kamikaze.png",{width=256,height=256,numFrames=6,sheetContentWidth=1536,sheetContentHeight=256})
								l.transitionseq={name="transition",frames= {1,2,3,4,5,6,6},time=1000,loopCount=1}
							end
						elseif j==4 then
							if k==0 then
								l.message=texttraduction.soldat[21]..": " --"RenfInf 1: "
								l.vie=33
								l.attaque=7
								l.timeatt=1000
								l.numframe=5
								l.centrex=0
								l.centrey=-4
								l.tailleombre=1.4
								l.timedep=1
								l.attx=-8
								l.atty=3
								l.attscale=1.22
								l.depgauche=graphics.newImageSheet( "goh/AnimVF/gentil/Renfort/Renfort_Inf/renfort1wal.png", { width=135, height=166, numFrames=4,sheetContentWidth=135,sheetContentHeight=664 } )
								l.attgauche=graphics.newImageSheet( "goh/AnimVF/gentil/Renfort/Renfort_Inf/renfort1att.png", { width=150, height=149, numFrames=5,sheetContentWidth=150,sheetContentHeight=745 } )
							elseif k==1 then
								l.message=texttraduction.soldat[22]..": " --"RenfInf 2: "
								l.vie=39
								l.attaque=7
								l.timeatt=1100
								l.numframe=7
								l.centrex=14
								l.centrey=-3
								l.tailleombre=1.4
								l.timedep=1
								l.attx=-19
								l.atty=3
								l.attscale=0.9
								l.depgauche=graphics.newImageSheet( "goh/AnimVF/gentil/Renfort/Renfort_Inf/renfort2wal.png", { width=192, height=196, numFrames=4,sheetContentWidth=384,sheetContentHeight=392 } )
								l.attgauche=graphics.newImageSheet( "goh/AnimVF/gentil/Renfort/Renfort_Inf/renfort2att.png", { width=264, height=216, numFrames=7,sheetContentWidth=1056,sheetContentHeight=432 } )
							elseif k==2 then
								l.message=texttraduction.soldat[23]..": " --"RenfInf 3: "
								l.vie=44
								l.attaque=9
								l.timeatt=700
								l.numframe=4
								l.centrex=7
								l.centrey=-3
								l.tailleombre=1.4
								l.timedep=1
								l.attx=-3
								l.atty=5
								l.depgauche=graphics.newImageSheet( "goh/AnimVF/gentil/Renfort/Renfort_Inf/renfort3wal.png", { width=156, height=166, numFrames=4,sheetContentWidth=156,sheetContentHeight=664 } )
								l.attgauche=graphics.newImageSheet( "goh/AnimVF/gentil/Renfort/Renfort_Inf/renfort3att.png", { width=155, height=146, numFrames=4,sheetContentWidth=155,sheetContentHeight=584 } )
							elseif k==3 then
								l.message=texttraduction.soldat[24]..": " --"RenfArc 1: "
								l.vie=22
								l.tir=1
								l.tir={}
								l.tir.projscale=0.1 --taille du projectile
								l.tir.proj="12" --image du projectile
								l.tir.porte=30000
								l.tir.attaque=9
								l.tir.vitesse=1
								l.tir.cadence=2000
								l.tir.nbfleche=1
								l.tir.combat=0
								l.tir.timean=1
								l.tir.attscale=0.9
								l.tir.y=0
								l.tir.x=0.66
								l.tirnbfr=5
								l.timeatt=1500
								l.centrex=3
								l.centrey=-4
								l.tailleombre=1.3
								l.depgauche=graphics.newImageSheet( "goh/AnimVF/gentil/Renfort/Renfort_Tir/archer3wal.png", { width=100, height=141, numFrames=4,sheetContentWidth=100,sheetContentHeight=564 } )
								l.atttir=graphics.newImageSheet( "goh/AnimVF/gentil/Renfort/Renfort_Tir/archer3att.png", { width=196, height=152, numFrames=5,sheetContentWidth=588,sheetContentHeight=304 } )	
								-- l.attgauche=graphics.newImageSheet( "AnimVF/gentil/General/spartiate/spartiateatg.png", { width=497, height=450, numFrames=9,sheetContentWidth=1491,sheetContentHeight=1350 } ) -- { width=497, height=450, numFrames=10 } )				
							elseif k==4 then

							elseif k==6 then
								l.message=texttraduction.soldat[25]..": " --"RenfArc 2: "
								l.tir=1
								l.vie=25
								l.tir={}
								l.tir.projscale=0.1
								l.tir.proj="02"
								l.tir.porte=30000
								l.tir.attaque=15
								l.tir.vitesse=1
								l.tir.cadence=2000
								l.tir.nbfleche=1
								l.tir.combat=0
								l.tir.timean=0.5
								l.tir.attscale=1
								l.tir.y=0
								l.tir.x=0.73
								l.tirnbfr=6
								l.centrex=6
								l.centrey=-4
								l.tailleombre=1.4
								l.depgauche=graphics.newImageSheet( "goh/AnimVF/gentil/Renfort/Renfort_Tir/archer1wal.png", { width=136, height=146, numFrames=4,sheetContentWidth=136,sheetContentHeight=584 } )
								l.atttir=graphics.newImageSheet( "goh/AnimVF/gentil/Renfort/Renfort_Tir/archer1att.png", { width=196, height=133, numFrames=6,sheetContentWidth=588,sheetContentHeight=266 } )
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
								l.tir.attscale=0.9
								l.tir.timean=1
								l.tir.y=0
								l.tir.x=0.75
								l.tirnbfr=5
								l.centrex=5
								l.centrey=-4
								l.tailleombre=1.5
								l.depgauche=graphics.newImageSheet( "goh/AnimVF/gentil/Renfort/Renfort_Tir/archer2wal.png", { width=100, height=158, numFrames=4,sheetContentWidth=100,sheetContentHeight=632 } )
								l.atttir=graphics.newImageSheet( "goh/AnimVF/gentil/Renfort/Renfort_Tir/archer2att.png", { width=266, height=177, numFrames=5,sheetContentWidth=798,sheetContentHeight=354 } )
							end
						elseif j==8 then -- mine
							-- rempli dans le fichier mine
						end

						if l.depgauche==nil then
							--l.numframe=6
							l.depgauche=graphics.newImageSheet( "goh/AnimVF/mechant/assassin/assasinwal.png", { width=120, height=158, numFrames=4,sheetContentWidth=120,sheetContentHeight=632 } )
							l.attgauche=graphics.newImageSheet( "goh/AnimVF/mechant/assassin/assasinatt.png", { width=166, height=175, numFrames=6,sheetContentWidth=498,sheetContentHeight=350 } )
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