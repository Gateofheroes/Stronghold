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
	if donneecharger[14]==0 then
		donneecharger[14]=1
		map14sheethg=graphics.newImageSheet( "carte/level14/hg.jpg", { width=2048, height=1024, numFrames=1,sheetContentWidth=2048,sheetContentHeight=1024 } )
		map14sheethd=graphics.newImageSheet( "carte/level14/hd.jpg", { width=2048, height=1024, numFrames=1,sheetContentWidth=2048,sheetContentHeight=1024 } )
		map14sheetbg=graphics.newImageSheet( "carte/level14/bg.jpg", { width=2048, height=1024, numFrames=1,sheetContentWidth=2048,sheetContentHeight=1024 } )
		map14sheetbd=graphics.newImageSheet( "carte/level14/bd.jpg", { width=2048, height=1024, numFrames=1,sheetContentWidth=2048,sheetContentHeight=1024 } )
		map14sheeto1=graphics.newImageSheet( "carte/level14/ah.png", { width=424, height=367, numFrames=1,sheetContentWidth=424,sheetContentHeight=367 } )
		map14sheeto2=graphics.newImageSheet( "carte/level14/ag.png", { width=179, height=1113, numFrames=1,sheetContentWidth=179,sheetContentHeight=1113 } )
		map14sheeto3=graphics.newImageSheet( "carte/level14/am1.png", { width=1816, height=228, numFrames=1,sheetContentWidth=1816,sheetContentHeight=228 } )
		map14sheeto4=graphics.newImageSheet( "carte/level14/ad.png", { width=214, height=1186, numFrames=1,sheetContentWidth=214,sheetContentHeight=1186 } )
		map14sheeto5=graphics.newImageSheet( "carte/level14/am2.png", { width=1595, height=419, numFrames=1,sheetContentWidth=1595,sheetContentHeight=419 } )
		map14sheeto6=graphics.newImageSheet( "carte/level14/m1.png", { width=288, height=557, numFrames=1,sheetContentWidth=288,sheetContentHeight=557 } )
		map14sheeto7=graphics.newImageSheet( "carte/level14/m2.png", { width=159, height=156, numFrames=1,sheetContentWidth=159,sheetContentHeight=156 } )
		map14sheeto8=graphics.newImageSheet( "carte/level14/m3.png", { width=285, height=194, numFrames=1,sheetContentWidth=285,sheetContentHeight=194 } )
		map14sheeto9=graphics.newImageSheet( "carte/level14/m4.png", { width=243, height=178, numFrames=1,sheetContentWidth=243,sheetContentHeight=178 } )
		map14sheeto10=graphics.newImageSheet( "carte/level14/m5.png", { width=59, height=21, numFrames=1,sheetContentWidth=59,sheetContentHeight=21 } )
		map14sheeto11=graphics.newImageSheet( "carte/level14/m6.png", { width=351, height=383, numFrames=1,sheetContentWidth=351,sheetContentHeight=383 } )
		map14sheeto12=graphics.newImageSheet( "carte/level14/m7.png", { width=278, height=183, numFrames=1,sheetContentWidth=278,sheetContentHeight=183 } )
	
	end
		
	hg=display.newImage(map14sheethg,1) --display.newImage( "carte/level2/hg.png", -1024,-512,true )
	hg.x=-1024
	hg.y=-512
	hd=display.newImage(map14sheethd,1) --display.newImage( "carte/level2/hd.png",1024,-512,true )
	hd.x=1024
	hd.y=-512
	bg=display.newImage(map14sheetbg,1) --display.newImage( "carte/level2/bg.png", -1024,512,true )
	bg.x=-1024
	bg.y=512
	bd=display.newImage(map14sheetbd,1) --display.newImage( "carte/level2/bd.png", 1024,512,true )
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
	local tunededep=6000
	local nbperso=leveldata[14].life
	if modeinfini or modesquelette then
		tunededep=tunedep
		nbperso=10
	end
	argentdep=-(tunededep)*3--hugo modifier uniquement le nombre le reste permet de crypter la donné-------------------------------------------------------------------
	ennemipassedep=nbperso--nombre d'ennemi qui peuvent encore passer avant qu'on perdre---hugo------------------------------------------------------------------------------------------------------------------
end

