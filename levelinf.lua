local t = {}--chagement des images de batiments
t.levelinf = function ()
end
if issimulator then -- permet de generer le tableau des soldats spawnable
	local function initableausoldattheme(terrain)-- 	                                    210                                                  220
		if terrain==1 then--14 pour 2
			local tabsolherbe1={true,true,true,false,true,true,true,false,false,true,true,true,true,false,true,false,false,false,true,true}
			tabsolherbe={}
			for i=1,20 do
				tabsolherbe[199+i]=tabsolherbe1[i]
			end
			for i=220,299 do
				tabsolherbe[i]=false
			end
			tabsolherbe[225]=true
			tabsolherbe[226]=true
			tabsolherbe[227]=true
			tabsolherbe[264]=true -- 6 pour 1
			tabsolherbe[265]=true
			tabsolherbe[266]=true
			tabsolherbe[267]=true
			tabsolherbe[268]=true
			tabsolherbe[269]=true
			tabsolherbe[270]=true --3 pour 1
			tabsolherbe[272]=true
			tabsolherbe[275]=true
			--tabsolherbe[370]=true --3 pour 1
			--tabsolherbe[372]=true
			--tabsolherbe[375]=true
			return tabsolherbe
		elseif terrain==2 then

			local tabsolneige={}
			for i=200,299 do
				tabsolneige[i]=false
			end
			tabsolneige[203]=true--3
			tabsolneige[204]=true
			tabsolneige[207]=true
			tabsolneige[208]=true
			tabsolneige[213]=true
			tabsolneige[215]=true--3
			tabsolneige[216]=true
			tabsolneige[217]=true
			tabsolneige[225]=true
			tabsolneige[228]=true
			tabsolneige[230]=true
			tabsolneige[235]=true--1
			tabsolneige[260]=true--6
			tabsolneige[261]=true
			tabsolneige[262]=true
			tabsolneige[263]=true
			tabsolneige[268]=true
			tabsolneige[269]=true
			tabsolneige[270]=true--2
			tabsolneige[272]=true
			return tabsolneige
		elseif terrain==3 or terrain==4 then
			local tabsolsable={}
			for i=200,299 do
				tabsolsable[i]=false
			end
			tabsolsable[200]=true--7
			tabsolsable[201]=true
			tabsolsable[202]=true
			tabsolsable[204]=true
			tabsolsable[205]=true
			tabsolsable[206]=true
			tabsolsable[209]=true
			tabsolsable[211]=true--6
			tabsolsable[212]=true
			tabsolsable[214]=true
			tabsolsable[218]=true
			tabsolsable[219]=true
			tabsolsable[225]=true--2
			tabsolsable[228]=true
			tabsolsable[236]=true
			if terrain==3 then
				tabsolsable[240]=true -- egyptien--5
				tabsolsable[241]=true
				tabsolsable[242]=true
				tabsolsable[243]=true
				tabsolsable[249]=true
			else
				tabsolsable[251]=true -- pirates--3
				tabsolsable[252]=true
				tabsolsable[253]=true
			end
			tabsolsable[264]=true--6
			tabsolsable[265]=true
			tabsolsable[266]=true
			tabsolsable[267]=true
			tabsolsable[268]=true
			tabsolsable[269]=true
			tabsolsable[270]=true--4
			tabsolsable[271]=true
			tabsolsable[272]=true
			tabsolsable[275]=true
			return tabsolsable
		else
			local tabsolcendre={}
			for i=200,299 do
				tabsolcendre[i]=false
			end
			tabsolcendre[203]=true--4
			tabsolcendre[204]=true
			tabsolcendre[205]=true
			tabsolcendre[207]=true
			tabsolcendre[208]=true
			tabsolcendre[213]=true
			tabsolcendre[215]=true--3
			tabsolcendre[216]=true
			tabsolcendre[217]=true
			tabsolcendre[220]=true--6
			tabsolcendre[221]=true
			tabsolcendre[222]=true
			tabsolcendre[223]=true
			tabsolcendre[224]=true
			tabsolcendre[225]=true
			tabsolcendre[228]=true
			tabsolcendre[230]=true
			tabsolcendre[237]=true--3
			tabsolcendre[238]=true
			tabsolcendre[239]=true
			tabsolcendre[260]=true--6
			tabsolcendre[261]=true
			tabsolcendre[262]=true
			tabsolcendre[263]=true
			tabsolcendre[268]=true
			tabsolcendre[269]=true
			tabsolcendre[270]=true--2
			tabsolcendre[272]=true
			tabsolcendre[280]=true--9
			tabsolcendre[281]=true
			tabsolcendre[282]=true
			tabsolcendre[283]=true
			tabsolcendre[284]=true
			tabsolcendre[285]=true
			tabsolcendre[286]=true
			tabsolcendre[287]=true
			tabsolcendre[288]=true
			tabsolcendre[289]=true
			return tabsolcendre
		end
		return false
	end
	local function  genertab()
		for i=1,5 do
			local tableausoldat=initableausoldattheme(i)
			local tableaufinal={}
			for pos,val in pairs(tableausoldat) do
				if val then
					tableaufinal[#tableaufinal+1]=pos
				end
			end
			local chainetab="tableausoldat={"
			for pos,val in pairs(tableaufinal) do
				if pos~=#tableaufinal then
					chainetab=chainetab..val..","
				else
					chainetab=chainetab..val.."}"
				end
			end
			print(chainetab)
		end
	end
	genertab()
end

if niveauch<=4 then
	if goh then
		tableausoldat={266,270,267,200,202,204,206,210,212,214,218,226,264,268,272,275,265,269,201,205,209,211,219,225,227}
	else
		tableausoldat={266,270,267,200,202,204,206,210,212,214,218,264,268,272,275,265,269,201,205,209,211,213,219}
	end
elseif niveauch<=8 then
	if goh then
		tableausoldat={262,270,263,204,208,216,228,230,260,268,272,261,269,203,207,213,215,217,225,235}
	else
		tableausoldat={262,270,263,204,208,216,260,268,272,261,269,203,207,215,217,235}
	end
elseif niveauch<=11 then
	if goh then
		tableausoldat={241,243,249,266,270,267,200,202,204,206,212,214,218,228,236,240,242,264,268,272,275,265,269,201,205,209,211,219,225,271}
	else
		tableausoldat={241,243,249,266,270,267,200,202,204,206,212,214,218,236,240,242,264,268,272,275,265,269,201,205,209,211,213,219,225,271}
	end
elseif niveauch==12 then
	if goh then
		tableausoldat={251,253,266,270,267,200,202,204,206,212,214,218,228,236,252,264,268,272,275,265,269,201,205,209,211,219,225,271}
	else
		tableausoldat={251,253,266,270,267,200,202,204,206,212,214,218,236,252,264,268,272,275,265,269,201,205,209,211,213,219,225,271}
	end
else
	if goh then
		tableausoldat={262,270,282,286,263,204,208,216,220,222,224,228,230,238,260,268,272,280,284,288,289,287,285,283,281,261,269,203,205,207,213,215,217,221,223,225,237,239}
	else
		tableausoldat={262,270,282,286,263,204,208,216,220,222,224,238,260,268,272,280,284,288,289,287,285,283,281,261,269,203,205,207,215,217,221,223,225,237,239}
	end
end

local function vaguealeaspwansoldier(l,puissancemin,puissancemax,boss)
	local i=200
	local persrecherche=true
	local nbrecherche=0 --empeche des boucles infini du a des bugs
	local nb
	if l<45 and boss==nil then
		while persrecherche and nbrecherche<10 do
			nbrecherche=nbrecherche+1
			nb=tableausoldat[mathrandom(1,#tableausoldat)]
			if nb>300 then
				nb=nb-100
			end
			-- local j=mathrandom(0,9) -- ancienne generation de soldat avant l'adaptation en fonction du terrain
			-- nb=i+j*10
			-- while tabsoldexist[nb]==false do --image[nb].message=="soldat: " do
			-- 	j=mathrandom(0,9)
			-- 	nb=i+j*10
			-- end
			-- local k=mathrandom(0,9)
			-- nb=i+j*10+k
			-- while tabsoldexist[nb]==false do
			-- 	k=mathrandom(0,9)
			-- 	nb=i+j*10+k
			-- end
			if puissancemin~=nil then
				if puissancemin+1<puissancemax then
					if image[nb].puissance*ralenticroissance>=puissancemin and image[nb].puissance*ralenticroissance<=puissancemax then
						persrecherche=false
					end
				else
					persrecherche=false
					print("bug de choix d'ennemi")
				end
			else
				persrecherche=false
			end
		end
	else
		local rechercheencours=true
		local compteuretat=0
		while rechercheencours do
			nb=linf.tab5pluspuis.nb[mathrandom(1,5)]
			compteuretat=compteuretat+1
			if compteuretat>5 then
				nb=200
				rechercheencours=false
			end
			if image[nb].puissance*ralenticroissance<=puissancemax+3 then
				rechercheencours=false
			end
		end
	end
	linf.puissancedelavague=linf.puissancedelavague+image[nb].puissance*ralenticroissance
	linf.nbsoldatvague=linf.nbsoldatvague+1
	vague[l][linf.nbsoldatvague]=nb
	linf.aidenbreelsoldatinf=linf.aidenbreelsoldatinf+1
	--print(l.." "..nbsoldatvague.." "..nb)
	--return(puissancedelavague,nbsoldatvague)
	return(nb)
end
local function meilleursoldat()
	linf.tab5pluspuis={}
	linf.tab5pluspuis.nb={}
	-- if true then -- permet de calculer pour les nouvelles valeurs des soldats leurs puissances
	-- 	linf.tab5pluspuis.puis={}
	-- 	for i=1,5 do
	-- 		linf.tab5pluspuis.puis[i]=0
	-- 	end
	-- 	for j=0,9,1 do --detection des cinqs soldats les plus puissants
	-- 		for k=0,9,1 do
	-- 			nb=k+j*10+200
	-- 			if image[nb].message~="soldat: " then
	-- 				if image[nb].puissance>linf.tab5pluspuis.puis[5] then
	-- 					if image[nb].puissance>linf.tab5pluspuis.puis[4] then
	-- 						if image[nb].puissance>linf.tab5pluspuis.puis[3] then
	-- 							if image[nb].puissance>linf.tab5pluspuis.puis[2] then
	-- 								if image[nb].puissance>linf.tab5pluspuis.puis[1] then
	-- 									local i=4
	-- 									while i>=1 do
	-- 										linf.tab5pluspuis.puis[i+1]=linf.tab5pluspuis.puis[i]
	-- 										linf.tab5pluspuis.nb[i+1]=linf.tab5pluspuis.nb[i]
	-- 										i=i-1
	-- 									end
	-- 									linf.tab5pluspuis.puis[1]=image[nb].puissance
	-- 									linf.tab5pluspuis.nb[1]=nb

	-- 								else
	-- 									local i=4
	-- 									while i>=2 do
	-- 										linf.tab5pluspuis.puis[i+1]=linf.tab5pluspuis.puis[i]
	-- 										linf.tab5pluspuis.nb[i+1]=linf.tab5pluspuis.nb[i]
	-- 										i=i-1
	-- 									end
	-- 									linf.tab5pluspuis.puis[2]=image[nb].puissance
	-- 									linf.tab5pluspuis.nb[2]=nb
	-- 								end
	-- 							else
	-- 								local i=4
	-- 								while i>=3 do
	-- 									linf.tab5pluspuis.puis[i+1]=linf.tab5pluspuis.puis[i]
	-- 									linf.tab5pluspuis.nb[i+1]=linf.tab5pluspuis.nb[i]
	-- 									i=i-1
	-- 								end
	-- 								linf.tab5pluspuis.puis[3]=image[nb].puissance
	-- 								linf.tab5pluspuis.nb[3]=nb
	-- 							end
	-- 						else
	-- 							local i=4
	-- 							while i>=4 do
	-- 								linf.tab5pluspuis.puis[i+1]=linf.tab5pluspuis.puis[i]
	-- 								linf.tab5pluspuis.nb[i+1]=linf.tab5pluspuis.nb[i]
	-- 								i=i-1
	-- 							end
	-- 							linf.tab5pluspuis.puis[4]=image[nb].puissance
	-- 							linf.tab5pluspuis.nb[4]=nb
	-- 						end
	-- 					else
	-- 						linf.tab5pluspuis.puis[5]=image[nb].puissance
	-- 						linf.tab5pluspuis.nb[5]=nb
	-- 					end
	-- 				end
	-- 			end
	-- 		end
	-- 	end
	-- 	print("les 5 soldats les plus puissants:")
	-- 	for i=1,5 do
	-- 		print("le "..i.." plus puissant est le "..linf.tab5pluspuis.nb[i].." avec une puissance de "..linf.tab5pluspuis.puis[i])
	-- 	end
	-- 	for i=1,5 do
	-- 		--print("linf.tab5pluspuis.puis["..i.."]="..linf.tab5pluspuis.puis[i])
	-- 		print("linf.tab5pluspuis.nb["..i.."]="..linf.tab5pluspuis.nb[i])
	-- 	end
	-- end
	linf.tab5pluspuis.nb[1]=268
	linf.tab5pluspuis.nb[2]=204
	linf.tab5pluspuis.nb[3]=269
	linf.tab5pluspuis.nb[4]=262
	linf.tab5pluspuis.nb[5]=266
end

	--ajouter un truc pour que 2 niveau d'affiler reussi parfaiteùment tout les decission et ... se remette en normal
	-- si sur 5 vagues un coef et +3 fois en pression faire +20%
linf={}
linf.puissancevague=2
linf.puissancevagueplusplus=0
linf.puissancevagueppp=0.2
linf.puissancedelavague=0
linf.nbsoldatvague=0
linf.vagueppp=0 --chaque fois que la vague est reussi le coef augmente


linf.puissanceminobj=0 --puissance min des soldats
linf.puissancemaxobj=3 --puissance max des soldats
linf.decission1=1	-- plus le nb est grand plus la proba de spawn pls soldat a la fois et elever face a celle de attendre
linf.decission2=2	-- nb min de soldats spawn en meme temps lors d'un spawn multiple
linf.decission3=1	-- nb de fois max qu'on peut faire des multi spawn de multiple
linf.decission4=2	-- nb max de soldats spawn en meme temps lors d'un spawn multiple
linf.nbboss=0
linf.decission5=0 	-- Permet de varier la probabilité de spwan un mec ou de faire un spawn speciale plus le nb est faible (peut etre negatif) plus la probabilité de spawner un mec est elever
linf.decission6=1	-- Permet de varier la probabilité de spwan un mec ou de faire un spawn speciale plus le nb est elever plus la probabilité d'un spawn special est elever
linf.decission7=0	-- Va avec decission 1 plus le nb est petit(peut etre negatif) plus la proba de spawn pls soldat a la fois et faible face a celle de attendre


--linf.puissancevaretat=1 --permet de faire varier comme pour les vagues d'un nivveau à un autre
linf.puissancevaretatactif=false	--indique quand il y a eut une variation
linf.puissancevaretatetape={7,10,15,20,25,30,35,40,45,50,60,70,80,90,100,120,160,200,250,270,300,350,400,450,470,500,600,700,800,900,1000,1100,1200,1300,1400,1500,1600,1700,1800,1900,2000,2100,2200,2300,2400,2500,2600,2700,2800,2900,3000,3100,3200} --puissance theorique qui sont recalculer tout des que la vie des mechants varient
linf.puissancevaretatvalue={}
linf.puissancevaretatvalue.puissanceminobj={0,0,0,0,0,0,0,1,1,1,2,2,2,3,3,3,3,4,4,4,4,5,5,5,5,5,6,6,6,6,6,6,7,7,7,7,8,8,8,8,8,8,8,9,9,9,9,10,10,10,10,11,11,11,11,11,11}
linf.puissancevaretatvalue.puissancemaxobj={3,3,3,4,4,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,25,30,40,50,60,70,80,100,100,100,100,100,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000}
linf.puissancevaretatvalue.decission1={1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,3,3,3,3,3,4,4,4,4,4,4,4,4,4,4,5,5,5,5,5,5,5,5}
linf.puissancevaretatvalue.decission2={2,2,2,2,2,2,2,3,3,3,3,3,3,3,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,5,5,5,5,5,5,5,5}
linf.puissancevaretatvalue.decission3={1,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,3,3,3,4,4,4,4,4,4,4,4}
linf.puissancevaretatvalue.decission4={2,2,2,2,3,3,3,3,3,3,3,3,3,4,4,4,4,4,5,5,5,5,5,5,5,5,5,5,5,5,6,6,6,6,6,6,6,6}
linf.puissancevaretatvalue.decission6={1,1,1,1,1,1,1,1,1,1,1,1,2,2,2,2,3,3,3,3,3,3,3,3,3,4,4,4,4,4,5,5,5,5,5,5,5,5}
linf.puissancevaretatvalue.nbboss={0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,2,2,2,2,3,3,3,3,3,3,4,4,4,4,4,5,5,5,5,5,5,5,5,5,5}
linf.puissancevaretatvalue.puissancevagueppp={0.2,0.2,0.3,0.3,0.3,0.3,0.3,0.3,0.3,0.3,0.3,0.3,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.5,0.5,0.5,0.5,0.6,0.6,0.6,0.6,0.6,0.6,0.6,0.6,0.6}
linf.puissancevaretatvalue.varviemech={1,1,1,1,1,1,1.2,1.3,1.4,1.6,1.7,1.9,2,2.2,2.5,2.8,3.1,3.4,3.7,4,4.3,4.6,5,5.4,5.9,6.4,7,7.6,8,9,10,11,11,11,11,11,11,12,13,14}--bien calibrer car plus cette variable diminu propotionnelement attaque de la vague

linf.aidenbreelsoldatinf=0
meilleursoldat()
--variation de la dificulté suivant le niveau du joueur
linf.progressionsoldatvagueold=0	--point max atteint par les soldats de la vague d'avant
progressionsoldatvague=0 --point max atteint par les soldats
moyennesoldatmort=0
moyenneprogression=0
moyenneprogressionmoy=0
linf.moyennesoldatmortmoy=0
linf.progressionsoldatvaguemoy=50
nbsoldatpasse=0 --nb de soldat passer pendant la vague
varattgent=1 --variation en pourcentage
varviemech=1 --variation en pourcentage de la vie des mechant et de la tune qu'il rapporte (AI ne gere pas ca, faut il qu'il s'en preoccupe?)
-- clicacce=0 --si on clique sur accelerer aucune depression
linf.nbwavessep=0
linf.nbwavessep10=0 -- 10 vagues sans perte de vie

linf.nbvaguevar=0-- cas ou 3 vagues d'affilé ont une variation supperieur a 0 
linf.vagueplusplus=1
linf.nbvar0=0
linf.nbvar0base=0
--linf.nbvar1base=0
linf.oldmoy={} -- stoke les deux derniers resultat si il sont proches ils sont considéré comme la moyenne
linf.oldmoy.progressionsoldatvaguemoy={300,200}
linf.oldmoy.moyennesoldatmort={300,200}
linf.oldmoy.moyenneprogression={300,200}

-- if pointdeppro~=nil then
-- 	linf.sommeprob=0
-- 	for i=1,#pointdep+1 do
-- 		if pointdeppro[i]==nil then
-- 			pointdeppro[i]=0.5
-- 		end
-- 		linf.sommeprob=linf.sommeprob+pointdeppro[i]
-- 	end
-- end

local function niveaudedifajuste(l) --ajouter decission 5,6,7
	local difficultevar=0

	--cas ou les ennemis arrivent regulierement presque au bout du chemin
	if moyenneprogression>cheminnb-10 then
		difficultevar=difficultevar+1
		print("difficultevar moyenneprogression>cheminnb-20")
	end
	if moyennesoldatmort>cheminnb-7 then
		difficultevar=difficultevar+1
		print("difficultevar moyennesoldatmort>cheminnb-15")
	end
	if progressionsoldatvague>cheminnb-5 then
		difficultevar=difficultevar+1
		print("difficultevar progressionsoldatvague>cheminnb-10")
	end
	--
	if nbsoldatpasse~=0 then
		difficultevar=difficultevar+7*nbsoldatpasse
		print("difficultevar ennemi passe "..nbsoldatpasse)
		linf.nbwavessep=0
		linf.nbwavessep10=0
	elseif l==2 then 
		moyenneprogressionmoy=progressionsoldatvague
		moyenneprogression=progressionsoldatvague
		linf.moyennesoldatmortmoy=progressionsoldatvague
		moyennesoldatmort=progressionsoldatvague
		linf.progressionsoldatvagueold=progressionsoldatvague
		print("premiere init "..progressionsoldatvague)
		linf.nbwavessep=linf.nbwavessep+1
	else
		linf.nbwavessep=linf.nbwavessep+1
		linf.nbwavessep10=linf.nbwavessep10+1
	end
	if moyenneprogressionmoy+1<moyenneprogression then
		local calcul=mathfloor((moyenneprogression-moyenneprogressionmoy)^0.2)
		moyenneprogressionmoy=mathfloor(moyenneprogressionmoy*1.1)
		difficultevar=difficultevar+calcul
		print("difficultevar moypro"..moyenneprogression.." - "..moyenneprogressionmoy.." result "..calcul)
	end
	if linf.moyennesoldatmortmoy+2<moyennesoldatmort then
		local calcul=mathfloor((moyennesoldatmort-linf.moyennesoldatmortmoy)^0.2)
		linf.moyennesoldatmortmoy=mathfloor(linf.moyennesoldatmortmoy*1.1)
		difficultevar=difficultevar+calcul
		print("difficultevar moymort"..moyennesoldatmort.." - "..linf.moyennesoldatmortmoy.." result "..calcul)
	end
	if progressionsoldatvague>moyenneprogressionmoy*1.3 or progressionsoldatvague>linf.moyennesoldatmortmoy*1.3 then
		if linf.progressionsoldatvagueold+5<progressionsoldatvague and linf.progressionsoldatvaguemoy+1<progressionsoldatvague then
			local comparaison=linf.progressionsoldatvagueold
			if comparaison<linf.progressionsoldatvaguemoy then
				comparaison=linf.progressionsoldatvaguemoy
			end
			local calcul=mathfloor((progressionsoldatvague-comparaison)^0.2)
			difficultevar=difficultevar+calcul
			print("difficultevar point"..progressionsoldatvague.." - "..comparaison.." result "..calcul)
		end
	end
	-- if clicacce==1 then
	-- 	--clicacce=0
	-- 	difficultevar=0
	-- 	print("clic sur accelerer donc aucune pression necessaire")
	-- end
	if difficultevar==1 then
		for i=linf.puissancevaretat,30 do
			linf.puissancevaretatetape[i]=linf.puissancevaretatetape[i]+difficultevar
		end
		if linf.puissancevagueplusplus~=0 then
			linf.puissancevagueplusplus=mathfloor(0.5*linf.puissancevagueplusplus*10)*0.1
			--difficultevar=difficultevar-1
			print("moyen de pression niveau -1 puissancevagueplusplus/2="..linf.puissancevagueplusplus)
		end
	end
	if difficultevar==0 then
		linf.nbvar0=linf.nbvar0+1
		linf.nbvar0base=linf.nbvar0base+1
		linf.nbvaguevar=0
	else
		linf.nbvar0=0
		linf.nbvar0base=0
		linf.nbvaguevar=linf.nbvaguevar+1
	end
	if linf.vagueppp~=0 then
		if difficultevar==1 then
			linf.vagueppp=0
		end
	end
	difficultevar=(difficultevar-1)*2
	if difficultevar<0 then
		difficultevar=0
	end
	print("le niveau est trop dure de "..difficultevar)
	if difficultevar~=0 then
		local varetat=difficultevar
		if varetat>20 then
			varetat=20
		end
		for i=linf.puissancevaretat,30 do
			linf.puissancevaretatetape[i]=linf.puissancevaretatetape[i]+varetat
		end
			--if linf.vagueppp<=0 then
			--linf.vagueppp=linf.vagueppp-1
		--else
		if linf.nbvaguevar>2 then
			difficultevar=difficultevar-linf.nbvaguevar+2
			print(linf.nbvaguevar.." pression d'affilé".."donc diminution de la pression difficultevar="..difficultevar.."-"..linf.nbvaguevar+2)
		end
		if difficultevar>0 then
			if linf.vagueppp>0 then
				linf.vagueppp=0
				difficultevar=difficultevar-1
				print("moyen de pression niveau 0 linf.vagueppp="..linf.vagueppp)
			end	
		end	
		if difficultevar>0 then
			if linf.puissancevagueppp~=0 then
				linf.vagueplusplus=linf.puissancevagueppp
				linf.puissancevagueppp=0
				difficultevar=difficultevar-1
				print("moyen de pression niveau 1 puissancevagueppp=0")
			end
		end
		if difficultevar>0 then
			if linf.puissancevagueplusplus>0 then
				difficultevar=difficultevar-linf.puissancevagueplusplus
				linf.puissancevagueplusplus=0
				print("moyen de pression niveau 2 puissancevagueplusplus=0")
			end
		end
		if difficultevar>0 then
			if linf.decission6>1 then
				linf.decission6=1
				difficultevar=difficultevar-1
			end
		end
		if difficultevar>0 then
			if linf.puissanceminobj>0 then
				linf.puissanceminobj=linf.puissanceminobj-1
				difficultevar=difficultevar-1
			end
		end
		if difficultevar>0 then
			if linf.puissancemaxobj>2 then
				linf.puissancemaxobj=linf.puissancemaxobj-1
				difficultevar=difficultevar-1
			end
		end
		if difficultevar>0 then
			if linf.decission1>1 then
				linf.decission1=linf.decission1-1
				difficultevar=difficultevar-1
			end
		end
		if difficultevar>0 then
			if linf.decission2>2 then
				linf.decission2=linf.decission2-1
				difficultevar=difficultevar-1
			end
		end
		if difficultevar>0 then
			if linf.decission3>1 then
				linf.decission3=linf.decission3-1
				difficultevar=difficultevar-1
			end
		end
		if difficultevar>0 then
			if linf.decission4>3 then
				linf.decission4=linf.decission4-1
				difficultevar=difficultevar-1
			end
		end
		if difficultevar>0 then
			if linf.nbboss>0 then
				linf.nbboss=linf.nbboss-1
				difficultevar=difficultevar-1
			end
		end
		
		
		if difficultevar>0 then
			local compteurdevar=0
			while difficultevar>0 and compteurdevar<3 do
				difficultevar=difficultevar-25
				varattgent=mathfloor(varattgent*1.2*10)*0.1
				compteurdevar=compteurdevar+1
			end
			print("moyen de pression niveau 3 affaiblissement des ennemi "..varattgent)
		end
	else
		if linf.vagueppp<0 then
			linf.vagueppp=0
		else
			linf.vagueppp=linf.vagueppp+1/dureepartie1
			print("moyen de depression niveau 0 vagueppp "..linf.vagueppp)
		end
		if varattgent~=1 then
			varattgent=mathfloor(varattgent*0.7*10)*0.1
			if varattgent<1.1 then
				varattgent=1
			end
			linf.nbvar0=0
			print("moyen de depression niveau 1 renforcement des ennemis "..varattgent)
		elseif linf.vagueplusplus~=0 then
			linf.puissancevagueppp=linf.vagueplusplus
			linf.vagueplusplus=0
			linf.nbvar0=0
			print("moyen de depression niveau 2 puissancevagueppp "..linf.puissancevagueppp)
		elseif linf.puissanceminobj~=linf.puissancevaretatvalue.puissanceminobj[linf.puissancevaretat] then
			linf.puissanceminobj=linf.puissancevaretatvalue.puissanceminobj[linf.puissancevaretat]
			if linf.puissancemaxobj~=linf.puissancevaretatvalue.puissancemaxobj[linf.puissancevaretat] then
				linf.puissancemaxobj=linf.puissancevaretatvalue.puissancemaxobj[linf.puissancevaretat]
			end
			linf.nbvar0=0
			print("moyen de depression niveau 2.1 puissancemin ")
		elseif linf.decission1~=linf.puissancevaretatvalue.decission1[linf.puissancevaretat] then
			linf.decission1=linf.puissancevaretatvalue.decission1[linf.puissancevaretat]
			if linf.decission2~=linf.puissancevaretatvalue.decission2[linf.puissancevaretat] then
				linf.decission2=linf.puissancevaretatvalue.decission2[linf.puissancevaretat]
			end
			linf.nbvar0=0
			print("moyen de depression niveau 2.2 decission1 ")
		elseif linf.decission3~=linf.puissancevaretatvalue.decission3[linf.puissancevaretat] then
			linf.decission3=linf.puissancevaretatvalue.decission3[linf.puissancevaretat]
			if linf.decission4~=linf.puissancevaretatvalue.decission4[linf.puissancevaretat] then
				linf.decission4=linf.puissancevaretatvalue.decission4[linf.puissancevaretat]
			end
			print("moyen de depression niveau 2.3 decission3 ")
			linf.nbvar0=0
		elseif linf.nbboss~=linf.puissancevaretatvalue.nbboss[linf.puissancevaretat] then
			linf.nbboss=linf.puissancevaretatvalue.nbboss[linf.puissancevaretat]
			if linf.decission6~=linf.puissancevaretatvalue.decission6[linf.puissancevaretat] then
				linf.decission6=linf.puissancevaretatvalue.decission6[linf.puissancevaretat]
			end
			print("moyen de depression niveau 2.4 nbboss ")
			linf.nbvar0=0
		elseif linf.decission4~=linf.puissancevaretatvalue.decission4[linf.puissancevaretat] or linf.decission2~=linf.puissancevaretatvalue.decission2[linf.puissancevaretat] or linf.puissancemaxobj~=linf.puissancevaretatvalue.puissancemaxobj[linf.puissancevaretat] or linf.decission6~=linf.puissancevaretatvalue.decission6[linf.puissancevaretat] then
			linf.decission4=linf.puissancevaretatvalue.decission4[linf.puissancevaretat]
			linf.decission2=linf.puissancevaretatvalue.decission2[linf.puissancevaretat]
			linf.puissancemaxobj=linf.puissancevaretatvalue.puissancemaxobj[linf.puissancevaretat]
			linf.decission6=linf.puissancevaretatvalue.decission6[linf.puissancevaretat]
			print("moyen de depression niveau 2.5 decission4 decission2 puissancemax ")
			linf.nbvar0=0
		elseif linf.progressionsoldatvaguemoy>progressionsoldatvague then
			linf.puissancevagueplusplus=linf.puissancevagueplusplus+1
			print("moyen de depression niveau 3 puissancevagueplusplus "..linf.puissancevagueplusplus)
		end
		if linf.nbvar0base==3 then
			linf.puissanceminobj=linf.puissancevaretatvalue.puissanceminobj[linf.puissancevaretat]
			linf.decission1=linf.puissancevaretatvalue.decission1[linf.puissancevaretat]
			linf.decission3=linf.puissancevaretatvalue.decission3[linf.puissancevaretat]
			linf.nbboss=linf.puissancevaretatvalue.nbboss[linf.puissancevaretat]
			linf.decission4=linf.puissancevaretatvalue.decission4[linf.puissancevaretat]
			linf.decission2=linf.puissancevaretatvalue.decission2[linf.puissancevaretat]
			linf.puissancemaxobj=linf.puissancevaretatvalue.puissancemaxobj[linf.puissancevaretat]
			linf.decission6=linf.puissancevaretatvalue.decission6[linf.puissancevaretat]
			print("moyen de depression 2.6 depression totale")
		elseif linf.nbvar0base==4 and linf.nbvar0<2 then
			print("nbvar0base==4 linf.nbvar0 "..linf.nbvar0.." maintenant vaut 2")
			linf.nbvar0=2
		elseif	linf.nbvar0base==5 and linf.nbvar0<4 then
			linf.nbvar0=4
		elseif linf.nbvar0base==6 and linf.nbvar0<6 then
			linf.nbvar0=6
		end
		if linf.nbvar0>1 then
			linf.vagueppp=mathfloor(linf.puissancevague/30*linf.nbvar0*10)*0.1+linf.nbvar0/dureepartie1
			print("moyen de depression niveau 4 linf.nbvar0 "..linf.nbvar0.." linf.vagueppp "..linf.vagueppp)
		end
		-- if linf.nbvar0>=6 then
		-- 	linf.nbvar0=0
		-- 	linf.nbvar0base=0
		-- end
	end

	
	if mathfloor(l*0.1)*10==l and l>1 then
		local nbmoins=l*0.1-1
		local cptlevinf=ennemipasse
		while cptlevinf>=ennemipassedep-nbmoins do
			linf.puissancevague=mathfloor(linf.puissancevague*1.1)
			print("augmentation de 10% car l="..l.." ennemipasse "..ennemipasse.." sur ennemipassedep "..ennemipassedep)
			cptlevinf=cptlevinf-2
		end
	elseif linf.nbwavessep>=5 then
		linf.puissancevague=mathfloor(linf.puissancevague*1.1)
		print("augmentation de 10% car 5 vague sans perte")
		linf.nbwavessep=2
	end
	if linf.nbwavessep10>=10 then
		linf.puissancevague=mathfloor(linf.puissancevague*1.1)
	end

	linf.progressionsoldatvagueold=progressionsoldatvague
	progressionsoldatvague=0
	linf.progressionsoldatvaguemoy=mathfloor((linf.progressionsoldatvagueold*0.1+0.9*linf.progressionsoldatvaguemoy)*10)*0.1
	nbsoldatpasse=0
	linf.moyennesoldatmortmoy=mathfloor((linf.moyennesoldatmortmoy*0.7+moyennesoldatmort*0.3)*100)*0.01
	moyenneprogressionmoy=mathfloor((moyenneprogressionmoy*0.7+moyenneprogression*0.3)*100)*0.01

	linf.oldmoy.progressionsoldatvaguemoy[2]=linf.oldmoy.progressionsoldatvaguemoy[1]
	linf.oldmoy.progressionsoldatvaguemoy[1]=linf.progressionsoldatvagueold
	linf.oldmoy.moyennesoldatmort[2]=linf.oldmoy.moyennesoldatmort[1]
	linf.oldmoy.moyennesoldatmort[1]=moyennesoldatmort
	linf.oldmoy.moyenneprogression[2]=linf.oldmoy.moyenneprogression[1]
	linf.oldmoy.moyenneprogression[1]=moyenneprogression

	local moyennelocal1=linf.oldmoy.progressionsoldatvaguemoy[1]*0.5+linf.oldmoy.progressionsoldatvaguemoy[2]*0.5
	if mathabs(linf.oldmoy.progressionsoldatvaguemoy[1]-moyennelocal1)<5 and  mathabs(linf.oldmoy.progressionsoldatvaguemoy[2]-moyennelocal1)<5 and mathabs(linf.progressionsoldatvaguemoy-moyennelocal1)>9 then
		print("reajustement linf.progressionsoldatvaguemoy meme moyenne "..linf.progressionsoldatvaguemoy.." nouvelle moy "..moyennelocal1)
		linf.progressionsoldatvaguemoy=moyennelocal1
	end
	moyennelocal1=linf.oldmoy.moyennesoldatmort[1]*0.5+linf.oldmoy.moyennesoldatmort[2]*0.5
	if mathabs(linf.oldmoy.moyennesoldatmort[1]-moyennelocal1)<5 and  mathabs(linf.oldmoy.moyennesoldatmort[2]-moyennelocal1)<5 and linf.oldmoy.moyennesoldatmort[1]~=linf.oldmoy.moyennesoldatmort[2] and mathabs(linf.moyennesoldatmortmoy-moyennelocal1)>9 then
		print("reajustement linf.moyennesoldatmortmoy meme moyenne "..linf.moyennesoldatmortmoy.." nouvelle moy "..moyennelocal1)
		linf.moyennesoldatmortmoy=moyennelocal1
	end
	moyennelocal1=linf.oldmoy.moyenneprogression[1]*0.5+linf.oldmoy.moyenneprogression[2]*0.5
	if mathabs(linf.oldmoy.moyenneprogression[1]-moyennelocal1)<5 and  mathabs(linf.oldmoy.moyenneprogression[2]-moyennelocal1)<5 and mathabs(moyenneprogressionmoy-moyennelocal1)>9  then
		print("reajustement moyenneprogressionmoy meme moyenne "..moyenneprogressionmoy.." nouvelle moy "..moyennelocal1)
		moyenneprogressionmoy=moyennelocal1
	end
end
local function evolutionlevel(l) --ajouter decission 5,7
	linf.puissancevaretatactif=false
	local cptmoinsde2plus=0
	while linf.puissancevaretatetape[linf.puissancevaretat]<linf.puissancevague and cptmoinsde2plus<2 do
		linf.puissancevaretat=linf.puissancevaretat+1
		linf.puissancevaretatactif=true
		print("passage au niveau superieur "..linf.puissancevaretat.." avec une puissance de "..linf.puissancevague)
		cptmoinsde2plus=cptmoinsde2plus+1
	end
	if cptmoinsde2plus<1 then
		if mathfloor(l/5)==l/5 then -- passage d'etape 5,10... et pas de variation de difficulté
			linf.puissancevague=linf.puissancevaretatetape[linf.puissancevaretat+1]+1
			linf.puissancevaretat=linf.puissancevaretat+1
			linf.puissancevaretatactif=true
		end
	end
	if linf.puissancevaretatactif==true or l==1 then
		linf.puissanceminobj=linf.puissancevaretatvalue.puissanceminobj[linf.puissancevaretat]
		linf.puissancemaxobj=linf.puissancevaretatvalue.puissancemaxobj[linf.puissancevaretat]
		linf.decission1=linf.puissancevaretatvalue.decission1[linf.puissancevaretat]
		linf.decission2=linf.puissancevaretatvalue.decission2[linf.puissancevaretat]
		linf.decission3=linf.puissancevaretatvalue.decission3[linf.puissancevaretat]
		linf.decission4=linf.puissancevaretatvalue.decission4[linf.puissancevaretat]
		linf.decission6=linf.puissancevaretatvalue.decission6[linf.puissancevaretat]
		linf.nbboss=linf.puissancevaretatvalue.nbboss[linf.puissancevaretat]
		linf.puissancevagueppp=linf.puissancevaretatvalue.puissancevagueppp[linf.puissancevaretat]
		varviemech=linf.puissancevaretatvalue.varviemech[linf.puissancevaretat]
		if l~=1 then
			if varviemech~=linf.puissancevaretatvalue.varviemech[linf.puissancevaretat-1] then
				local oldpuissancevague=linf.puissancevague
				linf.puissancevague=mathfloor((linf.puissancevague*linf.puissancevaretatvalue.varviemech[linf.puissancevaretat-1])/linf.puissancevaretatvalue.varviemech[linf.puissancevaretat])
				local varpourcent=mathfloor(linf.puissancevague/oldpuissancevague*10)*0.1

				oldpuissancevague=mathfloor(linf.puissancevague-oldpuissancevague)

				local chainecarac="varviemech "..varviemech.." varviemnew val levsup "
				for i=linf.puissancevaretat,30 do
					linf.puissancevaretatetape[i]=linf.puissancevaretatetape[i]-oldpuissancevague
					chainecarac=chainecarac.." "..linf.puissancevaretatetape[i]
				end
				print(chainecarac)
			end
		end
	end
	if l>3 then
		if linf.puissancevague-linf.puissancedelavague<7*(linf.puissanceminobj+1) then
			linf.puissancevague=linf.puissancedelavague+7*(linf.puissanceminobj+1)
		end
	end
end
function vaguesuivanteinf(l)
	print("l "..l)
	if l==1 then
		if mineinfo.nb<2 then
			dureepartie=mathfloor(dureepartie*(mineinfo.nb*0.10+0.7)*10)*0.1 --fait augmenter les gains si il y a moins de deux mines
			print("dureepartie modifié pour equilibré les niveaux avec et sans mine "..dureepartie)
		end
		--linf.puissancevaretat=1+mathfloor(-argentdep/1200)
		linf.puissancevaretat=1 --permet de faire varier comme pour les vagues d'un nivveau à un autre
		local bonusdedep=mathfloor(-argentdep/300)
		if -argentdep/3<500 then
			bonusdedep=0
		end
		if bonusdedep>10 then
			bonusdedep=10
		end
		linf.puissancevague=2+bonusdedep
		while linf.puissancevaretatetape[linf.puissancevaretat]<linf.puissancevague do
			linf.puissancevaretat=linf.puissancevaretat+1
			linf.puissancevaretatactif=true
			print("passage au niveau superieur "..linf.puissancevaretat.." avec une puissance de "..linf.puissancevague)
		end
		print("argentdep"..argentdep)
		linf.puissancevagueplusplus=0
		linf.puissancevagueppp=0.2 -- *mathfloor(-argentdep/15000) -- /-3 pour decrypté
		linf.puissancedelavague=0
		linf.nbsoldatvague=0
		linf.vagueppp=0
		linf.progressionsoldatvagueold=0	--point max atteint par les soldats de la vague d'avant
		progressionsoldatvague=0 --point max atteint par les soldats
		moyennesoldatmort=0
		moyenneprogression=0
		moyenneprogressionmoy=0
		linf.moyennesoldatmortmoy=0
		linf.progressionsoldatvaguemoy=50
		nbsoldatpasse=0 --nb de soldat passer pendant la vague
		varattgent=1 --variation en pourcentage
		varviemech=1 --variation en pourcentage de la vie des mechant et de la tune qu'il rapporte (AI ne gere pas ca, faut il qu'il s'en preoccupe?)
		linf.vagueplusplus=1
		linf.nbvar0=0
		if pointdeppro~=nil then
			linf.sommeprob=0.5
			for i=1,#pointdep+1 do
				if pointdeppro[i]==nil then
					pointdeppro[i]=0.5
				end
				linf.sommeprob=linf.sommeprob+pointdeppro[i]
			end
		end
	end
	--l=
	--for l=1,nbvague do
		if modeinfdif==0 then --aide au joueur
			niveaudedifajuste(l)
		end
		linf.aidenbreelsoldatinf=0
		linf.puissancevagueplusplus=linf.puissancevagueplusplus+linf.puissancevagueppp
		if l>5 then --evite les croissances trop importante
			if (linf.puissancevagueplusplus+linf.vagueppp)/linf.puissancevague>0.3 then
				linf.vagueppp=linf.vagueppp*0.9
				linf.puissancevagueplusplus=linf.puissancevagueplusplus*0.9
				print("pression pour exces de depression >30%")
			end
			-- local cpterror=0
			-- while (linf.puissancevagueplusplus+linf.vagueppp)/linf.puissancevague>0.15 and cpterror<20 do
			-- 	if linf.vagueppp>0 then
			-- 		linf.vagueppp=linf.vagueppp-1
			-- 	else
			-- 		linf.vagueppp=0
			-- 		cpterror=20
			-- 	end
			-- 	cpterror=cpterror+1
			-- end
			-- if cpterror>=20 then
			-- 	print("bug des 20%")
			-- end
		end
		linf.puissancevague=linf.puissancevague+linf.puissancevagueplusplus+linf.vagueppp+mathfloor(linf.puissancevague*0.05/dureepartie1)
		linf.nbsoldatvague=0
		evolutionlevel(l)
		--print("vague numero"..l)
			-- if puissancevague>10 then --remplacer tout les variation par niveau par celle de puissancevague, permet de mieux adapter le niveau

			-- end
			-- if puissancevague>20 then
			-- 	nbboss=1
			-- end
			-- if puissancevague>30 then
			-- 	nbboss=nbboss+2
			-- end
			-- if puissancevague>40
			-- if l==20 or l==30 or l==40 then
			-- 	linf.nbboss=linf.nbboss+1
			-- end
			-- if l==7 or l==14 or l==21 then 
			-- 	linf.puissancemaxobj=linf.puissancemaxobj+1
			-- end
			-- if l==28 or l==35 or l==42 or l==49 or l==56 then
			-- 	linf.puissancemaxobj=linf.puissancemaxobj+3
			-- end
			-- if l==60 then
			-- 	linf.puissancemaxobj=100
			-- end
			-- if l==10 or l==20 then
			-- 	linf.puissancevagueppp=0
			-- end
			-- if l==13 or l==23 then
			-- 	linf.puissancevagueppp=0.3
			-- end
			-- if l==26 or l==42 then
			-- 	linf.puissancevagueppp=linf.puissancevagueppp+0.5
			-- end
			-- if l==15 or l==23 or l==30 then
			-- 	linf.decission1=linf.decission1+1
			-- end
			-- if l==9 or l==16 or l==23 or l==30 or l==37 or l==44 then
			-- 	linf.decission3=linf.decission3+1
			-- end
			-- if l==12 or l==27 then
			-- 	linf.decission2=linf.decission2+1
			-- end
			-- if l==15 or l==24 or l==30 then
			-- 	linf.puissanceminobj=linf.puissanceminobj+1
			-- end
			-- if l==27 or l==35 then
			-- 	linf.puissanceminobj=linf.puissanceminobj+3
			-- end
			-- if l==15 or l==20 or l==25 then
			-- 	linf.decission4=linf.decission4+1
		-- end
		while linf.puissancedelavague<linf.puissancevague do
			if mathrandom(linf.decission5,linf.decission6)>0 then
				if mathrandom(linf.decission7,linf.decission1)<1 then
					linf.nbsoldatvague=linf.nbsoldatvague+1
					if mathrandom(0,2)==0 then
						vague[l][linf.nbsoldatvague]=0
						--print(l.." "..nbsoldatvague.." ".."0")
					else
						vague[l][linf.nbsoldatvague]=1
						--print(l.." "..nbsoldatvague.." ".."1")
					end
				else
					local nbfoisnbspwansametime=1
					if linf.decission3~=1 then
						nbfoisnbspwansametime=mathrandom(1,linf.decission3)
					end
					for o=1, nbfoisnbspwansametime do
						local nbspawnsametime=2
						if linf.decission4~=2 and linf.decission2<linf.decission4 then
							nbspawnsametime=mathrandom(linf.decission2,linf.decission4)
							if nbspawnsametime<2 then
								nbspawnsametime=2
							end
						end
						if pointdep~=nil then
							if pointdeppro==nil then
								local randomspawnpoint=mathrandom(0,#pointdep)
								print("randomspawnpoint"..randomspawnpoint)
								if randomspawnpoint~=0 then
									linf.nbsoldatvague=linf.nbsoldatvague+1
									vague[l][linf.nbsoldatvague]=-randomspawnpoint
								end
							else
								local randomspawnpoint=mathrandom(0,linf.sommeprob*100)*0.01
								local valeurcum=1
								local entrechoisi=0
								print("randomspawnpoint"..randomspawnpoint)
								if randomspawnpoint>1 then
									for i=1,#pointdeppro do
										valeurcum=valeurcum+pointdeppro[i]
										if valeurcum>=randomspawnpoint then
											entrechoisi=i-1
										end
									end
								end
								if entrechoisi~=0 then
									linf.nbsoldatvague=linf.nbsoldatvague+1
									vague[l][linf.nbsoldatvague]=-entrechoisi
								end
							end
						end
						linf.nbsoldatvague=linf.nbsoldatvague+1
						vague[l][linf.nbsoldatvague]=nbspawnsametime

						--print(l.." "..nbsoldatvague.." "..nbspawnsametime)
						local lenb=vaguealeaspwansoldier(l,linf.puissanceminobj-1,linf.puissancemaxobj-1)
						for m=1,nbspawnsametime-1 do
							linf.nbsoldatvague=linf.nbsoldatvague+1
							vague[l][linf.nbsoldatvague]=lenb
							linf.aidenbreelsoldatinf=linf.aidenbreelsoldatinf+1
						end
					end
				end
			else
				if pointdep~=nil then
					if pointdeppro==nil then
						local randomspawnpoint=mathrandom(0,#pointdep)
						print("randomspawnpoint"..randomspawnpoint)
						if randomspawnpoint~=0 then
							linf.nbsoldatvague=linf.nbsoldatvague+1
							vague[l][linf.nbsoldatvague]=-randomspawnpoint
						end
					else
						local randomspawnpoint=mathrandom(0,linf.sommeprob)
						local valeurcum=1
						local entrechoisi=0
						print("randomspawnpoint"..randomspawnpoint)
						if randomspawnpoint>1 then
							for i=1,#pointdeppro do
								valeurcum=valeurcum+pointdeppro[i]
								if valeurcum>=randomspawnpoint then
									entrechoisi=i-1
								end
							end
						end
						if entrechoisi~=0 then
							linf.nbsoldatvague=linf.nbsoldatvague+1
							vague[l][linf.nbsoldatvague]=-entrechoisi
						end
					end
				end
				-- if pointdep~=nil then
				-- 	local randomspawnpoint=mathrandom(0,#pointdep)
				-- 	print("randomspawnpoint"..randomspawnpoint)
				-- 	if randomspawnpoint~=0 then
				-- 		linf.nbsoldatvague=linf.nbsoldatvague+1
				-- 		vague[l][linf.nbsoldatvague]=-randomspawnpoint
				-- 	end
				-- end
				vaguealeaspwansoldier(l,linf.puissanceminobj,linf.puissancemaxobj)
			end
			--print("test0")
		end
		if linf.nbsoldatvague<2 then
			linf.nbsoldatvague=linf.nbsoldatvague+1
			vague[l][linf.nbsoldatvague]=200
			linf.nbsoldatvague=linf.nbsoldatvague+1
			vague[l][linf.nbsoldatvague]=200
		end
		if linf.nbboss>0 then
			for o=1,linf.nbboss do
				vaguealeaspwansoldier(l,linf.puissanceminobj,linf.puissancemaxobj,1)
			end
		end
		vague[l].nb=linf.nbsoldatvague
		if l==1 then
			vague[l][1]=260
			vague[l][2]=0
			vague[l][3]=200
			if vague[l].nb<3 then
				vague[l].nb=3
			end
		end
		linf.puissancedelavague=-linf.puissancevague+linf.puissancedelavague
		print("vague "..l.." a "..linf.aidenbreelsoldatinf.." soldat, puissance "..linf.puissancevague.." exces puissance "..linf.puissancedelavague.." puissancevagueplusplus "..linf.puissancevagueplusplus.." puissancevagueppp "..linf.puissancevagueppp.." vagueppp "..linf.vagueppp.." varviemech "..varviemech)
		if issimulator then
			local chainedesoldat=""
			for m=1,vague[l].nb do
				chainedesoldat=chainedesoldat..","..vague[l][m]
			end
			print("vague["..l.."]={nb="..vague[l].nb..chainedesoldat.."}")
		end
	--end
end
-- for l=1,10,1 do
-- 	local chainedesoldat=""
-- 	for m=1,vague[l].nb do
-- 		chainedesoldat=chainedesoldat..","..vague[l][m]
-- 	end
-- 	print("vague["..l.."]={nb="..vague[l].nb..chainedesoldat.."}")
-- end
return (t)