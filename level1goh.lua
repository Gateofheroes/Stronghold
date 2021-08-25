local t={}
t.new=function()--gestion du niveau 1 du jeu, doit toujours suivre le meme modele
	-- map1=display.newImage(map1sheet,1) -- display.newImage( "goh/carte/level1/carte1a.jpg", 0,0,true )--devrai etre en local pour niveau1
	-- map1.x=0
	-- map1.y=0
	--map1p=display.newCircle(0,0,10) --display.newImage(map1psheet,1) -- display.newImage( "goh/carte/level1/carte1p.jpg", 0,0,true )
	--map1p.x=0
	--map1p.y=0
	--map1.xScale=2
	--map1.yScale=2
	pouvoirdisp=0
	--argent=300
	--ennemipasse=10--nombre d'ennemi qui peuvent encore passer avant qu'on perdre---------------------------------------------------------------------------------------------------------------------

	t=1
end
t.affichagecarte=function(pole)
	if donneecharger[1]==0 then
		donneecharger[1]=1
		if issimulator then
			local memUsed = (collectgarbage("count")) / 1000
			local texUsed = system.getInfo( "textureMemoryUsed" ) / 1000000
			--print("\n---------MEMORY USAGE INFORMATION chargement1 avant---------")
			--print("System Memory Used:", string.format("%.03f", memUsed), "Mb")
			print("Texture Memory Used avant chargement level1: ", string.format("%.03f", texUsed), "Mb")
		end
		map1sheethg=graphics.newImageSheet( "goh/carte/level1/hd.jpg", { width=2048, height=1024, numFrames=1,sheetContentWidth=2048,sheetContentHeight=1024 } )
		map1sheethd=graphics.newImageSheet( "goh/carte/level1/hg.jpg", { width=2048, height=1024, numFrames=1,sheetContentWidth=2048,sheetContentHeight=1024 } )
		map1sheetbg=graphics.newImageSheet( "goh/carte/level1/bd.jpg", { width=2048, height=1024, numFrames=1,sheetContentWidth=2048,sheetContentHeight=1024 } )
		map1sheetbd=graphics.newImageSheet( "goh/carte/level1/bg.jpg", { width=2048, height=1024, numFrames=1,sheetContentWidth=2048,sheetContentHeight=1024 } )
		map1sheeto1=graphics.newImageSheet( "goh/carte/level1/left_tree.png", { width=274, height=294, numFrames=1,sheetContentWidth=274,sheetContentHeight=294 } )
		map1sheeto2=graphics.newImageSheet( "goh/carte/level1/mid_tree.png", { width=810, height=618, numFrames=1,sheetContentWidth=810,sheetContentHeight=618 } )
		
		if issimulator then
			local memUsed = (collectgarbage("count")) / 1000
			local texUsed = system.getInfo( "textureMemoryUsed" ) / 1000000
			--print("\n---------MEMORY USAGE INFORMATION chargement1 avant---------")
			--print("System Memory Used:", string.format("%.03f", memUsed), "Mb")
			print("Texture Memory Used apres chargement level1: ", string.format("%.03f", texUsed), "Mb")
		end
	end

	hg=display.newImage(map1sheethg,1) --display.newImage( "goh/carte/level2/hg.jpg", -1024,-512,true )
	hg.x=-1024
	hg.y=-512
	hd=display.newImage(map1sheethd,1) --display.newImage( "goh/carte/level2/hd.jpg",1024,-512,true )
	hd.x=1024
	hd.y=-512
	bg=display.newImage(map1sheetbg,1) --display.newImage( "goh/carte/level2/bg.jpg", -1024,512,true )
	bg.x=-1024
	bg.y=512
	bd=display.newImage(map1sheetbd,1) --display.newImage( "goh/carte/level2/bd.jpg", 1024,512,true )
	bd.x=1024
	bd.y=512
	-- obd=display.newImage(map1sheetobd,1) --display.newImage( "goh/carte/level2/bd.jpg", 1024,512,true )
	-- obd.x=1024
	-- obd.y=512
	if pole==0 then
		map1=display.newGroup()
		map1:insert(hg)
		map1:insert(hd)
		map1:insert(bg)
		map1:insert(bd)
	elseif pole==1 then
		print(map2)
		map2=display.newGroup()
		map2:insert(hg)
		map2:insert(hd)
		map2:insert(bg)
		map2:insert(bd)
	end
