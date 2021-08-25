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
	pouvoirdisp=3
	--argent=300
	--ennemipasse=10--nombre d'ennemi qui peuvent encore passer avant qu'on perdre---------------------------------------------------------------------------------------------------------------------

	t=1
end
t.affichagecarte=function(pole)
	if donneecharger[16]==0 then
		donneecharger[16]=1
		map16sheethg=graphics.newImageSheet( "goh/carte/level16/hd.jpg", { width=2048, height=1024, numFrames=1,sheetContentWidth=2048,sheetContentHeight=1024 } )
		map16sheethd=graphics.newImageSheet( "goh/carte/level16/hg.jpg", { width=2048, height=1024, numFrames=1,sheetContentWidth=2048,sheetContentHeight=1024 } )
		map16sheetbg=graphics.newImageSheet( "goh/carte/level16/bd.jpg", { width=2048, height=1024, numFrames=1,sheetContentWidth=2048,sheetContentHeight=1024 } )
		map16sheetbd=graphics.newImageSheet( "goh/carte/level16/bg.jpg", { width=2048, height=1024, numFrames=1,sheetContentWidth=2048,sheetContentHeight=1024 } )
		map16sheeto1=graphics.newImageSheet( "goh/carte/level16/right_trees.png", { width=307, height=421, numFrames=1,sheetContentWidth=307,sheetContentHeight=421 } )
		map16sheeto2=graphics.newImageSheet( "goh/carte/level16/chest.png", { width=487, height=467, numFrames=4,sheetContentWidth=974,sheetContentHeight=934 } )
	end
		
	hg=display.newImage(map16sheethg,1) --display.newImage( "goh/carte/level2/hd.jpg", -1024,-512,true )
	hg.x=-1024
	hg.y=-512
	hd=display.newImage(map16sheethd,1) --display.newImage( "goh/carte/level2/hg.jpg",1024,-512,true )
	hd.x=1024
	hd.y=-512
	bg=display.newImage(map16sheetbg,1) --display.newImage( "goh/carte/level2/bd.jpg", -1024,512,true )
	bg.x=-1024
	bg.y=512
	bd=display.newImage(map16sheetbd,1) --display.newImage( "goh/carte/level2/bg.jpg", 1024,512,true )
	bd.x=1024
	bd.y=512
	-- obd=display.newImage(map1sheetobd,1) --display.newImage( "goh/carte/level2/bg.jpg", 1024,512,true )
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
	local tunededep=600
	local nbperso=leveldata[15].life
	if modeinfini or modesquelette then
		tunededep=tunedep
		nbperso=10
	end
	argentdep=-(tunededep)*3--hugo modifier uniquement le nombre le reste permet de crypter la donné-------------------------------------------------------------------
	ennemipassedep=nbperso--nombre d'ennemi qui peuvent encore passer avant qu'on perdre---hugo------------------------------------------------------------------------------------------------------------------
end

t.chemi=function()--donnees sur les differents points de la carte
local point= require( "point" )
genepointinit=65
distancedetection=0.5
pointdep={}--entré secondaire 
pointdep[1]=82
pointdep[2]=87
pointdep[3]=90
pointdep[4]=93
pointdep[5]=97
pointdep[6]=100
pointdep[7]=102

intersection={}
intersection.nb=32--2
--exemple
--intersection[1]={pt=11, ty=1, un=1, deux=13}
intersection[1]={pt=84, ty=0, un=11}
intersection[2]={pt=85, ty=0, un=11}
intersection[3]={pt=87, ty=0, un=18}
intersection[4]={pt=88, ty=0, un=19}
intersection[5]={pt=90, ty=0, un=24}
intersection[6]={pt=91, ty=0, un=25}
intersection[7]={pt=94, ty=0, un=32}
intersection[8]={pt=95, ty=0, un=33}
intersection[9]={pt=98, ty=0, un=38}
intersection[10]={pt=99, ty=0, un=38}
intersection[11]={pt=100, ty=0, un=46}
intersection[12]={pt=101, ty=0, un=46}
intersection[13]={pt=102, ty=0, un=51}
intersection[14]={pt=103, ty=0, un=52}
intersection[15]={pt=11, ty=1, un=13, deux=105,proba=2}
intersection[16]={pt=26, ty=1, un=29, deux=108,proba=2}
intersection[17]={pt=39, ty=1, un=41, deux=110,proba=2}
intersection[18]={pt=105, ty=0, un=60}
intersection[19]={pt=106, ty=0, un=60}
intersection[20]={pt=107, ty=0, un=72}
intersection[21]={pt=108, ty=0, un=72}
intersection[22]={pt=109, ty=0, un=76}
intersection[23]={pt=110, ty=0, un=76}
intersection[24]={pt=3, ty=1, un=5, deux=112,proba=2}
intersection[25]={pt=114, ty=1, un=55, deux=116,proba=2}
intersection[26]={pt=55, ty=1, un=57, deux=116,proba=2}
--intersection[27]={pt=121, ty=0, un=125}
intersection[27]={pt=65, ty=1, un=67, deux=125,proba=2}
intersection[28]={pt=80, ty=0, un=122}
intersection[29]={pt=81, ty=0, un=122}
intersection[30]={pt=122, ty=0, un=128}
intersection[31]={pt=123, ty=0, un=128}
intersection[32]={pt=124, ty=0, un=128}

