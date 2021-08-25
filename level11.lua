

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
	if donneecharger[11]==0 then
		donneecharger[11]=1
		map11sheethg=graphics.newImageSheet( "carte/level11/hg.jpg", { width=2048, height=1024, numFrames=1,sheetContentWidth=2048,sheetContentHeight=1024 } )
		map11sheethd=graphics.newImageSheet( "carte/level11/hd.jpg", { width=2048, height=1024, numFrames=1,sheetContentWidth=2048,sheetContentHeight=1024 } )
		map11sheetbg=graphics.newImageSheet( "carte/level11/bg.jpg", { width=2048, height=1024, numFrames=1,sheetContentWidth=2048,sheetContentHeight=1024 } )
		map11sheetbd=graphics.newImageSheet( "carte/level11/bd.jpg", { width=2048, height=1024, numFrames=1,sheetContentWidth=2048,sheetContentHeight=1024 } )
		map11sheeto1=graphics.newImageSheet( "carte/level11/1.png", { width=1200, height=861, numFrames=1,sheetContentWidth=1200,sheetContentHeight=861 } )
		map11sheeto2=graphics.newImageSheet( "carte/level11/2.png", { width=2028, height=224, numFrames=1,sheetContentWidth=2028,sheetContentHeight=224 } )
		map11sheeto3=graphics.newImageSheet( "carte/level11/3.png", { width=454, height=475, numFrames=1,sheetContentWidth=454,sheetContentHeight=475 } )
		map11sheeto4=graphics.newImageSheet( "carte/level11/4.png", { width=247, height=261, numFrames=1,sheetContentWidth=247,sheetContentHeight=261 } )
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
		if poisson==nil then
			poisson=graphics.newImageSheet( "carte/level12/poisson.png", { width=461, height=157, numFrames=7 } )
			poissonseq =
			{
			    name="liq",
			    frames= {1,2,3,4,5,6,7}, -- frame indexes of animation, in image sheet
			    time = 1500,           -- Optional. In ms.  If not supplied, then sprite is frame-based.
			   loopCount=1         -- Optional. Default is 0.
			} 
			requin=graphics.newImageSheet( "carte/level12/requin.png", { width=191, height=106, numFrames=1 } )
			requinseq =
			{
			   time=2000,
			   x1=150,
			   y1=100,
			  -- onComplete=removeimage
			} 
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
	hg=display.newImage(map11sheethg,1) --display.newImage( "carte/level2/hg.png", -1024,-512,true )
	hg.x=-1024
	hg.y=-512
	hd=display.newImage(map11sheethd,1) --display.newImage( "carte/level2/hd.png",1024,-512,true )
	hd.x=1024
	hd.y=-512
	bg=display.newImage(map11sheetbg,1) --display.newImage( "carte/level2/bg.png", -1024,512,true )
	bg.x=-1024
	bg.y=512
	bd=display.newImage(map11sheetbd,1) --display.newImage( "carte/level2/bd.png", 1024,512,true )
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
	local tunededep=600
	local nbperso=leveldata[11].life
	if modeinfini or modesquelette then
		tunededep=tunedep
		nbperso=10
	end
	argentdep=-(tunededep)*3--hugo-------------------------------------------------------------------
	ennemipassedep=nbperso--nombre d'ennemi qui peuvent encore passer avant qu'on perdre---hugo------------------------------------------------------------------------------------------------------------------
	
end
t.chemi=function()--donnees sur les differents points de la carte
local point= require( "point" )
genepointinit=45
----------------------------------------------------------------------------------------hugo debut -----------------------------------------------------------------------
-- pointdep={}--entré secondaire 
-- pointdep[1]=13
pointdep={}--entré secondaire 
pointdep[1]=23

--cheminarr={} --si des chemins sont des arrivés
--cheminarr[1]=37 --fin numero 2 du chemin