end
t.donneebase=function ()--donnees de bases sur le niveau
	local tunededep=200 --0
	local nbperso=leveldata[1].life
	if modeinfini or modesquelette then
		tunededep=tunedep
		nbperso=10
	end
	if modewave then
		tunededep=2000
		nbperso=1
	end
	argentdep=-(tunededep)*3--hugo modifier uniquement le nombre le reste permet de crypter la donné-------------------------------------------------------------------
	ennemipassedep=nbperso--nombre d'ennemi qui peuvent encore passer avant qu'on perdre---hugo------------------------------------------------------------------------------------------------------------------
end

t.chemi=function()--donnees sur les differents points de la carte
local point= require( "point" )
cheminlargeur=1 --2 -- largeur de la zone non construcible autour du chemin
genepointinit=25
-- distancedetection=1 -- distance de detection si <1 les soldats se detecteront de moins loin
intersection={}
intersection.nb=0--2
--exemple
--intersection[1]={pt=11, ty=1, un=1, deux=13}
--intersection[2]={pt=25, ty=0, un=27}
--intersection[1]={pt=18, ty=2, un=29, deux=20,proba=2}
--intersection[2]={pt=20, ty=2, un=30, deux=22,proba=2}
--chemin[10].rayon=1000 --taille de la zone ou peut se trouver les gentils
--chemin[10].mechant=0.2 --recerement du chemin ils vont plus etre aussi ecarté
--intersection[2]={pt=46, ty=0, un=21}
cheminarr=nil
-- cheminarr={} --si des chemins sont des arrivés
-- cheminarr[1]=25 --fin numero 2 du chemin
-- cheminarr[2]=12 --fin numero 3 du chemin

-- pointdeppro={}
-- pointdeppro[1]=0.25 -- probabilité pour le levelinf de l'entré numero i (pointdep[i+1]) , pour une meme probabilité que sur les autres entré mettre 0.5. Min 0, max 1, avec deux chiffres apres la virgule max

cheminnb=29-- --nombre de point definisant le chemin -1--------------------------------------------------------------------------------------------------
chemin={}
--chemin[10].rayon=1000 --taille de la zone ou peut se trouver les gentils
--chemin[10].mechant=0.2 --recerement du chemin ils vont plus etre aussi ecarté

chemin[1]=point.new(-625,-145)	chemin[1].mechant=1		chemin[1].rayon=2000
chemin[2]=point.new(-576,-126)	chemin[2].mechant=1		chemin[2].rayon=2000
chemin[3]=point.new(-535,-114)	chemin[3].mechant=0.8	chemin[3].rayon=2000
chemin[4]=point.new(-495,-101)	chemin[4].mechant=0.8	chemin[4].rayon=2000
chemin[5]=point.new(-452,-92)	chemin[5].mechant=0.8	chemin[5].rayon=2000
chemin[6]=point.new(-410,-82)	chemin[6].mechant=1.1	chemin[6].rayon=2000
chemin[7]=point.new(-367,-79)	chemin[7].mechant=1.3	chemin[7].rayon=2000
chemin[8]=point.new(-323,-73)	chemin[8].mechant=1.2	chemin[8].rayon=1000
chemin[9]=point.new(-280,-70)	chemin[9].mechant=1.2	chemin[9].rayon=1000
chemin[10]=point.new(-234,-69)	chemin[10].mechant=1.3	chemin[10].rayon=1000
chemin[11]=point.new(-194,-66)	chemin[11].mechant=1.3	chemin[11].rayon=1000
chemin[12]=point.new(-150,-56)	chemin[12].mechant=1.4	chemin[12].rayon=1000
chemin[13]=point.new(-109,-52)	chemin[13].mechant=1.4	chemin[13].rayon=1000
chemin[14]=point.new(-68,-44)	chemin[14].mechant=1.4	chemin[14].rayon=1000
chemin[15]=point.new(-25,-35)	chemin[15].mechant=1.5	chemin[15].rayon=1000
chemin[16]=point.new(10,-12)	chemin[16].mechant=1.6	chemin[16].rayon=1000
chemin[17]=point.new(39,14)		chemin[17].mechant=1.7	chemin[17].rayon=1000
chemin[18]=point.new(72,38)		chemin[18].mechant=1.6	chemin[18].rayon=1000
chemin[19]=point.new(118,38)	chemin[19].mechant=1.3	chemin[19].rayon=1000
chemin[20]=point.new(163,37)	chemin[20].mechant=1.1	chemin[20].rayon=1000
chemin[21]=point.new(205,36)	chemin[21].mechant=1.1	chemin[21].rayon=1000
chemin[22]=point.new(250,35)	chemin[22].mechant=1.1	chemin[22].rayon=1000
chemin[23]=point.new(294,35)	chemin[23].mechant=1.3	chemin[23].rayon=1000
chemin[24]=point.new(336,33)	chemin[24].mechant=1.4	chemin[24].rayon=1000
chemin[25]=point.new(376,44)	chemin[25].mechant=1.4	chemin[25].rayon=1000
chemin[26]=point.new(416,52)	chemin[26].mechant=1.6	chemin[26].rayon=1000
chemin[27]=point.new(464,61)	chemin[27].mechant=1.7	chemin[27].rayon=1000
chemin[28]=point.new(504,73)	chemin[28].mechant=1.6	chemin[28].rayon=1000
chemin[29]=point.new(548,89)	chemin[29].mechant=1.6	chemin[29].rayon=1000
chemin[30]=point.new(590,103)	chemin[30].mechant=1.8	chemin[30].rayon=1000
chemin[31]=point.new(617,111)	chemin[31].mechant=2.5	chemin[31].rayon=1000
obstacle0nb=0
obstacle0={} --obstacle de 
--obstacle0[1]=point.new(-609,-198) 
--obstacle0[1].rayon=1000

