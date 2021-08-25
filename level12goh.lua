

local t={} --niveau inf
t.new=function()--gestion du niveau 4 du jeu, doit toujours suivre le meme modele
	-- function affichagecarte (pole)	
	-- 	if donneecharger[12]==0 then
	-- 		donneecharger[12]=1
	-- 		map12sheethg=graphics.newImageSheet( "goh/carte/level12/hd.jpg", { width=2048, height=1024, numFrames=1,sheetContentWidth=2048,sheetContentHeight=1024 } )
	-- 		map12sheethd=graphics.newImageSheet( "goh/carte/level12/hg.jpg", { width=2048, height=1024, numFrames=1,sheetContentWidth=2048,sheetContentHeight=1024 } )
	-- 		map12sheetbg=graphics.newImageSheet( "goh/carte/level12/bd.jpg", { width=2048, height=1024, numFrames=1,sheetContentWidth=2048,sheetContentHeight=1024 } )
	-- 		map12sheetbd=graphics.newImageSheet( "goh/carte/level12/bg.jpg", { width=2048, height=1024, numFrames=1 ,sheetContentWidth=2048,sheetContentHeight=1024} )
	-- 		map12sheeto1=graphics.newImageSheet( "goh/carte/level12/1.jpg", { width=147, height=210, numFrames=1,sheetContentWidth=147,sheetContentHeight=210 } )
	-- 		map12sheeto2=graphics.newImageSheet( "goh/carte/level12/2.jpg", { width=1501, height=202, numFrames=1,sheetContentWidth=1501,sheetContentHeight=202 } )
	-- 		map12sheeto3=graphics.newImageSheet( "goh/carte/level12/3.jpg", { width=1564, height=209, numFrames=1,sheetContentWidth=1564,sheetContentHeight=209 } )
	-- 		if desert==nil then
	-- 			serpent=graphics.newImageSheet( "goh/carte/level9/snake.jpg", { width=52, height=64, numFrames=16 } )
	-- 			serpentseq =
	-- 			{
	-- 			    name="liq",
	-- 			    frames= {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}, -- frame indexes of animation, in image sheet
	-- 			    time = 3000,           -- Optional. In ms.  If not supplied, then sprite is frame-based.
	-- 			    -- deplacement
	-- 			   loopCount=1         -- Optional. Default is 0.
	-- 			} 
	-- 			scorpion=graphics.newImageSheet( "goh/carte/level9/scorpion.jpg", { width=33, height=23, numFrames=4 } )
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
	-- 			poisson=graphics.newImageSheet( "goh/carte/level12/poisson.jpg", { width=461, height=157, numFrames=7 } )
	-- 			poissonseq =
	-- 			{
	-- 			    name="liq",
	-- 			    frames= {1,2,3,4,5,6,7}, -- frame indexes of animation, in image sheet
	-- 			    time = 1500,           -- Optional. In ms.  If not supplied, then sprite is frame-based.
	-- 			   loopCount=1         -- Optional. Default is 0.
	-- 			} 
	-- 			requin=graphics.newImageSheet( "goh/carte/level12/requin.jpg", { width=191, height=106, numFrames=1 } )
	-- 			requinseq =
	-- 			{
	-- 			   time=2000,
	-- 			   x1=150,
	-- 			   y1=100,
	-- 			  -- onComplete=removeimage
	-- 			} 
	-- 		end
	-- 	end
	-- 	hg=display.newImage(map12sheethg,1) --display.newImage( "goh/carte/level2/hd.jpg", -1024,-512,true )
	-- 	hg.x=-1024
	-- 	hg.y=-512
	-- 	hd=display.newImage(map12sheethd,1) --display.newImage( "goh/carte/level2/hg.jpg",1024,-512,true )
	-- 	hd.x=1024
	-- 	hd.y=-512
	-- 	bg=display.newImage(map12sheetbg,1) --display.newImage( "goh/carte/level2/bd.jpg", -1024,512,true )
	-- 	bg.x=-1024
	-- 	bg.y=512
	-- 	bd=display.newImage(map12sheetbd,1) --display.newImage( "goh/carte/level2/bg.jpg", 1024,512,true )
	-- 	bd.x=1024
	-- 	bd.y=512
	-- 	-- hg=display.newImage( "goh/carte/level3/hd.jpg", -1024,-512,true )
	-- 	-- hd=display.newImage( "goh/carte/level3/hg.jpg",1024,-512,true )
	-- 	-- bg=display.newImage( "goh/carte/level3/bd.jpg", -1024,512,true )
	-- 	-- bd=display.newImage( "goh/carte/level3/bg.jpg", 1024,512,true )
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
	--map1= display.newImage( "goh/carte/level2/carte1a.jpg", 0,0,true )--devrai etre en local pour niveau1
	-- map1p = display.newCircle(0,0,10)      --nil--display.newImage( "goh/carte/level2/carte1p.jpg", 0,0,true )
	-- map1p.isVisible=false
	pouvoirdisp=3
	-- modeinfini=true
	t=1
