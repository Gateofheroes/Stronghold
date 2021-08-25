

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
	if donneecharger[9]==0 then
		donneecharger[9]=1
		map9sheethg=graphics.newImageSheet( "carte/level9/hg.jpg", { width=2048, height=1024, numFrames=1,sheetContentWidth=2048,sheetContentHeight=1024 } )
		map9sheethd=graphics.newImageSheet( "carte/level9/hd.jpg", { width=2048, height=1024, numFrames=1,sheetContentWidth=2048,sheetContentHeight=1024 } )
		map9sheetbg=graphics.newImageSheet( "carte/level9/bg.jpg", { width=2048, height=1024, numFrames=1,sheetContentWidth=2048,sheetContentHeight=1024 } )
		map9sheetbd=graphics.newImageSheet( "carte/level9/bd.jpg", { width=2048, height=1024, numFrames=1,sheetContentWidth=2048,sheetContentHeight=1024 } )
		map9sheeto1=graphics.newImageSheet( "carte/level9/1.png", { width=660, height=623, numFrames=1,sheetContentWidth=660,sheetContentHeight=623 } )
		map9sheeto2=graphics.newImageSheet( "carte/level9/2.png", { width=388, height=221, numFrames=1,sheetContentWidth=388,sheetContentHeight=221 } )
		map9sheeto3=graphics.newImageSheet( "carte/level9/3.png", { width=1616, height=399, numFrames=1,sheetContentWidth=1616,sheetContentHeight=399 } )
		map9sheeto4=graphics.newImageSheet( "carte/level9/4.png", { width=1256, height=1018, numFrames=1,sheetContentWidth=1256,sheetContentHeight=1018 } )
		if desert==nil then
			serpent=graphics.newImageSheet( "carte/level9/snake.png", { width=52, height=64, numFrames=16 } )
			serpentseq =
			{
				name="liq",
				frames= {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}, -- frame indexes of animation, in image sheet
				time = 3000,           -- Optional. In ms.  If not supplied, then sprite is frame-based.
				loopCount=1         -- Optional. Default is 0.
			} 
			desert=true
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
		end
		if poisson==nil then
			poisson=graphics.newImageSheet( "carte/level12/poisson.png", { width=461, height=157, numFrames=7 } )
			poissonseq =
			{
			    name="liq",
			    frames= {1,2,3,4,6,7}, -- frame indexes of animation, in image sheet
			    time = 1000,           -- Optional. In ms.  If not supplied, then sprite is frame-based.
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
	hg=display.newImage(map9sheethg,1) --display.newImage( "carte/level2/hg.png", -1024,-512,true )
	hg.x=-1024
	hg.y=-512
	hd=display.newImage(map9sheethd,1) --display.newImage( "carte/level2/hd.png",1024,-512,true )
	hd.x=1024
	hd.y=-512
	bg=display.newImage(map9sheetbg,1) --display.newImage( "carte/level2/bg.png", -1024,512,true )
	bg.x=-1024
	bg.y=512
	bd=display.newImage(map9sheetbd,1) --display.newImage( "carte/level2/bd.png", 1024,512,true )
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
	local nbperso=leveldata[9].life
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

----------------------------------------------------------------------------------------hugo debut -----------------------------------------------------------------------
pointdep={}--entré secondaire 
pointdep[1]=43

cheminarr={} --si des chemins sont des arrivés
cheminarr[1]=31 --fin numero 2 du chemin
intersection={}
intersection.nb=6
intersection[1]={pt=15, ty=1, un=17, deux=33, proba=1}
intersection[2]={pt=57, ty=1, un=60, deux=61, proba=1}
intersection[3]={pt=59, ty=0, un=36}
intersection[4]={pt=39, ty=1, un=42, deux=70, proba=1}
intersection[5]={pt=41, ty=0, un=25}
intersection[6]={pt=68, ty=0, un=72}

cheminnb=77-- --nombre de point definisant le chemin -1--------------------------------------------------------------------------------------------------
chemin={}
chemin[1]=point.new(-601,-308)
chemin[2]=point.new(-572,-278)
chemin[3]=point.new(-543,-248)
chemin[4]=point.new(-515,-215)
chemin[5]=point.new(-481,-191)
chemin[6]=point.new(-445,-171)
chemin[7]=point.new(-404,-153)
chemin[8]=point.new(-365,-145)
chemin[9]=point.new(-321,-139)
chemin[10]=point.new(-281,-137)
chemin[11]=point.new(-237,-139)
chemin[12]=point.new(-191,-134)
chemin[13]=point.new(-144,-130)
chemin[14]=point.new(-99,-130)
chemin[15]=point.new(-51,-129)
chemin[16]=point.new(-19,-113)
chemin[17]=point.new(15,-148)
chemin[18]=point.new(44,-182)
chemin[19]=point.new(85,-204)
chemin[20]=point.new(129,-208)
chemin[21]=point.new(175,-207)
chemin[22]=point.new(212,-191)
chemin[23]=point.new(245,-163)
chemin[24]=point.new(271,-129)
chemin[25]=point.new(300,-100)
chemin[26]=point.new(345,-109)
chemin[27]=point.new(388,-113)
chemin[28]=point.new(432,-111)
chemin[29]=point.new(476,-111)
chemin[30]=point.new(519,-114)
chemin[31]=point.new(564,-119)
chemin[32]=point.new(602,-143)
chemin[33]=point.new(8,-78)
chemin[34]=point.new(33,-41)
chemin[35]=point.new(54,-2)
chemin[36]=point.new(94,16)
chemin[37]=point.new(137,19)
chemin[38]=point.new(179,16)
chemin[39]=point.new(218,19)
chemin[40]=point.new(259,21)
chemin[41]=point.new(270,-23)
chemin[42]=point.new(286,-62)
chemin[43]=point.new(-611,24)
chemin[44]=point.new(-565,29)
chemin[45]=point.new(-525,37)
chemin[46]=point.new(-484,50)
chemin[47]=point.new(-445,63)
chemin[48]=point.new(-404,74)
chemin[49]=point.new(-362,79)
chemin[50]=point.new(-320,79)
chemin[51]=point.new(-279,79)
chemin[52]=point.new(-242,81)
chemin[53]=point.new(-201,89)
chemin[54]=point.new(-159,89)
chemin[55]=point.new(-120,86)
chemin[56]=point.new(-76,84)
chemin[57]=point.new(-38,99)
chemin[58]=point.new(-3,121)
chemin[59]=point.new(14,81)
chemin[60]=point.new(36,38)
chemin[61]=point.new(23,154)
chemin[62]=point.new(51,185)
chemin[63]=point.new(87,211)
chemin[64]=point.new(131,219)
chemin[65]=point.new(176,222)
chemin[66]=point.new(213,212)
chemin[67]=point.new(251,190)
chemin[68]=point.new(275,159)
chemin[69]=point.new(293,125)
chemin[70]=point.new(280,59)
chemin[71]=point.new(294,90)
chemin[72]=point.new(335,107)
chemin[73]=point.new(381,107)
chemin[74]=point.new(426,108)
chemin[75]=point.new(467,107)
chemin[76]=point.new(509,108)
chemin[77]=point.new(551,112)
chemin[78]=point.new(595,116)
for i=1, 78 do
	chemin[i].mechant=0.6
end

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
obstaclenb=59--nombre de point definissant les petits obstacles
obstacle={}
obstacle[1]=point.new(-42,287)
obstacle[2]=point.new(18,281)
obstacle[3]=point.new(80,292)
obstacle[4]=point.new(162,295)
obstacle[5]=point.new(317,302)
obstacle[6]=point.new(455,303)
obstacle[7]=point.new(390,294)
obstacle[8]=point.new(594,297)
obstacle[9]=point.new(514,292)
obstacle[10]=point.new(415,274)
obstacle[11]=point.new(468,260)
obstacle[12]=point.new(-530,263)
obstacle[13]=point.new(-499,230)
obstacle[14]=point.new(-463,211)
obstacle[15]=point.new(-562,212)
obstacle[16]=point.new(-515,173)
obstacle[17]=point.new(-606,-75)
obstacle[18]=point.new(-595,-145)
obstacle[19]=point.new(-604,-223)
obstacle[20]=point.new(-524,-308)
obstacle[21]=point.new(-483,-301)
obstacle[22]=point.new(-423,-303)
obstacle[23]=point.new(-614,292)
obstacle[24]=point.new(-613,214)
obstacle[25]=point.new(-600,146)
obstacle[26]=point.new(-600,95)
obstacle[27]=point.new(-352,-304)
obstacle[28]=point.new(24,-306)
obstacle[29]=point.new(81,-306)
obstacle[30]=point.new(140,-306)
obstacle[31]=point.new(221,-300)
obstacle[32]=point.new(296,-295)
obstacle[33]=point.new(356,-291)
obstacle[34]=point.new(428,-288)
obstacle[35]=point.new(498,-283)
obstacle[36]=point.new(602,-290)
obstacle[37]=point.new(599,-248)
obstacle[38]=point.new(543,-251)
obstacle[39]=point.new(511,-243)
obstacle[40]=point.new(468,-244)
obstacle[41]=point.new(423,-226)
obstacle[42]=point.new(372,-241)
obstacle[43]=point.new(322,-257)
obstacle[44]=point.new(602,-61)
obstacle[45]=point.new(600,-19)
obstacle[46]=point.new(586,12)
obstacle[47]=point.new(548,-32)
obstacle[48]=point.new(535,7)
obstacle[49]=point.new(96,165)
obstacle[50]=point.new(158,167)
obstacle[51]=point.new(148,-115)
obstacle[52]=point.new(213,-102)
obstacle[53]=point.new(-38,-72)
obstacle[54]=point.new(-28,-23)
obstacle[55]=point.new(-41,33)
obstacle[56]=point.new(608,219)
obstacle[57]=point.new(605,173)
obstacle[58]=point.new(612,77)
obstacle[59]=point.new(600,-179)
obstacle[60]=point.new(-35,-296)

obstacle1nb=11--nombre de point definisant le nombre de point du gros obstacle
obstacle1={}--gros cercle
obstacle1[1]=point.new(-395,290)
obstacle1[2]=point.new(-250,287)
obstacle1[3]=point.new(-154,287)
obstacle1[4]=point.new(-295,173)
obstacle1[5]=point.new(-198,131)
obstacle1[6]=point.new(-294,38)
obstacle1[7]=point.new(-169,-2)
obstacle1[8]=point.new(-242,-114)
obstacle1[9]=point.new(-178,-197)
obstacle1[10]=point.new(-217,-252)
obstacle1[11]=point.new(-160,-228)

obstaclsold={}
obstaclsold.nb=7 --nombre d'obstacle ou les soldats ne peuvent pas aller.
 obstaclsold[1]=point.new(-253,292)
 obstaclsold[1].rayon=30000
 obstaclsold[2]=point.new(-123,167)
 obstaclsold[2].rayon=888
 obstaclsold[3]=point.new(-351,133)
 obstaclsold[3].rayon=888
 obstaclsold[4]=point.new(-311,-19)
 obstaclsold[4].rayon=8000
 obstaclsold[5]=point.new(-111,-10)
 obstaclsold[5].rayon=10000
 obstaclsold[6]=point.new(-217,-15)
 obstaclsold[6].rayon=8000
 obstaclsold[7]=point.new(-186,-306)
 obstaclsold[7].rayon=20000

--mine:
mineinfo={}
mineinfo.nb=1
-- local i=0
-- while i<=mineinfo.nb do
-- 	mineinfo[i]={}
-- end
mineinfo[1]=point.new(190,102)
mineinfo[1].nbmine=1

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
obstacleim[coordonneedu]=display.newImage(map9sheeto1,1)
obstacleim[coordonneedu].x=-1718
obstacleim[coordonneedu].y=621.5
obstacleim[coordonneedu+1]=display.newImage(map9sheeto2,1)
obstacleim[coordonneedu+1].x=610
obstacleim[coordonneedu+1].y=-421.5
obstacleim[coordonneedu+2]=display.newImage(map9sheeto3,1)
obstacleim[coordonneedu+2].x=1240
obstacleim[coordonneedu+2].y=824.5
obstacleim[coordonneedu+3]=display.newImage(map9sheeto4,1)
obstacleim[coordonneedu+3].x=-700
obstacleim[coordonneedu+3].y=-23
obstacleim[coordonneedu+3].group=2048

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
--decoranim=nil
--#obstacleanim=0

--decoranim=nil
coordonneedu=#decoranim+1
decoranim[coordonneedu]=display.newSprite(poisson,poissonseq)
decoranim[coordonneedu]:setSequence( "liq" )
decoranim[coordonneedu]:play()
decoranim[coordonneedu].x=-220
decoranim[coordonneedu].y=-250
decoranim[coordonneedu].xScale=0.2
decoranim[coordonneedu].yScale=decoranim[coordonneedu].xScale
decoranim[coordonneedu].posi=0 --0 pour coordonnée donnée donc decoranim[1].x1=XX et decoranim[1].x2=XX ,1 pour random sur les zones contructible, 2 pour sur le chemin
decoranim[coordonneedu].cadence=15000 --tout les combien de temps se produit l'anim

coordonneedu=#decoranim+1
decoranim[coordonneedu]=display.newSprite(poisson,poissonseq)
decoranim[coordonneedu]:setSequence( "liq" )
decoranim[coordonneedu]:play()
decoranim[coordonneedu].x=-220
decoranim[coordonneedu].y=250
decoranim[coordonneedu].xScale=0.2
decoranim[coordonneedu].yScale=decoranim[coordonneedu].xScale
decoranim[coordonneedu].xScale=-decoranim[coordonneedu].xScale
decoranim[coordonneedu].posi=0 --0 pour coordonnée donnée donc decoranim[1].x1=XX et decoranim[1].x2=XX ,1 pour random sur les zones contructible, 2 pour sur le chemin
decoranim[coordonneedu].cadence=20000 --tout les combien de temps se produit l'anim


coordonneedu=#decoranim+1
decoranim[coordonneedu]=display.newImage(requin,1)
decoranim[coordonneedu].x=0
decoranim[coordonneedu].y=0
decoranim[coordonneedu].xdep=-300
decoranim[coordonneedu].ydep=0
decoranim[coordonneedu].xScale=0.25
decoranim[coordonneedu].yScale=decoranim[coordonneedu].xScale
decoranim[coordonneedu].posi=-1 -- -4 à -6 transition+animation (-4 pareil que 0...) -1 pour transition au coordonnée donnée, -2 pareil que 1 et -3 pareil que 2, 0 pour coordonnée donnée donc decoranim[1].x1=XX et decoranim[1].x2=XX ,1 pour random sur les zones contructible, 2 pour sur le chemin
decoranim[coordonneedu].para=requinseq
decoranim[coordonneedu].para.y1=30
decoranim[coordonneedu].para.x1=110
decoranim[coordonneedu].cadence=23000 --tout les combien de temps se produit l'anim

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
decoration[1].x=-467
decoration[1].y=-72
decoration[1].type=31
decoration[1].planche=1
decoration[1].scale=0.2
decoration[2]={}
decoration[2].x=98
decoration[2].y=-49
decoration[2].type=32
decoration[2].planche=1
decoration[2].scale=0.2
decoration[3]={}
decoration[3].x=418
decoration[3].y=35
decoration[3].type=34
decoration[3].planche=1
decoration[3].scale=0.2


------------------------------------------------------------fin hugo---------------------------------------------------------------
end
t.vague=function()--donnees sur les vagues du niveau
vague={}
--nbvague=3--15
for k=1,leveldata[9].wave,1 do
	vague[k]={}
	vague[k][1]=200
end
vague[1]={3,209,209,209,-1,3,213,213,213,0,3,236,236,236,-1,3,236,236,236,236,-1,236,0,0,5,213,213,213,213,213,-1,5,209,209,209,209,209,0,0,0,0,0,0,3,264,264,264,264,-1,3,264,264,264,-1,264,0,0,264,3,270,270,270,-1,264,-1,3,270,270,270,2,236,236,-1,2,236,236,3,209,209,209,-1,3,213,213,213,0,3,209,209,209,-1,3,213,213,213,1,1,3,209,209,209,-1,3,213,213,213,0,0,236,236,236,236,-1,236,-1,236,-1,236,-1,236,-1,209,209,209,-1,236,-1,236}
vague[2]={265,265,-1,265,-1,265,1,3,236,236,236,-1,3,236,236,236,5,210,210,210,210,210,-1,5,210,210,210,210,210,0,5,210,210,210,210,210,-1,5,210,210,210,210,210,0,-10,219,-1,219,0,0,0,0,267,267,267,267,267,-1,267,-1,267,-1,267,-1,267,-1,267,0,0,9,200,200,200,200,200,200,200,200,200,-1,9,200,200,200,200,200,200,200,200,200,0,3,205,205,205,-1,3,205,205,205,0,219,219,219,-1,219,-1,219,-1,219,0,0,200}
vague[3]={9,200,200,200,200,200,200,200,200,200,-1,9,200,200,200,200,200,200,200,200,200,0,9,200,200,200,200,200,200,200,200,200,-1,9,200,200,200,200,200,200,200,200,200,5,205,205,205,205,205,-1,5,205,205,205,205,205,0,-10,219,-1,219,0,0,0,9,200,200,200,200,200,200,200,200,200,-1,9,200,200,200,200,200,200,200,200,200,1,9,200,200,200,200,200,200,200,200,200,-1,9,200,200,200,200,200,200,200,200,200,1,9,200,200,200,200,200,200,200,200,200,-1,9,200,200,200,200,200,200,200,200,200,-10,2,219,219,-1,2,219,219}
vague[4]={9,205,205,205,205,205,205,205,205,205,-1,9,205,205,205,205,205,205,205,205,205,1,2,219,219,-1,2,219,219,0,0,0,9,200,200,200,200,200,200,200,200,200,1,9,200,200,200,200,200,200,200,200,200,-1,3,267,267,267,-1,3,267,267,267,-1,3,267,267,267,0,3,267,267,267,3,267,267,267,3,267,267,267}
vague[5]={-1,5,267,267,267,267,267,5,267,267,267,267,267,2,219,219,-1,2,219,219,0,0,0,0,-10,5,270,270,270,270,270,-1,5,270,270,270,270,270,1,-10,5,270,270,270,270,270,-1,5,270,270,270,270,270,0,-10,5,270,270,270,270,270,-1,5,270,270,270,270,270,1,-10,5,270,270,270,270,270,-1,5,270,270,270,270,270,0,-10,5,270,270,270,270,270,-1,5,270,270,270,270,270,-10,5,270,270,270,270,270,-1,5,270,270,270,270,270,1,-10,5,270,270,270,270,270,-1,5,270,270,270,270,270,-10,5,270,270,270,270,270,-1,5,270,270,270,270,270,5,205,205,205,205,205,-1,5,205,205,205,205,205,5,205,205,205,205,205,-1,5,205,205,205,205,205,0,0,218,219,-1,218,-1,219,0,0,0,267}
vague[6]={-1,5,267,267,267,267,267,5,267,267,267,267,267,0,-1,5,267,267,267,267,267,5,267,267,267,267,267,0,5,271,271,271,271,271,-1,5,271,271,271,271,271,0,0,9,213,213,213,213,213,213,213,213,213,-1,9,213,213,213,213,213,213,213,213,213,9,213,213,213,213,213,213,213,213,213,-1,9,213,213,213,213,213,213,213,213,213,9,213,213,213,213,213,213,213,213,213,-1,9,213,213,213,213,213,213,213,213,213,0,0,5,267,267,267,267,267,-1,5,267,267,267,267,267,5,267,267,267,267,267,-1,5,267,267,267,267,267}
vague[7]={-1,5,267,267,267,267,267,5,267,267,267,267,267,-1,5,267,267,267,267,267,5,267,267,267,267,267,0,-1,5,267,267,267,267,267,5,267,267,267,267,267,-1,5,267,267,267,267,267,5,267,267,267,267,267,-1,9,213,213,213,213,213,213,213,213,213,9,213,213,213,213,213,213,213,213,213,-1,9,213,213,213,213,213,213,213,213,213,9,213,213,213,213,213,213,213,213,213,-1,9,213,213,213,213,213,213,213,213,213,0,-1,9,213,213,213,213,213,213,213,213,213,9,213,213,213,213,213,213,213,213,213,-1,9,213,213,213,213,213,213,213,213,213,9,213,213,213,213,213,213,213,213,213,-1,9,213,213,213,213,213,213,213,213,213,-1,9,267,267,267,267,267,267,267,267,267,9,267,267,267,267,267,267,267,267,267,-1,9,267,267,267,267,267,267,267,267,267,9,267,267,267,267,267,267,267,267,267,272,-1,272}
-------------------------------------------------------------debut hugo-----------------------------------------------------
--0 retarde de la durer de spawn de 3 soldat et 1 de la durer de 1 soldat
--de 2 à 5 permet de spawner plusieurs soldat a la fois.
--vague[1].nb=2--nb soldat dans la vague

modeinfdif=0-- 0 pour facile, 1 pour normal, 2 pour difficile

end
t.vaguewave=function()
	vague={}
	vague[1]={204,204,5,262,262,262,262,262,3,262,262,262,269,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,204,-1,204,-1,5,262,262,262,262,262,-1,3,262,262,262,-1,269}
end
return t