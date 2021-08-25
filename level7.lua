

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
	if donneecharger[7]==0 then
		donneecharger[7]=1
		map7sheethg=graphics.newImageSheet( "carte/level7/hg.jpg", { width=2048, height=1024, numFrames=1,sheetContentWidth=2048,sheetContentHeight=1024 } )
		map7sheethd=graphics.newImageSheet( "carte/level7/hd.jpg", { width=2048, height=1024, numFrames=1,sheetContentWidth=2048,sheetContentHeight=1024 } )
		map7sheetbg=graphics.newImageSheet( "carte/level7/bg.jpg", { width=2048, height=1024, numFrames=1,sheetContentWidth=2048,sheetContentHeight=1024 } )
		map7sheetbd=graphics.newImageSheet( "carte/level7/bd.jpg", { width=2048, height=1024, numFrames=1,sheetContentWidth=2048,sheetContentHeight=1024 } )
		map7sheeto1=graphics.newImageSheet( "carte/level7/bg1.png", { width=407, height=851, numFrames=1,sheetContentWidth=407,sheetContentHeight=851 } )
		map7sheeto2=graphics.newImageSheet( "carte/level7/bg2.png", { width=1100, height=201, numFrames=1,sheetContentWidth=1100,sheetContentHeight=201 } )
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
	hg=display.newImage(map7sheethg,1) --display.newImage( "carte/level2/hg.png", -1024,-512,true )
	hg.x=-1024
	hg.y=-512
	hd=display.newImage(map7sheethd,1) --display.newImage( "carte/level2/hd.png",1024,-512,true )
	hd.x=1024
	hd.y=-512
	bg=display.newImage(map7sheetbg,1) --display.newImage( "carte/level2/bg.png", -1024,512,true )
	bg.x=-1024
	bg.y=512
	bd=display.newImage(map7sheetbd,1) --display.newImage( "carte/level2/bd.png", 1024,512,true )
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
	local tunededep=1100
	local nbperso=leveldata[7].life
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
pointdep={}
pointdep[1]=15
pointdep[2]=24
pointdep[3]=41
pointdep[4]=49

pointdeppro={}
pointdeppro[2]=0.4 -- probabilité pour le levelinf de l'entré numero i (pointdep[i+1]) , pour une meme probabilité que sur les autres entré mettre 0.5. Min 0, max 1, avec deux chiffres apres la virgule max
pointdeppro[3]=0.4
pointdeppro[4]=0.1
pointdeppro[5]=0.1


intersection={}
intersection.nb=1
--exemple
intersection={}
intersection.nb=5
 intersection[1]={pt=22, ty=0, un=12}
 intersection[2]={pt=33, ty=0, un=12}
 intersection[3]={pt=47, ty=0, un=56}
 intersection[4]={pt=13, ty=0, un=35}
 intersection[5]={pt=39, ty=0, un=57}
 intersection[6]={pt=54, ty=0, un=57}