--intersection[1]={pt=18, ty=2, un=29, deux=20,proba=2}
--intersection[2]={pt=20, ty=2, un=30, deux=22,proba=2}
--chemin[10].rayon=1000 --taille de la zone ou peut se trouver les gentils
--chemin[10].mechant=0.2 --recerement du chemin ils vont plus etre aussi ecarté
--intersection[2]={pt=46, ty=0, un=21}
cheminarr=nil
-- cheminarr={} --si des chemins sont des arrivés
-- cheminarr[1]=25 --fin numero 2 du chemin
-- cheminarr[2]=12 --fin numero 3 du chemin

cheminnb=127-- --nombre de point definisant le chemin -1--------------------------------------------------------------------------------------------------
chemin={}
chemin[1]=point.new(-617,127)	chemin[1].mechant=1.8		chemin[1].rayon=70000
chemin[2]=point.new(-568,128)	chemin[2].mechant=1.9		chemin[2].rayon=3000
chemin[3]=point.new(-526,121)	chemin[3].mechant=2.3		chemin[3].rayon=3000
chemin[4]=point.new(-492,99)	chemin[4].mechant=2.5		chemin[4].rayon=3000
chemin[5]=point.new(-469,64)	chemin[5].mechant=2.5		chemin[5].rayon=3000
chemin[6]=point.new(-461,20)	chemin[6].mechant=2.4		chemin[6].rayon=3000
chemin[7]=point.new(-454,-22)	chemin[7].mechant=2.1		chemin[7].rayon=3000
chemin[8]=point.new(-450,-67)	chemin[8].mechant=1.9		chemin[8].rayon=3000
chemin[9]=point.new(-437,-112)	chemin[9].mechant=1.7		chemin[9].rayon=3000
chemin[10]=point.new(-408,-147)	chemin[10].mechant=1.5		chemin[10].rayon=3000
chemin[11]=point.new(-367,-158)	chemin[11].mechant=1.5		chemin[11].rayon=3000
chemin[12]=point.new(-325,-173)	chemin[12].mechant=1.6		chemin[12].rayon=10000
chemin[13]=point.new(-288,-191)	chemin[13].mechant=1.5		chemin[13].rayon=3000
chemin[14]=point.new(-246,-212)	chemin[14].mechant=1		chemin[14].rayon=3000
chemin[15]=point.new(-203,-220)	chemin[15].mechant=1.2		chemin[15].rayon=3000
chemin[16]=point.new(-161,-236)	chemin[16].mechant=1.5		chemin[16].rayon=3000
chemin[17]=point.new(-113,-236)	chemin[17].mechant=1.6		chemin[17].rayon=3000
chemin[18]=point.new(-71,-239)	chemin[18].mechant=1.6		chemin[18].rayon=3000
chemin[19]=point.new(-32,-239)	chemin[19].mechant=1.4		chemin[19].rayon=3000
chemin[20]=point.new(9,-236)	chemin[20].mechant=1.4		chemin[20].rayon=3000
chemin[21]=point.new(51,-236)	chemin[21].mechant=1.4		chemin[21].rayon=3000
chemin[22]=point.new(92,-241)	chemin[22].mechant=1.6		chemin[22].rayon=3000
chemin[23]=point.new(133,-241)	chemin[23].mechant=1.8		chemin[23].rayon=3000
chemin[24]=point.new(174,-238)	chemin[24].mechant=1.6		chemin[24].rayon=3000
chemin[25]=point.new(215,-226)	chemin[25].mechant=1.4		chemin[25].rayon=3000
chemin[26]=point.new(255,-210)	chemin[26].mechant=1.5		chemin[26].rayon=9000
chemin[27]=point.new(285,-187)	chemin[27].mechant=2		chemin[27].rayon=13000
chemin[28]=point.new(327,-169)	chemin[28].mechant=2		chemin[28].rayon=3000
chemin[29]=point.new(366,-163)	chemin[29].mechant=1.8		chemin[29].rayon=6000
chemin[30]=point.new(402,-154)	chemin[30].mechant=1.8		chemin[30].rayon=3000
chemin[31]=point.new(428,-132)	chemin[31].mechant=2.2		chemin[31].rayon=3000
chemin[32]=point.new(442,-91)	chemin[32].mechant=2.2		chemin[32].rayon=3000
chemin[33]=point.new(455,-53)	chemin[33].mechant=2.2		chemin[33].rayon=3000
chemin[34]=point.new(463,-14)	chemin[34].mechant=2.4		chemin[34].rayon=3000
chemin[35]=point.new(465,24)	chemin[35].mechant=2.6		chemin[35].rayon=3000
chemin[36]=point.new(466,68)	chemin[36].mechant=2.8		chemin[36].rayon=3000
chemin[37]=point.new(450,105)	chemin[37].mechant=2.6		chemin[37].rayon=3000
chemin[38]=point.new(424,139)	chemin[38].mechant=2.2		chemin[38].rayon=3000
chemin[39]=point.new(380,154)	chemin[39].mechant=1.8		chemin[39].rayon=3000
chemin[40]=point.new(335,170)	chemin[40].mechant=1.8		chemin[40].rayon=3000
chemin[41]=point.new(294,191)	chemin[41].mechant=1.6		chemin[41].rayon=11000
chemin[42]=point.new(252,207)	chemin[42].mechant=1.5		chemin[42].rayon=6000
chemin[43]=point.new(211,225)	chemin[43].mechant=1.4		chemin[43].rayon=3000
chemin[44]=point.new(167,230)	chemin[44].mechant=1.5		chemin[44].rayon=3000
chemin[45]=point.new(122,232)	chemin[45].mechant=1.4		chemin[45].rayon=3000
chemin[46]=point.new(76,235)	chemin[46].mechant=1.4		chemin[46].rayon=3000
chemin[47]=point.new(31,237)	chemin[47].mechant=1.4		chemin[47].rayon=3000
chemin[48]=point.new(-15,238)	chemin[48].mechant=1.4		chemin[48].rayon=3000
chemin[49]=point.new(-63,238)	chemin[49].mechant=1.5		chemin[49].rayon=3000
chemin[50]=point.new(-109,238)	chemin[50].mechant=1.6		chemin[50].rayon=3000
chemin[51]=point.new(-158,237)	chemin[51].mechant=1.9		chemin[51].rayon=3000
chemin[52]=point.new(-203,221)	chemin[52].mechant=1.6		chemin[52].rayon=3000
chemin[53]=point.new(-247,204)	chemin[53].mechant=1.55		chemin[53].rayon=3000
chemin[54]=point.new(-276,167)	chemin[54].mechant=1.5		chemin[54].rayon=3000
chemin[55]=point.new(-280,121)	chemin[55].mechant=1.8		chemin[55].rayon=12000
chemin[56]=point.new(-278,76)	chemin[56].mechant=1.9		chemin[56].rayon=3000
chemin[57]=point.new(-280,30)	chemin[57].mechant=2.2		chemin[57].rayon=5000
chemin[58]=point.new(-272,-12)	chemin[58].mechant=2.5		chemin[58].rayon=7000
chemin[59]=point.new(-260,-58)	chemin[59].mechant=3		chemin[59].rayon=7000
chemin[60]=point.new(-226,-90)	chemin[60].mechant=1.5		chemin[60].rayon=3000
chemin[61]=point.new(-180,-98)	chemin[61].mechant=1.5		chemin[61].rayon=3000
chemin[62]=point.new(-139,-107)	chemin[62].mechant=1.5		chemin[62].rayon=3000
chemin[63]=point.new(-98,-110)	chemin[63].mechant=1.5		chemin[63].rayon=3000
chemin[64]=point.new(-57,-113)	chemin[64].mechant=1.5		chemin[64].rayon=3000
chemin[65]=point.new(-15,-110)	chemin[65].mechant=1.5		chemin[65].rayon=3000
chemin[66]=point.new(26,-111)	chemin[66].mechant=1.5		chemin[66].rayon=3000
chemin[67]=point.new(65,-110)	chemin[67].mechant=1.5		chemin[67].rayon=3000
chemin[68]=point.new(106,-108)	chemin[68].mechant=1.5		chemin[68].rayon=3000
chemin[69]=point.new(148,-103)	chemin[69].mechant=1.5		chemin[69].rayon=3000
chemin[70]=point.new(190,-97)	chemin[70].mechant=1.5		chemin[70].rayon=3000
chemin[71]=point.new(229,-84)	chemin[71].mechant=1.9		chemin[71].rayon=3000
chemin[72]=point.new(262,-64)	chemin[72].mechant=2.5		chemin[72].rayon=6000
chemin[73]=point.new(277,-28)	chemin[73].mechant=2.5		chemin[73].rayon=6000
chemin[74]=point.new(275,7)		chemin[74].mechant=2.4		chemin[74].rayon=6000
chemin[75]=point.new(265,43)	chemin[75].mechant=2.4		chemin[75].rayon=6000
chemin[76]=point.new(231,73)	chemin[76].mechant=1.6		chemin[76].rayon=3000
chemin[77]=point.new(190,90)	chemin[77].mechant=1.5		chemin[77].rayon=3000
chemin[78]=point.new(147,98)	chemin[78].mechant=1.5		chemin[78].rayon=3000
chemin[79]=point.new(102,102)	chemin[79].mechant=1.5		chemin[79].rayon=3000
chemin[80]=point.new(57,107)	chemin[80].mechant=1.5		chemin[80].rayon=3000
chemin[81]=point.new(11,108)	chemin[81].mechant=1.5		chemin[81].rayon=3000
chemin[82]=point.new(-614,-125)	chemin[82].mechant=1.5		chemin[82].rayon=65000
chemin[83]=point.new(-572,-127)	chemin[83].mechant=1.7		chemin[83].rayon=3000
chemin[84]=point.new(-529,-124)	chemin[84].mechant=1.9		chemin[84].rayon=3000
chemin[85]=point.new(-485,-130)	chemin[85].mechant=2.3		chemin[85].rayon=3000
chemin[86]=point.new(-122,-308)	chemin[86].mechant=1.6		chemin[86].rayon=15000
chemin[87]=point.new(-102,-272)	chemin[87].mechant=1.3		chemin[87].rayon=3000
chemin[88]=point.new(-76,-256)	chemin[88].mechant=1		chemin[88].rayon=3000
chemin[89]=point.new(136,-306)	chemin[89].mechant=1.7		chemin[89].rayon=15000
chemin[90]=point.new(149,-274)	chemin[90].mechant=1.6		chemin[90].rayon=3000
chemin[91]=point.new(172,-252)	chemin[91].mechant=1		chemin[91].rayon=3000
chemin[92]=point.new(610,-126)	chemin[92].mechant=1.7		chemin[92].rayon=60000
chemin[93]=point.new(564,-123)	chemin[93].mechant=1.7		chemin[93].rayon=3000
chemin[94]=point.new(522,-121)	chemin[94].mechant=2		chemin[94].rayon=3000
chemin[95]=point.new(486,-104)	chemin[95].mechant=2.6		chemin[95].rayon=3000
chemin[96]=point.new(612,132)	chemin[96].mechant=1.7		chemin[96].rayon=65000
chemin[97]=point.new(564,125)	chemin[97].mechant=1.7		chemin[97].rayon=3000
chemin[98]=point.new(518,120)	chemin[98].mechant=2.2		chemin[98].rayon=3000
chemin[99]=point.new(478,133)	chemin[99].mechant=1.8		chemin[99].rayon=3000
chemin[100]=point.new(129,303)	chemin[100].mechant=1.6		chemin[100].rayon=3000
chemin[101]=point.new(116,261)	chemin[101].mechant=1.9		chemin[101].rayon=3000
chemin[102]=point.new(-119,305)	chemin[102].mechant=2		chemin[102].rayon=3000
chemin[103]=point.new(-154,255)	chemin[103].mechant=1.5		chemin[103].rayon=3000
chemin[104]=point.new(-313,-158)chemin[104].mechant=1.5		chemin[104].rayon=3000
chemin[105]=point.new(-282,-133)chemin[105].mechant=1.7		chemin[105].rayon=3000
chemin[106]=point.new(-256,-114)chemin[106].mechant=1.1		chemin[106].rayon=8000
chemin[107]=point.new(284,-151)	chemin[107].mechant=1.6		chemin[107].rayon=3000
chemin[108]=point.new(279,-111)	chemin[108].mechant=1.7		chemin[108].rayon=6000
chemin[109]=point.new(304,135)	chemin[109].mechant=2		chemin[109].rayon=12000
chemin[110]=point.new(271,96)	chemin[110].mechant=2.2		chemin[110].rayon=3000
chemin[111]=point.new(-466,133)	chemin[111].mechant=2		chemin[111].rayon=3000
chemin[112]=point.new(-424,136)	chemin[112].mechant=2.4		chemin[112].rayon=3000
chemin[113]=point.new(-383,147)	chemin[113].mechant=1.9		chemin[113].rayon=3000
chemin[114]=point.new(-337,154)	chemin[114].mechant=1.8		chemin[114].rayon=10000
chemin[115]=point.new(-300,131)	chemin[115].mechant=1.6		chemin[115].rayon=3000
chemin[116]=point.new(-233,82)	chemin[116].mechant=1.8		chemin[116].rayon=5000
chemin[117]=point.new(-191,92)	chemin[117].mechant=1.5		chemin[117].rayon=3000
chemin[118]=point.new(-149,99)	chemin[118].mechant=1.6		chemin[118].rayon=3000
chemin[119]=point.new(-108,105)	chemin[119].mechant=1.6		chemin[119].rayon=3000
chemin[120]=point.new(-66,108)	chemin[120].mechant=1.6		chemin[120].rayon=3000
chemin[121]=point.new(-25,108)	chemin[121].mechant=1.6		chemin[121].rayon=3000
chemin[122]=point.new(1,61)		chemin[122].mechant=2		chemin[122].rayon=3000
chemin[123]=point.new(6,7)		chemin[123].mechant=1		chemin[123].rayon=3000
chemin[124]=point.new(6,-6)		chemin[124].mechant=1		chemin[124].rayon=3000
chemin[125]=point.new(5,-79)	chemin[125].mechant=1.9		chemin[125].rayon=3000
chemin[126]=point.new(8,-40)	chemin[126].mechant=2		chemin[126].rayon=3000
chemin[127]=point.new(6,7)		chemin[127].mechant=1		chemin[127].rayon=3000
chemin[128]=point.new(6,13)		chemin[128].mechant=1		chemin[128].rayon=6000