end
t.affichagecarte=function(pole)	
		if donneecharger[12]==0 then
			donneecharger[12]=1
			map12sheethg=graphics.newImageSheet( "goh/carte/level12/hd.jpg", { width=2048, height=1024, numFrames=1,sheetContentWidth=2048,sheetContentHeight=1024 } )
			map12sheethd=graphics.newImageSheet( "goh/carte/level12/hg.jpg", { width=2048, height=1024, numFrames=1,sheetContentWidth=2048,sheetContentHeight=1024 } )
			map12sheetbg=graphics.newImageSheet( "goh/carte/level12/bd.jpg", { width=2048, height=1024, numFrames=1,sheetContentWidth=2048,sheetContentHeight=1024 } )
			map12sheetbd=graphics.newImageSheet( "goh/carte/level12/bg.jpg", { width=2048, height=1024, numFrames=1 ,sheetContentWidth=2048,sheetContentHeight=1024} )
			map12sheeto2=graphics.newImageSheet( "goh/carte/level12/left_bottm_trees.png", { width=1333, height=802, numFrames=1 ,sheetContentWidth=1333,sheetContentHeight=802} )
			map12sheeto3=graphics.newImageSheet( "goh/carte/level12/right_bttm_trees.png", { width=674, height=498, numFrames=1 ,sheetContentWidth=674,sheetContentHeight=498} )
			map12sheeto4=graphics.newImageSheet( "goh/carte/level12/top_left_trees.png", { width=907, height=810, numFrames=1 ,sheetContentWidth=907,sheetContentHeight=810} )
		end
		hg=display.newImage(map12sheethg,1) --display.newImage( "goh/carte/level2/hd.jpg", -1024,-512,true )
		hg.x=-1024
		hg.y=-512
		hd=display.newImage(map12sheethd,1) --display.newImage( "goh/carte/level2/hg.jpg",1024,-512,true )
		hd.x=1024
		hd.y=-512
		bg=display.newImage(map12sheetbg,1) --display.newImage( "goh/carte/level2/bd.jpg", -1024,512,true )
		bg.x=-1024
		bg.y=512
		bd=display.newImage(map12sheetbd,1) --display.newImage( "goh/carte/level2/bg.jpg", 1024,512,true )
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
chemin[1]=point.new(-617,186)	chemin[1].mechant=1.4	chemin[1].rayon=260000
chemin[2]=point.new(-577,165)	chemin[2].mechant=1.5	chemin[2].rayon=1000
chemin[3]=point.new(-539,143)	chemin[3].mechant=1.5	chemin[3].rayon=1000
chemin[4]=point.new(-502,124)	chemin[4].mechant=1.5	chemin[4].rayon=1000
chemin[5]=point.new(-460,108)	chemin[5].mechant=1.7	chemin[5].rayon=1000
chemin[6]=point.new(-418,92)	chemin[6].mechant=1.8	chemin[6].rayon=1000
chemin[7]=point.new(-377,75)	chemin[7].mechant=1.8	chemin[7].rayon=1000
chemin[8]=point.new(-333,61)	chemin[8].mechant=1.8	chemin[8].rayon=1000
chemin[9]=point.new(-291,51)	chemin[9].mechant=1.8	chemin[9].rayon=1000
chemin[10]=point.new(-244,42)	chemin[10].mechant=1.9	chemin[10].rayon=1000
chemin[11]=point.new(-212,20)	chemin[11].mechant=1.6	chemin[11].rayon=1000
chemin[12]=point.new(-205,-14)	chemin[12].mechant=1	chemin[12].rayon=1000
chemin[13]=point.new(-196,-43)	chemin[13].mechant=1	chemin[13].rayon=1000
chemin[14]=point.new(-183,-85)	chemin[14].mechant=1	chemin[14].rayon=1000
chemin[15]=point.new(-141,-97)	chemin[15].mechant=1.2	chemin[15].rayon=3000
chemin[16]=point.new(-168,62)	chemin[16].mechant=1.2	chemin[16].rayon=1000
chemin[17]=point.new(-123,74)	chemin[17].mechant=1.4	chemin[17].rayon=3000
chemin[18]=point.new(-81,82)	chemin[18].mechant=1.6	chemin[18].rayon=3000
chemin[19]=point.new(-37,83)	chemin[19].mechant=1.7	chemin[19].rayon=3000
chemin[20]=point.new(7,79)		chemin[20].mechant=1.3	chemin[20].rayon=3000
chemin[21]=point.new(52,78)		chemin[21].mechant=1.3	chemin[21].rayon=3000
chemin[22]=point.new(97,73)		chemin[22].mechant=1.1	chemin[22].rayon=3000
chemin[23]=point.new(138,73)	chemin[23].mechant=1.2	chemin[23].rayon=3000
chemin[24]=point.new(183,74)	chemin[24].mechant=1.4	chemin[24].rayon=3000
chemin[25]=point.new(226,76)	chemin[25].mechant=1.6	chemin[25].rayon=3000
chemin[26]=point.new(269,84)	chemin[26].mechant=1.5	chemin[26].rayon=3000
chemin[27]=point.new(320,93)	chemin[27].mechant=1.5	chemin[27].rayon=3000
chemin[28]=point.new(-4,311)	chemin[28].mechant=1.7	chemin[28].rayon=20000
chemin[29]=point.new(-36,269)	chemin[29].mechant=1.5	chemin[29].rayon=1000
chemin[30]=point.new(-54,220)	chemin[30].mechant=1.4	chemin[30].rayon=1000
chemin[31]=point.new(-64,179)	chemin[31].mechant=1.4	chemin[31].rayon=4000
chemin[32]=point.new(-71,131)	chemin[32].mechant=2	chemin[32].rayon=5000
chemin[33]=point.new(-456,-312)	chemin[33].mechant=1.5	chemin[33].rayon=60000
chemin[34]=point.new(-432,-264)	chemin[34].mechant=1.5	chemin[34].rayon=1000
chemin[35]=point.new(-409,-233)	chemin[35].mechant=1.6	chemin[35].rayon=1000
chemin[36]=point.new(-373,-203)	chemin[36].mechant=1.5	chemin[36].rayon=1000
chemin[37]=point.new(-341,-172)	chemin[37].mechant=1.5	chemin[37].rayon=1000
chemin[38]=point.new(-307,-150)	chemin[38].mechant=1.4	chemin[38].rayon=1000
chemin[39]=point.new(-265,-128)	chemin[39].mechant=1.4	chemin[39].rayon=30000
chemin[40]=point.new(-226,-107)	chemin[40].mechant=1.7	chemin[40].rayon=1000
chemin[41]=point.new(-193,-78)	chemin[41].mechant=1.2	chemin[41].rayon=1000
chemin[42]=point.new(-191,-40)	chemin[42].mechant=0.8	chemin[42].rayon=1000
chemin[43]=point.new(-195,4)	chemin[43].mechant=1	chemin[43].rayon=1000
chemin[44]=point.new(-180,42)	chemin[44].mechant=1	chemin[44].rayon=1000
chemin[45]=point.new(-172,57)	chemin[45].mechant=1.2	chemin[45].rayon=1000
chemin[46]=point.new(-101,-90)	chemin[46].mechant=1.3	chemin[46].rayon=3000
chemin[47]=point.new(-66,-85)	chemin[47].mechant=1.4	chemin[47].rayon=3000
chemin[48]=point.new(-23,-78)	chemin[48].mechant=1.4	chemin[48].rayon=3000
chemin[49]=point.new(21,-75)	chemin[49].mechant=1.2	chemin[49].rayon=3000
chemin[50]=point.new(59,-73)	chemin[50].mechant=1.1	chemin[50].rayon=3000
chemin[51]=point.new(107,-71)	chemin[51].mechant=1	chemin[51].rayon=3000
chemin[52]=point.new(144,-70)	chemin[52].mechant=1	chemin[52].rayon=3000
chemin[53]=point.new(186,-68)	chemin[53].mechant=1	chemin[53].rayon=3000
chemin[54]=point.new(230,-67)	chemin[54].mechant=1	chemin[54].rayon=3000
chemin[55]=point.new(273,-69)	chemin[55].mechant=1	chemin[55].rayon=3000
chemin[56]=point.new(318,-73)	chemin[56].mechant=1.3	chemin[56].rayon=3000
chemin[57]=point.new(363,-76)	chemin[57].mechant=2	chemin[57].rayon=3000
chemin[58]=point.new(398,-98)	chemin[58].mechant=1.6	chemin[58].rayon=6000
chemin[59]=point.new(441,-119)	chemin[59].mechant=1.2	chemin[59].rayon=6000
chemin[60]=point.new(481,-134)	chemin[60].mechant=1.2	chemin[60].rayon=6000
chemin[61]=point.new(523,-146)	chemin[61].mechant=1.2	chemin[61].rayon=1000
chemin[62]=point.new(565,-160)	chemin[62].mechant=1.2	chemin[62].rayon=1000
chemin[63]=point.new(617,-166)	chemin[63].mechant=1	chemin[63].rayon=26000
chemin[64]=point.new(357,59)	chemin[64].mechant=0.6	chemin[64].rayon=1000
chemin[65]=point.new(369,13)	chemin[65].mechant=1.2	chemin[65].rayon=5000
chemin[66]=point.new(378,-32)	chemin[66].mechant=1.2	chemin[66].rayon=5000
chemin[67]=point.new(348,-37)	chemin[67].mechant=1	chemin[67].rayon=4000
chemin[68]=point.new(367,5)		chemin[68].mechant=1.6	chemin[68].rayon=5000
chemin[69]=point.new(375,46)	chemin[69].mechant=1.2	chemin[69].rayon=4000
chemin[70]=point.new(394,96)	chemin[70].mechant=2	chemin[70].rayon=1000
chemin[71]=point.new(432,119)	chemin[71].mechant=1.7	chemin[71].rayon=1000
chemin[72]=point.new(477,133)	chemin[72].mechant=1.5	chemin[72].rayon=1000
chemin[73]=point.new(518,147)	chemin[73].mechant=1.5	chemin[73].rayon=1000
chemin[74]=point.new(563,158)	chemin[74].mechant=1.5	chemin[74].rayon=1000
chemin[75]=point.new(598,162)	chemin[75].mechant=1.5	chemin[75].rayon=1000
chemin[76]=point.new(617,174)	chemin[76].mechant=1.6	chemin[76].rayon=75000

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
obstaclenb=20 --33--nombre de point definissant les petits obstacles
obstacle={}
obstacle[1]=point.new(-100,-102)
obstacle[2]=point.new(-66,-97)
obstacle[3]=point.new(-24,-89)
obstacle[4]=point.new(20,-87)
obstacle[5]=point.new(61,-82)
obstacle[6]=point.new(107,-82)
obstacle[7]=point.new(316,-88)
obstacle[8]=point.new(269,-82)
obstacle[9]=point.new(227,-78)
obstacle[10]=point.new(-124,49)
obstacle[11]=point.new(-78,52)
obstacle[12]=point.new(-33,56)
obstacle[13]=point.new(6,71)
obstacle[14]=point.new(51,68)
obstacle[15]=point.new(96,59)
obstacle[16]=point.new(138,59)
obstacle[17]=point.new(184,53)
obstacle[18]=point.new(228,56)
obstacle[19]=point.new(275,74)
obstacle[20]=point.new(325,81)
obstacle1nb=0 --20--nombre de point definisant le nombre de point du gros obstacle
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
obstaclsold.nb=0 --6 --nombre d'obstacle ou les soldats ne peuvent pas aller.
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
mineinfo[1]=point.new(180,-170)
mineinfo[1].nbmine=1

obstaclsold={}
obstaclsold.nb=0 --nombre d'obstacle ou les soldats ne peuvent pas aller.

 end
t.obsim=function()
if obstacleim==nil then
	obstacleim={}
end
obstacleim[1]=display.newImage(map12sheeto2,1)
obstacleim[1].anchorY=1
obstacleim[1].x=-1430
obstacleim[1].y=892
obstacleim[2]=display.newImage(map12sheeto3,1)
obstacleim[2].anchorY=1
obstacleim[2].x=1546
obstacleim[2].y=881
obstacleim[3]=display.newImage(map12sheeto4,1)
obstacleim[3].anchorY=1
obstacleim[3].x=-1472
obstacleim[3].y=-315
if decoranim==nil then
	decoranim={}
end
decoration={}
decoration[1]={}
decoration[1].x=467.5*0.3
decoration[1].y=935*0.3
decoration[1].type=6
decoration[1].planche=2
decoration[1].scale=0.3
decoration[1].anchorY=1
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
