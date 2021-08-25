local t={} --niveau inf
t.new=function()--gestion du niveau 4 du jeu, doit toujours suivre le meme modele
	--map1= display.newImage( "goh/carte/level2/carte1a.jpg", 0,0,true )--devrai etre en local pour niveau1
	-- map1p = display.newCircle(0,0,10)      --nil--display.newImage( "goh/carte/level2/carte1p.jpg", 0,0,true )
	-- map1p.isVisible=false
	pouvoirdisp=3
	-- modeinfini=true
	t=1
end
t.affichagecarte=function(pole)
	if donneecharger[5]==0 then
		donneecharger[5]=1
		map5sheethg=graphics.newImageSheet( "goh/carte/level5/hd.jpg", { width=2048, height=1024, numFrames=1,sheetContentWidth=2048,sheetContentHeight=1024 } )
		map5sheethd=graphics.newImageSheet( "goh/carte/level5/hg.jpg", { width=2048, height=1024, numFrames=1,sheetContentWidth=2048,sheetContentHeight=1024 } )
		map5sheetbg=graphics.newImageSheet( "goh/carte/level5/bd.jpg", { width=2048, height=1024, numFrames=1,sheetContentWidth=2048,sheetContentHeight=1024 } )
		map5sheetbd=graphics.newImageSheet( "goh/carte/level5/bg.jpg", { width=2048, height=1024, numFrames=1,sheetContentWidth=2048,sheetContentHeight=1024 } )
		
	end
	hg=display.newImage(map5sheethg,1) --display.newImage( "goh/carte/level2/hd.jpg", -1024,-512,true )
	hg.x=-1024
	hg.y=-512
	hd=display.newImage(map5sheethd,1) --display.newImage( "goh/carte/level2/hg.jpg",1024,-512,true )
	hd.x=1024
	hd.y=-512
	bg=display.newImage(map5sheetbg,1) --display.newImage( "goh/carte/level2/bd.jpg", -1024,512,true )
	bg.x=-1024
	bg.y=512
	bd=display.newImage(map5sheetbd,1) --display.newImage( "goh/carte/level2/bg.jpg", 1024,512,true )
	bd.x=1024
	bd.y=512
	-- hg=display.newImage( "goh/carte/level3/hd.jpg", -1024,-512,true )
	-- hd=display.newImage( "goh/carte/level3/hg.jpg",1024,-512,true )
	-- bg=display.newImage( "goh/carte/level3/bd.jpg", -1024,512,true )
	-- bd=display.newImage( "goh/carte/level3/bg.jpg", 1024,512,true )
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
t.donneebase=function () --donnees de bases sur le niveau
	local tunededep=300
	local nbperso=leveldata[5].life
	if modeinfini or modesquelette then
		tunededep=tunedep
		nbperso=10
	end
	argentdep=-(tunededep)*3--hugo-------------------------------------------------------------------
	ennemipassedep=nbperso--nombre d'ennemi qui peuvent encore passer avant qu'on perdre---hugo------------------------------------------------------------------------------------------------------------------
	
end
t.chemi=function()--donnees sur les differents points de la carte
local point= require( "point" )
-- cheminlargeur=2.5
distancedetection=0.4
genepointinit=nil
cheminarr=nil

pointdep={}--entré secondaire 
pointdep[1]=31 --
pointdeppro={}
pointdeppro[2]=0.15 -- probabilité pour le levelinf de l'entré numero i (pointdep[i+1]) , pour une meme probabilité que sur les autres entré mettre 0.5. Min 0, max 1, avec deux chiffres apres la virgule max
----------------------------------------------------------------------------------------hugo debut -----------------------------------------------------------------------
intersection={}
intersection.nb=2
intersection[1]={pt=28, ty=0, un=34}
intersection[2]={pt=48, ty=2, un=50,deux=50,proba=1}