obstaclenb=71--nombre de point definissant les petits obstacles
obstacle={}
obstacle[1]=point.new(517,82)
obstacle[2]=point.new(569,100)
obstacle[3]=point.new(613,108)
obstacle[4]=point.new(-515,-244)
obstacle[5]=point.new(-585,-269)
obstacle[6]=point.new(-534,-303)
obstacle[7]=point.new(-241,-259)
obstacle[8]=point.new(-176,-278)
obstacle[9]=point.new(-106,-294)
obstacle[10]=point.new(-49,-275)
obstacle[11]=point.new(-24,-223)
obstacle[12]=point.new(24,-181)
obstacle[13]=point.new(81,-148)
obstacle[14]=point.new(145,-122)
obstacle[15]=point.new(189,-119)
obstacle[16]=point.new(329,-128)
obstacle[17]=point.new(381,-109)
obstacle[18]=point.new(444,-96)
obstacle[19]=point.new(503,-94)
obstacle[20]=point.new(558,-84)
obstacle[21]=point.new(607,-63)
obstacle[22]=point.new(-169,138)
obstacle[23]=point.new(-221,110)
obstacle[24]=point.new(-276,97)
obstacle[25]=point.new(-330,79)
obstacle[26]=point.new(-385,58)
obstacle[27]=point.new(-445,43)
obstacle[28]=point.new(-614,22)
obstacle[29]=point.new(-119,147)
obstacle[30]=point.new(-67,160)
obstacle[31]=point.new(-15,167)
obstacle[32]=point.new(40,175)
obstacle[33]=point.new(91,185)
obstacle[34]=point.new(143,194)
obstacle[35]=point.new(200,199)
obstacle[36]=point.new(261,209)
obstacle[37]=point.new(433,238)
obstacle[38]=point.new(485,247)
obstacle[39]=point.new(539,263)
obstacle[40]=point.new(597,273)
obstacle[41]=point.new(535,297)
obstacle[42]=point.new(451,300)
obstacle[43]=point.new(-611,-140)
obstacle[44]=point.new(-536,-113)
obstacle[45]=point.new(-460,-93)
obstacle[46]=point.new(-398,-82)
obstacle[47]=point.new(-338,-75)
obstacle[48]=point.new(-281,-74)
obstacle[49]=point.new(-227,-67)
obstacle[50]=point.new(-172,-60)
obstacle[51]=point.new(-118,-51)
obstacle[52]=point.new(-60,-41)
obstacle[53]=point.new(-8,-23)
obstacle[54]=point.new(36,12)
obstacle[55]=point.new(84,33)
obstacle[56]=point.new(139,38)
obstacle[57]=point.new(194,35)
obstacle[58]=point.new(249,35)
obstacle[59]=point.new(303,33)
obstacle[60]=point.new(358,37)
obstacle[61]=point.new(410,51)
obstacle[62]=point.new(464,66)
obstacle[63]=point.new(-598,-59)
obstacle[64]=point.new(-530,-65)
obstacle[65]=point.new(-547,-13)
obstacle[66]=point.new(-456,-72)
obstacle[67]=point.new(18,-25)
obstacle[68]=point.new(3,11)
obstacle[69]=point.new(-85,-52)
obstacle[70]=point.new(63,31)
obstacle[71]=point.new(439,56)
obstacle[72]=point.new(-38,-42)
obstacle[73]=point.new(548,89)

