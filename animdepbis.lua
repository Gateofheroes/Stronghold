local t={}--fonction appeler uniquement par animdep
--permet d'alleger le contenu de animdep
--local pause1=require("pause")
--local animdep4=require("animdepter")
--local animdep1=require("animdep")
--local combat2 = require ( "combat" )

if not functionload then
	-- local nbtouchesoldat
	-- function timerfocalisation(event)
	-- 	if event.count<=1 then
	-- 		nbtouchesoldat=event.source.self.nbtouche
	-- 	elseif nbtouchesoldat~=event.source.self.nbtouche
	-- 		nbtouchesoldat=event.source.self.nbtouche
	-- 	else
	-- 		-- event.source.
	-- 		-- 	event.source.nbtouche=self.nbtouche+1
	-- 		-- 	display.getCurrentStage():setFocus( nil )
	-- 		-- 		self.isFocus = false
	-- 		-- 		if solenmov then
	-- 		-- 			local event1=event
	-- 		-- 			event1.phase="ended"
	-- 		-- 			soldatdeplacer(event1,self)
	-- 		-- 		end
	-- 		-- 		solenmov=false
	-- 	end
	-- end
	function timersoldatattaque(numero,valeur)--gestion du tir des oldats pouvant tirer
		local cpt=1
		--print("debut de timer")
		local tirera0=nil
		local num
		if isoldat[numero].tir.chargement==0 or valeur==-1 then
			local function tirera01(event)
				if isoldat[numero].tir.chargement>=2 then
					cpt=5
					isoldat[numero].tir.chargement=isoldat[numero].tir.chargement-1
				end
				if isoldat[numero].tir.tirer==1 then
					cpt=5
					isoldat[numero].tir.chargement=0
				end
				if cpt<4 then
					tirera0=timer.performWithDelay( isoldat[numero].tir.cadence*0.25*vitessejeuin,tirera01)
					local num1=timerpause(1,tirera0,num)
					cpt=cpt+1
				elseif cpt==4 then
					cpt=1
					jeupause.timerlibre[num]=2
					isoldat[numero].tir.tirer=1
					isoldat[numero].tir.chargement=0
				end
				--if cpt==5 then
					--isoldat[numero].tir.chargement=0
				--end
				--print("cpt"..cpt)sgwdrg
			end
			isoldat[numero].tir.chargement=isoldat[numero].tir.chargement+1
			if valeur==-1 then
				isoldat[numero].tir.chargement=1
				cpt=4
				isoldat[numero].tir.tirer=0
			end
			tirera0=timer.performWithDelay(isoldat[numero].tir.cadence*0.25*vitessejeuin,tirera01)
			num=timerpause(1,tirera0,nil)
		end	
	end
	function timersoldatatt(numero,valeur)--plus utiliser
		--tirera0=1
		--tirera0:removeSelf()
		--tirera0=nil
		--tirera01=nil
		local cpt=1
		--isoldat[numero].tir.charge=isoldat[numero].tir.charge+1
		
		local function tirera01(event)
			--if isoldat[numero].tir.tirer==1 then
			--if 

			
			--tirera0:removeSelf()
			--timer.cancel(timera01)
			if isoldat[numero].tir.tirer==0 then
				cpt=5
			end
			--if isoldat[numero].tir.charge>=2 then
			--	cpt=5
			--	isoldat[numero].tir.charge=isoldat[numero].tir.charge-1
			--end
			if cpt<4 then
				cpt=cpt+1
				--timera02=timer.performWithDelay( isoldat[numero].tir.cadence/4,tirera01)
			elseif cpt==4 then
				cpt=1
				if valeur==1 then
				--	isoldat[numero].tir.tirer=1
				end 

				if isoldat[numero].tir.tirer==1 then
				--	isoldat[numero].tir.tirer=0
				else
				--	isoldat[numero].tir.tirer=1
				end
			end
			jeupause.timerlibre[num]=2
		end
		tirera0=timer.performWithDelay( isoldat[numero].tir.cadence/4,tirera01)	
		local num=timerpause(3,tirera0)
	end


function pouvoirgros(numero,instance1)--action du pouvoir 3 sur les soldats
	if isoldat[numero].orientation==0 then
		--if isoldat[numero].classe==0 and race==0 or isoldat[numero].classe==2 and race==1 or isoldat[numero].classe==1 and race==2 then
			if pouvoir3activer==1 then 
				if isoldat[numero].pv3==false and isoldat[numero].pole==0 then
					isoldat[numero].pv3=true
					if isoldat[numero].classe==0 then
						isoldat[numero].vitesse=isoldat[numero].vitesse+1*bonus4
						isoldat[numero].attaque=isoldat[numero].attaque+10*bonus4
						--print("action")
					elseif isoldat[numero].classe==2 then
						isoldat[numero].vitesse=isoldat[numero].vitesse+1*bonus4
						isoldat[numero].charge=isoldat[numero].charge+5*bonus4
						--isoldat[i].vie=isoldat[i].vietotale
					elseif isoldat[numero].classe==1 then
						isoldat[numero].attaque=isoldat[numero].attaque+10*bonus4
						isoldat[numero].agressivite=isoldat[numero].agressivite+1*bonus4--??
						isoldat[numero].blocnbennemi=isoldat[numero].blocnbennemi+1
					elseif isoldat[numero].classe>=7 then
						isoldat[numero].attaque=isoldat[numero].attaque+20*bonus4
						isoldat[numero].blocnbennemi=isoldat[numero].blocnbennemi+2
						isoldat[numero].attnbennemi=isoldat[numero].attnbennemi+3
						isoldat[numero].vietotale=isoldat[numero].vietotale+100*bonus4
						isoldat[numero].vie=isoldat[numero].vie+100*bonus4
					end
					if affinfotab.num==numero and affinfotab.type==0 and affinfogr.isVisible then
						affinfo(numero,true,true)
					end
				end
				if instance1.gros==0 then
					instance1.gros=1
					if instance1.xScale>0 then
						instance1.xScale=instance1.xScale+0.06
					else
						instance1.xScale=instance1.xScale-0.06
					end
					instance1.yScale=instance1.yScale+0.06
					if isoldat[numero].typesoldat==275 or (isoldat[numero].typesoldat>=170 and isoldat[numero].typesoldat<180) then
						isoldat[numero].ombre.ombre:setFillColor(1,1,0)
					else
						isoldat[numero].ombre:setFillColor(1,1,0)
					end
				end
			else
				if isoldat[numero].pv3==true then
					isoldat[numero].pv3=false
					if isoldat[numero].classe==0 then
						isoldat[numero].vitesse=isoldat[numero].vitesse-1*bonus4
						isoldat[numero].attaque=isoldat[numero].attaque-10*bonus4
					elseif isoldat[numero].classe==2 then
						isoldat[numero].vitesse=isoldat[numero].vitesse-1*bonus4
						isoldat[numero].charge=isoldat[numero].charge-5*bonus4
						--isoldat[i].vie=isoldat[i].vietotale
					elseif isoldat[numero].classe==1 then
						isoldat[numero].attaque=isoldat[numero].attaque-10*bonus4
						isoldat[numero].agressivite=isoldat[numero].agressivite-1*bonus4
						isoldat[numero].blocnbennemi=isoldat[numero].blocnbennemi-1
					elseif isoldat[numero].classe>=7 then
						isoldat[numero].attaque=isoldat[numero].attaque-20*bonus4
						isoldat[numero].blocnbennemi=isoldat[numero].blocnbennemi-2
						isoldat[numero].attnbennemi=isoldat[numero].attnbennemi-3
						isoldat[numero].vietotale=isoldat[numero].vietotale-100*bonus4
						if isoldat[numero].vietotale>isoldat[numero].vie then
							isoldat[numero].vie=isoldat[numero].vietotale
						end
					end
					if affinfotab.num==numero and affinfotab.type==0 and affinfogr.isVisible then
						affinfo(numero,true,true)
					end
				end
				if instance1.gros==1 then
					instance1.gros=0
					if instance1.xScale>0 then
						instance1.xScale=instance1.xScale-0.06
					else
						instance1.xScale=instance1.xScale+0.06
					end
					instance1.yScale=instance1.yScale-0.06
					if isoldat[numero].classe<7 then
						if isoldat[numero].typesoldat==275 or (isoldat[numero].typesoldat>=170 and isoldat[numero].typesoldat<180) then
							isoldat[numero].ombre.ombre:setFillColor(0,1,0)
						else
							isoldat[numero].ombre:setFillColor(0,1,0)
						end
					else
						if isoldat[numero].typesoldat==275 or (isoldat[numero].typesoldat>=170 and isoldat[numero].typesoldat<180) then
							isoldat[numero].ombre.ombre:setFillColor(0,0,1)
						else
							isoldat[numero].ombre:setFillColor(0,0,1)
						end
					end
				end
			end
	end
	-- 				and instance1.gros==0 then
	-- if pouvoir3activer==1 and instance1.gros==0 then
	-- 	if isoldat[numero].orientation==0 then
	-- 		if isoldat[numero].classe==0 and race==0 or isoldat[numero].classe==2 and race==1 or isoldat[numero].classe==1 and race==2 then
	-- 			instance1.xScale=instance1.xScale+0.03
	-- 			instance1.yScale=instance1.yScale+0.03
	-- 		end
	-- 	end
	-- 	instance1.gros=1
	-- end
	-- if pouvoir3activer==0 and instance1.gros==1 then
	-- 	instance1.gros=0
	-- 	if isoldat[numero].orientation==0 then
	-- 		if isoldat[numero].classe==0 and race==0 or isoldat[numero].classe==2 and race==1 or isoldat[numero].classe==1 and race==2 then
	-- 			instance1.xScale=instance1.xScale-0.03
	-- 			instance1.yScale=instance1.yScale-0.03
	-- 		end
	-- 	end
	-- end
