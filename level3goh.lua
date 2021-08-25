local t={}
t.new=function()--gestion du niveau 2 du jeu, doit toujours suivre le meme modele
	--map1= display.newImage( "goh/carte/level2/carte1a.jpg", 0,0,true )--devrai etre en local pour niveau1
	-- map1p = display.newCircle(0,0,10)      --nil--display.newImage( "goh/carte/level2/carte1p.jpg", 0,0,true )
	-- map1p.isVisible=false
	pouvoirdisp=3

	t=1
end
t.affichagecarte=function(pole)
	if donneecharger[3]==0 then
		donneecharger[3]=1
		map3sheethg=graphics.newImageSheet( "goh/carte/level3/hd.jpg", { width=2048, height=1024, numFrames=1,sheetContentWidth=2048,sheetContentHeight=1024 } )
		map3sheethd=graphics.newImageSheet( "goh/carte/level3/hg.jpg", { width=2048, height=1024, numFrames=1,sheetContentWidth=2048,sheetContentHeight=1024 } )
		map3sheetbg=graphics.newImageSheet( "goh/carte/level3/bd.jpg", { width=2048, height=1024, numFrames=1,sheetContentWidth=2048,sheetContentHeight=1024 } )
		map3sheetbd=graphics.newImageSheet( "goh/carte/level3/bg.jpg", { width=2048, height=1024, numFrames=1,sheetContentWidth=2048,sheetContentHeight=1024 } )
		map3sheeto1=graphics.newImageSheet( "goh/carte/level3/bottom_cliff.png", { width=947, height=511, numFrames=1,sheetContentWidth=947,sheetContentHeight=511 } )
		map3sheeto2=graphics.newImageSheet( "goh/carte/level3/bridge_rail.png", { width=579, height=166, numFrames=1,sheetContentWidth=579,sheetContentHeight=166 } )
		map3sheeto3=graphics.newImageSheet( "goh/carte/level3/diamant.png", { width=61, height=104, numFrames=1,sheetContentWidth=61,sheetContentHeight=104 } )
		map3sheeto4=graphics.newImageSheet( "goh/carte/level3/rocks.png", { width=309, height=106, numFrames=1,sheetContentWidth=309,sheetContentHeight=106 } )
	end
	hg=display.newImage(map3sheethg,1) --display.newImage( "goh/carte/level2/hd.jpg", -1024,-512,true )
	hg.x=-1024
	hg.y=-512
	hd=display.newImage(map3sheethd,1) --display.newImage( "goh/carte/level2/hg.jpg",1024,-512,true )
	hd.x=1024
	hd.y=-512
	bg=display.newImage(map3sheetbg,1) --display.newImage( "goh/carte/level2/bd.jpg", -1024,512,true )
	bg.x=-1024
	bg.y=512
	bd=display.newImage(map3sheetbd,1) --display.newImage( "goh/carte/level2/bg.jpg", 1024,512,true )
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
	local tunededep=200
	local nbperso=leveldata[3].life
	if modeinfini or modesquelette then
		tunededep=tunedep
		nbperso=10
	end
	argentdep=-(tunededep)*3--hugo-------------------------------------------------------------------
	ennemipassedep=nbperso--nombre d'ennemi qui peuvent encore passer avant qu'on perdre---hugo-----------------------------------------------------------------------------------------------------------------
	
end
t.chemi=function()--donnees sur les differents points de la carte
local point= require( "point" )
genepointinit=46 --46
cheminarr=nil
----------------------------------------------------------------------------------------hugo debut -----------------------------------------------------------------------
intersection={}
intersection.nb=4
intersection[1]={pt=31, ty=0, un=14}
intersection[2]={pt=30, ty=0, un=40}
intersection[3]={pt=16, ty=0, un=40}
intersection[4]={pt=15, ty=0, un=40}
--exemple
--intersection[1]={pt=11, ty=2, un=42, deux=15,proba=2}

