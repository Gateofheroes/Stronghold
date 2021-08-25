local t={}
local function appordre(numeroboutonglob,origine)
	
	-- --function ordre(inf1,inf2,inf3,prix)
	-- print("demander de faire un dev")
	-- print("ordre recut"..inf1..inf2..inf3.." prix "..prix)
	-- local numeroboutonglob=(inf1-1)*6*13+(inf2-1)*13+inf3
	--print("numeroboutonglob "..numeroboutonglob)
	savegamedev[numeroboutonglob]=1
	local numbase=mathfloor(numeroboutonglob/13)
	local numerout1=numeroboutonglob-numbase*13
	local numerout2=(numeroboutonglob-numerout1)/13 --numeroboutonglob-mathfloor((numeroboutonglob/6))*6
	local numerout3=(numeroboutonglob-numerout2*13-numerout1)/6
	if not origine then
		print("numerout1 "..numerout1.." numerout2 "..numerout2.." numerout3 "..numerout3)
	end
	--print("bouton: "..numerout1.." "..numerout2.." "..numerout3)
	if numerout3==0 then
		if numerout2<6 then
			numerout1=numerout1-1
			local type2=mathfloor(numerout1/4)
			local niveau=(numerout1-(type2*4))+1
			if type2==0 then
				type2=1
			elseif type2==1 then
				type2=0
			end
			--print("type2 "..type2.." niveau"..niveau)
			if numerout2==1 then
				numerout2=0
			else
				numerout2=1
			end
			if numerout2==0 then
				if type2==1 then
					type2=2
				elseif type2==2 then
					type2=1
				end
			end
			if niveau<4 then
				savegameall.unlock[numerout2*3*5+type2*5+niveau+1]=1
				--print("unlock"..numerout2*3*5+type2*5+niveau+1)
			else
				if numerout2==1 then
									local testi1=numerout2*3*5+type2*5+1
				--	print("type2 "..type2.." num de test "..testi1)


					if type2==0 then
						for i=numerout2*3*5+type2*5+1,numerout2*3*5+type2*5+5 do
							print("augmente la portee")
							if savegameall.bonusbatiment[i].porte==nil then
								savegameall.bonusbatiment[i].porte=0
							end
							savegameall.bonusbatiment[i].porte=savegameall.bonusbatiment[i].porte+5000
							print(savegameall.bonusbatiment[i].porte)
						end
					elseif type2==1 then
						for i=numerout2*3*5+type2*5,numerout2*3*5+type2*5+5 do
							if savegameall.bonusbatiment[i].cadence==nil then
								savegameall.bonusbatiment[i].cadence=-500
							else
								savegameall.bonusbatiment[i].cadence=savegameall.bonusbatiment[i].cadence-500
							end
						end
					else
						for i=numerout2*3*5+type2*5,numerout2*3*5+type2*5+5 do
							if savegameall.bonusbatiment[i].attaque==nil then
								savegameall.bonusbatiment[i].attaque=4
							else
								savegameall.bonusbatiment[i].attaque=savegameall.bonusbatiment[i].attaque+4
							end
						end
					end
				else
					print("type2"..type2)
					if type2==2 then
						print("bonus de charge")
						for i=21,26 do
							if savegameall.bonussoldat[i].charge==nil then
								savegameall.bonussoldat[i].charge=5*(i-15)
							else
								savegameall.bonussoldat[i].charge=savegameall.bonussoldat[i].charge+5*(i-15)
							end
						end
					elseif type2==0 then
					--	print("bonus charge")
						for i=1,6 do
							if savegameall.bonussoldat[i].regene==nil then
								savegameall.bonussoldat[i].regene=-10
							else
								savegameall.bonussoldat[i].regene=savegameall.bonussoldat[i].regene-10
							end
						end
					else
					--	print("bonus vie")
						for i=11,16 do
							if savegameall.bonussoldat[i].vie==nil then
								savegameall.bonussoldat[i].vie=0
							end 
							savegameall.bonussoldat[i].vie=savegameall.bonussoldat[i].vie+50*(i-11)
						end
					end
				end
				--print("bonus")
			end
		elseif numerout2<12 then
			--print("group2")
			if numerout1<=4 then --pv1
				--print("colonne 1")
				if numerout1==1 then
					for i=41,43 do
						if savegameall.bonussoldat[i].attaque==nil then
							savegameall.bonussoldat[i].attaque=0
						end
						savegameall.bonussoldat[i].attaque=savegameall.bonussoldat[i].attaque+10
					end
					for i=44,47 do
						if savegameall.bonussoldat[i].tir==nil then
							savegameall.bonussoldat[i].tir={}
						end
						if savegameall.bonussoldat[i].tir.attaque==nil then
							savegameall.bonussoldat[i].tir.attaque=0
						end
						savegameall.bonussoldat[i].tir.attaque=savegameall.bonussoldat[i].tir.attaque+4
					end
				elseif numerout1==2 then
					for i=41,43 do
						if savegameall.bonussoldat[i].vie==nil then
							savegameall.bonussoldat[i].vie=0
						end 
						savegameall.bonussoldat[i].vie=savegameall.bonussoldat[i].vie+30
					end
					for i=44,47 do
						if savegameall.bonussoldat[i].tir==nil then
							savegameall.bonussoldat[i].tir={}
						end
						if savegameall.bonussoldat[i].tir.vitesse==nil or savegameall.bonussoldat[i].tir.cadence==nil then
							savegameall.bonussoldat[i].tir.vitesse=1
							savegameall.bonussoldat[i].tir.cadence=0
						end 
						savegameall.bonussoldat[i].tir.vitesse=1
						savegameall.bonussoldat[i].tir.cadence=savegameall.bonussoldat[i].tir.cadence-200
					end
				elseif numerout1==3 then
					if savegameall.bonuspouvoir[1].loadt==nil then
						savegameall.bonuspouvoir[1].loadt=0
					end 
					savegameall.bonuspouvoir[1].loadt=savegameall.bonuspouvoir[1].loadt+0.8
				elseif numerout1==4 then
					if savegameall.bonuspouvoir[1].loadt==nil then
						savegameall.bonuspouvoir[1].loadt=2
					end
					savegameall.bonuspouvoir[1].nbsold=savegameall.bonuspouvoir[1].nbsold+1 --nombre de soldat
				end
			elseif numerout1<=8 then --pv2
				if numerout1==5 then
					savegameall.bonuspouvoir[2].unlock=true
				elseif numerout1==6 then
					if savegameall.bonuspouvoir[2].attaque==nil then
						savegameall.bonuspouvoir[2].attaque=1
					end
					savegameall.bonuspouvoir[2].attaque=savegameall.bonuspouvoir[2].attaque*1.2 --attaque du pv
				elseif numerout1==7 then
					if savegameall.bonuspouvoir[2].loadt==nil then
						savegameall.bonuspouvoir[2].loadt=1
					end
					savegameall.bonuspouvoir[2].loadt=savegameall.bonuspouvoir[2].loadt*0.8 --duree de chargement
				elseif numerout1==8 then
					savegameall.bonuspouvoir[2].bonus=2 --attaque autant d'ennemi que peut tue le pouvoir
				end
				--print("colonne 2")
			elseif numerout1<=12 then --pv2
				if numerout1==9 then
					savegameall.bonuspouvoir[3].unlock=true
				elseif numerout1==10 then
					if savegameall.bonuspouvoir[3].bonus1==nil or savegameall.bonuspouvoir[3].bonus3==nil then
						savegameall.bonuspouvoir[3].bonus1=1
						savegameall.bonuspouvoir[3].bonus3=1
					end 
					savegameall.bonuspouvoir[3].bonus1=savegameall.bonuspouvoir[3].bonus1*1.2
					savegameall.bonuspouvoir[3].bonus3=savegameall.bonuspouvoir[3].bonus3*1.2
				elseif numerout1==11 then
					if savegameall.bonuspouvoir[3].bonus2==nil then
						savegameall.bonuspouvoir[3].bonus2=1
					end
					savegameall.bonuspouvoir[3].bonus2=savegameall.bonuspouvoir[3].bonus2*1.2
					savegameall.bonuspouvoir[3].bonus3=savegameall.bonuspouvoir[3].bonus3*1.4
				elseif numerout1==12 then
					if savegameall.bonuspouvoir[3].loadt==nil then
						savegameall.bonuspouvoir[3].loadt=1
					end 
					savegameall.bonuspouvoir[3].loadt=savegameall.bonuspouvoir[3].loadt*0.8
				end
				--print("colonne 2")
			end
		else
			--print("group3")
			if numerout2==12 then
				if numerout1==2 then
					--print("gene elfe2 unlock")
					savegameall.general[2]=2
					--savegamedev[320+1*10+savegameall.general[2]]=mathfloor(savegamedev[320+1*10+savegameall.general[2]-1]*0.5)
					if not origine then
						savegameall.generalch[2]=savegameall.general[2]
						savegamedev[2+350]=savegameall.generalch[2]
					end
				elseif numerout1==3 then
					savegameall.general[2]=3
					--savegamedev[320+1*10+savegameall.general[2]]=mathfloor(savegamedev[320+1*10+savegameall.general[2]-1]*0.5)
					if not origine then
						savegameall.generalch[2]=savegameall.general[2]
						savegamedev[2+350]=savegameall.generalch[2]
					end
				elseif numerout1==6 then
					--print("gene humain2 unlock")
					savegameall.general[1]=2
					--savegamedev[320+0*10+savegameall.general[1]]=mathfloor(savegamedev[320+0*10+savegameall.general[1]-1]*0.5)
					if not origine then
						savegameall.generalch[1]=savegameall.general[1]
						savegamedev[1+350]=savegameall.generalch[1]
					end
				elseif numerout1==7 then
					--print("gene humain2 unlock")
					savegameall.general[1]=3
					--savegamedev[320+0*10+savegameall.general[1]]=mathfloor(savegamedev[320+0*10+savegameall.general[1]-1]*0.5)
					if not origine then
						savegameall.generalch[1]=savegameall.general[1]
						savegamedev[1+350]=savegameall.generalch[1]
					end
					elseif numerout1==8 then
					--print("gene humain2 unlock")
					for i=1,3 do
						savegameall.general[i]=4
						print("general niveau 4 debloquer pour race "..i)
					end
					--savegamedev[320+0*10+savegameall.general[1]]=mathfloor(savegamedev[320+0*10+savegameall.general[1]-1]*0.5)
					if not origine then
						for i=1,3 do
							savegameall.generalch[i]=savegameall.general[i]
							savegamedev[i+350]=savegameall.generalch[i]
							print("considere comme selectionné")
						end
					end
				elseif numerout1==10 then
					savegameall.general[3]=2
					--savegamedev[320+2*10+savegameall.general[3]]=mathfloor(savegamedev[320+2*10+savegameall.general[3]-1]*0.5)
					if not origine then
						savegameall.generalch[3]=savegameall.general[3]
						savegamedev[3+350]=savegameall.generalch[3]
					end
				elseif numerout1==11 then
					savegameall.general[3]=3
					--savegamedev[320+2*10+savegameall.general[3]]=mathfloor(savegamedev[320+2*10+savegameall.general[3]-1]*0.5)
					if not origine then
						savegameall.generalch[3]=savegameall.general[3]
						savegamedev[3+350]=savegameall.generalch[3]
					end

				elseif numerout1==12 then
					savegameall.xpactive=true
					print("numeroboutonglob pour savegameall.xpactive est "..numeroboutonglob)
				elseif numerout1==4 then 
					print("reinit devellopement")
					if not origine then
						print("reinit origine=true")
						if fric1<0 then
							fric1=savegame.yomec/5*7
						else
							fric1=-savegame.yomec/5*7
						end
						fric1=mathfloor(fric1)
						--print("savegame.yomec "..savegame.yomec)
						--print("savegame.yomec "..savegame.yomec)
						savegame.diplay=gettime()
						local fricpos=fric1
						if fricpos<0 then
							fricpos=-fricpos
						end
						savegame.content=(-fricpos/3-1)/savegame.display
						savegame.monney=fricpos/7
						for i=1,319 do
							if i<157 or i>167 then
								savegamedev[i]=0 --1 devellopement fait
							end
						end
						--savegamedev[157]=1
						--savegamedev[161]=1
						--savegamedev[165]=1
						newinitbonus(true)
						print("numerout1 "..numerout1.." numerout2 "..numerout2.." numerout3 "..numerout3)
						savegamedev[numeroboutonglob]=0
					end
				end

			-- else
			-- 	if not origine then
			-- 		if fric1<0 then
			-- 			fric1=savegame.yomec/5*7
			-- 		else
			-- 			fric1=-savegame.yomec/5*7
			-- 		end
			-- 		fric1=mathfloor(fric1)
			-- 		--print("savegame.yomec "..savegame.yomec)
			-- 		--print("savegame.yomec "..savegame.yomec)
			-- 		local t = os.date( '*t' )
			-- 		savegame.diplay=os.time( t )
			-- 		local fricpos=fric1
			-- 		if fricpos<0 then
			-- 			fricpos=-fricpos
			-- 		end
			-- 		savegame.content=(-fricpos/3-1)/savegame.display
			-- 		savegame.monney=fricpos/7
			-- 		for i=1,320 do
			-- 			savegamedev[i]=0 --1 devellopement fait
			-- 		end
			-- 		newinitbonus()
			-- 		print("numerout1 "..numerout1.." numerout2 "..numerout2.." numerout3 "..numerout3)
			-- 	end
			end
		end
	elseif numerout3==1 then
		--print("numerout2"..numerout2.."numerout1"..numerout1)
	end
	-- if numeroboutonglob==1 then
	-- 	print("augmenter l'oseille")
	-- 	--augmenter l'oseille
	-- 	local calcultest=mathabs(fric1)/7-savegame.monney
	-- 	if calcultest>1 or calcultest<-1 then
	-- 	--if fric1/7~=savegame.monney then
	-- 		fric1=0
	-- 		print("triche1")
	-- 	else
	-- 		assezdetune=true
	-- 		if fric1<0 then
	-- 			fric1=-fric1+1000*7
	-- 		else
	-- 			fric1=-(fric1+1000*7)
	-- 		end
	-- 		fric1=mathfloor(fric1)
	-- 		local t = os.date( '*t' )
	-- 		savegame.diplay=os.time( t )
	-- 		local fricpos=fric1
	-- 		if fricpos<0 then
	-- 			fricpos=-fricpos
	-- 		end
	-- 		savegame.content=(-fricpos/3-1)/savegame.display
	-- 		savegame.monney=fricpos/7
	-- 		if lefrictext~=nil then
	-- 			lefrictext.text=fricpos/7
	-- 		end
	-- 	end 
	-- elseif numeroboutonglob==2 then
	-- 	print("dev du soldat1")
	-- 	for i=1,100 do
	-- 	 	savegameall.bonussoldat[i].attaque=10+i
	-- 	end
	-- end
	if not origine then
		local loadsave = require("loadsave")
		loadsave.saveTable(savegame, "undeuxtroissoleil.json" )
		loadsave.saveTable(savegamedev, "undeuxtroissoleilbis.json" )
	end
	-- loadsave.saveTable(savegamebonussoldat, "undeuxtroissoleil1.json" )
	-- loadsave.saveTable(savegamebonusbatiment, "undeuxtroissoleil2.json" )
	-- loadsave.saveTable(savegamebonuspouvoir, "undeuxtroissoleil3.json" )
