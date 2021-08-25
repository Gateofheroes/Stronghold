local t={} --niveau inf
t.new=function()--gestion du niveau 4 du jeu, doit toujours suivre le meme modele
	--map1= display.newImage( "carte/level2/carte1a.png", 0,0,true )--devrai etre en local pour niveau1
	-- map1p = display.newCircle(0,0,10)      --nil--display.newImage( "carte/level2/carte1p.png", 0,0,true )
	-- map1p.isVisible=false
	pouvoirdisp=3
	-- modeinfini=true
	t=1
end
t.affichagecarte=function(pole)
	if donneecharger[6]==0 then
		donneecharger[6]=1
		map6sheethg=graphics.newImageSheet( "carte/level6/hg.jpg", { width=2048, height=1024, numFrames=1,sheetContentWidth=2048,sheetContentHeight=1024 } )
		map6sheethd=graphics.newImageSheet( "carte/level6/hd.jpg", { width=2048, height=1024, numFrames=1,sheetContentWidth=2048,sheetContentHeight=1024 } )
		map6sheetbg=graphics.newImageSheet( "carte/level6/bg.jpg", { width=2048, height=1024, numFrames=1,sheetContentWidth=2048,sheetContentHeight=1024 } )
		map6sheetbd=graphics.newImageSheet( "carte/level6/bd.jpg", { width=2048, height=1024, numFrames=1,sheetContentWidth=2048,sheetContentHeight=1024 } )
		map6sheeto1=graphics.newImageSheet( "carte/level6/e.png",  { width=346, height=358, numFrames=1,sheetContentWidth=346,sheetContentHeight=358 } )
		map6sheeto2=graphics.newImageSheet( "carte/level6/ca.png", { width=206, height=266, numFrames=1,sheetContentWidth=206,sheetContentHeight=266 } )
		map6sheeto3=graphics.newImageSheet( "carte/level6/m.png",  { width=185, height=174, numFrames=1,sheetContentWidth=185,sheetContentHeight=174 } )
		map6sheeto4=graphics.newImageSheet( "carte/level6/hd.png", { width=415, height=476, numFrames=1,sheetContentWidth=415,sheetContentHeight=476 } )
		map6sheeto5=graphics.newImageSheet( "carte/level6/bm.png", { width=1446, height=269, numFrames=1,sheetContentWidth=1446,sheetContentHeight=269 } )
		map6sheeto6=graphics.newImageSheet( "carte/level6/bg.png", { width=961, height=143, numFrames=1,sheetContentWidth=961,sheetContentHeight=143 } )
		if lapinanim==nil then
			lapinanim=graphics.newImageSheet("carte/level5/lapin.png", { width=80, height=55, numFrames=7 } )
			lapinanimseq =
			{
			    name="liq",
			    frames= {1,1,2,2,3,4,5,5,5,6,7,1,1}, -- frame indexes of animation, in image sheet
			    time = 4000,           -- Optional. In ms.  If not supplied, then sprite is frame-based.
			   loopCount=1         -- Optional. Default is 0.
			} 
		end
	end
	hg=display.newImage(map6sheethg,1) --display.newImage( "carte/level2/hg.png", -1024,-512,true )
	hg.x=-1024
	hg.y=-512
	hd=display.newImage(map6sheethd,1) --display.newImage( "carte/level2/hd.png",1024,-512,true )
	hd.x=1024
	hd.y=-512
	bg=display.newImage(map6sheetbg,1) --display.newImage( "carte/level2/bg.png", -1024,512,true )
	bg.x=-1024
	bg.y=512
	bd=display.newImage(map6sheetbd,1) --display.newImage( "carte/level2/bd.png", 1024,512,true )
	bd.x=1024
	bd.y=512
	-- hg=display.newImage( "carte/level3/hg.png", -1024,-512,true )
	-- hd=display.newImage( "carte/level3/hd.png",1024,-512,true )
	-- bg=display.newImage( "carte/level3/bg.png", -1024,512,true )
	-- bd=display.newImage( "carte/level3/bd.png", 1024,512,true )
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
	local tunededep=400
	local nbperso=leveldata[6].life
	if modeinfini or modesquelette then
		tunededep=tunedep
		nbperso=10
	end
	argentdep=-(tunededep)*3--hugo-------------------------------------------------------------------
	ennemipassedep=nbperso--nombre d'ennemi qui peuvent encore passer avant qu'on perdre---hugo------------------------------------------------------------------------------------------------------------------
	