cheminnb=65-- --nombre de point definisant le chemin -1--------------------------------------------------------------------------------------------------
chemin={}
chemin[1]=point.new(-604,18)
chemin[2]=point.new(-604,18)
chemin[3]=point.new(-543,34)
chemin[4]=point.new(-484,42)
chemin[5]=point.new(-442,44)
chemin[6]=point.new(-399,44)
chemin[7]=point.new(-359,40)
chemin[8]=point.new(-315,39)
chemin[9]=point.new(-271,34)
chemin[10]=point.new(-227,29)
chemin[11]=point.new(-183,18)
chemin[12]=point.new(-143,9)
chemin[13]=point.new(-99,0)
chemin[14]=point.new(-60,-7)
chemin[15]=point.new(-375,-298)
chemin[16]=point.new(-364,-256)
chemin[17]=point.new(-351,-217)
chemin[18]=point.new(-325,-181)
chemin[19]=point.new(-289,-152)
chemin[20]=point.new(-253,-122)
chemin[21]=point.new(-253,-121)
chemin[22]=point.new(-221,-88)
chemin[23]=point.new(-196,-57)
chemin[24]=point.new(-450,300)
chemin[25]=point.new(-445,300)
chemin[26]=point.new(-442,250)
chemin[27]=point.new(-411,222)
chemin[28]=point.new(-373,204)
chemin[29]=point.new(-334,183)
chemin[30]=point.new(-292,159)
chemin[31]=point.new(-253,131)
chemin[32]=point.new(-219,105)
chemin[33]=point.new(-188,74)
chemin[34]=point.new(-154,38)
chemin[35]=point.new(-16,-10)
chemin[36]=point.new(26,-4)
chemin[37]=point.new(63,1)
chemin[38]=point.new(106,8)
chemin[39]=point.new(148,18)
chemin[40]=point.new(185,26)
chemin[41]=point.new(28,-306)
chemin[42]=point.new(28,-265)
chemin[43]=point.new(29,-220)
chemin[44]=point.new(34,-176)
chemin[45]=point.new(49,-139)
chemin[46]=point.new(70,-101)
chemin[47]=point.new(93,-65)
chemin[48]=point.new(112,-26)
chemin[49]=point.new(-25,303)
chemin[50]=point.new(-16,263)
chemin[51]=point.new(7,224)
chemin[52]=point.new(36,190)
chemin[53]=point.new(62,152)
chemin[54]=point.new(84,112)
chemin[55]=point.new(105,69)
chemin[56]=point.new(136,38)
chemin[57]=point.new(226,42)
chemin[58]=point.new(270,48)
chemin[59]=point.new(314,53)
chemin[60]=point.new(358,53)
chemin[61]=point.new(398,48)
chemin[62]=point.new(441,37)
chemin[63]=point.new(485,25)
chemin[64]=point.new(529,20)
chemin[65]=point.new(571,22)
chemin[66]=point.new(608,27)
for i=1,#chemin do
	chemin[i].mechant=1.5
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
obstaclenb=92--nombre de point definissant les petits obstacles
obstacle={}
obstacle[1]=point.new(-609,-83)
obstacle[2]=point.new(-559,-122)
obstacle[3]=point.new(-505,-139)
obstacle[4]=point.new(-487,-199)
obstacle[5]=point.new(-497,-277)
obstacle[6]=point.new(-474,-306)
obstacle[7]=point.new(-281,-308)
obstacle[8]=point.new(-214,-308)
obstacle[9]=point.new(-136,-308)
obstacle[10]=point.new(-71,-308)
obstacle[11]=point.new(-65,-265)
obstacle[12]=point.new(164,-182)
obstacle[13]=point.new(218,-182)
obstacle[14]=point.new(268,-181)
obstacle[15]=point.new(319,-181)
obstacle[16]=point.new(372,-179)
obstacle[17]=point.new(425,-176)
obstacle[18]=point.new(478,-176)
obstacle[19]=point.new(532,-176)
obstacle[20]=point.new(584,-174)
obstacle[21]=point.new(133,-226)
obstacle[22]=point.new(122,-278)
obstacle[23]=point.new(223,-275)
obstacle[24]=point.new(322,-277)
obstacle[25]=point.new(273,-243)
obstacle[26]=point.new(422,-268)
obstacle[27]=point.new(369,-242)
obstacle[28]=point.new(524,-277)
obstacle[29]=point.new(477,-251)
obstacle[30]=point.new(560,-235)
obstacle[31]=point.new(605,-270)
obstacle[32]=point.new(107,299)
obstacle[33]=point.new(168,268)
obstacle[34]=point.new(205,222)
obstacle[35]=point.new(239,186)
obstacle[36]=point.new(299,190)
obstacle[37]=point.new(358,183)
obstacle[38]=point.new(413,181)
obstacle[39]=point.new(467,178)
obstacle[40]=point.new(522,170)
obstacle[41]=point.new(577,178)
obstacle[42]=point.new(-476,-156)
obstacle[43]=point.new(-497,-117)
obstacle[44]=point.new(-544,-97)
obstacle[45]=point.new(-583,-68)
obstacle[46]=point.new(163,-169)
obstacle[47]=point.new(218,-164)
obstacle[48]=point.new(278,-159)
obstacle[49]=point.new(346,-159)
obstacle[50]=point.new(400,-153)
obstacle[51]=point.new(451,-156)
obstacle[52]=point.new(504,-151)
obstacle[53]=point.new(556,-151)
obstacle[54]=point.new(607,-151)
obstacle[55]=point.new(548,247)
obstacle[56]=point.new(-598,121)
obstacle[57]=point.new(-601,180)
obstacle[58]=point.new(-596,222)
obstacle[59]=point.new(-614,300)
obstacle[60]=point.new(-530,297)
obstacle[61]=point.new(-565,232)
obstacle[62]=point.new(-136,-262)
obstacle[63]=point.new(-206,-261)
obstacle[64]=point.new(-287,-259)
obstacle[65]=point.new(-442,-252)
obstacle[66]=point.new(31,-295)
obstacle[67]=point.new(27,-241)
obstacle[68]=point.new(36,-189)
obstacle[69]=point.new(53,-139)
obstacle[70]=point.new(74,-93)
obstacle[71]=point.new(100,-46)
obstacle[72]=point.new(-19,289)
obstacle[73]=point.new(-3,235)
obstacle[74]=point.new(31,194)
obstacle[75]=point.new(62,151)
obstacle[76]=point.new(85,108)
obstacle[77]=point.new(106,61)
obstacle[78]=point.new(-445,273)
obstacle[79]=point.new(-416,230)
obstacle[80]=point.new(-372,203)
obstacle[81]=point.new(-330,175)
obstacle[82]=point.new(-284,147)
obstacle[83]=point.new(-240,118)
obstacle[84]=point.new(-198,81)
obstacle[85]=point.new(-144,38)
obstacle[86]=point.new(-367,-295)
obstacle[87]=point.new(-359,-230)
obstacle[88]=point.new(-330,-186)
obstacle[89]=point.new(-291,-153)
obstacle[90]=point.new(-250,-124)
obstacle[91]=point.new(-209,-88)
obstacle[92]=point.new(-190,-47)