end
local function appordrewave(numeroboutonglob,origine)
	if numeroboutonglob==1 then -- infanterie portee x2
		if savegameall.bonusbatiment[1].porte==nil then
			savegameall.bonusbatiment[1].porte=0 
			savegameall.bonusbatiment[2].porte=0
			savegameall.bonusbatiment[3].porte=0
			savegameall.bonusbatiment[4].porte=0
		end
		savegameall.bonusbatiment[1].porte=savegameall.bonusbatiment[1].porte+30000 
		savegameall.bonusbatiment[2].porte=savegameall.bonusbatiment[2].porte+36000
		savegameall.bonusbatiment[3].porte=savegameall.bonusbatiment[3].porte+41500
		savegameall.bonusbatiment[4].porte=savegameall.bonusbatiment[4].porte+46000
		-- type1*3*5+type2*5+niveau-15
		-- 1,0,1 to 4
	elseif numeroboutonglob==2 then -- geant portee x2
		if savegameall.bonusbatiment[7].porte==nil then
			savegameall.bonusbatiment[7].porte=0
			savegameall.bonusbatiment[8].porte=0
			savegameall.bonusbatiment[9].porte=0
		end 
		savegameall.bonusbatiment[7].porte=savegameall.bonusbatiment[7].porte+30000
		savegameall.bonusbatiment[8].porte=savegameall.bonusbatiment[8].porte+30000
		savegameall.bonusbatiment[9].porte=savegameall.bonusbatiment[9].porte+30000
	elseif numeroboutonglob==3 then -- cavalerie portée x2
		if savegameall.bonusbatiment[12].porte==nil then
			savegameall.bonusbatiment[12].porte=0
			savegameall.bonusbatiment[13].porte=0
			savegameall.bonusbatiment[14].porte=0
		end 
		savegameall.bonusbatiment[12].porte=savegameall.bonusbatiment[12].porte+210000
		savegameall.bonusbatiment[13].porte=savegameall.bonusbatiment[13].porte+240000
		savegameall.bonusbatiment[14].porte=savegameall.bonusbatiment[14].porte+270000
	elseif numeroboutonglob==4 then -- mine repare 2x plus rapidement
		if savegameall.bonusbatiment[32].vitesse==nil then
			savegameall.bonusbatiment[32].vitesse=0
		end
		savegameall.bonusbatiment[32].vitesse=savegameall.bonusbatiment[32].vitesse+2
	elseif numeroboutonglob==5 then -- archer fleche 2x plus rapide
		if savegameall.bonusbatiment[16].vitesse==nil then
			savegameall.bonusbatiment[16].vitesse=1
			savegameall.bonusbatiment[17].vitesse=1.2
			savegameall.bonusbatiment[18].vitesse=1.3
			savegameall.bonusbatiment[19].vitesse=1.4
		else
			savegameall.bonusbatiment[16].vitesse=savegameall.bonusbatiment[16].vitesse*1.1
			savegameall.bonusbatiment[17].vitesse=savegameall.bonusbatiment[17].vitesse*1.2
			savegameall.bonusbatiment[18].vitesse=savegameall.bonusbatiment[18].vitesse*1.3
			savegameall.bonusbatiment[19].vitesse=savegameall.bonusbatiment[19].vitesse*1.4
		end
	elseif numeroboutonglob==6 then -- boulet 2x rapide
		if savegameall.bonusbatiment[22].vitesse==nil then
			savegameall.bonusbatiment[22].vitesse=0.75
			savegameall.bonusbatiment[23].vitesse=0.75
			savegameall.bonusbatiment[24].vitesse=0.8
		else
			savegameall.bonusbatiment[22].vitesse=savegameall.bonusbatiment[22].vitesse*0.75
			savegameall.bonusbatiment[23].vitesse=savegameall.bonusbatiment[23].vitesse*0.75
			savegameall.bonusbatiment[24].vitesse=savegameall.bonusbatiment[24].vitesse*0.8
		end
	elseif numeroboutonglob==7 then -- liquide +25% porte
		if savegameall.bonusbatiment[27].porte==nil then
			savegameall.bonusbatiment[27].porte=0
			savegameall.bonusbatiment[28].porte=0
			savegameall.bonusbatiment[29].porte=0
		end	
		savegameall.bonusbatiment[27].porte=savegameall.bonusbatiment[27].porte+6750
		savegameall.bonusbatiment[28].porte=savegameall.bonusbatiment[28].porte+8438
		savegameall.bonusbatiment[29].porte=savegameall.bonusbatiment[29].porte+10700
	elseif numeroboutonglob==8 then -- delais d'attente avant de se reparer supprimer
		savegameall.bonusbatiment[32].repa=true
	elseif numeroboutonglob==9 then -- infanterie +1
		if savegameall.bonusbatiment[1].nbunit==nil then
			savegameall.bonusbatiment[1].nbunit=0
			savegameall.bonusbatiment[2].nbunit=0
			savegameall.bonusbatiment[3].nbunit=0
			savegameall.bonusbatiment[4].nbunit=0
		end
		savegameall.bonusbatiment[1].nbunit=savegameall.bonusbatiment[1].nbunit+1
		savegameall.bonusbatiment[2].nbunit=savegameall.bonusbatiment[2].nbunit+1
		savegameall.bonusbatiment[3].nbunit=savegameall.bonusbatiment[3].nbunit+1
		savegameall.bonusbatiment[4].nbunit=savegameall.bonusbatiment[4].nbunit+1
	elseif numeroboutonglob==10 then -- cavalerie +1
		if savegameall.bonusbatiment[12].nbunit==nil then
			savegameall.bonusbatiment[12].nbunit=0
			savegameall.bonusbatiment[13].nbunit=0
			savegameall.bonusbatiment[14].nbunit=0
		end 
		savegameall.bonusbatiment[12].nbunit=savegameall.bonusbatiment[12].nbunit+1
		savegameall.bonusbatiment[13].nbunit=savegameall.bonusbatiment[13].nbunit+1
		savegameall.bonusbatiment[14].nbunit=savegameall.bonusbatiment[14].nbunit+1
	elseif numeroboutonglob==11 then -- geant +1
		if savegameall.bonusbatiment[7].nbunit==nil then
			savegameall.bonusbatiment[7].nbunit=0
			savegameall.bonusbatiment[8].nbunit=0
			savegameall.bonusbatiment[9].nbunit=0
		end 
		savegameall.bonusbatiment[7].nbunit=savegameall.bonusbatiment[7].nbunit+1
		savegameall.bonusbatiment[8].nbunit=savegameall.bonusbatiment[8].nbunit+1
		savegameall.bonusbatiment[9].nbunit=savegameall.bonusbatiment[9].nbunit+1
	elseif numeroboutonglob==12 then -- mine +100% hp
		if savegameall.bonusbatiment[32].vietotale==nil then
			savegameall.bonusbatiment[32].vietotale=0
			savegameall.bonusbatiment[32].vie=0
			savegameall.bonusbatiment[33].vietotale=0
			savegameall.bonusbatiment[33].vie=0
			savegameall.bonusbatiment[33].vietotale=0
			savegameall.bonusbatiment[33].vie=0
		end	
		savegameall.bonusbatiment[32].vietotale=savegameall.bonusbatiment[32].vietotale+100
		savegameall.bonusbatiment[32].vie=savegameall.bonusbatiment[32].vie+100
		savegameall.bonusbatiment[33].vietotale=savegameall.bonusbatiment[33].vietotale+250
		savegameall.bonusbatiment[33].vie=savegameall.bonusbatiment[33].vie+250
		savegameall.bonusbatiment[33].vietotale=savegameall.bonusbatiment[33].vietotale+600
		savegameall.bonusbatiment[33].vie=savegameall.bonusbatiment[33].vie+600
	elseif numeroboutonglob==13 then -- archer +1 fleche
		if savegameall.bonusbatiment[16].nbfleche==nil then
			savegameall.bonusbatiment[16].nbfleche=0
			savegameall.bonusbatiment[19].nbfleche=0
		end
		savegameall.bonusbatiment[16].nbfleche=savegameall.bonusbatiment[16].nbfleche+1
		savegameall.bonusbatiment[19].nbfleche=savegameall.bonusbatiment[19].nbfleche+1
	elseif numeroboutonglob==14 then -- boulet +1 boulet
		if savegameall.bonusbatiment[22].nbfleche==nil then
			savegameall.bonusbatiment[22].nbfleche=0
		end 
		savegameall.bonusbatiment[22].nbfleche=savegameall.bonusbatiment[22].nbfleche+1
	elseif numeroboutonglob==15 then -- liquide x2 att
		if savegameall.bonusbatiment[27].attaque==nil then
			savegameall.bonusbatiment[27].attaque=45*0.4
			savegameall.bonusbatiment[28].attaque=67*0.4
			savegameall.bonusbatiment[29].attaque=241*0.4*0.5
		else
			savegameall.bonusbatiment[27].attaque=savegameall.bonusbatiment[27].attaque*1.2
			savegameall.bonusbatiment[28].attaque=savegameall.bonusbatiment[28].attaque*1.2
			savegameall.bonusbatiment[29].attaque=savegameall.bonusbatiment[29].attaque*1.2
		end
	elseif numeroboutonglob==16 then -- mine x4 tune
		if savegameall.bonusbatiment[32].argentsec==nil then 
			savegameall.bonusbatiment[32].argentsec=12
			savegameall.bonusbatiment[33].argentsec=24
			savegameall.bonusbatiment[34].argentsec=36
		else
			savegameall.bonusbatiment[32].argentsec=savegameall.bonusbatiment[32].argentsec*1.5
			savegameall.bonusbatiment[33].argentsec=savegameall.bonusbatiment[33].argentsec*1.5
			savegameall.bonusbatiment[34].argentsec=savegameall.bonusbatiment[34].argentsec*1.5
		end
	end
end
t.ordre = function (inf1,inf2,inf3,prix)
	--function ordre(inf1,inf2,inf3,prix)
	print("demander de faire un dev")
	local numeroboutonglob=(inf1-1)*6*13+(inf2-1)*13+inf3 --157 
	print("ordre recut"..inf1.." "..inf2.." "..inf3.." prix "..prix.." id ordre "..numeroboutonglob)
	appordre(numeroboutonglob,false)
end
t.ordre1= function (nombred)
	print("nombred"..nombred)
	appordre(nombred,true)
end
t.ordrewave= function (nombred)
	appordrewave(nombred,true)
end
return t