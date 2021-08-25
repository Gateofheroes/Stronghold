local t = {}--gestion de la pause du jeu
	--	local lancerNiveau1 = require ( "niveau1" )


	--pour affichage ergonomique:
		--mettre l'image blanche sur bouton cliquer (event.x ) et va a l'objectif inchangable (coordonnee inchangable) en grossisant
		-- si fin de niveau l'image descent du haut de l'ecran en taille definitive
		--si image isVisible alors transition en alpha vers 0 ouis vers 1 en diminuant puis regrossisant
		-- ca de fermeture
			-- si recommencer grossir jusqu a etre tres important et s'eestompe en meme temps.
			-- si clique sur annuler ou play faire monter la fenetre pour qu'elle disparaisse
if not functionload then
function spritegestion(obj,detruit,typedepause) -- obj sprite a annimer,falculatif: detruit(-1 se supprime pas meme a la fin de l'anim mais en cas deremove, 0 si en fin d'anim l'obj doit se detruire, 1 si il ne se detruit pas, 2 si il se detruit pas meme en destructeur partiel),typedepause (si besoin de faire une anim qui se met pas en pause pour des besoin classique, true se met en pause quand le jeu est en pause)
	obj.pause1=0
	obj:play()
	if detruit==nil then
		detruit=0
	end
	if typedepause==nil then
		typedepause=true
	end
	if typedepause then
		obj.timeScale=vitessejeu
	end
	if detruit==-1 then
		obj.pause2=false
		obj.cptpause2=100
	elseif detruit==-2 then
		obj.pause2=false
		obj.cptpause2=100
		detruit=-1
		obj.timeScale=1
	end
	obj.fini=false -- animation de fini
	local function pcalllistobj()
		if obj~=nil and group~=nil then
			if obj.group~=nil and (not removetotal or detruit==-1) and group[obj.group]~=nil then
				group[obj.group].remove(obj)
				obj:removeSelf()
			end
		end
	end
	local function listobj(event)
		if removepartiel1==true then
			if detruit<2 then
				pcall(pcalllistobj)
				obj=nil
			end
			Runtime:removeEventListener( "enterFrame",listobj)
		elseif jeupause.etat==1 and typedepause then--technique numero 3 de mise en pause(plus de probleme avec les processeurs mtk et probleme de deferencement)
			if obj.pause1==0 then
				obj.pause1=1
				--if obj.actif==true then
				obj:pause()
				--end
			end
		else
			if obj.pause1==1 and typedepause then
				obj.pause1=0
				obj:play()
				--animliqobj.principale:play()
			end
			--print("anim en cours")
			if obj.numFrames==obj.frame then
				--print("fin anim")
				obj.fini=true
				if detruit>=0 then
					--print("fin anim1")
					if detruit==0 then
						--print("fin anim2")
						if obj~=nil then
						--	print("fin anim2")
							if obj.group~=nil and not removetotal then
								--print("suppression anim")
								group[obj.group]:remove(obj)
								obj:removeSelf()
							end
						end
						obj=nil
					end
					Runtime:removeEventListener( "enterFrame",listobj)
				elseif obj.pause1==1 then
					if obj.cptpause2>=100 then
						--print("obj.cptpause2 "..obj.cptpause2)
						if fpschoisi>1.3 then
							if obj.pause2==false then
								obj:pause()
							end
							obj.pause2=true
							obj.cptpause2=0
							if fpschoisi>1.6 then
								obj.isVisible=false
							end
						else
							if obj.pause2 then
								obj:play()
							end
							obj.timeScale=vitessejeu
							obj.pause2=false
							obj.isVisible=true
						end
					else
						obj.cptpause2=obj.cptpause2+1
					end
				end
			end
		end
	end
	Runtime:addEventListener("enterFrame",listobj)
end
function supactionencours()--suprime les action en cours quand on clique sur qqc(est aappeler dans beaucoup de fichier pas uniquement utiliser par la pause)
	if draptap==1 then
		ibatiment[numdrap].drap.isVisible=false
		if grdrap~=nil then
			group[grdrap.group]:remove(grdrap)
			grdrap:removeSelf()
			grdrap=nil
		end
		draptap=0
	end
	clicpause=1
	local function clicpause1( event )
		clicpause=0
	end
	clicpause1=timer.performWithDelay( 50, clicpause1 )
	if pv1clicactiver==1 then
		pv1clicactiver=0
		if pv1affinter~=nil then
			pv1affinter:removeSelf()
			pv1affinter=nil
		end
		Runtime:removeEventListener( "tap",clicpv1)
		pvaction.isVisible=false
		if tuto==2 then
			if tutoaction==13 then
				actiondefaite()
			end
		end
	end
	if pv2clicactiver==1 then
		pv2clicactiver=0
		Runtime:removeEventListener( "tap",clicpv2)
		pvaction.isVisible=false
	end
	if(enconst==1)then
		removenbat()
	end
	--text7 = display.newText( "20", 180, 10, native.systemFontBold, 20 )
	if (boutondev==1) then
		--local batiment = require( "batiment" )
		draptap=0
		if batiment~=nil then
			batiment:supbouton()
		end
	end
end
function timerpause(letype,letimer,lenum) -- letype is the type of timer( because I don't want all timer set pause in the same condition and also change what to do when we set pause or quit the game. Does it finish instantly the timer, cancel it...)
	local num=nil -- letimer is the timer
	if lenum~=nil then -- lenum is the index in the table if we have already one
		num=lenum
	else
		local i=1
		if modedelancement~=0 then
			i=4
		end
		if letype==1 then
			while i<=jeupause.timernb do
				if jeupause.timerlibre[i]==0 then
					num=i
					i=jeupause.timernb+1
				else
					i=i+1
				end
			end
		else
			i=jeupause.timernb
			while i>=4 do
				if jeupause.timerlibre[i]==0 then
					num=i
					i=0
				else
					i=i-1
				end
			end
		end
		if num==nil then
			jeupause.timernb=jeupause.timernb+1
			num=jeupause.timernb
		end
	end
	if jeupause.etat==1 then
		timer.pause(letimer)
	end
	if (removepartiel1==true and letype==1) or removetotal==true  then -- remove partiel is when we relaunch the game and removetotal is when we leave the game
		timer.cancel(letimer)
	else
		if letype==4 and removepartiel1==true then
			timer.cancel(letimer)
			num=-1
		else
			jeupause.timer[num]=letimer
			jeupause.timerlibre[num]=letype
		end
	end	
	return(num) 
end
end
t.pause = function ()--initialisation de la pause(lancement de niveau1)
	multi1pause=0
	--pausegr=display.newGroup()
	--background:insert(pausegr)
	recfondpause=display.newRect(contentcenterx,contentcentery,actualcontentwidth*1.1,actualcontentheight*1.1)
	recfondpause:setFillColor(0)
	recfondpause.alpha=0.5
	recfondpause.isVisible=false
	grpause=display.newGroup()
	grpause:insert(recfondpause)
	bppause=display.newImage(imbouton.menupause,2) --imbouton.pause,1)
	if goh then
		bppause.xScale=3/5*apparence/4.3
	else
		bppause.xScale=3/5*apparence
	end
	bppause.yScale=bppause.xScale
	bppause.x=xmaxscreen-bppause.width*bppause.xScale--70 --yminscreen+bandeau.yScale*50/2
	bppause.y=yminscreen+0.5*bppause.height*bppause.yScale--15--actualcontentheight
	bpplay=display.newImage(imbouton.menupause,1) --imbouton.play,1)
	bpplay.x=xmaxscreen-bppause.width*bppause.xScale--actualcontentwidth-50*3/5*apparence--actualcontentwidth-70
	bpplay.y=yminscreen+0.5*bppause.height*bppause.yScale--15--actualcontentheight
	bpplay.xScale=bppause.xScale
	bpplay.yScale=bppause.xScale
	bpplay.isVisible=false
	jeupause={}
	jeupause.etat=0--a un quand le jeu se met en pause
	jeupause.nb=0--nombre d'objet mis en pause
	jeupause.anim={}
	jeupause.timernb=0
	jeupause.timer={}
	jeupause.timerlibre={}--0 si libre pour etre utiliser 1 si occuper 2 si libre mais va etre reoccupe 3 si occuper mais a ne pas detruire--4 si il faut en cas de remove partiel doivent etre fini immediatement
	jeupause.temp=nil
	grpause:insert(bppause)
	grpause:insert(bpplay)
	local function timer1grouptest(event)
		
		grpartie:insert(grpause)
	end
	timer.performWithDelay(300,timer1grouptest)
	jeupause.nb1=0
	jeupause.anim1={}
	--issimulator=false
	local fentext
	if modedev then
		fentext=display.newText(" ",0,yminscreen, native.systemFontBold, 12*fontsize )
		fentext.anchorX=0
		fentext.anchorY=0
	end
	local oldtime= gettime()
	local actualtime
	local aff
	local moyennefps=1
	local mdmoyennefps=1
	local cpt=-20
	local moyennefpsaff
	local fpschoisiaff
	local oldfpschoisicycle
	maxpersoacc=0
	fpschoisi=1
	fpschoisicycle=0

	sonatts=0
	sonattds=0
	sonattnbs=1
	sontirds=0
	sontirnbs=1
	local compteurinit=-1
	if modedelancementinit then
		compteurinit=0
		modedelancementinit=false
	end
	local function timersonsat(event)
		if savegame.sfx==1 then
			sonatts=sonatts-4+sonattds
			if sonatts<0 then
				sonatts=0
			end
			if sonattds>4 then
				sonattnbs=sonattnbs*1.1
				if sonattnbs>3 then
					sonattnbs=2
				end
			else
				if sonattnbs>1 then 
					sonattnbs=sonattnbs*0.8
				elseif sonattnbs<1 then
					sonattnbs=1
				end
			end
			if sonattnbs>=1 then
				local volumeson=mathfloor(1/sonattnbs*100)*0.01
				for i=3,6 do
					audio.setVolume(volumeson,{channel=i})
				end
				for i=11,14 do
					audio.setVolume(volumeson,{channel=i})
				end
			end
		
			sonattds=0

			if sontirds>4 then
				sontirnbs=sontirnbs*1.1
				if sontirnbs>3 then
					sonattnbs=2
				end
			else
				if sontirnbs>1 then 
					sontirnbs=sontirnbs*0.8

				elseif sontirnbs<1 then
					sontirnbs=1
				end
			end
			if sontirnbs>=1 then
				local volumeson=mathfloor(1/sontirnbs*100)*0.01
				for i=15,19 do
					audio.setVolume(volumeson,{channel=i})
				end
			end
			--print("sonattnbs"..sonattnbs.."sonatirnbs"..sontirnbs)
			sontirds=0
		end
	end
	timer.performWithDelay(1500,timersonsat,-1)
	local function fpsaff(event)
		--letext=display.fps
		if removetotal==false then
			if jeupause.etat==0 then
				if cpt==2 then
					cpt=0
					actualtime=event.time*0.001 --os.clock()
					--print("osclock "..actualtime.." eventtime "..event.time)
					--actualtime=mathfloor(actualtime*1000)
					--aff=(actualtime-oldtime)*1000/90
					
					moyennefps=moyennefps*0.97+(actualtime-oldtime)*3/9
					mdmoyennefps=mdmoyennefps*0.8+moyennefps*0.2
					mdmoyennechosi=mdmoyennefps
					if moyennefps<0.5 then
						moyennefps=1
						mdmoyennefps=1
					end
					if mdmoyennefps<1.2 then
						mdmoyennechosi=1
					end
					if moyennefps<1.07 then
						fpschoisi=1
					elseif moyennefps<1.09 then
						fpschoisi=1.03
					elseif moyennefps<1.1 then
						fpschoisi=1.06
					elseif moyennefps<1.14 then
						fpschoisi=1.1
					elseif moyennefps<1.18 then
						fpschoisi=1.115
					elseif moyennefps<1.25 then
						fpschoisi=1.13
					elseif moyennefps<1.3 then
						fpschoisi=1.15
					elseif moyennefps<1.4 then
						fpschoisi=1.2
					elseif moyennefps<1.45 then
						fpschoisi=1.35
					elseif moyennefps<1.5 then
						fpschoisi=1.5
					elseif moyennefps<1.6 then
						fpschoisi=1.6
					elseif moyennefps<1.7 then
						fpschoisi=1.7
					elseif moyennefps<1.8 then
						fpschoisi=1.8
					elseif moyennefps<1.9 then
						fpschoisi=1.9
					elseif moyennefps<2 then
						fpschoisi=2
					elseif moyennefps<2.5 then
						fpschoisi=2.5
					elseif moyennefps<3 then
						fpschoisi=3
					elseif moyennefps<3.5 then
						fpschoisi=3.5
					elseif moyennefps<7 then
						fpschoisi=4
					elseif moyennefps<13 then
						fpschoisi=4.5
					else
						fpschoisi=1
						mdmoyennefps=1
						mdmoyennechosi=1
					end
					mdmoyennechosi=mathfloor(mdmoyennechosi*10)*0.1*vitessejeu
					oldfpschoisicycle=fpschoisicycle
					if fpschoisicycle==0 then --cycle d'hysteris
						if moyennefps>1.6 then
							fpschoisicycle=1
						end
					elseif fpschoisicycle==1 then -- fpschoisi
						if moyennefps<1.2 then
							fpschoisicycle=0
						elseif moyennefps>2.25 then
							fpschoisicycle=2
						end
					elseif moyennefps<1.7 then
						fpschoisicycle=1
					end
					if fpschoisicycle==0 and  oldfpschoisicycle~=fpschoisicycle then
						if decoranim~=nil then
							for i=1,#decoranim do
								if decoranim[i].posi>=0 then
									decoranim[i]:play()
								end
							end
						end
					end
					-- aff=mathfloor(aff*10)*0.1
					-- if aff==1 or aff==2 or aff==3 then
					-- 	aff=aff+0.1
					-- end
					moyennefpsaff=mathfloor(30/moyennefps)
					-- if moyennefpsaff==1 or moyennefpsaff==2 or moyennefpsaff==3 then
					-- 	moyennefpsaff=moyennefpsaff+0.1
					-- end
					fpschoisiaff=fpschoisi
					if fpschoisi==1 or fpschoisi==2 or fpschoisi==3 or fpschoisi==4 then
						fpschoisiaff=fpschoisiaff+0.1
					end
					fpschoisi=fpschoisi*vitessejeu
					if modedev then
						local memUsed = (collectgarbage("count")) / 1000
						local texUsed = system.getInfo( "textureMemoryUsed" ) / 1000000
						fentext.text=(nbsoldat-nbsoldatg).."\n"..moyennefpsaff.." "..fpschoisiaff.."\n"..mdmoyennechosi.." "..fpschoisicycle.."\n".."APK:"..saveret.appVersionString.."\nMax perso "..maxpersoacc.."\nTexture "..string.format("%.03f", texUsed).." Mb\nMemory "..string.format("%.03f", memUsed).." Mb"
					end
					oldtime=actualtime
					--mdmoyennechosi=2
					if fpschoisicycle>=1 and bpacc.active then
						bpaccnorm()
						if maxpersoacc<nbsoldat-nbsoldatg then
							maxpersoacc=nbsoldat-nbsoldatg
						end
						print("remet vitesse normal")
					end
					if fpschoisicycle==0 and compteurinit~=-1 then
						compteurinit=compteurinit+1
						if compteurinit>=2 then
							compteurinit=-1
							local chargementaffichage = require ( "chargementaff")
							chargementsup()
						end
					end
					-- print("fpschoisi "..fpschoisi)
					if mdmoyennechosi<0.1 or mdmoyennechosi>10 then
						mdmoyennechosi=1
					end
				else
					cpt=cpt+1
				end
			else
				oldtime=event.time*0.001 -- os.clock()
				--oldtime=mathfloor(oldtime*1000)
				cpt=0
			end
			-- debut retourdinformation
			if fpschoisicycle>=1 then
				if retinf.laginfohelp<nbsoldat+nbsoldatg and retinf.laginfohelp1<fpschoisicycle then
					retinf.laginfohelp=nbsoldat+nbsoldatg
					retinf.laginfohelp1=fpschoisicycle
					retinflaginfonb=retinflaginfonb+1
					if retinflaginfonb~=1 then
						retinf.laginfo=retinf.laginfo..","
					end

					retinf.laginfo=retinf.laginfo..[["]]..retinflaginfonb..[[":{"fpschoisicycle":"]]..fpschoisicycle..[[","nbsoldat":"]]..nbsoldat+nbsoldatg..[[","time":"]]..(mathfloor((gettime()-debutpartie)*100)*0.01)..[[","mdmoyennechosi":"]]..mdmoyennechosi..[["}]]
				end
			end
			-- fin retourdinformation
		else
			Runtime:removeEventListener("enterFrame",fpsaff)
			if modedev then
				fentext:removeSelf()
			end
		end
	end
	Runtime:addEventListener("enterFrame",fpsaff)
	--background:insert(bppause)
	--actpause=0
	--function bppause:tap(event)
	--	jeupause.etat=1
	--end
	--Runtime:addEventListener("tap",bppause)
	if not functionload then
	function appuipause()--quand on demande que le jeu se mette en pause(appui sur bouton, gagner le jeu, perdre...)		retinf.dureetemppause=os.clock()
		print("variableasup="..variableasup)
		supactionencours()
		if tuto==0 or tuto==1 then
			--if findelapartie==false then
			if jeupause.etat==0 then
				print("jeu etat 0")
				retinfdureetemppause=gettime()
				system.setIdleTimer(true)
				if tuto==0 then
					audio.pause()
				end
				audio.play( son.uicl2)
				jeupause.etat=1
				bpplay.isVisible=true
				bppause.isVisible=false
				if findelapartie==false then
					affmenuprin()
					affrecommencer()
					affreglage()
					if infoniveau==nil then
						local options = 
						{
						    parent = grpause,
						    text = "Hello World",     
						    x = xminscreen+18,
						    y = yminscreen,
						    width =200,
						    font = fonttype,   
						    fontSize = 18*fontsize,
						    align = "left"  -- alignment parameter
						}
						infoniveau=display.newEmbossedText(options)
						infoniveau.y1=infoniveau.y
						infoniveau:setFillColor(colortextfill[1],colortextfill[2],colortextfill[3])
						infoniveau:setEmbossColor(colortextemb)
						infoniveau.anchorX=0
						infoniveau.anchorY=0
						infoniveau:setFillColor(infoniveaucolor[1],infoniveaucolor[2],infoniveaucolor[3])
						if infoniveau.height==nil then
							infoniveau.height=0
						end
					end
					infoniveau.isVisible=true
					infoniveau.alpha=1
					infoniveau.y=infoniveau.y1
					transition.from(infoniveau,{time=200,alpha=0,y=infoniveau.y1-infoniveau.height} ) 
					infoniveau.text=infoniveautxt
				elseif infoniveau~=nil then
					infoniveau.isVisible=false
				end
				if multi==1 or multi==2 then
					multi1pause=system.getTimer()
				end
				--local compteur=0
				--local oldpausetemp=0
				--[[local pausetype2=function(event)
					if oldpausetemp~=jeupause.temp then
						jeupause.nb1=jeupause.nb1+1
						jeupause.anim1[jeupause.nb1]=jeupause.temp
						--jeupause.temp.pause1=1
						--jeupause.temp:pause()
						--jeupause.temp:destroy()
						jeupause.temp=nil
						compteur=0
					else
						compteur=compteur+1
					end
					if compteur>=10 then
						Runtime:removeEventListener("enterFrame",pausetype2)
					end
				end
				Runtime:addEventListener( "enterFrame",pausetype2)]]
				if jeupause.timernb>0 then
					for i=1,jeupause.timernb,1 do
						if jeupause.timerlibre[i]==1 or jeupause.timerlibre[i]==3 or jeupause.timerlibre[i]==4 then
							if jeupause.timer[i]~=nil then
								timer.pause(jeupause.timer[i])
							else
								jeupause.timerlibre[i]=0
								--print("bug timer inexistant pause 175")
							end
						end
					end
					if decoranim~=nil then
						for i=1,#decoranim do
							if decoranim[i].posi<0 then
								if decoranim[i].anim1 then
									transition.pause(decoranim[i].anim)
								end
							end
						end
					end
					if animfond.nb~=0 then
						for i=1,animfond.nb do
							if not animfond[i].lib then
								transition.pause(animfond[i].anim)
								animfond[i]:pause()
							end
						end
					end
					transition.pause("elementtype") -- tag qui se met en pause quand pause, play qunad play et detruit quand destructeur partiel
				end
			else
				if infoniveau~=nil then
					local complinfoniveau=function(obj)
						if infoniveau~=nil then
							infoniveau.isVisible=false
						end
					end
					transition.to(infoniveau,{time=200,alpha=0,y=infoniveau.y1-infoniveau.height,onComplete=complinfoniveau} ) 
				end
				print("jeupause etat 1")
				if retinfdureetemppause~=0 then
					local temppause=mathfloor((gettime()-retinfdureetemppause)*100)*0.01
					if retinf.dureetempacc~=0 then
						retinf.dureetempacc=retinf.dureetempacc+temppause
					end
					retinf.dureepause=retinf.dureepause+temppause
					retinfdureetemppause=0
				end
				retinf.nbpause=retinf.nbpause+1
				
				system.setIdleTimer( false )
				audio.resume()
				audio.play( son.uicl1)
				if multi==1 or multi==2 then
					premiersoldattime=premiersoldattime+system.getTimer()-multi1pause
					print("pause de"..multi1pause-system.getTimer())
				end
				if findelapartie==false then
					enlevermenuprin()
					enleverrecommencer()
					enleverreglage()
				end
				bpplay.isVisible=false
				bppause.isVisible=true
				--for i=1,jeupause.nb1,1 do--pause type 2
				--	jeupause.anim1[i].pause1=0
				--	jeupause.anim1[i]:play()
				--end
				if jeupause.timernb>0 then
					for i=1,jeupause.timernb,1 do
						if jeupause.timerlibre[i]==1 or jeupause.timerlibre[i]==3 or jeupause.timerlibre[i]==4 then
							timer.resume(jeupause.timer[i])
						end
					end
				end
				if decoranim~=nil then
					for i=1,#decoranim do
						if decoranim[i].posi>=0 then
							decoranim[i]:play()
						else
							if decoranim[i].anim1 then
								transition.resume(decoranim[i].anim)
							end
						end
					end
				end
				if animfond.nb~=0 then
					for i=1,animfond.nb do
						if not animfond[i].lib then
							transition.resume(animfond[i].anim)
							animfond[i]:play()
						end
					end
				end
				--for i=1,jeupause.nb,1 do
				--	jeupause.anim[i].pause1=0
				--	jeupause.anim[i]:play()
				--end
				--jeupause.nb=0
				transition.resume("elementtype")
				jeupause.etat=0
				--jeupause.timernb=0
			end
		end
		--end
	end