end
function arriver(numero,oricombat)--arriver a son objectif (donne les ordres sur les prochaines tache a executer)
	--local animdep1=require("animdep")
	--isoldat[numero].depcorr=nil
	if isoldat[numero].orientation==1 then -- mechant : reprend son chemin fonction pas au point : mechant a l'arret a son dernier point du chemin
		if isoldat[numero].vie>0 and isoldat[numero].vivant==true then
			local testmine=true
			local soldat=isoldat[numero].point
			local pasarriver=true
			if cheminarr~=nil then
				for i=1,#cheminarr do
					if soldat==cheminarr[i] then
						pasarriver=false
					end
				end
			end
			if soldat>0 and soldat<cheminnb and pasarriver then
				if isoldat[numero].charge>0 then
					isoldat[numero].actcharge=1
				end
				soldat=soldat+1
				--gestion intersection--
				local soldatancien=soldat--point ou le personnage est
				if intersection.nb>0 then
					local cpt=1
					while cpt<=intersection.nb do
						if isoldat[numero].point==intersection[cpt].pt then
							if intersection[cpt].ty==1 then
								local alea=mathrandom(0,intersection[cpt].proba)
								if alea==0 then
									soldat=intersection[cpt].un-1
								else
									soldat=intersection[cpt].deux-1
								end
							elseif intersection[cpt].ty==0 then
								soldat=intersection[cpt].un-1
							elseif intersection[cpt].ty==2 then
								local poleminenombre=0
								if contreai==1 then
									if isoldat[numero].pole~=isoldat[ibatiment[intersection[cpt].numbat].numsol].pole then
										poleminenombre=mineinfo.nb
									end
								end
								if isoldat[ibatiment[intersection[cpt].numbat-poleminenombre].numsol].vivant==true then
									local alea=mathrandom(0,intersection[cpt].proba)
									if alea==0 then
										soldat=intersection[cpt].un-1
									else
										soldat=intersection[cpt].deux-1
									end
									--print("alea")
								else
									--print("tt droit")
									soldat=intersection[cpt].un-1
								end
							end
						elseif intersection[cpt].ty==2 and isoldat[numero].point>intersection[cpt].pt then
							if isoldat[numero].point<ibatiment[intersection[cpt].numbat].ptproche then
								local poleminenombre=0
								if contreai==1 then
									if isoldat[numero].pole~=isoldat[ibatiment[intersection[cpt].numbat].numsol].pole then
										poleminenombre=mineinfo.nb
									end
								end
								if isoldat[ibatiment[intersection[cpt].numbat-poleminenombre].numsol].vivant==false then
									soldat=soldat+2*(ibatiment[intersection[cpt].numbat].ptproche-soldat)+1
									
								end
							elseif ibatiment[intersection[cpt].numbat].ptproche==soldat or ibatiment[intersection[cpt].numbat].ptproche==soldat+1 or ibatiment[intersection[cpt].numbat].ptproche==soldat-1 then
								-- local mineobjenvie=false
								-- if isoldat[numero].pole==isoldat[ibatiment[intersection[cpt].numbat].numsol].pole then
								-- 	if isoldat[ibatiment[intersection[cpt].numbat].numsol].vivant==true then
								-- 		mineobjenvie=true
								-- 	end
								-- elseif isoldat[ibatiment[intersection[cpt].numbat-mineinfo.nb].numsol].vivant==true then
								-- 	mineobjenvie=true
								-- end
								local poleminenombre=0
								if contreai==1 then
									if isoldat[numero].pole~=isoldat[ibatiment[intersection[cpt].numbat].numsol].pole then
										poleminenombre=mineinfo.nb
									end
								end
								if isoldat[ibatiment[intersection[cpt].numbat-poleminenombre].numsol].vivant==true then
								--if mineobjenvie then -- bug mine ici
									if isoldat[numero].ennemi==0 then
										isoldat[numero].ennemi=ibatiment[intersection[cpt].numbat-poleminenombre].numsol
										isoldat[numero].nbennemi=1
										isoldat[numero].cpt=10
										isoldat[numero].cptobj=10
										isoldat[numero].cptunadv=0
										isoldat[numero].cpt1=3--10--recalcul pour trouver d'un adversaire
										isoldat[numero].cpt2=0--compte le nb de fois que cpt1 atteint son max
										if isoldat[numero].cptobj~=nil then
											isoldat[numero].cpt=isoldat[numero].cptobj
										end
										testmine=false
										print("force a la mine num:"..numero.." animdepbis 224")
										
							     		--if isoldat[numero].vivant==true and instance1.supression==0 then
							     			--instance1.supression=1
							     		--print("va vers le gentil "..numero.." "..isoldat[numero].typesoldat.." distance de "..calculdist)
							     		if oricombat==nil then
								     		isoldat[numero].reut=true
								     		isoldat[numero].x3=isoldat[isoldat[numero].ennemi].x1
								     		isoldat[numero].y3=isoldat[isoldat[numero].ennemi].y1
										else
											animdep1.animdep(isoldat[numero].x1,isoldat[isoldat[numero].ennemi].x1,isoldat[numero].y1,isoldat[isoldat[numero].ennemi].y1,numero)
										end
										cpt=intersection.nb+1
									end
								end
							end
						end
						cpt=cpt+1
					end	
					if soldatancien~=soldat then
						--print("devait aller a "..soldatancien.." maintenant "..soldat)
					end						
				end
				isoldat[numero].point=soldat
				if modeinfini then
					if modeinfdif==0 then
						if moyenneprogression==0 then
							moyenneprogression=linftabpro[isoldat[numero].point]
						elseif moyenneprogressionmoy*0.7<linftabpro[isoldat[numero].point] then
							moyenneprogression=mathfloor((moyenneprogression*0.9+0.1*linftabpro[isoldat[numero].point])*100)*0.01
						end
						if progressionsoldatvague<linftabpro[isoldat[numero].point] then
							progressionsoldatvague=linftabpro[isoldat[numero].point]
						end
					end
				end
				--debut(soldat,chemin[soldatancien].x+isoldat[numero].xposi,chemin[soldat+1].x+isoldat[numero].xposi,chemin[soldatancien].y+isoldat[numero].yposi,chemin[soldat+1].y+isoldat[numero].yposi,numero)
			 	local xposicoef=1
			 	local yposicoef=1
			 	if chemin[soldat+1]~=nil then
			 		if chemin[soldat+1].mechant~=nil then
			 			xposicoef=chemin[soldat+1].mechant
			 			yposicoef=chemin[soldat+1].mechant
			 		end
			 	end
			 	--if isoldat[numero].ennemi==0 then
			 	if testmine then
			 		if oricombat==nil then
				 		isoldat[numero].reut=true
		     			isoldat[numero].x3=chemin[soldat+1].x+isoldat[numero].xposi*xposicoef
		     			isoldat[numero].y3=chemin[soldat+1].y+isoldat[numero].yposi*yposicoef-isoldat[numero].centrey+isoldat[numero].pole
				 	else
				 		animdep1.animdep(isoldat[numero].x1,chemin[soldat+1].x+isoldat[numero].xposi*xposicoef,isoldat[numero].y1,chemin[soldat+1].y+isoldat[numero].yposi*yposicoef-isoldat[numero].centrey+isoldat[numero].pole,numero)
					end
				end
			else
			 	if isoldat[numero].ombre.isVisible==true then
			 	else
			 		print("le soldat passe sans ombre")
			 	end
			 	local enleverviejoueur=true
			 	if contreai==1 then
			 		if isoldat[numero].y1>1024*0.3 then
						ennemipasseai=ennemipasseai-1
						enleverviejoueur=false
						if ennemipasseai==0 and findelapartie==false then
							--audio.play(son.eventperdu)
							findelapartie=true
							appuipause()
							affmenuconf(3)
							--display.newText( "t'es une merde ;)",actualcontentwidth/2,actualcontentheight/2,native.systemFontBold,32 )
						end
					end
				end
				if enleverviejoueur then
				 	if ennemipasse>0 then
				 		audio.play(son.eventbell,{channel=10})
				 		if modeinfini then
							if modeinfdif==0 then
								nbsoldatpasse=nbsoldatpasse+1
								varattgent=varattgent*1.2
								print("un soldat est passé varattgent "..varattgent)
							end
						end
					 	ennemipasse=ennemipasse-1 -- immortel
					 	fricanim(3,isoldat[numero].x1,isoldat[numero].y1)

						-- 	if ennemipasse>1 then
						-- 	passe.text="vies: "--display.newText("vies",actualcontentwidth/2+20,10,native.systemFontBold,12)
						-- else
						-- 	passe.text="vie: "--display.newText("vie",actualcontentwidth/2+20,10,native.systemFontBold,12)
						-- end
						passe.text=ennemipasse
					 	--passe:removeSelf( )
					 	--passe=display.newText(ennemipasse,actualcontentwidth/2,10,native.systemFontBold,12)
						if ennemipasse==0 and findelapartie==false then
							passe:setFillColor(0,0,0)
							-- findelapartie=true -- enlever les commentaire
							clicsurqqcfunc()
							numtapb=0
							if not fenaff then
								if not modeinfini and aiactive==1 and contreaihaut==1 then
									appuipause()
									affmenuconf(3) --2)
									audio.play(son.eventperdu)
								else
									appuipause()
									if multi==1 then
										affmenuconf(2)
									else
										if tutolevel0 or premium then
											affmenuconf(2)
										else
											affmenuconf(5) --2)
										end
									end
									audio.play(son.eventperdu)
								end
							end
							--display.newText( "t'es une merde ;)",actualcontentwidth/2,actualcontentheight/2,native.systemFontBold,32 )
						else -- if fpschoisi<1.3 then
							if feupassesoldat~=nil then
								--print("animation de perte de vie")
								local imin=1
								local etatmin=10
								for i=1,#feupassesoldat do
									if feupassesoldat[i].etat<etatmin then
										imin=i
										etatmin=feupassesoldat[i].etat
									end
								end
								if feupassesoldat[imin].etat==0 then
									local sequence
									if feupassesoldat[imin].seq~=nil then
										sequence=feupassesoldat[imin].seq
									else
										sequence="fl"
									end
									--print("sequence "..sequence)
									feupassesoldat[imin].anim=display.newSprite(effetexplo[sequence],effetexplo[sequence.."seq"])
									feupassesoldat[imin].anim:setSequence("levelup")
									feupassesoldat[imin].anim.x=feupassesoldat[imin].x
									feupassesoldat[imin].anim.y=feupassesoldat[imin].y
									feupassesoldat[imin].anim.xScale=feupassesoldat[imin].xScale
									feupassesoldat[imin].anim.xScale1=feupassesoldat[imin].anim.xScale
									feupassesoldat[imin].anim.yScale=0.01 --feupassesoldat[imin].yScale
									feupassesoldat[imin].anim.yScale1=feupassesoldat[imin].yScale
									feupassesoldat[imin].anim.y1=feupassesoldat[imin].y-feupassesoldat[imin].anim.yScale1*feupassesoldat[imin].anim.height*0.5
									feupassesoldat[imin].anim.alpha=0
									if feupassesoldat[imin].rotate~=nil then
										feupassesoldat[imin].anim:rotate(feupassesoldat[imin].rotate)
									end
									if feupassesoldat[imin].group~=nil then
										feupassesoldat[imin].anim.group=feupassesoldat[imin].group
									else
										feupassesoldat[imin].anim.group=mathfloor(feupassesoldat[imin].anim.y+1024)
									end
									group[feupassesoldat[imin].anim.group]:insert(feupassesoldat[imin].anim)
									spritegestion(feupassesoldat[imin].anim,-2) -- ajouter option pour fuilidifier
								else
									feupassesoldat[imin].anim.yScale1=feupassesoldat[imin].anim.yScale1+0.1
									feupassesoldat[imin].anim.y1=feupassesoldat[imin].y-feupassesoldat[imin].anim.yScale1*feupassesoldat[imin].anim.height*0.5
								end
								feupassesoldat[imin].etat=feupassesoldat[imin].etat+1
								--feupassesoldat[imin].anim.xScale1=feupassesoldat[imin].anim.xScale1+0.5
								if fpschoisi<1.3 then
									-- print("fpschoisi "..fpschoisi.." feupassesoldat[imin].anim.yScale="..feupassesoldat[imin].anim.yScale)
									local latransition1=transition.to(feupassesoldat[imin].anim,{time=500*vitessejeuin,alpha=0.9,y=feupassesoldat[imin].anim.y1,xScale=feupassesoldat[imin].anim.xScale1,yScale=feupassesoldat[imin].anim.yScale1,tag="elementtype"})
									if jeupause.etat==1 then
										transition.pause(latransition1)
									end
								else
									feupassesoldat[imin].anim.yScale=feupassesoldat[imin].anim.yScale1
									feupassesoldat[imin].anim.alpha=0.9
									feupassesoldat[imin].anim.y=feupassesoldat[imin].anim.y1
									--	print("fpschoisi "..fpschoisi.." feupassesoldat[imin].anim.yScale="..feupassesoldat[imin].anim.yScale.." feupassesoldat[imin].anim.xScale="..feupassesoldat[imin].anim.xScale)
								end
							end
							if goh and (niveauch==14 or niveauch==16) then
								if niveauch==14 then
									local numeroobs=2
									if mathfloor(ennemipasse*0.5)==ennemipasse*0.5 then
										numeroobs=3
									end
									if ennemipasse<13 then
										local frameaff=7-mathfloor(ennemipasse*0.5)
										if frameaff>6 then
											frameaff=6
										elseif frameaff<1 then
											frameaff=1
										end
										obstacleim[numeroobs]:setFrame(frameaff)
									end
								elseif niveauch==16 then -- 15 life
									if ennemipasse<13 then
										local frameaff=mathfloor((13-ennemipasse)/3)
										if frameaff>4 then
											frameaff=4
										elseif frameaff<1 then
											frameaff=1
										end
										obstacleim[6]:setFrame(frameaff)
									end
								end
							end
						end
					end
				end
				--end
				isoldat[numero].vivant=false
			 	isoldat[numero].vie=0-- -133
			 	isoldat[numero].ennemi=0
			 	isoldat[numero].ennemipb=false
			 	isoldat[numero].nbennemi=0
			 	isoldat[numero].remp=1
			 	isoldat[numero].ombre.isVisible=false
				isoldat[numero].rectvie.width=0
				isoldat[numero].rectvie.alpha=0
				if isoldat[numero].orientation==0 and (savegameall.xpactive or isoldat[numero].gene==1) then
					isoldat[numero].rectxp.width=0
					isoldat[numero].rectxp.alpha=0
				end
			end
		end
	elseif isoldat[numero].orientation==0 then -- gentil : 
		print("arriver")
		print("arriver")
			--print("obj statique")
			--print("statique")
			-- if isoldat[numero].depcorr~=nil then
			-- 	isoldat[numero].depcorr=nil
			-- 	instance1.supression=0
			-- 	print("mise depcorr a nil")
			-- else
				if isoldat[numero].classe<4 then
					print("class<4")
					isoldat[numero].vivant=true
					isoldat[numero].endeplacement=0
					isoldat[numero].encombat=0
					isoldat[numero].ennemi=0
					isoldat[numero].ennemipb=false
					if oricombat==nil then
						print("oricombat")
						isoldat[numero].reut=true
		     			isoldat[numero].x3=ibatiment[isoldat[numero].numbat].drap.x+isoldat[numero].xposi --chemin[soldat+1].x+isoldat[numero].xposi*xposicoef
		     			isoldat[numero].y3=ibatiment[isoldat[numero].numbat].drap.y+isoldat[numero].yposi-isoldat[numero].centrey
		     			
					else
						print("cherche0")
						
						animdep1.animdep(isoldat[numero].x1,ibatiment[isoldat[numero].numbat].drap.x+isoldat[numero].xposi,isoldat[numero].y1,ibatiment[isoldat[numero].numbat].drap.y+isoldat[numero].yposi-isoldat[numero].centrey,numero)
					end
				elseif isoldat[numero].classe<7 then
					if isoldat[numero].classe==6 then
						--print("renfort arriver")
						if oricombat==nil then
							isoldat[numero].reut=true
			     			isoldat[numero].x3=isoldat[numero].coorx
			     			isoldat[numero].y3=isoldat[numero].coory
			     		else
							animdep1.animdep(isoldat[numero].x1,isoldat[numero].coorx,isoldat[numero].y1,isoldat[numero].coory,numero)
						end
					else
						if oricombat==nil then
							isoldat[numero].reut=true
			     			isoldat[numero].x3=pouvoir1action[isoldat[numero].pouvoir].x+isoldat[numero].xposi,isoldat[numero].y1
			     			isoldat[numero].y3=pouvoir1action[isoldat[numero].pouvoir].y+isoldat[numero].yposi
			     		else
							animdep1.animdep(isoldat[numero].x1,pouvoir1action[isoldat[numero].pouvoir].x+isoldat[numero].xposi,isoldat[numero].y1,pouvoir1action[isoldat[numero].pouvoir].y+isoldat[numero].yposi,numero)
						end
					end
				else
					isoldat[numero].vivant=true
					isoldat[numero].endeplacement=0
					isoldat[numero].encombat=0
					isoldat[numero].ennemi=0
					isoldat[numero].ennemipb=false
					print("arriver "..numero)
					--print(" ici mon garcon")
					local objectifx=genepoint.x
					local objectify=genepoint.y
					if isoldat[numero].gene==0 then
						objectifx=objectifx+isoldat[numero].xposi
						objectify=objectify+isoldat[numero].yposi
					end
					if oricombat==nil then
						isoldat[numero].reut=true
			     		isoldat[numero].x3=objectifx
			     		isoldat[numero].y3=objectify-isoldat[numero].centrey
			     	else
						animdep1.animdep(isoldat[numero].x1,objectifx,isoldat[numero].y1,objectify-isoldat[numero].centrey,numero)
					end
				end
			--end
	end