end
t.chemi=function()--donnees sur les differents points de la carte
local point= require( "point" )
genepointinit=nil
cheminarr=nil
----------------------------------------------------------------------------------------hugo debut -----------------------------------------------------------------------
pointdep={}--entré secondaire 
pointdep[1]=47
pointdeppro={}
pointdeppro[2]=0.04 -- probabilité pour le levelinf de l'entré numero i (pointdep[i+1]) , pour une meme probabilité que sur les autres entré mettre 0.5. Min 0, max 1, avec deux chiffres apres la virgule max

intersection={}
intersection.nb=1
intersection[1]={pt=45, ty=0, un=49}
cheminnb=57-- --nombre de point definisant le chemin -1--------------------------------------------------------------------------------------------------
chemin={}
chemin[1]=point.new(-393,-308)
chemin[2]=point.new(-385,-265)
chemin[3]=point.new(-378,-222)
chemin[4]=point.new(-377,-178)
chemin[5]=point.new(-377,-139)
chemin[6]=point.new(-380,-93)
chemin[7]=point.new(-378,-47)
chemin[8]=point.new(-378,-4)
chemin[9]=point.new(-377,37)
chemin[10]=point.new(-377,77)
chemin[11]=point.new(-372,121)
chemin[12]=point.new(-354,159)
chemin[13]=point.new(-315,181)
chemin[14]=point.new(-271,183)
chemin[15]=point.new(-227,178)
chemin[16]=point.new(-195,146)
chemin[17]=point.new(-176,110)
chemin[18]=point.new(-167,64)
chemin[19]=point.new(-161,20)
chemin[20]=point.new(-158,-27)
chemin[21]=point.new(-156,-71)
chemin[22]=point.new(-159,-118)
chemin[23]=point.new(-146,-163)
chemin[24]=point.new(-119,-199)
chemin[25]=point.new(-78,-214)
chemin[26]=point.new(-36,-214)
chemin[27]=point.new(3,-194)
chemin[28]=point.new(26,-160)
chemin[29]=point.new(37,-118)
chemin[30]=point.new(47,-77)
chemin[31]=point.new(55,-33)
chemin[32]=point.new(62,9)
chemin[33]=point.new(62,53)
chemin[34]=point.new(60,95)
chemin[35]=point.new(68,138)
chemin[36]=point.new(89,177)
chemin[37]=point.new(131,194)
chemin[38]=point.new(175,190)
chemin[39]=point.new(216,172)
chemin[40]=point.new(227,128)
chemin[41]=point.new(235,84)
chemin[42]=point.new(237,40)
chemin[43]=point.new(236,-7)
chemin[44]=point.new(237,-52)
chemin[45]=point.new(236,-97)
chemin[46]=point.new(237,-141)
chemin[47]=point.new(151,-239)
chemin[48]=point.new(183,-218)
chemin[49]=point.new(227,-205)
chemin[50]=point.new(270,-197)
chemin[51]=point.new(314,-200)
chemin[52]=point.new(356,-200)
chemin[53]=point.new(397,-200)
chemin[54]=point.new(438,-197)
chemin[55]=point.new(478,-191)
chemin[56]=point.new(520,-182)
chemin[57]=point.new(563,-176)
chemin[58]=point.new(605,-179)


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
obstaclenb=77--nombre de point definissant les petits obstacles
obstacle={}
obstacle[1]=point.new(366,292)
obstacle[2]=point.new(413,225)
obstacle[3]=point.new(429,183)
obstacle[4]=point.new(454,134)
obstacle[5]=point.new(457,90)
obstacle[6]=point.new(444,43)
obstacle[7]=point.new(395,37)
obstacle[8]=point.new(296,294)
obstacle[9]=point.new(226,299)
obstacle[10]=point.new(153,303)
obstacle[11]=point.new(81,303)
obstacle[12]=point.new(28,294)
obstacle[13]=point.new(-45,305)
obstacle[14]=point.new(-107,303)
obstacle[15]=point.new(-169,303)
obstacle[16]=point.new(-235,303)
obstacle[17]=point.new(-302,299)
obstacle[18]=point.new(-362,302)
obstacle[19]=point.new(-613,138)
obstacle[20]=point.new(-613,79)
obstacle[21]=point.new(-611,16)
obstacle[22]=point.new(-614,-41)
obstacle[23]=point.new(-613,-102)
obstacle[24]=point.new(-613,-160)
obstacle[25]=point.new(-611,-217)
obstacle[26]=point.new(-611,-272)
obstacle[27]=point.new(-562,-300)
obstacle[28]=point.new(-508,-301)
obstacle[29]=point.new(-578,-226)
obstacle[30]=point.new(-567,-178)
obstacle[31]=point.new(-569,-127)
obstacle[32]=point.new(-570,-74)
obstacle[33]=point.new(-565,-22)
obstacle[34]=point.new(-562,32)
obstacle[35]=point.new(-564,84)
obstacle[36]=point.new(-561,133)
obstacle[37]=point.new(-557,180)
obstacle[38]=point.new(-549,-239)
obstacle[39]=point.new(-549,-186)
obstacle[40]=point.new(-547,-127)
obstacle[41]=point.new(-547,-80)
obstacle[42]=point.new(-541,-26)
obstacle[43]=point.new(-543,24)
obstacle[44]=point.new(-536,73)
obstacle[45]=point.new(-533,125)
obstacle[46]=point.new(-534,177)
obstacle[47]=point.new(-312,-308)
obstacle[48]=point.new(-263,-308)
obstacle[49]=point.new(-212,-304)
obstacle[50]=point.new(-159,-303)
obstacle[51]=point.new(-107,-303)
obstacle[52]=point.new(-60,-298)
obstacle[53]=point.new(-8,-296)
obstacle[54]=point.new(46,-293)
obstacle[55]=point.new(98,-287)
obstacle[56]=point.new(151,-288)
obstacle[57]=point.new(202,-295)
obstacle[58]=point.new(254,-296)
obstacle[59]=point.new(304,-304)
obstacle[60]=point.new(361,-306)
obstacle[61]=point.new(410,-295)
obstacle[62]=point.new(465,-298)
obstacle[63]=point.new(519,-300)
obstacle[64]=point.new(607,-296)
obstacle[65]=point.new(569,-257)
obstacle[66]=point.new(485,-265)
obstacle[67]=point.new(522,-239)
obstacle[68]=point.new(436,-265)
obstacle[69]=point.new(364,-270)
obstacle[70]=point.new(306,-269)
obstacle[71]=point.new(247,-256)
obstacle[72]=point.new(607,-98)
obstacle[73]=point.new(512,-45)
obstacle[74]=point.new(-458,-303)
obstacle[75]=point.new(-250,-238)
obstacle[76]=point.new(-199,-238)
obstacle[77]=point.new(-308,-247)