t.chemi=function()--donnees sur les differents points de la carte
local point= require( "point" )
genepointinit=43

pointdep={}
pointdep[1]=7
pointdep[2]=35

intersection={}
intersection.nb=3
intersection[1]={pt=1, ty=1, un=3, deux=5, proba=2}
intersection[2]={pt=5, ty=0, un=22}
intersection[3]={pt=3, ty=0, un=47}
intersection[4]={pt=6, ty=0, un=22}
intersection[5]={pt=4, ty=0, un=4}
--exemple
--intersection[1]={pt=11, ty=1, un=1, deux=13}
--intersection[2]={pt=25, ty=0, un=27}
--intersection[1]={pt=18, ty=2, un=29, deux=20,proba=2}
--intersection[2]={pt=20, ty=2, un=30, deux=22,proba=2}
--chemin[10].rayon=1000 --taille de la zone ou peut se trouver les gentils
--chemin[10].mechant=0.2 --recerement du chemin ils vont plus etre aussi ecarté
--intersection[2]={pt=46, ty=0, un=21}
cheminarr={}
cheminarr[1]=34
cheminarr[2]=60
cheminarr[3]=33
-- cheminarr={} --si des chemins sont des arrivés
-- cheminarr[1]=25 --fin numero 2 du chemin
-- cheminarr[2]=12 --fin numero 3 du chemin

cheminnb=59-- --nombre de point definisant le chemin -1--------------------------------------------------------------------------------------------------
chemin={}
--chemin[10].rayon=1000 --taille de la zone ou peut se trouver les gentils
--chemin[10].mechant=0.2 --recerement du chemin ils vont plus etre aussi ecarté
cheminlargeur=1.5
chemin[1]=point.new(22,303)
chemin[2]=point.new(21,235)
chemin[2].mechant=2
chemin[3]=point.new(71,212)
chemin[4]=point.new(120,178)
chemin[4].mechant=1.5
chemin[5]=point.new(-28,216)
chemin[6]=point.new(-80,185)
chemin[7]=point.new(-613,-38)
chemin[8]=point.new(-569,-33)
chemin[9]=point.new(-528,-20)
chemin[10]=point.new(-500,12)
chemin[11]=point.new(-484,55)
chemin[12]=point.new(-484,99)
chemin[13]=point.new(-478,143)
chemin[14]=point.new(-468,183)
chemin[15]=point.new(-429,196)
chemin[16]=point.new(-385,203)
chemin[17]=point.new(-341,208)
chemin[18]=point.new(-299,204)
chemin[19]=point.new(-260,203)
chemin[20]=point.new(-216,186)
chemin[21]=point.new(-173,170)
chemin[22]=point.new(-130,156)
chemin[22].mechant=2
chemin[23]=point.new(-108,117)
chemin[24]=point.new(-81,82)
chemin[25]=point.new(-66,30)
chemin[26]=point.new(-61,-17)
chemin[27]=point.new(-71,-64)
chemin[28]=point.new(-102,-98)
chemin[29]=point.new(-144,-121)
chemin[30]=point.new(-186,-124)
chemin[31]=point.new(-227,-110)
chemin[32]=point.new(-266,-87)
chemin[33]=point.new(-300,-57)
chemin[34]=point.new(-304,-35)
chemin[35]=point.new(238,-308)
chemin[36]=point.new(205,-280)
chemin[37]=point.new(171,-249)
chemin[38]=point.new(144,-212)
chemin[39]=point.new(140,-166)
chemin[40]=point.new(144,-124)
chemin[41]=point.new(138,-82)
chemin[42]=point.new(133,-39)
chemin[43]=point.new(126,1)
chemin[44]=point.new(126,44)
chemin[45]=point.new(126,88)
chemin[46]=point.new(136,131)
chemin[46].mechant=2
chemin[47]=point.new(169,157)
chemin[47].mechant=2
chemin[48]=point.new(211,169)
chemin[49]=point.new(253,179)
chemin[50]=point.new(296,182)
chemin[51]=point.new(341,174)
chemin[52]=point.new(382,162)
chemin[53]=point.new(421,136)
chemin[54]=point.new(448,96)
chemin[55]=point.new(470,58)
chemin[56]=point.new(486,16)
chemin[57]=point.new(486,-33)
chemin[58]=point.new(460,-72)
chemin[59]=point.new(413,-77)
chemin[60]=point.new(344,-80)