cheminnb=73-- --nombre de point definisant le chemin -1--------------------------------------------------------------------------------------------------
chemin={}
chemin[1]=point.new(114,-307)	chemin[1].mechant=1.4	chemin[1].rayon=1900
chemin[2]=point.new(142,-279)	chemin[2].mechant=1.3	chemin[2].rayon=1900
chemin[3]=point.new(157,-248)	chemin[3].mechant=1.4	chemin[3].rayon=1900
chemin[4]=point.new(159,-207)	chemin[4].mechant=1.4	chemin[4].rayon=1900
chemin[5]=point.new(138,-173)	chemin[5].mechant=1.4	chemin[5].rayon=1900
chemin[6]=point.new(116,-134)	chemin[6].mechant=1.4	chemin[6].rayon=1900
chemin[7]=point.new(102,-96)	chemin[7].mechant=1.5	chemin[7].rayon=1900
chemin[8]=point.new(95,-54)		chemin[8].mechant=1.5	chemin[8].rayon=1900
chemin[9]=point.new(89,-10)		chemin[9].mechant=1.5	chemin[9].rayon=1900
chemin[10]=point.new(56,24)		chemin[10].mechant=1.5	chemin[10].rayon=1900
chemin[11]=point.new(26,44)		chemin[11].mechant=1.5	chemin[11].rayon=1900
chemin[12]=point.new(-9,63)		chemin[12].mechant=1.5	chemin[12].rayon=1900
chemin[13]=point.new(-46,74)	chemin[13].mechant=1.5	chemin[13].rayon=1900
chemin[14]=point.new(-83,89)	chemin[14].mechant=1.5	chemin[14].rayon=1900
chemin[15]=point.new(-134,85)	chemin[15].mechant=1.4	chemin[15].rayon=1900
chemin[16]=point.new(-178,81)	chemin[16].mechant=1.4	chemin[16].rayon=1900
chemin[17]=point.new(-217,73)	chemin[17].mechant=1.6	chemin[17].rayon=1900
chemin[18]=point.new(-255,44)	chemin[18].mechant=1.4	chemin[18].rayon=1900
chemin[19]=point.new(-274,13)	chemin[19].mechant=1.4	chemin[19].rayon=1900
chemin[20]=point.new(-283,-30)	chemin[20].mechant=1.5	chemin[20].rayon=1900
chemin[21]=point.new(-279,-72)	chemin[21].mechant=1.5	chemin[21].rayon=1900
chemin[22]=point.new(-251,-95)	chemin[22].mechant=1.6	chemin[22].rayon=1900
chemin[23]=point.new(-217,-108)	chemin[23].mechant=1.4	chemin[23].rayon=1900
chemin[24]=point.new(-175,-119)	chemin[24].mechant=1.4	chemin[24].rayon=1900
chemin[25]=point.new(-124,-124)	chemin[25].mechant=1.6	chemin[25].rayon=1900
chemin[26]=point.new(-70,-149)	chemin[26].mechant=1.7	chemin[26].rayon=1900
chemin[27]=point.new(-50,-194)	chemin[27].mechant=1.7	chemin[27].rayon=1900
chemin[28]=point.new(-82,-233)	chemin[28].mechant=1.7	chemin[28].rayon=1900
chemin[29]=point.new(-120,-248)	chemin[29].mechant=1.7	chemin[29].rayon=1900
chemin[30]=point.new(-16,-308)	chemin[30].mechant=1.5	chemin[30].rayon=1900
chemin[31]=point.new(-28,-278)	chemin[31].mechant=1.6	chemin[31].rayon=1900
chemin[32]=point.new(-63,-261)	chemin[32].mechant=1.7	chemin[32].rayon=1900
chemin[33]=point.new(-119,-249)	chemin[33].mechant=1.7	chemin[33].rayon=1900
chemin[34]=point.new(-163,-259)	chemin[34].mechant=1.3	chemin[34].rayon=1900
chemin[35]=point.new(-201,-257)	chemin[35].mechant=1.3	chemin[35].rayon=1900
chemin[36]=point.new(-257,-254)	chemin[36].mechant=1.4	chemin[36].rayon=1900
chemin[37]=point.new(-298,-247)	chemin[37].mechant=1.4	chemin[37].rayon=1900
chemin[38]=point.new(-342,-233)	chemin[38].mechant=1.6	chemin[38].rayon=1900
chemin[39]=point.new(-376,-213)	chemin[39].mechant=1.6	chemin[39].rayon=1900
chemin[40]=point.new(-410,-190)	chemin[40].mechant=1.6	chemin[40].rayon=1900
chemin[41]=point.new(-448,-163)	chemin[41].mechant=1.6	chemin[41].rayon=1900
chemin[42]=point.new(-458,-134)	chemin[42].mechant=1.6	chemin[42].rayon=1900
chemin[43]=point.new(-460,-100)	chemin[43].mechant=1.6	chemin[43].rayon=1900
chemin[44]=point.new(-457,-66)	chemin[44].mechant=1.6	chemin[44].rayon=1900
chemin[45]=point.new(-462,-33)	chemin[45].mechant=1.8	chemin[45].rayon=1900
chemin[46]=point.new(-464,3)	chemin[46].mechant=1.8	chemin[46].rayon=1900
chemin[47]=point.new(-461,34)	chemin[47].mechant=1.7	chemin[47].rayon=1900
chemin[48]=point.new(-453,65)	chemin[48].mechant=1.9	chemin[48].rayon=1900
chemin[49]=point.new(-437,96)	chemin[49].mechant=2	chemin[49].rayon=1900
chemin[50]=point.new(-423,131)	chemin[50].mechant=2	chemin[50].rayon=1900
chemin[51]=point.new(-387,176)	chemin[51].mechant=2	chemin[51].rayon=1900
chemin[52]=point.new(-348,192)	chemin[52].mechant=1.9	chemin[52].rayon=1900
chemin[53]=point.new(-300,220)	chemin[53].mechant=1.7	chemin[53].rayon=1900
chemin[54]=point.new(-233,235)	chemin[54].mechant=1.7	chemin[54].rayon=1900
chemin[55]=point.new(-186,242)	chemin[55].mechant=1.6	chemin[55].rayon=1900
chemin[56]=point.new(-116,245)	chemin[56].mechant=1.8	chemin[56].rayon=1900
chemin[57]=point.new(-74,239)	chemin[57].mechant=1.7	chemin[57].rayon=1900
chemin[58]=point.new(-23,232)	chemin[58].mechant=1.8	chemin[58].rayon=1900
chemin[59]=point.new(42,224)	chemin[59].mechant=1.8	chemin[59].rayon=1900
chemin[60]=point.new(95,216)	chemin[60].mechant=1.8	chemin[60].rayon=1900
chemin[61]=point.new(126,200)	chemin[61].mechant=1.9	chemin[61].rayon=1900
chemin[62]=point.new(176,180)	chemin[62].mechant=1.7	chemin[62].rayon=1900
chemin[63]=point.new(222,148)	chemin[63].mechant=1.8	chemin[63].rayon=1900
chemin[64]=point.new(270,120)	chemin[64].mechant=1.7	chemin[64].rayon=1900
chemin[65]=point.new(302,104)	chemin[65].mechant=1.8	chemin[65].rayon=1900
chemin[66]=point.new(334,86)	chemin[66].mechant=1.8	chemin[66].rayon=1900
chemin[67]=point.new(372,70)	chemin[67].mechant=1.7	chemin[67].rayon=1900
chemin[68]=point.new(401,51)	chemin[68].mechant=1.8	chemin[68].rayon=1900
chemin[69]=point.new(441,34)	chemin[69].mechant=1.9	chemin[69].rayon=1900
chemin[70]=point.new(472,21)	chemin[70].mechant=1.8	chemin[70].rayon=1900
chemin[71]=point.new(505,0)	    chemin[71].mechant=1.7	chemin[71].rayon=1900
chemin[72]=point.new(543,-22)	chemin[72].mechant=1.7	chemin[72].rayon=1900
chemin[73]=point.new(574,-44)	chemin[73].mechant=1.7	chemin[73].rayon=1900
chemin[74]=point.new(617,-39)	chemin[74].mechant=1.7	chemin[74].rayon=1900
--for i=1,74 do
	--chemin[i].mechant=0.7