obstacle1nb=5--nombre de point definisant le nombre de point du gros obstacle
obstacle1={}--gros cercle
obstacle1[1]=point.new(610,302)
obstacle1[2]=point.new(509,302)
obstacle1[3]=point.new(603,170)
obstacle1[4]=point.new(592,46)
obstacle1[5]=point.new(-611,299)

--mine:
mineinfo={}
mineinfo.nb=0
-- local i=0
-- while i<=mineinfo.nb do
-- 	mineinfo[i]={}
-- end
-- mineinfo[1]=point.new(218,142)
-- mineinfo[1].nbmine=1

obstaclsold={}
obstaclsold.nb=0 --nombre d'obstacle ou les soldats ne peuvent pas aller.

feupassesoldat={} -- premiere dimension dit le point ou peut y avoir des flammes
feupassesoldat[1]={}
feupassesoldat[1].etat=0 -- etat de flamme
feupassesoldat[1].x=422
feupassesoldat[1].y=20
feupassesoldat[1].xScale=0.30
feupassesoldat[1].yScale=0.38
feupassesoldat[1].group=1024+250
feupassesoldat[1].rotate=17 -- faculatif
feupassesoldat[1].seq="fl1"
feupassesoldat[2]={}
feupassesoldat[2].etat=0 -- etat de flamme
feupassesoldat[2].x=467
feupassesoldat[2].y=-15
feupassesoldat[2].seq="braszero" -- nom de l'anim de la flamme facultatif
feupassesoldat[2].group=200+1024 -- numero du groupe facultatif
feupassesoldat[2].xScale=0.45
feupassesoldat[2].yScale=0.4
feupassesoldat[3]={}
feupassesoldat[3].etat=0 -- etat de flamme
feupassesoldat[3].x=545
feupassesoldat[3].y=100
feupassesoldat[3].xScale=0.30
feupassesoldat[3].yScale=0.4
feupassesoldat[3].group=1024+250
feupassesoldat[3].rotate=15 -- faculatif

end
t.obsim=function()
if obstacleim==nil then
	obstacleim={}
