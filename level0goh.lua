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
	if donneecharger[0]==0 then
		donneecharger[0]=1
		if issimulator then
			local memUsed = (collectgarbage("count")) / 1000
			local texUsed = system.getInfo( "textureMemoryUsed" ) / 1000000
			--print("\n---------MEMORY USAGE INFORMATION chargement1 avant---------")
			--print("System Memory Used:", string.format("%.03f", memUsed), "Mb")
			print("Texture Memory Used avant chargement level0: ", string.format("%.03f", texUsed), "Mb")
		end
		map0sheethg=graphics.newImageSheet( "goh/carte/level0/hd.jpg", { width=2048, height=1024, numFrames=1,sheetContentWidth=2048,sheetContentHeight=1024 } )
		map0sheethd=graphics.newImageSheet( "goh/carte/level0/hg.jpg", { width=2048, height=1024, numFrames=1,sheetContentWidth=2048,sheetContentHeight=1024 } )
		map0sheetbg=graphics.newImageSheet( "goh/carte/level0/bd.jpg", { width=2048, height=1024, numFrames=1,sheetContentWidth=2048,sheetContentHeight=1024 } )
		map0sheetbd=graphics.newImageSheet( "goh/carte/level0/bg.jpg", { width=2048, height=1024, numFrames=1,sheetContentWidth=2048,sheetContentHeight=1024 } )
		map0sheeto1=graphics.newImageSheet( "goh/carte/level0/bttm_left_rock.png", { width=192, height=60, numFrames=1,sheetContentWidth=192,sheetContentHeight=60 } )
		map0sheeto2=graphics.newImageSheet( "goh/carte/level0/right_rocks.png", { width=304, height=150, numFrames=1,sheetContentWidth=304,sheetContentHeight=150 } )
		map0sheeto3=graphics.newImageSheet( "goh/carte/level0/top_left_tree.png", { width=463, height=296, numFrames=1,sheetContentWidth=463,sheetContentHeight=296 } )
		
		if issimulator then
			local memUsed = (collectgarbage("count")) / 1000
			local texUsed = system.getInfo( "textureMemoryUsed" ) / 1000000
			--print("\n---------MEMORY USAGE INFORMATION chargement1 avant---------")
			--print("System Memory Used:", string.format("%.03f", memUsed), "Mb")
			print("Texture Memory Used apres chargement level1: ", string.format("%.03f", texUsed), "Mb")
		end
	end

	hg=display.newImage(map0sheethg,1) --display.newImage( "goh/carte/level2/hg.jpg", -1024,-512,true )
	hg.x=-1024
	hg.y=-512
	hd=display.newImage(map0sheethd,1) --display.newImage( "goh/carte/level2/hd.jpg",1024,-512,true )
	hd.x=1024
	hd.y=-512
	bg=display.newImage(map0sheetbg,1) --display.newImage( "goh/carte/level2/bg.jpg", -1024,512,true )
	bg.x=-1024
	bg.y=512
	bd=display.newImage(map0sheetbd,1) --display.newImage( "goh/carte/level2/bd.jpg", 1024,512,true )
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
	if issimulator then
		--tunededep=2000
	end
	local nbperso=leveldata[0].life
	if modeinfini or modesquelette then
		tunededep=tunedep
		nbperso=10
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

cheminnb=28-- --nombre de point definisant le chemin -1--------------------------------------------------------------------------------------------------
chemin={}
chemin[1]=point.new(-616,6)		chemin[1].mechant=1		chemin[1].rayon=1000
chemin[2]=point.new(-574,6)		chemin[2].mechant=1		chemin[2].rayon=1000
chemin[3]=point.new(-529,3)		chemin[3].mechant=1		chemin[3].rayon=1000
chemin[4]=point.new(-484,3)		chemin[4].mechant=1		chemin[4].rayon=1000
chemin[5]=point.new(-439,3)		chemin[5].mechant=1		chemin[5].rayon=1000
chemin[6]=point.new(-394,5)		chemin[6].mechant=1		chemin[6].rayon=1000
chemin[7]=point.new(-354,6)		chemin[7].mechant=1		chemin[7].rayon=1000
chemin[8]=point.new(-311,7)		chemin[8].mechant=1		chemin[8].rayon=1000
chemin[9]=point.new(-269,9)		chemin[9].mechant=1		chemin[9].rayon=1000
chemin[10]=point.new(-227,3)	chemin[10].mechant=1	chemin[10].rayon=1000
chemin[11]=point.new(-183,8)	chemin[11].mechant=1	chemin[11].rayon=1000
chemin[12]=point.new(-141,11)	chemin[12].mechant=1	chemin[12].rayon=1000
chemin[13]=point.new(-98,11)	chemin[13].mechant=1	chemin[13].rayon=1000
chemin[14]=point.new(-53,11)	chemin[14].mechant=1	chemin[14].rayon=1000
chemin[15]=point.new(-12,11)	chemin[15].mechant=1	chemin[15].rayon=1000
chemin[16]=point.new(34,8)		chemin[16].mechant=1	chemin[16].rayon=1000
chemin[17]=point.new(74,6)		chemin[17].mechant=1	chemin[17].rayon=1000
chemin[18]=point.new(119,1)		chemin[18].mechant=1	chemin[18].rayon=1000
chemin[19]=point.new(158,1)		chemin[19].mechant=1	chemin[19].rayon=1000
chemin[20]=point.new(203,-1)	chemin[20].mechant=1	chemin[20].rayon=1000
chemin[21]=point.new(255,-6)	chemin[21].mechant=1	chemin[21].rayon=1000
chemin[22]=point.new(299,-6)	chemin[22].mechant=1	chemin[22].rayon=1000
chemin[23]=point.new(343,-11)	chemin[23].mechant=1	chemin[23].rayon=1000
chemin[24]=point.new(391,-16)	chemin[24].mechant=1	chemin[24].rayon=1000
chemin[25]=point.new(438,-10)	chemin[25].mechant=1	chemin[25].rayon=1000
chemin[26]=point.new(485,-14)	chemin[26].mechant=1	chemin[26].rayon=1000
chemin[27]=point.new(531,-11)	chemin[27].mechant=1	chemin[27].rayon=1000
chemin[28]=point.new(576,-8)	chemin[28].mechant=1	chemin[28].rayon=1000
chemin[29]=point.new(612,-13)	chemin[29].mechant=1	chemin[29].rayon=1000
obstacle0nb=0
obstacle0={} --obstacle de 
--obstacle0[1]=point.new(-609,-198) 
--obstacle0[1].rayon=1000

