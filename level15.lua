local t={}
t.new=function()--gestion du niveau 1 du jeu, doit toujours suivre le meme modele


	-- map1=display.newImage(map1sheet,1) -- display.newImage( "carte/level1/carte1a.png", 0,0,true )--devrai etre en local pour niveau1
	-- map1.x=0
	-- map1.y=0
	--map1p=display.newCircle(0,0,10) --display.newImage(map1psheet,1) -- display.newImage( "carte/level1/carte1p.png", 0,0,true )
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
	if donneecharger[15]==0 then
		donneecharger[15]=1
		map15sheethg=graphics.newImageSheet( "carte/level15/hg.jpg", { width=2048, height=1024, numFrames=1,sheetContentWidth=2048,sheetContentHeight=1024 } )
		map15sheethd=graphics.newImageSheet( "carte/level15/hd.jpg", { width=2048, height=1024, numFrames=1,sheetContentWidth=2048,sheetContentHeight=1024 } )
		map15sheetbg=graphics.newImageSheet( "carte/level15/bg.jpg", { width=2048, height=1024, numFrames=1,sheetContentWidth=2048,sheetContentHeight=1024 } )
		map15sheetbd=graphics.newImageSheet( "carte/level15/bd.jpg", { width=2048, height=1024, numFrames=1,sheetContentWidth=2048,sheetContentHeight=1024 } )
		map15sheeto1=graphics.newImageSheet( "carte/level15/1.png", { width=1633, height=356, numFrames=1,sheetContentWidth=1633,sheetContentHeight=356 } )
		map15sheeto2=graphics.newImageSheet( "carte/level15/2.png", { width=331, height=383, numFrames=1,sheetContentWidth=331,sheetContentHeight=383 } )
		map15sheeto3=graphics.newImageSheet( "carte/level15/3.png", { width=315, height=280, numFrames=1,sheetContentWidth=315,sheetContentHeight=280 } )
		map15sheeto4=graphics.newImageSheet( "carte/level15/4.png", { width=203, height=280, numFrames=1,sheetContentWidth=203,sheetContentHeight=280 } )
		map15sheeto5=graphics.newImageSheet( "carte/level15/5.png", { width=175, height=386, numFrames=1,sheetContentWidth=175,sheetContentHeight=386 } )
		map15sheeto6=graphics.newImageSheet( "carte/level15/6.png", { width=778, height=416, numFrames=1,sheetContentWidth=778,sheetContentHeight=416 } )
		map15sheeto7=graphics.newImageSheet( "carte/level15/7.png", { width=175, height=431, numFrames=1,sheetContentWidth=175,sheetContentHeight=431 } )
		map15sheeto8=graphics.newImageSheet( "carte/level15/8.png", { width=597, height=209, numFrames=1,sheetContentWidth=597,sheetContentHeight=209 } )
		map15sheeto9=graphics.newImageSheet( "carte/level15/9.png", { width=571, height=444, numFrames=1,sheetContentWidth=571,sheetContentHeight=444 } )
		map15sheeto10=graphics.newImageSheet( "carte/level15/10.png", { width=203, height=280, numFrames=1,sheetContentWidth=203,sheetContentHeight=280 } )
		map15sheeto11=graphics.newImageSheet( "carte/level15/11.png", { width=554, height=533, numFrames=1,sheetContentWidth=554,sheetContentHeight=533 } )
		map15sheeto12=graphics.newImageSheet( "carte/level15/12.png", { width=251, height=293, numFrames=1,sheetContentWidth=251,sheetContentHeight=293 } )
		map15sheeto13=graphics.newImageSheet( "carte/level15/13.png", { width=892, height=304, numFrames=1,sheetContentWidth=892,sheetContentHeight=304 } )
		map15sheeto14=graphics.newImageSheet( "carte/level15/14.png", { width=1290, height=557, numFrames=1,sheetContentWidth=1290,sheetContentHeight=557 } )
		map15sheeto15=graphics.newImageSheet( "carte/level15/15.png", { width=614, height=419, numFrames=1,sheetContentWidth=614,sheetContentHeight=419 } )
	end
		
	hg=display.newImage(map15sheethg,1) --display.newImage( "carte/level2/hg.png", -1024,-512,true )
	hg.x=-1024
	hg.y=-512
	hd=display.newImage(map15sheethd,1) --display.newImage( "carte/level2/hd.png",1024,-512,true )
	hd.x=1024
	hd.y=-512
	bg=display.newImage(map15sheetbg,1) --display.newImage( "carte/level2/bg.png", -1024,512,true )
	bg.x=-1024
	bg.y=512
	bd=display.newImage(map15sheetbd,1) --display.newImage( "carte/level2/bd.png", 1024,512,true )
	bd.x=1024
	bd.y=512
	-- obd=display.newImage(map1sheetobd,1) --display.newImage( "carte/level2/bd.png", 1024,512,true )
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
--chemin[10].rayon=1000 --taille de la zone ou peut se trouver les gentils
--chemin[10].mechant=0.2 --recerement du chemin ils vont plus etre aussi ecarté
chemin[1]=point.new(-611,118)
chemin[2]=point.new(-568,120)
chemin[3]=point.new(-526,121)
chemin[4]=point.new(-492,99)
--chemin[4].mechant=1.5
chemin[5]=point.new(-469,64)
chemin[6]=point.new(-461,20)
chemin[7]=point.new(-454,-22)
chemin[8]=point.new(-450,-67)
chemin[9]=point.new(-437,-112)
--chemin[9].mechant=1.5
chemin[10]=point.new(-408,-147)
chemin[11]=point.new(-367,-158)
chemin[12]=point.new(-325,-173)
--chemin[12].mechant=1.5
chemin[13]=point.new(-288,-191)
chemin[14]=point.new(-246,-212)
chemin[15]=point.new(-203,-220)
chemin[16]=point.new(-159,-228)
chemin[17]=point.new(-113,-236)
chemin[18]=point.new(-71,-239)
chemin[19]=point.new(-32,-239)
chemin[20]=point.new(9,-236)
chemin[21]=point.new(51,-241)
chemin[22]=point.new(92,-241)
chemin[23]=point.new(133,-241)
chemin[24]=point.new(174,-238)
chemin[25]=point.new(215,-226)
chemin[26]=point.new(255,-210)
chemin[27]=point.new(285,-187)
--chemin[27].mechant=1.5
chemin[28]=point.new(327,-169)
chemin[29]=point.new(366,-163)
chemin[30]=point.new(398,-145)
chemin[31]=point.new(424,-127)
chemin[32]=point.new(442,-91)
chemin[33]=point.new(455,-53)
chemin[34]=point.new(463,-14)
chemin[35]=point.new(465,24)
chemin[36]=point.new(466,68)
chemin[37]=point.new(450,105)
--chemin[37].mechant=1.5
chemin[38]=point.new(424,139)
chemin[39]=point.new(380,154)
chemin[40]=point.new(335,170)
--chemin[40].mechant=1.5
chemin[41]=point.new(294,191)
chemin[42]=point.new(252,207)
chemin[43]=point.new(211,225)
chemin[44]=point.new(167,230)
chemin[45]=point.new(122,232)
chemin[46]=point.new(76,235)
chemin[47]=point.new(31,237)
chemin[48]=point.new(-15,238)
chemin[49]=point.new(-63,238)
chemin[50]=point.new(-109,238)
chemin[51]=point.new(-158,237)
chemin[52]=point.new(-203,221)
chemin[53]=point.new(-247,204)
chemin[54]=point.new(-276,167)
chemin[55]=point.new(-280,121)
chemin[56]=point.new(-278,76)
chemin[57]=point.new(-280,30)
chemin[58]=point.new(-272,-12)
chemin[59]=point.new(-260,-58)
chemin[60]=point.new(-226,-90)
chemin[61]=point.new(-180,-100)
chemin[62]=point.new(-138,-102)
chemin[63]=point.new(-98,-110)
chemin[64]=point.new(-57,-113)
chemin[65]=point.new(-15,-110)
chemin[66]=point.new(26,-111)
chemin[67]=point.new(65,-110)
chemin[68]=point.new(106,-108)
chemin[69]=point.new(148,-103)
chemin[70]=point.new(190,-97)
chemin[71]=point.new(229,-84)
chemin[72]=point.new(262,-64)
--chemin[72].mechant=2
chemin[73]=point.new(277,-28)
chemin[74]=point.new(275,7)
chemin[75]=point.new(265,43)
chemin[76]=point.new(231,73)
chemin[77]=point.new(190,90)
chemin[78]=point.new(148,105)
chemin[79]=point.new(103,108)
chemin[80]=point.new(57,107)
chemin[81]=point.new(11,108)
chemin[82]=point.new(-614,-125)
chemin[83]=point.new(-572,-127)
chemin[84]=point.new(-529,-124)
chemin[85]=point.new(-485,-130)
chemin[86]=point.new(-122,-308)
chemin[87]=point.new(-102,-272)
--chemin[87].mechant=1.5
chemin[88]=point.new(-76,-256)
chemin[89]=point.new(136,-306)
chemin[90]=point.new(149,-274)
--chemin[90].mechant=1.5
chemin[91]=point.new(172,-252)
chemin[92]=point.new(610,-126)
chemin[93]=point.new(564,-123)
chemin[94]=point.new(522,-121)
chemin[95]=point.new(486,-104)
--chemin[95].mechant=1.5
chemin[96]=point.new(610,115)
chemin[97]=point.new(564,112)
chemin[98]=point.new(518,120)
chemin[99]=point.new(478,133)
chemin[100]=point.new(129,303)
chemin[101]=point.new(116,261)
chemin[102]=point.new(-133,295)
chemin[103]=point.new(-154,255)
chemin[104]=point.new(-313,-158)
chemin[105]=point.new(-282,-133)
chemin[106]=point.new(-256,-114)
chemin[107]=point.new(284,-151)
chemin[108]=point.new(279,-111)
--chemin[108].mechant=2
chemin[109]=point.new(304,135)
chemin[110]=point.new(271,96)
--chemin[110].mechant=1.5
chemin[111]=point.new(-466,133)
chemin[112]=point.new(-424,136)
chemin[113]=point.new(-383,147)
chemin[114]=point.new(-337,154)
chemin[115]=point.new(-300,131)
--chemin[115].mechant=1.5
chemin[116]=point.new(-233,82)
chemin[117]=point.new(-191,92)
chemin[118]=point.new(-149,99)
chemin[119]=point.new(-108,105)
chemin[120]=point.new(-66,108)
chemin[121]=point.new(-25,108)
chemin[122]=point.new(1,61)
chemin[123]=point.new(6,7)
chemin[124]=point.new(6,7)
chemin[125]=point.new(5,-79)
chemin[126]=point.new(8,-40)
chemin[127]=point.new(6,7)
chemin[128]=point.new(6,7)
-- chemin[122]=point.new(5,-79)
-- chemin[123]=point.new(8,-40)
-- chemin[124]=point.new(1,61)
-- chemin[125]=point.new(6,7)
-- chemin[126]=point.new(6,7)
for i=1, 126 do 
	chemin[i].mechant=1.1