obstacle0nb=0
obstacle0={} --obstacle de 
--obstacle0[1]=point.new(-609,-198) 
--obstacle0[1].rayon=1000

obstaclenb=76 --153--nombre de point definissant les petits obstacles
obstacle={}
obstacle[1]=point.new(268,21)
obstacle[2]=point.new(219,15)
obstacle[3]=point.new(382,11)
obstacle[4]=point.new(339,-13)
obstacle[5]=point.new(269,-56)
obstacle[6]=point.new(225,-65)
obstacle[7]=point.new(220,-53)
obstacle[8]=point.new(337,-157)
obstacle[9]=point.new(301,-215)
obstacle[10]=point.new(265,-233)
obstacle[11]=point.new(293,-278)
obstacle[12]=point.new(608,-96)
obstacle[13]=point.new(608,-41)
obstacle[14]=point.new(608,13)
obstacle[15]=point.new(607,65)
obstacle[16]=point.new(607,120)
obstacle[17]=point.new(586,168)
obstacle[18]=point.new(603,300)
obstacle[19]=point.new(603,240)
obstacle[20]=point.new(532,279)
obstacle[21]=point.new(-606,-148)
obstacle[22]=point.new(-543,-132)
obstacle[23]=point.new(-468,-126)
obstacle[24]=point.new(-508,-129)
obstacle[25]=point.new(-574,-122)
obstacle[26]=point.new(-386,-152)
obstacle[27]=point.new(-435,-106)
obstacle[28]=point.new(-336,-202)
obstacle[29]=point.new(-273,-238)
obstacle[30]=point.new(-313,-226)
obstacle[31]=point.new(-197,-241)
obstacle[32]=point.new(-141,-213)
obstacle[33]=point.new(-86,-197)
obstacle[34]=point.new(-24,-199)
obstacle[35]=point.new(16,-189)
obstacle[36]=point.new(54,-197)
obstacle[37]=point.new(89,-246)
obstacle[38]=point.new(123,-300)
obstacle[39]=point.new(-139,-274)
obstacle[40]=point.new(-59,-270)
obstacle[41]=point.new(13,-272)
obstacle[42]=point.new(63,-303)
obstacle[43]=point.new(-625,70)
obstacle[44]=point.new(-625,84)
obstacle[45]=point.new(-625,146)
obstacle[46]=point.new(-590,216)
obstacle[47]=point.new(-611,292)
obstacle[48]=point.new(-540,315)
obstacle[49]=point.new(-476,315)
obstacle[50]=point.new(-421,315)
obstacle[51]=point.new(-221,335)
obstacle[52]=point.new(-144,330)
obstacle[53]=point.new(-64,297)
obstacle[54]=point.new(400,-191)
obstacle[55]=point.new(457,-186)
obstacle[56]=point.new(530,-181)
obstacle[57]=point.new(577,-155)
obstacle[58]=point.new(-227,-300)
obstacle[59]=point.new(-372,11)
obstacle[60]=point.new(-377,59)
obstacle[61]=point.new(-351,80) -- -351,101)
obstacle[62]=point.new(-263,81)
obstacle[63]=point.new(-200,76) -- -186,76)
obstacle[64]=point.new(-210,0) -- -196,-11)
obstacle[65]=point.new(-328,3)
obstacle[66]=point.new(-260,10)
obstacle[67]=point.new(-310,70) -- -310,91)
obstacle[68]=point.new(-222,78)
obstacle[69]=point.new(-380,24)
obstacle[70]=point.new(-291,-208)
obstacle[71]=point.new(-336,-181)
obstacle[72]=point.new(-391,-143)
obstacle[73]=point.new(-232,-228)
obstacle[74]=point.new(325,20)
obstacle[75]=point.new(314,-105)
obstacle[76]=point.new(-255,-62)
-- obstacle[77]=point.new(-299,-93)
-- obstacle[78]=point.new(-253,-122)
-- obstacle[79]=point.new(-216,-91)
-- obstacle[80]=point.new(-170,-108)
-- obstacle[81]=point.new(-131,-119)
-- obstacle[82]=point.new(-131,-80)
-- obstacle[83]=point.new(-86,-78)
-- obstacle[84]=point.new(-84,-41)
-- obstacle[85]=point.new(-45,-39)
-- obstacle[86]=point.new(-77,5)
-- obstacle[87]=point.new(-38,26)
-- obstacle[88]=point.new(-82,57)
-- obstacle[89]=point.new(-55,73)
-- obstacle[90]=point.new(-108,90)
-- obstacle[91]=point.new(-77,110)
-- obstacle[92]=point.new(-143,125)
-- obstacle[93]=point.new(-112,154)
-- obstacle[94]=point.new(-190,151)
-- obstacle[95]=point.new(-186,190)
-- obstacle[96]=point.new(-256,175)
-- obstacle[97]=point.new(-247,204)
-- obstacle[98]=point.new(-315,190)
-- obstacle[99]=point.new(-326,229)
-- obstacle[100]=point.new(-377,191)
-- obstacle[101]=point.new(-401,214)
-- obstacle[102]=point.new(-468,199)
-- obstacle[103]=point.new(-452,162)
-- obstacle[104]=point.new(-502,133)
-- obstacle[105]=point.new(-468,105)
-- obstacle[106]=point.new(-508,63)
-- obstacle[107]=point.new(-476,55)
-- obstacle[108]=point.new(-515,7)
-- obstacle[109]=point.new(-500,-35)
-- obstacle[110]=point.new(-476,11)
-- obstacle[111]=point.new(114,84)
-- obstacle[112]=point.new(150,77)
-- obstacle[113]=point.new(107,17)
-- obstacle[114]=point.new(143,11)
-- obstacle[115]=point.new(124,-51)
-- obstacle[116]=point.new(150,-61)
-- obstacle[117]=point.new(114,-119)
-- obstacle[118]=point.new(159,-128)
-- obstacle[119]=point.new(127,-186)
-- obstacle[120]=point.new(161,-192)
-- obstacle[121]=point.new(155,-249)
-- obstacle[122]=point.new(195,-249)
-- obstacle[123]=point.new(181,133)
-- obstacle[124]=point.new(236,149)
-- obstacle[125]=point.new(301,152)
-- obstacle[126]=point.new(358,146)
-- obstacle[127]=point.new(405,121)
-- obstacle[128]=point.new(439,74)
-- obstacle[129]=point.new(470,27)
-- obstacle[130]=point.new(467,-36)
-- obstacle[131]=point.new(416,-67)
-- obstacle[132]=point.new(433,-111)
-- obstacle[133]=point.new(480,-92)
-- obstacle[134]=point.new(512,-43)
-- obstacle[135]=point.new(507,9)
-- obstacle[136]=point.new(496,59)
-- obstacle[137]=point.new(464,103)
-- obstacle[138]=point.new(439,147)
-- obstacle[139]=point.new(392,180)
-- obstacle[140]=point.new(337,190)
-- obstacle[141]=point.new(278,203)
-- obstacle[142]=point.new(224,198)
-- obstacle[143]=point.new(168,188)
-- obstacle[144]=point.new(112,194)
-- obstacle[145]=point.new(68,232)
-- obstacle[146]=point.new(55,277)
-- obstacle[147]=point.new(-13,297)
-- obstacle[148]=point.new(-29,251)
-- obstacle[149]=point.new(-85,229)
-- obstacle[150]=point.new(-73,152)
-- obstacle[151]=point.new(-31,173)
-- obstacle[152]=point.new(18,183)
-- obstacle[153]=point.new(75,162)