obstacle1nb=5--nombre de point definisant le nombre de point du gros obstacle
obstacle1={}--gros cercle
obstacle1[1]=point.new(-613,-304)
obstacle1[2]=point.new(-613,-202)
obstacle1[3]=point.new(392,299)
obstacle1[4]=point.new(610,302)
obstacle1[5]=point.new(309,295)

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
-- #obstacleim=2--1
-- --exemple
-- obstacleim={}
obstacleim[coordonneedu]=display.newImage(map7sheeto1,1)
obstacleim[coordonneedu].x=-1844.5
obstacleim[coordonneedu].y=598.5
obstacleim[coordonneedu+1]=display.newImage(map7sheeto2,1)
obstacleim[coordonneedu+1].x=-800
obstacleim[coordonneedu+1].y=923.5
-- obstacleim[1]=display.newImage( "carte/level2/bdp.png", 550,140,true )
-- obstacleim[1].xScale=0.2
-- obstacleim[1].yScale=0.2

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
decoration[1].x=198
decoration[1].y=129
decoration[1].type=30
decoration[1].planche=1
decoration[1].scale=0.2
decoration[2]={}
decoration[2].x=-450 -- -394 --bug
decoration[2].y=-74
decoration[2].type=28
decoration[2].planche=1
decoration[2].scale=0.2
decoration[3]={}
decoration[3].x=-48
decoration[3].y=-96
decoration[3].type=9
decoration[3].planche=1
decoration[3].scale=0.2



------------------------------------------------------------fin hugo---------------------------------------------------------------
end
t.vague=function()--donnees sur les vagues du niveau
vague={}
--nbvague=3--15
for k=1,leveldata[7].wave,1 do
	vague[k]={}
	vague[k][1]=200