end
chemin[85].mechant=1.3
chemin[10].mechant=1.3

obstacle0nb=0
obstacle0={} --obstacle de 


obstaclenb=156--nombre de point definissant les petits obstacles
obstacle={}
obstacle[1]=point.new(-373,-28)
obstacle[2]=point.new(-367,20)
obstacle[3]=point.new(-352,61)
obstacle[4]=point.new(-347,95)
obstacle[5]=point.new(-599,-75)
obstacle[6]=point.new(-542,-80)
obstacle[7]=point.new(-510,-54)
obstacle[8]=point.new(-541,-25)
obstacle[9]=point.new(-594,-23)
obstacle[10]=point.new(-563,1)
obstacle[11]=point.new(-606,4)
obstacle[12]=point.new(-519,6)
obstacle[13]=point.new(-64,-77)
obstacle[14]=point.new(-111,-71)
obstacle[15]=point.new(-159,-69)
obstacle[16]=point.new(-203,-61)
obstacle[17]=point.new(-188,-20)
obstacle[18]=point.new(-184,17)
obstacle[19]=point.new(-143,-12)
obstacle[20]=point.new(-58,56)
obstacle[21]=point.new(-75,56)
obstacle[22]=point.new(83,53)
obstacle[23]=point.new(142,46)
obstacle[24]=point.new(181,27)
obstacle[25]=point.new(205,14)
obstacle[26]=point.new(374,-35)
obstacle[27]=point.new(378,24)
obstacle[28]=point.new(231,144)
obstacle[29]=point.new(191,159)
obstacle[30]=point.new(65,180)
obstacle[31]=point.new(30,175)
obstacle[32]=point.new(-9,175)
obstacle[33]=point.new(-39,177)
obstacle[34]=point.new(-94,177)
obstacle[35]=point.new(-135,168)
obstacle[36]=point.new(-162,177)
obstacle[37]=point.new(228,-155)
obstacle[38]=point.new(205,-161)
obstacle[39]=point.new(170,-163)
obstacle[40]=point.new(135,-165)
obstacle[41]=point.new(98,-173)
obstacle[42]=point.new(64,-176)
obstacle[43]=point.new(-68,-174)
obstacle[44]=point.new(-111,-174)
obstacle[45]=point.new(-140,-168)
obstacle[46]=point.new(-171,-161)
obstacle[47]=point.new(-215,-156)
obstacle[48]=point.new(-611,-306)
obstacle[49]=point.new(-544,-298)
obstacle[50]=point.new(-459,-298)
obstacle[51]=point.new(-383,-296)
obstacle[52]=point.new(-313,-298)
obstacle[53]=point.new(-251,-295)
obstacle[54]=point.new(-268,-252)
obstacle[55]=point.new(-307,-239)
obstacle[56]=point.new(-351,-235)
obstacle[57]=point.new(-394,-220)
obstacle[58]=point.new(-520,-182)
obstacle[59]=point.new(-410,-197)
obstacle[60]=point.new(-565,-185)
obstacle[61]=point.new(-609,-224)
obstacle[62]=point.new(-484,-260)
obstacle[63]=point.new(-55,-300)
obstacle[64]=point.new(-17,-296)
obstacle[65]=point.new(211,-296)
obstacle[66]=point.new(255,-282)
obstacle[67]=point.new(295,-265)
obstacle[68]=point.new(334,-244)
obstacle[69]=point.new(377,-230)
obstacle[70]=point.new(431,-213)
obstacle[71]=point.new(470,-186)
obstacle[72]=point.new(509,-192)
obstacle[73]=point.new(361,-291)
obstacle[74]=point.new(449,-296)
obstacle[75]=point.new(479,-265)
obstacle[76]=point.new(515,-291)
obstacle[77]=point.new(606,-295)
obstacle[78]=point.new(580,-66)
obstacle[79]=point.new(580,-10)
obstacle[80]=point.new(588,35)
obstacle[81]=point.new(545,52)
obstacle[82]=point.new(530,-56)
obstacle[83]=point.new(514,-10)
obstacle[84]=point.new(606,178)
obstacle[85]=point.new(606,256)
obstacle[86]=point.new(305,297)
obstacle[87]=point.new(279,256)
obstacle[88]=point.new(252,227)
obstacle[89]=point.new(348,238)
obstacle[90]=point.new(395,198)
obstacle[91]=point.new(403,255)
obstacle[92]=point.new(385,297)
obstacle[93]=point.new(462,300)
obstacle[94]=point.new(473,245)
obstacle[95]=point.new(527,274)
obstacle[96]=point.new(-609,180)
obstacle[97]=point.new(-555,193)
obstacle[98]=point.new(-518,193)
obstacle[99]=point.new(-450,209)
obstacle[100]=point.new(-422,212)
obstacle[101]=point.new(-609,292)
obstacle[102]=point.new(-529,290)
obstacle[103]=point.new(-448,297)
obstacle[104]=point.new(-197,303)
obstacle[105]=point.new(-207,258)
obstacle[106]=point.new(-266,255)
obstacle[107]=point.new(-269,229)
obstacle[108]=point.new(-235,287)
obstacle[109]=point.new(-292,294)
obstacle[110]=point.new(-360,303)
obstacle[111]=point.new(-443,303)
obstacle[112]=point.new(58,-12)
obstacle[113]=point.new(-100,-12)
obstacle[114]=point.new(-61,-12)
obstacle[115]=point.new(106,7)
obstacle[116]=point.new(288,43)
obstacle[117]=point.new(310,-12)
obstacle[118]=point.new(296,-80)
obstacle[119]=point.new(-428,69)
obstacle[120]=point.new(-306,9)
obstacle[121]=point.new(-276,-51)
obstacle[122]=point.new(-283,-82)
obstacle[123]=point.new(449,79)
obstacle[124]=point.new(-130,-269)
obstacle[125]=point.new(564,227)
obstacle[126]=point.new(-37,295)
obstacle[127]=point.new(37,291)
obstacle[128]=point.new(-243,-21)
obstacle[129]=point.new(-544,-262)
obstacle[130]=point.new(-544,-262)
obstacle[131]=point.new(-388,-165)
obstacle[132]=point.new(-412,260)
obstacle[133]=point.new(80,280)
obstacle[134]=point.new(577,-239)
obstacle[135]=point.new(320,-147)
obstacle[136]=point.new(271,78)
obstacle[137]=point.new(434,147)
obstacle[138]=point.new(149,251)
obstacle[139]=point.new(-87,268)
obstacle[140]=point.new(-241,22)
obstacle[141]=point.new(8,-80)
obstacle[142]=point.new(-419,-139)
obstacle[143]=point.new(-480,61)
obstacle[144]=point.new(-284,168)
obstacle[145]=point.new(-380,144)
obstacle[146]=point.new(-343,-159)
obstacle[147]=point.new(-322,163)
obstacle[148]=point.new(136,291)
obstacle[149]=point.new(552,124)
obstacle[150]=point.new(426,-120)
obstacle[151]=point.new(318,138)
obstacle[152]=point.new(253,-47)
obstacle[153]=point.new(-246,91)
obstacle[154]=point.new(-252,94)
obstacle[155]=point.new(-428,-10)
obstacle[156]=point.new(-426,-106)
obstacle1nb=0--nombre de point definisant le nombre de point du gros obstacle
obstacle1={}--gros cercle


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
local coordonneedu=#obstacleim+1
obstacleim[coordonneedu]=display.newImage(map15sheeto1,1)
obstacleim[coordonneedu].x=7.5
obstacleim[coordonneedu].y=-623
coordonneedu=coordonneedu+1
obstacleim[coordonneedu]=display.newImage(map15sheeto2,1)
obstacleim[coordonneedu].x=1882.5
obstacleim[coordonneedu].y=-196 
coordonneedu=coordonneedu+1
obstacleim[coordonneedu]=display.newImage(map15sheeto3,1)
obstacleim[coordonneedu].x=-1890.5
obstacleim[coordonneedu].y=-253
coordonneedu=coordonneedu+1
obstacleim[coordonneedu]=display.newImage(map15sheeto4,1)
obstacleim[coordonneedu].x=-1164.5
obstacleim[coordonneedu].y=225
coordonneedu=coordonneedu+1
obstacleim[coordonneedu]=display.newImage(map15sheeto5,1)
obstacleim[coordonneedu].x=-1218.5
obstacleim[coordonneedu].y=-108
coordonneedu=coordonneedu+1
obstacleim[coordonneedu]=display.newImage(map15sheeto6,1)
obstacleim[coordonneedu].x=-1659
obstacleim[coordonneedu].y=596.5
coordonneedu=coordonneedu+1
obstacleim[coordonneedu]=display.newImage(map15sheeto7,1)
obstacleim[coordonneedu].x=1252.5
obstacleim[coordonneedu].y=-86.5
coordonneedu=coordonneedu+1
obstacleim[coordonneedu]=display.newImage(map15sheeto8,1)
obstacleim[coordonneedu].x=15.5
obstacleim[coordonneedu].y=919.5
coordonneedu=coordonneedu+1
obstacleim[coordonneedu]=display.newImage(map15sheeto9,1)
obstacleim[coordonneedu].x=438.5
obstacleim[coordonneedu].y=32
coordonneedu=coordonneedu+1
obstacleim[coordonneedu]=display.newImage(map15sheeto10,1)
obstacleim[coordonneedu].x=-245.5
obstacleim[coordonneedu].y=108
coordonneedu=coordonneedu+1
obstacleim[coordonneedu]=display.newImage(map15sheeto11,1)
obstacleim[coordonneedu].x=-423
obstacleim[coordonneedu].y=-146.5
coordonneedu=coordonneedu+1
obstacleim[coordonneedu]=display.newImage(map15sheeto12,1)
obstacleim[coordonneedu].x=712.5
obstacleim[coordonneedu].y=433.5
coordonneedu=coordonneedu+1
obstacleim[coordonneedu]=display.newImage(map15sheeto13,1)
obstacleim[coordonneedu].x=-173
obstacleim[coordonneedu].y=507
coordonneedu=coordonneedu+1
obstacleim[coordonneedu]=display.newImage(map15sheeto14,1)
obstacleim[coordonneedu].x=1403
obstacleim[coordonneedu].y=691.5
obstacleim[coordonneedu].group=1724
coordonneedu=coordonneedu+1
obstacleim[coordonneedu]=display.newImage(map15sheeto15,1)
obstacleim[coordonneedu].x=-889
obstacleim[coordonneedu].y=814.5
obstacleim[coordonneedu].group=1838