obstacle1nb=4--nombre de point definisant le nombre de point du gros obstacle
obstacle1={}--gros cercle
obstacle1[1]=point.new(-538,-280)
obstacle1[2]=point.new(-396,-280)
obstacle1[3]=point.new(603,-285)
obstacle1[4]=point.new(412,-295)
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

-- #obstacleim=12
-- --exemple
-- obstacleim={}--tuto pour recuperer les données de coordonnée: 1) Dans paint.net afficher la carte entiere en png. 2) dans un autre fichier l'image de l'obstacle 3) copier tout l'image de l'obstacle (ctrl A), coller cette selection dans la carte la placé au bonne endroit. 4) sur la barre tout en bas on a "haut de selection..." il faut prendre le premier nombre puis additionner avec la moitié du premier nombre de taille de delimitation puis enlever 2048, on obtient l'abscisse. Pour le y faire de meme en prennat les deuxiemes valeurs et en enlevaant 1024
-- map1sheetobd
-- 	map1sheetobg1
-- 	map1sheetobg2
-- 	map1sheetomid
obstacleim[coordonneedu]=display.newImage(map14sheeto1,1)
obstacleim[coordonneedu].x=915
obstacleim[coordonneedu].y=-840.5
obstacleim[coordonneedu+1]=display.newImage(map14sheeto2,1)
obstacleim[coordonneedu+1].x=-1958.5
obstacleim[coordonneedu+1].y=467.5
obstacleim[coordonneedu+2]=display.newImage(map14sheeto3,1)
obstacleim[coordonneedu+2].x=-961
obstacleim[coordonneedu+2].y=910
obstacleim[coordonneedu+2].group=2024
obstacleim[coordonneedu+3]=display.newImage(map14sheeto4,1)
obstacleim[coordonneedu+3].x=1941
obstacleim[coordonneedu+3].y=431