end

function retouractnormale(numero,oricombat)--cas ou on rompte le deplacement ou l'attaque de l'unité
	--print("dans retour nomal"..numero)
	isoldat[numero].cptunadv=0
	--local animdep1=require("animdep")
	--local function timer5(event)
	if isoldat[numero].ennemi==0 and isoldat[numero].nbennemi==0 then
		detection(numero)
	end
	if isoldat[numero].orientation==0 then
		if isoldat[numero].classe<4 then
			if  (ibatiment[isoldat[numero].numbat].niveau==isoldat[numero].niveau or modearmy) and ibatiment[isoldat[numero].numbat].sup1==0 then--ibatiment[isoldat[numero].numbat].evol==0  and
				if oricombat==nil then
					isoldat[numero].reut=true
	     			isoldat[numero].x3=ibatiment[isoldat[numero].numbat].drap.x+isoldat[numero].xposi
	     			isoldat[numero].y3=ibatiment[isoldat[numero].numbat].drap.y+isoldat[numero].yposi-isoldat[numero].centrey
				else	
					animdep1.animdep(isoldat[numero].x1,ibatiment[isoldat[numero].numbat].drap.x+isoldat[numero].xposi,isoldat[numero].y1,ibatiment[isoldat[numero].numbat].drap.y+isoldat[numero].yposi-isoldat[numero].centrey,numero)--,isoldat[numero].vitesse
				end
				--print("retour a normal gentil dependant bat animdepbis 295")
			else
				isoldat[numero].vivant=false
				isoldat[numero].vie=0-- -133
				isoldat[numero].ombre.isVisible=false
				isoldat[numero].rectvie.width=0
				isoldat[numero].rectvie.alpha=0
				if isoldat[numero].orientation==0 and (savegameall.xpactive or isoldat[numero].gene==1) then
					isoldat[numero].rectxp.width=0
					isoldat[numero].rectxp.alpha=0
				end
				isoldat[numero].nbennemi=0
				libnum(numero)
				print("libnum")
			end
		elseif isoldat[numero].classe<7 then
			if isoldat[numero].classe==6 then
				if oricombat==nil then
					isoldat[numero].reut=true
		     		isoldat[numero].x3=isoldat[numero].coorx
		     		isoldat[numero].y3=isoldat[numero].coory
		     	else
					animdep1.animdep(isoldat[numero].x1,isoldat[numero].coorx,isoldat[numero].y1,isoldat[numero].coory,numero)
				end
			else

				--print("renfort retour normal")
				if oricombat==nil then
					isoldat[numero].reut=true
		     		isoldat[numero].x3=pouvoir1action[isoldat[numero].pouvoir].x+isoldat[numero].xposi,isoldat[numero].y1
		     		isoldat[numero].y3=pouvoir1action[isoldat[numero].pouvoir].y+isoldat[numero].yposi
		     	else
					animdep1.animdep(isoldat[numero].x1,pouvoir1action[isoldat[numero].pouvoir].x+isoldat[numero].xposi,isoldat[numero].y1,pouvoir1action[isoldat[numero].pouvoir].y+isoldat[numero].yposi,numero)
				end
			end
		else
			--print("fin gene attaque")
			detection(numero)
			local objectifx=genepoint.x
			local objectify=genepoint.y or isoldat[numero].y1 or isoldat[numero].y or 0
			if isoldat[numero].gene==0 then
				objectifx=objectifx+isoldat[numero].xposi
				objectify=objectify+isoldat[numero].yposi
			end
			if oricombat==nil then
				isoldat[numero].reut=true
	     		isoldat[numero].x3=objectifx
	     		isoldat[numero].y3=objectify-isoldat[numero].centrey
		  	else
				animdep1.animdep(isoldat[numero].x1,objectifx,isoldat[numero].y1,objectify-isoldat[numero].centrey,numero)
			end
		end
	else
	 	 --chercher ici le bon point d'objectif car le probleme est que le mechant peut retourner en arriere
		 -- /!\ faire attention aux intersections, risque de changement de trajectoir intempestif
		local point_test = 1
		local nb_de_point_chemin = cheminnb -- nombre de points dans le tableau chemin (lié a la  map)
		local distance_minimum = (chemin[1].x-isoldat[numero].x1)*(chemin[1].x-isoldat[numero].x1)+(chemin[1].y+isoldat[numero].pole-isoldat[numero].y1)*(chemin[1].y+isoldat[numero].pole-isoldat[numero].y1)
		local point_minimum = 1
		while point_test<= nb_de_point_chemin do 	--faire le calcul de la distance soldat[numero]-ennemi pour tout les ennemis
			-- restreint le calcul aux mechants vivants ainsi qu'aux ennemis qui n'ont pas assez d'adversaire
			local calcul=(chemin[point_test].x-isoldat[numero].x1)*(chemin[point_test].x-isoldat[numero].x1)+(chemin[point_test].y+isoldat[numero].pole-isoldat[numero].y1)*(chemin[point_test].y+isoldat[numero].pole-isoldat[numero].y1)--i
			if(calcul<distance_minimum) then 	-- le rayon de detection des soldats et de 20000 
				distance_minimum = calcul
				point_minimum = point_test
			end
			point_test = point_test+1 --+plus1auto
		end
		if intersection.nb>0 then
			local cpt=1
			while cpt<=intersection.nb do
				if intersection[cpt].ty==2 and point_minimum>ibatiment[intersection[cpt].numbat].ptproche then --intersection[cpt].pt then
					--print("point min inf bat point proche")
					if point_minimum<ibatiment[intersection[cpt].numbat].ptproche+(ibatiment[intersection[cpt].numbat].ptproche-intersection[cpt].pt) then
						local poleminenombre=0
						if contreai==1 then
							if isoldat[numero].pole~=isoldat[ibatiment[intersection[cpt].numbat].numsol].pole then
								poleminenombre=mineinfo.nb
							end
						end
						if isoldat[ibatiment[intersection[cpt].numbat-poleminenombre].numsol].vivant==true then
							--print("mine retournormal avant "..point_minimum.." ibatiment[intersection[cpt].numbat].ptproche "..ibatiment[intersection[cpt].numbat].ptproche)
							if point_minimum>ibatiment[intersection[cpt].numbat-poleminenombre].ptproche then
							--	print("passe par ici")
								point_minimum=-point_minimum+2*(ibatiment[intersection[cpt].numbat-poleminenombre].ptproche)
							else
								point_minimum=point_minimum+1 --ibatiment[intersection[cpt].numbat-poleminenombre].ptproche-2 --point_minimum-2*(ibatiment[intersection[cpt].numbat].ptproche-point_minimum)
							end
							print("mine retournormal "..point_minimum)
						else
							--point_minimum=point_minimum
						end
						cpt=intersection.nb+1
					end
				end
				cpt=cpt+1
			end
		end
		local plus1auto=0
		if intersection.nb>0 then
			local cpt=1
			while cpt<=intersection.nb do
				-- if point_minimum+1==intersection[cpt].pt then
				-- 	plus1auto=-1
				-- 	print("plus1auto -1")
				-- 	--cpt=intersection.nb+1
				-- end
				if intersection[cpt].type~=2 then
					if point_minimum+1==intersection[cpt].pt then
						plus1auto=-1
						print("plus1auto -0")
						--cpt=intersection.nb+1
					end
					if point_minimum==intersection[cpt].pt then
						plus1auto=-2
						print("plus1auto -1")
						--cpt=intersection.nb+1
					end
					if point_minimum-1==intersection[cpt].pt then
						plus1auto=-1
						print("plus1auto -2")
						cpt=intersection.nb+1
					end
				-- elseif isoldat[ibatiment[intersection[cpt].numbat].numsol].vivant==false then
				-- 	if point_minimum>intersection[cpt].pt and point_minimum<ibatiment[intersection[cpt].numbat].ptproche then

				-- 	plus1auto=-3
				end
				cpt=cpt+1
			end
		end 

		point_minimum=point_minimum+plus1auto
		--print("num point".."numero"..numero..point_minimum)
		isoldat[numero].point = point_minimum
		--arriver?
		arriver(numero,oricombat)
	 	--animdep1.animdep(isoldat[numero].x1,chemin[point_minimum+1].x+isoldat[numero].xposi,isoldat[numero].y1,chemin[point_minimum+1].y+isoldat[numero].yposi,numero)
	end
	--end

	--timer5=timer.performWithDelay( 2, listener5 )
end

