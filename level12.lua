

local t={} --niveau inf
t.new=function()--gestion du niveau 4 du jeu, doit toujours suivre le meme modele
	-- function affichagecarte (pole)	
	-- 	if donneecharger[12]==0 then
	-- 		donneecharger[12]=1
	-- 		map12sheethg=graphics.newImageSheet( "carte/level12/hg.jpg", { width=2048, height=1024, numFrames=1,sheetContentWidth=2048,sheetContentHeight=1024 } )
	-- 		map12sheethd=graphics.newImageSheet( "carte/level12/hd.jpg", { width=2048, height=1024, numFrames=1,sheetContentWidth=2048,sheetContentHeight=1024 } )
	-- 		map12sheetbg=graphics.newImageSheet( "carte/level12/bg.jpg", { width=2048, height=1024, numFrames=1,sheetContentWidth=2048,sheetContentHeight=1024 } )
	-- 		map12sheetbd=graphics.newImageSheet( "carte/level12/bd.jpg", { width=2048, height=1024, numFrames=1 ,sheetContentWidth=2048,sheetContentHeight=1024} )
	-- 		map12sheeto1=graphics.newImageSheet( "carte/level12/1.png", { width=147, height=210, numFrames=1,sheetContentWidth=147,sheetContentHeight=210 } )
	-- 		map12sheeto2=graphics.newImageSheet( "carte/level12/2.png", { width=1501, height=202, numFrames=1,sheetContentWidth=1501,sheetContentHeight=202 } )
	-- 		map12sheeto3=graphics.newImageSheet( "carte/level12/3.png", { width=1564, height=209, numFrames=1,sheetContentWidth=1564,sheetContentHeight=209 } )
	-- 		if desert==nil then
	-- 			serpent=graphics.newImageSheet( "carte/level9/snake.png", { width=52, height=64, numFrames=16 } )
	-- 			serpentseq =
	-- 			{
	-- 			    name="liq",
	-- 			    frames= {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}, -- frame indexes of animation, in image sheet
	-- 			    time = 3000,           -- Optional. In ms.  If not supplied, then sprite is frame-based.
	-- 			    -- deplacement
	-- 			   loopCount=1         -- Optional. Default is 0.
	-- 			} 
	-- 			scorpion=graphics.newImageSheet( "carte/level9/scorpion.png", { width=33, height=23, numFrames=4 } )
	-- 			scorpionseq =
	-- 			{
	-- 				name="liq",
	-- 				frames= {1,2,3,4,1,2,3,4,1,2,3,4}, -- frame indexes of animation, in image sheet
	-- 				time = 3000,           -- Optional. In ms.  If not supplied, then sprite is frame-based.
	-- 				loopCount=1
	-- 			} 
	-- 			scorpionseq1 =
	-- 			{
	-- 				time = 3000,           -- Optional. In ms.  If not supplied, then sprite is frame-based.
	-- 				x1=-150,
	-- 				y1=30         -- Optional. Default is 0.
	-- 			} 
	-- 			desert=true
	-- 		end
	-- 		if poisson==nil then
	-- 			poisson=graphics.newImageSheet( "carte/level12/poisson.png", { width=461, height=157, numFrames=7 } )
	-- 			poissonseq =
	-- 			{
	-- 			    name="liq",
	-- 			    frames= {1,2,3,4,5,6,7}, -- frame indexes of animation, in image sheet
	-- 			    time = 1500,           -- Optional. In ms.  If not supplied, then sprite is frame-based.
	-- 			   loopCount=1         -- Optional. Default is 0.
	-- 			} 
	-- 			requin=graphics.newImageSheet( "carte/level12/requin.png", { width=191, height=106, numFrames=1 } )
	-- 			requinseq =
	-- 			{
	-- 			   time=2000,
	-- 			   x1=150,
	-- 			   y1=100,
	-- 			  -- onComplete=removeimage
	-- 			} 
	-- 		end
	-- 	end
	-- 	hg=display.newImage(map12sheethg,1) --display.newImage( "carte/level2/hg.png", -1024,-512,true )
	-- 	hg.x=-1024
	-- 	hg.y=-512
	-- 	hd=display.newImage(map12sheethd,1) --display.newImage( "carte/level2/hd.png",1024,-512,true )
	-- 	hd.x=1024
	-- 	hd.y=-512
	-- 	bg=display.newImage(map12sheetbg,1) --display.newImage( "carte/level2/bg.png", -1024,512,true )
	-- 	bg.x=-1024
	-- 	bg.y=512
	-- 	bd=display.newImage(map12sheetbd,1) --display.newImage( "carte/level2/bd.png", 1024,512,true )
	-- 	bd.x=1024
	-- 	bd.y=512
	-- 	-- hg=display.newImage( "carte/level3/hg.png", -1024,-512,true )
	-- 	-- hd=display.newImage( "carte/level3/hd.png",1024,-512,true )
	-- 	-- bg=display.newImage( "carte/level3/bg.png", -1024,512,true )
	-- 	-- bd=display.newImage( "carte/level3/bd.png", 1024,512,true )
	-- 	if pole==0 then
	-- 		map1=display.newGroup()
	-- 		map1:insert(hg)
	-- 		map1:insert(hd)
	-- 		map1:insert(bg)
	-- 		map1:insert(bd)
	-- 	elseif pole==1 then
	-- 		print(map2)
	-- 		map2=display.newGroup()
	-- 		map2:insert(hg)
	-- 		map2:insert(hd)
	-- 		map2:insert(bg)
	-- 		map2:insert(bd)
	-- 	end
	-- end
	--map1= display.newImage( "carte/level2/carte1a.png", 0,0,true )--devrai etre en local pour niveau1
	-- map1p = display.newCircle(0,0,10)      --nil--display.newImage( "carte/level2/carte1p.png", 0,0,true )
	-- map1p.isVisible=false
	pouvoirdisp=3
	-- modeinfini=true
	t=1