obstacle0nb=0
obstacle0={} --obstacle de 


obstaclenb=2 --156--nombre de point definissant les petits obstacles
obstacle={}
obstacle[1]=point.new(91,-4)
obstacle[2]=point.new(-82,-4)

obstacle1nb=6--nombre de point definisant le nombre de point du gros obstacle
obstacle1={}--gros cercle
obstacle1[1]=point.new(-425,-303)
obstacle1[2]=point.new(-343,-303)
obstacle1[3]=point.new(414,298)
obstacle1[4]=point.new(310,291)
obstacle1[5]=point.new(-444,291)
obstacle1[6]=point.new(-389,252)
--obstacle1[7]=point.new(237,253)


--mine:
mineinfo={}
mineinfo.nb=0

--obstaclsold.nb=0 --nombre d'obstacle ou les soldats ne peuvent pas aller.
-- obstaclsold[1]=point.new(-55,-10)
-- obstaclsold[1].point=10
-- obstaclsold[1].rayon=1000
-- obstaclsold[2]=point.new(0,-10)

 end
t.obsim=function()
if obstacleim==nil then
	obstacleim={}
end
obstacleim[1]=display.newImage(map16sheeto1,1)
obstacleim[1].anchorY=1
obstacleim[1].x=1898
obstacleim[1].y=69
obstacleim[2]=display.newImage(objetdec[3],12)
obstacleim[2].anchorY=1
obstacleim[2].x=-1865.5
obstacleim[2].y=1024
obstacleim[3]=display.newImage(objetdec[3],11)
obstacleim[3].anchorY=1
obstacleim[3].x=-1453.5
obstacleim[3].y=983
obstacleim[4]=display.newImage(objetdec[3],10)
obstacleim[4].anchorY=1
obstacleim[4].x=1926
obstacleim[4].y=69
obstacleim[5]=display.newImage(objetdec[3],11)
obstacleim[5].anchorY=1
obstacleim[5].x=1874
obstacleim[5].y=-58
obstacleim[6]=display.newSprite(map16sheeto2,{frames={1,2,3,4},time=100,loopCount=1})
obstacleim[6].anchorY=1
obstacleim[6].xScale=0.5
obstacleim[6].yScale=0.5
obstacleim[6].x=5/0.3
obstacleim[6].y=16/0.3
obstacleim[6]:setFrame(1)
-- obstacleim[4]=display.newImage(objetdec[4],4)
-- obstacleim[4].anchorY=1
-- obstacleim[4].x=-1175 -- -1207
-- obstacleim[4].y=-180 -- -205
-- obstacleim[4].xScale=-1
-- obstacleim[5]=display.newImage(objetdec[4],4)
-- obstacleim[5].anchorY=1
-- obstacleim[5].x=-1160 -- -1207
-- obstacleim[5].y=430--357
-- obstacleim[5].xScale=-0.85
-- obstacleim[6]=display.newImage(objetdec[4],4)
-- obstacleim[6].anchorY=1
-- obstacleim[6].x=-664
-- obstacleim[6].y=-400 -- -441
-- obstacleim[6].xScale=-0.9 -- -1
-- obstacleim[7]=display.newImage(objetdec[4],4)
-- obstacleim[7].anchorY=1
-- obstacleim[7].x=-651
-- obstacleim[7].y=640--600 -- 640
-- obstacleim[7].xScale=-1
-- obstacleim[8]=display.newImage(objetdec[4],4)
-- obstacleim[8].anchorY=1
-- obstacleim[8].x=643
-- obstacleim[8].y=-380 -- -436
-- obstacleim[9]=display.newImage(objetdec[4],4)
-- obstacleim[9].anchorY=1
-- obstacleim[9].x=643
-- obstacleim[9].y=632
-- obstacleim[10]=display.newImage(objetdec[4],4)
-- obstacleim[10].anchorY=1
-- obstacleim[10].x=1220
-- obstacleim[10].y=-175
-- obstacleim[14]=display.newImage(objetdec[4],4)
-- obstacleim[14].anchorY=1
-- obstacleim[14].x=1170
-- obstacleim[14].y=420
-- obstacleim[14].xScale=0.8



