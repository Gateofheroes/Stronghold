

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
	if donneecharger[10]==0 then
		donneecharger[10]=1
		map10sheethg=graphics.newImageSheet( "carte/level10/hg.jpg", { width=2048, height=1024, numFrames=1,sheetContentWidth=2048,sheetContentHeight=1024 } )
		map10sheethd=graphics.newImageSheet( "carte/level10/hd.jpg", { width=2048, height=1024, numFrames=1,sheetContentWidth=2048,sheetContentHeight=1024 } )
		map10sheetbg=graphics.newImageSheet( "carte/level10/bg.jpg", { width=2048, height=1024, numFrames=1,sheetContentWidth=2048,sheetContentHeight=1024 } )
		map10sheetbd=graphics.newImageSheet( "carte/level10/bd.jpg", { width=2048, height=1024, numFrames=1,sheetContentWidth=2048,sheetContentHeight=1024 } )
		map10sheeto1=graphics.newImageSheet( "carte/level10/1.png", { width=795, height=228, numFrames=1,sheetContentWidth=795,sheetContentHeight=228 } )
		map10sheeto2=graphics.newImageSheet( "carte/level10/2.png", { width=493, height=1251, numFrames=1,sheetContentWidth=493,sheetContentHeight=1251 } )
		map10sheeto3=graphics.newImageSheet( "carte/level10/3.png", { width=632, height=192, numFrames=1,sheetContentWidth=632,sheetContentHeight=192 } )
		map10sheeto4=graphics.newImageSheet( "carte/level10/4.png", { width=87, height=156, numFrames=1,sheetContentWidth=87,sheetContentHeight=156 } )
		map10sheeto5=graphics.newImageSheet( "carte/level10/5.png", { width=159, height=247, numFrames=1,sheetContentWidth=159,sheetContentHeight=247 } )
		map10sheeto6=graphics.newImageSheet( "carte/level10/6.png", { width=206, height=247, numFrames=1,sheetContentWidth=206,sheetContentHeight=247 } )
		map10sheeto7=graphics.newImageSheet( "carte/level10/7.png", { width=189, height=254, numFrames=1,sheetContentWidth=189,sheetContentHeight=254 } )
		map10sheeto8=graphics.newImageSheet( "carte/level10/8.png", { width=343, height=362, numFrames=1,sheetContentWidth=343,sheetContentHeight=362 } )
		map10sheeto9=graphics.newImageSheet( "carte/level10/9.png", { width=2002, height=319, numFrames=1,sheetContentWidth=2002,sheetContentHeight=319 } )
		if desert==nil then
			serpent=graphics.newImageSheet( "carte/level9/snake.png", { width=52, height=64, numFrames=16 } )
			serpentseq =
			{
			    name="liq",
			    frames= {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}, -- frame indexes of animation, in image sheet
			    time = 3000,           -- Optional. In ms.  If not supplied, then sprite is frame-based.
			   loopCount=1         -- Optional. Default is 0.
			} 
			scorpion=graphics.newImageSheet( "carte/level9/scorpion.png", { width=33, height=23, numFrames=4 } )
			scorpionseq =
			{
				name="liq",
				frames= {1,2,3,4,1,2,3,4,1,2,3,4}, -- frame indexes of animation, in image sheet
				time = 3000,           -- Optional. In ms.  If not supplied, then sprite is frame-based.
				loopCount=1
			} 
			scorpionseq1 =
			{
				time = 3000,           -- Optional. In ms.  If not supplied, then sprite is frame-based.
				x1=-150,
				y1=30         -- Optional. Default is 0.
			}
			lampe=graphics.newImageSheet( "carte/level9/lampmagic.png", { width=35, height=30, numFrames=16 } )
			lampeseq =
			{
				name="liq",
				frames= {1,2,3,4,5,6,7,8,9,7,8,9,10,11,12,13,14,15,16}, -- frame indexes of animation, in image sheet
				time = 4000,           -- Optional. In ms.  If not supplied, then sprite is frame-based.
				loopCount=1
			} 
			lampeseq1 =
			{
				time = 3000,           -- Optional. In ms.  If not supplied, then sprite is frame-based.
				x1=150,
				y1=-30         -- Optional. Default is 0.
			} 
			desert=true
		end
		if amarante==nil then
			amarante=graphics.newImageSheet("carte/level9/amarante.png", { width=66, height=66, numFrames=1})
			amaranteseq =
			{
			    name="liq",
			    frames= {1}, -- frame indexes of animation, in image sheet
			    time = 1000,           -- Optional. In ms.  If not supplied, then sprite is frame-based.
			   loopCount=1         -- Optional. Default is 0.
			} 
			amaranteseq1 =
			{
				time = 3000,           -- Optional. In ms.  If not supplied, then sprite is frame-based.
				rotation=-600,
				x1=-150,
				y1=30         -- Optional. Default is 0.
			} 
		end
	end
	hg=display.newImage(map10sheethg,1) --display.newImage( "carte/level2/hg.png", -1024,-512,true )
	hg.x=-1024
	hg.y=-512
	hd=display.newImage(map10sheethd,1) --display.newImage( "carte/level2/hd.png",1024,-512,true )
	hd.x=1024
	hd.y=-512
	bg=display.newImage(map10sheetbg,1) --display.newImage( "carte/level2/bg.png", -1024,512,true )
	bg.x=-1024
	bg.y=512
	bd=display.newImage(map10sheetbd,1) --display.newImage( "carte/level2/bd.png", 1024,512,true )
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
	local tunededep=700
	local nbperso=leveldata[10].life
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
pointdep[1]=11