--local coordonneedu=#obstacleim+1

-- #obstacleim=0
-- --exemple
-- obstacleim={}--tuto pour recuperer les données de coordonnée: 1) Dans paint.net afficher la carte entiere en png. 2) dans un autre fichier l'image de l'obstacle 3) copier tout l'image de l'obstacle (ctrl A), coller cette selection dans la carte la placé au bonne endroit. 4) sur la barre tout en bas on a "haut de selection..." il faut prendre le premier nombre puis additionner avec la moitié du premier nombre de taille de delimitation puis enlever 2048, on obtient l'abscisse. Pour le y faire de meme en prennat les deuxiemes valeurs et en enlevaant 1024
-- map1sheetobd
-- 	map1sheetobg1
-- 	map1sheetobg2
-- 	map1sheetomid


--#obstacleanim=0
--obstacleanim={}
-- local sequenceData1 =
-- 	{
-- 	    name="liq",
-- 	    frames= {1,2,3}, -- frame indexes of animation, in image sheet
-- 	    time = 2000,           -- Optional. In ms.  If not supplied, then sprite is frame-based.
-- 	   -- loopCount =         -- Optional. Default is 0.
-- 	} 
-- obstacleanim[1]=display.newSprite(map1obstanim1,sequenceData1)
-- obstacleanim[1]:setSequence( "liq" )
-- obstacleanim[1]:play()
-- obstacleanim[1].xScale=0.2
-- obstacleanim[1].yScale=obstacleanim[1].xScale
-- obstacleanim[1].y=100
-- obstacleanim[1].x=0
-- obstacleanim[1].group=mathfloor(obstacleanim[1].y)+1024

--decoranim=nil



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