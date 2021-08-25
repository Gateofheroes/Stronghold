local t={}--gestion des timing d'attaque de batiment
--local animdep1=require("animdepter")
if not functionload then
function attaquebatiment(numero)----------------------resoudre le probleme de l'orientation de la fleche et faire pour que la fleche ne se deplace pas en ligne droite
	--local pause1=require("pause")
	--atttir1=require("atttir")
	--attliquide1=require("lacheliquide")
	--print("je tire ma poule")
	local cpt=0
	local cpt1=0
	local tirera0=nil
	local num--=nil
	local cptarmy=ibatiment[numero].armytt or 1
	local function tirera01(event)
		if pouvoir3activer==1 then
			if ibatiment[numero].pv3==false and (ibatiment[numero].type1==2 or ibatiment[numero].type1==1) and ibatiment[numero].pole==0 then
				if ibatiment[numero].type1==2 then
					if ibatiment[numero].type2==0 then--archer
						ibatiment[numero].attaque=ibatiment[numero].attaque+bonus11
						ibatiment[numero].cadence=ibatiment[numero].cadence+bonus21
						ibatiment[numero].vitesse=ibatiment[numero].vitesse+bonus31
					elseif ibatiment[numero].type2==1 then--boulet
						ibatiment[numero].attaque=ibatiment[numero].attaque+bonus10
						ibatiment[numero].impact=ibatiment[numero].impact+bonus20
					else--liquide
						ibatiment[numero].attaque=ibatiment[numero].attaque+bonus12
						ibatiment[numero].porte=ibatiment[numero].porte+bonus22
					end
				elseif ibatiment[numero].type1==3 then
					if ibatiment[numero].niveau>1 then
						ibatiment[numero].argentsec=ibatiment[numero].argentsec+bonus13
					end
				end
				if numero==affinfotab.num and affinfotab.type==1 and affinfogr.isVisible then
					affinfo(numero,false)
				end
				ibatiment[numero].pv3=true
				ibatiment[numero].bandepv3=display.newGroup()
				if not goh then
					ibatiment[numero].bandepv3gr=mathfloor(ibatiment[numero].y1+1024+12)
				else
					ibatiment[numero].bandepv3gr=ibatiment[numero].group+1
				end
				--print(ibatiment)
				group[ibatiment[numero].bandepv3gr]:insert(ibatiment[numero].bandepv3)
				--local bande1pv3=display.newImage(imbouton.pouvoir3bande,1)
				local bande1pv3=display.newSprite(effetexplo.torche,effetexplo.torcheseq)
				bande1pv3:setSequence("levelup")
				bande1pv3:play()
				bande1pv3.x=ibatiment[numero].x1+10
				--bande1pv3.y=ibatiment[numero].y+10 --+10
				if not goh then
					bande1pv3.xScale=0.5
				else
					bande1pv3.xScale=0.13
				end
				bande1pv3.yScale=bande1pv3.xScale
				--bande1pv3.y=ibatiment[numero].y+ibatiment[numero].ypro-bande1pv3.yScale*bande1pv3.height*0.5
				bande1pv3.y1=ibatiment[numero].y1+ibatiment[numero].ypro-bande1pv3.yScale*bande1pv3.height*0.5
				bande1pv3.yScale1=bande1pv3.yScale
				bande1pv3.yScale=0.01
				bande1pv3.y=ibatiment[numero].y1+ibatiment[numero].ypro-bande1pv3.yScale*bande1pv3.height*0.5
				local latransition2=transition.to(bande1pv3,{time=1000*vitessejeuin,y=bande1pv3.y1,yScale=bande1pv3.yScale1,tag="elementtype"})
				if jeupause.etat==1 then
					transition.pause(latransition2)
				end
				ibatiment[numero].bandepv3:insert(bande1pv3)
				-- local bande2pv3=display.newImage(imbouton.pouvoir3bande,1)
				-- bande2pv3.x=ibatiment[numero].x-10
				-- bande2pv3.y=ibatiment[numero].y+10
				-- bande2pv3.xScale=0.5
				-- bande2pv3.yScale=0.5
				-- ibatiment[numero].bandepv3:insert(bande2pv3)
				local bande2pv3=display.newSprite(effetexplo.torche,effetexplo.torcheseq)
				bande2pv3:setSequence("levelup")
				bande2pv3:play()
				bande2pv3.x=ibatiment[numero].x1-10
				--bande1pv3.y=ibatiment[numero].y+10 --+10
				if not goh then
					bande2pv3.xScale=0.5
				else
					bande2pv3.xScale=0.13
				end
				bande2pv3.yScale=bande2pv3.xScale
				bande2pv3.y1=bande1pv3.y1 --ibatiment[numero].y+ibatiment[numero].ypro-bande2pv3.yScale*bande2pv3.height*0.5
				bande2pv3.yScale1=bande1pv3.yScale1 --bande2pv3.yScale
				bande2pv3.yScale=0.01
				bande2pv3.y=bande1pv3.y -- ibatiment[numero].y+ibatiment[numero].ypro-bande2pv3.yScale*bande2pv3.height*0.5
				local latransition1=transition.to(bande2pv3,{time=1000*vitessejeuin,y=bande2pv3.y1,yScale=bande2pv3.yScale1,tag="elementtype"})
				if jeupause.etat==1 then
					transition.pause(latransition1)
				end
				ibatiment[numero].bandepv3:insert(bande2pv3)
			end
		elseif ibatiment[numero].pv3==true then
			ibatiment[numero].pv3=false
			local bandepv3disp=function(obj)
				group[ibatiment[numero].bandepv3gr]:remove(ibatiment[numero].bandepv3)
				ibatiment[numero].bandepv3:removeSelf()
			end
			transition.to(ibatiment[numero].bandepv3,{time=500,alpha=0,onComplete=bandepv3disp, onCancel=bandepv3disp})
			if ibatiment[numero].type1==2 then
				if ibatiment[numero].type2==0 then--archer
					ibatiment[numero].attaque=ibatiment[numero].attaque-bonus11
					ibatiment[numero].cadence=ibatiment[numero].cadence-bonus21
					ibatiment[numero].vitesse=ibatiment[numero].vitesse-bonus31
				elseif ibatiment[numero].type2==1 then--boulet
					ibatiment[numero].attaque=ibatiment[numero].attaque-bonus10
					ibatiment[numero].impact=ibatiment[numero].impact-bonus20
				else--liquide
					ibatiment[numero].attaque=ibatiment[numero].attaque-bonus12
					ibatiment[numero].porte=ibatiment[numero].porte-bonus22
				end
			elseif ibatiment[numero].type1==3 then
				if ibatiment[numero].niveau>1 then
					ibatiment[numero].argentsec=ibatiment[numero].argentsec-bonus13
				end
			end
			if numero==affinfotab.num and affinfotab.type==1 and affinfogr.isVisible then
				affinfo(numero,false)
			end
		end
		cpt=cpt+1
		if ibatiment[numero].sup==1 then
			cptarmy=ibatiment[numero].armytt
			print("cptarmy mis a 1000")
			cpt=0
		end
		-- print("la"..num)
		if cpt==4 or (cpt>=2 and ibatiment[numero].type1==2 and ibatiment[numero].type2~=2) then
			--print("cpt=4")
			cpt=0
			if ibatiment[numero].type1==2 then
				cpt1=cpt1+1
				if ibatiment[numero].type2~=2 then
					rechercheverif(1,numero,ibatiment[numero].x1+ibatiment[numero].xpro,ibatiment[numero].y1+ibatiment[numero].ypro)
				else
					rechercheliquide(numero)
				end
			elseif ibatiment[numero].type1==3 then

			end

			--print("cpt1:"..cpt1)
		end
		if ibatiment[numero].sup1==1 then
			--timer.cancel(event.source)
			jeupause.timerlibre[num]=0
		else
			tirera0=timer.performWithDelay( ibatiment[numero].cadence*0.25*vitessejeuin,tirera01)
			if modearmy and removepartiel1==false and lancervague1.isVisible1==false and ibatiment[numero].type1~=3 then
				cptarmy=cptarmy+1
				print("cptarmy+1")
				if ibatiment[numero].armytt<cptarmy and ibatiment[numero].endev==0 then
					print("cptarmy "..cptarmy)
					cptarmy=cptarmy-(ibatiment[numero].armytt)
					print("cptarmya "..cptarmy)
					generersoldatarmy(numero,ibatiment[numero].niveau)
				end
			end
			if ibatiment[numero].type1==3 and removepartiel1==false and lancervague1.isVisible1==false then
				-- print("batiment type 3")
				--print("info attbat"..isoldat[ibatiment[numero].numsol].vie.." "..isoldat[ibatiment[numero].numsol].vietotale.."  "..isoldat[ibatiment[numero].numsol].encombat)
				if isoldat[ibatiment[numero].numsol].ennemi~=0 then
					if not isoldat[isoldat[ibatiment[numero].numsol].ennemi].vivant or isoldat[isoldat[ibatiment[numero].numsol].ennemi].orientation==0 then
						isoldat[ibatiment[numero].numsol].ennemi=0
					end
				end
				if isoldat[ibatiment[numero].numsol].encombat~=0 and isoldat[ibatiment[numero].numsol].ennemi==0 then
					local mini=1
					local maxi=nbsoldat
					if isoldat[numero].orientation==1 then
						mini=nbsoldatg
						maxi=0
					end	
					for i=mini,maxi do	
					--while i<=nbsoldat do
						if isoldat[i].ennemi==ibatiment[numero].numsol then
							isoldat[ibatiment[numero].numsol].ennemi=i
							break
							--i=nbsoldat
						end
					end
					if isoldat[ibatiment[numero].numsol].ennemi==0 then
						isoldat[ibatiment[numero].numsol].encombat=0
					end
				end
				if isoldat[ibatiment[numero].numsol].vie==isoldat[ibatiment[numero].numsol].vietotale and isoldat[ibatiment[numero].numsol].encombat==0 then
					isoldat[ibatiment[numero].numsol].vivant=true
					isoldat[ibatiment[numero].numsol].nbennemi=0
					isoldat[ibatiment[numero].numsol].rectvie.alpha=0
					ibatiment[numero].echafaudage.isVisible=false
					if ibatiment[numero].chargement1.cpt>30 then
						if ibatiment[numero].recuptune.clic==0 then
							if affinfotab.type==1 and affinfotab.num==numero and boutondev>=1 then
								ibatiment[numero].recuptune.isVisible=false
							else	
								--print("boutondev "..boutondev)
								ibatiment[numero].recuptune.isVisible=true
								if ibatiment[numero].pole~=0 or (contreai==0 and aiactive==1 and contreaihaut==1) then
									ibatiment[numero].recuptune.isVisible=false
									ibatiment[numero].recuptune.clic=1
									ibatiment[numero].vieenlever=ibatiment[numero].vieenlever+ibatiment[numero].argentcum
									if ibatiment[numero].pole~=0 then
										argentai=argentai+(-3*(ibatiment[numero].argentcum))
									else
										argent=argent+(-3*(ibatiment[numero].argentcum))
									end
									ibatiment[numero].argentcum=0
									ibatiment[numero].chargement1.cpt=0
									ibatiment[numero].chargement1.height=ibatiment[numero].chargement1.cpt
									ibatiment[numero].recuptune.clic=0
								end
							end
						else
							ibatiment[numero].recuptune.isVisible=false
						end
					else
						ibatiment[numero].recuptune.isVisible=false
					end
					if ibatiment[numero].chargement1.cpt<=100 and ibatiment[numero].endev==0 then
						--print("la tune rentre"..ibatiment[numero].argentcum..ibatiment[numero].argentsec)
						ibatiment[numero].argentcum=ibatiment[numero].argentcum+ibatiment[numero].argentsec*0.25
						if ibatiment[numero].laframe==0 then
							ibatiment[numero].laframe=1
						else
							ibatiment[numero].laframe=0
						end
						ibatiment[numero]:setFrame(ibatiment[numero].niveau*2+ibatiment[numero].laframe )
						ibatiment[numero].chargement1.alpha=1
						ibatiment[numero].chargement.alpha=1
						ibatiment[numero].chargement1.cpt=ibatiment[numero].chargement1.cpt+1
						ibatiment[numero].chargement1.height=ibatiment[numero].chargement1.cpt*0.5
						ibatiment[numero].chargement1.y=ibatiment[numero].y1+25-ibatiment[numero].chargement1.cpt*0.25
					else
						if ibatiment[numero].chargement1.cpt==nil then
							ibatiment[numero].chargement1.cpt=0
						end
						print("la mine ne rapporte pas: ibatiment[numero].chargement1.cpt "..ibatiment[numero].chargement1.cpt.." ibatiment[numero].endev "..ibatiment[numero].endev)
					end
				else
					print("bat vie:"..isoldat[ibatiment[numero].numsol].vie.." vietotale:"..isoldat[ibatiment[numero].numsol].vietotale.." encombat:"..isoldat[ibatiment[numero].numsol].encombat)
					ibatiment[numero].recuptune.isVisible=false
					if isoldat[ibatiment[numero].numsol].encombat==0 then
						if isoldat[ibatiment[numero].numsol].vietotale~=isoldat[ibatiment[numero].numsol].vie then
							local pourcent=isoldat[ibatiment[numero].numsol].vie/isoldat[ibatiment[numero].numsol].vietotale
							--print("pourcent"..pourcent)
							ibatiment[numero].echafaudage.isVisible=true
							if pourcent==0 then
								ibatiment[numero].echafaudage:setFrame(5)
							elseif pourcent<0.25 then
								ibatiment[numero].echafaudage:setFrame(4)
							elseif pourcent<0.5 then
								ibatiment[numero].echafaudage:setFrame(3)
							elseif pourcent<0.75 then
								ibatiment[numero].echafaudage:setFrame(2)
							else
								ibatiment[numero].echafaudage:setFrame(1)
							end
							if isoldat[ibatiment[numero].numsol].vie==0 then
								if savegameall.bonusbatiment[32].repa then
									isoldat[ibatiment[numero].numsol].vie=1
								else
									timer.cancel(tirera0)
									tirera0=timer.performWithDelay( ibatiment[numero].cadence*4*vitessejeuin,tirera01)
								end
							end
							--print("vie++"..isoldat[ibatiment[numero].numsol].vie)
							local coefvitesse=1 or savegameall.bonusbatiment[32].vitesse
							isoldat[ibatiment[numero].numsol].vie=isoldat[ibatiment[numero].numsol].vie+isoldat[ibatiment[numero].numsol].vietotale/40*coefvitesse
							if isoldat[ibatiment[numero].numsol].vietotale<isoldat[ibatiment[numero].numsol].vie then
								isoldat[ibatiment[numero].numsol].vie=isoldat[ibatiment[numero].numsol].vietotale
							end

							isoldat[ibatiment[numero].numsol].rectvie.width=mathfloor(isoldat[ibatiment[numero].numsol].vie/isoldat[ibatiment[numero].numsol].vietotale*40)
							isoldat[ibatiment[numero].numsol].rectvie.alpha=1
							isoldat[ibatiment[numero].numsol].rectvie:setFillColor(1-isoldat[ibatiment[numero].numsol].vie/isoldat[ibatiment[numero].numsol].vietotale,isoldat[ibatiment[numero].numsol].vie/isoldat[ibatiment[numero].numsol].vietotale,0 )
							--print("width"..isoldat[ibatiment[numero].numsol].rectvie.width)
							if ibatiment[numero].etat>0 then
								if ibatiment[numero].etat>=10-10*(isoldat[ibatiment[numero].numsol].vie/isoldat[ibatiment[numero].numsol].vietotale) then
									ibatiment[numero].etat=ibatiment[numero].etat-1
									ibatiment[numero].anim.yScale1=ibatiment[numero].anim.yScale1-0.05
									ibatiment[numero].anim.xScale1=ibatiment[numero].anim.xScale1+0.05
									ibatiment[numero].anim.y1=ibatiment[numero].yf-ibatiment[numero].anim.height*ibatiment[numero].anim.yScale1*0.5
									--feupassesoldat[imin].anim.xScale1=feupassesoldat[imin].anim.xScale1+0.5
									if ibatiment[numero].etat>0 then
										if fpschoisi<1.3 then
											-- print("fpschoisi "..fpschoisi.." feupassesoldat[imin].anim.yScale="..feupassesoldat[imin].anim.yScale)
											local latransition1=transition.to(ibatiment[numero].anim,{time=500*vitessejeuin,y=ibatiment[numero].anim.y1,alpha=0.9,xScale=ibatiment[numero].anim.xScale1,yScale=ibatiment[numero].anim.yScale1,tag="elementtype"})
											if jeupause.etat==1 then
												transition.pause(latransition1)
											end
										else
											ibatiment[numero].anim.yScale=ibatiment[numero].anim.yScale1
											ibatiment[numero].anim.alpha=0.9
											ibatiment[numero].anim.y=ibatiment[numero].anim.y1
											--	print("fpschoisi "..fpschoisi.." feupassesoldat[imin].anim.yScale="..feupassesoldat[imin].anim.yScale.." feupassesoldat[imin].anim.xScale="..feupassesoldat[imin].anim.xScale)
										end
										print("animation mise en route")
									else
										ibatiment[numero].anim.alpha=0
										ibatiment[numero].anim.yScale=ibatiment[numero].anim.yScale1
										ibatiment[numero].anim.y=ibatiment[numero].anim.y1
										ibatiment[numero].anim.isVisible=false
									end
								end
							end
						end
					else
						ibatiment[numero]:setFrame(ibatiment[numero].niveau*2 )
					end
					
				end
				if affinfotab.num==numero and affinfotab.type==1 then
					--print("etape1")
					if boutondev==1 or boutondev==2 then
						--print("etape2")
						local act=0
						--print("vie"..isoldat[ibatiment[numero].numsol].vie.."vietotale"..isoldat[ibatiment[numero].numsol].vietotale.."encombat"..isoldat[ibatiment[numero].numsol].encombat)
						if ibatiment[numero].niveau>=2 and isoldat[ibatiment[numero].numsol].vie==isoldat[ibatiment[numero].numsol].vietotale and isoldat[ibatiment[numero].numsol].encombat==0 then
							if vendre~=nil then
								vendre.alpha=1
							end
							if ibatiment[numero].niveau<4 then
								--print("niveau<4")
								--print("ennemi"..isoldat[ibatiment[numero].numsol].ennemi)
								if isoldat[ibatiment[numero].numsol].ennemi~=0 then
									if isoldat[isoldat[ibatiment[numero].numsol].ennemi].vie<=0 or isoldat[isoldat[ibatiment[numero].numsol].ennemi].vivant==false then--a peu etre optimiser
										isoldat[ibatiment[numero].numsol].ennemi=0
									elseif	isoldat[isoldat[ibatiment[numero].numsol].ennemi].ennemi~=ibatiment[numero].numsol then
										isoldat[ibatiment[numero].numsol].ennemi=0
									end
								end
								--print("ennemi1"..isoldat[ibatiment[numero].numsol].ennemi)
								if isoldat[ibatiment[numero].numsol].ennemi==0 then
									if nivsup~=nil then
										nivsup.alpha=1
									end
									act=1
									--print("act=1")
								end
							end
							--print("ibatiment[numero].argentcum"..ibatiment[numero].argentcum)
							if ibatiment[numero].argentcum~=0 then
								if choixgauche~=nil then
									choixgauche.alpha=1 -- bug choix gauche
									act=act+2
								end
							end
						else
							if ibatiment[numero].niveau==1 then
								if nivsup~=nil then
									nivsup.alpha=1
								end
								act=1
							end
							if ibatiment[numero].niveau>=2 then
								if vendre~=nil then
									vendre.alpha=0.5
								end
							end
						end
						if act<2 and ibatiment[numero].niveau>=2 then
							if choixgauche~=nil then
								choixgauche.alpha=0.5
							end
						else
							act=act-2
						end
						if act==0 and ibatiment[numero].niveau<4 then
							--print("act=0")
							if nivsup~=nil then
								nivsup.alpha=0.5
							end
						end
					end
					affinfo(numero,false)
				end
			end
			--jeupause.timer[num]=tirera0
			local num1=timerpause(1,tirera0,num)
		end
	end
	tirera0=timer.performWithDelay( ibatiment[numero].cadence*0.25*vitessejeuin,tirera01)
	num=timerpause(1,tirera0,nil)
	-- jeupause.timer[num]=tirera0
	-- jeupause.timerlibre[num]=1
end
end
t.attbatiment= function()
local a=1
end
return t