--quand un soldat va attaquer un autre soldat
function attaque(numero,instance1)
	--print("attaque de "..numero)
	isoldat[numero].cptunadv=0
	--local animdep4=require("animdepter")
	--local combat1 = require ( "combat" )
	if isoldat[numero].actcharge==1 then
		isoldat[numero].actcharge=0
		-- debut retourdinformation
		local vieenlever=pertevie(isoldat[numero].ennemi,isoldat[numero].charge)--ne pas diviser par 5
		if isoldat[numero].orientation==0 then
			if isoldat[numero].classe<4 then
				ibatiment[isoldat[numero].numbat].vieenlever=ibatiment[isoldat[numero].numbat].vieenlever+vieenlever
			elseif isoldat[numero].classe<7 then
				--vie enlever par le pv1
				retinf.attpv1=retinf.attpv1+vieenlever
			else
				--vie enlever par le general
				retinf.attgene=retinf.attgene+vieenlever
			end
			enlevevie(numero,vieenlever)
		end
		-- fin retourdinformation
		-- isoldat[isoldat[numero].ennemi].orientation=1
		if isoldat[numero].typesoldat==224 then
			pertevie(numero,1000)
		end
		if isoldat[numero].ennemi~=0 then
			if not isoldat[isoldat[numero].ennemi].vivant then
				animchargemort(isoldat[numero].ennemi,numero,0,1,true)
				if isoldat[numero].typesoldat==179 then
					isoldat[numero].actcharge=1
					-- local attackrestante=300+isoldat[numero].charge
					-- local i=1
					-- while i<=nbsoldat do
					-- 	if isoldat[i].orientation~=isoldat[numero].orientation and isoldat[i].encombat==1 and isoldat[numero].ennemi~=i and isoldat[i].vivant then
					-- 		if isoldat[i].ennemi==numero or 500>mathabs((isoldat[i].x1+isoldat[i].direction*isoldat[i].centrex)-(isoldat[numero].x1+isoldat[numero].direction*isoldat[numero].centrex))+mathabs((isoldat[i].y1+isoldat[i].centrey)-(isoldat[numero].y1+isoldat[numero].centrey)) then
					-- 			local vieenlever=pertevie(i,attackrestante)
					-- 			attackrestante=attackrestante-vieenlever
					-- 			if isoldat[numero].orientation==0 then
					-- 				if isoldat[numero].classe<4 then
					-- 					ibatiment[isoldat[numero].numbat].vieenlever=ibatiment[isoldat[numero].numbat].vieenlever+vieenlever --*(1+fpschoisi-isoldat[numero].tscale)--*fpschoisi
					-- 				elseif isoldat[numero].classe<7 then
					-- 					retinf.attpv1=retinf.attpv1+vieenlever --*(1+fpschoisi-isoldat[numero].tscale)--*fpschoisi
					-- 				else
					-- 					enlevevie(numero,vieenlever) --*(1+fpschoisi-isoldat[numero].tscale))
					-- 					retinf.attgene=retinf.attgene+vieenlever --*(1+fpschoisi-isoldat[numero].tscale)--*fpschoisi
					-- 				end	
					-- 			end
					-- 			animchargemort(i,numero,0,1,true)
					-- 			if attackrestante<=1 then -- (0.25-1) -0.75 -> 4 -- 4/1
					-- 				i=nbsoldat+2									 -- (1-0.25) 0.75 -> 0.25 -- 1/4
					-- 			end
					-- 		end
					-- 	end
					-- 	i=i+1
					-- end
				end
			end
		end
	else
		isoldat[numero].actcharge=0
	end
	if isoldat[numero].ennemi~=0 then
		if isoldat[isoldat[numero].ennemi].vivant==true then --isoldat[isoldat[numero].ennemi].vie>0 then		
			--local combat1 = require ( "combat" )
			--instance1.supression=1
			--combat1.combat(numero,isoldat[numero].ennemi,0,0) -- execute la fonction de combat--------pourquoi 0,0???????????? variable inutile
			-- ici aqui
			if isoldat[numero].typesoldat==224 then
				pertevie(isoldat[numero].ennemi,isoldat[numero].charge)--ne pas diviser par 5
				pertevie(numero,1000)
			else
				--print("combat pour "..numero)
				combatbis(numero,isoldat[numero].ennemi,0,0)
			end
		else
			--instance1.supression=1--facultatif?
			print("retournormal charge tue ennemi")
			if isoldat[numero].typesoldat==179 then
				isoldat[numero].ennemi=0
				if isoldat[numero].nbennemi>1 then
					isoldat[numero].nbennemi=isoldat[numero].nbennemi-1
					local mini=1
					local maxi=nbsoldat
					if isoldat[numero].orientation==1 then
						mini=nbsoldatg
						maxi=0
					end	
					for i=mini,maxi,1 do
					--while i<nbsoldat do
						if isoldat[i].ennemi==numero and isoldat[i].vivant then
							isoldat[numero].ennemi=i
							--i=nbsoldat+2
							break
						end
					end
				else
					isoldat[numero].nbennemi=0
				end
				if isoldat[numero].ennemi==0 then
					retouractnormale(numero)
				else
					--print("isoldat[isoldat[numero].ennemi].x1="..isoldat[isoldat[numero].ennemi].x1)
					--print("")
					--local calculdist=((isoldat[isoldat[numero].ennemi].x1+isoldat[isoldat[numero].ennemi].direction*isoldat[isoldat[numero].ennemi].centrex)-(isoldat[numero].x1+isoldat[numero].direction*isoldat[numero].centrex))^2+((isoldat[isoldat[numero].ennemi].y1+isoldat[isoldat[numero].ennemi].centrey)-(isoldat[numero].y1+isoldat[numero].centrey))^2
					instance1.supression=0
					unadversaire(numero,instance1)
				end
			else
				retouractnormale(numero)--facultatif?
			end

			--a remplir enfin supposition
		end
	end
end
function obstaclsoldtest(numero,instance1,pointcentralx,pointcentraly,autonome)
	--print("verification pas en dehors des zones autorisées")
	local i=1
	local autorisetestbeta=false
	isoldat[numero].depcorr=false
	instance1.statique=0
	if obstaclsold~=nil then
		while i<=obstaclsold.nb do
			--print("compare a l'obstacle")
			local rayonobst=1500
			if obstaclsold[i].rayon~=nil then
				rayonobst=obstaclsold[i].rayon
			end
			if (obstaclsold[i].x-(isoldat[numero].x1+isoldat[numero].direction*isoldat[numero].centrex))^2+(obstaclsold[i].y+isoldat[numero].pole-(isoldat[numero].y1+isoldat[numero].centrey))^2<rayonobst then
				--print("sur zone interdite")
				local numchemin=1
				if obstaclsold[i].point~=nil then
					numchemin=obstaclsold[i].point
				else
					local j=2
					local calculdistbis=(chemin[1].x-(isoldat[numero].x1+isoldat[numero].direction*isoldat[numero].centrex))^2+(chemin[1].y+isoldat[numero].pole-(isoldat[numero].y1+isoldat[numero].centrey))^2
					while j<=cheminnb do
						local calculdistter=(chemin[j].x-(isoldat[numero].x1+isoldat[numero].direction*isoldat[numero].centrex))^2+(chemin[j].y+isoldat[numero].pole-(isoldat[numero].y1+isoldat[numero].centrey))^2
						if calculdistter<=calculdistbis then
							calculdistbis=calculdistter
							numchemin=j
						end
						j=j+1
					end
				end
				pointcentralx=(isoldat[numero].x1+isoldat[numero].direction*isoldat[numero].centrex+chemin[numchemin].x)*0.5
				pointcentraly=(isoldat[numero].y1+isoldat[numero].pole+isoldat[numero].centrey+chemin[numchemin].y+isoldat[numero].pole)*0.5
				i=obstaclsold.nb+1
				--print("le point choisi est le ".. numchemin.." soldat "..numero)
				if instance1.supression==0 then
					--print("soldat dans zone interdite")
					--print("vraiment rediriger")
					isoldat[numero].depcorr=true
					autorisetestbeta=true
					instance1.supression=1
					isoldat[numero].reut=true
		     		isoldat[numero].x3=pointcentralx
		     		isoldat[numero].y3=pointcentraly
					-- animdep1.animdep(isoldat[numero].x1,pointcentralx,isoldat[numero].y1,pointcentraly,numero)
				end
			end
			i=i+1
		end
	end
	if genenum==numero and autorisetestbeta==false then
		-- print("test d'interdiction du general")
		if obstaclegene~=nil then
			local i=1
			while i<=obstaclegene.nb do
				local rayonobst=1500
				if obstaclegene[i].rayon~=nil then
					rayonobst=obstaclegene[i].rayon
				end
				if (obstaclegene[i].x-(isoldat[numero].x1+isoldat[numero].direction*isoldat[numero].centrex))^2+(obstaclegene[i].y+isoldat[numero].pole-(isoldat[numero].y1+isoldat[numero].centrey))^2<rayonobst then
					--print("sur zone interdite")
					local numchemin=1
					if obstaclegene[i].point~=nil then
						numchemin=obstaclegene[i].point
						pointcentralx=chemin[numchemin].x
						pointcentraly=chemin[numchemin].y
						--print("general pos interdit")
					else
						local j=2
						local calculdistbis=(chemin[1].x-(isoldat[numero].x1+isoldat[numero].direction*isoldat[numero].centrex))^2+(chemin[1].y+isoldat[numero].pole-(isoldat[numero].y1+isoldat[numero].centrey))^2
						while j<=cheminnb do
							local calculdistter=(chemin[j].x-(isoldat[numero].x1+isoldat[numero].direction*isoldat[numero].centrex))^2+(chemin[j].y+isoldat[numero].pole-(isoldat[numero].y1+isoldat[numero].centrey))^2
							if calculdistter<=calculdistbis then
								calculdistbis=calculdistter
								numchemin=j
							end
							j=j+1
						end
						pointcentralx=(isoldat[numero].x1+isoldat[numero].direction*isoldat[numero].centrex+chemin[numchemin].x)*0.5
						pointcentraly=(isoldat[numero].y1+isoldat[numero].pole+isoldat[numero].centrey+chemin[numchemin].y+isoldat[numero].pole)*0.5
						--print("general pos interdite 2")
					end
					i=obstaclegene.nb+1
					--print("le point choisi est le ".. numchemin.." soldat "..numero)
					if instance1.supression==0 then
						--print("vraiment rediriger zone interdite")
						isoldat[numero].depcorr=true
						autorisetestbeta=true
						instance1.supression=1
						isoldat[numero].reut=true
			     		isoldat[numero].x3=pointcentralx
			     		isoldat[numero].y3=pointcentraly
						--animdep1.animdep(isoldat[numero].x1,pointcentralx,isoldat[numero].y1,pointcentraly,numero)
					end
				end
				i=i+1
			end
		end
	end
	return autorisetestbeta
