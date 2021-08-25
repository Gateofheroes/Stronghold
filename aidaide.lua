local t = {}
	
	local ordredecreation={} --{1302,5101,5102,2201,2202,3101,5103,4201,4212,2203,3102,4213,5104,2204,3103,4214,3104}


	-- local ordredecreation={}
	-- ordredecreation[1]=1101 --1 pour le numero de l'ordre
	-- ordredecreation[2]=2201 --le dernier chiffre correspond du niveau, type2 l'avant dernier, type1 le 3eme dernier et les restants sont le numero de bat
	-- ordredecreation[3]=1102
	-- ordredecreation[4]=3101
	-- ordredecreation[5]=2212 
	-- ordredecreation[6]=3112
	-- ordredecreation[7]=1103
	local ordredecreationco={}
	-- ordredecreationco[1]={} -- 1 pour les coordonnees de la crea du bat 1
	-- ordredecreationco[1].x=-176
	-- ordredecreationco[1].y=-95
	-- ordredecreationco[2]={} -- 1 pour les coordonnees de la crea du bat 1
	-- ordredecreationco[2].x=-176
	-- ordredecreationco[2].y=-11
	-- ordredecreationco[3]={} -- 1 pour les coordonnees de la crea du bat 1
	-- ordredecreationco[3].x=-75
	-- ordredecreationco[3].y=-90
	-- ordredecreationco[4]={} -- 1 pour les coordonnees de la crea du bat 1
	-- ordredecreationco[4].x=-73
	-- ordredecreationco[4].y=-9
	-- ordredecreationco[5]={} -- 1 pour les coordonnees de la crea du bat 1
	-- ordredecreationco[5].x=100
	-- ordredecreationco[5].y=-9
	-- ordredecreationco[6]={} -- 1 pour les coordonnees de la crea du bat 1
	-- ordredecreationco[6].x=100
	-- ordredecreationco[6].y=-90
	local numtimer
