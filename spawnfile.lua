local t={}
print("yo mec")
local function affichepartfaite(part)
	local function removemodedejeutext(event)
		--jeupause.timerlibre[event.source.nbtimer]=0
		if grpartie~=nil then
			grpartie:remove(event.source.modedejeutext)
			event.source.modedejeutext:removeSelf()
			event.source.modedejeutext=nil
		end
	end
	local removemodedejeutext1=timer.performWithDelay( 4000,removemodedejeutext)
	--removemodedejeutext1.nbtimer=timerpause(1,removemodedejeutext1,nil)
	local datatext
	if isiphone then
		datatext={
			text="",
			x=contentcenterx,
			y=contentcentery,
			width=actualcontentwidth*0.65,
			height=0,
			font=fonttype,
			fontSize=48,
			align="center"
		}
	else
		datatext={
			text="",
			x=contentcenterx,
			y=contentcentery,
			font=fonttype,
			fontSize=48,
			align="center"
		}
	end
	removemodedejeutext1.modedejeutext=display.newEmbossedText(datatext) -- "", contentcenterx, contentcentery,fonttype, 48,"center" )
	removemodedejeutext1.modedejeutext:setEmbossColor(colortextemb)
	grpartie:insert(removemodedejeutext1.modedejeutext)
	if niveauch<=4 then
		removemodedejeutext1.modedejeutext:setFillColor(0.2,0.2,0.2)
	elseif niveauch<=8 then
		removemodedejeutext1.modedejeutext:setFillColor(0.2,0.2,0.2)
	elseif niveauch<=12 then
		removemodedejeutext1.modedejeutext:setFillColor(0.2,0.2,0.2)
	else
		removemodedejeutext1.modedejeutext:setFillColor(0.7,0.7,0.7)
	end
	removemodedejeutext1.modedejeutext.text="Stage "..part
	removemodedejeutext1.modedejeutext.alpha=0
	transition.to(removemodedejeutext1.modedejeutext, {delay=1000,time=1000,alpha=1})
	transition.to(removemodedejeutext1.modedejeutext, {delay=2450,time=700,y=yminscreen-20,transition=easing.inSine})
	transition.to(removemodedejeutext1.modedejeutext, {delay=2500,time=1500,alpha=0,xScale=0.7,yScale=0.7,transition=easing.inSine})
end
local function levelniveaubonus(leveldemander,suigene,id,xoffset,yoffset)
	if leveldemander>1 then
		yoffset=yoffset or 0
		local tabsoltype={101,101,102,103,104}
		local lesoldatchoix
		local nbsol
		local racech=race
		if racech==2 then
			racech=1
		elseif racech==1 then
			racech=2
		end
		if leveldemander<4 then
			lesoldatchoix=tabsoltype[leveldemander]
		else
			lesoldatchoix=tabsoltype[5]
		end
		if leveldemander>2 then
			lesoldatchoix=lesoldatchoix+10*racech
			nbsol=mathfloor(((leveldemander+1)/(race+1)))
		else
			nbsol=2
		end
		if id~=nil then
			if id>0 then
				lesoldatchoix=id
				nbsol=leveldemander
			end
		end
		local nbsoldejaspawn=0
		local function spawnrenforttime(event)
			if findelapartie==false and not removepartiel1 then
				if jeupause.etat==0 then
					nbsoldejaspawn=nbsoldejaspawn+1
					local ydepspawn=actualcontentheight*0.5/(nbsoldejaspawn^0.5)*(-1)^nbsoldejaspawn+yoffset
					if id~=nil then
						ydepspawn=15+yoffset
					end
					local numnew=spawnsoldat(200,lesoldatchoix,ydepspawn)
					convertunit(numnew,suigene)
					if xoffset~=nil then
						print("modifie xposi "..xoffset)
						isoldat[numnew].xposi=isoldat[numnew].xposi+xoffset-nbsol/4*10+mathrandom(nbsol)/2*10
						isoldat[numnew].yposi=isoldat[numnew].yposi-nbsol/4*10+mathrandom(nbsol)/2*10+yoffset
						if isoldat[numnew].tir~=0 then 
							isoldat[numnew].tir.attaque=10 -- pour level15
							isoldat[numnew].tir.cadence=800+mathrandom(4)*100
						end
					end
					local anim=display.newSprite(effetexplo.apparition,effetexplo.apparitionseq)
					anim:setSequence("levelup")
					anim.x=isoldat[numnew].x1
					anim.y=isoldat[numnew].y1
					anim.xScale=1
					anim.yScale=anim.xScale
					anim.group=mathfloor(anim.y+1024)
					group[anim.group]:insert(anim)
					spritegestion(anim)
					if nbsoldejaspawn<nbsol then
						timer.performWithDelay(750,spawnrenforttime)
					end
				else
					timer.performWithDelay(100,spawnrenforttime)
				end
			end
		end
		timer.performWithDelay(750,spawnrenforttime)
		-- for i=1,nbsol do
		-- 	local ydepspawn=actualcontentheight*0.5/(i^0.5)*(-1)^i --25*i*(-1)^i
		-- 	-- if ydepspawn<yminscreen then
		-- 	-- 	ydepspawn=yminscreen+100
		-- 	-- elseif ydepspawn>ymaxscreen then
		-- 	-- 	ydepspawn=ymaxscreen-100
		-- 	-- end
		-- 	local numnew=spawnsoldat(200,lesoldatchoix,ydepspawn)

		-- 	convertunit(numnew,suigene)
		-- end

		-- tabsoltype={102,112,122,103,113,123,104,114,124,124,124,124,124,124,124}
		-- tabdolnb={   2,  2,  2,  4,  3,  3,  6,  4,  4,  5,  6,  7,  8,  9, 10}
		-- for i=1,tabdolnb[leveldemander-1] do
		-- 	local numnew=spawnsoldat(-300+50*i,tabsoltype[leveldemander-1],-300+50*i)
		-- 	convertunit(numnew)
		-- end
	end
	-- body