end
function unadversaire(numero,instance1)--action a faire quand le soldat "voit" un adversaire
	if isoldat[numero].cptunadv<50 then
		if issimulator and false then
			local lecercle=display.newCircle(group[2048],isoldat[numero].x1,isoldat[numero].y1,7)
			lecercle:setFillColor(0,0,0)
			local function letimercercle(event)
				event.source.lecercle:removeSelf()
				event.source.lecercle=nil
			end
			local lecercledata=timer.performWithDelay(500,letimercercle)
			lecercledata.lecercle=lecercle
		end
		--local animdep1=require("animdep")
		--local calculdist=((isoldat[isoldat[numero].ennemi].x1-isoldat[isoldat[numero].ennemi].centrex)-(isoldat[numero].x1+isoldat[numero].centrex))^2+((isoldat[isoldat[numero].ennemi].y1-isoldat[isoldat[numero].ennemi].centrey)-(isoldat[numero].y1+isoldat[numero].centrey))^2
		local calculdist=((isoldat[isoldat[numero].ennemi].x1+isoldat[isoldat[numero].ennemi].direction*isoldat[isoldat[numero].ennemi].centrex)-(isoldat[numero].x1+isoldat[numero].direction*isoldat[numero].centrex))^2+((isoldat[isoldat[numero].ennemi].y1+isoldat[isoldat[numero].ennemi].centrey)-(isoldat[numero].y1+isoldat[numero].centrey))^2
		--- calculdist=((ennemi.x+ennemi.direction*ennemi.centrex)-(x1+direction*centrex))^2+((ennemi.y+cenctrey)-(y+centrey))^2
		-- local calculdist=((isoldat[isoldat[numero].ennemi].x1+isoldat[isoldat[numero].ennemi].direction*isoldat[isoldat[numero].ennemi].centrex)-(isoldat[numero].x1+isoldat[numero].direction*isoldat[numero].centrex))^2+((isoldat[isoldat[numero].ennemi].y1-isoldat[isoldat[numero].ennemi].centrey)-(isoldat[numero].y1-isoldat[numero].centrey))^2
		--local calculdist=((isoldat[isoldat[numero].ennemi].x1)-(isoldat[numero].x1))^2+((isoldat[isoldat[numero].ennemi].y1)-(isoldat[numero].y1))^2
		-- print("calcul dist"..calculdist)	
		--if calculdist<11000
		--local porteennemi=
		local distsold=100*(isoldat[numero].porte+isoldat[isoldat[numero].ennemi].porte)
		if goh then
			distsold=(isoldat[numero].width*0.3+isoldat[isoldat[numero].ennemi].width*0.3)^2
			--print("porte "..distsold)
		end
		--if isoldat[isoldat[numero].ennemi].mine==true then
			--distsold=4000
		--else
			if isoldat[isoldat[numero].ennemi].encombat==1 and isoldat[isoldat[numero].ennemi].mine==false then
				distsold=distsold*0.7
			end
		--end
		if distsold<calculdist then
			if calculdist>=2000 then
				if isoldat[numero].actcharge==0 and isoldat[numero].charge>0 then
					isoldat[numero].actcharge=1
					--print("actcharge")
				end
			end
			 -- les deux soldats concernés se déplacent l'un vers l'autre jusqu'à 100 de différence
		 	if isoldat[numero].cptobj==nil then
		 		isoldat[numero].cptobj=mathfloor((calculdist/(80*isoldat[numero].vitesse*isoldat[isoldat[numero].ennemi].vitesse))^0.6)
		 		-- if isoldat[numero].cptobj<20 then
		 		-- 	local number=20-isoldat[numero].cptobj
		 		-- 	isoldat[numero].cptobj=mathfloor(isoldat[numero].cptobj+number*0.5)
		 		-- else
		 		-- 	local number=isoldat[numero].cptobj-20
		 		-- 	isoldat[numero].cptobj=mathfloor(isoldat[numero].cptobj-mathsqrt(number))
		 		-- end

		 		--print("num"..numero.."isoldat[numero].cptobj"..isoldat[numero].cptobj.." calculdist "..calculdist.." ennemi"..isoldat[numero].ennemi)
		 	end
			if isoldat[numero].cpt>=isoldat[numero].cptobj  then --20 then
				isoldat[numero].cpt=0
				isoldat[numero].cptobj=nil
				if instance1.supression==0 then
					if issimulator and false then
						local lecercle=display.newCircle(group[2048],isoldat[numero].x1,isoldat[numero].y1,7)
						lecercle:setFillColor(1,1,0)
						local function letimercercle(event)
							event.source.lecercle:removeSelf()
							event.source.lecercle=nil
						end
						local lecercledata=timer.performWithDelay(500,letimercercle)
						lecercledata.lecercle=lecercle
					end
					isoldat[numero].cptunadv=isoldat[numero].cptunadv+1
					local pointcentralx=nil
					local pointcentraly=nil
					if false then -- isoldat[isoldat[numero].ennemi].tir==0 and isoldat[numero].encombat==0 and distsold*5>calculdist then
						pointcentralx=(isoldat[numero].x1+isoldat[numero].direction*isoldat[numero].centrex+isoldat[isoldat[numero].ennemi].x1+isoldat[isoldat[numero].ennemi].direction*isoldat[isoldat[numero].ennemi].centrex)*0.5--*3/5
						pointcentraly=(isoldat[numero].y1+isoldat[numero].centrey+isoldat[isoldat[numero].ennemi].y1+isoldat[isoldat[numero].ennemi].centrey)*0.5--*3/5 -- -isoldat[isoldat[numero].ennemi].centrey)/2
						--print("point central loin")
					else
						pointcentralx=isoldat[isoldat[numero].ennemi].x1+isoldat[isoldat[numero].ennemi].direction*isoldat[isoldat[numero].ennemi].centrex -isoldat[numero].direction*isoldat[numero].centrex -- -isoldat[numero].direction*isoldat[numero].centrex+isoldat[numero].direction*100 
						-- pointcentraly=isoldat[isoldat[numero].ennemi].y1+isoldat[isoldat[numero].ennemi].centrey-isoldat[numero].centrey
						pointcentraly=isoldat[isoldat[numero].ennemi].y1+isoldat[isoldat[numero].ennemi].centrey-isoldat[numero].centrey -- +(isoldat[isoldat[numero].ennemi].y1-isoldat[numero].y1)*10
						--print("point central")
						--local calculdist=((ennemi.x1+ennemi.direction*ennemi.centrex)-(.x1+.direction*.centrex))^2+((ennemi.y1+ennemi.centrey)-(.y1+.centrey))^2
					end
			     --/!\ pour que le recalcul du point d'arrivé ne soit fait que toutes les 'isoldat[numero].cpt'
			     	if mathabs((pointcentralx)-(instance1.x))+mathabs((pointcentraly)-(instance1.y))<45 then
			     		pointcentralx=pointcentralx+2*(pointcentralx-instance1.x) -- +(pointcentralx-(isoldat[numero].x1+isoldat[numero].direction*isoldat[numero].centrex))
			     		pointcentraly=pointcentraly+2*(pointcentraly-instance1.y) -- +(pointcentraly-isoldat[numero].y1-isoldat[numero].centrey)

			     		--pointcentralx=pointcentralx+(pointcentralx-(isoldat[numero].x1+isoldat[numero].direction*isoldat[numero].centrex)) -- old
			     		--pointcentraly=pointcentraly+(pointcentraly-isoldat[numero].y1-isoldat[numero].centrey) -- old
			     		if issimulator and false then
							local lecercle=display.newCircle(group[2048],isoldat[numero].x1,isoldat[numero].y1,15)
							lecercle:setFillColor(0,0,1)
							local function letimercercle(event)
								event.source.lecercle:removeSelf()
								event.source.lecercle=nil
							end
							local lecercledata=timer.performWithDelay(500,letimercercle)
							lecercledata.lecercle=lecercle
						end
			     		print("amelioration de direction, correction de bug de freeze dirige vers l'ennemi")
			     	end
			     	if isoldat[isoldat[numero].ennemi].ennemi~=numero then
			     		-- local supp=1
			     		-- if mathrandom(2)==1 then
			     		-- 	supp=-1
			     		-- end
			     		-- local randomvalue=mathrandom(5)
			     		-- pointcentralx=pointcentralx+(5+randomvalue)*supp
			     		-- supp=1
			     		-- if mathrandom(2)==1 then
			     		-- 	supp=-1
			     		-- end
			     		-- local randomvalue=mathrandom(5)
			     		-- pointcentraly=pointcentraly+(5+randomvalue)*supp
			     		pointcentralx=pointcentralx+mathrandom(20)-10
			     		pointcentraly=pointcentraly+mathrandom(20)-10
			     	end
			     	local autorisetestbeta=false
			     	local lancementdutest=false
			     	if obstaclsold~=nil then
				     	if obstaclsold.nb>0 then
				     		lancementdutest=true
				     	end
				    end
				    if obstaclegene~=nil and genenum==numero then
				    	if obstaclegene.nb>0 then
				    		lancementdutest=true
				    	end
			     	end
			     	if lancementdutest then
			     		print("lancement du test de recherche soldat 1")
						autorisetestbeta=obstaclsoldtest(numero,instance1,pointcentralx,pointcentraly,false)
						--print("rediriger")
						if autorisetestbeta then
							--print("pas va vers le gentil")
						end
					end
			     	isoldat[numero].redirigecpt=true
			     	if instance1.supression==0 then -- autorisetestbeta==false then
			     		instance1.supression=1
			     		if isoldat[numero].vivant==true then
			     			--print("va vers le gentil "..numero.." "..isoldat[numero].typesoldat.." distance de "..calculdist)
			     			isoldat[numero].reut=true
	     					isoldat[numero].x3=pointcentralx
	     					isoldat[numero].y3=pointcentraly
							-- animdep1.animdep(isoldat[numero].x1,pointcentralx,isoldat[numero].y1,pointcentraly,numero)
						end
					end
				end
			end
			isoldat[numero].cpt=isoldat[numero].cpt+1 --0.5
		else  -- lorsque les deux soldats sont a coté
			--print("demande d'attaque")
			-- ci dessous : bonus de charge
			isoldat[numero].cptobj=nil
			if instance1.supression==0 then
				print("arriver a l'ennemi "..numero)
				instance1.supression=1
				attaque(numero,instance1)
			end 
		end
	else
		if instance1.supression==0 then
			
			if isoldat[isoldat[numero].ennemi].mine==false then
				print("correction de bug cptunadv>10 animdepbis 596")
				isoldat[numero].cptunadv=0
				instance1.supression=1
				isoldat[numero].encombat=0
				isoldat[numero].ennemi=0
				isoldat[numero].ennemipb=false
				isoldat[numero].nbennemi=0
				retouractnormale(numero)
			else
				print("pas de correction de bug cptunadv>10 car ennemi est la mine animdepbis 596")
			end
		end 
	end
end