cheminarr={} --si des chemins sont des arrivés
cheminarr[1]=53 --fin numero 2 du chemin

intersection={}
intersection.nb=4
intersection[1]={pt=9, ty=1, un=22, deux=34, proba=1}
intersection[2]={pt=19, ty=1, un=22, deux=34, proba=1}
intersection[3]={pt=32, ty=0, un=46}
intersection[4]={pt=45, ty=1, un=47, deux=55, proba=1}

cheminnb=61-- --nombre de point definisant le chemin -1--------------------------------------------------------------------------------------------------
chemin={}
chemin[1]=point.new(-613,-147)
chemin[2]=point.new(-570,-142)
chemin[3]=point.new(-525,-137)
chemin[4]=point.new(-481,-133)
chemin[5]=point.new(-437,-124)
chemin[6]=point.new(-399,-100)
chemin[7]=point.new(-367,-72)
chemin[8]=point.new(-336,-41)
chemin[9]=point.new(-307,-11)
chemin[10]=point.new(-263,-1)
chemin[11]=point.new(-614,136)
chemin[12]=point.new(-570,138)
chemin[13]=point.new(-528,136)
chemin[14]=point.new(-486,134)
chemin[15]=point.new(-442,123)
chemin[16]=point.new(-403,103)
chemin[17]=point.new(-370,73)
chemin[18]=point.new(-338,43)
chemin[19]=point.new(-305,12)
chemin[20]=point.new(-263,-1)
chemin[21]=point.new(-229,-30)
chemin[22]=point.new(-185,-49)
chemin[23]=point.new(-144,-64)
chemin[24]=point.new(-99,-75)
chemin[25]=point.new(-56,-84)
chemin[26]=point.new(-12,-84)
chemin[27]=point.new(31,-79)
chemin[28]=point.new(75,-82)
chemin[29]=point.new(117,-72)
chemin[30]=point.new(158,-61)
chemin[31]=point.new(200,-46)
chemin[32]=point.new(239,-28)
chemin[33]=point.new(275,-6)
chemin[34]=point.new(-232,28)
chemin[35]=point.new(-191,46)
chemin[36]=point.new(-151,61)
chemin[37]=point.new(-108,72)
chemin[38]=point.new(-64,79)
chemin[39]=point.new(-19,77)
chemin[40]=point.new(27,82)
chemin[41]=point.new(71,77)
chemin[42]=point.new(114,74)
chemin[43]=point.new(158,66)
chemin[44]=point.new(200,48)
chemin[45]=point.new(237,27)
chemin[46]=point.new(320,-4)
chemin[47]=point.new(340,-43)
chemin[48]=point.new(368,-78)
chemin[49]=point.new(398,-111)
chemin[50]=point.new(439,-122)
chemin[51]=point.new(483,-130)
chemin[52]=point.new(529,-135)
chemin[53]=point.new(574,-135)
chemin[54]=point.new(613,-137)
chemin[55]=point.new(340,34)
chemin[56]=point.new(363,70)
chemin[57]=point.new(394,102)
chemin[58]=point.new(434,120)
chemin[59]=point.new(477,131)
chemin[60]=point.new(521,138)
chemin[61]=point.new(566,136)
chemin[62]=point.new(612,134)



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
obstaclenb=80--nombre de point definissant les petits obstacles
obstacle={}
obstacle[1]=point.new(-611,-303)
obstacle[2]=point.new(-557,-295)
obstacle[3]=point.new(-502,-295)
obstacle[4]=point.new(-604,-252)
obstacle[5]=point.new(-556,-252)
obstacle[6]=point.new(-507,-249)
obstacle[7]=point.new(-456,-249)
obstacle[8]=point.new(-603,-80)
obstacle[9]=point.new(-590,-28)
obstacle[10]=point.new(-588,33)
obstacle[11]=point.new(-596,61)
obstacle[12]=point.new(-557,-17)
obstacle[13]=point.new(-437,282)
obstacle[14]=point.new(-396,245)
obstacle[15]=point.new(-452,232)
obstacle[16]=point.new(-505,266)
obstacle[17]=point.new(-609,294)
obstacle[18]=point.new(-557,302)
obstacle[19]=point.new(-571,266)
obstacle[20]=point.new(28,289)
obstacle[21]=point.new(101,290)
obstacle[22]=point.new(150,286)
obstacle[23]=point.new(210,295)
obstacle[24]=point.new(262,292)
obstacle[25]=point.new(49,250)
obstacle[26]=point.new(94,240)
obstacle[27]=point.new(325,289)
obstacle[28]=point.new(283,247)
obstacle[29]=point.new(218,235)
obstacle[30]=point.new(210,188)
obstacle[31]=point.new(400,289)
obstacle[32]=point.new(529,292)
obstacle[33]=point.new(457,281)
obstacle[34]=point.new(595,281)
obstacle[35]=point.new(600,234)
obstacle[36]=point.new(438,230)
obstacle[37]=point.new(358,221)
obstacle[38]=point.new(505,237)
obstacle[39]=point.new(332,180)
obstacle[40]=point.new(312,128)
obstacle[41]=point.new(301,74)
obstacle[42]=point.new(296,27)
obstacle[43]=point.new(298,-26)
obstacle[44]=point.new(296,-83)
obstacle[45]=point.new(298,-140)
obstacle[46]=point.new(307,-202)
obstacle[47]=point.new(324,-257)
obstacle[48]=point.new(358,-291)
obstacle[49]=point.new(369,-252)
obstacle[50]=point.new(434,-265)
obstacle[51]=point.new(488,-261)
obstacle[52]=point.new(551,-248)
obstacle[53]=point.new(600,-249)
obstacle[54]=point.new(538,-304)
obstacle[55]=point.new(512,-306)
obstacle[56]=point.new(483,-308)
obstacle[57]=point.new(612,-306)
obstacle[58]=point.new(610,-69)
obstacle[59]=point.new(612,-26)
obstacle[60]=point.new(607,22)
obstacle[61]=point.new(574,3)
obstacle[62]=point.new(517,22)
obstacle[63]=point.new(507,-33)
obstacle[64]=point.new(555,-49)
obstacle[65]=point.new(181,-235)
obstacle[66]=point.new(116,-244)
obstacle[67]=point.new(51,-243)
obstacle[68]=point.new(-9,-236)
obstacle[69]=point.new(-65,-249)
obstacle[70]=point.new(-36,-300)
obstacle[71]=point.new(49,-303)
obstacle[72]=point.new(135,-304)
obstacle[73]=point.new(216,-300)
obstacle[74]=point.new(293,-301)
obstacle[75]=point.new(247,-222)
obstacle[76]=point.new(268,178)
obstacle[77]=point.new(392,185)
obstacle[78]=point.new(344,-161)
obstacle[79]=point.new(380,-204)
obstacle[80]=point.new(153,227)