end
-- #obstacleim=6--1
-- --exemple
-- obstacleim={}
-- obstacleim[1]=display.newImage( "carte/level2/bdp.png", 550,140,true )
-- obstacleim[1].xScale=0.2
-- obstacleim[1].yScale=0.2
local coordonneedu=#obstacleim+1
obstacleim[coordonneedu]=display.newImage(map6sheeto1,1 )
obstacleim[coordonneedu].x=1446
obstacleim[coordonneedu].y=12
--obstacleim[coordonneedu].group=2048
obstacleim[coordonneedu+1]=display.newImage(map6sheeto2,1)
obstacleim[coordonneedu+1].x=1346
obstacleim[coordonneedu+1].y=566
obstacleim[coordonneedu+2]=display.newImage(map6sheeto3,1)
obstacleim[coordonneedu+2].x=1446.5
obstacleim[coordonneedu+2].y=278
obstacleim[coordonneedu+3]=display.newImage(map6sheeto4,1)
obstacleim[coordonneedu+3].x=1840.5
obstacleim[coordonneedu+3].y=-211
--obstacleim[coordonneedu+3].group=2048
obstacleim[coordonneedu+4]=display.newImage(map6sheeto5,1)
obstacleim[coordonneedu+4].x=498
obstacleim[coordonneedu+4].y=889.5
obstacleim[coordonneedu+5]=display.newImage(map6sheeto6,1)
obstacleim[coordonneedu+5].x=-709.5
obstacleim[coordonneedu+5].y=952.5



--#obstacleanim=0
if decoranim==nil then
	decoranim={}
end
coordonneedu=#decoranim+1
decoranim[coordonneedu]=display.newSprite(lapinanim,lapinanimseq)
decoranim[coordonneedu]:setSequence( "liq" )
decoranim[coordonneedu]:play()
decoranim[coordonneedu].x=0
decoranim[coordonneedu].y=0
decoranim[coordonneedu].xScale=0.3
decoranim[coordonneedu].yScale=decoranim[coordonneedu].xScale
decoranim[coordonneedu].posi=1 --0 pour coordonnée donnée donc decoranim[1].x1=XX et decoranim[1].x2=XX ,1 pour random sur les zones contructible, 2 pour sur le chemin
decoranim[coordonneedu].cadence=4000 --tout les combien de temps se produit l'anim

--decoranim=nil


decoration={}
decoration[1]={}
decoration[1].x=369
decoration[1].y=-101
decoration[1].type=23
decoration[1].planche=1
decoration[1].scale=0.2
decoration[2]={}
decoration[2].x=-51
decoration[2].y=160
decoration[2].type=21
decoration[2].planche=1
decoration[2].scale=0.2
decoration[3]={}
decoration[3].x=-286
decoration[3].y=-96
decoration[3].type=27
decoration[3].planche=1
decoration[3].scale=0.2



------------------------------------------------------------fin hugo---------------------------------------------------------------
end
t.vague=function()--donnees sur les vagues du niveau
vague={}
--nbvague=3--15
for k=1,leveldata[6].wave,1 do
	vague[k]={}
	vague[k][1]=200
end
vague[1]={5,203,203,203,203,203,207,208,0,0,0,0,9,207,207,207,207,207,207,207,207,207,1,1,9,207,207,207,207,207,207,207,207,207,0,0,0,0,0,0,0,0,0,0,0,0,203}
vague[2]={216,216,1,203,203,0,0,203,203,0,0,0,0,0,0,0,3,203,203,203,3,216,216,203,1,3,207,208,207,0,0,0,0,0,0,0,0,0,0,207,208,208,216,216,216,1,203,203,203,0,0,0,0,0,0,0,0,0,203}
vague[3]={5,203,203,203,203,203,0,5,216,216,1,216,216,1,216,0,5,207,208,207,208,207,208,0,0,0,0,0,0,0,0,0,0,0,9,203,203,203,203,203,203,203,203,203,0,0,0,0,0,0,9,207,208,207,207,208,207,208,207,208,0,0,0,0,0,0,0,0,0,0,0,216,203,216,203,216,203,216,203,216,203,216,203,216,203,216,203,216,203,0,0,0,0,0,0,0,0,0,203}
vague[4]={3,203,203,203,3,203,203,203,3,203,203,203,3,203,203,203,3,203,203,203,3,203,203,203,3,203,203,203,3,203,203,203,0,0,0,0,0,0,0,216,207,203,216,207,203,216,207,203,216,207,203,216,207,203,216,207,203,216,207,203,216,207,203,216,207,203,216,207,203,216,207,203,0,0,0,0,0,-1,203}
vague[5]={203,0,0,0,0,3,216,207,203,3,216,207,203,3,216,207,203,3,216,207,203,3,216,207,203,3,203,207,203,3,207,207,203,3,216,207,203,3,216,207,203,216,207,203,216,207,203,0,0,0,217,-1,203}
-------------------------------------------------------------debut hugo-----------------------------------------------------
--0 retarde de la durer de spawn de 3 soldat et 1 de la durer de 1 soldat
--de 2 à 5 permet de spawner plusieurs soldat a la fois.
--vague[1].nb=2--nb soldat dans la vague

modeinfdif=0-- 0 pour facile, 1 pour normal, 2 pour difficile

end
t.vaguewave=function()
	vague={}
	vague[1]={204,204,204,204,204,204,204,204,204,204,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,225}
end
return t