--end
--chemin[29].mechant=0.4
--chemin[28].mechant=0.4
--chemin[35].mechant=0.5
--chemin[34].mechant=0.5
--[[chemin[57]=point.new(570,310)
chemin[58]=point.new(570,-310)
chemin[59]=point.new(-580,-310)
chemin[60]=point.new(-580,310)
chemin[61]=point.new(0,0)

chemin[62]=point.new(0,0)
chemin[63]=point.new(-40,0)
chemin[64]=point.new(-40,300)]]

obstacle0nb=0

--obstaclenb=0--
--obstacle1nb=0--
obstaclenb=33--nombre de point definissant les petits obstacles
obstacle={}
obstacle[1]=point.new(476,230)
obstacle[2]=point.new(536,194)
obstacle[3]=point.new(-598,167)
obstacle[4]=point.new(-541,152)
obstacle[5]=point.new(-601,-160)
obstacle[6]=point.new(-465,-304)
obstacle[7]=point.new(-494,-290)
obstacle[8]=point.new(-402,-308)
obstacle[9]=point.new(-340,-304)
obstacle[10]=point.new(-286,-304)
obstacle[11]=point.new(-229,-301)
obstacle[12]=point.new(-172,-301)
obstacle[13]=point.new(-114,-301)
obstacle[14]=point.new(-57,-301)
obstacle[15]=point.new(5,-300)
obstacle[16]=point.new(71,-301)
obstacle[17]=point.new(138,-306)
obstacle[18]=point.new(202,-300)
obstacle[19]=point.new(268,-212)
obstacle[20]=point.new(328,-186)
obstacle[21]=point.new(385,-169)
obstacle[22]=point.new(447,-145)
obstacle[23]=point.new(495,-117)
obstacle[24]=point.new(610,-1)
obstacle[25]=point.new(612,53)
obstacle[26]=point.new(610,110)
obstacle[27]=point.new(610,162)
obstacle[28]=point.new(207,303)
obstacle[29]=point.new(286,302)
obstacle[30]=point.new(356,297)
obstacle[31]=point.new(428,294)
obstacle[32]=point.new(337,261)
obstacle[33]=point.new(413,243)