obstacle1nb=4--nombre de point definisant le nombre de point du gros obstacle
obstacle1={}--gros cercle
obstacle1[1]=point.new(-321,-308)
obstacle1[2]=point.new(-214,-304)
obstacle1[3]=point.new(-255,302)
obstacle1[4]=point.new(-117,302)

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

 end
t.obsim=function()
if obstacleim==nil then
	obstacleim={}
end
local coordonneedu=#obstacleim+1

-- #obstacleim=9--1
-- --exemple
-- obstacleim={}
-- obstacleim[1]=display.newImage( "carte/level2/bdp.png", 550,140,true )
-- obstacleim[1].xScale=0.2
-- obstacleim[1].yScale=0.2
obstacleim[coordonneedu]=display.newImage(map10sheeto1,1)
obstacleim[coordonneedu].x=1650.5
obstacleim[coordonneedu].y=757
obstacleim[coordonneedu].group=10
obstacleim[coordonneedu+1]=display.newImage(map10sheeto2,1)
obstacleim[coordonneedu+1].x=1140.5
obstacleim[coordonneedu+1].y=305.5
obstacleim[coordonneedu+2]=display.newImage(map10sheeto3,1)
obstacleim[coordonneedu+2].x=-1732
obstacleim[coordonneedu+2].y=782
obstacleim[coordonneedu+3]=display.newImage(map10sheeto4,1)
obstacleim[coordonneedu+3].x=696.5
obstacleim[coordonneedu+3].y=629
obstacleim[coordonneedu+4]=display.newImage(map10sheeto5,1)
obstacleim[coordonneedu+4].x=-1968.5
obstacleim[coordonneedu+4].y=-267.5
obstacleim[coordonneedu+5]=display.newImage(map10sheeto6,1)
obstacleim[coordonneedu+5].x=-1892
obstacleim[coordonneedu+5].y=-41.5
obstacleim[coordonneedu+6]=display.newImage(map10sheeto7,1)
obstacleim[coordonneedu+6].x=-1953.5
obstacleim[coordonneedu+6].y=164
obstacleim[coordonneedu+7]=display.newImage(map10sheeto8,1)
obstacleim[coordonneedu+7].x=1876.5
obstacleim[coordonneedu+7].y=-87
obstacleim[coordonneedu+8]=display.newImage(map10sheeto9,1)
obstacleim[coordonneedu+8].x=-415
obstacleim[coordonneedu+8].y=718.5