function deplacement(numero,instance1)--deplacement et effet du personnage
	-- print("numero "..numero.." ennemi "..isoldat[numero].ennemi)
	--local chgroup
	local fpschoisicycle1=fpschoisicycle
	if fpschoisicycle1>=1 or (fpschoisi>1.3 and isoldat[numero].pole~=0) then
		isoldat[numero].ombre.isVisible=false
		-- print("ombre pas aff")
		if fpschoisicycle1==0 then
			fpschoisicycle1=1
		end
	end
	if fpschoisicycle1==2 or (fpschoisi>1.3 and isoldat[numero].pole~=0) then
		isoldat[numero].rectvie.alpha=0
		if isoldat[numero].orientation==0 and (savegameall.xpactive or isoldat[numero].gene==1) then
			isoldat[numero].rectxp.alpha=0
		end
		if fpschoisicycle1<2 then
			fpschoisicycle1=2
		end
	end
	-- if fpschoisi<1.5 then
	-- 	chgroup=0
	-- elseif fpschoisi<2 then
	-- 	chgroup=1
	-- 	isoldat[numero].ombre.isVisible=false
	-- else
	-- 	chgroup=2
	-- 	isoldat[numero].ombre.isVisible=false
	-- end
	--local zone1bis
	if instance1.absc==0 then
		if(isoldat[numero].x1>=instance1.x2 )then
			if( instance1.dir1==1 )then
				if instance1.x==nil then
					instance1.x=isoldat[numero].x1
				end
				instance1:translate(instance1.dirx*isoldat[numero].vitesse*mdmoyennechosi*(1+isoldat[numero].effetvern/(isoldat[numero].effetdure*2)),0)
				--instance1.x=instance1.x+instance1.dirx*isoldat[numero].vitesse*mdmoyennechosi*(1+isoldat[numero].effetvern/(isoldat[numero].effetdure*2)) --vitesse
				isoldat[numero].x1=instance1.x
				--isoldat[numero].zone1=mathfloor((instance1.x)/1229*5)
				--isoldat[numero].zone2=mathfloor((instance1.x+102)/1229*5)
				--print("zone1 "..isoldat[numero].zone1.." "..isoldat[numero].zone2)
				-- zone1bis=(instance1.x)/1229*4 --deux données en une
				-- --print("instance1.x"..instance1.x)
				-- --print("zone1bis"..zone1bis)
				-- isoldat[numero].zone1x=mathfloor(zone1bis*0.5)+1
				-- --print("zone1bis"..zone1bis.." isoldat[numero].zone1x "..isoldat[numero].zone1x)
				-- isoldat[numero].zone2x=mathfloor((zone1bis)*0.5+0.5)+1
				--print("zone1bis"..zone1bis)--.." "..((zone1bis)*0.5+0.5).." "..mathfloor((zone1bis)*0.5+0.5))
				--print("zone1 "..isoldat[numero].zone1x.." "..isoldat[numero].zone2x)
				-- if genenum==numero then
				-- 	geneb.x=instance1.x
				-- end
				if fpschoisicycle1==0 then
					if isoldat[numero].effetvern<isoldat[numero].effetdure*0.5 then
						isoldat[numero].effetvero=isoldat[numero].effetvero+isoldat[numero].effetimpact
						instance1:translate(0,isoldat[numero].effetimpact)
						-- instance1.y=instance1.y+isoldat[numero].effetimpact
						local scaletemp=isoldat[numero].ombre.xScale+isoldat[numero].effetimpact*0.15
						if scaletemp<0.005 and scaletemp>-0.005 then
							--print("scaletemp "..scaletemp.."effetvern"..isoldat[numero].effetvern.."effetvero "..isoldat[numero].effetvero .."numero"..numero.."isoldattype"..isoldat[numero].typesoldat)
							scaletemp=0.005
						end
						isoldat[numero].ombre.xScale=scaletemp --isoldat[numero].ombre.xScale+isoldat[numero].effetimpact/5
					else
						isoldat[numero].effetvero=isoldat[numero].effetvero-isoldat[numero].effetimpact
						instance1:translate(0,-isoldat[numero].effetimpact)
						--instance1.y=instance1.y-isoldat[numero].effetimpact
						local scaletemp=isoldat[numero].ombre.xScale-isoldat[numero].effetimpact*0.15
						if scaletemp<0.005 and scaletemp>-0.005 then
							--print("scaletemp "..scaletemp.."effetvern"..isoldat[numero].effetvern.."effetvero "..isoldat[numero].effetvero .."numero"..numero.."isoldattype"..isoldat[numero].typesoldat)
							scaletemp=0.005
						end
						isoldat[numero].ombre.xScale=scaletemp --isoldat[numero].ombre.xScale-isoldat[numero].effetimpact/5
					end
					isoldat[numero].effetvern=isoldat[numero].effetvern+1
					if isoldat[numero].effetvern==isoldat[numero].effetdure then
						isoldat[numero].effetvern=0
						isoldat[numero].ombre.xScale=isoldat[numero].tailleombre
					end
				end
				if fpschoisicycle1<2 then
					isoldat[numero].rectvie.x=instance1.x-5+isoldat[numero].direction*isoldat[numero].centrex
					if isoldat[numero].orientation==0 and (savegameall.xpactive or isoldat[numero].gene==1)  then
						isoldat[numero].rectxp.x=instance1.x-5+isoldat[numero].direction*isoldat[numero].centrex
					end
					if fpschoisicycle1<1 then
						isoldat[numero].ombre.x=instance1.x+isoldat[numero].direction*isoldat[numero].centrex
						if goh then
							isoldat[numero].ombre.y=instance1.y+isoldat[numero].centrey
						else
			 				isoldat[numero].ombre.y=instance1.y+10+isoldat[numero].centrey
			 			end
			 		end
			 	end
			else
				instance1.absc=1
			end
		else
			if(instance1.dir1==2 )then
				if instance1.x==nil then
					instance1.x=isoldat[numero].x1
				end
				instance1:translate(instance1.dirx*isoldat[numero].vitesse*mdmoyennechosi*(1+isoldat[numero].effetvern/(isoldat[numero].effetdure*2)),0)
				--instance1.x=instance1.x+instance1.dirx*isoldat[numero].vitesse*mdmoyennechosi*(1+isoldat[numero].effetvern/(isoldat[numero].effetdure*2))--vitesse
				isoldat[numero].x1=instance1.x
				--postion
				-- zone1bis=(instance1.x)/1229*4 --deux données en une
				-- isoldat[numero].zone1x=mathfloor(zone1bis*0.5)+1
				-- isoldat[numero].zone2x=mathfloor((zone1bis)*0.5+0.5)+1
				--print("zone1 "..isoldat[numero].zone1x.." "..isoldat[numero].zone2x)
				--print("zone1 "..isoldat[numero].zone1.." "..isoldat[numero].zone2)
				-- if genenum==numero then
				-- 	geneb.x=instance1.x
				-- end
				--test d'un effet pour eviter que les perso soient trop statique pd les mouvement
				if fpschoisicycle1==0 then
					-- print("effetver")
					if isoldat[numero].effetvern<isoldat[numero].effetdure*0.5 then
						isoldat[numero].effetvero=isoldat[numero].effetvero+isoldat[numero].effetimpact
						instance1:translate(0,isoldat[numero].effetimpact)
						--instance1.y=instance1.y+isoldat[numero].effetimpact
						local scaletemp=isoldat[numero].ombre.xScale+isoldat[numero].effetimpact*0.15
						if scaletemp<0.005 and scaletemp>-0.005 then
							--print("scaletemp "..scaletemp.."effetvern"..isoldat[numero].effetvern.."effetvero "..isoldat[numero].effetvero .."numero"..numero.."isoldattype"..isoldat[numero].typesoldat)
							scaletemp=0.005
						end
						isoldat[numero].ombre.xScale=scaletemp --isoldat[numero].ombre.xScale+isoldat[numero].effetimpact/5
					else
						isoldat[numero].effetvero=isoldat[numero].effetvero-isoldat[numero].effetimpact
						local scaletemp=isoldat[numero].ombre.xScale-isoldat[numero].effetimpact*0.15
						if scaletemp<0.005 and scaletemp>-0.005 then
							--print("scaletemp "..scaletemp.."effetvern"..isoldat[numero].effetvern.."effetvero "..isoldat[numero].effetvero .."numero"..numero.."isoldattype"..isoldat[numero].typesoldat)
							scaletemp=0.005
						end
						isoldat[numero].ombre.xScale=scaletemp --isoldat[numero].ombre.xScale-isoldat[numero].effetimpact/5
						instance1:translate(0,-isoldat[numero].effetimpact)
						--instance1.y=instance1.y-isoldat[numero].effetimpact
					end
					isoldat[numero].effetvern=isoldat[numero].effetvern+1
					if isoldat[numero].effetvern==isoldat[numero].effetdure then
						isoldat[numero].effetvern=0
						isoldat[numero].ombre.xScale=isoldat[numero].tailleombre
					end
				end
				if fpschoisicycle1<2 then
					isoldat[numero].rectvie.x=instance1.x-5+isoldat[numero].direction*isoldat[numero].centrex
					if isoldat[numero].orientation==0 and (savegameall.xpactive or isoldat[numero].gene==1)  then
						isoldat[numero].rectxp.x=instance1.x-5+isoldat[numero].direction*isoldat[numero].centrex
					end
					if fpschoisicycle1<1 then
						isoldat[numero].ombre.x=instance1.x+isoldat[numero].direction*isoldat[numero].centrex
						if goh then
							isoldat[numero].ombre.y=instance1.y+isoldat[numero].centrey
						else
			 				isoldat[numero].ombre.y=instance1.y+10+isoldat[numero].centrey
			 			end

			 		end
			 	end
			else
				instance1.absc=1
				--instance1:pause( )
			end
		end
		if 5>(isoldat[numero].x1-instance1.x2) and -5<(isoldat[numero].x1-instance1.x2) then-- verifier si ca empeche pas de fonctionner
			instance1.absc=1
		end
	end
	--local y1=mathfloor(instance1.y)
	if instance1.ordo==0 then
		if(isoldat[numero].y1>=instance1.y2)then
			if(instance1.dir2==1 )then
				-- if fpschoisicycle1<2 then
					
				-- end
				if instance1.y==nil then
					instance1.y=isoldat[numero].y1
				end
				instance1:translate(0,instance1.diro*isoldat[numero].vitesse*mdmoyennechosi*(1+isoldat[numero].effetvern/(isoldat[numero].effetdure*2)))
				-- instance1.y=instance1.y+instance1.diro*isoldat[numero].vitesse*mdmoyennechosi*(1+isoldat[numero].effetvern/(isoldat[numero].effetdure*2))--vitesse
				isoldat[numero].y1=instance1.y-isoldat[numero].effetvero
				-- isoldat[numero].zone1y=mathfloor((instance1.y)/615*5)
				-- isoldat[numero].zone2y=mathfloor((instance1.y+51)/615*5)
				-- zone1bis=(instance1.y)/619*4 --deux données en une
				-- isoldat[numero].zone1y=mathfloor(zone1bis*0.5)+2
				-- isoldat[numero].zone2y=mathfloor((zone1bis)*0.5+0.5)+2
				--print("zone1 "..isoldat[numero].zone1.." "..isoldat[numero].zone2)
				if fpschoisicycle1<2 then
					group[isoldat[numero].numgroup]:remove( instance1 )
					group[isoldat[numero].numgroup]:remove( isoldat[numero].rectvie )
					if isoldat[numero].orientation==0 and (savegameall.xpactive or isoldat[numero].gene==1)  then
						group[isoldat[numero].numgroup]:remove( isoldat[numero].rectxp )
					end	
					-- if goh then
					-- 	isoldat[numero].numgroup=mathfloor(isoldat[numero].y1)+1024
					-- else
						isoldat[numero].numgroup=mathfloor(isoldat[numero].y1+isoldat[numero].centrey)+1024
					--end
					if goh then
						isoldat[numero].rectvie.y=isoldat[numero].y1-isoldat[numero].height-2
					else
						isoldat[numero].rectvie.y=isoldat[numero].y1-10-isoldat[numero].centrey -- *0.5
					end
					if isoldat[numero].orientation==0 and (savegameall.xpactive or isoldat[numero].gene==1)  then
						if goh then
							isoldat[numero].rectxp.y=isoldat[numero].rectvie.y+2
						else
							isoldat[numero].rectxp.y=isoldat[numero].y1-8-isoldat[numero].centrey -- *0.5
						end
					end
					if fpschoisicycle1<1 then
						if goh then
							isoldat[numero].ombre.y=instance1.y+isoldat[numero].centrey
						else
							isoldat[numero].ombre.y=instance1.y+10+isoldat[numero].centrey
						end
					end		
					if isoldat[numero].numgroup==nil then
						print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
						print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
						print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
						print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
						print("animdepbis 804")
					elseif isoldat[numero].numgroup<1 or isoldat[numero].numgroup>2048 then
						print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
						print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
						print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
						print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
						print("animdepbis 810")
					end
					if instance1==nil then
						print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
						print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
						print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
						print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
						print("animdepbis 845")
					else
						group[isoldat[numero].numgroup]:insert( instance1 )
					end
					group[isoldat[numero].numgroup]:insert( isoldat[numero].rectvie)
					if isoldat[numero].orientation==0 and (savegameall.xpactive or isoldat[numero].gene==1)  then
						group[isoldat[numero].numgroup]:insert( isoldat[numero].rectxp)
					end
				end
				-- if genenum==numero then
				-- 	geneb.y=instance1.y
				-- end
				-- if fpschoisicycle1<2 then
					
				-- end
			 else
				instance1.ordo=1
			end
		 else
			if(instance1.dir2==2 )then
				--background:remove( instance1 )
				-- if fpschoisicycle1<2 then
					
				-- end
				if instance1.y==nil then
					instance1.y=isoldat[numero].y1
				end
				instance1:translate(0,instance1.diro*isoldat[numero].vitesse*mdmoyennechosi*(1+isoldat[numero].effetvern/(isoldat[numero].effetdure*2)))
				--instance1.y=instance1.y+instance1.diro*isoldat[numero].vitesse*mdmoyennechosi*(1+isoldat[numero].effetvern/(isoldat[numero].effetdure*2))--vitesse
				--print("effetvero"..isoldat[numero].effetvero)
				-- zone1bis=(instance1.y)/619*4 --deux données en une
				-- isoldat[numero].zone1y=mathfloor(zone1bis*0.5)+2
				-- isoldat[numero].zone2y=mathfloor((zone1bis)*0.5+0.5)+2
				--print("ici1")
				isoldat[numero].y1=instance1.y-isoldat[numero].effetvero
				if fpschoisicycle1<2 then
					group[isoldat[numero].numgroup]:remove( instance1 )
					group[isoldat[numero].numgroup]:remove( isoldat[numero].rectvie )
					if isoldat[numero].orientation==0 and (savegameall.xpactive or isoldat[numero].gene==1)  then
						group[isoldat[numero].numgroup]:remove( isoldat[numero].rectxp )
					end
					-- if goh then
					-- 	isoldat[numero].numgroup=mathfloor(isoldat[numero].y1)+1024
					-- else
						isoldat[numero].numgroup=mathfloor(isoldat[numero].y1+isoldat[numero].centrey)+1024
					--end
					if goh then
						isoldat[numero].rectvie.y=isoldat[numero].y1-2-isoldat[numero].height
					else
						isoldat[numero].rectvie.y=isoldat[numero].y1-10-isoldat[numero].centrey
					end
					if isoldat[numero].orientation==0 and (savegameall.xpactive or isoldat[numero].gene==1)  then
						if goh then
							isoldat[numero].rectxp.y=isoldat[numero].rectvie.y+2
						else
							isoldat[numero].rectxp.y=isoldat[numero].y1-8-isoldat[numero].centrey -- *0.5
						end
					end
					if fpschoisicycle1<1 then
						if goh then
							isoldat[numero].ombre.y=instance1.y+isoldat[numero].centrey
						else
							isoldat[numero].ombre.y=instance1.y+10+isoldat[numero].centrey
						end
					end
					if isoldat[numero].numgroup==nil then
						print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
						print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
						print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
						print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
						print("animdepbis 849")
						isoldat[numero].numgroup=1024
					elseif isoldat[numero].numgroup<1 or isoldat[numero].numgroup>2048 then
						print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
						print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
						print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
						print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
						print("animdepbis 855")
						isoldat[numero].numgroup=1024
					end
					--print("isoldat[numero].numgroup "..isoldat[numero].numgroup.." isoldat[numero].y1 "..isoldat[numero].y1.." isoldat[numero].effetvero "..isoldat[numero].effetvero.." instance1.y "..instance1.y.." instance1.diro "..instance1.diro.." isoldat[numero].vitesse "..isoldat[numero].vitesse.." isoldat[numero].effetvern "..isoldat[numero].effetvern.." isoldat[numero].effetdure "..isoldat[numero].effetdure.." mdmoyennechosi "..mdmoyennechosi)
					if instance1==nil then
						print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
						print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
						print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
						print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
						print("animdepbis 904")
					else
						group[isoldat[numero].numgroup]:insert(instance1)
					end
					group[isoldat[numero].numgroup]:insert(isoldat[numero].rectvie)
					if isoldat[numero].orientation==0 and (savegameall.xpactive or isoldat[numero].gene==1)  then
						group[isoldat[numero].numgroup]:insert(isoldat[numero].rectxp)
					end
				end
				-- if genenum==numero then
				-- 	geneb.y=instance1.y
				-- end
				-- if fpschoisicycle1<2 then
					
				-- end
			 else
				instance1.ordo=1
			end
		end
		if 5>isoldat[numero].y1-instance1.y2 and -5<isoldat[numero].y1-instance1.y2 then-- verifier si ca empeche pas de fonctionner
			instance1.ordo=1
		end
	end
	if fpschoisicycle1==0 then
		isoldat[numero].ombre.isVisible=true
	end
	--if instance1.absc==0 or instance1.ordo==0 then
		-- isoldat[numero].zone1=isoldat[numero].zone1y*3+isoldat[numero].zone1x
		-- isoldat[numero].zone2=isoldat[numero].zone2y*3+isoldat[numero].zone2x
		--print("isoldat[numero].zone1 "..isoldat[numero].zone1.." "..isoldat[numero].zone2.." "..isoldat[numero].zone1y.." "..isoldat[numero].zone2y.." "..isoldat[numero].zone1x.." "..isoldat[numero].zone2x)
	--end
	if isoldat[numero].typesoldat==179 and (instance1.absc==0 or instance1.ordo==0) and fpschoisicycle1<1 then
		affbrouillardglob(numero,instance1.x+isoldat[numero].centrex*isoldat[numero].direction,instance1.y+isoldat[numero].centrey*1.05,isoldat[numero].numgroup)
	end
end