t.aidaide = function ()
	--if not functionload or modedelancement==0 then
		function iniai()
			if contreaihaut==1 then
				local fichierordredecrea=require("ordredecrea")
				ordredecreation,ordredecreationco=geneordredecrea(niveauch)
			else
				print("initialisation de l'aide"..mineinfo.nb)
				if mineinfo.nb==0 then
					ordredecreation={1101,1102,2201,2202,3101,1103,4201,4212,2203,3102,4213,1104,2204,3103,4214,3104,5201,5212,6101,5213,6122,6123,5214,6124}
				elseif mineinfo.nb==1 then
					ordredecreation={1302,2201,2202,3101,4201,4212,2203,3102,4213,1303,2204,3103,4214,3104,5201,5212,6101,5213,6122,6123,5214,6124}
				else
					ordredecreation={1302,3101,4201,4212,3102,4213,3103,4214,3104,1303,5201,5212,6101,5213,2302,6122,6123,5214,6124}
				end
				if modenormal then
					if contreai==0 and contreaihaut==0 and modezombie==false and modepanique==false then
						if ordredecreationco==nil then
							ordredecreationco={} 
						end
						if niveauch==7 then
							if race==0 then
								ordredecreation={1101,1102,1103,1104,1105}
							elseif race==1 then
								ordredecreation={1101,1122,1123,1124,1125}
							else
								ordredecreation={1101,1112,1113,1114,1115}
							end
							ordredecreationco[1]={} -- 1 pour les coordonnees de la crea du bat 1
							if not goh then
								ordredecreationco[1].x=-270
								ordredecreationco[1].y=-60
							else
								ordredecreationco[1].x=-190
								ordredecreationco[1].y=-60
							end
						elseif niveauch==8 then
							--ordredecreation={1302,2302,1303,2303,2304}
							if race==0 then
								ordredecreation={1302,2302,3201,3212,3213,3214}
							elseif race==1 then
								ordredecreation={1302,2302,3201,3202,3203,3204}
							else
								ordredecreation={1302,2302,3201,3222,3223,3224}
							end
							ordredecreationco[1]={} -- 1 pour les coordonnees de la crea du bat 1
							ordredecreationco[1].x=0
							ordredecreationco[1].y=0
							ordredecreationco[2]={} -- 1 pour les coordonnees de la crea du bat 1
							ordredecreationco[2].x=0
							ordredecreationco[2].y=0
							ordredecreationco[3]={} -- 1 pour les coordonnees de la crea du bat 1
							ordredecreationco[3].x=0
							if not goh then
								if race==2 then
									ordredecreationco[3].y=5
								else
									ordredecreationco[3].y=-25
								end
							else
								ordredecreationco[3].y=-40
								if race==2 then
									ordredecreationco[3].x=-110
								end
							end
						elseif niveauch==11 then
							ordredecreation={1101,2101,3201,4201,4201}
							ordredecreationco[1]={}
							if not goh then
								ordredecreationco[1].x=460
								ordredecreationco[1].y=-210
							else
								ordredecreationco[1].x=460
								ordredecreationco[1].y=-210
							end
							ordredecreationco[2]={}
							if not goh then
								ordredecreationco[2].x=-260
								ordredecreationco[2].y=-20
							else
								ordredecreationco[2].x=-290
								ordredecreationco[2].y=-20
							end
							ordredecreationco[3]={}
							if not goh then
								ordredecreationco[3].x=360
								ordredecreationco[3].y=-120
							else
								ordredecreationco[3].x=360
								ordredecreationco[3].y=-120
							end
							ordredecreationco[4]={}
							if not goh then
								ordredecreationco[4].x=-120
								ordredecreationco[4].y=-20
							else
								ordredecreationco[4].x=-120
								ordredecreationco[4].y=-50
							end
						elseif niveauch==12 then
							ordredecreation={1302,1303,1304,2201,2202,2202}
							ordredecreationco[1]={}
							ordredecreationco[1].x=0
							ordredecreationco[1].y=0
							ordredecreationco[2]={}
							ordredecreationco[2].x=-310
							ordredecreationco[2].y=220
							niveau12cercle=1
						elseif niveauch==13 then
							print("apparaiton bat du niveau")
							ordredecreation={1101,2101,1112,2122,2122}
							ordredecreationco[1]={}
							if not goh then
								ordredecreationco[1].x=449
								ordredecreationco[1].y=118
							else
								ordredecreationco[1].x=479
								ordredecreationco[1].y=60
							end
							ordredecreationco[2]={}
							ordredecreationco[2].x=400 --380
							ordredecreationco[2].y=-110 -- -242
						elseif niveauch==16 and not goh then
							print("apparaiton bat du niveau")
							ordredecreation={1101,2101,3201,4201,5101,1112,2122,3212,4202,1113,2123,3213,4203,1114,2124,3214,4204,1204}
							ordredecreationco[1]={}
							ordredecreationco[1].x=0
							ordredecreationco[1].y=-120
							ordredecreationco[2]={}
							ordredecreationco[2].x=450
							ordredecreationco[2].y=-170
							ordredecreationco[3]={}
							ordredecreationco[3].x=20
							ordredecreationco[3].y=-50
							ordredecreationco[4]={}
							ordredecreationco[4].x=565
							ordredecreationco[4].y=-60
							ordredecreationco[5]={}
							ordredecreationco[5].x=0
							ordredecreationco[5].y=100
						elseif niveauch==17 then
							print("apparaiton bat du niveau")
							ordredecreation={1101,2101,3201,4201,5101,1112,2122,3212,4202,1113,2123,3213,4203,1114,2124,3214,4204,1204}
							ordredecreationco[1]={}
							ordredecreationco[1].x=0
							ordredecreationco[1].y=-120
							ordredecreationco[2]={}
							ordredecreationco[2].x=450
							ordredecreationco[2].y=-170
							ordredecreationco[3]={}
							ordredecreationco[3].x=20
							ordredecreationco[3].y=-50
							ordredecreationco[4]={}
							ordredecreationco[4].x=565
							ordredecreationco[4].y=-60
							ordredecreationco[5]={}
							ordredecreationco[5].x=0
							ordredecreationco[5].y=100
						end
					end
				else
					local fichierordredecrea=require("ordredecrea")
					ordredecreation,ordredecreationco=geneordredecrea(niveauch)
					--traitement des données recu,
					-- local technique=niveauch+mathrandom(0,9)
					-- local tableaudestech={}
				end
			end
			nombredebatdai=#ordredecreationco
			local cpttemp=1
			for i=nbbatiment+1,nbbatiment+nombredebatdai do
				ibatiment[i]={}
				-- ibatiment[i].numlibre=false -- ? fait bugger
				ibatiment[i].x=2048*0.3
				ibatiment[i].x1=ibatiment[i].x
				ibatiment[i].xbase=0
				ibatiment[i].y=2048*0.3
				ibatiment[i].y1=ibatiment[i].y
				ibatiment[i].ybase=0
				ibatiment[i].type1=1
				ibatiment[i].type2=0
				ibatiment[i].niveau=0
				ibatiment[i].heure=gettime()
				ibatiment[i].heuredeb=ibatiment[i].heure
				ordredecreationco[cpttemp].numero=i
				print("cpttemp "..cpttemp)
				cpttemp=cpttemp+1
			end
			nbbatiment=nbbatiment+nombredebatdai
		end
		local oldi=0
		local oldnumero=0
		local oldnumero1=0
		local oldnumero2=0
		function lanceai()
			local i=1 --numero d'ordre
			local numero=0
			-- oldnumero=numero
			-- oldnumero1=oldnumero
			--nbbatiment=nbbatiment+nombredebatdai
			local nbi=#ordredecreation
			local function aitimer( event )
				jeupause.timerlibre[numtimer]=2
				if i<=nbi then
					local numerobis=mathfloor(ordredecreation[i]*0.001)--/1000)
					numero=numerobis
					local type1=mathfloor((ordredecreation[i]-numerobis*1000)*0.01) --/100)
					local moinsnb=0
					if contreai==1 then--if contreaihaut==0 or (contreai==1 and contreaihaut==1) then
						moinsnb=mineinfo.nb
					end
					if type1~=3 then
						numero=ordredecreationco[numerobis-moinsnb].numero
					else
						numero=numerobis+moinsnb
					end
					local type2=mathfloor((ordredecreation[i]-type1*100-numerobis*1000)*0.1) --/10)
					local niveau=ordredecreation[i]-type1*100-type2*10-numerobis*1000
					local autorise=true
					--if nbbatiment>=numero then
						if ibatiment[numero].niveau==0 or ( niveau==ibatiment[numero].niveau+1 and type1==ibatiment[numero].type1 and ibatiment[numero].sup==0) then
							if niveau>2 and ibatiment[numero].type2~=type2 then
								autorise=false
							end
						else
							autorise=false
						end
					--end
					if tune~=nil then
						if autorise then
							prix1=prix[type1][type2][niveau]
							local assezdoseil=false
							if contreai==1 and argentai-(-(prix1)*3)<=0 then
								argentai=argentai-(-(prix1)*3)
								assezdoseil=true
							elseif contreai==0 and argent-(-(prix1)*3)<=0 then
								argent=argent-(-(prix1)*3)
								vartune()
								--tune.text=-argent/3
								--if -argent/3>-1 and -argent/3<1  then
								--	tune.text=0
								--end
								assezdoseil=true
							end
							if assezdoseil then
								i=i+1
								print("type1 "..type1.." type2 "..type2.." numero "..numero.." prix1 "..prix1)
								if niveau>1 then
									ibatiment[numero].type1=type1
									ibatiment[numero].type2=type2
									ibatiment[numero].niveau=niveau
									local dev=-1
									aidevbat=numero
									local vitessedanim=1 
									print("debutpartie "..debutpartie)
									if debutpartie==0 or tutolevel0 then
										vitessedanim=0.01
									end
									evolution(numero,dev,vitessedanim)
								else
									print("construction d'un nouveau bat!\n")
									local nbatiment={}
									-- if type1==1 then
									-- 	nbatiment=display.newImage(imgbat.inf,1)
									-- else
									-- 	nbatiment=display.newImage(imgbat.arc,1)
									-- end
									-- group[2048]:insert(nbatiment)
									local plusy=0
									if contreai==1 then
										plusy=2048*0.3
										nbatiment.pole=614.4
									else
										--nbatiment.pole=1
									end
									nbatiment.x=ordredecreationco[numerobis-moinsnb].x
									nbatiment.y=ordredecreationco[numerobis-moinsnb].y+plusy
									if goh then
										if type1==1 then
											nbatiment.xScale = 0.35 -- 0.15
										else
											nbatiment.xScale = 0.45 --* 0.15
										end
										nbatiment.yScale =nbatiment.xScale
										nbatiment.width=200
										nbatiment.height=140
									else
										nbatiment.xScale=0.15
										nbatiment.yScale=0.15
									end
									nbatiment.image={}
									nbatiment.image.xScale=nbatiment.xScale
									nbatiment.image.yScale=nbatiment.yScale
									nbatiment.image.y=nbatiment.y
									nbatiment.image.x=nbatiment.x

									nbatiment.type1=type1
									nbatiment.type2=type2
									nbatiment.niveau=niveau
									nbatiment.num=numero
									aidevbat=numero
									local vitessedanim=1
									print("debutpartie "..debutpartie)
									if debutpartie==0 or tutolevel0 then
										vitessedanim=0.015
									end
									constructionanim(nbatiment,1,vitessedanim,true)
								end
								local function aidevbattimer( event )
									aidevbat=0
								end
								aidevbattimer1=timer.performWithDelay( 100, aidevbattimer )
							else
								print("pas assez d'oseil")
							end
						else
							i=i+1
						end
					end
				end
				local vitessedanim1=1
				if debutpartie==0 then
					vitessedanim1=0.07
				end 
				if i<nbi then
					oldnumero2=oldnumero1
					oldnumero1=oldnumero
					oldnumero=numero
					local coeftimer=1
					local newnumero
					if oldi~=i then
						newnumero=mathfloor(ordredecreation[i]*0.001)
						if numero~=newnumero then
							coeftimer=0.5
							if oldnumero1~=numero and oldnumero1~=newnumero then
								coeftimer=0.3
								if oldnumero2~=numero and oldnumero2~=newnumero then
									coeftimer=0.15
								end
							end
						end
					end
					
					oldi=i
					local niveaucal=mathfloor(mathabs(ordredecreation[i]*0.1-mathfloor(ordredecreation[i]*0.1))*10)
					if niveaucal==1 or debutpartie==0 or tutolevel0 then
						coeftimer=0.01
					end
					aitimer1=timer.performWithDelay(3000*vitessejeuin*vitessedanim1*coeftimer, aitimer)
					local blabla=timerpause(1,aitimer1,numtimer)
				end
			end
			local aitimer2=timer.performWithDelay(50, aitimer)
			numtimer=timerpause(1,aitimer2,nil)
		end
	--end
end
return(t)