--#obstacleanim=0

--decoranim=nil
if decoranim==nil then
	decoranim={}
end
coordonneedu=#decoranim+1
decoranim[coordonneedu]=display.newSprite(serpent,serpentseq)
decoranim[coordonneedu]:setSequence( "liq" )
decoranim[coordonneedu]:play()
decoranim[coordonneedu].x=0
decoranim[coordonneedu].y=0
decoranim[coordonneedu].xScale=0.5
decoranim[coordonneedu].yScale=decoranim[coordonneedu].xScale
decoranim[coordonneedu].posi=1 --0 pour coordonnée donnée donc decoranim[1].x1=XX et decoranim[1].x2=XX ,1 pour random sur les zones contructible, 2 pour sur le chemin
decoranim[coordonneedu].cadence=8000 --tout les combien de temps se produit l'anim

coordonneedu=#decoranim+1
decoranim[coordonneedu]=display.newSprite(scorpion,scorpionseq)
decoranim[coordonneedu]:setSequence( "liq" )
decoranim[coordonneedu]:play()
decoranim[coordonneedu].x=0
decoranim[coordonneedu].y=0
decoranim[coordonneedu].xdep=0
decoranim[coordonneedu].ydep=0
decoranim[coordonneedu].xScale=0.5
decoranim[coordonneedu].yScale=decoranim[coordonneedu].xScale
decoranim[coordonneedu].posi=-6 --0 pour coordonnée donnée donc decoranim[1].x1=XX et decoranim[1].x2=XX ,1 pour random sur les zones contructible, 2 pour sur le chemin
decoranim[coordonneedu].para=scorpionseq1
decoranim[coordonneedu].para.y1=15
decoranim[coordonneedu].para.x1=-60
decoranim[coordonneedu].cadence=8000 --tout les combien de temps se produit l'anim