obstacleim[coordonneedu+4]=display.newImage(map14sheeto5,1)
obstacleim[coordonneedu+4].x=1036.5
obstacleim[coordonneedu+4].y=814.5
obstacleim[coordonneedu+4].group=2024
obstacleim[coordonneedu+5]=display.newImage(map14sheeto6,1)
obstacleim[coordonneedu+5].x=-1242
obstacleim[coordonneedu+5].y=30.5

obstacleim[coordonneedu+6]=display.newImage(map14sheeto7,1)
obstacleim[coordonneedu+6].x=-1007.5
obstacleim[coordonneedu+6].y=-194
obstacleim[coordonneedu+7]=display.newImage(map14sheeto8,1)
obstacleim[coordonneedu+7].x=-680
obstacleim[coordonneedu+7].y=-45
obstacleim[coordonneedu+8]=display.newImage(map14sheeto9,1)
obstacleim[coordonneedu+8].x=-728.5
obstacleim[coordonneedu+8].y=271
obstacleim[coordonneedu+9]=display.newImage(map14sheeto10,1)
obstacleim[coordonneedu+9].x=756.5
obstacleim[coordonneedu+9].y=2.5
obstacleim[coordonneedu+10]=display.newImage(map14sheeto11,1)
obstacleim[coordonneedu+10].x=805.5
obstacleim[coordonneedu+10].y=-280.5
obstacleim[coordonneedu+11]=display.newImage(map14sheeto12,1)
obstacleim[coordonneedu+11].x=1297
obstacleim[coordonneedu+11].y=13.5


-- --obstacleim[1].group=2024 --group ou se trouve l image par defaut se trouvera 2048+ y
-- obstacleim[2]=display.newImage(map1sheetobg1,1)
-- obstacleim[2].x=-1548
-- obstacleim[2].y=418.5
-- obstacleim[3]=display.newImage(map1sheetobg2,1)
-- obstacleim[3].x=-490
-- obstacleim[3].y=691.5
-- obstacleim[4]=display.newImage(map1sheetomid,1)
-- obstacleim[4].x=409.5
-- obstacleim[4].y=457
--obstacleim[1]=display.newImage("AnimVF/mechant/veteran/Veteranmvmg.png",0,-300,true)
--obstacleim[1].xScale=0.2
--obstacleim[1].yScale=obstacleim[1].xScale

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


decoration={}
decoration[1]={}
decoration[1].x=27
decoration[1].y=128
decoration[1].type=12
decoration[1].planche=1
decoration[1].scale=0.25
decoration[2]={}
decoration[2].x=45
decoration[2].y=-113
decoration[2].type=3
decoration[2].planche=1
decoration[2].scale=0.2
decoration[3]={}
decoration[3].x=323
decoration[3].y=100
decoration[3].type=7
decoration[3].planche=1
decoration[3].scale=0.15



end
t.vague=function()--donnees sur les vagues du niveau
vague={}
local k=nil
--nbvague=5--15
for k=1,leveldata[17].wave,1 do
	vague[k]={}
	vague[k][1]=200