obstaclenb=48--nombre de point definissant les petits obstacles
obstacle={}
obstacle[1]=point.new(567,-276)
obstacle[2]=point.new(524,-244)
obstacle[3]=point.new(469,-266)
obstacle[4]=point.new(409,-267)
obstacle[5]=point.new(354,-266)
obstacle[6]=point.new(297,-260)
obstacle[7]=point.new(250,-244)
obstacle[8]=point.new(209,-207)
obstacle[9]=point.new(155,-204)
obstacle[10]=point.new(107,-228)
obstacle[11]=point.new(33,-215)
obstacle[12]=point.new(-39,-237)
obstacle[13]=point.new(-110,-237)
obstacle[14]=point.new(-201,-240)
obstacle[15]=point.new(-268,-241)
obstacle[16]=point.new(-335,-238)
obstacle[17]=point.new(-403,-225)
obstacle[18]=point.new(-461,-251)
obstacle[19]=point.new(-539,-241)
obstacle[20]=point.new(-598,-253)
obstacle[21]=point.new(-207,-144)
obstacle[22]=point.new(-139,-143)
obstacle[23]=point.new(375,94)
obstacle[24]=point.new(424,90)
obstacle[25]=point.new(605,268)
obstacle[26]=point.new(540,265)
obstacle[27]=point.new(472,264)
obstacle[28]=point.new(412,265)
obstacle[29]=point.new(358,265)
obstacle[30]=point.new(297,263)
obstacle[31]=point.new(241,260)
obstacle[32]=point.new(193,236)
obstacle[33]=point.new(138,258)
obstacle[34]=point.new(81,255)
obstacle[35]=point.new(22,255)
obstacle[36]=point.new(-33,255)
obstacle[37]=point.new(-87,255)
obstacle[38]=point.new(-139,259)
obstacle[39]=point.new(-196,255)
obstacle[40]=point.new(-253,250)
obstacle[41]=point.new(-313,243)
obstacle[42]=point.new(-368,256)
obstacle[43]=point.new(-423,249)
obstacle[44]=point.new(-485,240)
obstacle[45]=point.new(-558,243)
obstacle[46]=point.new(-614,236)
obstacle[47]=point.new(-614,214)
obstacle[48]=point.new(-393,101)

obstacle1nb=9--nombre de point definisant le nombre de point du gros obstacle
obstacle1={}--gros cercle
obstacle1[1]=point.new(-516,-350)
obstacle1[2]=point.new(-402,-350)
obstacle1[3]=point.new(-163,-353)
obstacle1[4]=point.new(94,-350)
obstacle1[5]=point.new(511,-350)
obstacle1[6]=point.new(190,350)
obstacle1[7]=point.new(-303,350)
obstacle1[8]=point.new(-532,350)
obstacle1[9]=point.new(243,-350)


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
obstacleim[1]=display.newImage(map0sheeto1,1)
obstacleim[1].anchorY=1
obstacleim[1].x=-1320
obstacleim[1].y=440
obstacleim[2]=display.newImage(map0sheeto2,1)
obstacleim[2].anchorY=1
obstacleim[2].x=1341
obstacleim[2].y=458
obstacleim[3]=display.newImage(map0sheeto3,1)
obstacleim[3].anchorY=1
obstacleim[3].x=-561
obstacleim[3].y=-338


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
	vague[3]={2,213,213,0,0,0,0,5,211,210,210,211,210,0,0,0,5,210,210,210,210,211,0,0,0,5,210,213,211,210,211,0,0,0,0,0,0,0,0,0,0,0,0,0,0,226,226,226,270,270,270,270,0,0,0,0,0,0,0,0,0,3,210,211,211,3,213,213,213}
	vague[2]={213,0,0,0,3,210,211,211,0,0,0,3,211,211,211,0,0,0,3,211,211,211,0,0,0,213,213}
else

end
end
return t