obstacle1nb=7--nombre de point definisant le nombre de point du gros obstacle
obstacle1={}--gros cercle
obstacle1[1]=point.new(610,299)
obstacle1[2]=point.new(-613,303)
obstacle1[3]=point.new(-613,-308)
obstacle1[4]=point.new(603,-296)
obstacle1[5]=point.new(457,-303)
obstacle1[6]=point.new(352,-304)
obstacle1[7]=point.new(613,-181)

--mine:
mineinfo={}
mineinfo.nb=1
mineinfo[1]=point.new(-526,126)
mineinfo[1].nbmine=2

obstaclsold={}
obstaclsold.nb=0 --nombre d'obstacle ou les soldats ne peuvent pas aller.



end
t.obsim=function()
if obstacleim==nil then
	obstacleim={}
end
if decoranim==nil then
	decoranim={}
end

decoration={} -- ligne a mettre pour la création avec assistance
end
t.vague=function()--donnees sur les vagues du niveau
vague={}
--nbvague=3--15
for k=1,leveldata[5].wave,1 do
	vague[k]={}
	vague[k][1]=200
end
vague[1]={5,203,203,203,203,203,0,0,5,203,203,203,203,203,203,0,0,3,207,208,208,5,270,270,270,203,203,203,0,0,0,0,5,203,203,203,203,203,0,0,5,203,203,203,208,207,0,0,0,3,203,203,203,5,203,203,207,208,207,5,207,208,207,208,203,5,203,270,270,203,203,5,203,203,203,203,203}
vague[2]={-1,203,1,2,207,208,2,207,208,2,207,207,2,208,207,0,0,0,0,203,203,203,203,203,203,203,1,270,270,-1,207,0,-1,270,5,270,270,270,207,270,5,203,203,203,203,203,1,3,270,270,270,3,270,270,270,3,270,270,270}
vague[3]={270,2,270,270,5,270,270,270,270,270,2,270,270,5,270,270,270,270,270,270,2,203,203,3,203,203,203,2,203,203,5,207,208,207,208,207,5,207,208,270,208,207,5,207,208,207,208,208,207}
vague[4]={270,5,207,208,207,208,207,5,207,208,207,208,207,5,207,208,207,208,207,5,207,208,208,207,207,5,207,208,207,208,207,2,203,203,3,203,203,203,5,203,203,203,203,203,3,203,203,203,5,203,203,203,203,203,3,203,203,203,0,0,0,0,2,270,270,3,270,270,270,5,270,270,270,270,270,3,270,270,270,5,270,270,270,270,270}
vague[5]={3,215,215,215,215,270,0,0,0,0,5,270,270,270,270,270,5,270,270,270,270,270,2,215,215,3,208,208,208,3,208,208,208,0,0,0,0,5,203,203,203,203,203,203,1,5,203,203,203,203,203,203,1,5,203,203,203,203,203,203,5,203,203,203,203,203,203,5,203,203,203,203,203,203,5,203,203,203,203,203,203,-1,2,215,215,270,270,5,270,270,270,270,270,5,270,270,270,270,270,5,270,270,270,270,270,5,270,270,270,270,270}
-------------------------------------------------------------debut hugo-----------------------------------------------------
--0 retarde de la durer de spawn de 3 soldat et 1 de la durer de 1 soldat
--de 2 à 5 permet de spawner plusieurs soldat a la fois.
--vague[1].nb=2--nb soldat dans la vague