intersection={}
intersection.nb=1
intersection[1]={pt=21, ty=0, un=45}
-- intersection[2]={pt=7, ty=0, un=24}
-- intersection[3]={pt=21, ty=0, un=34}
-- intersection[4]={pt=11, ty=0, un=42}
-- intersection[5]={pt=42, ty=1, un=45, deux=46, proba=1}
-- intersection[6]={pt=44, ty=0, un=39}
-- intersection[7]={pt=45, ty=0, un=32}
-- intersection[8]={pt=32, ty=0, un=47}
-- intersection[9]={pt=46, ty=1, un=48, deux=50, proba=1}
-- intersection[10]={pt=39, ty=0, un=52}
-- intersection[11]={pt=52, ty=1, un=54, deux=55, proba=1}
-- intersection[12]={pt=48, ty=0, un=56}
-- intersection[13]={pt=50, ty=0, un=61}
-- intersection[14]={pt=53, ty=0, un=70}
-- intersection[15]={pt=59, ty=0, un=79}
-- intersection[16]={pt=76, ty=0, un=84}
-- intersection[17]={pt=67, ty=0, un=86}
-- intersection[18]={pt=84, ty=0, un=82}
-- intersection[19]={pt=86, ty=0, un=82}
-- intersection[20]={pt=82, ty=0, un=88}