--calcul d'angle pour la detection d'ennemi
function calcangle(numero,j)
	local pointax=nil
	local pointay=nil
	local pointbx=nil
	local pointby=nil
	local pointcx=nil
	local pointcy=nil
	if isoldat[j].ennemi==0 then
		if isoldat[numero].orientation==0 then
			pointax=isoldat[numero].x1
			pointay=isoldat[numero].y1
			pointbx=isoldat[j].x1
			pointby=isoldat[j].y1 --bug avec point du chemin qui existe pas. Mettre dans le cas ou il existe pas le meme point que l'objectif en prenant le dernier en ajoutant le vecteur direction de la distance precedente
			if cheminnb<isoldat[j].point+1 then
				pointcx=chemin[isoldat[j].point].x+isoldat[j].xposi+10
				pointcy=chemin[isoldat[j].point].y+isoldat[j].yposi+10+isoldat[numero].pole
			elseif mathabs(isoldat[j].x1-chemin[isoldat[j].point+1].x)+mathabs(isoldat[j].y1-isoldat[numero].pole-chemin[isoldat[j].point+1].y)>15 or cheminnb<isoldat[j].point+2 then
				pointcx=chemin[isoldat[j].point+1].x+isoldat[j].xposi--isoldat[j].x2
				pointcy=chemin[isoldat[j].point+1].y+isoldat[j].yposi+isoldat[numero].pole--isoldat[j].y2
			else
				pointcx=chemin[isoldat[j].point+2].x+isoldat[j].xposi--isoldat[j].x2
				pointcy=chemin[isoldat[j].point+2].y+isoldat[j].yposi+isoldat[numero].pole--isoldat[j].y2
			end
		else
			pointax=isoldat[j].x1
			pointay=isoldat[j].y1
			pointbx=isoldat[numero].x1
			pointby=isoldat[numero].y1
			if cheminnb<isoldat[numero].point+1 then
				pointcx=chemin[isoldat[numero].point].x+isoldat[numero].xposi+10 --isoldat[numero].x2
				pointcy=chemin[isoldat[numero].point].y+isoldat[numero].yposi+10+isoldat[numero].pole--isoldat[numero].y2
			elseif mathabs(isoldat[numero].x1-chemin[isoldat[numero].point+1].x)+mathabs(isoldat[numero].y1-chemin[isoldat[numero].point+1].y-isoldat[numero].pole)>15 or cheminnb<isoldat[numero].point+2 then
				pointcx=chemin[isoldat[numero].point+1].x+isoldat[numero].xposi --isoldat[numero].x2
				pointcy=chemin[isoldat[numero].point+1].y+isoldat[numero].yposi+isoldat[numero].pole--isoldat[numero].y2
			else
				pointcx=chemin[isoldat[numero].point+2].x+isoldat[numero].xposi--isoldat[numero].x2
				pointcy=chemin[isoldat[numero].point+2].y+isoldat[numero].yposi+isoldat[numero].pole--isoldat[numero].y2
			end
		end
	else
		if isoldat[numero].orientation==0 then
			pointax=isoldat[numero].x1
			pointay=isoldat[numero].y1
			pointbx=isoldat[j].x1
			pointby=isoldat[j].y1
			pointcx=isoldat[isoldat[j].ennemi].x1--isoldat[j].x2
			pointcy=isoldat[isoldat[j].ennemi].y1--isoldat[j].y2--
		else
			pointax=isoldat[j].x1
			pointay=isoldat[j].y1
			pointbx=isoldat[numero].x1
			pointby=isoldat[numero].y1
			if cheminnb<isoldat[numero].point+1 then
				pointcx=chemin[isoldat[numero].point].x+isoldat[numero].xposi+10--isoldat[numero].x2
				pointcy=chemin[isoldat[numero].point].y+isoldat[numero].yposi+10+isoldat[numero].pole
			elseif mathabs(isoldat[numero].x1-chemin[isoldat[numero].point+1].x)+mathabs(isoldat[numero].y1-chemin[isoldat[numero].point+1].y-isoldat[numero].pole)>15 or cheminnb<isoldat[numero].point+2 then
				pointcx=chemin[isoldat[numero].point+1].x+isoldat[numero].xposi--isoldat[numero].x2
				pointcy=chemin[isoldat[numero].point+1].y+isoldat[numero].yposi+isoldat[numero].pole--isoldat[numero].y2
			else
				pointcx=chemin[isoldat[numero].point+2].x+isoldat[numero].xposi--isoldat[numero].x2
				pointcy=chemin[isoldat[numero].point+2].y+isoldat[numero].yposi+isoldat[numero].pole--isoldat[numero].y2
			end
		end
	end
	local vectx=pointbx-pointax--pos si chem<-sol
	local vecty=pointby-pointay--pos si v
	local vect2x=pointcx-pointbx--pos si solnum<-sol
	local vect2y=pointcy-pointby--pos si v
	local scal1=vectx*vect2x+vecty*vect2y
	local norme=mathsqrt((pointbx-pointax)^2+(pointby-pointay)^2)*mathsqrt((pointcx-pointbx)^2+(pointcy-pointby)^2)
	local anglereche=math.acos(scal1/norme)
	local result=0
	if anglereche>=2.355 then
		result=1 --0 si  >135° ou pas autoriser ,1 si <45°, 2 si <90° et >45°,3 si >90° et <135°
	elseif anglereche>=1.57 then
		result=2
	elseif anglereche>=0.785 then
		result=3
	else
		result=4
	end

	if anglereche<1.82 then
		if (isoldat[j].orientation==0 and isoldat[j].ennemi~=0) or isoldat[j].orientation==1 then
		if anglereche>=1.57 then
			if isoldat[numero].orientation==0 and isoldat[numero].vitesse>isoldat[j].vitesse or isoldat[numero].orientation==1 and isoldat[numero].vitesse<isoldat[j].vitesse then
			else
				result=0
			end
		elseif anglereche>=0.785 then
			if isoldat[numero].orientation==0 then
				if isoldat[numero].vitesse<2*isoldat[j].vitesse then
					result=0
				end
			else
				if isoldat[numero].vitesse*2>isoldat[j].vitesse then
					result=0
				end
			end
		else
			if isoldat[numero].orientation==0 then
				if isoldat[numero].vitesse<4*isoldat[j].vitesse then
					result=0
				end
			else
				if isoldat[numero].vitesse*4>isoldat[j].vitesse then
					result=0
				end
			end 
		end
		else
			result=0
		end
	end
	return(result)
end

-- detection distance batiment
local function detectiondistbat(calcul,numero,j)
	local distbat=0
	if calcul>=1000 then--si ennemi en dehors du cercle mais pas trop loin
		local porte
		local lexporte
		local leyporte
		if isoldat[j].classe<4 then
			porte=ibatiment[isoldat[j].numbat].porte
			lexporte=ibatiment[isoldat[j].numbat].x1+ibatiment[isoldat[j].numbat].xbase
			leyporte=ibatiment[isoldat[j].numbat].y1+ibatiment[isoldat[j].numbat].ybase
		else
			porte=10000
			if isoldat[j].classe<7 then
				--print("renfort detection")
				distbat=1
			else
				lexporte=genepoint.x
				leyporte=genepoint.y
			end
		end
		if lexporte==nil or leyporte==nil then
			lexporte=-1000
			leyporte=-1000
		end
		if distbat==0 then
			calcul1=(lexporte-isoldat[numero].x1)*(lexporte-isoldat[numero].x1)+(1.25*(leyporte-isoldat[numero].y1))*(1.25*(leyporte-isoldat[numero].y1))
			if calcul1<=porte then
				distbat=1
			elseif calcul1*0.9<=porte and calcul<3000 then
				distbat=1
			elseif calcul1*0.8<=porte and calcul<1500 then
				distbat=1
			elseif calcul1*0.75<=porte and calcul<1000 then
				distbat=1
			end
		end
	else
		distbat=1  
	end
	return distbat
end