decoration={} -- ligne a mettre pour la création avec assistance
decoration[1]={}
decoration[1].x=-1828.5*0.3
decoration[1].y=777*0.3
decoration[1].type=10
decoration[1].planche=3
decoration[1].scale=0.3
decoration[1].anchorY=1

decoration[2]={}
decoration[2].x=-1175*0.3
decoration[2].y=-180*0.3
decoration[2].type=4
decoration[2].planche=4
decoration[2].scale=0.3
decoration[2].anchorY=1
decoration[2].xScale=-1
decoration[3]={}
decoration[3].x=-1160*0.3
decoration[3].y=430*0.3
decoration[3].type=4
decoration[3].planche=4
decoration[3].scale=0.3
decoration[3].anchorY=1
decoration[3].xScale=-0.85
decoration[4]={}
decoration[4].x=-664*0.3
decoration[4].y=-400*0.3
decoration[4].type=4
decoration[4].planche=4
decoration[4].scale=0.3
decoration[4].anchorY=1
decoration[4].xScale=-0.9
decoration[5]={}
decoration[5].x=-651*0.3
decoration[5].y=640*0.3
decoration[5].type=4
decoration[5].planche=4
decoration[5].scale=0.3
decoration[5].anchorY=1
decoration[5].xScale=-1
decoration[6]={}
decoration[6].x=643*0.3
decoration[6].y=-380*0.3
decoration[6].type=4
decoration[6].planche=4
decoration[6].scale=0.3
decoration[6].anchorY=1
decoration[7]={}
decoration[7].x=643*0.3
decoration[7].y=632*0.3
decoration[7].type=4
decoration[7].planche=4
decoration[7].scale=0.3
decoration[7].anchorY=1
decoration[8]={}
decoration[8].x=1220*0.3
decoration[8].y=-175*0.3
decoration[8].type=4
decoration[8].planche=4
decoration[8].scale=0.3
decoration[8].anchorY=1
decoration[9]={}
decoration[9].x=1170*0.3
decoration[9].y=420*0.3
decoration[9].type=4
decoration[9].planche=4
decoration[9].scale=0.3
decoration[9].anchorY=1
decoration[9].xScale=0.8

