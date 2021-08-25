local t={}--permet de supprimer entierrement les données du jeu ou partiellement
--permet d'ajouter la fenetree de confirmation de l'action desirer
local function savepourretourinf()
	if debutpartie~=0 then
		retinf.ennemipasse=ennemipasse
		retinf.race=race
		retinf.niveauch=niveauch
		retinf.modeinfini=modeinfini
		retinf.zombie=modezombie
		retinf.panique=modepanique
		retinf.squelette=modesquelette
		retinf.generaltest=generaltest
		retinf.modehard=modehard
		retinf.modewave=modewave
		retinf.nombredeviett=mathfloor(nombredeviett)
		retinf.modearmy=modearmy
		retinf.goh=goh

		retinf.dureepartie=dureepartie
		retinf.dureepartie1=dureepartie1
		retinf.accelererenn=mathfloor(accelererenn*1000)*0.001
		if savegameresul[(niveauch)+64]~=nil and not tutolevel0 then
			retinf.diffab=mathfloor(savegameresul[(niveauch)+64]*100)*0.01
		else
			retinf.diffab=0
		end
		if modeinfini then
			retinf.modeinfdif=modeinfdif
			retinf.ralenticroissance=ralenticroissance 
			retinf.infinfo=[[{"puissancevague":"]]..linf.puissancevague..[[","puissancevagueplusplus":"]]..linf.puissancevagueplusplus..[[","puissancevagueppp":"]]..linf.puissancevagueppp..[[","nbsoldatvague":"]]..linf.nbsoldatvague
			retinf.infinfo=retinf.infinfo..[[","puissanceminobj":"]]..linf.puissanceminobj..[[","puissancemaxobj":"]]..linf.puissancemaxobj..[[","decission1":"]]..linf.decission1..[[","decission2":"]]..linf.decission2..[[","decission3":"]]..linf.decission3..[[","decission4":"]]..linf.decission4..[[","decission5":"]]..linf.decission5..[[","decission6":"]]..linf.decission6..[[","decission7":"]]..linf.decission7
			retinf.infinfo=retinf.infinfo..[[","nbboss":"]]..linf.nbboss..[[","aidenbreelsoldatinf":"]]..linf.aidenbreelsoldatinf..[[","nbsoldatpasse":"]]..nbsoldatpasse..[[","varattgent":"]]..(mathfloor(varattgent*10)*0.1)..[[","varviemech":"]]..varviemech..[[","nbwavessep":"]]..linf.nbwavessep..[["}]]
		else
			retinf.modeinfdif=0
			ralenticroissance=0
			retinf.infinfo="0"
		end
		if retinf.attpv1==nil then
			retinf.attpv1=0
		else
			retinf.attpv1=mathfloor(retinf.attpv1)
		end
		retinf.ordrespawn='"'..string.gsub((retinf.ordrespawn.."}"),'"',"_")..'"'--modif pour charles
		retinf.ordredecrea='"'..string.gsub((retinf.ordredecrea.."}"),'"',"_")..'"'-- modif pour charles
		retinf.laginfo=retinf.laginfo.."}"
		retinf.ralenticroissance=ralenticroissance
		retinf.pouvoirdisp=pouvoirdisp
		retinf.nbsoldat=nbsoldat
		retinf.nbsoldatg=nbsoldatg
		retinf.tunefin=-argent/3
		retinf.ennemipassedep=ennemipassedep
		retinf.argentdep=-argentdep/3
		retinf.vagueinf=vagueinf.text
		retinf.modexp=modexp
		if modeinfini==false then
			retinf.nbvague=nbvague
		else
			retinf.nbvague=-1
		end
		retinf.genetype=isoldat[genenum].typesoldat
		retinf.dureepartietemps=gettime()-debutpartie
		print("\nretinf.dureepartietemps "..retinf.dureepartietemps)
		if retinf.dureepartietemps>30 then
			if modenormal and not modehard and multi==0 and not tutolevel0 then --multi==0 and contreai==0 and modeinfini==false and contreaihaut==0 and contreaihaut==1 and not modepanique and not modezombie and not modeperftest then
				print("mode normal")
				if savegameresul[(niveauch-1)*4+3]==0 then
					print("niveau de difficulté abaisser")
					savegameresul[(niveauch)+64]=savegameresul[(niveauch)+64]*1.05
				else
					savegameresul[(niveauch)+64]=savegameresul[(niveauch)+64]*1.025
					print("niveau de difficulté abaisser mais niveau deja gagner"..savegameresul[(niveauch)+64])
				end
			end
		end
		retinf.nombredekill=nombredekill --nombre total de mort comprenant gentil et mechant
		if retinf.dureetempacc~=0 then
			if retinfdureetemppause~=0 then
				local temppause=(gettime()-retinfdureetemppause)
				retinf.dureetempacc=retinf.dureetempacc+temppause
			end
			retinf.dureeacc=retinf.dureeacc+(gettime()-retinf.dureetempacc)
		end
		if retinfdureetemppause~=0 then
			local temppause=(gettime()-retinfdureetemppause)
			retinf.dureepause=mathfloor((retinf.dureepause+temppause)*10)*0.1
		end
		retinf.contreai=contreai
		retinf.aiactive=aiactive
		if nombredebatdai~=nil then
			retinf.nombredebatdai=nombredebatdai
		else
			retinf.nombredebatdai=0
		end
		retinf.attpv2=mathfloor(retinf.attpv2)
		retinf.dureeacc=mathfloor(retinf.dureeacc*10)*0.1
		retinf.attgene=mathfloor(retinf.attgene)
		-- retinf.nbperte --nombre de perte de gentil (comprend les bat revendu, dev, renfort qui dispparaissent)
		-- retinf.nbgenemort --nombre de fois que le general est mort
		-- retinf.attpv1
		-- retinf.attpv2
		-- retinf.attpv3
		-- retinf.attgene
		-- retinf.ordredecrea="numerodubat,dev,numero..." separer element avec , (dev si premier bat dit type1 et sinon type2 du bat)
		-- retinf.victoire=0 --0 pour niveau quitté en cours, 1 pour perdu et 2 pour gagné ou infini
		-- if nbbatiment>0 then
		-- 	local heureactuel=os.clock()
		-- 	for i=1,nbbatiment do
		-- 		retinf[(i-1)*7+1]=ibatiment[i].type1*(4*5)+ibatiment[i].type2*5+ibatiment[i].niveau --type de bat etat final
		-- 		retinf[(i-1)*7+2]=heureactuel-ibatiment[i].heuredeb --temps de vie du bat
		-- 		retinf[(i-1)*7+3]=heureactuel-ibatiment[i].heure --temps de fonctionnement au dernier niveau utilisé ()
		-- 		retinf[(i-1)*7+4]=ibatiment[i].vieenlever --nombre de vie enlever au dernier niveau --si mine c'est tune rapportée
		-- 		retinf[(i-1)*7+5]=ibatiment[i].vieenlevertt+ibatiment[i].vieenlever --nombre de vie enlver au total --si mine c'est tune rapportée
		-- 		retinf[(i-1)*7+6]=0 --coordonnée
		-- 		retinf[(i-1)*7+7]=0
		-- 	end
		-- end
		--local retinf1="b"
		local partienb=#saveret+1
		print("partienb "..partienb)
		-- while saveret[partienb]~=nil do
		-- 	partienb=partienb+1
		-- 	print("partienb1 "..partienb)
		-- end
		local postest=nil
		local displaytextconsole=""
		for pos,val in pairs(saveret) do
			displaytextconsole=displaytextconsole.." pos "..pos
			postest=tonumber(pos)
			if postest~=nil then
				displaytextconsole=displaytextconsole.." meme format"..postest
				if postest>=partienb then
					partienb=postest+1
					displaytextconsole=displaytextconsole.." partienb2 "..partienb
				end
			end
		end
		print("partienb vaut "..partienb)
		local systemgetInfoappVersionString=(system.getInfo("appVersionString"))
		if systemgetInfoappVersionString=="" then
			systemgetInfoappVersionString="0"
		end
		saveret[partienb]=[["v":"]]..systemgetInfoappVersionString..[["]]
		if nbbatiment>0 then
			local heureactuel=gettime()
				--retinf["nbbatiment"]=nbbatiment
			retinf.batiment="["
			for i=1,nbbatiment do -- ameliorer le systeme tableau de bat.................................................................................................................................-- bug var ""....
				if ibatiment[i]~=nil then
					--print("savebat "..i)
					if i~=1 then
						retinf.batiment=retinf.batiment..","
					end
					retinf.batiment=retinf.batiment.."{"..[["id":"]]..i..[["]]
					if ibatiment[i].niveau~=nil then
						if ibatiment[i].niveau>0 and ibatiment[i].isVisible~=nil then
							if ibatiment[i].isVisible and ibatiment[i].sup==0 then							
								print("le i de sauvegarde de bat vaut "..i)
								--retinf["batiment"..i]=":{t:"..ibatiment[i].type1*(4*5)+ibatiment[i].type2*5+ibatiment[i].niveau --type de bat etat final
								retinf.batiment=retinf.batiment..[[,"t":"]]..ibatiment[i].type1*(4*5)+ibatiment[i].type2*5+ibatiment[i].niveau --type de bat etat final
								if ibatiment[i].heuredeb==nil then
									--retinf["batiment"..i]=retinf["batiment"..i]..",dure:0"
									retinf.batiment=retinf.batiment..[[","dure":"0]]
								else
									--retinf["batiment"..i]=retinf["batiment"..i]..",dure:"..(heureactuel-ibatiment[i].heuredeb) --temps de vie du bat
									retinf.batiment=retinf.batiment..[[","dure":"]]..(mathfloor((heureactuel-ibatiment[i].heuredeb)*10)*0.1)
								end
								-- retinf["batiment"..i]=retinf["batiment"..i]..",dured:"..(heureactuel-ibatiment[i].heure) --temps de fonctionnement au dernier niveau utilisé ()
								-- retinf["batiment"..i]=retinf["batiment"..i]..",atttd:"..ibatiment[i].vieenlever --nombre de vie enlever au dernier niveau --si mine c'est tune rapportée
								-- retinf["batiment"..i]=retinf["batiment"..i]..",attt:"..(ibatiment[i].vieenlevertt+ibatiment[i].vieenlever) --nombre de vie enlver au total --si mine c'est tune rapportée
								-- retinf["batiment"..i]=retinf["batiment"..i]..",x:"..ibatiment[i].x --coordonnée
								-- retinf["batiment"..i]=retinf["batiment"..i]..",y:"..ibatiment[i].y
								-- retinf["batiment"..i]=retinf["batiment"..i]..",pole:"..ibatiment[i].pole
								retinf.batiment=retinf.batiment..[[","dured":"]]..(mathfloor((heureactuel-ibatiment[i].heure)*10)*0.1)
								retinf.batiment=retinf.batiment..[[","atttd":"]]..mathfloor(ibatiment[i].vieenlever)
								retinf.batiment=retinf.batiment..[[","x":"]]..(math.floor(ibatiment[i].x1*10)*0.1)
								retinf.batiment=retinf.batiment..[[","y":"]]..(math.floor(ibatiment[i].y1*10)*0.1)
								retinf.batiment=retinf.batiment..[[","pole":"]]..ibatiment[i].pole..[["]]
							else
								--retinf.batiment=retinf.batiment..i..":{id:"..i
								--retinf["batiment"..i]="unf1"
							end
						else
							--retinf.batiment=retinf.batiment..i..":{id:"..i
							--retinf["batiment"..i]="unf2"
						end
					else
						--retinf.batiment=retinf.batiment..i..":{id:"..i
						-- retinf["batiment"..i]="unf0"
					end
				end
				retinf.batiment=retinf.batiment.."}"
				--saveret[partienb]=saveret[partienb]..",".."batiment"..i..retinf["batiment"..i].."}"
			end
			retinf.batiment=retinf.batiment.."]"
			--saveret[partienb]=saveret[partienb]..[[,"batiment":]]..retinf.batiment
		end
		for key,value in pairs(retinf) do
		--for k=1,#savegameall.saveretour do
			local valeurtemp=value --retinf[savegameall.saveretour[k]]
			if valeurtemp==nil then
				valeurtemp="0"
			elseif valeurtemp==" " then
				valeurtemp="0"
			else
				if valeurtemp==false then
					valeurtemp="0"
				elseif valeurtemp==true then
					valeurtemp="1"
				end
			end
			if string.find(valeurtemp,"{")~=nil then
				saveret[partienb]=saveret[partienb]..[[,"]]..key..[[":]] ..valeurtemp --savegameall.saveretour[k]
				print("contient des accdfgxgdhdfhgdhf "..valeurtemp)
			else
				saveret[partienb]=saveret[partienb]..[[,"]]..key..[[":"]] ..valeurtemp..[["]] --savegameall.saveretour[k]
			end
			--print(valeurtemp)
			-- saveret[partienb]=saveret[partienb]..[[,"]]..savegameall.saveretour[k]..[[":"]] ..valeurtemp..[["]]
		end
		print("saveret[partienb]"..saveret[partienb])
		local contents=[["]]
		if partienb~=1 then
			contents=[["]]
		end
		contents=contents..partienb..[[":{"id":"]]..partienb..[[",]]
		contents=contents..saveret[partienb]..[[}]]
		print("contents "..contents)
		saveret[partienb]=nil
		-- for pos,val in pairs(saveret[partienb]) do
		-- 	if val==nil then
		-- 		saveret[partienb].pos="nil"
		-- 		print("valeur nulle "..pos)
		-- 	end
		-- end
		local loadsave = require("loadsave")
		--loadsave.print_r (retinf)
		-- local partie=saveret[#saveret].." "
		-- local k=1
		-- local j=1
		-- for i=#saveret+1,#retinf+#saveret+1 do
		-- 	if k<=#savegameall.saveretour then
		-- 		local resultenvoy=retinf[savegameall.saveretour[k]]
		-- 		if resultenvoy==nil then
		-- 			resultenvoy="n"
		-- 		end
		-- 		saveret[partie..savegameall.saveretour[k]]=resultenvoy
		-- 		k=k+1
		-- 	else
		-- 		print("sddgh")
		-- 		--for j=1,retinf["nbbatiment"] do
		-- 			saveret[partie.."batiement"..j]=retinf["batiment"..j]
		-- 			--print("sdtthg")
		-- 			-- local resultenvoy=retinf[j]
		-- 			-- if resultenvoy==nil then
		-- 			-- 	resultenvoy="n"
		-- 			-- 	print("nilvalue")
		-- 			-- end
		-- 			-- saveret[partie..j]=resultenvoy
		-- 			j=j+1
		-- 		-- end
		-- 	end
			
		-- end
		-- saveret[#saveret+1]=partie+1 --numero de la partie
		-- local savett={}
		-- local l=#savett
		-- print("l "..l)
		-- savett[l]=l.." "..retinf1

		--print(savett[l])

		-- print(" ")
		-- print(" ")
		-- print(" ")
		--loadsave.print_r (saveret)
		loadsave.saveTable(saveret,"undeuxtroissoleilretinf.json",nil,contents)
		saveret=nil
		saveret=loadsave.loadTable("undeuxtroissoleilretinf.json")
		if isandroid and analyticsactif then --or isiphone then
			if true then
				analytics.logEvent("partie",saveret[partienb])
			end
		end
		--savefurry(saveret,true)
		local co=coroutine.create(function ()
			--if not issimulator then
				print("envoie des infos au serveur")
				--local serveur=require("serveur")
				evnoiedesfichier()
			--end
		end)
		coroutine.resume(co)


		-- fin retourdinformation
	else
		print("niveau non commencer")
	end
	debutpartie=0
end

local completedisp=function(obj)
	print("remise")
	if recfondpause~=nil then
		recfondpause.isVisible=false
		fenconf.isVisible=false
		fenconf.x=0
		fenconf.y=0
		if actionimg~=nil then
			actionimg:removeEventListener("tap",confirm1)
			fenconf:remove(actionimg)
			actionimg:removeSelf()
			actionimg=nil
		end
		fenaff=false-- fenetre afficher
	end
end
local completedisp1=function(obj)
	if actionimg~=nil then
		fenconf:remove(actionimg)
		actionimg:removeSelf()
		actionimg=nil
	end
	print("remise")
	if recfondpause~=nil then 
		recfondpause.isVisible=false
	end
	if fenconf~=nil then
		fenconf.isVisible=false
		fenconf.x=0
		fenconf.y=0
	end
end
function cacherfenetre()--cacher fenetre contextuel
	recfondpause.alpha=0
	transition.from(recfondpause,{time=500,alpha=0.5})
	print("cacher fenetre")
	transition.to(fenconf,{time=500,transition=easing.inCirc, y=contentcentery-actualcontentheight-fenconf.height*fenconf.yScale*0.5, onComplete=completedisp, tag="fenconf" ,onCancel=completedisp})
	--fenconf.isVisible=false
	-- if actionimg~=nil then
	-- 	actionimg:removeEventListener("tap",confirm1)
	-- 	fenconf:remove(actionimg)
	-- 	actionimg:removeSelf()
	-- 	actionimg=nil
	-- end
	-- fenaff=false-- fenetre afficher
end
local function destructeurpartielplus(nivsuivant)--retour menu prin(permet de pas recharger les images)
	removetotal=true
	Runtime:removeEventListener( "enterFrame", construire100 )
	Runtime:removeEventListener( "key", onKeyEvent )
	Runtime:removeEventListener( "system", onSystemEvent )
	transition.cancel("element")
	transition.cancel("boutdevremove")

	if infoniveau~=nil then
		display.remove(infoniveau)
		infoniveau=nil
	end
	if decoration~=nil then
		for i=1,#decoration do
			display.remove(decorationaff[i])
			-- if decorationaff[i]~=nil then
			-- 	group[decorationaff[i].group]:remove(decorationaff[i])
			-- 	decorationaff[i]:removeSelf()
				decorationaff[i]=nil
			-- end
		end
		decorationaff=nil
	end
	if issimulator then
		print("collectgarbage removetotal avant"..collectgarbage("count"))
		local memUsed = (collectgarbage("count")) / 1000
		local texUsed = system.getInfo( "textureMemoryUsed" ) / 1000000
		print("\n---------MEMORY USAGE INFORMATION removetotal avant---------")
		print("System Memory Used:", string.format("%.03f", memUsed), "Mb")
		print("Texture Memory Used:", string.format("%.03f", texUsed), "Mb")
		print("------------------------------------------\n")
	end
	if multibouton~=nil then
		for i=1,#multiboutontext do
			multigroup:remove(multiboutontext[i])
			multiboutontext[i]:removeSelf()
			multiboutontext[i]=nil
		end
		multiboutontext=nil
		for i=1,#multiboutonprix do
			multigroup:remove(multiboutonprix[i])
			multiboutonprix[i]:removeSelf()
			multiboutonprix[i]=nil
		end
		multiboutonprix=nil
		for i=1,#multibouton do
			multigroup:remove(multibouton[i])
			multibouton[i]:removeSelf()
			multibouton[i]=nil
		end
		multibouton=nil
		multigroup:removeSelf()
		multigroup=nil
	end
	if diamantgagner~=nil then
		fenconf:remove(diamantgagner)
		diamantgagner:removeSelf()
		diamantgagner=nil
	end
	for i=1,jeupause.timernb,1 do
		if jeupause.timerlibre[i]==3 then
			-- print("cancel 3")
			timer.cancel(jeupause.timer[i])
		end
	end
	if fleche~=nil then
		fleche:removeSelf()
		fleche=nil
	end
	if texttuto~=nil then
		texttuto:removeSelf()
		texttuto=nil
	end
	if boutontutoskip~=nil then
		boutontutoskip:removeSelf()
		boutontutoskip=nil
	end
	if flecheentrecre~=nil then
		flecheacccre=nil
	end
	if flecheacc~=nil then
		background:remove(flecheacc)
		flecheacc:removeSelf()
		flecheacc=nil
		background:remove(flecheacctx)
		flecheacctx:removeSelf()
		flecheacctx=nil
	end
	if flecheentrecre==1 then
		flecheentrecre=2
		background:remove(flecheentre)
		flecheentre:removeSelf()
		flecheentre=nil
		background:remove(flecheentretx)
		flecheentretx:removeSelf()
		flecheentretx=nil
	end
	jeupause.timernb=1
	if timerdeniv1~=nil then
		timerdeniv1.timer2num=nil
		timerdeniv1.timer1num=nil
		timerdeniv1.timerprionum=nil
	end
	for i=1,#vagsuib do
		vagsuig:remove(vagsuib[i])
		vagsuib[i]:removeSelf()
	end
	removepbpause()
	if fenetregagne~=nil then
		fenconf:remove(fenetregagne)
		fenetregagne:removeSelf()
		fenetregagne=nil
		fenetreconf.isVisible=true
	end
	local function timerfin3(event)
		recfondpause:removeSelf()
		recfondpause=nil
		grpause:removeSelf()
		grpause=nil
		numtimerpouvoir=nil
		cheminarr=nil
		obstaclsold=nil
		if decoranim~=nil then
			for i=1,#decoranim do
				if decoranim[i].posi>=0 then
					decoranim[i]:removeEventListener("sprite",spritelistenerdecoranim)
				end
				decoranim[i]:removeSelf()
				decoranim[i]=nil
			end
		end
		decoranim=nil
		map1p=nil
		grpartie:removeSelf()
		grpartie=nil
		
		chemin=nil
		obstacle=nil
		obstacle1=nil
		for i=1,2048,1 do
			background:remove(group[i])
			group[i]:removeSelf()
		end
		background:removeSelf()
		background=nil
		genepointinit=nil
		nbvague=nil
		pointdep=nil
		--group:removeSelf()
		--jeupause=nil
		if nivsuivant==nil then
			local mainbis1=require("mainbis")
			lemain(nil,true)
			if boutonnivsuivant~=nil then 
				fenconf:remove(boutonnivsuivant)
				boutonnivsuivant:removeSelf()
				boutonnivsuivant=nil
				if not goh then
					fenconf:remove(boutonnivsuivant1)
					boutonnivsuivant1:removeSelf()
					boutonnivsuivant1=nil
				end
			end
			fenconf:removeSelf()


			-- artha:removeSelf()
			-- bvide:removeSelf()
			-- bplein:removeSelf()
			-- bdeb:removeSelf()
			-- blackscreen:removeSelf()
			local chargementaffichage = require ( "chargementaff")
			chargementsup()
		else
			if boutonnivsuivant~=nil then 
				fenconf:remove(boutonnivsuivant)
				boutonnivsuivant:removeSelf()
				boutonnivsuivant=nil
				if not goh then
					fenconf:remove(boutonnivsuivant1)
					boutonnivsuivant1:removeSelf()
					boutonnivsuivant1=nil
				end
			end
			fenconf:removeSelf()
			local chargementaffichage = require ( "chargementaff")
			chargementsup()
			actionmenu= require("menucarte")
			actionmenu.ordre(0,1,niveauch+1,race+1)
		end

		
		
		if savegame.sound==true then
			--audio.play( son.uicl2)
			local volumesound=0.5
			if savegame.soundvol~=nil then
				volumesound=savegame.soundvol
			else
				savegame.soundvol=volumesound
			end
			audio.setVolume(volumesound)
		end
		collectgarbage("collect")
		if issimulator then
			print("collectgarbage removetotal apres"..collectgarbage("count"))
			local memUsed = (collectgarbage("count")) / 1000
			local texUsed = system.getInfo( "textureMemoryUsed" ) / 1000000
			print("\n---------MEMORY USAGE INFORMATION removetotal apres---------")
			print("System Memory Used:", string.format("%.03f", memUsed), "Mb")
			print("Texture Memory Used:", string.format("%.03f", texUsed), "Mb")
			print("------------------------------------------\n")
		end
	end
	local timerfin1=timer.performWithDelay( 500,timerfin3)
end
local function destructeurpartiel(action,nivsuivant)--ex:recommencer--action 1 recommencer 0 retour menu prin
	--[[gameanalytics = require 'plugin.gameanalytics_v2'
	gameanalytics.addProgressionEvent {
	    progressionStatus = "Complete",
	    progression01 = ""..niveauch,
	    progression02 = ""..vagueinf.text,
	}
	gameanalytics.endSession()--]]
	if action==0 then
		audio.setVolume(0)
		audio.resume()
	end
	functionload=true
	system.setIdleTimer(true)
	-- debut retourdinformation
	-- savepourretourinf()// ici enlever
	--retour d'information
	if issimulator then
		print("collectgarbage removepartiel debut"..collectgarbage("count"))
		local memUsed = (collectgarbage("count")) / 1000
		local texUsed = system.getInfo( "textureMemoryUsed" ) / 1000000
		print("\n---------MEMORY USAGE INFORMATION removepartiel avant---------")
		print("System Memory Used:", string.format("%.03f", memUsed), "Mb")
		print("Texture Memory Used:", string.format("%.03f", texUsed), "Mb")
		print("------------------------------------------\n")
	end
	if action==0 then
		-- local largeur = 782/actualcontentwidth--1920/1080 dimension de l'image du menu
		-- local hauteur = 400/actualcontentheight
		-- local zoom = 0
		-- if (largeur < hauteur) then
		-- 	zoom = hauteur
		-- else
		-- 	zoom = largeur
		-- end
		-- blackscreen=display.newImage(imagemenu.blackscreen,1)
		-- blackscreen.xScale=(actualcontentwidth*0.1)+0.1
		-- blackscreen.yScale=(actualcontentheight*0.1)+0.1
		-- blackscreen.x=contentcenterx
		-- blackscreen.y=contentcentery
		-- artha=display.newImage(imagemenu.artha,1)
		-- artha.x=contentcenterx
		-- artha.y=contentcentery
		-- artha.xScale=(1/zoom)-0.01
		-- artha.yScale=(1/zoom)-0.01
		-- bvide=display.newImage(imagemenu.bchargementvide,1)
		-- bvide.y=actualcontentheight*0.85
		-- bvide.x=contentcenterx
		-- bplein=display.newImage(imagemenu.bchargementplein,1)
		-- bplein.y=actualcontentheight*0.85
		-- bplein.x=contentcenterx-60*0.75
		-- bplein.xScale=0.2
		-- bdeb=display.newImage(imagemenu.bchargementdeb,1)
		-- bdeb.x=bvide.x
		-- bdeb.y=bvide.y
		local chargementaffichage = require ( "chargementaff")
		chargementaffichage.chargementaff(2)
	end
	grouppvaction.isVisible=false
	--
	-- geneb:removeEventListener( "tap", geneb )
	local animconst = require ( "constructanim" )
	--for i=0,nbbatiment-1,1 do
	--	if ibatiment[i].sup1==0 then
	--		ibatiment[i].sup=1
	--		ibatiment[i].sup1=1
	--		--instance2:removeEventListener( "sprite",instance)
	--		ibatiment[i].supprimer=1
	--		animconst.constructanim(4,0,ibatiment[i],0)
	--	end
	--end
	if groupstat~=nil then
		fenconf:remove(groupstat)
		groupstat:removeSelf()
		groupstat=nil
	end
	-- if nbatiment1exist~=nil then
	-- 	group[2048]:remove(nbatiment1)
	-- 	nbatiment1:removeSelf()
	-- 	nbatiment1exist=nil
	-- end
	if pouvoir3activer==1 then
		desactivpv3( )
	end
	for i=nbsoldatg,nbsoldat do
		if isoldat[i].mine==false then
			isoldat[i].vie=0
			isoldat[i].vivant=false
			isoldat[i].ombre.isVisible=false
			isoldat[i].rectvie.alpha=0
			if isoldat[i].rectxp~=nil then
				isoldat[i].rectxp.isVisible=false
				--isoldat[i].rectxp=nil
			end
			if isoldat[i].pierretombale~=nil then
				group[isoldat[i].pierretombale.group]:remove(isoldat[i].pierretombale)
				isoldat[i].pierretombale:removeSelf()
				isoldat[i].pierretombale=nil
			end
		end
	end
	for i=1,jeupause.timernb,1 do
		if jeupause.timerlibre[i]==1 then
			jeupause.timerlibre[i]=0
			timer.cancel(jeupause.timer[i])
		elseif jeupause.timerlibre[i]==3 or jeupause.timerlibre[i]==4 then
			timer.resume(jeupause.timer[i])
		end
	end
	--numtimerpouvoir={}--pour la pause
	-- for i=1,10 do
	-- 	numtimerpouvoir[i]=nil
	-- end
	transition.cancel("element")
	transition.cancel("elementtype")
	--for i=1,jeupause.nb,1 do
	--	jeupause.anim[i].pause1=0
	--	jeupause.anim[i]:play()
	--end
	--jeupause.nb=0
	removepartiel1=true
	jeupause.etat=0
	--jeupause.timernb=4
	if timerdeniv1~=nil then
		timerdeniv1.timer2num=nil
		timerdeniv1.timer1num=nil
		timerdeniv1.timerprionum=nil
		timer2spawn=nil
		timer1spawn=nil
		timerpriospawn=nil
		nouvague=0-- -1 pour vague en cours 0 vague fini et 1 nouvelle vague demander
		vagueencours=1
	end
	-- vagsui:removeEventListener( "tap", vagsui )
	-- vagsui:removeSelf()
	if pouvoirdisp>0 then
		pv1ch.height=0--pv1ch.height+400*0.1/tchpv1--tchpv1 est le temps de chargement du pouvoir 1 en sec
		pv1ch.pv1cpt=0--pv1cpt+0.5
		pv1clicactiver=0--est a 1 quand on a cliquer sur le pouvoir et qu'il reste une action a faire
		pv1clic=0
		clicpouvoir1=0--si on clique sur le bouton pouvoir1 alors qu'il n'est pas charger
		pv1ch.pv1cpt=0 --compteur permettant de savoir quand le pouvoir est pret
		pv1ch.pv1cpt=tchpv1+1
		--pv1cl.isVisible=true
		if pv1affinter~=nil then
			pv1affinter:removeSelf()
			pv1affinter=nil
		end
		for i=1, pouvoir1cpt do
			if pouvoir1action[i]~=nil then
				pouvoir1action[i].isVisible=false
			end
		end
		if pouvoirdisp>1 then
			pv2ch.height=0--pv1ch.height+400*0.1/tchpv1--tchpv1 est le temps de chargement du pouvoir 1 en sec
			pv2ch.pv2cpt=0--pv1cpt+0.5
			pv2clicactiver=0
			pv2clic=0
			clicpouvoir2=0
			pv2ch.pv2cpt=0
			pv2ch.pv2cpt=tchpv2
			--pv2cl.isVisible=true
			if pouvoirdisp>2 then
				pv3ch.height=0--pv1ch.height+400*0.1/tchpv1--tchpv1 est le temps de chargement du pouvoir 1 en sec
				pv3ch.pv3cpt=0--pv1cpt+0.5
				pv3clic=0--pour les priorité (se met a 1 quand on clique sur l'un des boutons)
				clicpouvoir3=0
				pv3ch.pv3cpt=0
				pv3ch.pv3cpt=tchpv3
				--pv3cl.isVisible=true
			end
		end
	end
	
	
	
	
	
	
	
	
	
	--local function timerfin0(event )
		--removepartiel1=true
		local function timerfin(event)
			if nbbatiment>0 then
				for i=1,nbbatiment do
					if ibatiment~=nil then
						if ibatiment[i]~=nil then
							if ibatiment[i].sup1==0 then
								ibatiment[i].sup=1
								ibatiment[i].sup1=1
								--instance2:removeEventListener( "sprite",instance)
								ibatiment[i].supprimer=1
								local num=i
								print("le bat num va etre detruit"..num)
								if ibatiment[num].type1==3 then
									ibatiment[num]:removeEventListener( "tap", ibatiment )
									ibatiment[num].recuptune.isVisible=false
									display.remove(ibatiment[num])
									-- group[ibatiment[num].group]:remove(ibatiment[num]) -- group[mathfloor(ibatiment[num].y)+10+1024]:remove(ibatiment[num])
									-- ibatiment[num]:removeSelf()
									display.remove(ibatiment[num].chargement1)
									--group[ibatiment[num].group]:remove(ibatiment[num].chargement1)
									--ibatiment[num].chargement1:removeSelf()
									display.remove(ibatiment[num].chargement)
									--group[ibatiment[num].group]:remove(ibatiment[num].chargement)
									--ibatiment[num].chargement:removeSelf()
									-- group[ibatiment[num].echafaudage.group]:remove(ibatiment[num].echafaudage)
									-- ibatiment[num].echafaudage:removeSelf()
									display.remove(ibatiment[num].echafaudage)
									--group[ibatiment[num].group+20]:remove(isoldat[ibatiment[num].numsol].rectvie)--ibatiment[numero].group+20
									--isoldat[ibatiment[num].numsol].rectvie:removeSelf()
									display.remove(isoldat[ibatiment[num].numsol].rectvie)
									isoldat[ibatiment[num].numsol].vie=0
									isoldat[ibatiment[num].numsol].vivant=false
									display.remove(ibatiment[num].recuptune)
									--group[ibatiment[num].recuptune.group]:remove(ibatiment[num].recuptune)
									--ibatiment[num].recuptune:removeSelf()
								else
									detruirebat(num)
								end
							end
						end
						--constructionanim(ibatiment[num],2)--animconst.constructanim(4,0,ibatiment[i],0)
					end
				end
			end
			local function timerfin2(event)
				if pouvoirdisp>0 then
					pv1ch.height=0--pv1ch.height+400*0.1/tchpv1--tchpv1 est le temps de chargement du pouvoir 1 en sec
					--pv1cpt=0--pv1cpt+0.5
					pv1ch.pv1cpt=tchpv1
					if pouvoirdisp>1 then
						pv2ch.height=0--pv1ch.height+400*0.1/tchpv1--tchpv1 est le temps de chargement du pouvoir 1 en sec
						--pv2cpt=0--pv1cpt+0.5
						pv2ch.pv2cpt=tchpv2
						if pouvoirdisp>2 then
							pv3ch.height=0--pv1ch.height+400*0.1/tchpv1--tchpv1 est le temps de chargement du pouvoir 1 en sec
							--pv3cpt=0--pv1cpt+0.5
							pv3ch.pv3cpt=tchpv3
						end
					end
				end

				--construireinf:removeSelf()
				--construirearch:removeSelf()
				--construire:removeSelf()
				print("collectgarbage isoldat remove avant"..collectgarbage("count"))
				for i=nbsoldatg,nbsoldat do
					isoldat[i]=nil
				end
				print("collectgarbage isoldat remove apres"..collectgarbage("count"))
				isoldat=nil
				nbsoldat=0
				nbsoldatg=0
				print("collectgarbage isoldat remove apres1"..collectgarbage("count"))
				for i=1,nbbatiment do
					ibatiment[i]=nil
				end
				ibatiment=nil
				--for i=1,2048,1 do
				--	background:remove(group[i])
				--	group[i]:removeSelf()
				--	group[i]=nil
				--end
				--background:remove(background)
				--background=nil
				cacherfenetre()
				--fenconf.isVisible=false
				--fenaff=false-- fenetre afficher
				print("recommencer")
				local lancerNiveau1 = require ( "niveau1" )
				enlevermenuprin()
				enleverrecommencer()
				enleverreglage()
				jeupause.nb=0
				jeupause.etat=0
				collectgarbage("collect")
				if issimulator then
					print("collectgarbage removepartiel apres"..collectgarbage("count"))
					local memUsed = (collectgarbage("count")) / 1000
					local texUsed = system.getInfo( "textureMemoryUsed" ) / 1000000
					print("\n---------MEMORY USAGE INFORMATION removepartiel apres---------")
					print("System Memory Used:", string.format("%.03f", memUsed), "Mb")
					print("Texture Memory Used:", string.format("%.03f", texUsed), "Mb")
					print("------------------------------------------\n")
				end
				if action==1 then 
					if animfond.nb~=0 then
						for i=1,animfond.nb do
							if not animfond[i].lib then
								transition.resume(animfond[i].anim)
								animfond[i]:play()
							end
						end
					end
					jeupause.timernb=14
					if multi==0 and not(aiactive==1 and contreaihaut==1) then
						timerdeniv1.timer2num=nil
						timerdeniv1.timer1num=nil
						timerdeniv1.timerprionum=nil
					end
					affinfogr.isVisible=false
					if goh then
						if  (niveauch>16 or modezombie or modepanique or modeinfini or modesquelette ) and not tutolevel0 then
							showadsplaybonus(true)
						else
							--display.newText("display Ads",0,0,native.systemFont, 18)
							showshortads(true)
						end
					else
						showadsplaybonus(true)
					end
					lancerNiveau1.niveau1(1)
				elseif action==0 then
					--loadsbonus()
					if goh then
						if  (niveauch>16 or modezombie or modepanique or modeinfini or modesquelette ) and not tutolevel0 then

						else
							showshortads()
						end
					end
					destructeurpartielplus(nivsuivant)
				end
			end
			timer.performWithDelay( 100,timerfin2)
		end
		local timerfin1=timer.performWithDelay( 200,timerfin)
	--end
	--local timerfin01=timer.performWithDelay( 500,timerfin0)

		--		ibatiment[0].sup=1
		--	ibatiment[0].sup1=1
			--instance2:removeEventListener( "sprite",instance)
		--	ibatiment[0].supprimer=1
	--animconst.constructanim(4,0,ibatiment[0],0)
	--isoldat=nil
	--isoldat:removeSelf()
	--for i=1,nbsoldat do

	--end
end
local function reinit()--corection de lam odification pour perdu
	conf=display.newImage(imbouton.monnaie,1) -- imbouton.valider,1)
	conf.x=fenetreconf.x+60
	conf.y=fenetreconf.y+40
	conf.xScale=0.15*apparence
	conf.yScale=0.15*apparence
	--conf.isVisible=false
	refu=display.newImage(imbouton.monnaie,2) --imbouton.supprimer,1)
	refu.x=fenetreconf.x-60
	refu.y=fenetreconf.y+40
	refu.xScale=0.15*apparence
	refu.yScale=0.15*apparence

	fenconf:insert(conf)
	fenconf:insert(refu)
end
function initfenetre()--init de la fenetre qui s'affiche quand on gagne perd, recommence...
	print("init fenetre")
	fenetreconf=display.newImage(imbouton.fenconf,1)
	fenetreconf.x=contentcenterx --actualcontentwidth/2-50
	fenetreconf.y=contentcentery --actualcontentheight/2
	fenetreconf.xScale=1.5*apparence
	--fenetreconf.isVisible=false
	
	-- conf=display.newImage(imbouton.valider,1)
	-- conf.x=fenetreconf.x+20
	-- conf.y=fenetreconf.y+40
	-- conf.xScale=0.2
	-- conf.yScale=0.2
	-- --conf.isVisible=false
	-- refu=display.newImage(imbouton.supprimer,1)
	-- refu.x=fenetreconf.x-20
	-- refu.y=fenetreconf.y+40
	-- refu.xScale=0.2
	-- refu.yScale=0.2
	--refu.isVisible=false
	fenletext="etes vous sur de vouloir "
	fentext=display.newEmbossedText(" ",fenetreconf.x,fenetreconf.y-40,fonttype,30*apparence*fontsize) -- native.systemFontBold, 12*apparence )
	fentext.y1=fentext.y
	--fentext.text=fenletext
	fentext:setEmbossColor(colortextemb)
	fentext:setFillColor(0,0,0)
	fenconf=display.newGroup()
	fenconf.isTouchable=true
	grpause:insert(fenconf)

	fenconf:insert(fenetreconf)
	reinit()--on l'appelle pour eviter d'avoir de fois le meme code
	
	fenconf:insert(fentext)
	fenconf.isVisible=false
	fenaff=false-- fenetre afficher
	fenaction=nil
end
local function affmenuconfaction0(textaction) -- retour au menu principal
	textaction="retourner au menu principal"
	if actionimg~=nil then
		actionimg:removeEventListener("tap",confirm1)
		fenconf:remove(actionimg)
		actionimg:removeSelf()
		actionimg=nil
	end
	actionimg=display.newImage(imbouton.menupause,4) -- imbouton.retourmenuprin,1)
	actionimg.img=4
	return textaction
end
local function affmenuconfactionm1(textaction)
	textaction="tutolevel"
	if actionimg~=nil then
		actionimg:removeEventListener("tap",confirm1)
		fenconf:remove(actionimg)
		actionimg:removeSelf()
		actionimg=nil
	end
	actionimg=display.newImage(imbouton.menupause,4) -- imbouton.retourmenuprin,1)
	actionimg.img=4
	return textaction
end
local function affmenuconfaction1(textaction) --  menu recommencer
	if actionimg~=nil then
		actionimg:removeEventListener("tap",confirm1)
		fenconf:remove(actionimg)
		actionimg:removeSelf()
		actionimg=nil
	end
	textaction="recommencer le niveau"
	-- fentext.text=textaction
	-- fenconf:remove(fentext)
	-- fenconf:insert(fentext)
	-- fentext.isVisible=true
	-- fentext.alpha=1
	-- fentext.size=40
	-- print("recommencer "..tostring(fentext))
	actionimg=display.newImage(imbouton.menupause,3) -- imbouton.recommencer,1)
	actionimg.img=3
	return textaction
end
local function affmenuconfaction2(textaction) -- menu quand on perdu
	if actionimg~=nil then
		actionimg:removeEventListener("tap",confirm1)
		fenconf:remove(actionimg)
		actionimg:removeSelf()
		actionimg=nil
	end
	--background.fill.effect = "filter.blur"
	if modeinfini==true then
		recfondpause:setFillColor(0.6,0.4,0)
		fenetregagne=display.newImage(imbouton.gagne,1)
		fenetregagne.x=contentcenterx --actualcontentwidth/2-50
		fenetregagne.y=contentcentery --actualcontentheight/2
		fenetregagne.xScale=fenetreconf.xScale*fenetreconf.width/fenetregagne.width
		fenetregagne.yScale=fenetreconf.yScale*fenetreconf.height/fenetregagne.height
		fenetregagne.frame=1
		fenconf:insert(fenetregagne)
		fenetreconf.isVisible=false
		fenconf:remove(fentext)
		fenconf:insert(fentext)
		retinf.victoire=2
		local gainetoile=mathfloor(nombredekill/4/modexp)
		local palier=50
		while gainetoile>palier do
			gainetoile=palier+mathfloor((gainetoile-palier)*0.8)
			palier=palier+50
		end
		if -argentdep/3>2000 then
			gainetoile=mathfloor(gainetoile*0.1)
		end
		textaction="\n               "..gainetoile.."\n"..texttraduction.rate[2]..nombredekill..texttraduction.rate[3]..vagueinf.text
		local calcultest=mathabs(fric1)/7-savegame.monney
		if calcultest>1 or calcultest<-1 then
		--if fric1/7~=savegame.monney then
			-- native.showAlert( "Met a 0 l'argent", "contacter arthafrance@gmail.com", { "OK" } )
			fric1=0
			print("triche1")
		else
			if fric1<0 then
				fric1=-fric1+gainetoile*7
			else
				fric1=-(fric1+gainetoile*7)
			end
			fric1=mathfloor(fric1)
			savegame.yomec=savegame.yomec+gainetoile*5
			savegame.diplay=gettime()
			local fricpos=fric1
			if fricpos<0 then
				fricpos=-fricpos
			end
			savegame.content=(-fricpos/3-1)/savegame.display
			savegame.monney=fricpos/7
			local loadsave = require("loadsave")
			loadsave.saveTable(savegame, "undeuxtroissoleil.json" )
		end
	elseif modesquelette or modezombie or modepanique then
		recfondpause:setFillColor(0.6,0.4,0)
		fenetregagne=display.newImage(imbouton.gagne,1)
		fenetregagne.x=contentcenterx --actualcontentwidth/2-50
		fenetregagne.y=contentcentery --actualcontentheight/2
		fenetregagne.xScale=fenetreconf.xScale*fenetreconf.width/fenetregagne.width
		fenetregagne.yScale=fenetreconf.yScale*fenetreconf.height/fenetregagne.height
		fenetregagne.frame=1
		fenconf:insert(fenetregagne)
		fenetreconf.isVisible=false
		fenconf:remove(fentext)
		fenconf:insert(fentext)
		retinf.victoire=2
		local function getlevel(vaguetext,levelavant)
			local nbaugmentation=0
			while tonumber(vaguetext)>=levelavant*5 do
				levelavant=levelavant+1
				nbaugmentation=nbaugmentation+1
			end
			return levelavant,nbaugmentation
		end
		local levelatteint,nbaugmentation
		if modesquelette then
			levelatteint,nbaugmentation=getlevel(vagueinf.text,savegame.lvlsquelette)
			savegame.lvlsquelette=levelatteint
		elseif modepanique then
			levelatteint,nbaugmentation=getlevel(vagueinf.text,savegame.lvlpanique)
			savegame.lvlpanique=levelatteint
		else
			levelatteint,nbaugmentation=getlevel(vagueinf.text,savegame.lvlzombie)
			savegame.lvlzombie=levelatteint
		end
		local gaindiam
		if mathfloor(tonumber(vagueinf.text)/5)>=1 then
			fenetregagne.diam=true
			gaindiam=mathfloor(mathfloor(tonumber(vagueinf.text)/5)*10)
			local calcultest=mathabs(fric1)/7-savegame.monney
			if calcultest>1 or calcultest<-1 then
			--if fric1/7~=savegame.monney then
				-- native.showAlert( "Met a 0 l'argent", "contacter arthafrance@gmail.com", { "OK" } )
				fric1=0
				print("triche1")
			else
				if fric1<0 then
					fric1=-fric1+gaindiam*7
				else
					fric1=-(fric1+gaindiam*7)
				end
				fric1=mathfloor(fric1)
				savegame.yomec=savegame.yomec+gaindiam*5
				savegame.diplay=gettime()
				local fricpos=fric1
				if fricpos<0 then
					fricpos=-fricpos
				end
				savegame.content=(-fricpos/3-1)/savegame.display
				savegame.monney=fricpos/7
				local loadsave = require("loadsave")
				loadsave.saveTable(savegame, "undeuxtroissoleil.json" )
			end
		end
		if nbaugmentation>0 then
			levelatteint=levelatteint.."  Level UP!"
			local loadsave = require("loadsave")
			loadsave.saveTable(savegame, "undeuxtroissoleil.json" )
		end
		if gaindiam==nil then
			gaindiam=" "
		end
		textaction="\n"..texttraduction.rate[2]..nombredekill..texttraduction.rate[3]..vagueinf.text.."\n"..texttraduction.rate[4]..levelatteint.."\n            "..gaindiam
	else
		recfondpause:setFillColor(0.3,0,0)
		fenetregagne=display.newImage(imbouton.gagne,2)
		fenetregagne.x=contentcenterx --actualcontentwidth/2-50
		fenetregagne.y=contentcentery --actualcontentheight/2
		fenetregagne.xScale=fenetreconf.xScale*fenetreconf.width/fenetregagne.width
		fenetregagne.yScale=fenetreconf.yScale*fenetreconf.height/fenetregagne.height
		fenetregagne.frame=2
		fenconf:insert(fenetregagne)
		fenetreconf.isVisible=false
		fenconf:remove(fentext)
		fenconf:insert(fentext)
		if not tutolevel0 then
			textaction=texttraduction.message[1] --"You lose"
		else
			textaction=texttraduction.tuto0[2]
		end
		print("\nVous avez perdu niveau de difficulté modifier")
		if modenormal and not modehard and multi==0 and not tutolevel0 then
			if savegameresul[(niveauch-1)*4+3]==0 then
				savegameresul[(niveauch)+64]=savegameresul[(niveauch)+64]*1.03
				print("niveau de difficulté abaisser "..savegameresul[(niveauch)+64])
			else
				savegameresul[(niveauch)+64]=savegameresul[(niveauch)+64]*1.02
				print("niveau de difficulté abaisser mais niveau deja gagner"..savegameresul[(niveauch)+64])
			end
		end
		retinf.victoire=1
	end
	print("perdu met etoile a 0")
	etoile=0
	-- savepourretourinf()
	return textaction
end
local function menufinishgame()
	fenconf.isTouchable=false
	local groupfini=display.newGroup()
	groupfini.fenetre=display.newImage(imbouton.gagne,1)
	groupfini:insert(groupfini.fenetre)
	groupfini.fenetre.x=contentcenterx
	groupfini.fenetre.y=contentcentery
	groupfini.fenetre.xScale=actualcontentwidth/groupfini.fenetre.width
	groupfini.fenetre.yScale=actualcontentheight/groupfini.fenetre.height
	groupfini.text=display.newEmbossedText(texttraduction.finishgame[1],contentcenterx,contentcentery,actualcontentwidth*0.8,actualcontentheight*0.8,fonttype,20*apparence*fontsize)
	groupfini.text:setEmbossColor(colortextemb)
	groupfini.text:setFillColor(0,0,0)
	groupfini:insert(groupfini.text)
	groupfini.bouton=display.newImage(imbouton.monnaie,1)
	groupfini.bouton.xScale=0.25
	groupfini.bouton.yScale=groupfini.bouton.xScale
	groupfini.bouton.x=xmaxscreen-groupfini.bouton.width*groupfini.bouton.xScale
	groupfini.bouton.y=ymaxscreen-groupfini.bouton.height*groupfini.bouton.yScale
	groupfini:insert(groupfini.bouton)
	print("not touchable")
	function groupfini.bouton:tap(event)
		groupfini:removeSelf()
		groupfini=nil
		fenconf.isTouchable=true
	end
	groupfini.bouton:addEventListener( "tap", groupfini.bouton )
end
local function affmenuconfaction3(textaction,action) -- menu quand on a gagner
	-- if false then
	-- 	print("niveauch "..niveauch.." ennemipasse "..ennemipasse)
	-- 	if niveauch==4 and ennemipasse==1 then
	-- 		local legeneral=savegameall.generalch[race+1]
	-- 		if legeneral==nil then
	-- 			legeneral=savegameall.general[race+1]
	-- 		end
	-- 		legeneral=retournenumgene(race,legeneral)
	-- 		print("general "..legeneral)
	-- 		if legeneral==178 then
	-- 			local argentgagner=100000
	-- 			local calcultest=mathabs(fric1)/7-savegame.monney
	-- 			if calcultest>1 or calcultest<-1 then
	-- 			--if fric1/7~=savegame.monney then
	-- 			--	native.showAlert( "Met a 0 l'argent", "contacter arthafrance@gmail.com", { "OK" } )
	-- 				fric1=0
	-- 				print("triche1")
	-- 			else
	-- 				if fric1<0 then
	-- 					fric1=-fric1+argentgagner*7
	-- 				else
	-- 					fric1=-(fric1+argentgagner*7)
	-- 				end
	-- 				fric1=mathfloor(fric1)
	-- 				--print("savegame.yomec "..savegame.yomec)
	-- 				savegame.yomec=savegame.yomec+(argentgagner*5)
	-- 				--print("savegame.yomec "..savegame.yomec)
	-- 				local t = os.date( '*t' )
	-- 				savegame.diplay=os.time( t )
	-- 				local fricpos=fric1
	-- 				if fricpos<0 then
	-- 					fricpos=-fricpos
	-- 				end
	-- 				savegame.content=(-fricpos/3-1)/savegame.display
	-- 				savegame.monney=fricpos/7
	-- 			end
	-- 		end
	-- 	end
	-- end
	recfondpause:setFillColor(0.6,0.4,0)
	fenetregagne=display.newImage(imbouton.gagne,1)
	fenetregagne.x=contentcenterx --actualcontentwidth/2-50
	fenetregagne.y=contentcentery --actualcontentheight/2
	fenetregagne.xScale=fenetreconf.xScale*fenetreconf.width/fenetregagne.width
	fenetregagne.yScale=fenetreconf.yScale*fenetreconf.height/fenetregagne.height
	fenetregagne.frame=1
	fenconf:insert(fenetregagne)
	fenetreconf.isVisible=false
	fenconf:remove(fentext)
	fenconf:insert(fentext)
	audio.play(son.eventwin)
	-- background.fill.effect = "filter.blur"
	if actionimg~=nil then
		actionimg:removeEventListener("tap",confirm1)
		fenconf:remove(actionimg)
		actionimg:removeSelf()
		actionimg=nil
	end
	textaction=texttraduction.message[2] --"You win"
	retinf.victoire=2
	action=2
	if not modewave then
		etoile=0
		if ennemipasse>ennemipassedep*0.85 then
			etoile=3
		elseif ennemipasse>ennemipassedep*0.55 then
			etoile=2
		elseif ennemipasse>ennemipassedep*0.3 then
			etoile=1
		elseif niveauch==1 and modenormal and not savegame.tuto2 then
			print("etolie ==1")
			etoile=1
		end
		local bonusargentfinpartie=0
		if not modeinfini and contreai==0 and contreaihaut==0 and not modepanique and not modezombie and not modeperftest and not modehard then
			--niveau+20*pages
			local pagenb=1
			local niveauchtest=niveauch+1
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
			if niveauch==16 then
				if savegameall.bouton1[pagenb*20+(niveauchtest-(pagenb-1)*4)]~=1 then
					bonusargentfinpartie=300
					menufinishgame()
					savegame.finish=true
					local loadsave = require("loadsave")
					loadsave.saveTable(savegame, "undeuxtroissoleil.json" )
				end
			end
			print("ici "..(pagenb*20+(niveauchtest-(pagenb-1)*4)).."niveau considerer comme gagner\n\n\n\n\n")
			savegameall.bouton1[pagenb*20+(niveauchtest-(pagenb-1)*4)]=1
		end

		if contreai==0 and modeinfini==false and aiactive==1 and contreaihaut==1 then
			if vagueencours<nbvague then
				etoile=1
			end
			if vagueencours<nbvague-3 then
				etoile=2
			end
			if vagueencours<nbvague-5 then
				etoile=3
			end
		end
		if multi==0 then
			bonusargentfinpartie=bonusargentfinpartie+mathfloor((-argent/3)/10)
			if not modenormal then
				bonusargentfinpartie=0
			end
			local animbonusfin=display.newEmbossedText(bonusargentfinpartie*10,tune.x,tune.y,fonttype,30*fontsize)
			if not modenormal then
				animbonusfin.text=""
			end
			animbonusfin:setFillColor(colortextdiam[1],colortextdiam[2],colortextdiam[3])
			animbonusfin:setEmbossColor(colortextemb)
			grpause:insert(animbonusfin)
			local animbonusfinanim=transition.to(animbonusfin,{time=1000,transition=easing.inCirc,y=contentcentery,x=contentcenterx})
			local animbonusfinanim2=transition.to(animbonusfin,{time=533,transition=easing.inCirc,xScale=3,yScale=3})
			local animbonusfinanim3=transition.to(animbonusfin,{time=466,transition=easing.inCirc,delay=533,xScale=1.5,yScale=1.5})


			textaction="+0"
			local argentgagner=0
			if not modehard then
				if not tutolevel0 then
					if savegameresul[(niveauch-1+1)*4+3]==0 then
						if (savegameresul[(niveauch)+64]>1.19) then
							savegameresul[(niveauch+1)+64]=1+(savegameresul[(niveauch)+64]-1)*0.5
						end
					end
					savegameresul[(niveauch)+64]=1
					--if etoile>savegameresul[(niveauch-1)*4+3] then
					gainetoile=etoile-savegameresul[(niveauch-1)*4+3]
				else
					gainetoile=0
				end
				if gainetoile<0 then
					gainetoile=0
					textaction=""
				end
				argentgagner=(gainetoile*100)
				argentgagner=argentgagner+bonusargentfinpartie
				print("etoile"..etoile.."etoilegainbase"..gainetoile)
			else
				if not savegame["lvlhard"..niveauch] then
					--savegame["lvlhard"..niveauch]=true
					argentgagner=savegameall.gainhard[mathfloor((niveauch-1)/4)+1]
				end
				argentgagner=argentgagner+bonusargentfinpartie*2
			end
			if premium then
				argentgagner=mathfloor(argentgagner*1.5)
			end
				textaction=argentgagner
				local calcultest=mathabs(fric1)/7-savegame.monney
				if calcultest>1 or calcultest<-1 then
				--if fric1/7~=savegame.monney then
				--	native.showAlert( "Met a 0 l'argent", "contacter arthafrance@gmail.com", { "OK" } )
					fric1=0
					print("triche1")
				else
					if fric1<0 then
						fric1=-fric1+argentgagner*7
					else
						fric1=-(fric1+argentgagner*7)
					end
					fric1=mathfloor(fric1)
					--print("savegame.yomec "..savegame.yomec)
					savegame.yomec=savegame.yomec+(argentgagner*5)
					--print("savegame.yomec "..savegame.yomec)
					savegame.diplay=gettime()
					local fricpos=fric1
					if fricpos<0 then
						fricpos=-fricpos
					end
					savegame.content=(-fricpos/3-1)/savegame.display
					savegame.monney=fricpos/7
				end
			--end
			local ortodiamant=function(obj)
				animbonusfin.text=argentgagner
				animbonusfin:setFillColor(colortextdiam[1],colortextdiam[2],colortextdiam[3])
				animbonusfin.alpha=0.5
				local niveauold=niveauch
				local supanimbonusfin=function(obj)
					if niveauold==niveauch then --animbonusfin~=nil and grpause~=nil and
						-- grpause:remove(animbonusfin)
						-- animbonusfin:removeSelf()
						display.remove(animbonusfin)
						animbonusfin=nil
					end
				end
				local animbonusfinanim4=transition.to(animbonusfin,{transition=easing.outCirc,time=2500,xScale=1.5,yScale=1.5,onComplete=supanimbonusfin,onCancel=supanimbonusfin})
				local animbonusfinanim5=transition.to(animbonusfin,{transition=easing.inCirc,time=2000,alpha=0.05})		
				local animbonusfinanim6=transition.to(animbonusfin,{transition=easing.outCirc,time=2000,y=fentext.y})	
			end
			local animbonusfinanim1=transition.to(animbonusfin,{delay=1000,transition=easing.inCirc,time=700,xScale=0.01,yScale=0.01,onComplete=ortodiamant})
			if not tutolevel0 then
				savegameresul[(niveauch-1)*4+4]=savegameresul[(niveauch-1)*4+4]+1
				if not modehard and ( savegameresul[(niveauch-1)*4+4]==1 or (savegameresul[(niveauch-1)*4+3]==etoile and savegameresul[(niveauch-1)*4+2]<ennemipasse) or savegameresul[(niveauch-1)*4+3]<etoile) then
					savegameresul[(niveauch-1)*4+1]=-argent/3 --argent en fin de partie
					savegameresul[(niveauch-1)*4+2]=ennemipasse
					savegameresul[(niveauch-1)*4+3]=etoile
					local pagenb=1
					local niveauchtest=niveauch+1
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
					print("ici "..(pagenb*20+(niveauchtest-(pagenb-1)*4)).."niveau considerer comme gagner\n\n\n\n\n\n\n\n\n\n")
					savegameall.bouton1[pagenb*20+(niveauchtest-(pagenb-1)*4)]=1
					print("modif des valeurs 2")
				end
			end
			-- if savegame.niveau[niveauch]==nil then
			-- 	savegame.niveau[niveauch]={}
			-- 	savegame.niveau[niveauch].maxfric=0
			-- 	savegame.niveau[niveauch].maxennemipasse=0
			-- 	savegame.niveau[niveauch].maxetoile=0
			-- 	savegame.niveau[niveauch].nb=0
			-- end
			-- savegame.niveau[niveauch].nb=savegame.niveau[niveauch].nb+1
			-- local i=savegame.niveau[niveauch].nb
			
			-- if savegame.niveau[niveauch][i]==nil then
			-- 	savegame.niveau[niveauch][i]=true
			-- 	savegame.niveau[niveauch][i]={}
			-- 	savegame.niveau[niveauch][i].fric=-argent/3
			-- 	savegame.niveau[niveauch][i].race=race
			-- 	savegame.niveau[niveauch][i].ennemipasse=ennemipasse
			-- 	savegame.niveau[niveauch][i].etoile=etoile
			-- 	if -argent/3>savegame.niveau[niveauch].maxfric then
			-- 		savegame.niveau[niveauch].maxfric=-argent/3
			-- 	end
			-- 	if ennemipasse>savegame.niveau[niveauch].maxennemipasse then
			-- 		savegame.niveau[niveauch].maxennemipasse=ennemipasse
			-- 	end
			-- 	if etoile>savegame.niveau[niveauch].maxetoile then
			-- 		local calcultest=mathabs(fric1)/7-savegame.monney
			-- 		if calcultest>1 or calcultest<-1 then
			-- 		--if fric1/7~=savegame.monney then
			-- 			fric1=0
			-- 			print("triche1")
			-- 		else
			-- 			if fric1<0 then
			-- 				fric1=-fric1+(etoile*7)-savegame.niveau[niveauch].maxetoile
			-- 			else
			-- 				fric1=-(fric1+(etoile*7)-savegame.niveau[niveauch].maxetoile)
			-- 			end
			-- 			fric1=mathfloor(fric1)
			-- 			savegame.niveau[niveauch].maxetoile=etoile
			-- 			local t = os.date( '*t' )
			-- 			savegame.diplay=os.time( t )
			-- 			local fricpos=fric1
			-- 			if fricpos<0 then
			-- 				fricpos=-fricpos
			-- 			end
			-- 			savegame.content=(-fricpos/3-1)/savegame.display
			-- 			savegame.monney=fricpos/7
			-- 		end
			-- 	end
			-- end
			-- savepourretourinf()
		end
	else
		if not savegame["lvlwave"..niveauch] then 
			savegame["lvlwave"..niveauch]=true
			local menudedevfon=require("menudedevfon")
			menudedevfon.ordrewave(niveauch)
			varattgentdeb=varattgentdeb*0.9
		else
			if savegame21==nil then
				savegame21={}
			end
			if savegame21[niveauch]==nil then
				savegame21[niveauch]=0
				print()
			end
			savegame21[niveauch]=savegame21[niveauch]+1
			local menudedevfon=require("menudedevfon")
			menudedevfon.ordrewave(niveauch)
			varattgentdeb=varattgentdeb*0.9
		end
	end
	local loadsave = require("loadsave")
	loadsave.saveTable(savegame,"undeuxtroissoleil.json")
	loadsave.saveTable(savegame21,"undeuxtroissoleillvl21.json")
	loadsave.saveTable(savegameresul,"undeuxtroissoleilter.json")
	return textaction,action,gainetoile
end
local function affmenuconfaction4(textaction,action)
	if actionimg~=nil then
		actionimg:removeEventListener("tap",confirm1)
		fenconf:remove(actionimg)
		actionimg:removeSelf()
		actionimg=nil
	end
	textaction="Niveau créé"
	action=2
	sauvegarder=display.newImage(imagemenu.boutonmultispawn,2)
	sauvegarder.x=fenetreconf.x
	sauvegarder.y=fenetreconf.y
	sauvegarder.xScale=fenetreconf.width*fenetreconf.xScale/sauvegarder.width*0.25
	sauvegarder.yScale=sauvegarder.xScale
	fenconf:insert(sauvegarder)
	sauvegardertext=display.newEmbossedText("Save",sauvegarder.x,sauvegarder.y,fonttype,16*fontsize)
	sauvegardertext:setEmbossColor(colortextemb)
	sauvegardertext:setFillColor(0)
	fenconf:insert(sauvegardertext)
	function sauvegarder:tap(event)
		audio.play( son.uicl2)
		sauvegarder.isVisible=false
		fenconf:remove(sauvegarder)
		sauvegarder:removeSelf()
		sauvegarder=nil
		fenconf:remove(sauvegardertext)
		sauvegardertext:removeSelf()
		sauvegardertext=nil
		sauvegarder=display.newEmbossedText("The level is saved",fenetreconf.x,fenetreconf.y,fonttype,16*fontsize) -- native.systemFontBold, 16 )
		sauvegarder:setEmbossColor(colortextemb)
		sauvegarder:setFillColor(0)
		fenconf:insert(sauvegarder)
		print("mapmultisave"..mapmultisave)
			-- savemultitemp.nb=savemultitemp.nb+1
			-- savemultitemp.typeso[savemultitemp.nb]=typeso
			-- --local t1 = os.date( '*t' )
			-- savemultitemp.time[savemultitemp.nb]
			--fusion des deux tableaux: -------------------------------------------------------------fusion des deux tableaux c'est facile et ca marche ;) (pas essayer), mais par contre modifier le tableau avec tout les niveaux multi pour lui trouver une place ca marche pas
			-- local savemultitemp1={}
			-- savemultitemp1[1]=savemultitemp.nb
			-- for i=1,savemultitemp.nb do
			-- 	savemultitemp1[i*2]=savemultitemp.typeso[i]
			-- 	savemultitemp1[i*2+1]=savemultitemp.time[i]
			-- end
			-- for i=mapmultisave+1,2 do --2 nb de map multi
			-- 	local nbdebidule=savemultitt[i-1]
			-- 	local nbdebidulesuivant=savemultitt[nbdebidule*2+1+1]
			-- 	for k=nbdebidule*2+1+1+1,nbdebidulesuivant do
			-- 		savemultitt[(savemultitemp.nb*2+1)+1+k]=
			-- 	end
			-- end 
			-- fin a tester
		local namesave=savegamemulti.save[mapmultisave][numsavegame].name
		if false then -- old version

			savemulti[mapmultisave]=savemultitemp
			savegame.savemulti[mapmultisave]=savemultitemp
			local loadsave = require("loadsave")
			loadsave.saveTable(savegame, "undeuxtroissoleil.json" )
			loadsave.saveTable(savegamedev, "undeuxtroissoleilbis.json" )
		end
		savegamemulti.save[mapmultisave][numsavegame]=savemultitemp
		savegamemulti.save[mapmultisave][numsavegame].exist=true
		savegamemulti.save[mapmultisave][numsavegame].name=namesave
		local loadsave = require("loadsave")
		loadsave.saveTable(savegamemulti, "undeuxtroissoleilmulti.json" )
	end
	sauvegarder:addEventListener( "tap", sauvegarder )
	return textaction,action
end
local function affmenuconfactionsi2(textaction,gainetoile)
	local loadsave = require("loadsave")
	fenconf:remove(conf)
	fenconf:remove(refu)
	conf:removeSelf()
	refu:removeSelf()
	if not tutolevel0 then
		conf=display.newImage(imbouton.menupause,3) -- imbouton.recommencer,1)
		conf.xScale=4/5*apparence
		if goh then
			conf.xScale=conf.xScale/4.3
		end
		conf.x=fenetreconf.x+60
		conf.y=fenetreconf.y+40
		conf.yScale=conf.xScale
	end
	--conf.xScale=0.2
	--conf.yScale=0.2
	--conf.isVisible=false
	refu=display.newImage(imbouton.menupause,4) -- imbouton.retourmenuprin,1)
	refu.x=fenetreconf.x-60
	if tutolevel0 then
		refu.x=fenetreconf.x
	end
	refu.y=fenetreconf.y+40
	if tutolevel0 then
		refu.xScale=4/5*apparence
		if goh then
			refu.xScale=refu.xScale/4.3
		end
	else
		refu.xScale=conf.xScale
	end
	refu.yScale=refu.xScale
	--refu.xScale=0.2
	--refu.yScale=0.2
	if not tutolevel0 then
		fenconf:insert(conf)
	end
	fenconf:insert(refu)
	if multi~=1 and not modeinfini and not modehard and not modewave then
		print("ici aff etoile! etoile "..etoile)
		if multi==0 then --not multi==0 then
			print("dgs")
			etoilepiece={}
			for i=1,3 do
				if etoile>=i then
					print("aff etoile "..i)
					if i>gainetoile then
						etoilepiece[i]=display.newImage(imbouton.monnaie,4)
					else
						etoilepiece[i]=display.newImage(imbouton.monnaie,5)
					end
					if etoile==1 and i==etoile then
						etoilepiece[i].x=fenetreconf.x
					else
						etoilepiece[i].x=fenetreconf.x+i*60-120 -- 120-i*60
					end
					etoilepiece[i].y=fenetreconf.y
					etoilepiece[i].xScale=0.3
					etoilepiece[i].yScale=0.3
					fenconf:insert(etoilepiece[i])
					if i<=gainetoile then
						local etoiletune=display.newEmbossedText("100",etoilepiece[i].x,etoilepiece[i].y,fonttype,30*apparence*fontsize)
						etoiletune:setEmbossColor(colortextemb)
						etoiletune:setFillColor(colortextdiam[1],colortextdiam[2],colortextdiam[3])
						fenconf:insert(etoiletune)
						local etoiletunedisp=function(obj)
							display.remove(etoiletune)
							-- fenconf:remove(etoiletune)
							-- etoiletune:removeSelf()
							etoiletune=nil
						end
						local etoiletunetrans=transition.to(etoiletune,{delay=750,time=700,transition=easing.inCirc,y=contentcentery,x=contentcenterx,onComplete=etoiletunedisp})
					end
						-- etoilepiece[i].pleine=display.newImage(imbouton.piececristal,1)
						-- etoilepiece[i].pleine.x=etoilepiece[i].x
						-- etoilepiece[i].pleine.y=fenetreconf.y
						-- etoilepiece[i].pleine.xScale=0.5
						-- etoilepiece[i].pleine.yScale=0.5
						-- fenconf:insert(etoilepiece[i].pleine)
				end
			end
		end
		if modenormal then 
			if fenetregagne~=nil then
				fentext.xScale=0.05
				fentext.yScale=0.05
				if fenetregagne.frame==1 then
					local fentexttrans1=transition.to(fentext,{delay=3050,time=50,yScale=1.5,xScale=1.5})
					local fentexttrans=transition.to(fentext,{delay=3100,time=200,yScale=1,xScale=1})
				else
					local fentexttrans1=transition.to(fentext,{delay=500,time=50,yScale=1.5,xScale=1.5})
					local fentexttrans=transition.to(fentext,{delay=550,time=200,yScale=1,xScale=1})
				end
				if boutonnivsuivant==nil and fenetregagne.frame==1 and ((niveauch<15 and not goh) or (niveauch<16 and goh)) and not modewave and not modehard then --and niveauch~=1 then
					if goh then
						boutonnivsuivant=display.newImage(imagemenu.bpmenuprin,3)
						boutonnivsuivant.xScale=0.4
						boutonnivsuivant.yScale=boutonnivsuivant.xScale
						boutonnivsuivant.y=ymaxscreen-boutonnivsuivant.yScale*boutonnivsuivant.height*0.5
						boutonnivsuivant.x=fenetreconf.x+fenetreconf.xScale*fenetreconf.width*0.45--boutonnivsuivant.xScale*boutonnivsuivant.width*0.5
						fenconf:insert(boutonnivsuivant)
					else
						boutonnivsuivant=display.newImage(imbouton.monnaie,7)
						--boutonnivsuivant:rotate(90)
						boutonnivsuivant.xScale=0.4
						boutonnivsuivant.yScale=boutonnivsuivant.xScale
						boutonnivsuivant.y=ymaxscreen-boutonnivsuivant.yScale*boutonnivsuivant.height*0.5
						boutonnivsuivant.x=fenetreconf.x+fenetreconf.xScale*fenetreconf.width*0.45-boutonnivsuivant.xScale*boutonnivsuivant.width*0.5
						fenconf:insert(boutonnivsuivant)
						boutonnivsuivant1=display.newImage(imbouton.monnaie,8)
						boutonnivsuivant1.xScale=boutonnivsuivant.xScale
						boutonnivsuivant1.yScale=boutonnivsuivant.yScale
						boutonnivsuivant1.y=boutonnivsuivant.y
						boutonnivsuivant1.x=boutonnivsuivant.x+boutonnivsuivant1.width*boutonnivsuivant1.xScale
						fenconf:insert(boutonnivsuivant1)
					end
					local function boutonnivsuivantlist( event )
						if fenconf.isTouchable then
							boutonnivsuivant:removeEventListener( "tap",boutonnivsuivantlist)
							if not goh then
								boutonnivsuivant1:removeEventListener( "tap",boutonnivsuivantlist)
							end
							if savegame.tuto4 then
								destructeurpartiel(0,true)
							else
								destructeurpartiel(0)
							end
						end
					end
					boutonnivsuivant:addEventListener( "tap", boutonnivsuivantlist )
					if not goh then
						boutonnivsuivant1:addEventListener( "tap", boutonnivsuivantlist )
					end
				end
			end
		end
	end
	if fenetregagne~=nil then
		if modehard then
			if fenetregagne.frame==1 then
				print("fenetregagne~=nil and textaction="..textaction)
				local tunegagnerhard=""
				if not savegame["lvlhard"..niveauch] then -- and textaction~=0 then
					savegame["lvlhard"..niveauch]=true
					tunegagnerhard=savegameall.gainhard[mathfloor((niveauch-1)/4)+1]
					loadsave.saveTable(savegame, "undeuxtroissoleil.json" )
				else
					tunegagnerhard=0
				end
				hardfl=display.newSprite(effetexplo.fl1,effetexplo["fl1seq"])
				hardfl.xScale=0.35
				if goh then
					hardfl.xScale=hardfl.xScale*0.5
				end
				hardfl.yScale=hardfl.xScale

				hardfl.x=fenetreconf.x-- -boutontab[j].bouton[i].bouton[k].width*boutontab[j].bouton[i].bouton[k].xScale*0.5-20
				hardfl.y=fenetreconf.y-hardfl.height*hardfl.yScale*0.32
				hardfl:setSequence("levelup")
				hardfl:play()
				fenconf:insert(hardfl)

				-- local hardtune=display.newEmbossedText(tunegagnerhard,fenetreconf.x,fenetreconf.x,fonttype,30*apparence*2)
				-- hardtune:setEmbossColor(colortextemb)
				-- hardtune:setFillColor(colortextdiam[1],colortextdiam[2],colortextdiam[3])
				-- fenconf:insert(hardtune)
				hardtune1=display.newEmbossedText(tunegagnerhard,fenetreconf.x,fenetreconf.y,fonttype,30*apparence*fontsize)
				hardtune1:setEmbossColor(colortextemb)
				hardtune1:setFillColor(colortextdiam[1],colortextdiam[2],colortextdiam[3])
				fenconf:insert(hardtune1)
				if tunegagnerhard~=0 then
					local hardtune3=display.newEmbossedText(tunegagnerhard,fenetreconf.x,fenetreconf.y,fonttype,30*apparence*fontsize)
					hardtune3:setEmbossColor(colortextemb)
					hardtune3:setFillColor(colortextdiam[1],colortextdiam[2],colortextdiam[3])
					fenconf:insert(hardtune3)
					local hardtunedisp=function(obj)
						fenconf:remove(hardtune3)
						hardtune3:removeSelf()
						hardtune3=nil
					end
					local hardtunetrans=transition.to(hardtune3,{delay=750,time=700,transition=easing.inCirc,y=contentcentery,x=contentcenterx,onComplete=hardtunedisp})
				end
			end
		end
		if modewave then
			if fenetregagne.frame==1 then
				textreward=display.newEmbossedText("",fenetreconf.x,fenetreconf.y,fonttype,30*apparence*fontsize)
				textreward:setFillColor(1,1,0.2)
				textreward:setEmbossColor(colortextemb)
				textreward.text=texttraduction.bonusrace[12]..texttraduction.wave[niveauch]
				fenconf:insert(textreward)
			end
		end
	end
	fentext.y=fentext.y1
	fentext.text=textaction
	if fenetregagne~=nil then
		if fenetregagne.frame==1 then
			if (not modesquelette and not modezombie and not modepanique and not modewave) or fenetregagne.diam~=nil then
				diamantgagner=display.newImage(imbouton.monnaie,6)
				fenconf:insert(diamantgagner)
				diamantgagner.xScale=0.2
				diamantgagner.yScale=diamantgagner.xScale
				diamantgagner.x=fentext.x+diamantgagner.xScale*diamantgagner.width*0.5+20
				diamantgagner.y=fentext.y
				if modesquelette or modezombie or modepanique then
					diamantgagner.x=fentext.x
					diamantgagner.y=fentext.y+fentext.yScale*fentext.height*0.38
				end
			end
		end
	end  

	print("textaction "..textaction)
	if fenetregagne~=nil then
		if fenetregagne.frame==1 then
			fentext:setFillColor(colortextdiam[1],colortextdiam[2],colortextdiam[3])
		else
			fentext:setFillColor(0.82,0.06,0.06)
		end
	else
		fentext:setFillColor(0,0,0)
	end
	loadsave.saveTable(savegameresul, "undeuxtroissoleilter.json" )
	loadsave.saveTable(savegamedev, "undeuxtroissoleilbis.json" )
end
local function affmenuconfactionsipas2(textaction)
	actionimg.x=fenetreconf.x
	if goh then
		actionimg.xScale=0.23
		--actionimg.y=fenetreconf.y-actionimg.yScale*actionimg.height*0.9
	else
		actionimg.xScale=1
	end
	actionimg.y=fenetreconf.y-40
	actionimg.yScale=actionimg.xScale
	fenconf:insert(actionimg)
	print("position")
	local textaff=""
	if textaction=="retourner au menu principal" then
		textaff=texttraduction.menuquestion[1]
	elseif textaction=="recommencer le niveau" then
		textaff=texttraduction.menuquestion[2]
	elseif textaction=="tutolevel" then
		textaff=texttraduction.tuto0[1]
	end
	fentext.text=textaff --" " --fenletext..textaction
	fentext.y=fentext.y1+40
	fentext.size=15
	fentext:setFillColor(0,0,0)
end
local function demandevie(prixdev)
	local assezdetune=false
	local fricpos=fric1
	if fricpos<0 then
		fricpos=-fricpos
	end
	if fricpos>-0.1 then
		if fricpos<0.1 then
			fricpos=0
			print("0 ici?? fricpos"..fricpos)
		end
	end 
	if prixdev*7<=fricpos then
		local calcultest=mathabs(fric1)/7-savegame.monney
		if calcultest>1 or calcultest<-1 then
		--if fric1/7~=savegame.monney then
			fric1=0
		--	native.showAlert( "Met a 0 l'argent", "contacter arthafrance@gmail.com", { "OK" } )
			print("triche1")
		else
			assezdetune=true
			if fric1<0 then
				fric1=-fric1-prixdev*7
			else
				fric1=-(fric1-prixdev*7)
			end
			fric1=mathfloor(fric1)
			savegame.diplay=gettime()
			local fricpos=fric1
			if fricpos<0 then
				fricpos=-fricpos
			end
			savegame.content=(-fricpos/3-1)/savegame.display
			savegame.monney=fricpos/7
			--lefrictext.text=fricpos/7
			vartune(true)
			if true then
				local fricpos1=fric1
				if fricpos1<0 then
					fricpos1=-fricpos1
				end
				if fricpos1>-0.1 then
					if fricpos1<0.1 then
						fricpos1=0
						print("0")
					end
				end 
				savegame.yomec=savegame.yomec-prixdev*5
			end
		end
		local loadsave = require("loadsave")
		loadsave.saveTable(savegame, "undeuxtroissoleil.json" )
	end
	return assezdetune
end
local function lastchance()
	if actionimg~=nil then
		actionimg:removeEventListener("tap",confirm1)
		fenconf:remove(actionimg)
		actionimg:removeSelf()
		actionimg=nil
	end
	conf:removeEventListener("tap",confirm1)
	refu:removeEventListener("tap",refu1)

	nbfoisdiamantforlife=nbfoisdiamantforlife+1
	ennemipasse=1
	passe.text=ennemipasse
	passe:setFillColor(1,0.2,0.2)
	fricanim(10,contentcenterx,contentcentery)
	bpaccnorm()
	-- kill all soldier close of an exit, with blood
	local soldatmort=false
	local soldatmort1=true
	while soldatmort1 do
		soldatmort1=false
		for i=nbsoldatg,nbsoldat do
			if isoldat[i].orientation==1 and isoldat[i].vivant then 
				soldatmort=false
				if cheminarr~=nil then
					for j=1,#cheminarr do
						if ((isoldat[i].x1-chemin[cheminarr[j]].x)*(isoldat[i].x1-chemin[cheminarr[j]].x)+(isoldat[i].y1-chemin[cheminarr[j]].y)*(isoldat[i].y1-chemin[cheminarr[j]].y))<40000 then

						--if isoldat[i].point>=cheminarr[j]-4 and isoldat[i].point<=cheminarr[j] then
							soldatmort=true
						--end
						end
					end
				end
				if not soldatmort then
					if ((isoldat[i].x1-chemin[cheminnb].x)*(isoldat[i].x1-chemin[cheminnb].x)+(isoldat[i].y1-chemin[cheminnb].y)*(isoldat[i].y1-chemin[cheminnb].y))<40000 then
					--if isoldat[i].point>=cheminnb-4 then
						soldatmort=true
					end
				end
				if soldatmort then
					soldatmort1=true
					--local numsoldatmort=i
					-- local function timerlancermainpremier( event )
					-- 	affsang(numsoldatmort,2)
					-- 	affsang(numsoldatmort,3)
					-- 	affsang(numsoldatmort,3)
					-- 	affsang(numsoldatmort,3)
					-- 	affsang(numsoldatmort,4)
					-- 	affsang(numsoldatmort,5)
					-- end
					-- timer.performWithDelay( 50, timerlancermainpremier )						
					pertevie(i,1000)
				end
			end
		end
	end
	fenaff=false
	appuipause()
	local function timerlancermainpremier1( event )
		if cheminarr~=nil then
			for j=1,#cheminarr do
				local j1=j
				for i=1,30 do
					local function timerlancermainpremier2( event )
						animationapparition(chemin[cheminarr[j1]].x+mathrandom(-30,30)*4,chemin[cheminarr[j1]].y+mathrandom(-30,30)*4,1,true,true)
					end
					timer.performWithDelay( 50, timerlancermainpremier2 )
				end
			end
		end
		for i=1,30 do
			local function timerlancermainpremier2( event )
				animationapparition(chemin[cheminnb].x+mathrandom(-30,30)*4,chemin[cheminnb].y+mathrandom(-30,30)*4,1,true,true)
			end
			timer.performWithDelay( 50, timerlancermainpremier2 )
			
		end
		-- local xcalcul=nil
		-- local ycalcul=nil
		-- local xorigine=nil
		-- local yorigine=nil
		-- local distsortie
		-- if cheminarr~=nil then 
		-- 	for j=1,#cheminarr do
		-- 		distsortie=linftabpro[cheminarr[j]]
		-- 		for k=1,cheminnb do
		-- 			if k>=linftabpro[k]-3 then

		-- 			end
		-- 		end
		-- 		for k=0,3 do
		-- 			xorigine=chemin[cheminarr[j]-k].x
		-- 			yorigine=chemin[cheminarr[j]-k].y
		-- 			if xcalcul~=nil then
		-- 				animationapparition((xorigine-xcalcul)*0.5,(yorigine-ycalcul)*0.5,1)
		-- 			end
		-- 			xcalcul=xorigine
		-- 			ycalcul=yorigine
		-- 			animationapparition(xcalcul,ycalcul,1)
		-- 		end
		-- 	end
		-- end
		-- for k=0,3 do
		-- 	xorigine=chemin[cheminnb-k].x
		-- 	yorigine=chemin[cheminnb-k].y
		-- 	if xcalcul~=nil then
		-- 		animationapparition((xorigine-xcalcul)*0.5,(yorigine-ycalcul)*0.5,1)
		-- 	end
		-- 	xcalcul=xorigine
		-- 	ycalcul=yorigine
		-- 	animationapparition(xcalcul,ycalcul,1)
		-- end
	end
	timer.performWithDelay( 50, timerlancermainpremier1 )

	recfondpause.alpha=0
	transition.from(recfondpause,{time=500,alpha=0.5})
	audio.play( son.uicl2)
	transition.to(fenconf,{time=500,transition=easing.inCirc, y=contentcentery-actualcontentheight-fenconf.height*fenconf.yScale*0.5, onComplete=completedisp1, tag="fenconf" ,onCancel=completedisp1})
end
local function affmenuconfcrealist(textaction)
	if not inappaff then
		fenaff=true
		function confirm1( event )
			print("fenaction "..fenaction)
			if fenconf.isTouchable then
				local autorise=true
				if actionimg~=nil then
					if actionimg.ads then
						autorise=false
					end
				end
				if autorise then
					audio.play( son.uicl1)
					if fenaction~=5 then
						if actionimg~=nil then
							actionimg:removeEventListener("tap",confirm1)
							fenconf:remove(actionimg)
							actionimg:removeSelf()
							actionimg=nil
						end
						conf:removeEventListener("tap",confirm1)
						refu:removeEventListener("tap",refu1)
					end
					if fenaction~=2 and fenaction~=5 then
						if fenaction~=2 then
							savepourretourinf()
						end
						local fenaction1=fenaction
						if fenaction1==-1 then
							fenaction1=0
						end
						destructeurpartiel(fenaction1)
					elseif fenaction==5 then
						print("appuiyer ssur confirmer et donne 2 vie")
						local prixlife
						if nbfoisdiamantforlife<6 then
							prixlife=(2^nbfoisdiamantforlife)*25
							if modehard and nbfoisdiamantforlife==1 then
								prixlife=75
							elseif modewave then
								prixlife=300
							end
						else
							prixlife=1000*(nbfoisdiamantforlife-5)
						end
						local asseztune=demandevie(prixlife)
						if asseztune then
							lastchance()
						else
							funcaffinapp()
							-- inappaff
							-- ennemipasse=-10
						end
					else
						if multi~=1 and not modeinfini then
							if modewave then
								display.remove(textreward)
								textreward=nil
							elseif modehard then
								display.remove(hardfl)
								hardfl=nil
								display.remove(hardtune1)
								hardtune1=nil
							else
								for i=1,3 do
									if etoile>=i then
										if etoilepiece~=nil then
											display.remove(etoilepiece[i])
											-- if etoilepiece[i]~=nil then
											-- 	fenconf:remove(etoilepiece[i])
											-- 	etoilepiece[i]:removeSelf()
									
										-- fenconf:remove(etoilepiece[i].pleine)
										-- etoilepiece[i].pleine:removeSelf()
											--end
										end
									end
								end
							end
						else
							if textaction=="Niveau créé" then
								multibouton[5].isVisible=false
								fenconf:remove(sauvegarder)
								sauvegarder:removeSelf()
								sauvegarder=nil
								if sauvegardertext~=nil then
									fenconf:remove(sauvegardertext)
									sauvegardertext:removeSelf()
									sauvegardertext=nil
								end
							end
						end
						if diamantgagner~=nil then
							fenconf:remove(diamantgagner)
							diamantgagner:removeSelf()
							diamantgagner=nil
						end
						fenconf:remove(conf)
						fenconf:remove(refu)
						conf:removeSelf()
						refu:removeSelf()
						reinit()
						if fenaction~=2 then
							savepourretourinf()
						end
						destructeurpartiel(1)
					end
				end
			end
			--print("action"..fenaction)
		end
		conf:addEventListener( "tap", confirm1 )
		if actionimg~=nil then
			actionimg:addEventListener("tap",confirm1)
		end
		function refu1(event)
			-- if fenaction==5 then
			-- 	if actionimg~=nil then
			-- 		actionimg:removeEventListener("tap",confirm1)
			-- 		fenconf:remove(actionimg)
			-- 		actionimg:removeSelf()
			-- 		actionimg=nil
			-- 	end
			-- 	conf:removeEventListener("tap",confirm1)
			-- 	refu:removeEventListener("tap",refu1)
			-- end
			-- recfondpause.isVisible=false
			if fenconf.isTouchable then
				recfondpause.alpha=0
				transition.from(recfondpause,{time=500,alpha=0.5})
				audio.play( son.uicl2)
				if fenaction~=5 then
					transition.to(fenconf,{time=500,transition=easing.inCirc, y=contentcentery-actualcontentheight-fenconf.height*fenconf.yScale*0.5, onComplete=completedisp1, tag="fenconf" ,onCancel=completedisp1})
				end
				--fenconf.isVisible=false

				if actionimg~=nil then
					actionimg:removeEventListener("tap",confirm1)
				end
				if fenaction~=2 or not tutolevel0 then
					conf:removeEventListener("tap",confirm1)
				end
				refu:removeEventListener("tap",refu1)
				if fenaction==2 then
					if multi~=1 then
						if modewave then
							display.remove(textreward)
							textreward=nil
						elseif modehard then
							display.remove(hardfl)
							hardfl=nil
							display.remove(hardtune1)
							hardtune1=nil
						else
							for i=1,3 do
								if etoile>=i then
									if etoilepiece~=nil then
										display.remove(etoilepiece[i])
										-- if etoilepiece[i]~=nil then
										-- 	fenconf:remove(etoilepiece[i])
										-- 	etoilepiece[i]:removeSelf()
											etoilepiece[i]=nil
										--end
									end
									-- fenconf:remove(etoilepiece[i].pleine)
									-- etoilepiece[i].pleine:removeSelf()
								end
							end
						end
						etoilepiece=nil
					end
					if diamantgagner~=nil then
						fenconf:remove(diamantgagner)
						diamantgagner:removeSelf()
						diamantgagner=nil
					end
					display.remove(conf)
					--conf:removeSelf()
					refu:removeSelf()
					reinit()
					if fenaction~=2 then
						savepourretourinf()
					end
					destructeurpartiel(0)
				elseif fenaction==5 then
					ennemipasse=-10
				else
					fenaff=false
					if fenaction==-1 then
						appuipause()
					end
				end
			end
		end
		refu:addEventListener("tap",refu1)
	end
end
function adsseen()
	if conf~=nil then
		lastchance()
	end
end
local function affmenuconf1(action)--affichage de la fenetre
	transition.cancel( "fenconf" )
	recfondpause.isVisible=true
	recfondpause:setFillColor(0)
	recfondpause.alpha=0.5
	transition.from(recfondpause,{time=500,alpha=0})
	fenconf.isTouchable=true
	local textaction=nil
	local gainetoile=nil
	if boutonnivsuivant~=nil then 
		fenconf:remove(boutonnivsuivant)
		boutonnivsuivant:removeSelf()
		boutonnivsuivant=nil
		if not goh then
			fenconf:remove(boutonnivsuivant1)
			boutonnivsuivant1:removeSelf()
			boutonnivsuivant1=nil
		end
	end
	if contreai==0 and modeinfini==false and aiactive==1 and contreaihaut==1 and action~=5 then
		if ennemipasse<=0 then
			action=3
		end
	end
	if fenetregagne~=nil then
		fenconf:remove(fenetregagne)
		fenetregagne:removeSelf()
		fenetregagne=nil
		fenetreconf.isVisible=true
	end
	if action==0 then
		textaction=affmenuconfaction0(textaction) -- retour au menu principal
	elseif action==-1 then
		textaction=affmenuconfactionm1(textaction) -- tuto30sec
	elseif action==1 then
		textaction=affmenuconfaction1(textaction) --  menu recommencer
	elseif action==2 then
		textaction=affmenuconfaction2(textaction) -- menu quand on perdu
	elseif action==3 then
		textaction,action,gainetoile=affmenuconfaction3(textaction,action) -- menu quand on a gagner
	elseif action==4 then
		multibouton[5].isVisible=false
		textaction,action=affmenuconfaction4(textaction,action) -- je sais pas, lié au fichier multi
	elseif action==5 then -- perdu mais peut claquer de la tune pour regagner une vie
		local groupafffric
		groupafffric=afffric()
		groupafffric.x=xminscreen
		groupafffric.y=yminscreen
		local prixlife
		if nbfoisdiamantforlife<6 then
			prixlife=(2^nbfoisdiamantforlife)*25
			if modehard and nbfoisdiamantforlife==1 then
				prixlife=75
			elseif modewave then
				prixlife=300
			end
		else
			prixlife=1000*(nbfoisdiamantforlife-5)
		end
		textaction="1          "..prixlife
		--fentext.text=textaction
		if actionimg~=nil then
			actionimg:removeEventListener("tap",confirm1)
			fenconf:remove(actionimg)
			actionimg:removeSelf()
			actionimg=nil
		end
		local actionimg1=display.newGroup()
		actionimg=display.newGroup()
		if goh then
			actionimg1.xScale=4
			actionimg1.yScale=actionimg1.xScale
		end
		actionimg:insert(actionimg1)
		local contourbar=display.newRoundedRect(0,0,202,20,5) --display.newRect(imbouton.menupause,4) -- imbouton.retourmenuprin,1)
		local contenubar=display.newRoundedRect(0,0,200,18,5)
		local textq=display.newEmbossedText(textaction,-10,25,fonttype,30*apparence*fontsize)
		textq:setEmbossColor(colortextemb)
		textq:setFillColor(0,0,0)
		local coeur=display.newImage(imbouton.batiment,15)
		if not goh then
			coeur.xScale=0.15
		else
			coeur.xScale=0.1
		end
		coeur.yScale=coeur.xScale
		coeur.x=-30
		coeur.y=25
		local diamant=display.newImage(imbouton.monnaie,6)
		diamant.xScale=0.15
		diamant.yScale=diamant.xScale
		diamant.x=60
		diamant.y=25
		contourbar:setFillColor(0.84,0.8,0.75)
		contourbar.strokeWidth=1
		contourbar:setStrokeColor(0,0,0)
		contenubar.strokeWidth=1
		contenubar:setStrokeColor(0,0.8,0)
		local nbiter=16 -- temps de l'annimation en 250ms
		transition.to(contenubar,{time=200+nbiter*250,xScale=0,x=contenubar.x-100} ) 
		contenubar:setFillColor(0,1,0)
		actionimg1:insert(contourbar)
		actionimg1:insert(contenubar)
		actionimg1:insert(textq)
		actionimg1:insert(coeur)
		actionimg1:insert(diamant)
		actionimg.img=4 -- a quoi ca sert?
		local nbtimercpt=1
		local function timerperdu( event )
			if ennemipasse>0 and nbtimercpt>=2 then
				groupafffric:removeSelf()
				groupafffric=nil
				nbtimercpt=nbiter+2
				-- timer.cancel( event.source )
			else
				if contenubar~=nil and actionimg~=nil and actionimg1~=nil then
					--contenubar.path.radius=5*(1+nbtimercpt/nbiter)
					contenubar:setFillColor(nbtimercpt/nbiter,1-nbtimercpt/nbiter,0)
					contenubar:setStrokeColor(nbtimercpt/nbiter*0.8,(1-nbtimercpt/nbiter)*0.8,0)
					--contenubar.width=200-event.count/8*200
					--isoldat[numerobis].rectvie.width=mathfloor(isoldat[numerobis].vie/isoldat[numerobis].vietotale*20)
					--isoldat[numerobis].rectvie:setFillColor(1-isoldat[numerobis].vie/isoldat[numerobis].vietotale,isoldat[numerobis].vie/isoldat[numerobis].vietotale,0 )
				end
			end
			if (nbtimercpt+1>=nbiter or ennemipasse==-10) and ennemipasse<=0 then
				--if ennemipasse==-10 and nbtimercpt<nbiter then
					nbtimercpt=nbiter+2
					-- timer.cancel( event.source )
				--else
					if actionimg~=nil then
						display.remove(actionimg)
						-- actionimg:removeEventListener("tap",confirm1)
						-- fenconf:remove(actionimg)
						-- actionimg:removeSelf()
						actionimg=nil
						display.remove(contenubar)
						contenubar=nil
					end
					conf:removeEventListener("tap",confirm1)
					refu:removeEventListener("tap",refu1)
				--end
				display.remove(groupafffric)
				-- groupafffric:removeSelf()
				groupafffric=nil
				fenaff=false
				findelapartie=true
				affmenuconf(2)
			end
			local autoriseads=true
			if actionimg~=nil then
				if actionimg.ads then
					autoriseads=false
				end
			end
			if not inappaff and autoriseads then
				nbtimercpt=nbtimercpt+1
			else
				nbtimercpt=1
				if contenubar~=nil then
					contenubar.xScale=1
					contenubar.x=0
					transition.to(contenubar,{time=200+nbiter*250,xScale=0,x=contenubar.x-100} )
				end
			end
			if nbtimercpt<=nbiter then
				timer.performWithDelay( 250,timerperdu)
			end
		end
		timer.performWithDelay( 250,timerperdu)
		local adsload=display.newImage(imbouton.ads,1)
		adsload.fill.effect = "filter.exposure"
		adsload.fill.effect.exposure =0
		transition.to(adsload.fill.effect,{delay=100,time=2000,exposure=2,transition=easing.continuousLoop} )
		transition.to(adsload.fill.effect,{delay=2100,time=2000,exposure=2} )
		actionimg1:insert(adsload)
		actionimg.ads=false
		if adsloadnewlife() or issimulator then
			adsload.xScale=0.15
			if not goh then
				adsload.xScale=adsload.xScale*1
			end
			adsload.yScale=adsload.xScale
			print("conf.y "..conf.y.." actionimg.y "..actionimg.y.." actionimg.yScale "..actionimg.yScale.." actionimg1.yScale "..actionimg1.yScale)
			adsload.y=(conf.y)/actionimg1.yScale/actionimg.yScale -- -actionimg.y/actionimg.yScale
			adsload.x=conf.x/actionimg1.xScale+conf.width*conf.xScale/actionimg1.xScale+adsload.xScale*adsload.width
			if not goh then
				adsload.y=adsload.y/4
				adsload.x=adsload.x/4
			end
			function adsload:tap(event)
				print("show the ads")
				actionimg.ads=true
				showadslife()
				print("the ads is shown")
				local function timerresetads(event)
					if actionimg~=nil then 
						actionimg.ads=false
					end
				end
				timer.performWithDelay( 200,timerresetads)
				-- if adsIsWatch then
				-- 	lastchance()
				-- 	local test2=display.newText("fait",contentcenterx,contentcentery)
				-- 	print("ads is watch")
				-- else
				-- 	local test2=display.newText("pas fait",contentcenterx,contentcentery)
				-- 	print("ads isn't watch")
				-- end
			end
			adsload:addEventListener("tap",adsload)
		else
			adsload.isVisible=false
		end
	end
	fenaction=action
	if action==2 then
		if not(modeinfini==false and aiactive==1 and contreaihaut==1) and multi==0 then
			local stataff2 = require("stataff")
			groupstat=stataff1()
			groupstat.anchorX=0
			groupstat.x=xminscreen+10
			groupstat.y=contentcentery
			groupstat.xScale=0.2
			groupstat.yScale=groupstat.xScale
			fenconf:insert(groupstat)
		end
		affmenuconfactionsi2(textaction,gainetoile) -- si gagner ou perdu
		savepourretourinf()--ici?? savepourretourinf()
	else
		affmenuconfactionsipas2(textaction)
	end
	fenconf.isVisible=true
	fenconf.x=0
	fenconf.y=0
	transition.from(fenconf,{time=500,transition=easing.outCirc, x=contentcenterx+actualcontentwidth+fenconf.width*fenconf.xScale*0.5, tag="fenconf"})
	if fenaff==false then
		affmenuconfcrealist(textaction)
	end

end
function affmenuconf(action)
	if functionToCall==nil then
		functionToCall=affmenuconf1
		functionToCallArg=action
	end
end
t.remove= function()
local a=1
end
return t