end
t.affichagecarte=function(pole)	
		if donneecharger[12]==0 then
			donneecharger[12]=1
			map12sheethg=graphics.newImageSheet( "carte/level12/hg.jpg", { width=2048, height=1024, numFrames=1,sheetContentWidth=2048,sheetContentHeight=1024 } )
			map12sheethd=graphics.newImageSheet( "carte/level12/hd.jpg", { width=2048, height=1024, numFrames=1,sheetContentWidth=2048,sheetContentHeight=1024 } )
			map12sheetbg=graphics.newImageSheet( "carte/level12/bg.jpg", { width=2048, height=1024, numFrames=1,sheetContentWidth=2048,sheetContentHeight=1024 } )
			map12sheetbd=graphics.newImageSheet( "carte/level12/bd.jpg", { width=2048, height=1024, numFrames=1 ,sheetContentWidth=2048,sheetContentHeight=1024} )
			map12sheeto1=graphics.newImageSheet( "carte/level12/1.png", { width=147, height=210, numFrames=1,sheetContentWidth=147,sheetContentHeight=210 } )
			map12sheeto2=graphics.newImageSheet( "carte/level12/2.png", { width=1501, height=202, numFrames=1,sheetContentWidth=1501,sheetContentHeight=202 } )
			map12sheeto3=graphics.newImageSheet( "carte/level12/3.png", { width=1564, height=209, numFrames=1,sheetContentWidth=1564,sheetContentHeight=209 } )
			if desert==nil then
				serpent=graphics.newImageSheet( "carte/level9/snake.png", { width=52, height=64, numFrames=16 } )
				serpentseq =
				{
				    name="liq",
				    frames= {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}, -- frame indexes of animation, in image sheet
				    time = 3000,           -- Optional. In ms.  If not supplied, then sprite is frame-based.
				    -- deplacement
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
			if tentacule==nil then
				tentacule=graphics.newImageSheet( "carte/level12/tentacule.png", { width=28, height=36, numFrames=11 } )
				tentaculeseq =
				{
				    name="liq",
				    frames= {1,2,3,4,5,6,7,8,9,10,11,11,10,9,8,7,6,5,4,3,2,1}, -- frame indexes of animation, in image sheet
				    time = 3000,           -- Optional. In ms.  If not supplied, then sprite is frame-based.
				   loopCount=1         -- Optional. Default is 0.
				} 
			end
		end
		hg=display.newImage(map12sheethg,1) --display.newImage( "carte/level2/hg.png", -1024,-512,true )
		hg.x=-1024
		hg.y=-512
		hd=display.newImage(map12sheethd,1) --display.newImage( "carte/level2/hd.png",1024,-512,true )
		hd.x=1024
		hd.y=-512
		bg=display.newImage(map12sheetbg,1) --display.newImage( "carte/level2/bg.png", -1024,512,true )
		bg.x=-1024
		bg.y=512
		bd=display.newImage(map12sheetbd,1) --display.newImage( "carte/level2/bd.png", 1024,512,true )
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
	local tunededep=1000
	local nbperso=leveldata[12].life
	if modeinfini or modesquelette then
		tunededep=tunedep
		nbperso=10
	end
	argentdep=-(tunededep)*3--hugo-------------------------------------------------------------------
	ennemipassedep=nbperso--nombre d'ennemi qui peuvent encore passer avant qu'on perdre---hugo------------------------------------------------------------------------------------------------------------------
	
end
t.chemi=function()--donnees sur les differents points de la carte
local point= require( "point" )
genepointinit=27
----------------------------------------------------------------------------------------hugo debut -----------------------------------------------------------------------
pointdep={}--entré secondaire 
pointdep[1]=28
pointdep[2]=33

cheminarr={} --si des chemins sont des arrivés
cheminarr[1]=62 --fin numero 2 du chemin

intersection={}
intersection.nb=10
intersection[1]={pt=10, ty=1, un=13, deux=17, proba=1}
intersection[2]={pt=31, ty=0, un=19}
intersection[3]={pt=39, ty=1, un=42, deux=46, proba=1}
intersection[10]={pt=43, ty=0, un=18}
intersection[4]={pt=44, ty=0, un=18}
intersection[5]={pt=14, ty=0, un=46}
intersection[6]={pt=15, ty=0, un=47}
intersection[7]={pt=55, ty=1, un=57, deux=67, proba=1}
intersection[8]={pt=65, ty=0 ,un=58}
intersection[9]={pt=26, ty=1, un=64, deux=71, proba=1}
--intersection[10]={pt=69, ty=0 ,un=57}

cheminnb=75-- --nombre de point definisant le chemin -1--------------------------------------------------------------------------------------------------
chemin={}
chemin[1]=point.new(-614,193)
chemin[2]=point.new(-570,183)
chemin[3]=point.new(-530,162)
chemin[4]=point.new(-492,144)
chemin[5]=point.new(-456,116)
chemin[6]=point.new(-416,97)
chemin[7]=point.new(-375,84)
chemin[8]=point.new(-331,73)
chemin[9]=point.new(-289,64)
chemin[10]=point.new(-248,59)
chemin[11]=point.new(-208,58)
chemin[12]=point.new(-201,12)--
chemin[13]=point.new(-188,-30)--
chemin[14]=point.new(-177,-75)--
chemin[15]=point.new(-141,-97)
chemin[16]=point.new(-167,66)
chemin[17]=point.new(-121,66)
chemin[18]=point.new(-79,72)
chemin[19]=point.new(-37,79)
chemin[20]=point.new(7,74)
chemin[21]=point.new(52,74)
chemin[22]=point.new(96,68)
chemin[23]=point.new(140,66)
chemin[24]=point.new(182,68)
chemin[25]=point.new(226,66)
chemin[26]=point.new(270,71)
chemin[27]=point.new(312,77)
chemin[28]=point.new(0,302)
chemin[29]=point.new(-23,264)
chemin[30]=point.new(-44,224)
chemin[31]=point.new(-57,180)
chemin[32]=point.new(-63,136)
chemin[33]=point.new(-452,-308)
chemin[34]=point.new(-426,-275)
chemin[35]=point.new(-404,-235)
chemin[36]=point.new(-372,-204)
chemin[37]=point.new(-341,-174)
chemin[38]=point.new(-304,-150)
chemin[39]=point.new(-265,-130)
chemin[40]=point.new(-224,-117)
chemin[41]=point.new(-196,-83)--
chemin[42]=point.new(-190,-44)--
chemin[43]=point.new(-182,-2)
chemin[44]=point.new(-178,37)--39
chemin[45]=point.new(-178,43) --(-144,-104)
chemin[46]=point.new(-102,-98)
chemin[47]=point.new(-63,-87)
chemin[48]=point.new(-22,-78)
chemin[49]=point.new(20,-80)
chemin[50]=point.new(60,-78)
chemin[51]=point.new(106,-78)
chemin[52]=point.new(146,-78)
chemin[53]=point.new(185,-77)
chemin[54]=point.new(231,-78)
chemin[55]=point.new(275,-73)
chemin[56]=point.new(319,-72)
chemin[57]=point.new(363,-77)
chemin[58]=point.new(403,-88)
chemin[59]=point.new(441,-114)
chemin[60]=point.new(480,-137)
chemin[61]=point.new(522,-148)
chemin[62]=point.new(566,-150)
chemin[63]=point.new(608,-152)
chemin[64]=point.new(348,54)
chemin[65]=point.new(363,15)
chemin[66]=point.new(382,-26)
chemin[67]=point.new(361,-36)
chemin[68]=point.new(366,6)
chemin[69]=point.new(372,50)
chemin[70]=point.new(398,86)
chemin[71]=point.new(438,103)
chemin[72]=point.new(477,129)
chemin[73]=point.new(517,152)
chemin[74]=point.new(561,160)
chemin[75]=point.new(602,168)
chemin[76]=point.new(610,173)

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
obstacle[1]=point.new(-408,157)
-- obstacle[2]=point.new(-360,185)
-- obstacle[3]=point.new(-307,147)
-- obstacle[4]=point.new(-305,177)
obstacle[2]=point.new(-250,128)
obstacle[3]=point.new(-157,138)
obstacle[4]=point.new(-198,121)
-- obstacle[8]=point.new(-227,173)
-- obstacle[9]=point.new(-247,194)
obstacle[5]=point.new(36,271)
obstacle[6]=point.new(21,235)
obstacle[7]=point.new(62,234)
obstacle[8]=point.new(265,207)
obstacle[9]=point.new(392,206)
obstacle[10]=point.new(290,-152)
obstacle[11]=point.new(-424,-108)
obstacle[12]=point.new(-430,-30)
obstacle[13]=point.new(-419,32)
obstacle[14]=point.new(-424,-71)
obstacle[15]=point.new(-424,1)
obstacle[16]=point.new(254,-220)
obstacle[17]=point.new(200,-230)
obstacle[18]=point.new(145,-226)
obstacle[19]=point.new(90,-222)
obstacle[20]=point.new(36,-226)
obstacle[21]=point.new(-19,-220)
obstacle[22]=point.new(-42,-173)
obstacle[23]=point.new(-1,-274)
obstacle[24]=point.new(54,-291)
obstacle[25]=point.new(107,-300)
obstacle[26]=point.new(162,-296)
obstacle[27]=point.new(227,-287)
obstacle[28]=point.new(-455,48)
obstacle[29]=point.new(-463,3)
obstacle[30]=point.new(-450,-67)
obstacle[31]=point.new(-440,-139)
obstacle[32]=point.new(-382,-162)
obstacle[33]=point.new(-360,139)
obstacle1nb=20--nombre de point definisant le nombre de point du gros obstacle
obstacle1={}--gros cercle
obstacle1[1]=point.new(345,297)
obstacle1[2]=point.new(590,294)
obstacle1[3]=point.new(470,300)
obstacle1[4]=point.new(187,303)
obstacle1[5]=point.new(612,9)
obstacle1[6]=point.new(543,4)
obstacle1[7]=point.new(603,-304)
obstacle1[8]=point.new(507,-298)
obstacle1[9]=point.new(385,-267)
obstacle1[10]=point.new(-359,-304)
obstacle1[11]=point.new(-221,-280)
obstacle1[12]=point.new(-148,-274)
obstacle1[13]=point.new(-606,-304)
obstacle1[14]=point.new(-588,-192)
obstacle1[15]=point.new(-603,-74)
obstacle1[16]=point.new(-601,79)
obstacle1[17]=point.new(-611,300)
obstacle1[18]=point.new(-469,292)
obstacle1[19]=point.new(-147,299)
obstacle1[20]=point.new(-310,238)

obstaclsold={}
obstaclsold.nb=6 --nombre d'obstacle ou les soldats ne peuvent pas aller.
 obstaclsold[1]=point.new(-330,159)
 obstaclsold[1].rayon=4444
 obstaclsold[2]=point.new(-160,188)
 obstaclsold[2].rayon=4444
 obstaclsold[3]=point.new(80,219)
 obstaclsold[3].rayon=4444
 obstaclsold[4]=point.new(-439,32)
 obstaclsold[4].rayon=4444
 obstaclsold[5]=point.new(-418,-152)
 obstaclsold[5].rayon=4444
 obstaclsold[6]=point.new(314,-137)
 obstaclsold[6].rayon=2222

--mine:
mineinfo={}
mineinfo.nb=1
-- local i=0
-- while i<=mineinfo.nb do
-- 	mineinfo[i]={}
-- end
mineinfo[1]=point.new(180,-150)
mineinfo[1].nbmine=1

obstaclsold={}
obstaclsold.nb=0 --nombre d'obstacle ou les soldats ne peuvent pas aller.

 end
t.obsim=function()
if obstacleim==nil then
	obstacleim={}
end
local coordonneedu=#obstacleim+1

-- #obstacleim=3--1
-- --exemple
-- obstacleim={}
-- obstacleim[1]=display.newImage( "carte/level2/bdp.png", 550,140,true )
-- obstacleim[1].xScale=0.2
-- obstacleim[1].yScale=0.2
obstacleim[coordonneedu]=nil
obstacleim[coordonneedu]=display.newImage(map12sheeto1,1)
obstacleim[coordonneedu].x=-1250.5
obstacleim[coordonneedu].y=27
obstacleim[coordonneedu+1]=nil
obstacleim[coordonneedu+1]=display.newImage(map12sheeto2,1)
obstacleim[coordonneedu+1].x=274.5
obstacleim[coordonneedu+1].y=-196
obstacleim[coordonneedu+2]=nil
obstacleim[coordonneedu+2]=display.newImage(map12sheeto3,1)
obstacleim[coordonneedu+2].x=261
obstacleim[coordonneedu+2].y=48.5


--#obstacleanim=0

--decoranim=nil
if decoranim==nil then
	decoranim={}
end
coordonneedu=#decoranim+1
decoranim[coordonneedu]=nil
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
decoranim[coordonneedu]=nil
decoranim[coordonneedu]=display.newSprite(poisson,poissonseq)
decoranim[coordonneedu]:setSequence( "liq" )
decoranim[coordonneedu]:play()
decoranim[coordonneedu].x=-520
decoranim[coordonneedu].y=-125
decoranim[coordonneedu].xScale=0.2
decoranim[coordonneedu].yScale=decoranim[coordonneedu].xScale
decoranim[coordonneedu].posi=0 --0 pour coordonnée donnée donc decoranim[1].x1=XX et decoranim[1].x2=XX ,1 pour random sur les zones contructible, 2 pour sur le chemin
decoranim[coordonneedu].cadence=8000 --tout les combien de temps se produit l'anim

coordonneedu=#decoranim+1
decoranim[coordonneedu]=nil
decoranim[coordonneedu]=display.newSprite(tentacule,tentaculeseq)
decoranim[coordonneedu]:setSequence( "liq" )
decoranim[coordonneedu]:play()
decoranim[coordonneedu].x=250
decoranim[coordonneedu].y=-250
decoranim[coordonneedu].xScale=0.8
decoranim[coordonneedu].yScale=decoranim[coordonneedu].xScale
decoranim[coordonneedu].posi=0 --0 pour coordonnée donnée donc decoranim[1].x1=XX et decoranim[1].x2=XX ,1 pour random sur les zones contructible, 2 pour sur le chemin
decoranim[coordonneedu].cadence=8150 --tout les combien de temps se produit l'anim

coordonneedu=#decoranim+1
decoranim[coordonneedu]=nil
decoranim[coordonneedu]=display.newSprite(tentacule,tentaculeseq)
decoranim[coordonneedu]:setSequence( "liq" )
decoranim[coordonneedu]:play()
decoranim[coordonneedu].x=400
decoranim[coordonneedu].y=-250
decoranim[coordonneedu].xScale=1.4
decoranim[coordonneedu].yScale=decoranim[coordonneedu].xScale
decoranim[coordonneedu].posi=0 --0 pour coordonnée donnée donc decoranim[1].x1=XX et decoranim[1].x2=XX ,1 pour random sur les zones contructible, 2 pour sur le chemin
decoranim[coordonneedu].cadence=8200 --tout les combien de temps se produit l'anim

coordonneedu=#decoranim+1
decoranim[coordonneedu]=nil
decoranim[coordonneedu]=display.newSprite(tentacule,tentaculeseq)
decoranim[coordonneedu]:setSequence( "liq" )
decoranim[coordonneedu]:play()
decoranim[coordonneedu].x=520
decoranim[coordonneedu].y=-255
decoranim[coordonneedu].xScale=0.8
decoranim[coordonneedu].yScale=decoranim[coordonneedu].xScale
decoranim[coordonneedu].xScale=-decoranim[coordonneedu].xScale
decoranim[coordonneedu].posi=0 --0 pour coordonnée donnée donc decoranim[1].x1=XX et decoranim[1].x2=XX ,1 pour random sur les zones contructible, 2 pour sur le chemin
decoranim[coordonneedu].cadence=8100 --tout les combien de temps se produit l'anim

coordonneedu=#decoranim+1
decoranim[coordonneedu]=nil
decoranim[coordonneedu]=display.newImage(requin,1)
decoranim[coordonneedu].x=0
decoranim[coordonneedu].y=0
decoranim[coordonneedu].xdep=-120
decoranim[coordonneedu].ydep=-260
decoranim[coordonneedu].xScale=0.25
decoranim[coordonneedu].yScale=decoranim[coordonneedu].xScale
decoranim[coordonneedu].posi=-1 -- -1 pour transition au coordonnée donnée, -2 pareil que 1 et -3 pareil que 2, 0 pour coordonnée donnée donc decoranim[1].x1=XX et decoranim[1].x2=XX ,1 pour random sur les zones contructible, 2 pour sur le chemin
decoranim[coordonneedu].para=requinseq
decoranim[coordonneedu].para.y1=0
decoranim[coordonneedu].para.x1=150
decoranim[coordonneedu].cadence=8000 --tout les combien de temps se produit l'anim

coordonneedu=#decoranim+1
decoranim[coordonneedu]=nil
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
decoranim[coordonneedu].cadence=7000 --tout les combien de temps se produit l'anim

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


decoration={}
decoration[1]={}
decoration[1].x=50
decoration[1].y=149
decoration[1].type=35
decoration[1].planche=1
decoration[1].scale=0.15
decoration[2]={}
decoration[2].x=219
decoration[2].y=126
decoration[2].type=34
decoration[2].planche=1
decoration[2].scale=0.2
------------------------------------------------------------fin hugo---------------------------------------------------------------
end
t.vague=function()--donnees sur les vagues du niveau
vague={}
--nbvague=3--15
for k=1,leveldata[12].wave,1 do
	vague[k]={}
	vague[k][1]=200
end
vague[1]={-2,5,251,251,251,251,251,0,0,0,0,0,0,-2,8,251,251,251,251,251,251,251,251,0,0,0,-2,6,252,252,252,252,252,252,0,0,0,0,0,0,0,0,0,0,0,0,-2,3,251,251,251,1,-2,3,251,251,251,1,-2,3,251,251,251,0,0,0,0,0,0,0,0,0,0,0,-2,3,270,270,270,-2,3,270,270,270,-2,3,270,270,270,0,-2,3,270,270,270,0,1,-2,3,270,270,270,0,1,-2,3,270,270,270,0,1,-2,3,270,270,270,0,-2,6,252,252,252,252,252,252,0,0,-2,3,252,252,252,0,-2,3,252,252,252,0,0,0,-2,253,0,0,0,0,0,0,0,0,-2,251}
vague[2]={-2,3,253,253,253,0,0,0,0,0,0,0,0,0,0,-2,6,252,252,252,252,252,252,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-2,3,251,251,251,-2,3,251,251,251,-2,3,251,251,251,0,0,0,0,0,-2,2,272,272,-2,2,272,272,0,0,-2,3,270,270,270,0,0,-2,3,270,270,270,0,0,-2,3,253,253,253,0,0,0,0,0,0,-2,3,253,253,253,0,0,0,0,0,0,-2,3,253,253,253,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-2,9,252,252,252,252,252,252,252,252,252,0,-2,9,252,252,252,252,252,252,252,252,252,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-2,9,251,251,251,251,251,251,251,251,251,0,-2,9,251,251,251,251,251,251,251,251,251,0,-2,9,251,251,251,251,251,251,251,251,251,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-2,9,252,252,252,252,252,252,252,252,252,0,-2,9,252,252,252,252,252,252,252,252,252,-2,9,252,252,252,252,252,252,252,252,252,0,-2,9,252,252,252,252,252,252,252,252,252,0,0,0,0,0,0,0,0,0,0,252}
vague[3]={2,253,253,0,0,0,0,0,0,0,9,272,251,272,251,272,251,272,251,251,0,0,0,0,0,0,0,4,252,252,252,252,5,251,251,251,251,251,3,253,253,253,2,270,270,0,0,0,0,0,0,0,0,0,0,0,0,0,253,253,253,253,253,253,253,0,253,253,253,253,253,0,253,253,253,253,253,253,0,0,0,0,0,0,0,0,0,0,0,0,0,272,272,272,272,272,272,272,272,272,272,272,272,272,272,272,0,0,0,0,0,0,0,0,0,0,0,0,5,270,270,270,270,270,0,0,0,0,9,251,251,251,251,251,251,251,251,251,9,251,251,251,251,251,251,251,251,251,0,0,0,0,0,0,0,9,252,252,252,252,252,252,252,252,252,9,252,252,252,252,252,252,252,252,252,0,0,0,0,0,0,253,253,253,253,253,253,253,253,253,0,0,0,0,253,253,253,253,253,253,253,253,253,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,251}
vague[4]={2,263,263,2,263,263,2,263,263,2,263,263,2,263,263,2,263,263,2,263,263,2,263,263,2,263,263,2,263,263,2,263,263,2,263,263,0,0,0,0,0,0,9,214,214,214,214,214,214,214,214,214,9,214,214,214,214,214,214,214,214,214,9,214,214,214,214,214,214,214,214,214,0,0,0,0,0,0,0,9,253,253,253,253,253,253,253,253,253,9,253,253,253,253,253,253,253,253,253,9,253,253,253,253,253,253,253,253,253,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,5,266,266,266,266,266,0,0,0,0,0,0,0,0,0,0,0,251}
vague[5]={-1,9,202,202,202,202,202,202,202,202,202,0,0,-1,9,202,202,202,202,202,202,202,202,202,0,0,-1,9,202,202,202,202,202,202,202,202,202,0,0,-1,9,202,202,202,202,202,202,202,202,202,0,0,0,0,0,0,-1,2,268,268,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,204,-1,2,204,204,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,251}
vague[6]={9,251,251,251,251,251,251,251,251,251,-1,9,251,251,251,251,251,251,251,251,251,-2,9,251,251,251,251,251,251,251,251,251,0,0,0,0,0,0,0,0,9,252,252,252,252,252,252,252,252,252,-1,9,252,252,252,252,252,252,252,252,252,-2,9,252,252,252,252,252,252,252,252,252,0,0,0,0,0,0,0,0,0,0,0,0,9,253,253,253,253,253,253,253,253,253,-1,9,253,253,253,253,253,253,253,253,253,-2,9,253,253,253,253,253,253,253,253,253,0,0,0,0,0,0,0,0,0,0,268,-1,268,-2,268,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,251}
vague[7]={268,0,-1,268,0,-2,268,0,0,0,0,0,0,0,0,0,0,0,9,253,253,253,253,253,253,253,253,253,-1,9,253,253,253,253,253,253,253,253,253,-2,9,253,253,253,253,253,253,253,253,253,0,0,0,0,0,0,0,0,0,9,252,252,252,252,252,252,252,252,252,-1,9,252,252,252,252,252,252,252,252,252,-2,9,252,252,252,252,252,252,252,252,252,0,0,0,0,0,0,0,0,0,0,9,251,251,251,251,251,251,251,251,251,-1,9,251,251,251,251,251,251,251,251,251,-2,9,251,251,251,251,251,251,251,251,251,0,0,0,0,0,0,0,0,0,251}
vague[8]={251,0,0,0,0,2,268,204,-1,2,268,204,-2,2,268,204,0,0,0,0,0,204,-1,204,-2,204,0,0,0,0,0,0,0,0,251}
vague[9]={3,266,266,263,-1,3,266,263,263,-2,3,266,266,263,0,0,0,0,0,5,263,263,263,263,263,-1,5,263,263,263,263,263,-2,5,263,263,263,263,263,0,0,0,0,0,0,0,9,270,270,270,270,270,270,270,270,270,-1,9,270,270,270,270,270,270,270,270,270,-2,9,270,270,270,270,270,270,270,270,270,9,270,270,270,270,270,270,270,270,270,-1,9,270,270,270,270,270,270,270,270,270,-2,9,270,270,270,270,270,270,270,270,270,0,0,0,0,4,204,204,204,204,-1,4,204,204,204,204,-2,4,204,204,204,204,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,251}
vague[10]={219,0,0,0,0,0,0,0,0,0,0,0,0,0,3,219,219,219,-1,3,219,219,219,-2,3,219,219,219,3,202,202,202,-1,3,202,202,202,-2,3,202,202,202,3,219,219,219,-1,3,219,219,219,-2,3,219,219,219,3,202,202,202,-1,3,202,202,202,-2,3,202,202,202,3,219,219,219,-1,3,219,219,219,-2,3,219,219,219,3,202,202,202,-1,3,202,202,202,-2,3,202,202,202,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,204,204,204,204,-1,4,204,204,204,204,-2,4,204,204,204,204,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,268,268,-1,2,268,268,-2,2,268,268,0,0,0,0,0,0,0,0,0,5,270,270,270,270,270,5,270,270,270,270,270,5,270,270,270,270,270,5,270,270,270,270,270,5,270,270,270,270,270}

-------------------------------------------------------------debut hugo-----------------------------------------------------
--0 retarde de la durer de spawn de 3 soldat et 1 de la durer de 1 soldat
--de 2 à 5 permet de spawner plusieurs soldat a la fois.
--vague[1].nb=2--nb soldat dans la vague

modeinfdif=0-- 0 pour facile, 1 pour normal, 2 pour difficile

end
t.vaguewave=function()
	vague={}
	vague[1]={-11,6,251,252,252,253,253,251,-1,6,251,252,252,253,253,251,-2,6,251,252,252,253,253,251,0,0,0,0,0,0,0,0,0,-15,9,227,227,227,227,227,227,227,227,227,-1,9,227,227,227,227,227,227,227,227,227,-2,9,227,227,227,227,227,227,227,227,227,9,227,227,227,227,227,227,227,227,227,-1,9,227,227,227,227,227,227,227,227,227,-2,9,227,227,227,227,227,227,227,227,227,-11,6,253,253,253,253,253,253,-1,6,253,253,253,253,253,253,-2,6,253,253,253,253,253,253,-15,9,227,227,227,227,227,227,227,227,227,-1,9,227,227,227,227,227,227,227,227,227,-2,9,227,227,227,227,227,227,227,227,227,9,227,227,227,227,227,227,227,227,227,-1,9,227,227,227,227,227,227,227,227,227,-2,9,227,227,227,227,227,227,227,227,227,0,0,0,0,0,225,-2,225}
end
return t