end
vague[1]={-1,8,203,203,203,203,203,203,203,203,0,0,0,0,0,216,1,216,1,216,1,216,0,0,0,0,0,0,0,-3,203,0,0,-4,203,5,270,270,270,270,270,-1,5,270,270,270,270,270,-2,5,270,270,270,270,270}
vague[2]={5,203,203,203,203,203,-1,5,203,203,203,203,203,-2,5,203,203,203,203,203,-3,3,203,203,203,-4,3,203,203,203,0,0,0,0,0,0,9,235,235,235,235,235,235,235,235,235,-1,8,235,235,235,235,235,235,235,235,-2,7,235,235,235,235,235,235,235,-3,3,235,235,235,-4,3,235,235,235,0,0,0,0,0,0,0,9,235,235,235,235,235,235,235,235,235,-1,9,235,235,235,235,235,235,235,235,235,-2,9,235,235,235,235,235,235,235,235,235,-3,3,235,235,235,-4,3,235,235,235,0,0,0,0,0,203}
vague[3]={9,270,270,270,270,270,270,270,270,270,-1,9,270,270,270,270,270,270,270,270,270,-2,9,270,270,270,270,270,270,270,270,270,0,0,0,9,235,235,235,235,235,235,235,235,235,-1,9,235,235,235,235,235,235,235,235,235,-2,9,235,235,235,235,235,235,235,235,235,0,0,0,0,9,270,270,270,270,270,270,270,270,270,-1,9,270,270,270,270,270,270,270,270,270,-2,9,270,270,270,270,270,270,270,270,270,0,0,0,0,203}
vague[4]={-13,2,216,216,-1,216,-2,216,-3,216,-4,216,0,0,0,9,235,235,235,235,235,235,235,235,235,-1,9,235,235,235,235,235,235,235,235,235,-2,9,235,235,235,235,235,235,235,235,235,-3,5,235,235,235,235,235,-4,5,235,235,235,235,235,0,0,0,0,0,0,9,270,270,270,270,270,270,270,270,270,-1,9,270,270,270,270,270,270,270,270,270,0,-2,9,270,270,270,270,270,270,270,270,270,-3,5,270,270,270,270,270,0,-4,5,270,270,270,270,270}
vague[5]={-13,2,216,216,-1,2,216,216,-2,2,216,216,-3,216,216,-4,216,3,270,270,270,0,0,-13,4,235,235,235,235,-1,4,235,235,235,235,-2,4,235,235,235,235,-3,4,235,235,235,235,-4,4,235,235,235,235,0,0,0,0,0,-13,4,270,270,270,270,-1,4,270,270,270,270,-2,4,270,270,270,270,-3,4,270,270,270,270,-4,4,270,270,270,270,0,0,0,0,-11,4,270,270,270,270,-1,4,270,270,270,270,-2,4,270,270,270,270,0,0,0,3,261,261,261,0,3,261,261,261,0,0,1,2,262,262,0,0,0,0,-3,203}
vague[6]={-13,2,216,216,-1,2,216,216,-2,2,216,216,-3,216,216,-4,216,-13,3,207,208,201,-1,3,207,208,207,-2,3,207,208,207,-3,2,207,208,-4,2,207,208,0,0,0,0,0,-13,4,270,270,270,270,-1,4,270,270,270,270,-2,4,270,270,270,270,-3,4,270,270,270,270,-4,4,270,270,270,270,0,0,-13,4,270,270,270,270,-1,4,270,270,270,270,-2,4,270,270,270,270,-3,4,270,270,270,270,-4,4,270,270,270,270,9,235,235,235,235,235,235,235,235,235,-1,9,235,235,235,235,235,235,235,235,235,-2,9,235,235,235,235,235,235,235,235,235,-3,5,235,235,235,235,235,-4,5,235,235,235,235,235,0,9,235,235,235,235,235,235,235,235,235,-1,9,235,235,235,235,235,235,235,235,235,-2,9,235,235,235,235,235,235,235,235,235,-3,5,235,235,235,235,235,-4,5,235,235,235,235,235}
-------------------------------------------------------------debut hugo-----------------------------------------------------
--0 retarde de la durer de spawn de 3 soldat et 1 de la durer de 1 soldat
--de 2 à 5 permet de spawner plusieurs soldat a la fois.
--vague[1].nb=2--nb soldat dans la vague

modeinfdif=0-- 0 pour facile, 1 pour normal, 2 pour difficile

end
t.vaguewave=function()
	vague={}
	vague[1]={216,217,207,208,-12,-1,5,235,235,235,235,235,-2,5,235,235,235,235,235,-3,5,235,235,235,235,235,-4,5,235,235,235,235,235,217,207,208,-12,-1,5,235,235,235,235,235,-2,5,235,235,235,235,235,-3,5,235,235,235,235,235,-4,5,235,235,235,235,235,216,217,207,208,-12,-1,5,235,235,235,235,235,-2,5,235,235,235,235,235,-3,5,235,235,235,235,235,-4,5,235,235,235,235,235,217,207,208,-12,-1,5,235,235,235,235,235,-2,5,235,235,235,235,235,-3,5,235,235,235,235,235,-4,5,235,235,235,235,235,216,217,207,208,-12,-1,5,235,235,235,235,235,-2,5,235,235,235,235,235,-3,5,235,235,235,235,235,-4,5,235,235,235,235,235,217,207,208,-12,-1,5,235,235,235,235,235,-2,5,235,235,235,235,235,-3,5,235,235,235,235,235,-4,5,235,235,235,235,235,216,217,207,208,-12,-1,5,235,235,235,235,235,-2,5,235,235,235,235,235,-3,5,235,235,235,235,235,-4,5,235,235,235,235,235,217,207,208,0,0,0,-12,-1,5,235,235,235,235,235,-2,5,235,235,235,235,235,-3,5,235,235,235,235,235,-4,5,235,235,235,235,235,216,217,207,208,-12,-1,5,235,235,235,235,235,-2,5,235,235,235,235,235,-3,5,235,235,235,235,235,-4,5,235,235,235,235,235,217,207,208,-12,-1,5,235,235,235,235,235,-2,5,235,235,235,235,235,-3,5,235,235,235,235,235,-4,5,235,235,235,235,235,216,217,207,208,-12,-1,5,235,235,235,235,235,-2,5,235,235,235,235,235,-3,5,235,235,235,235,235,-4,5,235,235,235,235,235}
end
return t