end
	local bpappuipause=false
	local function bppause1( event )--lorsqu'on appui sur le bouton pause 
		--print("bppause1 event")
		clicsurqqcfunc()
		numtapb=0
		if issimulator then
			local stringdisplay="collectgarbage pause avant"..collectgarbage("count")
			--print("collectgarbage pause avant"..collectgarbage("count"))
			local memUsed = (collectgarbage("count")) / 1000
			local texUsed = system.getInfo( "textureMemoryUsed" ) / 1000000
			--local textaffprint="---------MEMORY USAGE INFORMATION pause avant---------"
			--textaffprint=textaffprint.."\nSystem Memory Used:"..string.format("%.03f", memUsed).."Mb"
			stringdisplay=stringdisplay.."System Memory Used:"..string.format("%.03f", memUsed).."Mb".." Texture Memory Used:"..string.format("%.03f", texUsed).."Mb"
			--textaffprint=textaffprint.."\nTexture Memory Used:"..string.format("%.03f", texUsed).."Mb"
			--print(textaffprint)
			print(stringdisplay)
			-- print("\n---------MEMORY USAGE INFORMATION pause avant---------")
			-- print("System Memory Used:", string.format("%.03f", memUsed), "Mb")
			-- print("Texture Memory Used:", string.format("%.03f", texUsed), "Mb")
			-- print("------------------------------------------\n")
			print(math.floor(system.getInfo("textureMemoryUsed")/1048576).."mb   Lua:"..math.floor(collectgarbage("count")/1024).."mb ")
		end
		if findelapartie==false and ennemipasse>0 then
			if not bpappuipause then
				appuipause()
				bpappuipause=true
			end
			local function bpappuipausetimer( event ) 
				bpappuipause=false
			end
			timer.performWithDelay(200,bpappuipausetimer)
			if issimulator then
				local stringdisplay="collectgarbage pause avant"..collectgarbage("count")
				--print("collectgarbage pause avant"..collectgarbage("count"))
				local memUsed = (collectgarbage("count")) / 1000
				local texUsed = system.getInfo( "textureMemoryUsed" ) / 1000000
				--local textaffprint="---------MEMORY USAGE INFORMATION pause avant---------"
				--textaffprint=textaffprint.."\nSystem Memory Used:"..string.format("%.03f", memUsed).."Mb"
				stringdisplay=stringdisplay.."System Memory Used:"..string.format("%.03f", memUsed).."Mb".." Texture Memory Used:"..string.format("%.03f", texUsed).."Mb"
				--textaffprint=textaffprint.."\nTexture Memory Used:"..string.format("%.03f", texUsed).."Mb"
				--print(textaffprint)
				print(stringdisplay)
				-- print("collectgarbage pause apres"..collectgarbage("count"))
				-- local memUsed = (collectgarbage("count")) / 1000
				-- local texUsed = system.getInfo( "textureMemoryUsed" ) / 1000000
				-- local textaffprint="---------MEMORY USAGE INFORMATION pause apres---------"
				-- textaffprint=textaffprint.."\nSystem Memory Used:"..string.format("%.03f", memUsed).."Mb"
				-- textaffprint=textaffprint.."\nTexture Memory Used:"..string.format("%.03f", texUsed).."Mb"
				-- print(textaffprint)
				-- print("\n---------MEMORY USAGE INFORMATION pause apres---------")
				-- print("System Memory Used:", string.format("%.03f", memUsed), "Mb")
				-- print("Texture Memory Used:", string.format("%.03f", texUsed), "Mb")
				-- print("------------------------------------------\n")
			end
		else
			if fenconf.isVisible==false then
				if ennemipasseai==0 then
					findelapartie=true
					--appuipause()
					affmenuconf(3)
				end
				if ennemipasse==0 then
					findelapartie=true
					--appuipause()
					affmenuconf(2)
				end
				--appuipause()
				print("tentative de correction bug pause l436") -- appui sur bp pause quand on perd en normal (pb peut se passer peut etre dans d'autre cas tel gagner
			end
			if bppause.isVisible then
				bppause.fill.effect = "filter.sepia"
				bppause.fill.effect.intensity=-2
				transition.to(bppause.fill.effect, { time=500, intensity=0 } )
			else
				bpplay.fill.effect = "filter.sepia"
				bpplay.fill.effect.intensity=-2
				transition.to(bpplay.fill.effect, { time=500, intensity=0 } )
			end
		end
	end
	bppause:addEventListener( "tap", bppause1 )
	bpplay:addEventListener( "tap", bppause1 )
	if not functionload then
	function affplay()
		print("aff play")
		bpplay.isVisible=false
		bppause.isVisible=true
	end
	function affpause()
		print("aff play")
		bpplay.isVisible=true
		bppause.isVisible=false
	end
	function removepbpause()
		bpplay.isVisible=false
		bppause.isVisible=false
	end
end
	local function onSystemEvent( event )
		if ( event.type == "applicationSuspend" ) then
			if findelapartie==false then
				if jeupause.etat==0 then
					--if findelapartie==false then
					if jeupause.etat==0 then
						print("jeu etat 0")
						retinfdureetemppause=gettime()
						system.setIdleTimer(true)
						audio.pause()
						audio.play( son.uicl2)
						jeupause.etat=1
						bpplay.isVisible=true
						bppause.isVisible=false
						if findelapartie==false then
							affmenuprin()
							affrecommencer()
							affreglage()
						end
						if multi==1 or multi==2 then
							multi1pause=system.getTimer()
						end
						--local compteur=0
						--local oldpausetemp=0
						--[[local pausetype2=function(event)
							if oldpausetemp~=jeupause.temp then
								jeupause.nb1=jeupause.nb1+1
								jeupause.anim1[jeupause.nb1]=jeupause.temp
								--jeupause.temp.pause1=1
								--jeupause.temp:pause()
								--jeupause.temp:destroy()
								jeupause.temp=nil
								compteur=0
							else
								compteur=compteur+1
							end
							if compteur>=10 then
								Runtime:removeEventListener("enterFrame",pausetype2)
							end
						end
						Runtime:addEventListener( "enterFrame",pausetype2)]]
						if jeupause.timernb>0 then
							for i=1,jeupause.timernb,1 do
								if jeupause.timerlibre[i]==1 or jeupause.timerlibre[i]==3 or jeupause.timerlibre[i]==4 then
									if jeupause.timer[i]~=nil then
										timer.pause(jeupause.timer[i])
									else
										jeupause.timerlibre[i]=0
										--print("bug timer inexistant pause 175")
									end
								end
							end
							if decoranim~=nil then
								for i=1,#decoranim do
									if decoranim[i].posi<0 then
										if decoranim[i].anim1 then
											transition.pause(decoranim[i].anim)
										end
									end
								end
							end
							if animfond.nb~=0 then
								for i=1,animfond.nb do
									if not animfond[i].lib then
										transition.pause(animfond[i].anim)
										animfond[i]:pause()
									end
								end
							end
						end
					end
					--appuipause()
				end
			end
		end
	end
	Runtime:addEventListener( "system", onSystemEvent )
end
return(t)