cheminnb=60-- --nombre de point definisant le chemin -1--------------------------------------------------------------------------------------------------
chemin={}
chemin[1]=point.new(171,-308)
chemin[2]=point.new(181,-265)
chemin[3]=point.new(200,-226)
chemin[4]=point.new(215,-191)
chemin[5]=point.new(252,-169)
chemin[6]=point.new(291,-158)
chemin[7]=point.new(332,-153)
chemin[8]=point.new(374,-140)
chemin[9]=point.new(417,-127)
chemin[10]=point.new(444,-96)
chemin[11]=point.new(454,-54)
chemin[12]=point.new(461,-12)
chemin[13]=point.new(454,31)
chemin[14]=point.new(418,57)
chemin[15]=point.new(376,70)
chemin[16]=point.new(330,71)
chemin[17]=point.new(285,73)
chemin[18]=point.new(239,73)
chemin[19]=point.new(194,70)
chemin[20]=point.new(150,70)
chemin[21]=point.new(104,66)
chemin[22]=point.new(57,65)
chemin[23]=point.new(-612,90)
chemin[24]=point.new(-570,95)
chemin[25]=point.new(-528,92)
chemin[26]=point.new(-489,73)
chemin[27]=point.new(-461,37)
chemin[28]=point.new(-448,-6)
chemin[29]=point.new(-438,-51)
chemin[30]=point.new(-424,-93)
chemin[31]=point.new(-396,-128)
chemin[32]=point.new(-356,-137)
chemin[33]=point.new(-313,-141)
chemin[34]=point.new(-271,-139)
chemin[35]=point.new(-229,-129)
chemin[36]=point.new(-196,-103)
chemin[37]=point.new(-199,-61)
chemin[38]=point.new(-196,-20)
chemin[39]=point.new(-182,20)
chemin[40]=point.new(-151,46)
chemin[41]=point.new(-108,56)
chemin[42]=point.new(-66,64)
chemin[43]=point.new(-24,59)
chemin[44]=point.new(16,71)
chemin[45]=point.new(23,115)
chemin[46]=point.new(34,157)
chemin[47]=point.new(53,196)
chemin[48]=point.new(88,221)
chemin[49]=point.new(131,229)
chemin[50]=point.new(172,235)
chemin[51]=point.new(216,237)
chemin[52]=point.new(258,232)
chemin[53]=point.new(302,234)
chemin[54]=point.new(346,229)
chemin[55]=point.new(390,232)
chemin[56]=point.new(432,232)
chemin[57]=point.new(478,227)
chemin[58]=point.new(521,227)
chemin[59]=point.new(563,227)
chemin[60]=point.new(606,229)
chemin[61]=point.new(611,229)


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
obstaclenb=38--nombre de point definissant les petits obstacles
obstacle={}
obstacle[1]=point.new(-468,-254)
obstacle[2]=point.new(-408,-259)
obstacle[3]=point.new(-347,-249)
obstacle[4]=point.new(-279,-251)
obstacle[5]=point.new(-224,-278)
obstacle[6]=point.new(-435,-301)
obstacle[7]=point.new(-341,-300)
obstacle[8]=point.new(-271,-301)
obstacle[9]=point.new(-167,-246)
obstacle[10]=point.new(-122,-207)
obstacle[11]=point.new(-109,-291)
obstacle[12]=point.new(-167,-300)
obstacle[13]=point.new(-37,-293)
obstacle[14]=point.new(24,-295)
obstacle[15]=point.new(93,-293)
obstacle[16]=point.new(157,-176)
obstacle[17]=point.new(-42,292)
obstacle[18]=point.new(41,300)
obstacle[19]=point.new(121,299)
obstacle[20]=point.new(216,297)
obstacle[21]=point.new(289,292)
obstacle[22]=point.new(350,294)
obstacle[23]=point.new(413,295)
obstacle[24]=point.new(488,290)
obstacle[25]=point.new(574,294)
obstacle[26]=point.new(11,273)
obstacle[27]=point.new(598,129)
obstacle[28]=point.new(534,118)
obstacle[29]=point.new(541,56)
obstacle[30]=point.new(593,58)
obstacle[31]=point.new(599,-4)
obstacle[32]=point.new(560,-2)
obstacle[33]=point.new(590,-74)
obstacle[34]=point.new(554,-124)
obstacle[35]=point.new(612,-140)
obstacle[36]=point.new(376,-241)
obstacle[37]=point.new(457,-241)
obstacle[38]=point.new(423,-293)
obstacle1nb=9--nombre de point definisant le nombre de point du gros obstacle
obstacle1={}--gros cercle
obstacle1[1]=point.new(-590,232)
obstacle1[2]=point.new(-440,250)
obstacle1[3]=point.new(-307,230)
obstacle1[4]=point.new(-169,229)
obstacle1[5]=point.new(16,-148)
obstacle1[6]=point.new(-593,-287)
obstacle1[7]=point.new(-611,-130)
obstacle1[8]=point.new(597,-295)
obstacle1[9]=point.new(239,-306)

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
-- #obstacleim=4--1
-- --exemple
-- obstacleim={}
-- obstacleim[1]=display.newImage( "carte/level2/bdp.png", 550,140,true )
-- obstacleim[1].xScale=0.2
-- obstacleim[1].yScale=0.2
obstacleim[coordonneedu]=display.newImage(map11sheeto1,1)
obstacleim[coordonneedu].x=-1448
obstacleim[coordonneedu].y=593.5
obstacleim[coordonneedu+1]=display.newImage(map11sheeto2,1)
obstacleim[coordonneedu+1].x=1034
obstacleim[coordonneedu+1].y=912
obstacleim[coordonneedu+2]=display.newImage(map11sheeto3,1)
obstacleim[coordonneedu+2].x=-165
obstacleim[coordonneedu+2].y=719.5
obstacleim[coordonneedu+3]=display.newImage(map11sheeto4,1)
obstacleim[coordonneedu+3].x=-597.5
obstacleim[coordonneedu+3].y=409.5
obstacleim[coordonneedu+3].groupe=3000


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
decoranim[coordonneedu]=display.newSprite(poisson,poissonseq)
decoranim[coordonneedu]:setSequence( "liq" )
decoranim[coordonneedu]:play()
decoranim[coordonneedu].x=20
decoranim[coordonneedu].y=-180
decoranim[coordonneedu].xScale=0.2
decoranim[coordonneedu].yScale=decoranim[coordonneedu].xScale
decoranim[coordonneedu].posi=0 --0 pour coordonnée donnée donc decoranim[1].x1=XX et decoranim[1].x2=XX ,1 pour random sur les zones contructible, 2 pour sur le chemin
decoranim[coordonneedu].cadence=10000 --tout les combien de temps se produit l'anim