end
vague[1]={-1,5,238,238,238,238,238,5,238,238,238,238,238,0,0,-2,5,238,238,238,238,238,0,0,0,-1,9,270,270,270,270,270,270,270,270,270,9,270,270,270,270,270,270,270,270,270,0,0,-2,9,270,270,270,270,270,270,270,270,270,0,0,0,0,-1,2,221,221,2,221,221,-2,2,221,221,0,0,0,0,0,-1,9,237,237,237,237,237,237,237,237,237,9,237,237,237,237,237,237,237,237,237,0,0,-2,9,237,237,237,237,237,237,237,237,237,0,0,0,5,261,261,261,261,261,5,261,261,261,261,261,-2,5,261,261,261,261,261,0,0,0,0,-1,9,270,270,270,270,270,270,270,270,270,9,270,270,270,270,270,270,270,270,270,0,0,0,-2,9,270,270,270,270,270,270,270,270,270,0,0,0}
vague[2]={-1,9,270,270,270,270,270,270,270,270,270,9,270,270,270,270,270,270,270,270,270,0,0,-2,9,270,270,270,270,270,270,270,270,270,0,0,0,-1,2,221,221,2,221,221,-2,221,221,0,0,0,0,0,-1,9,238,238,238,238,238,238,238,238,238,9,238,238,238,238,238,238,238,238,238,0,0,-2,9,238,238,238,238,238,238,238,238,238,0,0,0,-1,9,237,237,237,237,237,237,237,237,237,9,237,237,237,237,237,237,237,237,237,0,0,-2,9,237,237,237,237,237,237,237,237,237,0,0,0,-1,5,261,261,261,261,261,5,261,261,261,261,261,-2,5,261,261,261,261,261,0,0,0}
vague[3]={-1,5,261,261,261,261,261,5,261,261,261,261,261,-2,5,261,261,261,261,261,0,0,0,0,-1,9,237,237,237,237,237,237,237,237,237,9,237,237,237,237,237,237,237,237,237,0,0,-2,9,237,237,237,237,237,237,237,237,237,-1,2,262,262,2,262,262,-2,2,262,262,0,0,0,-1,9,237,237,237,237,237,237,237,237,237,9,237,237,237,237,237,237,237,237,237,0,0,-2,9,237,237,237,237,237,237,237,237,237,0,0,0,0,-1,9,270,270,270,270,270,270,270,270,270,9,270,270,270,270,270,270,270,270,270,0,0,-2,9,270,270,270,270,270,270,270,270,270,-1,2,221,221,2,221,221,-2,2,221,221}
vague[4]={-1,3,221,221,221,3,221,221,221,-2,221,221,0,0,0,0,-1,6,260,260,260,260,260,260,6,260,260,260,260,260,260,0,0,-2,6,260,260,260,260,260,260,0,0,0,0,-1,9,238,238,238,238,238,238,238,238,238,9,238,238,238,238,238,238,238,238,238,0,0,-2,9,238,238,238,238,238,238,238,238,238,0,0,0,0,-1,5,261,261,261,261,261,5,261,261,261,261,261,0,0,-2,5,261,261,261,261,261,0,0,0,0,-1,9,237,237,237,237,237,237,237,237,237,9,237,237,237,237,237,237,237,237,237,0,0,-2,9,237,237,237,237,237,237,237,237,237,0,0,0,0,-1,2,262,262,2,262,262,-2,2,262,262,-1,2,262,262,2,262,262,-2,2,262,262,0,0,0,0,0,0,0,0,0,0,0,5,224,224,224,224,224,-1,5,224,224,224,224,224,-2,5,224,224,224,224,224}

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
	vague[1]={-11,9,224,224,224,224,224,224,224,224,224,-1,9,224,224,224,224,224,224,224,224,224,-2,9,224,224,224,224,224,224,224,224,224,0,0,0,0,0,0,0,0,0,0,0,0,-11,9,223,223,223,223,223,223,223,223,223,-1,9,223,223,223,223,223,223,223,223,223,-2,1,223,223,223,-11,9,272,272,272,272,272,272,272,272,272,-1,9,272,272,272,272,272,272,272,272,272,-2,9,272,272,272,272,272,272,272,272,272,0,0,0,0,0,0,0,0,0,6,221,221,221,221,221,221,-1,6,221,221,221,221,221,221,-2,6,221,221,221,221,221,221,-11,2,284,284,-1,2,284,284,-2,2,284,284}
end
return t