modeinfdif=0-- 0 pour facile, 1 pour normal, 2 pour difficile

end
t.vaguewave=function()
	vague={}
	vague[1]={9,235,235,235,235,235,235,235,235,235,235,9,235,235,235,235,235,235,235,235,235,235,9,235,235,235,235,235,235,235,235,235,235,9,235,235,235,235,235,235,235,235,235,235,9,235,235,235,235,235,235,235,235,235,235,0,9,229,229,229,229,229,229,229,229,229,9,229,229,229,229,229,229,229,229,229,0,9,229,229,229,229,229,229,229,229,229,9,229,229,229,229,229,229,229,229,229,0,0,9,229,229,229,229,229,229,229,229,229,9,229,229,229,229,229,229,229,229,229,9,229,229,229,229,229,229,229,229,229,0,9,229,229,229,229,229,229,229,229,229,9,229,229,229,229,229,229,229,229,229,0,0,9,229,229,229,229,229,229,229,229,229,9,229,229,229,229,229,229,229,229,229,9,229,229,229,229,229,229,229,229,229,0,9,229,229,229,229,229,229,229,229,229,9,229,229,229,229,229,229,229,229,229,0,0,9,229,229,229,229,229,229,229,229,229,-1,9,229,229,229,229,229,229,229,229,229,-1,9,229,229,229,229,229,229,229,229,229,-1,9,229,229,229,229,229,229,229,229,229,-1,9,229,229,229,229,229,229,229,229,229,-1,9,229,229,229,229,229,229,229,229,229,-1,9,229,229,229,229,229,229,229,229,229,-1,9,229,229,229,229,229,229,229,229,229,-1,9,229,229,229,229,229,229,229,229,229,-1,9,229,229,229,229,229,229,229,229,229,-1,9,229,229,229,229,229,229,229,229,229,-1,9,229,229,229,229,229,229,229,229,229,-1,9,229,229,229,229,229,229,229,229,229,-1,9,229,229,229,229,229,229,229,229,229,-1,9,229,229,229,229,229,229,229,229,229,-1,9,229,229,229,229,229,229,229,229,229,-1,9,229,229,229,229,229,229,229,229,229,-1,9,229,229,229,229,229,229,229,229,229,-1,9,229,229,229,229,229,229,229,229,229,-13,-1,9,229,229,229,229,229,229,229,229,229,-1,9,229,229,229,229,229,229,229,229,229,-1,9,229,229,229,229,229,229,229,229,229,-1,9,229,229,229,229,229,229,229,229,229,-1,9,229,229,229,229,229,229,229,229,229,-11,-1,9,229,229,229,229,229,229,229,229,229,-1,9,229,229,229,229,229,229,229,229,229,-1,9,229,229,229,229,229,229,229,229,229,-11,-1,9,229,229,229,229,229,229,229,229,229,-1,9,229,229,229,229,229,229,229,229,229,-1,9,229,229,229,229,229,229,229,229,229,-15,-1,9,229,229,229,229,229,229,229,229,229,-1,9,229,229,229,229,229,229,229,229,229,-1,9,229,229,229,229,229,229,229,229,229,-1,9,229,229,229,229,229,229,229,229,229,-1,9,229,229,229,229,229,229,229,229,229,-1,9,229,229,229,229,229,229,229,229,229,-1,9,229,229,229,229,229,229,229,229,229}
end
return t