coordonneedu=#decoranim+1
decoranim[coordonneedu]=display.newSprite(lampe,lampeseq)
decoranim[coordonneedu]:setSequence( "liq" )
decoranim[coordonneedu]:play()
decoranim[coordonneedu].x=-220
decoranim[coordonneedu].xdep=0
decoranim[coordonneedu].ydep=0
decoranim[coordonneedu].y=250
decoranim[coordonneedu].xScale=0.4
decoranim[coordonneedu].yScale=decoranim[coordonneedu].xScale
decoranim[coordonneedu].xScale=-decoranim[coordonneedu].xScale
decoranim[coordonneedu].para=lampeseq1
decoranim[coordonneedu].para.y1=-15
decoranim[coordonneedu].para.x1=60
decoranim[coordonneedu].posi=-6 --0 pour coordonnée donnée donc decoranim[1].x1=XX et decoranim[1].x2=XX ,1 pour random sur les zones contructible, 2 pour sur le chemin
decoranim[coordonneedu].cadence=20000 --tout les combien de temps se produit l'anim

coordonneedu=#decoranim+1
decoranim[coordonneedu]=display.newSprite(amarante,amaranteseq)
decoranim[coordonneedu]:setSequence( "liq" )
decoranim[coordonneedu]:play()
decoranim[coordonneedu].x=0
decoranim[coordonneedu].xdep=0
decoranim[coordonneedu].ydep=0
decoranim[coordonneedu].y=0
decoranim[coordonneedu].xScale=0.2
decoranim[coordonneedu].yScale=decoranim[coordonneedu].xScale
decoranim[coordonneedu].para=amaranteseq1
decoranim[coordonneedu].posi=-3 --0 pour coordonnée donnée donc decoranim[1].x1=XX et decoranim[1].x2=XX ,1 pour random sur les zones contructible, 2 pour sur le chemin
decoranim[coordonneedu].cadence=11000 --tout les combien de temps se produit l'anim



decoration={}
decoration[1]={}
decoration[1].x=-431
decoration[1].y=-10
decoration[1].type=36
decoration[1].planche=1
decoration[1].scale=0.25
decoration[2]={}
decoration[2].x=-103
decoration[2].y=-150
decoration[2].type=37
decoration[2].planche=1
decoration[2].scale=0.15
decoration[3]={}
decoration[3].x=427
decoration[3].y=34
decoration[3].type=40
decoration[3].planche=1
decoration[3].scale=0.12


------------------------------------------------------------fin hugo---------------------------------------------------------------
end
t.vague=function()--donnees sur les vagues du niveau
vague={}
--nbvague=3--15
for k=1,leveldata[10].wave,1 do
	vague[k]={}
	vague[k][1]=200