obstacle1nb=12--nombre de point definisant le nombre de point du gros obstacle
obstacle1={}--gros cercle
obstacle1[1]=point.new(92,-282)
obstacle1[2]=point.new(-390,-308)
obstacle1[3]=point.new(-585,271)
obstacle1[4]=point.new(-557,133)
obstacle1[5]=point.new(-424,165)
obstacle1[6]=point.new(-287,219)
obstacle1[7]=point.new(-102,266)
obstacle1[8]=point.new(67,302)
obstacle1[9]=point.new(302,303)
obstacle1[10]=point.new(605,-194)
obstacle1[11]=point.new(438,-208)
obstacle1[12]=point.new(230,-231)


-- if obstaclegene==nil then --------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 	obstaclegene={}
-- end
-- obstaclegene.nb=1 --nombre d'obstacle ou le general ne peux pas aller.
-- obstaclegene[1]=point.new(0,0) --coordonnée du point d'interdiction
-- obstaclegene[1].rayon=18888 -- rayon de la zone interdite (facultatif)
-- obstaclegene[1].point=1 --point de retour (facultatif)
-- obstaclegene[2]=point.new(169,-259)
-- obstaclegene[3]=point.new(254,121)
-- obstaclegene[3].rayon=15000

--mine:
mineinfo={}
mineinfo.nb=0


end
t.obsim=function()
if obstacleim==nil then
	obstacleim={}
end
obstacleim[1]=display.newImage(map1sheeto1,1)
obstacleim[1].anchorY=1
obstacleim[1].x=-1737
obstacleim[1].y=271
obstacleim[2]=display.newImage(map1sheeto2,1)
obstacleim[2].anchorY=1
obstacleim[2].x=-681
obstacleim[2].y=718

if obstacleanim==nil then
	obstacleanim={}
end

if decoranim==nil then
	decoranim={}
end

decoration={} -- ligne a mettre pour la création avec assistance