coordonneedu=#decoranim+1
decoranim[coordonneedu]=display.newImage(requin,1)
decoranim[coordonneedu].x=0
decoranim[coordonneedu].y=0
decoranim[coordonneedu].xdep=-300
decoranim[coordonneedu].ydep=260
decoranim[coordonneedu].xScale=0.25
decoranim[coordonneedu].yScale=decoranim[coordonneedu].xScale
decoranim[coordonneedu].posi=-1 -- -1 pour transition au coordonnée donnée, -2 pareil que 1 et -3 pareil que 2, 0 pour coordonnée donnée donc decoranim[1].x1=XX et decoranim[1].x2=XX ,1 pour random sur les zones contructible, 2 pour sur le chemin
decoranim[coordonneedu].para=requinseq
decoranim[coordonneedu].para.y1=0
decoranim[coordonneedu].para.x1=150
decoranim[coordonneedu].cadence=16000 --tout les combien de temps se produit l'anim

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
decoration[1].x=-341
decoration[1].y=-47
decoration[1].type=39  --bug--
decoration[1].planche=1
decoration[1].scale=0.13
decoration[2]={}
decoration[2].x=239
decoration[2].y=-19
decoration[2].type=33  --bug--
decoration[2].planche=1
decoration[2].scale=0.1
decoration[3]={}
decoration[3].x=195
decoration[3].y=151
decoration[3].type=38
decoration[3].planche=1
decoration[3].scale=0.2

------------------------------------------------------------fin hugo---------------------------------------------------------------
end
t.vague=function()--donnees sur les vagues du niveau
vague={}
--nbvague=3--15
for k=1,leveldata[11].wave,1 do
	vague[k]={}
	vague[k][1]=200
end
vague[1]={2,236,236,0,2,236,236,0,2,236,236,0,5,209,209,209,209,209,0,0,5,236,236,236,236,236,-1,4,263,263,263,263,-1,3,209,209,209,0,0,0,0,-1,4,209,209,209,209,1,-1,5,209,209,209,209,209,1,-1,4,209,209,209,209,2,236,236,2,236,236,0,2,236,236,2,236,236,1,2,236,236}
vague[2]={209,0,0,0,0,4,263,263,263,263,0,0,-1,4,264,264,264,264,0,0,-1,4,263,263,263,263,0,0,4,264,264,264,264,0,0,4,209,209,209,209,4,209,209,209,209,4,209,209,209,209,4,209,209,209,209,0,0,0,-1,2,236,236,-1,2,236,236,-1,2,236,236,-1,2,236,236}
vague[3]={-1,4,212,212,212,212,1,-1,4,209,209,209,209,1,-1,4,212,212,212,212,0,0,0,-1,4,263,263,263,263,0,-1,4,264,264,264,264,-1,2,263,263,-1,2,264,264,-1,2,263,263,-1,2,264,264,0,0,0,0,-1,3,236,236,236,1,-1,3,236,236,236,1,-1,3,236,236,236,1,-1,3,236,236,236,1,-1,3,236,236,236,0,0,0,0,-1,3,236,236,236,1,-1,3,236,236,236,1,-1,3,236,236,236,1,-1,4,236,236,236,236,0,0,0,0,0,0,0,0,2,266,266}
vague[4]={209,0,0,0,0,2,263,263,266,3,236,236,236,4,236,236,236,236,3,236,236,236,4,236,236,236,236,3,236,236,236,4,236,236,236,236,3,236,236,236,3,236,236,236,4,236,236,236,236,0,0,0,0,0,-1,5,200,200,200,200,200,-1,5,200,200,200,200,200,-1,5,200,200,200,200,200,-1,5,200,200,200,200,200,-1,5,200,200,200,200,200,-1,5,200,200,200,200,200,-1,5,200,200,200,200,200,0,0,0,0,-1,3,263,263,263,-1,3,263,263,263,-1,3,263,263,263,-1,3,263,263,263,-1,4,265,265,265,265,-1,265,265,265,265,0,0,0,0,209}
vague[5]={5,236,236,236,271,271,5,236,236,236,271,271,5,236,236,236,271,271,5,236,236,236,271,271,5,236,236,236,271,271,5,236,236,236,271,271,5,236,236,236,271,271,5,236,236,236,271,271,5,236,236,236,271,271,0,0,0,-1,4,218,218,218,218,0,0,0,-1,5,219,219,219,219,219,-1,5,212,212,212,212,212,-1,5,212,212,212,212,212,0,0,0,0,0,0,0,0,0,209}
vague[6]={209,0,0,0,0,0,0,266,0,0,0,0,0,266,0,266,-1,266,0,0,0,-1,266,0,266,0,0,-1,266,266,0,-1,266,-1,266,0,0,0,0,0,0,0,0,0,-1,7,265,265,265,265,265,261,261,0,0,-1,7,261,265,261,265,261,265,261,0,0,-1,7,261,265,261,265,261,265,261,0,0,0,-1,7,261,265,261,265,261,265,261,0,0,-1,7,261,265,261,265,261,265,261,0,0,0,0,261}
vague[7]={2,218,218,2,218,218,2,218,218,0,0,0,0,0,2,218,218,2,218,218,2,218,218,0,0,0,0,2,218,218,2,218,218,2,218,218,2,218,218,0,0,0,0,0,218}
vague[8]={9,236,236,236,236,236,236,236,236,236,-1,9,236,236,236,236,236,236,236,236,236,9,236,236,236,236,236,236,236,236,236,-1,9,236,236,236,236,236,236,236,236,236,9,236,236,236,236,236,236,236,236,236,-1,9,236,236,236,236,236,236,236,236,236,9,236,236,236,236,236,236,236,236,236,-1,9,236,236,236,236,236,236,236,236,236,9,236,236,236,236,236,236,236,236,236,-1,9,236,236,236,236,236,236,236,236,236,9,236,236,236,236,236,236,236,236,236,-1,9,236,236,236,236,236,236,236,236,236,9,236,236,236,236,236,236,236,236,236,-1,9,236,236,236,236,236,236,236,236,236,0,0,0,0,0,0,0,0,236}
vague[9]={-1,5,218,218,218,218,218,5,218,218,218,218,218,-1,5,218,218,218,218,218,0,0,0,0,0,0,0,0,269,-1,269}
-------------------------------------------------------------debut hugo-----------------------------------------------------
--0 retarde de la durer de spawn de 3 soldat et 1 de la durer de 1 soldat
--de 2 à 5 permet de spawner plusieurs soldat a la fois.
--vague[1].nb=2--nb soldat dans la vague

