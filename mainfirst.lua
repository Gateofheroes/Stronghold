local t={}--menu principal du jeu
function gettime()
	local t=os.date( '*t' )
	local timetest=os.time( t )
	return timetest
end
functionToCall=nil
functionToCallArg=nil
function managetap(event)
	if functionToCall~=nil then
		local value=functionToCall(functionToCallArg)
		functionToCall=nil
		functionToCallArg=nil
	end
end
Runtime:addEventListener("enterFrame",managetap)
function lemainpremier()
	son={}
	if not goh then
		son.backgroundMusic = audio.loadStream( "son/Epic_Power.mp3" )--moyenne age
	else
		son.backgroundMusic = audio.loadStream( "goh/son/Epic_Power.mp3" )--moyenne age
	end
	audio.setVolume(0)
	audio.play( son.backgroundMusic, { channel=1, loops=-1}) --, fadein=500 }) --410000 } )--150000 pour titan
	--audio.setVolume(0.5)
	audio.setVolume(0.2,{channel=1})
	if (isandroid or isiphone) and false then
		gameanalytics = require 'plugin.gameanalytics_v2'
		gameanalytics.configureBuild( system.getInfo("appVersionString") )
		gameanalytics.setEnabledInfoLog(true)
		gameanalytics.setEnabledVerboseLog(true)
		gameanalytics.initialize {
		    gameKey = "37eb9b9de04bf1de4a253d8595cb8a34",
		    gameSecret = "b349a49ddf3081a4458ea680f3740c412f333362"
		}
		local license1 = require ( "license")
	end
		-- profiler = require "Profiler"; profiler.startProfiler();
		if analyticsactif then 
			local function analyticspcall()
				local function timerlong(event)
					analytics =require( "plugin.flurry.analytics" ) -- require( "analytics" )
					--native.showAlert( "plugin.flurry.analytics", "plugin.flurry.analytics", { "OK" } )
					--local function timerlong1(event)
						--native.showAlert( "1", "plugin.flurry.analytics", { "OK" } )
						if analytics~=nil then
							--native.showAlert( "2", "plugin.flurry.analytics", { "OK" } )
							analytics.init("47PVXT3FK4PF8S3FYFN2") -- "Z8H7ZZRJFSPR93V56Z5S") -- "47PVXT3FK4PF8S3FYFN2" )
							analytics.logEvent("lancement")
						end
					--end
					--timer.performWithDelay(500,timerlong1)
				end
				timer.performWithDelay(500,timerlong)
			end
			if not pcall(analyticspcall) then
				analyticsactif=false
				print("plugin analytics ne marche pas")
				local loadsave = require("loadsave")
				local bug=loadsave.loadTable("undeuxtroissoleilbug.json")
				if bug==nil then
					bug={}
				end
				bug[#bug+1]="analyticserror"
				loadsave.saveTable(bug, "undeuxtroissoleilbug.json" )
			end
		end
	--end
	-- local test=display.newText("yo",0,0,native.systemFontBold,20)
	-- test.font=native.newFont( fonttype,16 )
	-- local systemFonts = native.getFontNames()

	-- -- Set the string to query for (part of the font name to locate)
	-- print("recup font")
	-- local searchString = "pt"

	-- -- Display each font in the Terminal/console
	-- for i, fontName in ipairs( systemFonts ) do

	--     local j, k = string.find( string.lower(fontName), string.lower(searchString) )

	--     if ( j ~= nil ) then
	--         print( "Font Name = " .. tostring( fontName ) )
	--     end
	-- end
	-- co=coroutine.create(function ()
	-- local chargement = require ( "chargement")
	-- chargement.chargement()
	-- end)
	-- coroutine.resume(co)
	co=coroutine.create(function ()
		print("chargementco 1")
		if goh then
			local chargementco1 = require ( "chargementcogoh")
			lechargementco()
		else
			local chargementco1 = require ( "chargementco")
			lechargementco()
		end
	end)
	coroutine.resume(co)

	tabcorourtine={}
	tabcorourtine[1]=co
	--coroutinefini={0} --,0,0,0,0,0,0,0,0,0,0}
	--coroutinefinitt=false
	local coroutineutile=false
	local nbcoroutine=0
	local cptfirst=0
	local nbroutinesametime=3
	local routinesametime=0

	local oldtime=gettime()
	local actualtime
	local fpsactif=20
	--local chaineroutine=""
	local nbframetoremove=0
	desactivecoroutine=false
	fullcouritine=false
	coroutinemiregime=false
	--chargement des fichiers pour la partie
	chargementdesfichier={0,0,0,0,0,0}
	chargementdesfichiertt=0
	local cpt=0
	function coroutinegestion(event)
		--chaineroutine=""
		if not desactivecoroutine then
			nbframetoremove=nbframetoremove+1
			actualtime=event.time*0.001
			fpsactif=fpsactif*0.75+0.25*1/(actualtime-oldtime)
			if fpsactif>30 then
				fpsactif=30
			end
			-- chaineroutine=chaineroutine.." fps= "..fpsactif
			oldtime=actualtime
			if fpsactif>26 then
				nbroutinesametime=nbroutinesametime+1
			elseif fpsactif<20 and fpsactif>13 then
				nbroutinesametime=nbroutinesametime-1
			else
				nbroutinesametime=0
			end
			if coroutinemiregime and nbroutinesametime>1 then
				nbroutinesametime=1
			end
			if coroutinemiregime and not issimulator then
				nbroutinesametime=0
			end 
			if fullcouritine then
				nbroutinesametime=10
			end
			-- print("resume coroutine")
			if true then --cptfirst>=10 then
				coroutineutile=false
				routinesametime=0
				--cptfirst=0
				
				if nbroutinesametime>0 then
					local coroutineactive=""
					for i=1,#tabcorourtine do
						if coroutine.status(tabcorourtine[i])~="dead" then
							if nbroutinesametime>=routinesametime then
								routinesametime=routinesametime+1
								coroutine.resume(tabcorourtine[i])
								coroutineactive=coroutineactive.." i "..i --print("coroutine "..i.." est toujours en activité")
								coroutineutile=true
								nbcoroutine=nbcoroutine+1
								--chaineroutine=chaineroutine.."\n coroutineutile coroutine "..nbcoroutine.."  #tabcorourtine "..#tabcorourtine.." i="..i
							else
								break
							end
							-- print("pas")
						end
					end
					-- print("fpsactif "..fpsactif.." nbroutinesametime "..nbroutinesametime.." coroutine "..coroutineactive.." est toujours en activité")
					-- local testcoroutinenb=0
					-- for i=1,#coroutinefini do
					-- 	testcoroutinenb=testcoroutinenb+coroutinefini[i]
					-- 	if coroutinefini[i]==0 then
					-- 		print("coroutinefini["..i.."]"..coroutinefini[i])
					-- 	end
					-- end
					-- if testcoroutinenb>=1 then --testcoroutinenb>=9 then
					-- 	coroutinefinitt=true
					-- else
					-- 	print("testcoroutinenb "..testcoroutinenb)
					-- end
					chargementdesfichiertt=0
					local coroutinepasfini=""
					for i=1,#chargementdesfichier do
						chargementdesfichiertt=chargementdesfichiertt+chargementdesfichier[i]
						if chargementdesfichier[i]==0 then
							coroutinepasfini=coroutinepasfini.." "..i
						end
					end
					local textureut
					if issimulator then
						cpt=cpt+1
						if cpt>5 then
							cpt=0
							local memUsed = mathfloor((collectgarbage("count"))/1000*10)*0.1
							local texUsed = system.getInfo( "textureMemoryUsed" ) / 1000000
							--print("\n---------MEMORY USAGE INFORMATION chargement1 avant---------")
							--print("System Memory Used:", string.format("%.03f", memUsed), "Mb")
							textureut="Texture Memory Used: "..memUsed.." "..string.format("%.03f", texUsed).."Mb"
							print("fpsactif "..mathfloor(fpsactif).." nbroutinesametime "..nbroutinesametime.." coroutine "..coroutineactive.." en activité et "..coroutinepasfini.." pas fini "..textureut)
						end
					end
					
					if chargementdesfichiertt>=6 then
						print("ici")
						--chargementdesfichiertt=true
						donneecharger[31]=1
					else
						--print("testcoroutinenb1 "..testcoroutinenb1)
					end
					if routinesametime==0 and nbroutinesametime~=0 and chargementdesfichiertt>=6 then
						--if issimulator then
							print("envoie des infos au serveur")
							local serveur=require("serveur")
							evnoiedesfichier()
						--end
						--print("removeEventListener "..nbframetoremove)
						Runtime:removeEventListener("enterFrame",coroutinegestion)
					end
					if nbroutinesametime>routinesametime then
						nbroutinesametime=routinesametime
						--chaineroutine=chaineroutine.." peut avoir plus de routine "..nbroutinesametime
					end
				end
				if coroutineutile then
					
				else
					print("coroutine pas utile")
				end
			else
				cptfirst=cptfirst+1
			end
		end
		--print(chaineroutine)
	end
	Runtime:addEventListener("enterFrame",coroutinegestion)
	local releaseBuild =false   -- Set to true to suppress popup message
	if issimulator then
		releaseBuild=true
	end
	--releaseBuild=true
	-- Error handler
	local saveerror=true -- evite d'enregistré 100 fois la meme erreurs
	local function myUnhandledErrorListener( event )
		if saveerror then --false then -- true then corriger ce bug reinit la sauvegarde
			local chainesave=event.errorMessage.."stack"..event.stackTrace
			chainesave=chainesave:gsub("%c","")
			chainesave=chainesave:gsub("%p","")
			chainesave=chainesave:gsub("%s","")
			local loadsave = require("loadsave")
			local bug=loadsave.loadTable("undeuxtroissoleilbug.json")
			if bug==nil then
				bug={}
			end
			chainesave=system.getInfo("deviceID").."FINID"..system.getInfo("appVersionString").."FINVERSION"..chainesave
			bug[#bug+1]=chainesave
			loadsave.saveTable(bug, "undeuxtroissoleilbug.json" )
			saveerror=false
			local function timersaveerror(event)
				saveerror=true
			end
			timer.performWithDelay(50,timersaveerror)
		end
	    if releaseBuild then
	        print( "Handling the unhandled error >>>\n", event.errorMessage )
	        if isandroid and analyticsactif then
	        	analytics.logEvent("error",event.errorMessage)
	    	end
	        local chainecomplete="Envoyez le screenshot à Artha.France@gmail.com"
	        for i=1,string.len(event.errorMessage),40 do
	        	chainecomplete=chainecomplete.."\n"..string.sub(event.errorMessage,i,i+40)
	        end
	        display.newText(chainecomplete,contentcenterx,contentcentery, native.systemFont, 18 )
	    else
	    	if isandroid and analyticsactif then
	    		analytics.logEvent("error",event.errorMessage)
	    	end

	    	--saveret.bug=saveret.bug.." "..
	        print( "Not handling the unhandled error >>>\n", event.errorMessage )
	    end
	    
	    return true
	end

	Runtime:addEventListener("unhandledError", myUnhandledErrorListener)
	local function timerlancerniv2( event )
		lemainfirst()--ouverture du menu principal
	end
	timer.performWithDelay( 50, timerlancerniv2 ) --50 ms
end
function lemainfirst()
	--aff chargement
	--imchargmentmain=display.newImage(imagemenu.chargement,1)



	--"Menuprincipal/imageMenu.png", actualcontentwidth/2,actualcontentheight/2,true)
	--local boutonPlay=display.newImage("Menuprincipal/BoutonPlay.png",actualcontentwidth*3/5,248/4,true)--248 taille de l'image
	--local boutonDev=display.newImage("Menuprincipal/boutonDev.png",
		---local fond= display.newImage( "choniveau/carteniveau.png", 0,0,true )
	--local niv1= display.newImage( "choniveau/niv1.png", 0,0,true )
	--local niv2= display.newImage( "choniveau/niv2.png", 300,0,true )
	--local menuprin= display.newImage( "choniveau/menuprin.png",actualcontentwidth-100,50,true )
	--local humain= display.newImage( "choniveau/bphumain.png", 0,-100,true )
	--local elfe= display.newImage( "choniveau/bpelfe.png", -100,100,true )
	--local geant= display.newImage( "choniveau/bpgeant.png", 100,100,true )
	--imgchargement=display.newImage("choniveau/chargement.png",actualcontentwidth/2,actualcontentheight/2,true)

	--ajouter ici la creation d'un nouveau type de listner
	--faire attention a ne pas ralentir le jeu
	--il faut que le listner recoit l'objet et cree les deux lisner(un sur tap et un sur touch) et ils retournent tt les true or false
	local loadsave = require("loadsave")
	--save={}
	savegame=loadsave.loadTable("undeuxtroissoleil.json")
	savegamedev=loadsave.loadTable("undeuxtroissoleilbis.json")
	savegameresul=loadsave.loadTable("undeuxtroissoleilter.json")
	savegamemulti=loadsave.loadTable("undeuxtroissoleilmulti.json")
	savegamedev21=loadsave.loadTable("undeuxtroissoleil2021.json")
	savegame21=loadsave.loadTable("undeuxtroissoleillvl21.json")
	savegameedit=false
	savegamedevedit=false
	savegameresuledit=false
	-- savegamebonussoldat=loadsave.loadTable("undeuxtroissoleil1.json")
	-- savegamebonusbatiment=loadsave.loadTable("undeuxtroissoleil2.json")
	-- savegamebonuspouvoir=loadsave.loadTable("undeuxtroissoleil3.json")
	-- savegame=nil -- mettre en normal cette ligne pour supprimer la memoire apres avoir lancer l'appli il faut remettre la ligne en commentaire
	--savegamebonussoldat=nil
	--loadsave.printTable(savegamebonussoldat)
	--print(savegamebonussoldat[8].attaque)
	local nbcartemultijoueur=2
	nbchalenge=20
	--local developpements1 = require("developpements")
	--developpements1.developpements()
	--initdeinit_bonus()

	-- pour mieux crypter les données utliser ca
	-- iddevice=tonumber(system.getInfo("deviceID"),35)
	-- print("iddevice "..iddevice)
	-- pour mieux crypter les données utiliser ca
	local function initsavegamedev21()
		savegamedev21={0,0,0,0,0,0,0,0,0,0,0,0,0,0}
		savegame21={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
	end
	if savegamedev21==nil then
		initsavegamedev21()
	end
	local reinit1=0
	local function initsave()
		initsavegamedev21()
		-- native.showAlert( "Initialisation de la sauvegarde", "Si vous aviez deja une sauvegarde contacter arthafrance@gmail.com", { "OK" } )
		reinit1=1
		savegamedev=nil
		savegameresul=nil
		print("reinit ou init")
		savegame={}
		print("savegame crea tab")
		
		
		savegame.id=system.getInfo("deviceID")
		savegame.sound=true
		savegame.soundvol=0.5
		savegame.test=1
		savegame.monney=0
		savegame.content=-1
		savegame.display=1
		savegame.fric2=0
		savegame.yomec=0 --0 de fric accumuler au total
		savegame.niveau={}
		savegame.savemulti={}
		for i=1,nbcartemultijoueur do
			savegame.savemulti[i]={}
			savegame.savemulti[i].nb=0
			savegame.savemulti[i].typeso={}
			savegame.savemulti[i].time={}
		end
		-- savegame.chalenge={}
		-- for i=1,nbchalenge do
		-- 	savegame.chalenge[i]={}
		-- 	savegame.chalenge[i].donnee=0
		-- 	for j=1,nbchalenge do
		-- 		savegame.chalenge[i][j]=0
		-- 	end
		-- end
		
		savegamedev={}
		for i=1,350 do -- de 320 à 350 c'est l'experience de chaque general 21 à 30 humain 31 à 40 race...
			savegamedev[i]=0 --1 devellopement fait
		end
		savegamedev[157]=1
		savegamedev[161]=1
		savegamedev[165]=1
		savegameresul={}
		for i=1,64 do --16 niveau, 4 info sur chaque niveau (maxfric en fin de partie, maxennemipasse, maxetoile, nb (nb de victoire),dif)
			savegameresul[i]=0
		end
		for i=65,80 do
			savegameresul[i]=1 --dificulté 1 normal
		end
		--local developpements1 = require("developpements")
		-- local developpements1 = require("developpements")
		-- developpements1.developpements()
		-- newinitbonus()
		--initialisation_bonus() --init du menu de developement
		-- savegame.dev={}
		-- savegame.bonus=bonus
		-- savegame.unlock=batunlock
		print("save file")
		savegameedit=true
		savegamedevedit=true
		savegameresuledit=true
		--loadsave.saveTable(savegame, "undeuxtroissoleil.json" )
		--loadsave.saveTable(savegamedev, "undeuxtroissoleilbis.json" )
		--loadsave.saveTable(savegameresul, "undeuxtroissoleilter.json" )
		-- loadsave.saveTable(savegamebonussoldat, "undeuxtroissoleil1.json" )
		-- loadsave.saveTable(savegamebonusbatiment, "undeuxtroissoleil2.json" )
		-- loadsave.saveTable(savegamebonuspouvoir, "undeuxtroissoleil3.json" )
		--loadsave.saveTable(savegame.bonus, "undeuxtroissoleil.json" )
		--loadsave.saveTable(savegame.bonus.soldat, "undeuxtroissoleil.json" )
	end
	local developpements1 = require("developpements")
	developpements1.developpements()
	newinitbonus()
	--initsave()--a supprimer
	if savegame==nil or savegameresul==nil then
		initsave()
	else
		if savegame.id~=system.getInfo("deviceID") then
			initsave()
		else
			--bonus=savegame.dev.bonus
			--batunlock=savegame.dev.unlock
		end
		print("il y a qqc")
	end

	--local test1={}
	test1=nil
	savemulti=savegame.savemulti
	--savemulti[1]=savegame.savemulti[1]
	--savemulti[2]=savegame.savemulti[2]
	local calcul=mathfloor((savegame.display*savegame.content+1)*3)-(savegame.display*savegame.content+1)*3
	print("calcul"..calcul.." floor "..mathfloor((savegame.display*savegame.content+1)*3).." "..(savegame.display*savegame.content+1)*3)
	if savegame.yomec~=nil then -- yomec total de l'argent cumuler *5
	else
		initsave()
		print("pas de var indiquand le nb total de fric")
	end

	if (calcul<0.1 and calcul>-0.1) or (calcul<1.1 and calcul>0.9) or (calcul>-1.1 and calcul<-0.9) then
		if (calcul<0.1 and calcul>-0.1) then
			fric1=-(savegame.display*savegame.content+1)*3
			print("correct1")
		elseif (calcul<1.1 and calcul>0.1) then
			fric1=mathfloor(-(savegame.display*savegame.content+1)*3)
			print("correct2")
		elseif(calcul>-1.1 and calcul<-0.9) then
			fric1=mathfloor(-(savegame.display*savegame.content+1)*3)
			print("correct3")
		end
	else
		initsave()
		print("pas entier")
		-- savegame.monney=0
		-- savegame.content=-1
		-- savegame.display=1
		-- fric1=0
		-- --initialisation_bonus() --init du menu de developement
		-- savegame.dev.bonus=bonus
		-- savegame.dev.unlock=batunlock
	end

	if fric1>-0.1 then
		if fric1<0.1 then
			fric1=0
			print(" met correctement a 0")
		end
	-- else
	-- 	fric1=0
	end
	-- if true then
	-- 	local fricpos=fric1
	-- 	if fricpos<0 then
	-- 		fricpos=-fricpos
	-- 	end
	-- 	if fricpos>-0.1 then
	-- 		if fricpos<0.1 then
	-- 			fricpos=0
	-- 			print("0")
	-- 		end
	-- 	end 
	-- 	local friccum=fricpos/7
	-- 	for i=1,320 do 
	-- 		if savegamedev[i]==1 then
	-- 			--print("demande d'ordre de deja fait")
	-- 			actionmenu.ordre1(i)
	-- 		end
	-- 	end
	-- 	if friccum~=savegame.yomec/5 then
	-- 		print("l'argent cumuler ne correspond pas")
	-- 		initsave()
	-- 	end
	-- end

	local calcultest=fric1/7-savegame.monney
	if calcultest>1 or calcultest<-1 then
		print("triche")
		initsave()
		-- savegame.monney=0
		-- savegame.content=-1
		-- savegame.display=1
		-- fric1=0
		-- initialisation_bonus() --init du menu de developement
		-- savegame.dev.bonus=bonus
		-- savegame.dev.unlock=batunlock
	end
	fric1=-fric1
	fric1=mathfloor(fric1)

	actionmenu= require("menudedevfon")
	comenudevfon1=coroutine.create(function ()
		local i=1
		local cpttest=0
		while i<=320 do --for i=1,120 do 
			if savegamedev[i]==1 then
				--print("demande d'ordre de deja fait")
				actionmenu.ordre1(i)
				cpttest=cpttest+10
			end
			cpttest=cpttest+1
			if cpttest>=40 then
				cpttest=cpttest-40
				if not fullcouritine then
					coroutine.yield()
				end
			end
			i=i+1
		end
		for i=1,16 do
			if savegame["lvlwave"..i] then
				actionmenu.ordrewave(i)
				local j=1
				if savegame21~=nil then
					if savegame21[i]~=nil then
						while j<savegame21[i] do
							actionmenu.ordrewave(i)
							j=j+1
						end
					end
				end
			end
		end
		i=1
		while i<11 do
			local j=savegamedev21[i]
			if j~=nil then
				local k=1
				while k<=j do
					local inf1=1
					local inf2=math.floor(i/4)+1
					local inf3=(i%4)*4
					local numeroboutonglob=(inf1-1)*6*13+(inf2-1)*13+inf3
					actionmenu.ordre1(numeroboutonglob)
					k=k+1
				end
			end
			i=i+1
		end
		chargementdesfichier[6]=1
		coroutine.yield()
		chargementdesfichier[6]=1
		print("coroutine 2 fini")
	end)
	tabcorourtine[2]=comenudevfon1

	-- comenudevfon4=coroutine.create(function ()
	-- 	local i=61
	-- 	while i<=120 do --for i=1,120 do 
	-- 		if savegamedev[i]==1 then
	-- 			--print("demande d'ordre de deja fait")
	-- 			actionmenu.ordre1(i)
	-- 			coroutine.yield()
	-- 			print("demande d'ordre 4")
	-- 		end
	-- 		i=i+1
	-- 	end
	-- 	coroutinefini[4]=1
	-- 	coroutine.yield()
	-- 	coroutinefini[4]=1
	-- 	--coroutinefini=coroutinefini+1
	-- 	print("coroutine 7 fini")
	-- end)
	-- tabcorourtine[7]=comenudevfon4

	-- comenudevfon2=coroutine.create(function ()
	-- 	local i=121
	-- 	while i<=150 do
	-- 	-- for i=121,220 do 
	-- 		if savegamedev[i]==1 then

	-- 			--print("demande d'ordre de deja fait")
	-- 			actionmenu.ordre1(i)
	-- 			coroutine.yield()
	-- 		end
	-- 		i=i+1
	-- 	end
	-- 	coroutinefini[2]=1
	-- 	--coroutinefini=coroutinefini+1
	-- 	print("coroutine 8 fini")
	-- end)
	-- tabcorourtine[8]=comenudevfon2

	-- comenudevfon7=coroutine.create(function ()
	-- 	local i=151
	-- 	while i<=180 do
	-- 	-- for i=121,220 do 
	-- 		if savegamedev[i]==1 then

	-- 			--print("demande d'ordre de deja fait")
	-- 			actionmenu.ordre1(i)
	-- 			coroutine.yield()
	-- 		end
	-- 		i=i+1
	-- 	end
	-- 	coroutinefini[7]=1
	-- 	--coroutinefini=coroutinefini+1
	-- 		print("coroutine 9 fini")
	-- end)
	-- tabcorourtine[9]=comenudevfon7

	-- comenudevfon5=coroutine.create(function ()
	-- 	local i=181
	-- 	while i<=220 do
	-- 	-- for i=121,220 do 
	-- 		if savegamedev[i]==1 then

	-- 			--print("demande d'ordre de deja fait")
	-- 			actionmenu.ordre1(i)
	-- 			coroutine.yield()
	-- 		end
	-- 		i=i+1
	-- 	end
	-- 	coroutinefini[5]=1
	-- 	--coroutinefini=coroutinefini+1
	-- 		print("coroutine 10 fini")
	-- end)
	-- tabcorourtine[10]=comenudevfon5

	-- comenudevfon3=coroutine.create(function ()
	-- 	local i=221
	-- 	while i<=235 do --for i=221,320 do 
	-- 		-- print("demande d'ordre de deja fait")
	-- 		if savegamedev[i]==1 then
	-- 			-- print("demande d'ordre de deja fait")
	-- 			actionmenu.ordre1(i)
	-- 			coroutine.yield()
	-- 		end
	-- 		i=i+1
	-- 	end
	-- 	print("coroutine 11 fini")
	-- 	-- coroutinefini=coroutinefini+1
	-- 	coroutinefini[3]=1
	-- end)
	-- tabcorourtine[11]=comenudevfon3

	-- comenudevfon9=coroutine.create(function ()
	-- 	local i=236
	-- 	while i<=250 do --for i=221,320 do 
	-- 		if savegamedev[i]==1 then
	-- 			actionmenu.ordre1(i)
	-- 			coroutine.yield()
	-- 		end
	-- 		i=i+1
	-- 	end
	-- 		print("coroutine 12 fini")
	-- 		-- coroutinefini=coroutinefini+1
	-- 	coroutinefini[9]=1
	-- end)
	-- tabcorourtine[12]=comenudevfon9

	-- comenudevfon8=coroutine.create(function ()
	-- 	local i=251
	-- 	while i<=280 do --for i=221,320 do 
	-- 		if savegamedev[i]==1 then
	-- 			--print("demande d'ordre de deja fait")
	-- 			actionmenu.ordre1(i)
	-- 			coroutine.yield()
	-- 		end
	-- 		i=i+1
	-- 	end
	-- 	print("coroutine 13 fini")
	-- 	-- coroutinefini=coroutinefini+1
	-- 	coroutinefini[8]=1
	-- end)
	-- tabcorourtine[13]=comenudevfon8

	-- comenudevfon6=coroutine.create(function ()
	-- 	local i=281
	-- 	while i<=320 do --for i=221,320 do 
	-- 		if savegamedev[i]==1 then
	-- 			--print("demande d'ordre de deja fait")
	-- 			actionmenu.ordre1(i)
	-- 			coroutine.yield()
	-- 		end
	-- 		i=i+1
	-- 	end
	-- 	print("coroutine 14 fini")
	-- 	coroutinefini[6]=1
	-- 	-- coroutinefini=coroutinefini+1
	-- end)
	-- tabcorourtine[14]=comenudevfon6

	-- if system.getInfo("platformName")=="Win" then
	-- 	print("ordi")
	-- 	--valsdfsddg= system.getInfo("androidDisplayWidthInInches")-- "android.permission.READ\_PHONE\_STATE" )
	-- 	--print("sfg"..valsdfsddg)
	-- else
	-- 	print("yolo")
	--	fric1=system.getInfo("deviceID")
	--end
	--fric1=0
	-- if save==false then
	--  	print("tableau vide")
	--  	save{}
	--  	save.test=true
	--  	save=true
	--  end
	-- loadsave.saveTable(save,"myTable.json")
	local approximateDpi = system.getInfo("androidDisplayApproximateDpi")
	local la=nil
	local lo=nil
	if approximateDpi~=nil then
	la=display.pixelWidth / approximateDpi
	lo=display.pixelHeight / approximateDpi
	--la=actualcontentwidth/approximateDpi
	--la=actualcontentwidth/system.getInfo("androidDisplayXDpi")--system.getInfo("androidDisplayWidthInInches")
	--lo=system.getInfo("androidDisplayHeightInInches")
	end
	if la~=nil then
		tailleecran=mathfloor(mathsqrt(la^2+lo*lo)*10)*0.1
	else
		tailleecran=4.5
	end
	if tailleecran>=4 and tailleecran<4.6 then
		apparence=1
	elseif tailleecran<4 then
		apparence=1.3
	elseif tailleecran>=4.6 and tailleecran<5.6 then
		apparence=0.9
	else
		apparence=0.8
	end
	-- apparencezoom=1
	-- elseif tailleecran<4 then
	-- 	apparencezoom=1.3
	-- elseif tailleecran>=5.6 and tailleecran<8 then
	-- 	apparencezoom=0.9
	-- else
	-- 	apparencezoom=0.8
	-- end
	--apparence=1.3
	donneecharger={} --31 data simple --1 carte1...->30 --32 pour image fond menudev -- 33 image fond pour menu carte --34 niveau bonus
	for i=0,35 do 
		donneecharger[i]=0
	end
	if savegame.sound==true then
		local volumesound=0.5
		if savegame.soundvol~=nil then
			volumesound=savegame.soundvol
		else
			savegame.soundvol=volumesound
		end
		audio.setVolume(volumesound)
		local volumesoundfond=savegame.soundvol
		if savegame.soundvolfond~=nil then
			volumesoundfond=savegame.soundvolfond
		else
			savegame.soundvolfond=volumesoundfond
		end
		audio.setVolume(volumesoundfond,{channel=1})
	else
		audio.setVolume(0)
	end
	-- local developpements1 = require("developpements")
	-- developpements1.developpements()
	-- initialisation_bonus() --init du menu de developement

			print("augmenter l'oseille")
			--augmenter l'oseille
			local calcultest=mathabs(fric1)/7-savegame.monney
			if calcultest>1 or calcultest<-1 then
			--if fric1/7~=savegame.monney then
				-- native.showAlert( "Met a 0 l'argent", "contacter arthafrance@gmail.com", { "OK" } )
				fric1=0
				print("triche1")
				reinit1=1
			elseif fric1==0 then
				print("augmente la tune quand tu as 0")
				if iswindows then
				-- assezdetune=true
					if fric1<0 then
						fric1=-fric1+8000*7
					else
						fric1=-(fric1+8000*7)
					end
					fric1=mathfloor(fric1)
					savegame.diplay=gettime()
					local fricpos=fric1
					if fricpos<0 then
						fricpos=-fricpos
					end
					savegame.content=(-fricpos/3-1)/savegame.display
					savegame.monney=fricpos/7
					savegame.yomec=savegame.yomec+8000*5
					if lefrictext~=nil then
						lefrictext.text=fricpos/7
					end
				end
			end 

	-- debut retourdinformation
	saveret=loadsave.loadTable("undeuxtroissoleilretinf.json")
	-- print(system.getInfo("deviceID"))
	-- print(system.getInfo("appName"))
	-- print(system.getInfo("appVersionString"))
	-- print(system.getInfo("build")) --2014.2511
	-- print(system.getInfo("name"))
	-- print(system.getInfo("androidAppVersionCode"))
	if saveret==nil then
		saveret={}
		saveret.id=system.getInfo("deviceID")
		saveret.name=system.getInfo("name")
		saveret.androidAppVersionCode=system.getInfo("androidAppVersionCode")
		saveret.appVersionString=system.getInfo("appVersionString")
		if saveret.appVersionString==nil then
			saveret.appVersionString="0"
		end
		saveret.build=system.getInfo("build")
		saveret.reinit=0
	end

	saveret.reinit=saveret.reinit+reinit1
	changelog=false
	changelogmenulud=false -- passage au menulud
	if saveret.appVersionString~=nil and savegame.changelog~=system.getInfo("appVersionString") and system.getInfo("appVersionString")~=nil then
		-- changelogmenulud=true
		local nbetoilett=0
		for i=1,4 do
			for j=1,4 do
				nbetoilett=nbetoilett+savegameresul[((j+(i-1)*4)-1)*4+3]
			end
		end
		if nbetoilett>=6 then
			savegame.changelog=system.getInfo("appVersionString")
			if savegame.changelog==nil then
				savegame.changelog="0"
			end
			changelog=true
			print("reset share")
			savegame.share=nil
			savegameedit=true
			--loadsave.saveTable(savegame, "undeuxtroissoleil.json" )
		end		
	end
	-- if goh then
	-- 	changelog=false
	-- end

	saveret.appVersionString=system.getInfo("appVersionString")
	if saveret.appVersionString==nil then
		saveret.appVersionString="0" 
	end
	if savegame.tuto==nil then -- a supprimer dans qq version pour que ca soit retrocompatible
		savegame.tuto=true
		savegame.tuto1=false
		savegame.tuto2=false
		savegame.tuto3=false
		savegame.tuto4=false -- si jamais allé dans le menu de dev
	end
	-- if savegame.rate1==nil then -- correction du bug qui faisait que la popup ne s'affichait pas quand on cliquait sur le bouton a supprimer dans qq version
	-- 	savegame.rate1=true
	-- 	savegame.rate=nil
	-- end
	if savegame.rate==nil then
		savegame.rate=0 --0 pour pas encore proposé, -1 accepter, 1 refuser une fois, 2 refuser 2fois
	end
	if  savegame.lvlzombie==nil then
		savegame.lvlzombie=1
		savegame.lvlsquelette=1
		savegame.lvlpanique=1
		savegameedit=true
		--loadsave.saveTable(savegame, "undeuxtroissoleil.json" )
	end
	-- if savegame.tuto4~=nil then
	-- 	savegame.tuto4=false
	-- 	savegame.tuto5=false
	-- 	savegame.tuto6=false
	-- 	savegame.tuto7=false
	-- 	savegame.tuto8=false
	-- 	savegame.tuto9=false
	-- 	savegame.tuto10=false
	-- end
	if savegameresul[65]==nil then -- a supprimer dans qq version
		for i=65,80 do
			savegameresul[i]=1 --dificulté 1 normal
		end
		savegameresuledit=true
		--loadsave.saveTable(savegameresul, "undeuxtroissoleilter.json" )
	end

	------------------------------a suprimer dans quelques version permet d'etre retro compatible
	if savegamedev[321]==nil then
		savegamedev[157]=1
		savegamedev[161]=1
		savegamedev[165]=1
		for i=321,350 do -- de 320 à 330 c'est l'experience de chaque general
			savegamedev[i]=0 --1 devellopement fait
		end
		savegamedevedit=true
		--loadsave.saveTable(savegamedev, "undeuxtroissoleilbis.json" )
	end
	if savegame.finish==nil then
		savegame.finish=false
		savegameedit=true
		--loadsave.saveTable(savegame, "undeuxtroissoleil.json" )
	elseif savegame.finish then
		local pagenb=1
		local niveauchtest=16+1
		if niveauchtest>4 then
			if niveauchtest>8 then
				if niveauchtest>12 then
					pagenb=4
				else
					pagenb=3
				end
			else
				pagenb=2
			end
		end
		if savegameall.bouton1[pagenb*20+(niveauchtest-(pagenb-1)*4)]~=1 then
			print("\n\n\nversion cheater le jeu n'a pas ete gagné!!")
			savegame.finish=false
			savegameedit=true
			--loadsave.saveTable(savegame, "undeuxtroissoleil.json" )
		end
	end
	if savegame.lvlhard1==nil then --
		local chainelvlhard="lvlhard"
		for i=1,16 do
			savegame[chainelvlhard..i]=false
		end
		savegameedit=true
	end
	if savegame.lvlwave1==nil then --
		local chainelvlhard="lvlwave"
		for i=1,16 do
			savegame[chainelvlhard..i]=false
		end
		savegameedit=true
	end
	for i=1,3 do
		if savegamedev[i+350]~=nil then
			savegameall.generalch[i]=savegamedev[i+350]
		else
			savegameall.generalch[i]=savegameall.general[i]
			savegamedev[i+350]=savegameall.generalch[i]
		end
	end
	if savegame.bonuspaid==nil then
		savegame.bonuspaid=false
		savegameedit=true
		--loadsave.saveTable(savegame, "undeuxtroissoleil.json" )
	elseif savegame.bonuspaid then
		-- verification 
	end
	if applifull and not savegame.bonuspaid then
		savegame.bonuspaid=true
		savegameedit=true
	end
	if savegame.inapp==nil then
		savegame.inapp=false -- si l'utilisateur a deja fait un in app
		savegameedit=true
		--loadsave.saveTable(savegame, "undeuxtroissoleil.json" )
	end
	if savegamemulti==nil then
		savegamemulti={}
		savegamemulti.id="User1"
		savegamemulti.exp=0--experienc pour levelup
		savegamemulti.xp=0 --level
		savegamemulti.xpu=0
		savegamemulti.map=1
		savegamemulti.dev={}
		for i=1,9 do--developpement fait
			savegamemulti.dev[i]=false
		end
		savegamemulti.unit={}-- unite debloquer
		for i=1,4 do
			savegamemulti.unit[i]={}
			for j=1,12 do
				savegamemulti.unit[i][j]=false
			end
		end
		savegamemulti.bouton={}--bouton de spawn
		for i=1,4 do
			savegamemulti.bouton[i]={}
			for j=1,4 do
				savegamemulti.bouton[i][j]=210
			end
			for j=5,8 do
				savegamemulti.bouton[i][j]=1
			end
		end
		savegamemulti.save={}--sauvegarde des niveaux realiser
		for i=1,4 do
			savegamemulti.save[i]={}
			for j=1,4 do
				savegamemulti.save[i][j]={}
				savegamemulti.save[i][j].name="Save "..j
				savegamemulti.save[i][j].exist=false
				savegamemulti.save[i][j].nb=0
				savegamemulti.save[i][j].typeso={}
				savegamemulti.save[i][j].time={}
			end
		end
		loadsave.saveTable(savegamemulti, "undeuxtroissoleilmulti.json" )
	else
		for key,value in ipairs(savegamemulti.dev) do
			savegamemulti.dev[tonumber(key)]=value	
		end
		for key,value in ipairs(savegamemulti.unit) do
			if savegamemulti.unit[tonumber(key)]==nil then
				savegamemulti.unit[tonumber(key)]={}
			end
			for key1,value1 in ipairs(value) do
				savegamemulti.unit[tonumber(key)][tonumber(key1)]=value1
			end
		end
		for key,value in ipairs(savegamemulti.bouton) do
			if savegamemulti.bouton[tonumber(key)]==nil then
				savegamemulti.bouton[tonumber(key)]={}
			end
			for key1,value1 in ipairs(value) do
				savegamemulti.bouton[tonumber(key)][tonumber(key1)]=value1
			end
		end
		print("here savegamemulti.save=nil\n\n\n\n ")
		for key,value in ipairs(savegamemulti.save) do
			print("here savegamemulti.save\n\n\n\n ")
			if savegamemulti.save[tonumber(key)]==nil then
				savegamemulti.save[tonumber(key)]={}
			end
			for key1,value1 in ipairs(value) do
				if savegamemulti.save[tonumber(key)][tonumber(key1)]==nil then
					savegamemulti.save[tonumber(key)][tonumber(key1)]={}
				end
				for key2,value2 in pairs(value1) do
					savegamemulti.save[tonumber(key)][tonumber(key1)][key2]=value2
				end
			end
		end
	end
	if savegamemulti.save[-1]==nil then
		savegamemulti.bouton[-1]={210,270,263,218,1,2,3,9}
		savegamemulti.save[-1]={}
		savegamemulti.save[-1][1]={}
		savegamemulti.save[-1][1].name="Save ".."1"
		savegamemulti.save[-1][1].exist=false
		savegamemulti.save[-1][1].nb=0
		savegamemulti.save[-1][1].typeso={}
		savegamemulti.save[-1][1].time={}
	end
	savegamemulti.exp=400
	savegamemulti.xp=200
	savegamemulti.xpu=6
	for i=1,#savegamemulti.save do
		for j=1,#savegamemulti.save[i] do
			if savegamemulti.save[i][j].name==nil then
				savegamemulti.save[i][j].name="Save "..j
			end
		end
	end

	if savegame.sfx==0 then
		for i=2,32 do
			audio.setVolume(0,{channel=i})
		end
	elseif savegame.sfx==nil then
		savegame.sfx=1
		savegameedit=true
		--loadsave.saveTable(savegame, "undeuxtroissoleil.json" )
	end
	if savegameedit then
		loadsave.saveTable(savegame, "undeuxtroissoleil.json" )
	end
	if savegamedevedit then
		loadsave.saveTable(savegamedev, "undeuxtroissoleilbis.json" )
	end
	if savegameresuledit then
		loadsave.saveTable(savegameresul, "undeuxtroissoleilter.json" )
	end
	local mainter=require("mainter")
	
	-- fin retourdinformation
		local chargementmain1=require("chargementmain")
		lechargementmain()--ouverture du menu principal
	cochmain=coroutine.create(function ()
	end)
	coroutine.resume(cochmain)


	co0=coroutine.create(function ()
		local chargementfirst = require ( "chargementfirst")
		chargementfirst.chargementfirst()
		if goh then
			local chargementgoh = require ( "chargementgoh")
			chargementgoh.chargementgoh()
		else
			local chargement = require ( "chargement")
			chargement.chargement()
		end
	end)
	coroutine.resume(co0)
	--coroutine.resume(co0)
	tabcorourtine[3]=co0
	co1=coroutine.create(function ()
		if not goh then
			local chargement1 = require ( "chargement1")
			chargement1.chargement1()
		else
			local chargement1 = require ( "chargement1goh")
			chargement1.chargement1()
		end
	end)
	--coroutine.resume(co1)
	tabcorourtine[4]=co1
	co2=coroutine.create(function ()
		if not goh then
			local chargement2 = require ( "chargement2")
			chargement2.chargement2()
		else
			local chargement2 = require ( "chargement2goh")
			chargement2.chargement2()
		end
	end)
	--coroutine.resume(co2)
	tabcorourtine[5]=co2
	co3=coroutine.create(function ()
		if not goh then
			local chargement3 = require ( "chargement3")
			chargement3.chargement3()
		else
			local chargement3 = require ( "chargement3goh")
			chargement3.chargement3()
		end
	end)
	--coroutine.resume(co3)
	tabcorourtine[6]=co3
	if savegame.tuto4==nil then
		if savegame.tuto2 then
			savegame.tuto4=true
		else
			savegame.tuto4=false
		end
	end
	--savegame.tuto1=true
	--print("remet tuto1")
	--savegame.tuto2=false
	--savegame.tuto3=false
end