end
t.vague=function()--donnees sur les vagues du niveau
vague={}
vagueaboss1=nil -- numero de la vague a boss (actuellement compatible à 3 vagues avec boss)
vagueaboss2=nil
vagueaboss3=nil
if not modepanique and not modezombie then
	local k=nil
	--nbvague=5--15 --modifier la donnée dans le fichier devellopement, tres important sert pour la fiche de carte
	for k=1,leveldata[1].wave,1 do
		vague[k]={}
		vague[k][1]=200
	end
	-- de -10 à -inf c'est le nombre de group (-lenumero-8) de spawn spawner en meme temps donc si on met -10 on spawn 2 group donc si apres il y a -2 ca va spawner sur l'entré 3 puis un 4 ca va spawner 4 soldat dit just apres ensuite on peut avoir un 4 ca va spawner 4 soldat sur l'entré une ensuite on met l'identifiant des 4soldats

	--vague[1]={nb=5,200,0,0,0,200}

	 -- Require the 'loadsave' module
	vague[1]={210,211,210,0,0,3,210,210,211,0,0,5,210,211,210,210,210,0,211}
	vague[2]={206,0,0,3,210,211,211,0,0,0,3,211,211,211,0,0,0,3,211,211,211,0,0,0,206,206}
	vague[3]={2,206,206,0,0,0,0,5,211,210,210,211,210,0,0,0,5,210,210,210,210,211,0,0,0,5,210,206,211,210,211,0,0,0,0,0,0,0,0,0,0,0,0,0,0,226,226,226,270,270,270,270,0,0,0,0,0,0,0,0,0,3,210,211,211,3,206,206,206,0,0,0,226,226}
	print("generaltest "..generaltest)
	if generaltest~=0 then
		if generaltest==179 then
			vague[1]={5,270,270,270,270,270,9,200,200,200,200,200,200,200,200,200,9,205,205,205,205,205,205,205,205,205,0,0,5,218,218,218,218,218,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
		elseif generaltest==178 then
			vague[1]={5,270,270,270,270,270,9,200,200,200,200,200,200,200,200,200,7,205,205,205,205,205,205,205,0,0,218,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
		elseif generaltest==177 then
			vague[1]={5,270,270,270,270,270,0,0,0,9,200,200,200,200,200,200,200,200,200,0,0,0,3,205,205,205,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
		elseif generaltest==172 then
			vague[1]={218,0,0,218,218,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,5,270,270,270,270,270,9,200,200,200,200,200,200,200,200,200,0,0,0,0,0,9,205,205,205,205,205,205,205,205,205,0,0,0,0,0,0,5,218,218,218,218,218,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
		elseif generaltest==171 then
			vague[1]={270,270,270,270,270,0,0,0,200,200,200,200,200,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
		elseif generaltest==174 then
			vague[1]={203,1,1,203,1,1,203,1,1,203,1,1,203,1,1,203,1,1,203,1,1,203,1,1,203,1,1,203,1,1,203,1,1,203,1,1,203,1,1,203,1,1,203,203,1,203,1,203,203,1,203,1,203,203,1,203,1,203,1,203,1,203,1,203,1,203,1,203,1,203,1,203,1,200,1,200,1,200,1,200,200,1,200,200,1,200,200,1,205,205,205,205,205,205,205,0,0,218,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
		elseif generaltest==175 then
			vague[1]={210,210,210,0,0,0,0,0,200,200,200,200,200,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
		end
		vague[2]={5,263,263,263,263,263,5,263,263,263,263,263,5,263,263,263,263,263,5,263,263,263,263,263,5,263,263,263,263,263,5,263,263,263,263,263,5,263,263,263,263,263,5,263,263,263,263,263,5,263,263,263,263,263,5,263,263,263,263,263,5,263,263,263,263,263}
		vague[3]={5,262,262,262,262,262,5,262,262,262,262,262,5,262,262,262,262,262,5,262,262,262,262,262,5,262,262,262,262,262,5,262,262,262,262,262,5,262,262,262,262,262,5,262,262,262,262,262,5,262,262,262,262,262,5,262,262,262,262,262,5,262,262,262,262,262}
	end
else
	-- -- vague[1]={-10,3,210,210,210,-1,3,210,210,210,0,0,0,0,-10,5,210,210,210,210,210,-1,5,210,210,210,210,210,0,0,0,0,0,-10,5,210,210,210,210,210,-1,5,210,210,210,210,210,0,-10,5,210,210,210,210,210,-1,5,210,210,210,210,210,0,-10,5,210,210,210,210,210,-1,5,210,210,210,210,210,-10,5,210,210,210,210,210,-1,5,210,210,210,210,210,-10,5,210,210,210,210,210,-1,5,210,210,210,210,210} --,nb=25,269,268,267,-10,260,-1,261,-1,262,0,0,0,0,-11,5,200,200,200,200,200,-1,2,201,201,-1,3,202,202,202} --{nb=20,2,210,210,0,0,0,0,5,210,210,210,210,210,0,202,3,201,201,201,0,0}
	-- for i=1,20 do --debut partie zombie 2
	-- 	vague[1][(i-1)*5+1]=5
	-- 	for j=1,5 do
	-- 		vague[1][(i-1)*5+j]=238
	-- 	end
	-- end
	-- local i=1
	-- local j=13
	-- local k=1
	-- while i<200 do
	-- 	k=k+1
	-- 	j=j+1
	-- 	if j==14 then
	-- 		j=1
	-- 		vague[1][i]=0
	-- 		i=i+1
	-- 		vague[1][i]=0
	-- 		i=i+1
	-- 		vague[1][i]=0
	-- 		i=i+1
	-- 		vague[1][i]=-10
	-- 		k=5
	-- 	elseif k==5 then
	-- 		vague[1][i]=5
	-- 		k=0
	-- 	else
	-- 		vague[1][i]=238
	-- 	end
	-- 	i=i+1
	-- end
	-- while i<210 do
	-- 	vague[1][i]=238
	-- 	i=i+1
	-- end
	-- vague[1][1]=238
	-- vague[1][2]=238 -- fin partie zoombie 2
	-- -- vague[1]={238,0,0,0,238}
	-- -- for i=1,200 do
	-- -- 	vague[1][i]=238
	-- -- end
	-- -- for i=1,180,12 do
	-- -- 	vague[1][i]=10
	-- -- end
	-- -- for i=2,

	-- local quantite=2
	-- local densite1=2 -- de 2 a +inf
	-- local densite2=2 -- de 2 a 9
	-- for k=1,30 do
	-- 	vague[k]={}
	-- 	vague[k][1]=200
	-- end
	-- for l=1,30 do
	-- 	local numerotest=0
	-- 	print("vague "..l.." densite "..densite1*densite2)
	-- 	for i=1,quantite do
	-- 		numerotest=numerotest+1
	-- 		vague[l][numerotest]=-8-densite1
	-- 		for j=1,densite1 do
	-- 			numerotest=numerotest+1
	-- 			vague[l][numerotest]=densite2
	-- 			for k=1,densite2 do
	-- 				numerotest=numerotest+1
	-- 				vague[l][numerotest]=238
	-- 			end
	-- 		end
	-- 	end
	-- 	local densitetotal=densite1*densite2
	-- 	densite2=densite2+mathfloor(densitetotal^0.3/densite1)
	-- 	--densite2=densite2+2
	-- 	if densite2>9 then
	-- 		densite1=densite1+1
	-- 		densite2=5
	-- 	end
	-- 	quantite=quantite+mathfloor(quantite^0.3)
	-- 	-- if modepanique then
	-- 	-- 	for i=1,#vague[1] do
	-- 	-- 		if vague[1][i]==238 then
	-- 	-- 			vague[1][i]=244
	-- 	-- 		end
	-- 	-- 	end
	-- 	-- end
	-- end
	-- if modepanique then
	-- 	for l=1,30 do
	-- 		for i=1,#vague[l] do
	-- 			if vague[l][i]==238 then
	-- 				vague[l][i]=244
	-- 			end
	-- 		end
	-- 	end
	-- end
	-- local function wavegenegroup(nbspawnzombie,zombiewave,numtab,densite)
	-- 	local zombiespawn=0
	-- 	while 
	-- 	return zombiewave,numtab
	-- end
	-- local densite=20
	-- local nbzombie=100
	-- for l=1,leveldata[1].wave do
	-- 	local zombiewave=0
	-- 	local numtab=1
	-- 	while zombiewave<nbzombie do
	-- 		local densiteatteinte=0
	-- 		while densiteatteinte<densite or zombiewave>=nbzombie do
	-- 			if true then --zombiewave>nbzombie-10 or densiteatteinte<densite-10 then
	-- 				if zombiewave>nbzombie-1 or densiteatteinte==densite-1 then
	-- 					vague[l][numtab]=238
	-- 					zombiewave=zombiewave+1
	-- 					numtab=numtab+1
	-- 					densiteatteinte=densiteatteinte+1
	-- 				else
	-- 					local nbzombierest=nbzombie-zombiewave
	-- 					if nbzombierest>densite-densiteatteinte then
	-- 						nbzombierest=densite-densiteatteinte
	-- 						print("nbzombierest "..nbzombierest)
	-- 					end
	-- 					vague[l][numtab]=nbzombierest
	-- 					numtab=numtab+1
	-- 					for i=1,nbzombierest do
	-- 						vague[l][numtab]=238
	-- 						numtab=numtab+1
	-- 						zombiewave=zombiewave+1
	-- 						densiteatteinte=densiteatteinte+1
	-- 					end
	-- 				end
	-- 			else
	-- 				-- local nbboucle=(densite-densiteatteinte)/10
	-- 				-- if nbboucle~=mathfloor(nbboucle) then
	-- 				-- 	nbboucle=mathfloor(nbboucle)-1
	-- 				-- end
	-- 				-- vague[l][numtab]=-8-nbboucle
	-- 			end
	-- 		end
	-- 	end
	-- end
	-- for i=2,leveldata[1].wave do --zombie derniere partie
	-- 	vague[i]=vague[1]
	-- end --fin
end
-- vague[1]={-10,3,210,210,210,-1,3,210,210,210,0,0,0,0,-10,5,210,210,210,210,210,-1,5,210,210,210,210,210}
-- vague[2]={-10,3,210,210,210,-1,3,210,210,210,0,0,0,0,-10,5,210,210,210,210,210,-1,5,210,210,210,210,210,0,0,0,0,0,-10,5,210,210,210,210,210,-1,5,210,210,210,210,210}
-- vague[2]={nb=7,0,0,0,3,211,210,210,0,0,5,211,211,211,211,211,0,5,210,210,210,210,210,5,210,211,210,211,210}
-- vague[3]={260,5,210,211,211,211,210,0,0,200,200,2,260,260,0,0,0,5,201,201,201,201,201,0,0,0,204,0,0}
-- vague[4]={0,0,2,260,260,0,5,210,210,211,211,211,0,5,210,210,211,211,211,0,210,210,211,211,211,0,2,201,201,0,0,204,0,0}
-- vague[5]={0,0,2,260,261,0,5,201,201,201,201,201,0,0,5,201,201,201,201,201,0,0,0,0,0,0,260,0,0,0,269}
-- nbvague=10
-- --on met -1 quand c'est le dernier soldat
-- for k=1,leveldata[1].wave,1 do
-- 	vague[k]={}
-- end
-- --vague[1]={nb=60,260,0,0,261,203,1,203,2,203,203,4,203,203,203,203,5,203,203,203,203,203,0,0,0,5,203,203,203,203,203,5,203,203,203,203,203,5,203,203,203,203,203,5,203,203,203,203,203,5,203,203,203,203,203,5,203,203,203,203,203}
-- vague[1].nb=30
-- local quatre=6
-- for i=1,200 do
-- 	if quatre>=6 then
-- 		vague[1][i]=5
-- 		quatre=0
-- 	else
-- 		vague[1][i]=210
-- 	end
-- 	quatre=quatre+1
-- end
-- vague[1].nb=190
-- for i=0,2 do
-- 	vague[1][i+1]=260--200+i
-- end
-- for i=15,20 do
-- 	vague[1][i+1]=0
-- end
-- for i=20,30 do
-- 	vague[1][i+1]=260--200+i
-- end
-- vague[1].nb=30
-- vague[2].nb=49
-- for i=0,4 do
-- 	if i==0 then
-- 		vague[2][1]=4
-- 	else
-- 		vague[2][i*10]=4
-- 	end
-- 	for j=1,9 do
-- 		vague[2][i*10+j]=200
-- 		if j==5 then
-- 			vague[2][i*10+5]=4
-- 		end
-- 	end
-- end
-- vague[3].nb=99
-- for i=0,9 do
-- 	if i==0 then
-- 		vague[3][1]=4
-- 	else
-- 		vague[3][i*10]=4
-- 	end
-- 	for j=1,9 do
-- 		vague[3][i*10+j]=260
-- 		if j==5 then
-- 			vague[3][i*10+5]=4
-- 		end
-- 	end
-- end
-- vague[4].nb=99
-- for i=0,9 do
-- 	if i==0 then
-- 		vague[4][1]=4
-- 	else
-- 		vague[4][i*10]=4
-- 	end
-- 	for j=1,9 do
-- 		vague[4][i*10+j]=210
-- 		if j==5 then
-- 			vague[4][i*10+5]=4
-- 		end
-- 	end
-- end
-- vague[5]={nb=3,0,0,0}

-- for k=6,10 do
-- 	vague[k].nb=99
-- 	for i=0,9 do
-- 		if i==0 then
-- 			vague[k][1]=4
-- 		else
-- 			vague[k][i*10]=4
-- 		end
-- 		for j=1,9 do
-- 			vague[k][i*10+j]=200+j
-- 			if j==5 then
-- 				vague[k][i*10+5]=4
-- 			end
-- 		end
-- 	end
-- end

--nbvague=1--a supprimer
--vague[1].nb=2--nb soldat dans la vague
--vague[2].nb=3
-- vague[3].nb=5
-- vague[4].nb=6

--vague[1][1]=210
--vague[1][2]=0

-- vague[2][1]=230
-- vague[2][2]=230
-- vague[2][3]=230

-- vague[3][1]=200
-- vague[3][2]=200
-- vague[3][3]=200
-- vague[3][4]=200
-- vague[3][5]=200

-- vague[4][1]=230
-- vague[4][2]=230
-- vague[4][3]=230
-- vague[4][4]=230
-- vague[4][5]=230
-- vague[4][6]=230
end
t.vaguewave=function()
	vague={}
	vague[1]={9,270,270,270,270,270,270,270,270,270,9,270,270,270,270,270,270,270,270,270,9,270,270,270,270,270,270,270,270,269,0,0,0,0,0,0,0,0,0,0,0,0,0,0,9,227,227,227,227,227,227,227,205,9,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,227,227,227,227,227,227}
end
return t