--permet la recherche d'un adversaire
function detection(numero)
	isoldat[numero].cpt1=0
	if isoldat[numero].cpt2<3 then
		isoldat[numero].cpt2=isoldat[numero].cpt2+1
	else
		isoldat[numero].cpt2=0
	end
	local ennemipot=0
	local ennemipotangle=0--0 si  >135° ou pas autoriser ,1 si <45°, 2 si <90° et >45°,3 si >90° et <135°
	local ennemipotdist=nil
	local enneminombre=0
	local ennemipottestexact=0
	local ennemidernierdist=0
	local ennemiderniernum=0
	local mini=1
	local maxi=nbsoldat
	if isoldat[numero].orientation==1 then
		mini=nbsoldatg
		maxi=0
	end	
	for j=mini,maxi,1 do	
	--while j<=nbsoldat do
		if isoldat[j].ennemipb and isoldat[j].ennemi==numero then
			local calcul=(isoldat[j].x1-isoldat[numero].x1)*(isoldat[j].x1-isoldat[numero].x1)+(isoldat[j].y1-isoldat[numero].y1)*(isoldat[j].y1-isoldat[numero].y1)
			local distbat=detectiondistbat(calcul,j,numero)
			if distbat==1 then
				ennemipot=j
				ennemipotdist=calcul
				ennemipotangle=1--result
				enneminombre=isoldat[j].nbennemi
				ennemipottestexact=2
				isoldat[j].ennemipb=false
				--print("\nsoldat qui va vers l'ennemi qui etait avant endehors du cercle\n")
			end
		else
			if isoldat[numero].zone1==isoldat[j].zone1 or isoldat[numero].zone2==isoldat[j].zone2 or isoldat[numero].zone3==isoldat[j].zone3 or isoldat[numero].zone4==isoldat[j].zone4 then
				if isoldat[j].vivant==true then --and isoldat[j].orientation~=isoldat[numero].orientation then
					-- print("pole"..isoldat[numero].pole)
					if isoldat[j].pole==isoldat[numero].pole and ((isoldat[numero].orientation==1 and (isoldat[j].ennemi~=0 or isoldat[j].tir~=0)) or isoldat[numero].orientation==0) then
						-- if isoldat[numero].gene==1 then
						-- 	print("je suis le general"..numero)
						-- end
						local agres=isoldat[numero].agressivite
						local testexact=0
						if isoldat[numero].orientation==0 then
							--agres=20
							testexact=2
						end
						if isoldat[numero].orientation==1 then
							if isoldat[j].nbennemi==1 and isoldat[j].ennemi~=0 then
								if  isoldat[isoldat[j].ennemi].ennemi~=j then --and isoldat[j].encombat==0 
									testexact=1
								end
							end
							if isoldat[j].nbennemi+1-isoldat[j].blocnbennemi <isoldat[numero].agressivite then
								testexact=2
							end
							-- ici modif
							if isoldat[j].mine==true then
								testexact=1
							end
							if isoldat[j].numbat~=0 and isoldat[j].classe<=3 then
								if ibatiment[isoldat[j].numbat].supprimer==1 then
									testexact=0
								end
							end
							if isoldat[j].vie==0 then
								testexact=0
							end
						end
						--print("\n\n\nici la famille animdepbis 1559 "..isoldat[numero].orientation.." numero= "..numero.." testexact "..testexact)
						if testexact~=0 then --isoldat[j].nbennemi+1-isoldat[j].blocnbennemi < agres then  	

							-- if isoldat[numero].zone1==isoldat[j].zone1 or isoldat[numero].zone2==isoldat[j].zone2 or isoldat[numero].zone3==isoldat[j].zone3 or isoldat[numero].zone4==isoldat[j].zone4 then
							local calcul=(isoldat[j].x1-isoldat[numero].x1)*(isoldat[j].x1-isoldat[numero].x1)+(isoldat[j].y1-isoldat[numero].y1)*(isoldat[j].y1-isoldat[numero].y1)
							
								--print("calcul "..calcul)
							
							--if calcul<160000 then
								-- if isoldat[numero].zone1==isoldat[j].zone1 or isoldat[numero].zone2==isoldat[j].zone2 then
								-- 	--print("dans la meme zone "..calcul)
								-- else
								-- 	if calcul<40000 then
								-- 	--	print("pas dans zone "..calcul)
								-- 	end
								-- end
								local distdetect=10000
								if isoldat[numero].vitesse>1.2 then
									distdetect=distdetect*isoldat[numero].vitesse
								end
								if isoldat[j].vitesse>1.2 and isoldat[j].ennemi==0 then --prendre en compte si il a un ennemi
									distdetect=distdetect*isoldat[j].vitesse
								end
								--print("calcul "..calcul.." distdetect*distancedetection="..(distdetect*distancedetection))
								if(distdetect*distancedetection>calcul) then 
									--print("ici la famille animdepbis 1583 "..isoldat[numero].orientation.." numero= "..numero.." distance coherante")
									local distbat=0 --le soldat est trop loin du batiment
									local calcul1=0
									if isoldat[numero].orientation==1 then 
										distbat=detectiondistbat(calcul,numero,j)
										-- if calcul>3000 then--si ennemi en dehors du cercle mais pas trop loin
										-- 	local porte
										-- 	local lexporte
										-- 	local leyporte
										-- 	if isoldat[j].classe<4 then
										-- 		porte=ibatiment[isoldat[j].numbat].porte
										-- 		lexporte=ibatiment[isoldat[j].numbat].x+ibatiment[isoldat[j].numbat].xbase
										-- 		leyporte=ibatiment[isoldat[j].numbat].y+ibatiment[isoldat[j].numbat].ybase
										-- 	else
										-- 		porte=10000
										-- 		if isoldat[j].classe<7 then
										-- 			--print("renfort detection")
										-- 			if pouvoir1action[isoldat[j].pouvoir]~=nil then
										-- 				if pouvoir1action[isoldat[j].pouvoir].x~=nil then
										-- 					lexporte=pouvoir1action[isoldat[j].pouvoir].x+isoldat[j].xposi
										-- 					leyporte=pouvoir1action[isoldat[j].pouvoir].y+isoldat[j].yposi
										-- 				end
										-- 			end
										-- 			if lexporte==nil then
										-- 				lexporte=isoldat[j].x1
										-- 				leyporte=isoldat[j].y1
										-- 			end
										-- 		else
										-- 			lexporte=genepoint.x
										-- 			leyporte=genepoint.y
										-- 		end
										-- 	end

										-- 	calcul1=(lexporte-isoldat[numero].x1)*(lexporte-isoldat[numero].x1)+(1.25*(leyporte-isoldat[numero].y1))*(1.25*(leyporte-isoldat[numero].y1))
										-- 	if calcul1<=porte then
										-- 		distbat=1
										-- 	end
										-- else
										-- 	distbat=1  
										-- end
									else
										distbat=detectiondistbat(calcul,j,numero)
										-- if calcul>3000 then
										-- 	local porte
										-- 	local lexporte
										-- 	local leyporte
										-- 	if isoldat[numero].classe<4 then
										-- 		porte=ibatiment[isoldat[numero].numbat].porte
										-- 		lexporte=ibatiment[isoldat[numero].numbat].x+ibatiment[isoldat[numero].numbat].xbase
										-- 		leyporte=ibatiment[isoldat[numero].numbat].y+ibatiment[isoldat[numero].numbat].ybase
										-- 	else
										-- 		porte=10000
										-- 		if isoldat[numero].classe<7 then
										-- 			--print("renfort lexporte")
										-- 			lexporte=pouvoir1action[isoldat[numero].pouvoir].x+isoldat[numero].xposi
										-- 			leyporte=pouvoir1action[isoldat[numero].pouvoir].y+isoldat[numero].yposi
										-- 		else
										-- 			lexporte=genepoint.x
										-- 			leyporte=genepoint.y
										-- 		end
										-- 	end
										-- 	calcul1=(lexporte-isoldat[j].x1)*(lexporte-isoldat[j].x1)+(1.25*(leyporte-isoldat[j].y1))*(1.25*(leyporte-isoldat[j].y1))
										-- 	if calcul1<=porte then
										-- 		distbat=1
										-- 	end
										--  else
										-- 	distbat=1
										-- end
									end
									--if distbat==1 then
										--print("ici la famille animdepbis 1654 "..isoldat[numero].orientation.." numero= "..numero)
										--zone a revoir
										if calcul<300 then
											--print("<300")
											if ennemipot~=0 then
												if calcul<ennemipotdist then
													ennemipot=j
													ennemipotdist=calcul
													ennemipotangle=1--result
													enneminombre=isoldat[j].nbennemi
													ennemipottestexact=testexact
												end
											else
												ennemipot=j
												ennemipotdist=calcul
												ennemipotangle=1--result
												enneminombre=isoldat[j].nbennemi
												ennemipottestexact=testexact
											end
										else
											if ennemipot~=0 then
												if distbat==1 then
													if testexact>ennemipottestexact then
														if isoldat[numero].orientation==0 and isoldat[j].ennemi~=0 then--isoldat[j].encombat==1 then
															ennemipot=j
															ennemipotdist=calcul
															ennemipotangle=4
															enneminombre=isoldat[j].nbennemi
															ennemipottestexact=testexact

														else
															local result=calcangle(numero,j)
															if result~=0 then
																ennemipot=j
																ennemipotangle=result
																ennemipotdist=calcul
																enneminombre=isoldat[j].nbennemi
																ennemipottestexact=testexact
															end
														end
													else
														local result=calcangle(numero,j)
														if result~=0 then
															if result<ennemipotangle then
																ennemipot=j
																ennemipotangle=result
																ennemipotdist=calcul
																enneminombre=isoldat[j].nbennemi
																ennemipottestexact=testexact
															elseif result==ennemipotangle then
																if calcul<ennemipotdist and enneminombre>isoldat[j].nbennemi then
																	ennemipot=j
																	ennemipotdist=calcul
																	ennemipotangle=result
																	enneminombre=isoldat[j].nbennemi
																	ennemipottestexact=testexact
																end
															end
														end
													end
												end
											else
												if isoldat[numero].orientation==0 and isoldat[j].ennemi~=0 then--isoldat[j].encombat==1 then
													if distbat==0 then
														if (ennemidernierdist==0 or ennemidernierdist>calcul) then
															ennemiderniernum=j
															ennemiderniercas=calcul
														end
													else
														ennemipot=j
														ennemipotdist=calcul
														ennemipotangle=4
														enneminombre=isoldat[j].nbennemi
														ennemipottestexact=testexact
													end
												else
													local result=calcangle(numero,j)
													if result~=0 then
														if distbat==0 then
															if (ennemidernierdist==0 or ennemidernierdist>calcul) then
																ennemiderniernum=j
																ennemiderniercas=calcul
															end
														else
															ennemipot=j
															ennemipotangle=result
															ennemipotdist=calcul
															enneminombre=isoldat[j].nbennemi
															ennemipottestexact=testexact
														end
													elseif (isoldat[j].mine==true and isoldat[j].pole==isoldat[numero].pole) or ((isoldat[numero].orientation==0 and isoldat[numero].classe==2 and isoldat[j].vitesse+0.5<=isoldat[numero].vitesse) or (isoldat[j].orientation==0 and isoldat[j].classe==2 and isoldat[numero].vitesse+0.5<=isoldat[j].vitesse))then -- es ce que ca corrige le pb des soldats qui font demi tour?
														if distbat==0 then
															if (ennemidernierdist==0 or ennemidernierdist>calcul) then
																ennemiderniernum=j
																ennemiderniercas=calcul
															end
														else
															ennemipot=j
															ennemipotangle=result
															ennemipotdist=calcul
															enneminombre=isoldat[j].nbennemi
															ennemipottestexact=testexact
														end
													end
												end
											end
										end
									--else
										-- print("ici la famille animdepbis 1733 "..isoldat[numero].orientation.." numero= "..numero)
										-- if isoldat[numero].orientation==1 and (ennemidernierdist==0 or ennemidernierdist>calcul) and ennemipotdist==nil then
										-- 	--ennemipot=j
										-- 	--ennemipotdist=calcul
										-- 	--ennemipotangle=1--result
										-- 	--enneminombre=isoldat[j].nbennemi
										-- 	--ennemipottestexact=testexact
										-- 	ennemiderniernum=j
										-- 	ennemiderniercas=calcul
										-- end
									--end
								end	
							--end
							end
						--end
					end
				end
			end
		end
	end
	local numero1=numero
	if ennemipot==0 and ennemiderniernum~=0 then
		if isoldat[numero].orientation==1 then
			ennemipot=ennemiderniernum
			print("\n\n ennemi aider 1\n\n")
		else
			if isoldat[ennemiderniernum].ennemi==0 then
				if issimulator and false then
					local lecercle=display.newCircle(group[2048],isoldat[numero].x1,isoldat[numero].y1,5)
					if isoldat[numero].orientation==1 then
						lecercle:setFillColor(1,0,0)
					else
						lecercle:setFillColor(0,1,0)
					end
					local function letimercercle(event)
						event.source.lecercle:removeSelf()
						event.source.lecercle=nil
					end
					local lecercledata=timer.performWithDelay(500,letimercercle)
					lecercledata.lecercle=lecercle
				end
				ennemipot=ennemiderniernum
				--numero1=numero
				numero1=ennemipot
				ennemipot=numero
				ennemiderniernum=numero
				print("\n\n ennemi aider 2\n\n")
			else
				ennemiderniernum=0
			end
		end
	else
		ennemiderniernum=0
	end
	if ennemipot~=0 then
		--print("numero1 "..numero1.." numero "..numero)
		if issimulator and false then
			local lecercle=display.newCircle(group[2048],isoldat[numero1].x1,isoldat[numero1].y1,10)
			if isoldat[numero1].orientation==1 then
				lecercle:setFillColor(1,0,0)
			else
				lecercle:setFillColor(0,1,0)
			end
			local function letimercercle(event)
				event.source.lecercle:removeSelf()
				event.source.lecercle=nil
			end
			local lecercledata=timer.performWithDelay(500,letimercercle)
			lecercledata.lecercle=lecercle
		end
		isoldat[numero1].ennemi=ennemipot
		-- print("zone1"..isoldat[numero].zone1.." "..isoldat[ennemipot].zone1.." zone2 "..isoldat[numero].zone2.." "..isoldat[ennemipot].zone2)
		-- if isoldat[numero].zone1==isoldat[ennemipot].zone1 or isoldat[numero].zone2==isoldat[ennemipot].zone2 then
		-- else
		-- 		--print("numero.zone1 "..isoldat[numero].zone1.." "..isoldat[numero].zone2.." y "..isoldat[numero].zone1y.." "..isoldat[numero].zone2y.." x "..isoldat[numero].zone1x.." "..isoldat[numero].zone2x)
		-- 		print("ennemipot.zone1 "..isoldat[ennemipot].zone1.." "..isoldat[ennemipot].zone2.." y "..isoldat[ennemipot].zone1y.." "..isoldat[ennemipot].zone2y.." x "..isoldat[ennemipot].zone1x.." "..isoldat[ennemipot].zone2x)
		-- end
		isoldat[numero1].cpt=20
		if isoldat[numero1].cptobj~=nil then
			isoldat[numero1].cpt=isoldat[numero1].cptobj
		end
		isoldat[numero1].nbennemi=1
		if isoldat[ennemipot].ennemi==0 and isoldat[ennemipot].nbennemi==0 then
			if ennemiderniernum==0 then
				isoldat[ennemipot].ennemi=numero
				isoldat[numero1].ennemipb=false
			else
				isoldat[numero1].ennemipb=true
			end
			isoldat[ennemipot].nbennemi=1
		else
			isoldat[ennemipot].nbennemi=isoldat[ennemipot].nbennemi+1
		end
		-- if isoldat[numero].zone1~=isoldat[ennemipot].zone1 and isoldat[numero].zone2~=isoldat[ennemipot].zone2 then -- si pas d'erreur a jouter a la detection pour gagner du temps!!!!!!!!!!!!!!!!!!!!!!!
		-- 	print("Zone pas assez tolerante, detection avec succes numero "..numero.." ennemipot "..ennemipot.." zone1 "..isoldat[numero].zone1.." zone2 "..isoldat[numero].zone2.." ennemipot zone1 "..isoldat[ennemipot].zone1.." zone2 "..isoldat[ennemipot].zone2.."\n\n\n\n\n\n")
		-- 	display.newText("Error report probleme de zone",contentcenterx,contentcentery,fonttype,48)
		-- end
	end
	--print("numero.ennemi "..isoldat[numero].ennemi.." numero1 "..isoldat[numero1].ennemi)
end




function regenerationvie(numero,viearegen)--regeneration des vies des unités
	if isoldat[numero].vie>0 and isoldat[numero].vivant then
		if isoldat[numero].vie<isoldat[numero].vietotale then
			if viearegen==nil then
				viearegen=isoldat[numero].regenevie
				if viearegen==nil then
					viearegen=1
				end
			end
			isoldat[numero].vie=isoldat[numero].vie+viearegen*fpschoisi
			if isoldat[numero].vie>isoldat[numero].vietotale then
				isoldat[numero].vie=isoldat[numero].vietotale
			end
			isoldat[numero].rectvie.width=mathfloor(isoldat[numero].vie/isoldat[numero].vietotale*20)
			isoldat[numero].rectvie.alpha=1
			isoldat[numero].rectvie:setFillColor(1-isoldat[numero].vie/isoldat[numero].vietotale,isoldat[numero].vie/isoldat[numero].vietotale,0 )	
			--print( isoldat[numero].vie )
			if affinfotab.num==numero and affinfotab.type==0 and affinfogr.isVisible then
				affinfo(numero,true,true)
			end
			if fpschoisicycle<1 then
				if mathrandom(3)==1 then
					regeneanim=display.newImage(effetexplo.regenevie,1)
					regeneanim:setFillColor(0,1,0)
					regeneanim.xScale=0.22
					regeneanim.yScale=regeneanim.xScale
					regeneanim.alpha=0.8
					regeneanim.x=isoldat[numero].x1+mathrandom(-2,2)*5
					if goh then
						regeneanim.y=isoldat[numero].y1-isoldat[numero].height
					else
						regeneanim.y=isoldat[numero].y1-2*isoldat[numero].centrey -- +mathrandom(-2,2)*4
					end
					regeneanim.group=mathfloor(regeneanim.y+1035)
					group[regeneanim.group]:insert(regeneanim)
					local latransition=transition.to(regeneanim,{time=400*vitessejeuin,alpha=0.1,y=regeneanim.y-10,onComplete=destructeurpartieltran,onCancel=destructeurpartieltran,tag="elementtype"})
					if jeupause.etat==1 then
						transition.pause(latransition)
					end
				end
				-- spritegestion(regeneanim)
			end
		else
		 	isoldat[numero].rectvie.alpha=0
		 	if  isoldat[numero].vie~=isoldat[numero].vietotale then
				isoldat[numero].vie=isoldat[numero].vietotale
				if affinfotab.num==numero and affinfotab.type==0 and affinfogr.isVisible then
					affinfo(numero,true,true)
				end
			end
		end
	else
		print("regenevie a un mort ("..numero..")")
	end
end
end
t.animdepbis = function()
local a=1
end
return t