end
t.vague=function()--donnees sur les vagues du niveau
vague={}
local k=nil
--nbvague=5--15
for k=1,leveldata[15].wave,1 do
	vague[k]={}
	vague[k][1]=200
end
vague[1]={6,237,237,237,237,224,224,-1,6,237,237,237,237,224,224,-2,5,237,237,237,237,237,-3,5,237,237,237,237,237,-4,5,237,237,237,237,237,-5,5,237,237,237,237,237,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,5,220,220,220,220,216,-1,5,220,220,220,220,216,-2,3,220,220,220,-3,3,220,220,220,-4,3,220,220,220,-5,3,220,220,220,0,0,0,0,0,0,0,0,0,0,0,0,0,6,237,237,237,237,223,223,-1,6,237,237,237,237,223,223,-2,6,237,237,237,237,237,237,-3,6,237,237,237,237,237,237,-4,6,237,237,237,237,237,237,-5,6,237,237,237,237,237,237,0,0,0,0,0,0,9,238,238,238,238,238,238,238,238,238,-1,9,238,238,238,238,238,238,238,238,238,-2,9,238,238,238,238,238,238,238,238,238,-3,9,238,238,238,238,238,238,238,238,238,-4,9,238,238,238,238,238,238,238,238,238,-5,9,238,238,238,238,238,238,238,238,238,-6,9,238,238,238,238,238,238,238,238,238,-7,9,238,238,238,238,238,238,238,238,238,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
vague[2]={-16,9,237,237,237,237,237,237,237,237,237,-1,9,237,237,237,237,237,237,237,237,237,-2,9,237,237,237,237,237,237,237,237,237,-3,9,237,237,237,237,237,237,237,237,237,-4,9,237,237,237,237,237,237,237,237,237,-5,9,237,237,237,237,237,237,237,237,237,-6,9,237,237,237,237,237,237,237,237,237,-7,9,237,237,237,237,237,237,237,237,237,-16,223,-1,223,-2,223,-3,223,-4,223,-5,223,-6,223,-7,223,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
vague[3]={3,222,222,222,-1,3,222,222,222,-2,3,222,222,222,-3,3,222,222,222,-4,3,222,222,222,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-14,5,207,207,207,207,207,-1,5,207,207,207,207,207,-2,5,207,207,207,207,207,-3,5,207,207,207,207,207,-4,5,207,207,207,207,207,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-14,9,260,260,260,260,260,260,260,260,260,-1,9,260,260,260,260,260,260,260,260,260,-2,9,260,260,260,260,260,260,260,260,260,-3,9,260,260,260,260,260,260,260,260,260,-4,9,260,260,260,260,260,260,260,260,260,0,0,0,0,0,0,0}
vague[4]={-15,262,-1,262,-2,262,-3,262,-4,262,-5,262,-6,262,0,-15,4,218,218,218,218,-1,4,218,218,218,218,-2,4,218,218,218,218,-3,4,218,218,218,218,-4,4,218,218,218,218,-5,4,218,218,218,218,-6,4,218,218,218,218,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,8,237,237,237,237,224,224,224,224,-1,8,237,237,237,237,224,224,224,224,-2,8,237,237,237,237,224,224,224,224,-3,8,237,237,237,237,224,224,224,224,-4,6,237,237,237,237,224,224,-5,6,237,237,237,237,224,224,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
vague[5]={262,-7,262,-4,262,-2,262,-1,262,0,0,0,0,0,0,0,0,0,-16,9,237,237,237,237,237,237,237,237,237,-1,9,237,237,237,237,237,237,237,237,237,-2,9,237,237,237,237,237,237,237,237,237,-3,9,237,237,237,237,237,237,237,237,237,-4,9,237,237,237,237,237,237,237,237,237,-5,9,237,237,237,237,237,237,237,237,237,-6,9,237,237,237,237,237,237,237,237,237,-7,9,237,237,237,237,237,237,237,237,237,9,237,237,237,237,237,237,237,237,237,-1,9,237,237,237,237,237,237,237,237,237,-2,9,237,237,237,237,237,237,237,237,237,-3,9,237,237,237,237,237,237,237,237,237,-4,9,237,237,237,237,237,237,237,237,237,-5,9,237,237,237,237,237,237,237,237,237,-6,9,237,237,237,237,237,237,237,237,237,-7,9,237,237,237,237,237,237,237,237,237,-16,9,237,237,237,237,237,237,237,237,237,-1,9,237,237,237,237,237,237,237,237,237,-2,9,237,237,237,237,237,237,237,237,237,-3,9,237,237,237,237,237,237,237,237,237,-4,9,237,237,237,237,237,237,237,237,237,-5,9,237,237,237,237,237,237,237,237,237,-6,9,237,237,237,237,237,237,237,237,237,-7,9,237,237,237,237,237,237,237,237,237,9,237,237,237,237,237,237,237,237,237,-1,9,237,237,237,237,237,237,237,237,237,-2,9,237,237,237,237,237,237,237,237,237,-3,9,237,237,237,237,237,237,237,237,237,-4,9,237,237,237,237,237,237,237,237,237,-5,9,237,237,237,237,237,237,237,237,237,-6,9,237,237,237,237,237,237,237,237,237,-7,9,237,237,237,237,237,237,237,237,237,-16,9,237,237,237,237,237,237,237,237,237,-1,9,237,237,237,237,237,237,237,237,237,-2,9,237,237,237,237,237,237,237,237,237,-3,9,237,237,237,237,237,237,237,237,237,-4,9,237,237,237,237,237,237,237,237,237,-5,9,237,237,237,237,237,237,237,237,237,-6,9,237,237,237,237,237,237,237,237,237,-7,9,237,237,237,237,237,237,237,237,237,9,237,237,237,237,237,237,237,237,237,-1,9,237,237,237,237,237,237,237,237,237,-2,9,237,237,237,237,237,237,237,237,237,-3,9,237,237,237,237,237,237,237,237,237,-4,9,237,237,237,237,237,237,237,237,237,-5,9,237,237,237,237,237,237,237,237,237,-6,9,237,237,237,237,237,237,237,237,237,-7,9,237,237,237,237,237,237,237,237,237,-16,9,237,237,237,237,237,237,237,237,237,-1,9,237,237,237,237,237,237,237,237,237,-2,9,237,237,237,237,237,237,237,237,237,-3,9,237,237,237,237,237,237,237,237,237,-4,9,237,237,237,237,237,237,237,237,237,-5,9,237,237,237,237,237,237,237,237,237,-6,9,237,237,237,237,237,237,237,237,237,-7,9,237,237,237,237,237,237,237,237,237,9,237,237,237,237,237,237,237,237,237,-1,9,237,237,237,237,237,237,237,237,237,-2,9,237,237,237,237,237,237,237,237,237,-3,9,237,237,237,237,237,237,237,237,237,-4,9,237,237,237,237,237,237,237,237,237,-5,9,237,237,237,237,237,237,237,237,237,-6,9,237,237,237,237,237,237,237,237,237,-7,9,237,237,237,237,237,237,237,237,237}
vague[6]={285,-2,285,-4,285,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,224,224,224,269,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,284,-1,284,-2,284,-3,284,-4,284,-5,286,-6,-284,-7,284,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,204,-1,204,2,216,216,-1,2,216,216,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
vague[7]={9,220,220,220,220,220,220,220,221,221,-1,9,220,220,220,220,220,220,220,221,221,-2,9,220,220,220,220,220,220,220,221,221,-3,9,220,220,220,220,220,220,220,221,221,-4,9,220,220,220,220,220,220,220,221,221,-5,9,220,220,220,220,220,220,220,221,221,0,0,0,0,0,0,0,0,0,0,0,0,0,9,220,220,220,220,220,220,220,221,221,-1,9,220,220,220,220,220,220,220,221,221,-2,9,220,220,220,220,220,220,220,221,221,-3,9,220,220,220,220,220,220,220,221,221,-4,9,220,220,220,220,220,220,220,221,221,-5,9,220,220,220,220,220,220,220,221,221,0,0,0,0,0,0,9,220,220,220,220,220,220,220,221,221,-1,9,220,220,220,220,220,220,220,221,221,-2,9,220,220,220,220,220,220,220,221,221,-3,9,220,220,220,220,220,220,220,221,221,-4,9,220,220,220,220,220,220,220,221,221,-5,9,220,220,220,220,220,220,220,221,221,3,221,221,221,-5,3,221,221,221,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-16,3,221,221,221,-1,3,221,221,221,-2,3,221,221,221,-3,3,221,221,221,-4,3,221,221,221,-5,3,221,221,221,-6,3,221,221,221,-7,3,221,221,221,0,-16,3,203,203,203,-1,3,203,203,203,-2,3,203,203,203,-3,3,203,203,203,-4,3,203,203,203,-5,3,203,203,203,-6,3,203,203,203,-7,3,203,203,203,0,0,0,0,0,0,0,0}
vague[8]={3,222,222,222,-1,3,222,222,222,-2,3,222,222,222,-3,3,222,222,222,-4,3,222,222,222,-5,3,222,222,222,-6,3,222,222,222,-7,3,222,222,222,3,222,222,222,-1,3,222,222,222,-2,3,222,222,222,-3,3,222,222,222,-4,3,222,222,222,-5,3,222,222,222,-6,3,222,222,222,-7,3,222,222,222,3,222,222,222,-1,3,222,222,222,-2,3,222,222,222,-3,3,222,222,222,-4,3,222,222,222,-5,3,222,222,222,-6,3,222,222,222,-7,3,222,222,222,3,222,222,222,-1,3,222,222,222,-2,3,222,222,222,-3,3,222,222,222,-4,3,222,222,222,-5,3,222,222,222,-6,3,222,222,222,-7,3,222,222,222,3,222,222,222,-1,3,222,222,222,-2,3,222,222,222,-3,3,222,222,222,-4,3,222,222,222,-5,3,222,222,222,-6,3,222,222,222,-7,3,222,222,222,2,222,222,-1,2,222,222,-2,2,222,222,-3,2,222,222,-4,2,222,222,-5,2,222,222,-6,2,222,222,-7,2,222,222,2,222,222,-1,2,222,222,-2,2,222,222,-3,2,222,222,-4,2,222,222,-5,2,222,222,-6,2,222,222,-7,2,222,222,2,222,222,-1,2,222,222,-2,2,222,222,-3,2,222,222,-4,2,222,222,-5,2,222,222,-6,2,222,222,-7,2,222,222,2,222,222,-1,2,222,222,-2,2,222,222,-3,2,222,222,-4,2,222,222,-5,2,222,222,-6,2,222,222,-7,2,222,222,2,222,222,-1,2,222,222,-2,2,222,222,-3,2,222,222,-4,2,222,222,-5,2,222,222,-6,2,222,222,-7,2,222,222,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
vague[9]={3,269,262,262,0,0,-1,3,269,262,262,0,0,-2,3,269,262,262,0,0,0,-3,3,269,262,262,0,0,-4,3,269,262,262,0,0,-5,3,269,262,262,0,0,-6,3,269,262,262,0,0,-7,3,269,262,262,0,0,0,219,-1,219,-2,219,-3,219,-4,219,-5,219,-6,219,-7,219,219,-1,219,-2,219,-3,219,-4,219,-5,219,-6,219,-7,219,2,219,219,-1,2,219,219,-2,2,219,219,-3,2,219,219,-4,2,219,219,0,0,0,0,-5,2,219,219,-6,2,219,219,-7,2,219,219,2,219,219,-1,2,219,219,-2,2,219,219,-3,2,219,219,-4,2,219,219,-5,2,219,219,-6,2,219,219,-7,2,219,219,2,219,219,-1,2,219,219,-2,2,219,219,-3,2,219,219,-4,2,219,219,-5,2,219,219,-6,2,219,219,-7,2,219,219,2,219,219,-1,2,219,219,-2,2,219,219,-3,2,219,219,-4,2,219,219,-5,2,219,219,-6,2,219,219,-7,2,219,219,2,219,219,-1,2,219,219,-2,2,219,219,-3,2,219,219,-4,2,219,219,-5,2,219,219,-6,2,219,219,-7,2,219,219,2,219,219,-1,2,219,219,-2,2,219,219,-3,2,219,219,-4,2,219,219,-5,2,219,219,-6,2,219,219,0,0,0,-7,2,219,219,2,219,219,-1,2,219,219,-2,2,219,219,-3,2,219,219,-4,2,219,219,-5,2,219,219,-6,2,219,219,-7,2,219,219,2,219,219,-1,2,219,219,-2,2,219,219,-3,2,219,219,-4,2,219,219,-5,2,219,219,-6,2,219,219,-7,2,219,219,2,219,219,-1,2,219,219,-2,2,219,219,-3,2,219,219,-4,2,219,219,-5,2,219,219,-6,2,219,219,-7,2,219,219,2,219,219,-1,2,219,219,-2,2,219,219,-3,2,219,219,-4,2,219,219,-5,2,219,219,-6,2,219,219,-7,2,219,219,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
vague[10]={-16,2,268,204,-1,2,268,204,-2,2,268,204,-3,2,268,204,-4,2,268,204,-5,2,268,204,-6,2,268,204,-7,2,268,204,0,0,0,0,0,0,0,-16,2,268,204,-1,2,268,204,-2,2,268,204,-3,2,268,204,-4,2,268,204,-5,2,268,204,-6,2,268,204,-7,2,268,204,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,8,263,263,263,263,263,263,263,263,-1,8,263,263,263,263,263,263,263,263,-2,8,263,263,263,263,263,263,263,263,-3,8,263,263,263,263,263,263,263,263,-4,8,263,263,263,263,263,263,263,263,-5,8,263,263,263,263,263,263,263,263,-6,8,263,263,263,263,263,263,263,263,-7,8,263,263,263,263,263,263,263,263,-4,8,263,263,263,263,263,263,263,263,-5,8,263,263,263,263,263,263,263,263,-6,8,263,263,263,263,263,263,263,263,-7,8,263,263,263,263,263,263,263,263,0,0,0,0,0,0,0,0,0,2,286,286,0,-2,2,286,286,0,-4,2,286,286,0,-6,2,286,286,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
vague[11]={-1,225,0,0,0,0,0,0,0,221,-1,221,-2,221,-3,221,-4,221,-5,221,-6,221,-7,221,0,0,0,221,-1,221,-2,221,-3,221,-4,221,-5,221,-6,221,-7,221,0,0,0,221,-1,221,-2,221,-3,221,-4,221,-5,221,-6,221,-7,221,0,0,0,222,-1,222,-2,222,-3,222,-4,222,-5,222,-6,222,-7,222,0,0,0,222,-1,222,-2,222,-3,222,-4,222,-5,222,-6,222,-7,222,0,0,0,222,-1,222,-2,222,-3,222,-4,222,-5,222,-6,222,-7,222,0,0,0,263,-1,263,-2,263,-3,263,-4,263,-5,263,-6,263,-7,263,0,0,0,263,-1,263,-2,263,-3,263,-4,263,-5,263,-6,263,-7,263,0,0,0,263,-1,263,-2,263,-3,263,-4,263,-5,263,-6,263,-7,263}
end
t.vaguewave=function()
	vague={}
	vague[1]={225,-2,225,-4,225,-6,225,-7,225}
end
return t