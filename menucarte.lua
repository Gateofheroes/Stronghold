local t = {}--chargement de donnée pour les gentils et une partie pour les mechants+ une parties des images
t.ordre = function (inf1,inf2,inf3,race1,typemulti) -- inf1==0 default and 1 for leveltuto niveau 0
	unloadimagemain()
	loadorreloadimagemain()
	--function ordre(inf1,inf2,inf3,race1)
	print("demander de lancer le niveau")
	generaltest=0
	if race1<0 then
		race=0
		generaltest=-race1
	else
		race=race1-1
	end
	print("ordre recut"..inf1..inf2..inf3.." race "..race)

	-- if fric1<0 then
	-- 	fric1=-fric1+(1*7)
	-- else
	-- 	fric1=-(fric1+(1*7))
	-- end
	-- fric1=mathfloor(fric1)
	-- --fric1=fric1+(1*7)
	-- local t = os.date( '*t' )
	-- savegame.diplay=os.time( t )
	-- local fricpos=fric1
	-- if fricpos<0 then
	-- 	fricpos=-fricpos
	-- end
	-- savegame.content=(-fricpos/3-1)/savegame.display
	-- savegame.monney=fricpos/7

	-- local loadsave = require("loadsave")
	-- loadsave.saveTable(savegame, "undeuxtroissoleil.json" )

	local function lancerniv1()--demande de lancer le niveau
		--supbackcontenue()
		--menuprin:removeSelf()
		-- local chargement = require ( "chargement")
		-- chargementevo()
		-- chargementevo()
		-- chargementevo()
		local lancerNiveau1 = require ( "niveau1" )
		local etatchargement=0
		-- chargementevo()
		-- 	chargementevo()
		-- 	chargementevo()
		fullcouritine=true
		local function timerlancertestcoro( event )
			if etatchargement<chargementdesfichiertt then --chargementdesfichier then
				--chargementevo()
				etatchargement=etatchargement+1
			end
			if donneecharger[31]==1 then
				
				lancerNiveau1.niveau1(0)
			else
				if coroutinefinitt==false then
					print("coroutinefinitt false donneecharger[31] "..donneecharger[31])
				else
					print("coroutinefinitt true donneecharger[31] "..donneecharger[31])
				end
			--	print("coroutinefini "..coroutinefini)
				timerlancertestco=timer.performWithDelay( 50, timerlancertestcoro )
			end
		end
		if ((niveauch==1 and tuto==1) or ((niveauch==5 or niveauch==9 or niveauch==13)) and (savegameresul[(niveauch-1)*4+3]==0 or issimulator)) and modenormal and multi==0 and not modehard and not modewave then
			local imageflou,imagetheme
			if goh then
				if niveauch<=5 then
					imagetheme=graphics.newImageSheet("goh/intro/theme1.png",{width=960,height=510,numFrames=2,sheetContentWidth=960,sheetContentHeight=1020})
				else
					imagetheme=graphics.newImageSheet("goh/intro/theme2.png",{width=960,height=510,numFrames=2,sheetContentWidth=960,sheetContentHeight=1020})
				end
				imageflou=graphics.newImageSheet("goh/intro/imgflou.png",{width=955,height=541,numFrames=1,sheetContentWidth=955,sheetContentHeight=541})
			else
				if niveauch<=5 then
					imagetheme=graphics.newImageSheet("intro/theme1.png",{width=960,height=510,numFrames=2,sheetContentWidth=960,sheetContentHeight=1020})
				else
					imagetheme=graphics.newImageSheet("intro/theme2.png",{width=960,height=510,numFrames=2,sheetContentWidth=960,sheetContentHeight=1020})
				end
				imageflou=graphics.newImageSheet("intro/imgflou.png",{width=955,height=541,numFrames=1,sheetContentWidth=955,sheetContentHeight=541})
			end
			if imagemenu.page1==nil then
				if not goh then
					imagemenu.page1=graphics.newImageSheet("menudevnew/page1.jpg",{width=640,height=470,numFrames=1,sheetContentWidth=640,sheetContentHeight=470})
				else
					imagemenu.page1=graphics.newImageSheet("goh/menudevnew/page1.png",{width=1378,height=961,numFrames=1,sheetContentWidth=1378,sheetContentHeight=961})
				end
			end
			local groupaffichage=display.newGroup()
			local backgroundblack=display.newImage(imageflou,1)
			backgroundblack.x=contentcenterx
			backgroundblack.y=contentcentery
			backgroundblack.xScale=actualcontentwidth/backgroundblack.width
			backgroundblack.yScale=actualcontentheight/backgroundblack.height
			groupaffichage:insert(backgroundblack)
			local numeroimage=1
			if niveauch==5 or niveauch==13 then
				numeroimage=2
			end
			local imageintroaff=display.newImage(imagetheme,numeroimage)
			imageintroaff.x=contentcenterx
			imageintroaff.y=contentcentery
			imageintroaff.xScale=0.75*actualcontentwidth/imageintroaff.width
			imageintroaff.yScale=imageintroaff.xScale
			groupaffichage:insert(imageintroaff)

			
			local bpcont=display.newImage(imbouton.monnaie,1)
			bpcont.xScale=0.3
			bpcont.yScale=0.3
			bpcont.x=xmaxscreen-bpcont.width*bpcont.xScale*0.5-actualcontentwidth*0.0375*0.5
			bpcont.y=ymaxscreen-bpcont.height*bpcont.yScale*0.5-actualcontentheight*0.051*0.5
			bpcont.tapc=0
			local cadre
			local fondhist
			function bpcont:tap(event)
				if bpcont.tapc==0 then
					display.remove(imageintroaff)
					imageintroaff=nil
					display.remove(backgroundblack)
					backgroundblack=nil
					imagetheme=nil
					imageflou=nil
					bpcont.tapc=1

					fondhist=display.newImage(imagemenu.page1,1)
					fondhist.x=contentcenterx
					fondhist.y=contentcentery
					fondhist.xScale=actualcontentwidth/fondhist.width
					fondhist.yScale=actualcontentheight/fondhist.height
					groupaffichage:insert(fondhist)
					local textaff=""
					if niveauch==1 then
						--textaff="The BadGuy wants to destroy the 3 Kingdoms :\n The human, elfe and giant kingdoms.\n An alliance is created to defeat the BadGuy\n Stop ennemy waves with towers.\nAll the races can share their technologies\nto increase their defences"
						-- textaff="Brave guerrier,\n\nvous avez été choisi par les royaumes elfes, humains\net géant pour diriger l'alliance contre l'envahiseur.\n\nConstruisez des tours, maneuvrez votre champion\net mettez à profit les technologies de chaque race\npour vous defendre."
						textaff=texttraduction.menucarte[1] --"Brave warrior,\n\nyou are the chosen one among the elves, humans\nand giants.\n\nBuild towers, control your hero and make good\nuse of the technologies of each race to defend\nthe kingdoms."
					elseif niveauch==5 then
						-- textaff="Valeureux capitain,\n\ngrace à vous les royaumes elfique sont saufs.\nMais les orcs ont lancé une offensive contre les géants des terres du nord.\n\n Que votre épée soit aussi acérée que la glace."
						textaff=texttraduction.menucarte[2] --"Captain,\n\nthe elf kingdom is safe and sound. We must now\ndefend the northen land which is overwhelmed by orcs.\nMay you die with a sword in battle."

						--Courageous captain, you have saved the elf empire. But 
					elseif	niveauch==9 then
						--textaff="Fier general,\n\nmaintenant que leurs assaillants ont été écrasés\npar l'alliance,chevauchez avec les géants pour défaire\nles hordes mercenaires sévissant\ndans les terres arides du Sud-Est."
						textaff=texttraduction.menucarte[3] --"General,\n\nnow that the orcs in the north have been chased away,\nhead to the desert with the giants and crush\nthe mercenaries once and for all."
					else
						-- textaff="Invincible hero,\n\npour prendre l'ennemi de vitesse, vos lieutenants\nmarchent deja sur le territoire ennemi.\n\nFort de vos victoires aidez-les à terminer le combat."
						textaff=texttraduction.menucarte[4] --"My king,\n\nthe three kingdoms armies are matching to Ashes.\nHelp them defeat 'nom du Boss' in the final battle.\n\nMay the gods be with you."
					end
					
					--if true then --isiphone then
						cadre=display.newEmbossedText(textaff,contentcenterx,contentcentery,actualcontentwidth*0.92,0,fonttype, 24*fontsize )
					--else
						--cadre=display.newEmbossedText(textaff,contentcenterx,contentcentery,fonttype, 24 )--actualcontentwidth/20, 300
					--end
					cadre:setFillColor(1,1,1)
					cadre:setEmbossColor(colortextemb)
					groupaffichage:insert(cadre)
				else
					fondhist:removeSelf()
					fondhist=nil
					cadre:removeSelf()
					cadre=nil
					bpcont:removeSelf()
					bpcont=nil
					display.remove(groupaffichage)
					groupaffichage=nil
					timerlancertestco=timer.performWithDelay(50, timerlancertestcoro )
				end
			end
			bpcont:addEventListener("tap",bpcont)
		else
			timerlancertestco=timer.performWithDelay( 50, timerlancertestcoro )
		end
		if donneecharger[31]==0 then -- action==0 then
			-- chargementdesfichier=0
			-- co0=coroutine.create(function ()
			-- chargement.chargement()
			-- end)
			-- coroutine.resume(co0)
			-- co1=coroutine.create(function ()
			-- 	local chargement1 = require ( "chargement1")
			-- 	chargement1.chargement1()
			-- end)
			-- coroutine.resume(co1)
			-- co2=coroutine.create(function ()
			-- 	local chargement2 = require ( "chargement2")
			-- 	chargement2.chargement2()
			-- end)
			-- coroutine.resume(co2)
			-- co3=coroutine.create(function ()
			-- 	local chargement3 = require ( "chargement3")
			-- 	chargement3.chargement3()
			-- end)
			-- coroutine.resume(co3)
		elseif donneecharger[31]==1 then -- action==1 then
			--local chargementaffichage = require ( "chargementaff")
			-- chargementevo()
			-- chargementevo()
			-- chargementevo()
			-- local lancerNiveau1 = require ( "niveau1" )
			-- lancerNiveau1.niveau1(0)
		end

		
		--lancerNiveau1.niveau1()--niveau1()
	end
	local function lancerniv()--gestion de la decision de lancer un niveau
		--supbackcontenue()
		--menuprin:removeSelf()
		local chargementaffichage = require ( "chargementaff")
		if donneecharger[31]==0 then -- action==0 then
			chargementaffichage.chargementaff(6)
		elseif donneecharger[31]==1 then
			chargementaffichage.chargementaff(6)
		end
		local function timerlancerniv1( event )
			lancerniv1()
		end
		timerlancerniv=timer.performWithDelay( 50, timerlancerniv1 )
	end
	niveauch=inf3+4*(inf2-1)
	modeinfini=false
	dureepartie=1 --coefficient de duree de la partie, plus le nb est grand plus la partie dura longtemps (divise les gains par mort et mine par dureepartie)
	mineimpact=1 -- coef multiplicatif des revenus de la mine
	dureepartie1=1 -- divise la croissance des vagues
	accelererenn=1 -- coefficient d'acceleration des ennemis (spwan plus vite, temps entre vague plus vbite et dep plus vite)
	contreai=0
	aiactive=0 --ai activé
	contreaihaut=0 
	encours=0 -- si niveau deja commencer par exemple niveau tuto
	tuto=0 --mode tuto desactiver 0, 1 activer, 2 tuto en cours (maintient pause jusqu'a que l'action soit faite (se remet a 1 quand c'est fait))
	tutoaction=-1 -- initialise la variable evite les bugs
	tutolevel0=false
	modehard=false
	modewave=false
	modezombie=false
	modepanique=false
	modesquelette=false
	modeperftest=false -- permet de tester les performances du jeu. le test est fait dans le level4 en race 2
	modearmy=false
	modexp=1 -- variation du gain d'xp pour tout gentil
	varattgent=1 --variation en pourcentage
	modenormal=true
	generalobligatoir=5
	multivaguemax=100
	agressivite=0 -- augmente l'agressivité des unités
	cadencegent=1 -- augmente la vitesse d'attaque des gentils(combat sol et cadence tour)
	cadencegentdeb=1
	agressivitedeb=0
	varattgentdeb=1
	accelererenndeb=1
	varviemech=1 -- a ne pas toucher pour level inf
	clicpiececoef=1 -- coef d'apparition des pieces. Plus est petit moins les pieces vont apparaitre
	-- if savegame.tuto1 then -- remplace false par true pour tester les mode zombie et mode panique


		-- if niveauch==1 and race==2 then
		-- 	modezombie=true
		-- 	dureepartie=0.2
		-- 	accelererenn=1
		-- end
		-- if niveauch==1 and race==1 then
		-- 	modepanique=true
		-- end


		-- if niveauch==1 and race==2 then
		-- 	encours=1
		-- end
	-- else
	-- 	if niveauch==1 then
	-- 		tuto=1
			-- dureepartie=0.5
			-- accelererenn=1.7
	-- 	end
	-- end
	if inf1==3 then
		tutolevel0=true
	end
	if typemulti==nil then
	if niveauch>60 then
		niveauch=niveauch-60
		modewave=true
	end
	if niveauch>30 then
		niveauch=niveauch-30
		modehard=true
	end
	if niveauch==1 then
		--if not issimulator then
			dureepartie=0.5
			accelererenndeb=1.7
		--end
		if not savegame.tuto1 and not modewave and not modehard then
			tuto=1
		end
	end
	if niveauch==2 then
		clicpiececoef=0.5
		if race==2 then
			dureepartie=0.75
			accelererenndeb=1
			-- encours=1
		elseif race==1 then
			dureepartie=0.75
			accelererenndeb=1
		else
			dureepartie=0.75
			accelererenndeb=1
			-- tuto=1
		end
		if not savegame.tuto2 and not modewave and not modehard then
			tuto=1
		end
	end
	if niveauch==3 then
		if not savegame.tuto3 and not modewave and not modehard then
			tuto=1
		end
		dureepartie=0.75
		clicpiececoef=0.3
	end
	if niveauch==4 then
		clicpiececoef=0.3
		viemechant=0.9 -- 0.95 le 05/10/2016
		dureepartie=0.9 -- 1 le 05/10/2016
		if race==1 and issimulator then
			modeperftest=true
		end
	end
	if niveauch==5 then
		accelererenndeb=0.95 -- 1.05 le 05/10/2016
		--dureepartie=0.92 -- avant 1 modif du 29/09/2016
		--contreai=1
		-- aiactive=1
	end
	if niveauch==6 then
		clicpiececoef=0.4
	end
	if niveauch==7 then
		clicpiececoef=0.4
		aiactive=1
	end
	if niveauch==8 then
		clicpiececoef=0.5
		aiactive=1
		dureepartie=1.2
	end
	if niveauch==9 then
		clicpiececoef=0.35
	end
	if niveauch==10 then
		clicpiececoef=0.5
	end
	if niveauch==11 then
		clicpiececoef=0.3
		aiactive=1
	end
	if niveauch==12 then
		clicpiececoef=0.2
		accelererenndeb=1.7
		dureepartie=1.2
		aiactive=1
	end
	if niveauch==13 then
		clicpiececoef=0.4
		encours=1
		aiactive=1
		dureepartie=1.2
		accelererenndeb=1.5
	end
	if niveauch==14 then
		clicpiececoef=0.3
		dureepartie=1.2
		accelererenndeb=1.5
	end
	if (niveauch==15 and goh) or (niveauch==16 and not goh) then
		dureepartie=5
		accelererenndeb=1.5
		mineimpact=5
	end
	if niveauch==16 or (niveauch==15 and not goh) then
		clicpiececoef=0.2
	end
	if (niveauch==17 and tutolevel0) or (niveauch==16 and not goh) then
		encours=1
		aiactive=1
		accelererenn=0.6
		agressivitedeb=5
	end
	if modehard then
		if niveauch==1 then
			varattgentdeb=varattgentdeb*0.7
			accelererenndeb=accelererenndeb*1.3
		elseif niveauch==2 then
			varattgentdeb=varattgentdeb*0.8
			accelererenndeb=accelererenndeb*1.2
			dureepartie=dureepartie*3
		elseif niveauch==3 then
			varattgentdeb=varattgentdeb*0.8
			accelererenndeb=accelererenndeb*1.5
			dureepartie=dureepartie*1.1
		elseif niveauch==4 then
			varattgentdeb=varattgentdeb*0.8
			accelererenndeb=accelererenndeb*1.5
			dureepartie=dureepartie*1.1
		end
	end
	if modewave then
		encours=0
		aiactive=0
		if savegame["lvlwave"..niveauch] then 
			varattgentdeb=varattgentdeb*0.70
		end
		if savegame21~=nil then
			if savegame21[niveauch]~=nil then
				varattgentdeb=varattgentdeb*0.70^(savegame21[niveauch])
				print("varattgentdeb modif")
			end
		end
		print("varattgentdeb du coup vaut "..varattgentdeb)
	end
	if niveauch==4 or niveauch==3 then
		-- aiactive=1
		-- contreai=1
	end
	-- elseif niveauch==2 or niveauch==4 then
	-- 	contreai=1
	-- 	aiactive=1
	-- end
	if issimulator then
		--aiactive=1
		--contreai=1
	end
	print("niveauch old "..niveauch.."\n\n\n\n\n")
	-- if niveauch==21 then -- inversion du mode zombie et 1vs1
	-- 	niveauch=20
	-- elseif niveauch==20 then
	-- 	niveauch=21
	-- end
	--print("niveauch "..niveauch)
	if ((niveauch>16 and niveauch<=19) or niveauch==23 or niveauch==24 or niveauch==21 ) and niveauch~=18 and not tutolevel0 then
		modenormal=false
		-- contreai=1
		-- aiactive=1
		--if niveauch==17 then
		--	niveauch=31
		--elseif niveauch==18 then
		--	niveauch=32
		--else
		modeinfini=true
		modeinfdif=0
		ralenticroissance=1 --agit sous forme de multiplication augmente non reelement la puissance des soldats
		if niveauch==18 then
			-- dureepartie=2 --partie longue (gain)
			-- dureepartie1=2
			-- accelererenn=0.7
			-- ralenticroissance=2
			contreai=1
			aiactive=1
		elseif niveauch==19 then
			local multimenu1=require("menumulti")
			loadimagemenumulti()
			mapmultisave=-1
			numsavegame=1
			--multimenu1.menumulti()
			modeinfini=false
			aiactive=1
			contreaihaut=1
			--multi=1
			--accelererenn=1.3 --partie accelerer (ennemi)
		elseif niveauch==21 then
			modearmy=true 
			modeinfini=true
			-- modeinfini=false -- 1vs1
			-- contreai=1 -- 1vs1
			-- aiactive=1 -- 1vs1
			-- contreaihaut=1 -- 1vs1
			-- dureepartie=2 	--coefficient de duree de la partie, plus le nb est grand plus la partie dura longtemps (divise les gains par mort et mine par dureepartie) et
			-- dureepartie1=2	-- divise la croissance des vagues
			-- accelererenn=1.3  --coefficient d'acceleration des ennemis (spwan plus vite, temps entre vague plus vbite et dep plus vite)
			-- ralenticroissance=3
		end
		-- if niveauch==19  or  niveauch==17 then
		-- 	dureepartie=nil
		-- 	accelererenn=nil
		-- else
		-- 	dureepartie=2 	--coefficient de duree de la partie, plus le nb est grand plus la partie dura longtemps (divise les gains par mort et mine par dureepartie)
		-- 	accelererenn=1.3 --coefficient d'acceleration des ennemis (spwan plus vite, temps entre vague plus vbite et dep plus vite)
		-- end
		--if niveauch==18 or niveauch==19 then
		--	tunedep=1000
		--elseif niveauch==17 then
		if niveauch==23 then
			modexp=4
			savegameall.xpactive=true -- 
		end
		if niveauch==24 then
			tunedep=1000000
		else
			tunedep=300
			if issimulator then
				--tunedep=30000
			end
		end
		--else
		--	tunedep=7000
		--end

		-- a continué ici
		local maxvaluerandom=1
		local i=1
		while i<=16 do
			if savegameresul[(i-1)*4+3]~=nil then
				if savegameresul[(i-1)*4+3]~=0 then
					maxvaluerandom=maxvaluerandom+1
				else
					i=17
				end
			else
				i=17
			end
			i=i+1
		end
		niveauch=mathrandom(1,maxvaluerandom)
		print("niveauchalea"..niveauch.."max "..maxvaluerandom)
		--niveauch=1
	end
	if niveauch==18 then
		print("niveau 18\n\n\n\n\n")
		modenormal=false
		modesquelette=true
		tunedep=400--0 -- 400
		local maxvaluerandom=1
		for i=1,4 do
			for j=1,4 do
				if savegameresul[((j+(i-1)*4)-1)*4+3]>0 then
					maxvaluerandom=maxvaluerandom+1
				end
			end
		end
		niveauch=mathrandom(1,maxvaluerandom)
		--niveauch=14
	end
	if niveauch==20 or niveauch==22 then
		modenormal=false
		if niveauch==20 then
			modezombie=true
			dureepartie=0.5
			accelererenndeb=1
			print("mode zombie")
		else
			modepanique=true
			print("mode panique")
		end
		niveauch=1

	--elseif not issimulator then
		-- varattgent=mathfloor(savegameresul[(niveauch)+64]*100)*0.01
		-- print("la difficultée du niveau est de "..varattgent)
	end
	end
	print("niveauch "..niveauch)
	if not savegame.bonuspaid then
		if goh then
			if (niveauch>16 or modezombie or modepanique or modeinfini or modesquelette ) and not tutolevel0 then 
				showadsplaybonus(true,true)
				--loadsbonus()
			else
				loadshortads()
			end
		else
			showadsplaybonus(true)
			--loadsbonus()
		end
	end
	-- if not goh or (niveauch<=16 and not modezombie and not modepanique and not modeinfini and not modesquelette) then
	-- 	showshortads()
	-- else
	-- 	showadsplaybonus()
	-- 	loadsbonus()
	-- end

	-- if (not savegame.bonuspaid and (niveauch>16 or modezombie or modepanique or modeinfini or modesquelette) and goh) or (not goh and not savegame.inapp) then
	-- 	showadsplaybonus()
	-- 	if (not savegame.bonuspaid and (niveauch>16 or modezombie or modepanique or modeinfini or modesquelette) and goh) then
	-- 		loadsbonus()
	-- 	end
	-- end
	lancerniv()
end
return t