end
local function squelettevague()
	levelniveaubonus(savegame.lvlsquelette)
	local sommeprob
	if pointdeppro~=nil then
		sommeprob=0.5
		for i=1,#pointdep+1 do
			if pointdeppro[i]==nil then
				pointdeppro[i]=0.5
			end
			sommeprob=sommeprob+pointdeppro[i]
		end
	end
	vague=nil
	vague={}
	local levelmax=1
	local niveau5=1
	function vaguesuisquelette(i)
		if i>=5*niveau5 then
			dureepartie=dureepartie*1.15
			niveau5=niveau5+1
			affichepartfaite(niveau5)
		end
		for k=i,i+1 do
			vague[i]={}
			vague[i][1]=200
		end
		--for i=1,100 do--1
		--vague[i]={}
		levelmax=mathfloor((i)^(0.9))
		local l=1
		local k=1
		while k<=10*levelmax do --i*10 do
			--local l=k
			if pointdep~=nil then
				if pointdeppro==nil then
					local randomspawnpoint=mathrandom(0,#pointdep)
					print("randomspawnpoint"..randomspawnpoint)
					if randomspawnpoint~=0 then
						vague[i][l]=-randomspawnpoint
						l=l+1
					end
				else
					local randomspawnpoint=mathrandom(0,sommeprob*100)*0.01
					local valeurcum=1
					local entrechoisi=0
					print("randomspawnpoint"..randomspawnpoint)
					if randomspawnpoint>1 then
						for m=1,#pointdeppro do
							valeurcum=valeurcum+pointdeppro[m]
							if valeurcum>=randomspawnpoint then
								entrechoisi=m-1
							end
						end
					end
					if entrechoisi~=0 then
						vague[i][l]=-entrechoisi
						l=l+1
					end
				end
			end
			local niveausoldatspawn=mathrandom(1,levelmax)
			local nbsoldatspawnsametime=mathrandom(1,levelmax)
			if nbsoldatspawnsametime>1 then
				vague[i][l]=nbsoldatspawnsametime
				l=l+1
			end
			for n=1,nbsoldatspawnsametime do
				if niveausoldatspawn>11 then
					niveausoldatspawn=11
				end
				if niveausoldatspawn==1 then
					vague[i][l]=237
				else
					vague[i][l]=278+niveausoldatspawn
				end
				k=k+1
				l=l+1
			end
		end
	end
	vaguesuisquelette(1)
end
function level15renfort()
	levelniveaubonus(5,nil,-1,-60)
	levelniveaubonus(7,nil,107,66)
end
function leveltutorenfort()
	--levelniveaubonus(5,nil,-1,-60)
	levelniveaubonus(5,nil,107,0,40)
	--levelniveaubonus(5,nil,145,0,60)
end
local function zombievague()
	if modezombie then
		levelniveaubonus(savegame.lvlzombie,false)
	else
		levelniveaubonus(savegame.lvlpanique,false)
	end
	local quantite=2
	local densite1=2 -- de 2 a +inf
	local densite2=2 -- de 2 a 9
	if issimulator then
		quantite=5
		densite1=5
		densite2=5
	end
	vague=nil
	vague={}
	local niveau5=1
	function vaguesuizombie(l)
		if l>=5*niveau5 then
			dureepartie=dureepartie*1.2
			niveau5=niveau5+1
			affichepartfaite(niveau5)
		end
		for k=l,l+1 do
			vague[k]={}
			vague[k][1]=200
		end
		--for l=1,30 do
			local numerotest=0
			print("vague "..l.." densite "..densite1*densite2)
			for i=1,quantite do
				numerotest=numerotest+1
				vague[l][numerotest]=-8-densite1
				for j=1,densite1 do
					numerotest=numerotest+1
					vague[l][numerotest]=densite2
					for k=1,densite2 do
						numerotest=numerotest+1
						vague[l][numerotest]=238
					end
				end
			end
			local densitetotal=densite1*densite2
			densite2=densite2+mathfloor(densitetotal^0.3/densite1)
			--densite2=densite2+2
			if densite2>9 then
				densite1=densite1+1
				densite2=5
			end
			quantite=quantite+mathfloor(quantite^0.3)
			-- if modepanique then
			-- 	for i=1,#vague[1] do
			-- 		if vague[1][i]==238 then
			-- 			vague[1][i]=244
			-- 		end
			-- 	end
			-- end
		--end
		if modepanique then
			--for l=1,30 do
				for i=1,#vague[l] do
					if vague[l][i]==238 then
						vague[l][i]=244
					end
				end
			--end
		end
	end
	vaguesuizombie(1)
end
function initspawn(level,testleveltest)
	vagueencours=1
		print("vagueencours"..vagueencours.." esperer 1")
		if modeinfini then
			print("test1 modeinfini")
		else
			print("test mode normal")
		end
		-- if modedelancement~=0 and modeinfini==true then
		-- 	vaguesuivanteinf(vagueencours)
		-- end
		-- if modeinfini then
		-- 	vaguesuivanteinf(vagueencours)
		-- end
		--vaguesuivanteinf(vagueencours+1)
		local vagueinftext=vagueencours-1
		if vagueinf~=nil then
			if modeinfini==false and not modesquelette then
				vagueinf.text=vagueinftext.."/"..nbvague
			else
				vagueinf.text=vagueinftext
			end
		end
		soldatencours=1
		--local j=1  
		--local nbva=10--nombre de vague pas utiliser
		timerdeniv1={}
		timer2spawn=nil
		timer1spawn=nil
		timerpriospawn=nil
		nouvague=0-- -1 pour vague en cours 0 vague fini et 1 nouvelle vague demander
		timerdeniv1.timer2num=nil
		timerdeniv1.timer1num=nil
		timerdeniv1.timerprionum=nil
		-- local timer2spawn=nil
		-- local timer1spawn=nil
		-- local timerpriospawn=nil
		-- local nouvague=0-- -1 pour vague en cours 0 vague fini et 1 nouvelle vague demander
		-- local timer2num=nil
		-- local timer1num=nil
		-- local timerprionum=nil
		--local i=1
		finparttest=false
		if modeinfini==false then
			--print("ici 1")
			if (iswindows  or issimulator) and not modeperftest and not modezombie and not modepanique and not modesquelette and generaltest==0 then -- pour developer true et sinon false (va chercher les vagues dans le fichier level)
				--print("ici 2")
				local loadsave = require( "loadsave" ) 
				-- local chainecaract="level"..niveauch..".json"
				--loadsave.saveTable( vague, "level1.json" )
				local resul
				if issimulator or iswindows then
					print("lit le fichier 3kingslevel")
					if not goh then
						if modewave then
							resul=loadsave.loadTable( "3kingslevelwave.json")
						else
							resul=loadsave.loadTable( "3kingslevel.json")
						end
					else
						if modewave then
							resul=loadsave.loadTable( "3kingslevelgohwave.json")
						else
							resul=loadsave.loadTable( "3kingslevelgoh.json")
							print("lit le ficher 3kingslevelgoh")
						end
					end
				elseif true then ---------------------------------------version developer level designer
					if not goh then
						resul=loadsave.loadTable1( "3kingslevel.json","/mnt/sdcard/3kingslevel.json") --..chainecaract)
					else
						resul=loadsave.loadTable1( "3kingslevel.json","/mnt/sdcard/3kingslevelgoh.json") --..chainecaract)
					end
				end
				-- vague=resul[niveauch] --loadsave.loadTable1( chainecaract,"/mnt/sdcard/level/"..chainecaract)
				--vague=loadsave.loadTable( chainecaract,system.DocumentsDirectory)
				-- vague=loadsave.loadTable1( chainecaract,"/mnt/sdcard/"..chainecaract )
				-- vague=loadsave.loadTable1( chainecaract,"/mnt/local/"..chainecaract )
				if resul==nil then --vague==nil then
					print("regene tab")
					local resultat={}
					for i=1,17 do
						local leveltest=nil
						local stringplus=""
						if goh then
							stringplus="goh"
						end
						leveltest=require("level"..i..stringplus)
						if modewave then
							leveltest:vaguewave()
						else
							leveltest:vague()
						end
						vague["fin"]="de niveau"
						resultat["level"..i]=vague
						vague=nil
					end
					-- level:vague()
					-- resul[niveauch]=vague
					if issimulator or iswindows then
						print("save")
						if not goh then
							if modewave then
								loadsave.saveTable( resultat, "3kingslevelwave.json")
							else
								loadsave.saveTable( resultat, "3kingslevel.json")
							end
						else
							if modewave then
								loadsave.saveTable( resultat, "3kingslevelgohwave.json")
							else
								loadsave.saveTable( resultat, "3kingslevelgoh.json")
							end
						end
					else
						print("save1")
						if not goh then 
							loadsave.saveTable1( resultat, "3kingslevel.json","/mnt/sdcard/3kingslevel.json" )
						else
							loadsave.saveTable1( resultat, "3kingslevel.json","/mnt/sdcard/3kingslevelgoh.json" )
						end
					end
					resultat["level"..niveauch]["fin"]=nil
					vague=nil
					vague={}
					for pos,val in pairs(resultat["level"..niveauch]) do
					-- for i=1,#resul["level"..niveauch] do
						print("test"..pos)
						local posi=pos+0
						vague[posi]=val -- resul["level"..niveauch][pos]
					end

					-- resultat["level"..niveauch]["fin"]=nil
					-- vague=resultat["level"..niveauch]
					--loadsave.saveTable1( vague, chainecaract,"/mnt/sdcard/"..chainecaract )
				else
					-- if true then -- pour recuperer les données et les ajoutés au fichier level
					-- 	for i=1,16 do
					-- 		print("NIVEAU:"..i)
					-- 		resul["level"..i]["fin"]=nil
					-- 		for pos,val in pairs(resul["level"..i]) do
					-- 			local posi=pos+0
					-- 			local vagueexi="vague["..posi.."]={"
					-- 			local nouveautruc=""
					-- 			for j=1,#val do
					-- 				vagueexi=vagueexi..nouveautruc..val[j]
					-- 				nouveautruc=","
					-- 			end
					-- 			vagueexi=vagueexi.."}"
					-- 			print(vagueexi)
					-- 			-- local posi=pos+0
					-- 			-- vagueexi[posi]=val
					-- 			-- vague[posi]=val
					-- 		end
					-- 	end
					-- end
					print("ne regenere pas la table")
					print("niveauch "..niveauch)
					resul["level"..niveauch]["fin"]=nil
					vague=nil
					vague={}
					for pos,val in pairs(resul["level"..niveauch]) do
					-- for i=1,#resul["level"..niveauch] do
						print("test"..pos)
						local posi=pos+0
						vague[posi]=val -- resul["level"..niveauch][pos]
					end
					if issimulator then
						if issimulator then
							for i=1,17 do
								resul["level"..i]["fin"]=nil
							end
							unitapear={}
							for pos,val in pairs(resul) do
								unitapear[pos]={}
								for pos1,val1 in pairs(resul[pos]) do
									for  pos3,val3 in pairs(resul[pos][pos1]) do
										if val3>10 then
											local exist=false
											for pos2,val2 in pairs(unitapear[pos]) do
												if val3==val2 then
													exist=true
													break
												end
											end
											if not exist then
												unitapear[pos][#unitapear[pos]+1]=val3
											end
										end
									end
								end
							end
							for pos,val in pairs(unitapear) do
								local stringmap="map "..pos..":"
								for pos1,val1 in pairs(unitapear[pos]) do
									stringmap=stringmap..","..val1
								end
								print(stringmap)
							end
						end
						if issimulator then
							for i=1,17 do
								resul["level"..i]["fin"]=nil
							end
							frequenceapp={}
							for pos,val in pairs(tabsoldexist) do
								if val then
									if pos>199 then
										frequenceapp[pos]=0
									end
								end
							end
							for pos,val in pairs(resul) do
								--print("ici resul "..pos)
								for pos1,val1 in pairs(resul[pos]) do
									--print("ici resul "..pos.." "..pos1)
									for  pos2,val2 in pairs(resul[pos][pos1]) do
										-- print("val2 "..val2)
										if val2>10 then
											if frequenceapp[val2]==nil then
												frequenceapp[val2]=1
												print("\n soldat inexistant mais demander d'etre spawner "..val2)
											else
												frequenceapp[val2]=frequenceapp[val2]+1
											end
										end
									end
								end
							end
							--tabsoldexist
							for pos,val in pairs(frequenceapp) do
								pos1=pos
								if pos>10 then
									if pos>=280 and pos<290 then -- squelette
										pos1=237
									end
									if pos>300 then
										display.newText("error unit "..pos.." don't exist",0,0,native.systemFontBold,40)
										print("pos "..pos.." doesn't exist")
									else
										print("sold: "..pos.." "..image[pos1].message.." apparait "..val)
									end
								end
							end
						end
						if issimulator then
							print("vague du niveau")
							local chainecaract=""
							for i=1,#vague do
								chainecaract="vague["..i.."]={"
								for j=1,#vague[i] do
									chainecaract=chainecaract..vague[i][j]
									if j~=#vague[i] then
										chainecaract=chainecaract..","
									else
										chainecaract=chainecaract.."}"
									end
								end
								print(chainecaract)
							end
							local tuneagagnertt=0
							local tuneagagnerva=0
							local nbsoldatvague=0
							local nbsoldattt=0
							local tempsvaguett=0
							local tempsvague
							for i=1,#vague do
								tuneagagnerva=0
								nbsoldatvague=0
								tempsvague=0
								for j=1,#vague[i] do
									if vague[i][j]>=200 then
										nbsoldatvague=nbsoldatvague+1
										local vagueij=vague[i][j]
										if vague[i][j]>=280 and vague[i][j]<290 then -- squelette
											vagueij=237
											local nbsquelette=2^(vague[i][j]-279)
											tuneagagnerva=tuneagagnerva+image[vagueij].argent*(nbsquelette-1)
										end
										tuneagagnerva=tuneagagnerva+image[vagueij].argent
									end
									if vague[i][j]>10 or vague[i][j]==1 then
										tempsvague=tempsvague+1
									elseif vague[i][j]>=2 then
										tempsvague=tempsvague-vague[i][j]+1
									elseif vague[i][j]==0 then
										tempsvague=tempsvague+3
									elseif vague[i][j]<=-10 then
										tempsvague=tempsvague+(vague[i][j]+9)
									end
								end
								tempsvaguett=tempsvaguett+tempsvague
								print("vague "..i.." à "..nbsoldatvague.." soldats, rapporte "..tuneagagnerva.." et en reel "..tuneagagnerva/dureepartie.." et dure "..(tempsvague/accelererenn))
								tuneagagnertt=tuneagagnertt+tuneagagnerva
								nbsoldattt=nbsoldattt+nbsoldatvague
							end
							print("au total les vagues comprennent "..nbsoldattt.." soldats, rapportent "..tuneagagnertt.." et en reel "..tuneagagnertt/dureepartie.." et dure "..(tempsvaguett/accelererenn))
							local nbunitepiece=0
							local parvague=0
							for i=1,#vague do
								parvague=0
								for j=1,#vague[i] do
									if vague[i][j]>=200 then
										local vagueij=vague[i][j]
										if vague[i][j]>=280 and vague[i][j]<290 then -- squelette
											vagueij=237
										end
										if image[vagueij].argent/dureepartie*clicpiececoef>5 then
											parvague=parvague+1
										end
									end
								end
								print("La vague "..i.." à "..parvague.." piece a cliquer")
								nbunitepiece=nbunitepiece+parvague
							end
							print("Tout les vagues ont "..nbunitepiece.." piece à cliquer")
						end
					end
					-- level:vague()
				end
			elseif testleveltest==true and not modesquelette and not modezombie and not modepanique then --level~=nil then
				print("ici")
				vagueaboss1=nil -- numero de la vague a boss (actuellement compatible à 3 vagues avec boss)
				vagueaboss2=nil
				vagueaboss3=nil
				if not modewave then 
					level:vague()
				else
					level:vaguewave()
				end
			elseif modesquelette or modezombie or modepanique then
				if modezombie or modepanique then
					zombievague()
				else
					squelettevague()
					-- local sommeprob
					-- if pointdeppro~=nil then
					-- 	sommeprob=0.5
					-- 	for i=1,#pointdep+1 do
					-- 		if pointdeppro[i]==nil then
					-- 			pointdeppro[i]=0.5
					-- 		end
					-- 		sommeprob=sommeprob+pointdeppro[i]
					-- 	end
					-- end
					-- vague=nil
					-- vague={}
					-- local levelmax=1
					-- for i=1,100 do--1
					-- 	vague[i]={}
					-- 	levelmax=mathfloor((i)^(0.9))
					-- 	local l=1
					-- 	local k=1
					-- 	while k<=10*levelmax do --i*10 do
					-- 		--local l=k
					-- 		if pointdep~=nil then
					-- 			if pointdeppro==nil then
					-- 				local randomspawnpoint=mathrandom(0,#pointdep)
					-- 				print("randomspawnpoint"..randomspawnpoint)
					-- 				if randomspawnpoint~=0 then
					-- 					vague[i][l]=-randomspawnpoint
					-- 					l=l+1
					-- 				end
					-- 			else
					-- 				local randomspawnpoint=mathrandom(0,sommeprob*100)*0.01
					-- 				local valeurcum=1
					-- 				local entrechoisi=0
					-- 				print("randomspawnpoint"..randomspawnpoint)
					-- 				if randomspawnpoint>1 then
					-- 					for m=1,#pointdeppro do
					-- 						valeurcum=valeurcum+pointdeppro[m]
					-- 						if valeurcum>=randomspawnpoint then
					-- 							entrechoisi=m-1
					-- 						end
					-- 					end
					-- 				end
					-- 				if entrechoisi~=0 then
					-- 					vague[i][l]=-entrechoisi
					-- 					l=l+1
					-- 				end
					-- 			end
					-- 		end
					-- 		local niveausoldatspawn=mathrandom(1,levelmax)
					-- 		local nbsoldatspawnsametime=mathrandom(1,levelmax)
					-- 		if nbsoldatspawnsametime>1 then
					-- 			vague[i][l]=nbsoldatspawnsametime
					-- 			l=l+1
					-- 		end
					-- 		for n=1,nbsoldatspawnsametime do
					-- 			if niveausoldatspawn>11 then
					-- 				niveausoldatspawn=11
					-- 			end
					-- 			if niveausoldatspawn==1 then
					-- 				vague[i][l]=237
					-- 			else
					-- 				vague[i][l]=278+niveausoldatspawn
					-- 			end
					-- 			k=k+1
					-- 			l=l+1
					-- 		end
					-- 	end
					-- end
				end
			end
		end
	end
local function spawn(vagueencours,soldatencours,pointdepspawn)--permet de spawner plsiers mec en meme temps
			if removepartiel1==false and removetotal==false then
				local num=findnbsoldat(1)
				-- local varlib=0
				-- local num=nil
				-- k=1
				-- while k<=nbsoldat do--permet de ralouer les numero
				-- 	if isoldat[k].remp==1 then
				-- 	--if isoldat[k].vie==-133 and isoldat[k].orientation==1 then
				-- 		varlib=1
				-- 		num=k
				-- 		k=nbsoldat+1
				-- 		--print("numero trouver")
				-- 	end
				-- 	k=k+1
				-- end
				-- if varlib==0 then
				-- 	nbsoldat=nbsoldat+1
				-- 	num=nbsoldat
				-- end
				local typeso=vague[vagueencours][soldatencours+1]--200+nbsoldat
				local hello=soldat1.new(num,typeso,0)
				hello:debut(num,pointdepspawn)
				if contreai==1 then
					nbsoldat=nbsoldat+1
					num=nbsoldat
					local hello=soldat1.new(num,typeso,0,614.4)
					hello:debut(num,pointdepspawn)
				end
			end
end
local function listener( event )
	if jeupause.timerlibre[timerdeniv1.timer2num]==1 then
		jeupause.timerlibre[timerdeniv1.timer2num]=2
	end
	if nouvague==1 then
		if modeinfini then
			--print("vagueencours "..vagueencours)
			vaguesuivanteinf(vagueencours)
		end
		if modeinfini==false and not modesquelette and not modezombie and not modepanique then
			vagueinf.text=vagueencours.."/"..nbvague
		else
			vagueinf.text=vagueencours
		end
		soldatencours=0
		nouvague=-1
		if modenormal then
			if vagueencours==nbvague then
				audio.play(son.eventboss)
			elseif vagueaboss1~=nil then
				if vagueaboss1==vagueencours then
					audio.play(son.eventboss)
				end
			elseif vagueaboss2~=nil then
				if vagueaboss2==vagueencours then
					audio.play(son.eventboss)
				end
			elseif vagueaboss3~=nil then
				if vagueaboss3==vagueencours then
					audio.play(son.eventboss)
				end
			end
		end
	end
	if soldatencours>=0 and soldatencours<=#vague[vagueencours]-1 then -- -1 pour spawn entrer 2, -2 pour 3...    0 a 5 pour premier points de spawn
		local cptpointchelou=1
		if vague[vagueencours][soldatencours+1]<=-10 then
			--print("ici bug ou pas")
			cptpointchelou=-vague[vagueencours][soldatencours+1]-8
			soldatencours=soldatencours+1
		end
		for i=1,cptpointchelou do
			local pointdepspawn=1
			if vague[vagueencours][soldatencours+1]<0 then
				pointdepspawn=-vague[vagueencours][soldatencours+1]+1
				soldatencours=soldatencours+1
			end
			if vague[vagueencours][soldatencours+1]>1 then
				if vague[vagueencours][soldatencours+1]>10 then
					spawn(vagueencours,soldatencours,pointdepspawn)
		    	else
		    		local i3=1
		    		spawn(vagueencours,soldatencours+i3,pointdepspawn)
		    		i3=i3+1
		    		while i3<=vague[vagueencours][soldatencours+1] do
		    			if fpschoisi<1.4 then
			    			local function timerasync(event)
			    				spawn(event.source.vagueencours,event.source.i3,event.source.pointdepspawn)
			    			end
			    			local letimerret=timer.performWithDelay(40,timerasync)
			    			letimerret.i3=soldatencours+i3
			    			letimerret.vagueencours=vagueencours
			    			letimerret.pointdepspawn=pointdepspawn
			    		else
		    				spawn(vagueencours,soldatencours+i3,pointdepspawn)
		    			end
		    			i3=i3+1
		    		end
		    		soldatencours=soldatencours+i3-1
		    	end
			end
			soldatencours=soldatencours+1
		end
			if lancervague1.isVisible1==false then --and i==cptpointchelou then
				if vague[vagueencours][soldatencours]>=1 then
					timer2spawn=timer.performWithDelay( 1000/accelererenn*vitessejeuin, listener )
					local date = os.date( "*t" )
					print("creation timer timer2spawn 277 "..date.sec)
					-- jeupause.timer[timer2num]=timer2spawn
					-- jeupause.timerlibre[timer2num]=1
					if timerdeniv1.timer2num==nil then
						timerdeniv1.timer2num=timerpause(1,timer2spawn,nil)
					else
						local lenum=timerpause(1,timer2spawn,timerdeniv1.timer2num)
					end
				else
					timer2spawn=timer.performWithDelay( 3000/accelererenn*vitessejeuin, listener )
					local date = os.date( "*t" )
					print("creation timer timer2spawn 287 "..date.sec)
					--jeupause.timer[timer2num]=timer2spawn
					--jeupause.timerlibre[timer2num]=1
					if timerdeniv1.timer2num==nil then
						timerdeniv1.timer2num=timerpause(1,timer2spawn,nil)
					else
						local lenum=timerpause(1,timer2spawn,timerdeniv1.timer2num)
					end
				end
			else
				print("remise a zero correctif de bug de lancer vague suivante")
				vagueencours=1
				local vagueinftext=vagueencours-1
				if modeinfini==false and not modesquelette then
					vagueinf.text=vagueinftext.."/"..nbvague
				else
					vagueinf.text=vagueinftext
				end
				soldatencours=1
			end
		--end
	end
	if vagueencours<nbvague or modeinfini or modesquelette or modezombie or modepanique then
		--print("vagueencours"..vagueencours)
		if soldatencours>#vague[vagueencours]-1 then
			soldatencours=-1
			vagueencours=vagueencours+1
			if modesquelette then
				vaguesuisquelette(vagueencours)
			elseif modepanique or modezombie then
				vaguesuizombie(vagueencours)
			end

			--print("vagueencours=vagueencours+1")
			if modeinfini then
				--print("vagueencours "..vagueencours)
				if vague[vagueencours]==nil then
					vague[vagueencours]={}
				end
				vague[vagueencours].nb=5
				--vaguesuivanteinf(vagueencours)
			end
			--vagueinf.text=vagueencours.."/"..nbvague
			nouvague=0
			vagsuig.isVisible=true
			local function timer2func(event)
				if event.source.cpt>=18 then
					timer1spawn=timer.performWithDelay( 1500/accelererenn*vitessejeuin, vaguesuivante )
					local date = os.date( "*t" )
					print("creation timer timer1spawn 329 "..date.sec.." timer numero "..timerdeniv1.timer1num)
					timerdeniv1.timer1num=timerpause(1,timer1spawn,timerdeniv1.timer1num)
					timer1spawn.cpt=event.source.cpt+1
				else
					timer1spawn=timer.performWithDelay( 1500/accelererenn*vitessejeuin, timer2func )
					local date = os.date( "*t" )
					print("creation timer timer1spawn 334 "..date.sec.." timer numero "..timerdeniv1.timer1num)
					timerdeniv1.timer1num=timerpause(1,timer1spawn,timerdeniv1.timer1num)
					timer1spawn.cpt=event.source.cpt+1
				end
			end
			timer1spawn=timer.performWithDelay( 1500/accelererenn*vitessejeuin, timer2func )
			local date = os.date( "*t" )
			timer1spawn.cpt=1
			timerdeniv1.timer1num=timerpause(1,timer1spawn,timerdeniv1.timer1num)
			print("creation timer timer1spawn 340 "..date.sec.."timer numero "..timerdeniv1.timer1num)
			-- jeupause.timer[timer1num]=timer1spawn
			-- jeupause.timerlibre[timer1num]=1
		end
	else
		--print("etape0"..i.." "..j.."nb"..vague[j].nb)
		if soldatencours>#vague[vagueencours]-1 then
			--print("etape1")
			if finparttest==false then
				finparttest=true
				--print("lancement des tests"..i)
				local function listenergagner(event)
					--print("deb test gagner")
					if jeupause.timerlibre[numtimergagner]==1 then
						jeupause.timerlibre[numtimergagner]=2
					end
					if findelapartie==false and removepartiel1==false then
						--print("test gagner")
						local gagner=0
						local nb=1
						while nb<=nbsoldat do
							if isoldat[nb].orientation==1 and isoldat[nb].vivant==true then
								gagner=1
								nb=nbsoldat
							end
							nb=nb+1
						end
						if gagner==0 then
							--timer.cancel(listenergagner)
							--print("test reussi")
							findelapartie=true
							appuipause()
							affmenuconf(3)
						else
							--print("relancer test gagné")
							listenergagner1=timer.performWithDelay(750,listenergagner)
							timerpause(1,listenergagner1,numtimergagner)
						end
					end
				end
				listenergagner1=timer.performWithDelay(750,listenergagner)
				numtimergagner=timerpause(1,listenergagner1,nil)
			end
		end
	end
end
local function vaguesuiclic(event)
	--print("vaguesuiclic")
	if jeupause.etat==0 then
		--print("pv1clic"..pv1clic.."pv2clic"..pv2clic.."pv3clic"..pv3clic.."clicconstruire"..clicconstruire.."clicinfanterie"..clicinfanterie.."clicarcher"..clicarcher.."clicpouvoir1"..clicpouvoir1.."clicpouvoir2"..clicpouvoir2.."clicpouvoir3"..clicpouvoir3.."pv1clicactiver"..pv1clicactiver.."pv2clicactiver"..pv2clicactiver)
		if(fenaff==false and pv1clic==0 and pv2clic==0 and pv3clic==0 and clicconstruire==0 and clicinfanterie==0 and clicarcher==0 and clicpouvoir1==0 and clicpouvoir2==0 and clicpouvoir3==0 and pv1clicactiver==0 and pv2clicactiver==0 )then	--				
			--print("test passer")
			
			local test=0
			if boutondev~=0 then
				if vendre~=nil then
					if (vendre.x-(-background.x+event.x))^2+(vendre.y-50-(-background.y+event.y))^2<10000 then
						test=1
					end
				end
			end
			if pv1clicactiver==1 then
				pv1clicactiver=0
				pv1affinter:removeSelf()
				pv1affinter=nil
				Runtime:removeEventListener( "tap",clicpv1)
			end
			if pv2clicactiver==1 then
				pv2clicactiver=0
				Runtime:removeEventListener( "tap",clicpv2)
			end
			if vagueencours==1 then
				affinfo(0,true)
				if modezombie or modepanique then
					carre.alpha=0.4
					transition.from(carre,{time=500,alpha=0, y=ymaxscreen-actualcontentheight*1.5})
					transition.to(carre,{delay=1500,time=50000,alpha=0})
				end
			end
			local function listener1test(event)	
				--print("le timer voulu")
				if	jeupause.timerlibre[timerdeniv1.timerprionum]==1 then
					jeupause.timerlibre[timerdeniv1.timerprionum]=2
				end
				if(boutondev==1)then
					local batiment = require( "batiment" )
					batiment.supbouton()
				end
				if enconst==1 then
					if event.y~=nil then
					if (nbatiment.x-(-background.y+event.y))^2+(nbatiment.y-(-background.y+event.y))^2<1500 then
						test=1
					else
						removenbat()
					end
				end
				end
				if drapeaugeneclic==0 and drapeausolclic==0 and test==0 then
					--print("etape 3")
					vagsuig.isVisible=false
					-- lancervague1.isVisible=false --12/10/2016
					-- if lancervague1chaine~=nil then
					-- 	lancervague1chaine.isVisible=false
					-- end
					if timerdeniv1.timer1num~=nil then
					jeupause.timerlibre[timerdeniv1.timer1num]=2
					timer.cancel(timer1spawn)
					end
					if nouvague==0 then
						audio.play( son.uicl1)
						print("audio")
						--print("etape 4")
						nouvague=1
						timer2spawn=timer.performWithDelay( 0, listener )
						local date = os.date( "*t" )
						print("creation timer timer2spawn 451 "..date.sec)
						if timerdeniv1.timer2num==nil then
							timerdeniv1.timer2num=timerpause(1,timer2spawn,nil)
						else
							local lenum=timerpause(1,timer2spawn,timerdeniv1.timer2num)
						end
						-- jeupause.timer[timer2num]=timer2spawn
						-- jeupause.timerlibre[timer2num]=1
					end
				end
			end
			timerpriospawn=timer.performWithDelay(25,listener1test)
			local date = os.date( "*t" )
			print("creation timer timerpriospawn 470 "..date.sec)
			if timerdeniv1.timerprionum==nil then
				timerdeniv1.timerprionum=timerpause(1,timerpriospawn,nil)
			else
				local lenum=timerpause(1,timerpriospawn,timerdeniv1.timerprionum)
			end
			-- jeupause.timer[timerprionum]=timerpriospawn
			-- jeupause.timerlibre[timerprionum]=1
		end
	end
	local function timerpriocorrect1(event)
		if nouvague==0 then
			vagsuig.isVisible=true
		end
	end
	timerpriocorrect=timer.performWithDelay(75,timerpriocorrect1)
end
local function tunegainaccfunc(xevent,yevent)
	local event={x=xevent,y=yevent}
	local tunegainpause=timer.pause(timer1spawn)*vitessejeu+(20-timer1spawn.cpt)*1500/accelererenn
	local nb250ms=mathfloor(tunegainpause/250) --chargement des pouvoirs en compensation du temps perdu
	print("nb250ms: "..nb250ms)
	if nb250ms>0 then
		for i=1,nb250ms do
			unchargementpouvoir()
		end
	end
	tunegainpause=tunegainpause*accelererenn
	--print("temps gagner="..tunegainpause)
	if tunegainpause==nil then
		tunegainpause=0
	end
	tunegainpause=mathfloor(tunegainpause*0.001)
	if tunegainpause>60 then
		tunegainpause=0
	end
	local tunegainpause1=tunegainpause
	for i=1,nbbatiment,1 do
		if ibatiment[i].type1==3 and ibatiment[i].niveau>1 then
			--print("bonus gain mine accelerer vague de "..ibatiment[i].argentsec)
			tunegainpause=mathfloor(tunegainpause+tunegainpause1*ibatiment[i].argentsec*0.5)
		end
	end

	if tunegainpause>0 then
		--if vagsui.x~=nil and vagsui.y~=nil then
		local nbpiece=mathfloor(tunegainpause*0.1)
		if nbpiece<1 then
			nbpiece=1
		end
		for i=1,nbpiece ,1 do
			print("Animation piece demander\n\n\n\n")
			local event1={}
			event1.x=(-background.x+event.x)/taille
			event1.y=(-background.y+event.y)/taille
			animgainfric(event1)
			-- local pieceor=display.newImage(imbouton.monnaie,3)
			-- pieceor.x=(-background.x+event.x)/taille+7-mathrandom(15) --pieceor.x=vagsui.x+7-mathrandom(15)
			-- pieceor.y=(-background.y+event.y)/taille+7-mathrandom(15)+10 -- le +10 pour la postion de l'ombre
			-- pieceor.xScale=0.06
			-- pieceor.yScale=pieceor.xScale
			-- pieceor.xscaleevol=-0.01
			-- pieceor.signe=1
			-- pieceor.group=2048 --mathfloor(pieceor.y)+1024+5
			-- group[pieceor.group]:insert(pieceor)
			-- pieceor.cpt=1
			-- local function destrucblood2(event)
			-- 	if pieceor.cpt<40 then
			-- 		pieceor.y=pieceor.y-0.5
			-- 		if -pieceor.yScale>pieceor.xScale then
			-- 			pieceor.signe=-1
			-- 			print("met le signe a -1")
			-- 		elseif pieceor.yScale<pieceor.xScale then
			-- 			pieceor.signe=1
			-- 			print("met le signe a 1")
			-- 		end
			-- 		local xscale=pieceor.xScale+pieceor.xscaleevol*pieceor.signe
			-- 		if xscale>-0.005 and xscale<0.005 then
			-- 			xscale=0.005*-pieceor.signe
			-- 		end
			-- 		pieceor.xScale=xscale
			-- 		if pieceor.cpt>20 then
			-- 			pieceor.alpha=pieceor.alpha-0.05
			-- 		end
			-- 		pieceor.cpt=pieceor.cpt+1
			-- 		local destrucblood2=timer.performWithDelay(30,destrucblood2)
			-- 	else
			-- 		group[pieceor.group]:remove(pieceor) 
			-- 		pieceor:removeSelf()
			-- 		pieceor=nil
			-- 	end
			-- end
			-- local destrucblood2=timer.performWithDelay(30,destrucblood2)
		end
		--end
	end
	--tunegainpause=mathfloor(tunegainpause/dureepartie)
	argent=argent+(-(tunegainpause)*3)
	vartune()
	--tune.text=-argent/3 --.." d'or"
end
function spawndebut(modedelancement)
		--gestion des differentes vagues
		-- local function spawn(vagueencours,soldatencours,pointdepspawn)--permet de spawner plsiers mec en meme temps
		-- 	if removepartiel1==false and removetotal==false then
		-- 		local varlib=0
		-- 		local num=nil
		-- 		k=1
		-- 		while k<=nbsoldat do--permet de ralouer les numero
		-- 			if isoldat[k].remp==1 then
		-- 			--if isoldat[k].vie==-133 and isoldat[k].orientation==1 then
		-- 				varlib=1
		-- 				num=k
		-- 				k=nbsoldat+1
		-- 				--print("numero trouver")
		-- 			end
		-- 			k=k+1
		-- 		end
		-- 		if varlib==0 then
		-- 			nbsoldat=nbsoldat+1
		-- 			num=nbsoldat
		-- 		end
		-- 		local typeso=vague[vagueencours][soldatencours+1]--200+nbsoldat
		-- 		local hello=soldat1.new(num,typeso,0)
		-- 		hello:debut(num,pointdepspawn)
		-- 		if contreai==1 then
		-- 			nbsoldat=nbsoldat+1
		-- 			num=nbsoldat
		-- 			local hello=soldat1.new(num,typeso,0,614.4)
		-- 			hello:debut(num,pointdepspawn)
		-- 		end
		-- 	end
		-- end
		-- if modeinfini==false then
		-- 	print("ici 1")
		-- 	if false or issimulator then -- pour developer true et sinon false (va chercher les vagues dans le fichier level)
		-- 		print("ici 2")
		-- 		local loadsave = require( "loadsave" ) 
		-- 		-- local chainecaract="level"..niveauch..".json"
		-- 		--loadsave.saveTable( vague, "level1.json" )
		-- 		local resul
		-- 		if issimulator then
		-- 			print("lit le fichier 3kingslevel")
		-- 			resul=loadsave.loadTable( "3kingslevel.json")
		-- 		elseif true then ---------------------------------------version developer level designer
		-- 			resul=loadsave.loadTable1( "3kingslevel.json","/mnt/sdcard/3kingslevel.json") --..chainecaract)
		-- 		end
		-- 		-- vague=resul[niveauch] --loadsave.loadTable1( chainecaract,"/mnt/sdcard/level/"..chainecaract)
		-- 		--vague=loadsave.loadTable( chainecaract,system.DocumentsDirectory)
		-- 		-- vague=loadsave.loadTable1( chainecaract,"/mnt/sdcard/"..chainecaract )
		-- 		-- vague=loadsave.loadTable1( chainecaract,"/mnt/local/"..chainecaract )
		-- 		if resul==nil then --vague==nil then
		-- 			print("regene tab")
		-- 			local resultat={}
		-- 			for i=1,16 do
		-- 				local leveltest=nil
		-- 				if i==1 then
		-- 					leveltest=require("level1")
		-- 				elseif i==2 then
		-- 					leveltest=require("level2")
		-- 				elseif i==3 then
		-- 					leveltest=require("level3")
		-- 				elseif i==4 then
		-- 					leveltest=require("level4")
		-- 				elseif i==5 then
		-- 					leveltest=require("level5")
		-- 				elseif i==6 then
		-- 					leveltest=require("level6")
		-- 				elseif i==7 then
		-- 					leveltest=require("level7")
		-- 				elseif i==8 then
		-- 					leveltest=require("level8")
		-- 				elseif i==9 then
		-- 					leveltest=require("level9")
		-- 				elseif i==10 then
		-- 					leveltest=require("level10")
		-- 				elseif i==11 then
		-- 					leveltest=require("level11")
		-- 				elseif i==12 then
		-- 					leveltest=require("level12")
		-- 				elseif i==13 then
		-- 					leveltest=require("level13")
		-- 				elseif i==14 then
		-- 					leveltest=require("level14")
		-- 				elseif i==15 then
		-- 					leveltest=require("level15")
		-- 				elseif i==16 then
		-- 					leveltest=require("level16")
		-- 				end
		-- 				leveltest:vague()
		-- 				vague["fin"]="de niveau"
		-- 				resultat["level"..i]=vague
		-- 				vague=nil
		-- 			end
		-- 			-- level:vague()
		-- 			-- resul[niveauch]=vague
		-- 			if issimulator then
		-- 				print("save")
		-- 				loadsave.saveTable( resultat, "3kingslevel.json")
		-- 			else
		-- 				print("save1")
		-- 				loadsave.saveTable1( resultat, "3kingslevel.json","/mnt/sdcard/3kingslevel.json" )
		-- 			end
		-- 			resultat["level"..niveauch]["fin"]=nil
		-- 			vague=nil
		-- 			vague={}
		-- 			for pos,val in pairs(resultat["level"..niveauch]) do
		-- 			-- for i=1,#resul["level"..niveauch] do
		-- 				print("test"..pos)
		-- 				local posi=pos+0
		-- 				vague[posi]=val -- resul["level"..niveauch][pos]
		-- 			end

		-- 			-- resultat["level"..niveauch]["fin"]=nil
		-- 			-- vague=resultat["level"..niveauch]
		-- 			--loadsave.saveTable1( vague, chainecaract,"/mnt/sdcard/"..chainecaract )
		-- 		else
		-- 			-- if true then -- pour recuperer les données et les ajoutés au fichier level
		-- 			-- 	for i=1,16 do
		-- 			-- 		print("NIVEAU:"..i)
		-- 			-- 		resul["level"..i]["fin"]=nil
		-- 			-- 		for pos,val in pairs(resul["level"..i]) do
		-- 			-- 			local posi=pos+0
		-- 			-- 			local vagueexi="vague["..posi.."]={"
		-- 			-- 			local nouveautruc=""
		-- 			-- 			for j=1,#val do
		-- 			-- 				vagueexi=vagueexi..nouveautruc..val[j]
		-- 			-- 				nouveautruc=","
		-- 			-- 			end
		-- 			-- 			vagueexi=vagueexi.."}"
		-- 			-- 			print(vagueexi)
		-- 			-- 			-- local posi=pos+0
		-- 			-- 			-- vagueexi[posi]=val
		-- 			-- 			-- vague[posi]=val
		-- 			-- 		end
		-- 			-- 	end
		-- 			-- end
		-- 			print("ne regenere pas la table")
		-- 			resul["level"..niveauch]["fin"]=nil
		-- 			vague=nil
		-- 			vague={}
		-- 			for pos,val in pairs(resul["level"..niveauch]) do
		-- 			-- for i=1,#resul["level"..niveauch] do
		-- 				print("test"..pos)
		-- 				local posi=pos+0
		-- 				vague[posi]=val -- resul["level"..niveauch][pos]
		-- 			end
		-- 			if issimulator then
		-- 				print("vague du niveau")
		-- 				local chainecaract=""
		-- 				for i=1,#vague do
		-- 					chainecaract="vague["..i.."]={"
		-- 					for j=1,#vague[i] do
		-- 						chainecaract=chainecaract..vague[i][j]
		-- 						if j~=#vague[i] then
		-- 							chainecaract=chainecaract..","
		-- 						else
		-- 							chainecaract=chainecaract.."}"
		-- 						end
		-- 					end
		-- 					print(chainecaract)
		-- 				end
		-- 				local tuneagagnertt=0
		-- 				local tuneagagnerva=0
		-- 				for i=1,#vague do
		-- 					tuneagagnerva=0
		-- 					for j=1,#vague[i] do
		-- 						if vague[i][j]>=200 then
		-- 							tuneagagnerva=tuneagagnerva+image[vague[i][j]].argent
		-- 						end
		-- 					end
		-- 					print("vague "..i.." rapporte "..tuneagagnerva.." et en reel "..tuneagagnerva/dureepartie)
		-- 					tuneagagnertt=tuneagagnertt+tuneagagnerva
		-- 				end
		-- 				print("au total les vagues rapportent "..tuneagagnertt.." et en reel "..tuneagagnertt/dureepartie)
		-- 			end
		-- 			-- level:vague()
		-- 		end
		-- 	else
		-- 		print("ici")
		-- 		level:vague()
		-- 	end
		-- end
		--local soldatt=require("soldat")
		--local i=-1--0 
		-- vagueencours=1
		-- print("vagueencours"..vagueencours.." esperer 1")
		-- if modeinfini then
		-- 	print("test1 modeinfini")
		-- else
		-- 	print("test mode normal")
		-- end
		-- -- if modedelancement~=0 and modeinfini==true then
		-- -- 	vaguesuivanteinf(vagueencours)
		-- -- end
		-- -- if modeinfini then
		-- -- 	vaguesuivanteinf(vagueencours)
		-- -- end
		-- --vaguesuivanteinf(vagueencours+1)
		-- local vagueinftext=vagueencours-1
		-- if modeinfini==false then
		-- 	vagueinf.text=vagueinftext.."/"..nbvague
		-- else
		-- 	vagueinf.text=vagueinftext
		-- end
		-- soldatencours=1
		-- --local j=1  
		-- --local nbva=10--nombre de vague pas utiliser
		-- timerdeniv1={}
		-- timer2spawn=nil
		-- timer1spawn=nil
		-- timerpriospawn=nil
		-- nouvague=0-- -1 pour vague en cours 0 vague fini et 1 nouvelle vague demander
		-- timerdeniv1.timer2num=nil
		-- timerdeniv1.timer1num=nil
		-- timerdeniv1.timerprionum=nil
		-- -- local timer2spawn=nil
		-- -- local timer1spawn=nil
		-- -- local timerpriospawn=nil
		-- -- local nouvague=0-- -1 pour vague en cours 0 vague fini et 1 nouvelle vague demander
		-- -- local timer2num=nil
		-- -- local timer1num=nil
		-- -- local timerprionum=nil
		-- --local i=1
		-- finparttest=false
		-- while i<=jeupause.timernb do
		-- 	if jeupause.timerlibre[i]==0 then
		-- 		if timer1num==nil then
		-- 			timer1num=i
		-- 		elseif timer2num==nil then
		-- 			timer2num=i
		-- 		elseif timerprionum==nil then
		-- 			timerprionum=i
		-- 		else
		-- 		i=jeupause.timernb+1
		-- 		end
		-- 	else
		-- 		i=i+1
		-- 	end
		-- end
		-- if timer1num==nil then
		-- 	jeupause.timernb=jeupause.timernb+1
		-- 	timer1num=jeupause.timernb
		-- 	jeupause.timernb=jeupause.timernb+1
		-- 	timer2num=jeupause.timernb
		-- 	jeupause.timernb=jeupause.timernb+1
		-- 	timerprionum=jeupause.timernb
		-- elseif timer2num==nil then
		-- 	jeupause.timernb=jeupause.timernb+1
		-- 	timer2num=jeupause.timernb
		-- 	jeupause.timernb=jeupause.timernb+1
		-- 	timerprionum=jeupause.timernb
		-- elseif timerprionum==nil then
		-- 	jeupause.timernb=jeupause.timernb+1
		-- 	timerprionum=jeupause.timernb
		-- end
		-- local function listener( event )
		-- 	if jeupause.timerlibre[timerdeniv1.timer2num]==1 then
		-- 		jeupause.timerlibre[timerdeniv1.timer2num]=2
		-- 	end
		-- 	if nouvague==1 then
		-- 		if modeinfini then
		-- 			--print("vagueencours "..vagueencours)
		-- 			vaguesuivanteinf(vagueencours)
		-- 		end
		-- 		if modeinfini==false then
		-- 			vagueinf.text=vagueencours.."/"..nbvague
		-- 		else
		-- 			vagueinf.text=vagueencours
		-- 		end
		-- 		soldatencours=0
		-- 		nouvague=-1
		-- 	end
		-- 	if soldatencours>=0 and soldatencours<=#vague[vagueencours]-1 then -- -1 pour spawn entrer 2, -2 pour 3...    0 a 5 pour premier points de spawn
		-- 		local cptpointchelou=1
		-- 		if vague[vagueencours][soldatencours+1]<=-10 then
		-- 			--print("ici bug ou pas")
		-- 			cptpointchelou=-vague[vagueencours][soldatencours+1]-8
		-- 			soldatencours=soldatencours+1
		-- 		end
		-- 		for i=1,cptpointchelou do
		-- 			local pointdepspawn=1
		-- 			if vague[vagueencours][soldatencours+1]<0 then
		-- 				pointdepspawn=-vague[vagueencours][soldatencours+1]+1
		-- 				soldatencours=soldatencours+1
		-- 			end
		-- 			if vague[vagueencours][soldatencours+1]>1 then
		-- 				if vague[vagueencours][soldatencours+1]>10 then
		-- 					spawn(vagueencours,soldatencours,pointdepspawn)
		-- 		    	else
		-- 		    		local i3=1
		-- 		    		while i3<=vague[vagueencours][soldatencours+1] do
		-- 		    			spawn(vagueencours,soldatencours+i3,pointdepspawn)
		-- 		    			i3=i3+1
		-- 		    		end
		-- 		    		soldatencours=soldatencours+i3-1
		-- 		    	end
		-- 			end
		-- 			soldatencours=soldatencours+1
		-- 		end
		-- 			if lancervague1.isVisible==false then --and i==cptpointchelou then
		-- 				if vague[vagueencours][soldatencours]>=1 then
		-- 					timer2spawn=timer.performWithDelay( 1000/accelererenn*vitessejeuin, listener )
		-- 					-- jeupause.timer[timer2num]=timer2spawn
		-- 					-- jeupause.timerlibre[timer2num]=1
		-- 					if timerdeniv1.timer2num==nil then
		-- 						timerdeniv1.timer2num=timerpause(1,timer2spawn,nil)
		-- 					else
		-- 						local lenum=timerpause(1,timer2spawn,timerdeniv1.timer2num)
		-- 					end
		-- 				else
		-- 					timer2spawn=timer.performWithDelay( 3000/accelererenn*vitessejeuin, listener )
		-- 					--jeupause.timer[timer2num]=timer2spawn
		-- 					--jeupause.timerlibre[timer2num]=1
		-- 					if timerdeniv1.timer2num==nil then
		-- 						timerdeniv1.timer2num=timerpause(1,timer2spawn,nil)
		-- 					else
		-- 						local lenum=timerpause(1,timer2spawn,timerdeniv1.timer2num)
		-- 					end
		-- 				end
		-- 			else
		-- 				print("remise a zero correctif de bug de lancer vague suivante")
		-- 				vagueencours=1
		-- 				local vagueinftext=vagueencours-1
		-- 				if modeinfini==false then
		-- 					vagueinf.text=vagueinftext.."/"..nbvague
		-- 				else
		-- 					vagueinf.text=vagueinftext
		-- 				end
		-- 				soldatencours=1
		-- 			end
		-- 		--end
		-- 	end
		-- 	if vagueencours<nbvague or modeinfini then
		-- 		--print("vagueencours"..vagueencours)
		-- 		if soldatencours>#vague[vagueencours]-1 then
		-- 			soldatencours=-1
		-- 			vagueencours=vagueencours+1
		-- 			--print("vagueencours=vagueencours+1")
		-- 			if modeinfini then
		-- 				--print("vagueencours "..vagueencours)
		-- 				if vague[vagueencours]==nil then
		-- 					vague[vagueencours]={}
		-- 				end
		-- 				vague[vagueencours].nb=5
		-- 				--vaguesuivanteinf(vagueencours)
		-- 			end
		-- 			--vagueinf.text=vagueencours.."/"..nbvague
		-- 			nouvague=0
		-- 			vagsuig.isVisible=true
		-- 			local function timer2func(event)
		-- 				if event.source.cpt>=18 then
		-- 					timer1spawn=timer.performWithDelay( 1500/accelererenn*vitessejeuin, vaguesuivante )
		-- 					timerdeniv1.timer1num=timerpause(1,timer1spawn,timerdeniv1.timer1num)
		-- 					timer1spawn.cpt=event.source.cpt+1
		-- 				else
		-- 					timer1spawn=timer.performWithDelay( 1500/accelererenn*vitessejeuin, timer2func )
		-- 					timerdeniv1.timer1num=timerpause(1,timer1spawn,timerdeniv1.timer1num)
		-- 					timer1spawn.cpt=event.source.cpt+1
		-- 				end
		-- 			end
		-- 			timer1spawn=timer.performWithDelay( 1500/accelererenn*vitessejeuin, timer2func )
		-- 			timer1spawn.cpt=1
		-- 			timerdeniv1.timer1num=timerpause(1,timer1spawn,timerdeniv1.timer1num)
		-- 			-- jeupause.timer[timer1num]=timer1spawn
		-- 			-- jeupause.timerlibre[timer1num]=1
		-- 		end
		-- 	else
		-- 		--print("etape0"..i.." "..j.."nb"..vague[j].nb)
		-- 		if soldatencours>#vague[vagueencours]-1 then
		-- 			--print("etape1")
		-- 			if finparttest==false then
		-- 				finparttest=true
		-- 				--print("lancement des tests"..i)
		-- 				local function listenergagner(event)
		-- 					--print("deb test gagner")
		-- 					if jeupause.timerlibre[numtimergagner]==1 then
		-- 						jeupause.timerlibre[numtimergagner]=2
		-- 					end
		-- 					if findelapartie==false and removepartiel1==false then
		-- 						--print("test gagner")
		-- 						local gagner=0
		-- 						local nb=1
		-- 						while nb<=nbsoldat do
		-- 							if isoldat[nb].orientation==1 and isoldat[nb].vivant==true then
		-- 								gagner=1
		-- 								nb=nbsoldat
		-- 							end
		-- 							nb=nb+1
		-- 						end
		-- 						if gagner==0 then
		-- 							--timer.cancel(listenergagner)
		-- 							--print("test reussi")
		-- 							findelapartie=true
		-- 							appuipause()
		-- 							affmenuconf(3)
		-- 						else
		-- 							--print("relancer test gagné")
		-- 							listenergagner1=timer.performWithDelay(750,listenergagner)
		-- 							timerpause(1,listenergagner1,numtimergagner)
		-- 						end
		-- 					end
		-- 				end
		-- 				listenergagner1=timer.performWithDelay(750,listenergagner)
		-- 				numtimergagner=timerpause(1,listenergagner1,nil)
		-- 			end
		-- 		end
		-- 	end
		-- end
		-- local function vaguesuiclic(event)
		-- 	--print("vaguesuiclic")
		-- 	if jeupause.etat==0 then
		-- 		--print("pv1clic"..pv1clic.."pv2clic"..pv2clic.."pv3clic"..pv3clic.."clicconstruire"..clicconstruire.."clicinfanterie"..clicinfanterie.."clicarcher"..clicarcher.."clicpouvoir1"..clicpouvoir1.."clicpouvoir2"..clicpouvoir2.."clicpouvoir3"..clicpouvoir3.."pv1clicactiver"..pv1clicactiver.."pv2clicactiver"..pv2clicactiver)
		-- 		if(fenaff==false and pv1clic==0 and pv2clic==0 and pv3clic==0 and clicconstruire==0 and clicinfanterie==0 and clicarcher==0 and clicpouvoir1==0 and clicpouvoir2==0 and clicpouvoir3==0 and pv1clicactiver==0 and pv2clicactiver==0 )then	--				
		-- 			--print("test passer")
					
		-- 			local test=0
		-- 			if boutondev~=0 then
		-- 				if vendre~=nil then
		-- 					if (vendre.x-(-background.x+event.x))^2+(vendre.y-50-(-background.y+event.y))^2<10000 then
		-- 						test=1
		-- 					end
		-- 				end
		-- 			end
		-- 			if pv1clicactiver==1 then
		-- 				pv1clicactiver=0
		-- 				pv1affinter:removeSelf()
		-- 				pv1affinter=nil
		-- 				Runtime:removeEventListener( "tap",clicpv1)
		-- 			end
		-- 			if pv2clicactiver==1 then
		-- 				pv2clicactiver=0
		-- 				Runtime:removeEventListener( "tap",clicpv2)
		-- 			end
		-- 			if vagueencours==1 then
		-- 				if modezombie or modepanique then
		-- 					carre.alpha=0.4
		-- 					transition.from(carre,{time=500,alpha=0, y=ymaxscreen-actualcontentheight*1.5})
		-- 				end
		-- 			end
		-- 			local function listener1(event)	
		-- 				--print("le timer voulu")
		-- 				if	jeupause.timerlibre[timerdeniv1.timerprionum]==1 then
		-- 					jeupause.timerlibre[timerdeniv1.timerprionum]=2
		-- 				end
		-- 				if(boutondev==1)then
		-- 					local batiment = require( "batiment" )
		-- 					batiment.supbouton()
		-- 				end
		-- 				if enconst==1 then
		-- 					if event.y~=nil then
		-- 					if (nbatiment.x-(-background.y+event.y))^2+(nbatiment.y-(-background.y+event.y))^2<1500 then
		-- 						test=1
		-- 					else
		-- 						removenbat()
		-- 					end
		-- 				end
		-- 				end
		-- 				if drapeaugeneclic==0 and drapeausolclic==0 and test==0 then
		-- 					--print("etape 3")
		-- 					vagsuig.isVisible=false
		-- 					lancervague1.isVisible=false
		-- 					if timerdeniv1.timer1num~=nil then
		-- 					jeupause.timerlibre[timerdeniv1.timer1num]=2
		-- 					timer.cancel(timer1spawn)
		-- 					end
		-- 					if nouvague==0 then
		-- 						audio.play( son.uicl1)
		-- 						print("audio")
		-- 						--print("etape 4")
		-- 						nouvague=1
		-- 						timer2spawn=timer.performWithDelay( 0, listener )
		-- 						if timerdeniv1.timer2num==nil then
		-- 							timerdeniv1.timer2num=timerpause(1,timer2spawn,nil)
		-- 						else
		-- 							local lenum=timerpause(1,timer2spawn,timerdeniv1.timer2num)
		-- 						end
		-- 						-- jeupause.timer[timer2num]=timer2spawn
		-- 						-- jeupause.timerlibre[timer2num]=1
		-- 					end
		-- 				end
		-- 			end
		-- 			timerpriospawn=timer.performWithDelay(25,listener1)
		-- 			if timerdeniv1.timerprionum==nil then
		-- 				timerdeniv1.timerprionum=timerpause(1,timerpriospawn,nil)
		-- 			else
		-- 				local lenum=timerpause(1,timerpriospawn,timerdeniv1.timerprionum)
		-- 			end
		-- 			-- jeupause.timer[timerprionum]=timerpriospawn
		-- 			-- jeupause.timerlibre[timerprionum]=1
		-- 		end
		-- 	end
		-- 	local function timerpriocorrect1(event)
		-- 		if nouvague==0 then
		-- 			vagsuig.isVisible=true
		-- 		end
		-- 	end
		-- 	timerpriocorrect=timer.performWithDelay(75,timerpriocorrect1)
		-- end
		function vagsuig:tap(event)
			if jeupause.etat==0 then
				--print("pv1clic"..pv1clic.."pv2clic"..pv2clic.."pv3clic"..pv3clic.."clicconstruire"..clicconstruire.."clicinfanterie"..clicinfanterie.."clicarcher"..clicarcher.."clicpouvoir1"..clicpouvoir1.."clicpouvoir2"..clicpouvoir2.."clicpouvoir3"..clicpouvoir3.."pv1clicactiver"..pv1clicactiver.."pv2clicactiver"..pv2clicactiver)
				if (fenaff==false and pv1clic==0 and pv2clic==0 and pv3clic==0 and clicconstruire==0 and clicinfanterie==0 and clicarcher==0 and clicpouvoir1==0 and clicpouvoir2==0 and clicpouvoir3==0 and pv1clicactiver==0 and pv2clicactiver==0 and geneclic==0 and drapeaugeneclic==0 and drapeausolclic==0 )then	--				
					print("clique sur le bouton")
					local tutoactioninf=false
					if tutoaction~=nil then
						if tutoaction>2 then
							tutoactioninf=true
						end
					end
					if tuto==0 or niveauch>1 or tutoactioninf then
						if tuto==0 or tuto==1 then
							if jeupause.etat==1 then
								appuipause()
								bpaccnorm()
							end
							print("tuto 0")
						end
						if clicsurqqc==false and jeupause.etat==0 then
							vagsuig.isVisible=false
							lancervague1.isVisible1=false
							lancervague1.isVisible=false
							if lancervague1chaine~=nil then
								lancervague1chaine.isVisible=false
							end
							numtapb=0
							if vagueencours~=1 then
								tunegainaccfunc(event.x,event.y)
								--audio.play( son.uicl1)
								print("accelerer")
								-- if modeinfini==true then
								-- 	clicacce=1
								-- end
								-- tunegainpause=timer.pause(timer1spawn)*vitessejeu+(20-timer1spawn.cpt)*1500/accelererenn

								-- local nb250ms=mathfloor(tunegainpause/250) --chargement des pouvoirs en compensation du temps perdu
								-- print("nb250ms: "..nb250ms)
								-- if nb250ms>0 then
								-- 	for i=1,nb250ms do
								-- 		if removetotal==false then
								-- 			if removepartiel1==false then--normalement non necessaire a voir pourquoi on est obliger de le mettre
								-- 				if pouvoirdisp>0 then
								-- 					if pv1cpt<tchpv1 then
								-- 						pv1ch.height=pv1ch.height-200*pouvoir1.xScale/tchpv1--tchpv1 est le temps de chargement du pouvoir 1 en sec
								-- 						pv1cpt=pv1cpt+0.25
								-- 					else
								-- 						pv1cl.isVisible=true
								-- 					end
								-- 					if pouvoirdisp>1 then
								-- 						if pv2cpt<tchpv2 then
								-- 							pv2ch.height=pv2ch.height-200*pouvoir1.xScale/tchpv2
								-- 							pv2cpt=pv2cpt+0.25
								-- 						else
								-- 							pv2cl.isVisible=true
								-- 						end
								-- 						if pouvoirdisp>2 then
								-- 							if pv3cpt<tchpv3 then
								-- 								if pouvoir3activer==0 then
								-- 									pv3ch.height=pv3ch.height-200*pouvoir1.xScale/tchpv3
								-- 									pv3cpt=pv3cpt+0.25
								-- 								end
								-- 							else
								-- 								pv3cl.isVisible=true
								-- 							end
								-- 						end
								-- 					end
								-- 				end
								-- 			end
								-- 		end
								-- 	end
								-- end
								-- tunegainpause=tunegainpause*accelererenn
								-- --print("temps gagner="..tunegainpause)
								-- tunegainpause=mathfloor(tunegainpause/1000)
								-- if tunegainpause>60 then
								-- 	tunegainpause=0
								-- end
								-- local tunegainpause1=tunegainpause
								-- for i=1,nbbatiment,1 do
								-- 	if ibatiment[i].type1==3 and ibatiment[i].niveau>1 then
								-- 		--print("bonus gain mine accelerer vague de "..ibatiment[i].argentsec)
								-- 		tunegainpause=mathfloor(tunegainpause+tunegainpause1*ibatiment[i].argentsec*0.5)
								-- 	end
								-- end

								-- if tunegainpause>0 then
								-- 	--if vagsui.x~=nil and vagsui.y~=nil then
								-- 	local nbpiece=mathfloor(tunegainpause/10)
								-- 	if nbpiece<1 then
								-- 		nbpiece=1
								-- 	end
								-- 	for i=1,nbpiece ,1 do
								-- 		local pieceor=display.newImage(imbouton.pieceor,1)
								-- 		pieceor.x=(-background.x+event.x)/taille+7-mathrandom(15) --pieceor.x=vagsui.x+7-mathrandom(15)
								-- 		pieceor.y=(-background.y+event.y)/taille+7-mathrandom(15)+10 -- le +10 pour la postion de l'ombre
								-- 		pieceor.xScale=0.1
								-- 		pieceor.yScale=0.1
								-- 		pieceor.xscaleevol=-0.02
								-- 		pieceor.group=2048 --mathfloor(pieceor.y)+1024+5
								-- 		group[pieceor.group]:insert(pieceor)
								-- 		pieceor.cpt=1
								-- 		local function destrucblood2(event)
								-- 			if pieceor.cpt<40 then
								-- 				--if pieceor.cpt<13 then
								-- 					pieceor.y=pieceor.y-0.5
								-- 				--	pieceor.x=pieceor.x-1
								-- 				--elseif pieceor.cpt>15 then
								-- 				--	pieceor.y=pieceor.y+1
								-- 				--	pieceor.x=pieceor.x-1
								-- 				--end
								-- 				local xscale=pieceor.xScale+pieceor.xscaleevol
								-- 				if xscale>-0.01 and xscale<0.01 then
								-- 					xscale=0.01
								-- 				end
								-- 				pieceor.xScale=xscale
								-- 				if pieceor.xScale>=0.1 then
								-- 					pieceor.xscaleevol=-0.02
								-- 				elseif pieceor.xScale<=-0.1 then
								-- 					pieceor.xscaleevol=0.02
								-- 				end
								-- 				if pieceor.cpt>20 then
								-- 					pieceor.alpha=pieceor.alpha-0.05
								-- 				end
								-- 				pieceor.cpt=pieceor.cpt+1
								-- 				local destrucblood2=timer.performWithDelay(30,destrucblood2)
								-- 			else
								-- 				group[pieceor.group]:remove(pieceor) 
								-- 				pieceor:removeSelf()
								-- 				pieceor=nil
								-- 			end
								-- 		end
								-- 		local destrucblood2=timer.performWithDelay(30,destrucblood2)
								-- 	end
								-- 	--end
								-- end
								-- --tunegainpause=mathfloor(tunegainpause/dureepartie)
								-- argent=argent+(-(tunegainpause)*3)
								-- tune.text=-argent/3 --.." d'or"
							else
								-- print("tutoaction "..tutoaction.."tuto "..tuto)
								if tuto==2 then
									--print("spawnfile 1213 tutoaction "..tutoaction)
									if tutoaction==3 or tutoaction==6 or tutoaction==11 then
										print("start tuto")
										actionfaite()
									end
								end
								debutpartie=gettime()
								bpaccnorm()
							end
							vaguesuiclic(event)
						end
						-- if jeupause.etat==0 then
							-- if(fenaff==false and pv1clic==0 and pv2clic==0 and pv3clic==0 and clicconstruire==0 and clicinfanterie==0 and clicarcher==0 and clicpouvoir1==0 and clicpouvoir2==0 and clicpouvoir3==0 and pv1clicactiver==0 and pv2clicactiver==0 )then	--				

							-- local test=0
							-- if boutondev~=0 then
							-- 	if (vendre.x-vagsui.x)^2+(vendre.y-50-vagsui.y)^2<10000 then
							-- 		test=1
							-- 	end
							-- end
							-- if pv1clicactiver==1 then
							-- 	pv1clicactiver=0
							-- 	pv1affinter:removeSelf()
							-- 	Runtime:removeEventListener( "tap",clicpv1)
							-- end
							-- if pv2clicactiver==1 then
							-- 	pv2clicactiver=0
							-- 	Runtime:removeEventListener( "tap",clicpv2)
							-- end
							-- local function listener1(event)	
							-- 	if	jeupause.timerlibre[timerprionum]==1 then
							-- 		jeupause.timerlibre[timerprionum]=2
							-- 	end
							-- 	if(boutondev==1)then
							-- 		local batiment = require( "batiment" )
							-- 		batiment.supbouton()
							-- 	end
							-- 	if enconst==1 then
							-- 		if (nbatiment.x-vagsui.x)^2+(nbatiment.y-vagsui.y)^2<1500 then
							-- 			test=1
							-- 		else
							-- 			removenbat()
							-- 		end
							-- 	end
							-- 	if drapeaugeneclic==0 and drapeausolclic==0 and test==0 then
							-- 		vagsuig.isVisible=false
							-- 		lancervague1.isVisible=false
							-- 		jeupause.timerlibre[timer1num]=2
							-- 		timer.cancel(timer1spawn)
							-- 		if nouvague==0 then
							-- 			nouvague=1
							-- 			timer2spawn=timer.performWithDelay( 0, listener )
							-- 			if timer2num==nil then
							-- 				timer2num=timerpause(1,timer2spawn,nil)
							-- 			else
							-- 				local lenum=timerpause(1,timer2spawn,timer2num)
							-- 			end
							-- 			-- jeupause.timer[timer2num]=timer2spawn
							-- 			-- jeupause.timerlibre[timer2num]=1
							-- 		end
							-- 	end
							-- end
							-- timerpriospawn=timer.performWithDelay(25,listener1)
							-- if timerprionum==nil then
							-- 	timerprionum=timerpause(1,timerpriospawn,nil)
							-- else
							-- 	local lenum=timerpause(1,timerpriospawn,timerprionum)
							-- end
							-- -- jeupause.timer[timerprionum]=timerpriospawn
							-- -- jeupause.timerlibre[timerprionum]=1
							-- end
						-- end
					end
				end
			end
		end
		if not functionload or vaguesuivante==nil then
			function vaguesuivante( event )

				if jeupause.etat==0 then -- modif du 21/11
					print("niveau1 2225 bug?")
				end
				if jeupause.timerlibre[timerdeniv1.timer1num]==1 then
					jeupause.timerlibre[timerdeniv1.timer1num]=2
				end
				vagsuig.isVisible=false
				lancervague1.isVisible=false
				lancervague1.isVisible1=false
				if lancervague1chaine~=nil then
					lancervague1chaine.isVisible=false
				end
				if nouvague==0 then
					nouvague=1
					timer2spawn=timer.performWithDelay( 0, listener )
					local date = os.date( "*t" )
					print("creation timer timer2spawn 1292 "..date.sec)
					-- jeupause.timer[timer2num]=timer2spawn
					-- jeupause.timerlibre[timer2num]=1
					if timerdeniv1.timer2num==nil then
						timerdeniv1.timer2num=timerpause(1,timer2spawn,nil)
					else
						local lenum=timerpause(1,timer2spawn,timerdeniv1.timer2num)
					end
				end
				--end
			end
		end
		timer1spawn=timer.performWithDelay( 2000000, listener )
		local date = os.date( "*t" )
		print("creation timer timer1spawn 1297 "..date.sec)
		timer1spawn.cpt=20

		if timerdeniv1.timer1num==nil then
			timerdeniv1.timer1num=timerpause(1,timer1spawn,nil)
		else
			local lenum=timerpause(1,timer1spawn,timerdeniv1.timer1num)
		end
			-- jeupause.timer[timer1num]=timer1spawn
			-- jeupause.timerlibre[timer1num]=1
		if modedelancement==0 then
			vagsuig:addEventListener( "tap", vagsuig )--lancement de l'ecoute sur le bouton play
		end
		if not functionload or lancervague11==nil then
			function lancervague11int(event)

				-- 	clicsurqqcfunc()
				-- 	clicconstruire=1--permet d'integrer le systeme de priorité
				-- 	-- if draptap==0 then
				-- 	-- drappos[boutondev1.num].isVisible=false
				-- local function cconstruire1( event )
				-- 	clicsurqqcfunc()
				-- 	clicconstruire=0
				-- end
				-- local cconstruire11=timer.performWithDelay( 50, cconstruire1 )
				if jeupause.etat==0 then
					-- ici bpacc.isVisible=
					--audio.play( son.uicl1)
					audio.play( son.uicl2)
					bpaccnorm()
					vagsuig.isVisible=false
					local completedisplancervague1=function(obj)
						lancervague1.isVisible=false
						if lancervague1chaine~=nil then
							lancervague1chaine.isVisible=false
						end
					end
					lancervague1.isVisible1=false
					transition.to(lancervague1,{time=500,transition=easing.outQuad, y=yminscreen-lancervague1.yScale*lancervague1.height*0.5,onComplete=completedisplancervague1,onCancel=completedisplancervague1})
					--lancervague1.isVisible=false
					if lancervague1chaine~=nil then
						transition.to(lancervague1chaine,{time=500,transition=easing.outQuad, y=yminscreen-lancervague1chaine.yScale*lancervague1chaine.height*0.5})
					end
					nouvague=0
					vagueencours=1
					debutpartie=gettime()
					vaguesuiclic(event)
					-- ici
				else
					lancervague1.fill.effect = "filter.sepia"
					lancervague1.fill.effect.intensity =-1
					transition.to(lancervague1.fill.effect, { time=500, intensity=0 } ) 
					audio.play( son.uicl3)
				end
				clicsurqqcfunc()
				clicconstruire=1--permet d'integrer le systeme de priorité
				-- if draptap==0 then
				-- drappos[boutondev1.num].isVisible=false
				local function cconstruire1( event )
					clicsurqqcfunc()
					clicconstruire=0
				end
				local cconstruire11=timer.performWithDelay( 50, cconstruire1 )

				-- if findelapartie==false and jeupause.etat==0 then
				-- 	if jeupause.timerlibre[timer1num]==1 then
				-- 		jeupause.timerlibre[timer1num]=2
				-- 	end
				-- 	vagsuig.isVisible=false
				-- 	lancervague1.isVisible=false
				-- 	if nouvague==0 then
				-- 		nouvague=1
				-- 		timer2spawn=timer.performWithDelay( 0, listener )
				-- 		if timer2num==nil then
				-- 			timer2num=timerpause(1,timer2spawn,nil)
				-- 		else
				-- 			local lenum=timerpause(1,timer2spawn,timer2num)
				-- 		end
				-- 		-- jeupause.timer[timer2num]=timer2spawn
				-- 		-- jeupause.timerlibre[timer2num]=1
				-- 	end
				-- end
			end
			function lancervague11(event)
				if lancervague1.isVisible1 then
					-- print("tutoaction1 "..tutoaction.."tuto "..tuto)
					if tuto==2 then
						--print("spawnfile 1390 tutoaction "..tutoaction)
						if tutoaction==3 or tutoaction==6 or tutoaction==11 then
							print("start tuto")
							actionfaite()
						end
					end
					if tuto==0 then
						if jeupause.etat==1 then
							appuipause()
						end
					end
					numtapb=0
					lancervague11int(event)
				end
			end
		end
		if modedelancement==0 then
			lancervague1:addEventListener("tap",lancervague11)
		end
end
function t.new()

end
return t	