pointdep={}--entré secondaire 
pointdep[1]=17 --premiere entré secondaire (donc l'entré se fait sur le point 10)
pointdep[2]=32 --deuxieme entre secondaire (donc l'entre se fait sur le point 11)
pointdeppro={}
pointdeppro[1]=0.25 -- probabilité pour le levelinf de l'entré numero i (pointdep[i+1]) , pour une meme probabilité que sur les autres entré mettre 0.5. Min 0, max 1, avec deux chiffres apres la virgule max

cheminnb=51 --51-- --nombre de point definisant le chemin -1--------------------------------------------------------------------------------------------------
chemin={}
chemin[1]=point.new(-614,112)	chemin[1].mechant=1.3		chemin[1].rayon=2000
chemin[2]=point.new(-569,130)	chemin[2].mechant=1.2		chemin[2].rayon=2000
chemin[3]=point.new(-534,136)	chemin[3].mechant=1.0		chemin[3].rayon=2000
chemin[4]=point.new(-494,136)	chemin[4].mechant=1.0		chemin[4].rayon=2000
chemin[5]=point.new(-451,131)	chemin[5].mechant=1.3		chemin[5].rayon=2000
chemin[6]=point.new(-404,119)	chemin[6].mechant=1.6		chemin[6].rayon=2000
chemin[7]=point.new(-368,106)	chemin[7].mechant=1.8		chemin[7].rayon=2000
chemin[8]=point.new(-329,89)	chemin[8].mechant=1.8		chemin[8].rayon=2000
chemin[9]=point.new(-288,67)	chemin[9].mechant=1.8		chemin[9].rayon=2000
chemin[10]=point.new(-247,49)	chemin[10].mechant=1.7		chemin[10].rayon=2000
chemin[11]=point.new(-204,33)	chemin[11].mechant=1.5		chemin[11].rayon=2000
chemin[12]=point.new(-163,26)	chemin[12].mechant=1.4		chemin[12].rayon=2000
chemin[13]=point.new(-118,18)	chemin[13].mechant=1.4		chemin[13].rayon=2000
chemin[14]=point.new(-76,11)	chemin[14].mechant=1.4		chemin[14].rayon=2000
chemin[15]=point.new(-36,-6)	chemin[15].mechant=1.8		chemin[15].rayon=2000
chemin[16]=point.new(4,-4)		chemin[16].mechant=1.8		chemin[16].rayon=2000
chemin[17]=point.new(-614,-278)	chemin[17].mechant=1.7		chemin[17].rayon=2000
chemin[18]=point.new(-584,-247)	chemin[18].mechant=1.9		chemin[18].rayon=2000
chemin[19]=point.new(-562,-218)	chemin[19].mechant=1.7		chemin[19].rayon=2000
chemin[20]=point.new(-536,-185)	chemin[20].mechant=1.6		chemin[20].rayon=2000
chemin[21]=point.new(-512,-151)	chemin[21].mechant=1.5		chemin[21].rayon=2000
chemin[22]=point.new(-491,-114)	chemin[22].mechant=1.7		chemin[22].rayon=2000
chemin[23]=point.new(-456,-88)	chemin[23].mechant=1.7		chemin[23].rayon=2000
chemin[24]=point.new(-417,-74)	chemin[24].mechant=1.6		chemin[24].rayon=2000
chemin[25]=point.new(-374,-70)	chemin[25].mechant=1.7		chemin[25].rayon=2000
chemin[26]=point.new(-330,-68)	chemin[26].mechant=1.7		chemin[26].rayon=2000
chemin[27]=point.new(-284,-70)	chemin[27].mechant=1.8		chemin[27].rayon=2000
chemin[28]=point.new(-238,-66)	chemin[28].mechant=1.8		chemin[28].rayon=2000
chemin[29]=point.new(-193,-59)	chemin[29].mechant=1.7		chemin[29].rayon=2000
chemin[30]=point.new(-153,-42)	chemin[30].mechant=1.7		chemin[30].rayon=2000
chemin[31]=point.new(-110,-24)	chemin[31].mechant=1.7		chemin[31].rayon=2000
chemin[32]=point.new(-143,-305)	chemin[32].mechant=1.3		chemin[32].rayon=2000
chemin[33]=point.new(-119,-270)	chemin[33].mechant=1.2		chemin[33].rayon=2000
chemin[34]=point.new(-99,-237)	chemin[34].mechant=1.5		chemin[34].rayon=2000
chemin[35]=point.new(-63,-211)	chemin[35].mechant=1.4		chemin[35].rayon=2000
chemin[36]=point.new(-22,-192)	chemin[36].mechant=1.4		chemin[36].rayon=2000
chemin[37]=point.new(3,-156)	chemin[37].mechant=1.3		chemin[37].rayon=2000
chemin[38]=point.new(9,-108)	chemin[38].mechant=1.7		chemin[38].rayon=2000
chemin[39]=point.new(13,-64)	chemin[39].mechant=1.7		chemin[39].rayon=2000
chemin[40]=point.new(48,-7)		chemin[40].mechant=1.8		chemin[40].rayon=2000
chemin[41]=point.new(91,-3)		chemin[41].mechant=1.5		chemin[41].rayon=2000
chemin[42]=point.new(140,6)		chemin[42].mechant=1.0		chemin[42].rayon=2000
chemin[43]=point.new(177,-20)	chemin[43].mechant=0.5		chemin[43].rayon=2000
chemin[44]=point.new(220,-29)	chemin[44].mechant=0.5		chemin[44].rayon=2000
chemin[45]=point.new(263,-37)	chemin[45].mechant=0.5		chemin[45].rayon=2000
chemin[46]=point.new(312,-36)	chemin[46].mechant=0.5		chemin[46].rayon=2000
chemin[47]=point.new(354,-54)	chemin[47].mechant=1.3		chemin[47].rayon=2000
chemin[48]=point.new(395,-71)	chemin[48].mechant=1.3		chemin[48].rayon=2000
chemin[49]=point.new(440,-78)	chemin[49].mechant=1.5		chemin[49].rayon=2000
chemin[50]=point.new(484,-80)	chemin[50].mechant=1.5		chemin[50].rayon=2000
chemin[51]=point.new(529,-79)	chemin[51].mechant=1.4		chemin[51].rayon=2000
chemin[52]=point.new(577,-71)	chemin[52].mechant=1.6		chemin[52].rayon=2000
chemin[53]=point.new(613,-58)	chemin[53].mechant=1.5		chemin[53].rayon=2000

-- chemin[3]=point.new(-534,138)
-- chemin[4]=point.new(-489,141)
-- chemin[5]=point.new(-445,138)
-- chemin[6]=point.new(-401,128)
-- chemin[7]=point.new(-359,113)
-- chemin[8]=point.new(-321,89)
-- chemin[9]=point.new(-284,63)
-- chemin[10]=point.new(-243,46)
-- chemin[11]=point.new(-201,33)
-- chemin[12]=point.new(-160,24)
-- chemin[13]=point.new(-118,16)
-- chemin[14]=point.new(-77,3)
-- chemin[15]=point.new(-34,-1)
-- chemin[16]=point.new(10,-1)
-- chemin[17]=point.new(53,-4)
-- chemin[18]=point.new(-614,-280)
-- chemin[19]=point.new(-583,-249)
-- chemin[20]=point.new(-557,-213)
-- chemin[21]=point.new(-534,-178)
-- chemin[22]=point.new(-510,-142)
-- chemin[23]=point.new(-482,-108)
-- chemin[24]=point.new(-445,-88)
-- chemin[25]=point.new(-404,-74)
-- chemin[26]=point.new(-362,-70)
-- chemin[27]=point.new(-318,-67)
-- chemin[28]=point.new(-274,-64)
-- chemin[29]=point.new(-230,-57)
-- chemin[30]=point.new(-186,-51)
-- chemin[31]=point.new(-147,-34)
-- chemin[32]=point.new(-143,-308)
-- chemin[33]=point.new(-118,-270)
-- chemin[34]=point.new(-90,-236)
-- chemin[35]=point.new(-55,-208)
-- chemin[36]=point.new(-25,-174)
-- chemin[37]=point.new(-1,-139)
-- chemin[38]=point.new(10,-98)
-- chemin[39]=point.new(20,-56)
-- chemin[40]=point.new(98,-5)
-- chemin[41]=point.new(143,-15)
-- chemin[41].mechant=0.7
-- chemin[42]=point.new(181,-44)
-- chemin[42].mechant=0.7
-- chemin[43]=point.new(226,-49)
-- chemin[43].mechant=0.7
-- chemin[44]=point.new(273,-47)
-- chemin[44].mechant=0.7
-- chemin[45]=point.new(317,-49)
-- chemin[45].mechant=0.7
-- chemin[46]=point.new(359,-65)
-- chemin[47]=point.new(405,-72)
-- chemin[48]=point.new(449,-78)
-- chemin[49]=point.new(493,-82)
-- chemin[50]=point.new(538,-78)
-- chemin[51]=point.new(582,-72)
-- chemin[52]=point.new(613,-67)

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
obstaclenb=90--nombre de point definissant les petits obstacles
obstacle={}
obstacle[1]=point.new(-611,-15)
obstacle[2]=point.new(-611,-80)
obstacle[3]=point.new(-504,212)
obstacle[4]=point.new(-473,263)
obstacle[5]=point.new(-432,297)
obstacle[6]=point.new(-383,292)
obstacle[7]=point.new(-333,289)
obstacle[8]=point.new(-282,281)
obstacle[9]=point.new(-237,248)
obstacle[10]=point.new(-198,216)
obstacle[11]=point.new(-151,194)
obstacle[12]=point.new(-100,191)
obstacle[13]=point.new(-60,178)
obstacle[14]=point.new(-19,151)
obstacle[15]=point.new(31,128)
obstacle[16]=point.new(85,113)
obstacle[17]=point.new(123,84)
obstacle[18]=point.new(156,32)
obstacle[19]=point.new(314,4)
obstacle[20]=point.new(363,41)
obstacle[21]=point.new(519,57)
obstacle[22]=point.new(581,44)
obstacle[23]=point.new(608,-22)
obstacle[24]=point.new(607,-84)
obstacle[25]=point.new(603,-151)
obstacle[26]=point.new(313,-301)
obstacle[27]=point.new(250,-287)
obstacle[28]=point.new(212,-241)
obstacle[29]=point.new(209,-179)
obstacle[30]=point.new(229,-134)
obstacle[31]=point.new(247,-87)
obstacle[32]=point.new(269,-36)
obstacle[33]=point.new(330,-51)
obstacle[34]=point.new(385,-64)
obstacle[35]=point.new(443,-75)
obstacle[36]=point.new(495,-77)
obstacle[37]=point.new(550,-74)
obstacle[38]=point.new(226,-34)
obstacle[39]=point.new(176,-21)
obstacle[40]=point.new(119,-4)
obstacle[41]=point.new(59,-4)
obstacle[42]=point.new(3,-12)
obstacle[43]=point.new(-55,-12)
obstacle[44]=point.new(-111,1)
obstacle[45]=point.new(-169,20)
obstacle[46]=point.new(-222,37)
obstacle[47]=point.new(-269,59)
obstacle[48]=point.new(-320,81)
obstacle[49]=point.new(-372,105)
obstacle[50]=point.new(-426,126)
obstacle[51]=point.new(-481,142)
obstacle[52]=point.new(-534,133)
obstacle[53]=point.new(-609,116)
obstacle[54]=point.new(-528,-182)
obstacle[55]=point.new(-504,-135)
obstacle[56]=point.new(-466,-96)
obstacle[57]=point.new(-416,-77)
obstacle[58]=point.new(-362,-69)
obstacle[59]=point.new(-308,-69)
obstacle[60]=point.new(-253,-69)
obstacle[61]=point.new(-198,-61)
obstacle[62]=point.new(-151,-40)
obstacle[63]=point.new(-105,-27)
obstacle[64]=point.new(14,-66)
obstacle[65]=point.new(5,-122)
obstacle[66]=point.new(-1,-181)
obstacle[67]=point.new(-50,-207)
obstacle[68]=point.new(-101,-235)
obstacle[69]=point.new(-145,-308)
obstacle[70]=point.new(-93,-308)
obstacle[71]=point.new(-214,-306)
obstacle[72]=point.new(-268,-289)
obstacle[73]=point.new(-325,-274)
obstacle[74]=point.new(-381,-269)
obstacle[75]=point.new(-369,-243)
obstacle[76]=point.new(-438,-285)
obstacle[77]=point.new(-578,-139)
obstacle[78]=point.new(-613,42)
obstacle[79]=point.new(205,-93)
obstacle[80]=point.new(184,-148)
obstacle[81]=point.new(155,-197)
obstacle[82]=point.new(139,-252)
obstacle[83]=point.new(187,-300)
obstacle[84]=point.new(96,-303)
obstacle[85]=point.new(215,-186)
obstacle[86]=point.new(-398,188)
obstacle[87]=point.new(-378,238)
obstacle[88]=point.new(-118,16)
obstacle[89]=point.new(-77,7)
obstacle[90]=point.new(-24,-1)

obstacle1nb=10--nombre de point definisant le nombre de point du gros obstacle
obstacle1={}--gros cercle
obstacle1[1]=point.new(607,-306)
obstacle1[2]=point.new(468,-308)
obstacle1[3]=point.new(-611,-303)
obstacle1[4]=point.new(-611,303)
obstacle1[5]=point.new(-108,302)
obstacle1[6]=point.new(89,225)
obstacle1[7]=point.new(254,121)
obstacle1[8]=point.new(451,162)
obstacle1[9]=point.new(592,183)
obstacle1[10]=point.new(337,268)


obstaclsold={}
obstaclsold.nb=3 --nombre d'obstacle ou les soldats ne peuvent pas aller.
 obstaclsold[1]=point.new(177,-169)
 obstaclsold[1].rayon=8888
 obstaclsold[2]=point.new(169,-259)
 obstaclsold[2].rayon=8888
 obstaclsold[3]=point.new(254,121)
 obstaclsold[3].rayon=15000



--mine:
mineinfo={}
mineinfo.nb=0 --1
-- local i=0
-- while i<=mineinfo.nb do
-- 	mineinfo[i]={}
-- end
-- mineinfo[1]=point.new(218,142)
-- mineinfo[1].nbmine=1

decoration={} -- ligne a mettre pour la création avec assistance

end
print("level3goh ii")
t.obsim=function()
print("level3goh iii")
if obstacleim==nil then
	obstacleim={}
end
obstacleim[1]=display.newImage(map3sheeto1,1)
obstacleim[1].anchorY=1
obstacleim[1].x=-1574.5
obstacleim[1].y=1024
obstacleim[2]=display.newImage(map3sheeto2,1)
obstacleim[2].anchorY=1
obstacleim[2].x=799
obstacleim[2].y=14
obstacleim[3]=display.newImage(map3sheeto3,1)
obstacleim[3].anchorY=1
obstacleim[3].x=-446
obstacleim[3].y=556
obstacleim[4]=display.newImage(map3sheeto3,1)
obstacleim[4].anchorY=1
obstacleim[4].x=-1729
obstacleim[4].y=819
obstacleim[5]=display.newImage(map3sheeto3,1)
obstacleim[5].anchorY=1
obstacleim[5].x=-1784
obstacleim[5].y=-18
obstacleim[6]=display.newImage(map3sheeto4,1)
obstacleim[6].anchorY=1
obstacleim[6].x=1946
obstacleim[6].y=-5
obstacleim[7]=display.newImage(map3sheeto4,1)
obstacleim[7].anchorY=1
obstacleim[7].x=1474
obstacleim[7].y=105
obstacleim[8]=display.newImage(map3sheeto4,1)
obstacleim[8].anchorY=1
obstacleim[8].x=418
obstacleim[8].y=228
obstacleim[9]=display.newImage(map3sheeto4,1)
obstacleim[9].anchorY=1
obstacleim[9].x=-767
obstacleim[9].y=604
obstacleim[10]=display.newImage(objetdec[3],9)
obstacleim[10].anchorY=1
obstacleim[10].x=-1909
obstacleim[10].y=-333
-- obstacleim[11]=display.newImage(objetdec[1],5)
-- obstacleim[11].anchorY=1
-- obstacleim[11].x=-635.5
-- obstacleim[11].y=-61
obstacleim[11]=display.newImage(objetdec[3],8)
obstacleim[11].anchorY=1
obstacleim[11].x=-1315
obstacleim[11].y=724

if decoranim==nil then
	decoranim={}
end
decoration[1]={}
decoration[1].x=-656.5*0.3
decoration[1].y=30*0.3
decoration[1].type=5
decoration[1].planche=1
decoration[1].scale=0.3
decoration[1].anchorY=1
end



------------------------------------------------------------fin hugo---------------------------------------------------------------
t.vague=function()--donnees sur les vagues du niveau
vague={}
local k=nil
--nbvague=3--nombre de vague dans le niveau--hugo--
--on met -1 quand c'est le dernier soldat
for k=1,leveldata[3].wave,1 do
	vague[k]={}
	vague[k][1]=200
end
-------------------------------------------------------------debut hugo-----------------------------------------------------
--0 retarde de la durer de spawn de 3 soldat et 1 de la durer de 1 soldat
--de 2 à 5 permet de spawner plusieurs soldat a la fois.
-- de -1 à -9 c'est le numero de l'entré non principale (-1 pour la deuxieme entré qui est déclarer plus haut dans chemin)
-- de -10 à -inf c'est le nombre de group (-lenumero-8) de spawn spawner en meme temps donc si on met -10 on spawn 2 group donc si apres il y a -2 ca va spawner sur l'entré 3 puis un 4 ca va spawner 4 soldat dit just apres ensuite on peut avoir un 4 ca va spawner 4 soldat sur l'entré une ensuite on met l'identifiant des 4soldats
--vague[1].nb=2--nb soldat dans la vague
-- vague[2].nb=3
-- vague[3].nb=5
-- vague[4].nb=6
-- vague[5].nb=11
-- for i=1,2 do --50 do
-- 	vague[1][i+(i-1)*5]=5
-- 	for j=1,5 do
-- 		vague[1][i+(i-1)*5+j]=204
-- 	end
-- end
--200
vague[1]={-2,267,264,-1,267,0,0,0,-2,5,210,211,210,211,210,0,5,210,211,210,211,210,0,0,-1,5,210,211,210,210,210,0,0,0,201,0,0,-1,206,0,-2,201,0,0,0,0,0,0,0,0,-1,200,200,-2,200}
vague[2]={3,226,226,226,-1,3,226,226,226,-2,3,226,226,226,0,0,0,0,-1,206,206,0,-2,206,0,0,0,0,0,0,0,0,3,270,270,270,0,0,-2,3,270,270,270,0,-1,3,270,270,270,0,0,0,0,0,0,0,3,270,270,270,0,-2,3,270,270,270,0,-1,3,270,270,270,-1,5,200,200,200,200,200,0,5,200,200,200,200,200,0,0,-2,5,200,200,200,200,200,0,0,0,0,205,-1,201,0,-2,205,0,0,0,0,5,202,206,206,202,206,206,0,0,0,0,-1,5,212,214,212,214,212}
vague[3]={5,270,270,270,270,270,-2,5,270,270,270,270,270,0,-1,3,264,267,264,0,0,0,0,0,-1,5,205,205,205,205,205,0,0,5,201,201,201,201,201,0,0,-2,5,201,201,201,201,201,0,0,0,0,0,0,200}
vague[4]={200,0,0,0,0,0,0,0,0,0,5,270,270,270,270,270,-2,5,270,270,270,270,270,0,-1,5,264,267,264,264,267,-1,2,218,218,218,218,0,0,-2,2,218,218}

--nbvague=3
-- vague[1][1]=260
-- vague[1][2]=261

-- vague[2][1]=262
-- vague[2][2]=263
-- vague[2][3]=264

-- vague[3][1]=265
-- vague[3][2]=266
-- vague[3][3]=266
-- vague[3][4]=200
-- vague[3][5]=200

-- vague[4][1]=230
-- vague[4][2]=230
-- vague[4][3]=230
-- vague[4][4]=230
-- vague[4][5]=230
-- vague[4][6]=230

-- vague[5][1]=235
-- vague[5][2]=235
-- vague[5][3]=235
-- vague[5][4]=235
-- vague[5][5]=235
-- vague[5][6]=210
-- vague[5][7]=210
-- vague[5][8]=210
-- vague[5][9]=210
-- vague[5][10]=210
-- vague[5][11]=260

---------------------------------------------------------------------------fin hugo-------------------------------------------

end
t.vaguewave=function()
	vague={}
	vague[1]={2,266,266,-1,9,267,267,267,267,267,267,267,267,267,-2,9,267,267,267,267,267,267,267,267,267,4,201,201,201,201,-1,4,201,201,201,201,-2,4,201,201,201,201,4,201,201,201,201,-1,4,201,201,201,201,-2,4,201,201,201,201,4,201,201,201,201,-1,4,201,201,201,201,-2,4,201,201,201,201,4,201,201,201,201,-1,4,201,201,201,201,-2,4,201,201,201,201,4,201,201,201,201,-1,4,201,201,201,201,-2,4,201,201,201,201,4,201,201,201,201,-1,4,201,201,201,201,-2,4,201,201,201,201}
end
return t