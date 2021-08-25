local t = {}--chargement de donnée pour les gentils et une partie pour les mechants+ une parties des images

t.chargementgoh = function ()
if issimulator then
	local memUsed = (collectgarbage("count")) / 1000
	local texUsed = system.getInfo( "textureMemoryUsed" ) / 1000000
	local textaffprint="\n---------MEMORY USAGE INFORMATION chargement avant---------"
	textaffprint=textaffprint.."\nSystem Memory Used:"..string.format("%.03f", memUsed).."Mb"
	textaffprint=textaffprint.."\nTexture Memory Used:"..string.format("%.03f", texUsed).."Mb"
	textaffprint=textaffprint.."\n------------------------------------------"
	print(textaffprint)
	--print("\n---------MEMORY USAGE INFORMATION chargement avant---------")
	--print("System Memory Used:", string.format("%.03f", memUsed), "Mb")
	--print("Texture Memory Used:", string.format("%.03f", texUsed), "Mb")
	--print("------------------------------------------\n")
end
tabsoldexist={[100]=false,[101]=true,[102]=true,[103]=true,[104]=true,[105]=true,[106]=true,[107]=true,[108]=true,[109]=false,[110]=false,[111]=false,[112]=true,[113]=true,[114]=true,[115]=false,[116]=true,[117]=true,[118]=true,[119]=false,[120]=false,[121]=false,[122]=true,[123]=true,[124]=true,[125]=false,[126]=true,[127]=true,[128]=true,[129]=false,[130]=false,[131]=false,[132]=false,[133]=false,[134]=false,[135]=false,[136]=false,[137]=false,[138]=false,[139]=false,[140]=true,[141]=true,[142]=true,[143]=true,[144]=false,[145]=true,[146]=true,[147]=false,[148]=false,[149]=false,[150]=false,[151]=false,[152]=false,[153]=false,[154]=false,[155]=false,[156]=false,[157]=false,[158]=false,[159]=false,[160]=false,[161]=false,[162]=false,[163]=false,[164]=false,[165]=false,[166]=false,[167]=false,[168]=false,[169]=false,[170]=true,[171]=true,[172]=true,[173]=true,[174]=true,[175]=true,[176]=true,[177]=true,[178]=true,[179]=true,[180]=false,[181]=false,[182]=false,[183]=false,[184]=false,[185]=false,[186]=false,[187]=false,[188]=false,[189]=false,[190]=false,[191]=false,[192]=false,[193]=false,[194]=false,[195]=false,[196]=false,[197]=false,[198]=false,[199]=false,[200]=true,[201]=true,[202]=true,[203]=true,[204]=true,[205]=true,[206]=true,[207]=true,[208]=true,[209]=true,[210]=true,[211]=true,[212]=true,[213]=true,[214]=true,[215]=true,[216]=true,[217]=true,[218]=true,[219]=true,[220]=true,[221]=true,[222]=true,[223]=true,[224]=true,[225]=true,[226]=true,[227]=true,[228]=true,[229]=true,[230]=true,[231]=false,[232]=false,[233]=false,[234]=false,[235]=true,[236]=true,[237]=true,[238]=true,[239]=true,[240]=true,[241]=true,[242]=true,[243]=true,[244]=true,[245]=false,[246]=false,[247]=false,[248]=false,[249]=true,[250]=false,[251]=true,[252]=true,[253]=true,[254]=false,[255]=false,[256]=false,[257]=false,[258]=false,[259]=false,[260]=true,[261]=true,[262]=true,[263]=true,[264]=true,[265]=true,[266]=true,[267]=true,[268]=true,[269]=true,[270]=true,[271]=true,[272]=true,[273]=false,[274]=false,[275]=true,[276]=false,[277]=false,[278]=false,[279]=false,[280]=false,[281]=false,[282]=false,[283]=false,[284]=false,[285]=false,[286]=false,[287]=false,[288]=false,[289]=false,[290]=false,[291]=false,[292]=false,[293]=false,[294]=false,[295]=false,[296]=false,[297]=false,[298]=false,[299]=false}
	local nb=0
	image={}
	for i=1,2,1 do
		for j=0,9,1 do
			for k=0,9,1 do
				nb=k+j*10+i*100
				if tabsoldexist[nb] then -- a enlever des qu'on ajoute un soldat
				-- print("nb "..nb)
				local l={}--par defaut
				l.scale=0.3
				--variable par defaut
				l.typedep=0 -- 0 pour deplacement normal, 1 pour cavalerie gentil, 2 pour cavalerie mechante, 4 pour dragon(9 img)
				l.transition=nil --graphics.newImageSheet( "AnimVF/mechant/egyptien/transition2.png", { width=486, height=320, numFrames=3 } ) -- transition de mort du sokdat
				l.vie=100 
				l.attaque=10
				l.vitesse=1--1
				l.numframe=5--nombre d'image de l'animation d'attaque (5 par defaut)
				l.timeatt=800--duree de l'attaque en ms--800 par defaut-------------------------hugo si tu veux faire varier la durée d'attaque d'une unitée tu ajoute cette ligne apres "isoldat[numero].numframe=6" ou "isoldat[numero].vitesse=1" avec un espace
				l.argent=10--argent gagner lors de la mort de l'unité--pour gain specifique au soldat faire pareil qu'au des
				l.regene=35--duree de la regeneration du soldat en 0.5 sec
				l.agressivite=2
				l.charge=0
				l.regenevie=0--regeneration des vies quand les personnages sont statiques(gentils)
				l.blocnbennemi=1--nombre d'ennemi bloquer par le soldat -- correspond pour le kamikaze au rayon de l'attaque
				l.attnbennemi=1--nombre d'ennemi qu'il peut attaquer en meme temps
				l.message="soldat: "
				l.timedep=1.5--coefficient du temps de l'animation plus le nb est grand(max20 )plus k'anim sera rapide min0.05
				l.centrex=0--centre du corps du personnage
				l.centrey=0
				l.tailleombre=1
				l.effetdure=20--14--variable non fonctionnelle permet de faire varier la dure de l'effet de variation de hauteur pendant que le personnage marche
				l.effetimpact=0.09--22--0.44--0.22--permet de faire varier la position en ordonnee du perso pendant qu'il avance pour qu'on ait pas l'impression qu'il se dep)lace lineairement
				l.attanim=1--0 ordre choisi,1 anim ordre normal, 2 ordre inverse
				l.tir=0
				l.eff3D=1--variation de l'impact de 3D agit en multiplication
				l.attscale=1--variation de la taille de l'anim entre le deplacement et l'attaque
				l.attx=0--deplacement de l'anim d'attaque pour qu'elle soit superposé a celle de deplacement
				l.atty=0--deplacement de l'anim d'attaque pour qu'elle soit superposé a celle de deplacement -- si le deplacement ce fait uniquement vers le haut(arme vers le haut alors tailledep/tailleatt*scale/2=atty)
				l.porte=1 --agit sous forme de multiplier
				l.attsec=0
					--exemple des variable de tir (il faut tout les mettre car il n'y a pas de valeur par defaut)
					-- l.tir=1 --unité peu tirer si 1
					-- l.tir={} --obligatoire
					-- l.tir.projscale=0.1 --taille du projectile
					-- l.tir.proj="02"	--image de projectile (meme que celle des bat)
					-- l.tir.porte=50000	--porte de tir
					-- l.tir.attaque=5	--attaque par projectile
					-- l.tir.vitesse=1	--vitesse du projectile
					-- l.tir.cadence=2000 --cadence de tir
					-- l.tir.nbfleche=1 --nombre de fleche par volee
					-- l.tir.combat=0 --si a 1 il peut se battre au corps a corps (met les anim de combat rapprocher)
					-- l.tir.attscale=1 --taille de l'anim de tir
					-- l.tir.timean=1 --800ms de base et  multiplie la duree par la valeurduree de l'animation 
					-- l.tir.y=0 -- variation de la postion de l'animation
					-- l.tir.x=0
				image[nb]=l
				end
		 	end
		 end
	end
	local nb=170
	for k=0,9 do -- ici generaux pour que les données soient lisible depuis le menudedev value ici et image dans chargementter
		local l=image[nb]--par defaut
		l.regenevie=0.2--regeneration des vies quand les personnages sont statiques(gentils)
		l.attanim=2
		l.regene=90
		if k==0 then-- humain 
			l.message=texttraduction.soldat[1]..": " --"Spartan: "
			l.vie=150--0
			l.attaque=18
			l.vitesse=3
			l.timedep=1.5
			l.numframe=8
			l.timeatt=2000
			l.scale=l.scale*1.07
		elseif k==1 then--humain 2
			l.message=texttraduction.soldat[2]..": " --"Kingsguard: "
			l.vie=230--0
			l.attaque=28
			l.vitesse=2
			l.numframe=5
			l.timeatt=1200
			l.attanim=0--0 pour ordre special
			l.atty=-6.4
			l.timedep=0.6
			l.finatt=23
			l.attanimordre={1,1,1,2,3,3,3,3,4,4,4,4,4,4,5,5,5,6,6,6,6,7,4,4,4,4,4}--ordre special
			l.scale=l.scale*1.15
		elseif k==2 then --humain 3
			l.message=texttraduction.soldat[3]..": " --"Warpriest: "
			l.vie=200--0
			l.attaque=33
			l.vitesse=2
			l.tir=1 --1
			l.tir={}
				l.tir.projscale=0.2
				l.tir.proj="12"
				l.tir.porte=30000
				l.tir.attaque=1
				l.tir.vitesse=1.5
				l.tir.cadence=1500
				l.tir.nbfleche=1
				l.tir.combat=1
				l.tir.attscale=1
				l.tir.timean=1.5
				l.tir.y=5
				l.tirnbfr=10
			l.numframe=5
			l.timeatt=1500
			l.scale=l.scale*1.2
		elseif k==3 then -- elfe
			l.message=texttraduction.soldat[4]..": " --"Elf leader: "
			l.vitesse=3
			l.vie=130
			l.attaque=11
			l.timeatt=1000
			l.numframe=8
			l.scale=l.scale*1.11
		elseif k==4 then -- elfe 2
			l.message=texttraduction.soldat[5]..": " --"Necromancer: "
			l.vie=200
			l.attaque=28
			l.timeatt=1000
			l.vitesse=3
			l.numframe=6
			l.scale=l.scale*1.33
		elseif k==5 then -- elfe 3
			l.message=texttraduction.soldat[6]..": " --"Sharpshooter: "
			l.vie=200
			l.vitesse=6
			l.timedep=0.4
			l.tir=1 --1
			l.tir={}
			l.tir.projscale=0.1
			l.tir.proj="01"
			l.tir.porte=30000
			l.tir.attaque=50
			l.tir.vitesse=1
			l.tir.cadence=2500
			l.tir.nbfleche=1
			l.tir.combat=1
			l.tir.attscale=1
			l.tir.timean=1
			l.tir.typetra=2
			l.tir.x=2
			l.tir.y=1
			l.tirnbfr=5
			l.numframe=6
			l.typedep=1
			l.attaque=10
		elseif k==6 then--geant
			l.regene=200
			l.message=texttraduction.soldat[7]..": " --"Gladiator:"
			l.vie=350
			l.attaque=10
			l.blocnbennemi=3--nombre d'ennemi bloquer par le soldat
			l.attnbennemi=2--nombre d'ennemi qu'il peut attaquer en meme temps
			l.vitesse=2.5
			l.numframe=6
			l.porte=7
			l.timeatt=2000
		elseif k==7 then -- geant 2
			l.regene=550
			l.message=texttraduction.soldat[8]..": " --"Scorpio:"
			l.vie=550
			l.attaque=12
			l.blocnbennemi=4--nombre d'ennemi bloquer par le soldat
			l.attnbennemi=6--nombre d'ennemi qu'il peut attaquer en meme temps
			l.vitesse=4
			l.numframe=6
			l.porte=7
			l.scale=l.scale*1.1
		elseif k==8 then -- geant 3
			l.regene=200
			l.message=texttraduction.soldat[9]..": " --"Divine hammer:"
			l.vie=800
			l.attaque=80
			l.blocnbennemi=4--nombre d'ennemi bloquer par le soldat
			l.attnbennemi=16--nombre d'ennemi qu'il peut attaquer en meme temps
			l.vitesse=2
			l.numframe=6
			l.porte=7
			l.timeatt=2000
		elseif k==9 then -- dragon
			l.message=texttraduction.soldat[10]..": " --"Gene dragon: "
			l.vie=1600
			l.attaque=200
			l.charge=300
			l.blocnbennemi=4--nombre d'ennemi bloquer par le soldat
			l.attnbennemi=16--nombre d'ennemi qu'il peut attaquer en meme temps
			l.vitesse=6
			l.numframe=7
			l.timeatt=1000
			l.porte=7
			l.tir=1 --1
			l.tir={}
			l.tir.projscale=0.1
			l.tir.proj="01"
			l.tir.porte=300000
			l.tir.attaque=20
			l.tir.vitesse=2
			l.tir.cadence=1000
			l.tir.nbfleche=10
			l.tir.combat=1
			l.tir.attscale=1
			l.tir.timean=1
			l.tir.agressivite=true
			l.tirnbfr=6
			l.scale=l.scale*1.05
		end
		image[nb]=l
		nb=nb+1
	end
	-- local loadsavef=require("loadsave")
	-- loadsavef.print_r (image) 

	-- local chargementaffichage = require ( "chargementaff")
	-- chargementartha()
	-- chargementevo()
	--imgchargement1=display.newImage("choniveau/chargementbis.png",actualcontentwidth/2,actualcontentheight/2,true)
	local function timerlancerniv2( event )
		co02=coroutine.create(function ()
			print("coroutine 02")
			local chargementtergoh1 = require ( "chargementtergoh")
			chargementtergoh1.chargementtergoh()
		end)
		coroutine.resume(co02)
		tabcorourtine[7]=co02
		co01=coroutine.create(function ()
			print("iciiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii")
			print("coroutine 01")
			local chargementbisgoh1 = require ( "chargementbisgoh")
			chargementbisgoh1.chargementbisgoh()
		end)
		coroutine.resume(co01)
		tabcorourtine[8]=co01
	end
	timerlancernivbis=timer.performWithDelay( 50, timerlancerniv2 )
	
		end
return(t)