end
vague[1]={-10,240,-1,240,-10,240,-1,240,-10,240,-1,240,-10,240,-1,240,-10,240,-1,240,-10,240,-1,240,-10,240,-1,240,-10,240,-1,240,-10,240,-1,240,-10,240,-1,240,-10,240,-1,240,272}
vague[2]={-10,272,-1,272,1,1,-10,4,240,240,240,240,-1,4,240,240,240,240,0,0,0,270,-1,270,0,0,0,-10,5,241,241,241,241,241,-1,5,241,241,241,241,241,0,-10,5,241,241,241,241,241,-1,5,241,241,241,241,241,1,1,-10,272,-1,272,-10,272,-1,272}
vague[3]={-10,2,242,242,-1,2,242,242,0,0,0,0,0,-10,3,270,270,270,-1,3,270,270,270,1,-10,3,270,270,270,-1,3,270,270,270,1,-10,3,270,270,270,-1,3,270,270,270,1,-10,3,270,270,270,-1,3,270,270,270,-10,2,272,272,-1,2,272,272,0,-10,2,242,242,-1,2,242,242}
vague[4]={200,0,0,0,0,0,-10,9,200,200,200,200,200,200,200,200,200,-1,5,264,264,264,264,264,0,-10,5,240,240,240,240,240,-1,5,240,240,240,240,240,0,1,-10,5,241,241,241,241,241,-1,5,241,241,241,241,241,0,0,-10,5,242,242,242,242,242,-1,5,242,242,242,242,242,0,0,0,0,-10,5,243,243,243,243,243,-1,4,243,243,243,243,0,0,0,272,-1,272,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-10,5,243,243,243,243,243,-1,4,243,243,243,243,0,0,-10,4,242,242,242,242,-1,5,242,242,242,242,242,0,0,-10,5,241,241,241,241,241,-1,5,241,241,241,241,241,0,0,-10,4,272,272,272,272,-1,4,272,272,272,272,0,-10,4,272,272,272,272,-1,4,272,272,272,272,0,-10,4,272,272,272,272,-1,4,272,272,272,272,0,-10,4,272,272,272,272,-1,4,272,272,272,272,0,0,0,0,200}
vague[5]={-10,2,272,272,-1,2,272,272,-10,2,272,272,-1,2,272,272,-10,2,272,272,-1,2,272,272,0,0,0,0,0,-10,5,270,270,270,270,270,-1,5,270,270,270,270,270,-10,5,270,270,270,270,270,-1,5,270,270,270,270,270,-10,5,270,270,270,270,270,-1,5,270,270,270,270,270,-10,5,270,270,270,270,270,-1,5,270,270,270,270,270,-10,5,270,270,270,270,270,-1,5,270,270,270,270,270,-10,5,270,270,270,270,270,-1,5,270,270,270,270,270,-10,5,270,270,270,270,270,-1,5,270,270,270,270,270,-10,5,270,270,270,270,270,-1,5,270,270,270,270,270,-10,3,243,243,243,-1,3,243,243,243,0,0,0,0,0,0,0,0,0,240}
vague[6]={-10,2,243,243,-1,5,270,270,270,270,270,1,-10,2,243,243,-1,5,270,270,270,270,270,1,-10,2,243,243,-1,5,270,270,270,270,270,0,0,0,0,0,-10,-1,2,267,267,272,-10,-1,2,267,267,272,-10,-1,2,267,267,272,-10,-1,2,267,267,272,-10,-1,2,267,267,272,-10,-1,2,267,267,272,-10,-1,2,267,267,272,-10,-1,2,267,267,272,-10,-1,2,267,267,272,-10,-1,2,267,267,272,0,0,0,270}
vague[7]={9,236,236,236,236,236,236,236,236,236,-1,9,236,236,236,236,236,236,236,236,236,1,9,236,236,236,236,236,236,236,236,236,0,-1,9,236,236,236,236,236,236,236,236,236,9,236,236,236,236,236,236,236,236,236,0,-1,9,236,236,236,236,236,236,236,236,236,0,9,236,236,236,236,236,236,236,236,236,1,-1,9,236,236,236,236,236,236,236,236,236,1,9,236,236,236,236,236,236,236,236,236,0,-1,9,236,236,236,236,236,236,236,236,236,1,9,236,236,236,236,236,236,236,236,236,1,-1,9,236,236,236,236,236,236,236,236,236,0,9,236,236,236,236,236,236,236,236,236,1,-1,9,236,236,236,236,236,236,236,236,236,9,243,243,243,243,243,243,243,243,243,-1,9,243,243,243,243,243,243,243,243,243,0,0,0,0,0,0,0,0,0,0,240}
vague[8]={204,-1,204,0,0,0,0,0,0,0,0,0,269}
-------------------------------------------------------------debut hugo-----------------------------------------------------
--0 retarde de la durer de spawn de 3 soldat et 1 de la durer de 1 soldat
--de 2 à 5 permet de spawner plusieurs soldat a la fois.
--vague[1].nb=2--nb soldat dans la vague

modeinfdif=0-- 0 pour facile, 1 pour normal, 2 pour difficile

end
t.vaguewave=function()
	vague={}
	vague[1]={-10,3,272,272,272,-1,3,272,272,272,-10,3,272,272,272,-1,3,272,272,272,-10,3,272,272,272,-1,3,272,272,272,-10,3,272,272,272,-1,3,272,272,272,-10,9,227,227,227,227,227,227,227,227,227,-1,9,227,227,227,227,227,227,227,227,227,-10,9,240,240,240,240,240,240,240,240,240,-1,9,240,240,240,240,240,240,240,240,240,0,0,0,-10,9,262,262,262,262,262,262,262,262,262,-1,9,262,262,262,262,262,262,262,262,262}
end
return t