modeinfdif=0-- 0 pour facile, 1 pour normal, 2 pour difficile

end
t.vaguewave=function()
	vague={}
	vague[1]={9,270,270,270,270,270,270,270,270,270,-10,9,270,270,270,270,270,270,270,270,270,-1,269,9,270,270,270,270,270,270,270,270,270,-10,9,270,270,270,270,270,270,270,270,270,-1,269,9,270,270,270,270,270,270,270,270,270,-10,9,270,270,270,270,270,270,270,270,270,-1,262,9,270,270,270,270,270,270,270,270,270,-10,9,270,270,270,270,270,270,270,270,270,-1,262,9,270,270,270,270,270,270,270,270,270,-10,9,270,270,270,270,270,270,270,270,270,-1,262,9,270,270,270,270,270,270,270,270,270,-10,9,270,270,270,270,270,270,270,270,270,-1,269,9,270,270,270,270,270,270,270,270,270,-10,9,270,270,270,270,270,270,270,270,270,-1,262,9,270,270,270,270,270,270,270,270,270,-10,9,270,270,270,270,270,270,270,270,270,-1,262,9,270,270,270,270,270,270,270,270,270,-10,9,270,270,270,270,270,270,270,270,270,-1,269,9,270,270,270,270,270,270,270,270,270,-10,9,270,270,270,270,270,270,270,270,270,-1,262,9,270,270,270,270,270,270,270,270,270,-10,9,270,270,270,270,270,270,270,270,270,-1,269,9,270,270,270,270,270,270,270,270,270,-10,9,270,270,270,270,270,270,270,270,270,-1,269}
end
return t