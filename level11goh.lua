

local t={} --niveau inf
t.new=function()--gestion du niveau 4 du jeu, doit toujours suivre le meme modele
	--map1= display.newImage( "goh/carte/level2/carte1a.jpg", 0,0,true )--devrai etre en local pour niveau1
	-- map1p = display.newCircle(0,0,10)      --nil--display.newImage( "goh/carte/level2/carte1p.jpg", 0,0,true )
	-- map1p.isVisible=false
	pouvoirdisp=3
	-- modeinfini=true
	t=1
end
t.affichagecarte=function(pole)	
	if donneecharger[11]==0 then
		donneecharger[11]=1
		map11sheethg=graphics.newImageSheet( "goh/carte/level11/hd.jpg", { width=2048, height=1024, numFrames=1,sheetContentWidth=2048,sheetContentHeight=1024 } )
		map11sheethd=graphics.newImageSheet( "goh/carte/level11/hg.jpg", { width=2048, height=1024, numFrames=1,sheetContentWidth=2048,sheetContentHeight=1024 } )
		map11sheetbg=graphics.newImageSheet( "goh/carte/level11/bd.jpg", { width=2048, height=1024, numFrames=1,sheetContentWidth=2048,sheetContentHeight=1024 } )
		map11sheetbd=graphics.newImageSheet( "goh/carte/level11/bg.jpg", { width=2048, height=1024, numFrames=1,sheetContentWidth=2048,sheetContentHeight=1024 } )
		map11sheeto1=graphics.newImageSheet( "goh/carte/level11/left_mountain.png", { width=543, height=843, numFrames=1,sheetContentWidth=543,sheetContentHeight=843 } )
		map11sheeto2=graphics.newImageSheet( "goh/carte/level11/right_bttm_mountain.png", { width=1011, height=326, numFrames=1,sheetContentWidth=1011,sheetContentHeight=326 } )
		map11sheeto3=graphics.newImageSheet( "goh/carte/level11/right_trees.png", { width=959, height=359, numFrames=1,sheetContentWidth=959,sheetContentHeight=359 } )
		map11sheeto4=graphics.newImageSheet( "goh/carte/level11/skull_prop.png", { width=146, height=140, numFrames=1,sheetContentWidth=146,sheetContentHeight=140 } )
	end
	hg=display.newImage(map11sheethg,1) --display.newImage( "goh/carte/level2/hd.jpg", -1024,-512,true )
	hg.x=-1024
	hg.y=-512
	hd=display.newImage(map11sheethd,1) --display.newImage( "goh/carte/level2/hg.jpg",1024,-512,true )
	hd.x=1024
	hd.y=-512
	bg=display.newImage(map11sheetbg,1) --display.newImage( "goh/carte/level2/bd.jpg", -1024,512,true )
	bg.x=-1024
	bg.y=512
	bd=display.newImage(map11sheetbd,1) --display.newImage( "goh/carte/level2/bg.jpg", 1024,512,true )
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

cheminnb=59-- --nombre de point definisant le chemin -1--------------------------------------------------------------------------------------------------
chemin={}
chemin[1]=point.new(194,-312)	chemin[1].mechant=1		chemin[1].rayon=5000
chemin[2]=point.new(170,-263)	chemin[2].mechant=1.2	chemin[2].rayon=4000
chemin[3]=point.new(175,-228)	chemin[3].mechant=1.2	chemin[3].rayon=4000
chemin[4]=point.new(207,-190)	chemin[4].mechant=1.1	chemin[4].rayon=3000
chemin[5]=point.new(250,-163)	chemin[5].mechant=1.1	chemin[5].rayon=2000
chemin[6]=point.new(293,-171)	chemin[6].mechant=1		chemin[6].rayon=3000
chemin[7]=point.new(335,-165)	chemin[7].mechant=1.2	chemin[7].rayon=3000
chemin[8]=point.new(376,-161)	chemin[8].mechant=1.2	chemin[8].rayon=3000
chemin[9]=point.new(420,-135)	chemin[9].mechant=1		chemin[9].rayon=3000
chemin[10]=point.new(448,-99)	chemin[10].mechant=1.1	chemin[10].rayon=3000
chemin[11]=point.new(464,-57)	chemin[11].mechant=1.2	chemin[11].rayon=4000
chemin[12]=point.new(462,-13)	chemin[12].mechant=1.3	chemin[12].rayon=4000
chemin[13]=point.new(433,15)	chemin[13].mechant=1.2	chemin[13].rayon=4000
chemin[14]=point.new(406,38)	chemin[14].mechant=1.3	chemin[14].rayon=4000
chemin[15]=point.new(372,63)	chemin[15].mechant=1.4	chemin[15].rayon=3000
chemin[16]=point.new(331,74)	chemin[16].mechant=1.2	chemin[16].rayon=3000
chemin[17]=point.new(285,74)	chemin[17].mechant=1.2	chemin[17].rayon=3000
chemin[18]=point.new(239,69)	chemin[18].mechant=1.3	chemin[18].rayon=3000
chemin[19]=point.new(193,61)	chemin[19].mechant=1.4	chemin[19].rayon=3000
chemin[20]=point.new(147,59)	chemin[20].mechant=1.3	chemin[20].rayon=3000
chemin[21]=point.new(103,64)	chemin[21].mechant=1.1	chemin[21].rayon=3000
chemin[22]=point.new(58,65)		chemin[22].mechant=1	chemin[22].rayon=3000
chemin[23]=point.new(-617,76)	chemin[23].mechant=1.8	chemin[23].rayon=6000
chemin[24]=point.new(-572,75)	chemin[24].mechant=1.8	chemin[24].rayon=6000
chemin[25]=point.new(-533,70)	chemin[25].mechant=1.9	chemin[25].rayon=6000
chemin[26]=point.new(-499,55)	chemin[26].mechant=1.8	chemin[26].rayon=5000
chemin[27]=point.new(-482,24)	chemin[27].mechant=1.5	chemin[27].rayon=3000
chemin[28]=point.new(-463,-16)	chemin[28].mechant=1.4	chemin[28].rayon=4000
chemin[29]=point.new(-441,-54)	chemin[29].mechant=1.8	chemin[29].rayon=4000
chemin[30]=point.new(-424,-95)	chemin[30].mechant=1.2	chemin[30].rayon=5000
chemin[31]=point.new(-394,-125)	chemin[31].mechant=1.3	chemin[31].rayon=3000
chemin[32]=point.new(-356,-146)	chemin[32].mechant=1.3	chemin[32].rayon=3000
chemin[33]=point.new(-313,-146)	chemin[33].mechant=1	chemin[33].rayon=3000
chemin[34]=point.new(-272,-142)	chemin[34].mechant=1	chemin[34].rayon=3000
chemin[35]=point.new(-229,-129)	chemin[35].mechant=1.3	chemin[35].rayon=3000
chemin[36]=point.new(-212,-100)	chemin[36].mechant=1.3	chemin[36].rayon=5000
chemin[37]=point.new(-205,-63)	chemin[37].mechant=1.3	chemin[37].rayon=5000
chemin[38]=point.new(-201,-20)	chemin[38].mechant=1.4	chemin[38].rayon=5000
chemin[39]=point.new(-186,22)	chemin[39].mechant=1.4	chemin[39].rayon=3000
chemin[40]=point.new(-151,44)	chemin[40].mechant=1.3	chemin[40].rayon=3000
chemin[41]=point.new(-108,51)	chemin[41].mechant=1.3	chemin[41].rayon=3000
chemin[42]=point.new(-65,54)	chemin[42].mechant=1.3	chemin[42].rayon=3000
chemin[43]=point.new(-23,59)	chemin[43].mechant=1.2	chemin[43].rayon=3000
chemin[44]=point.new(17,73)		chemin[44].mechant=1.5	chemin[44].rayon=3000
chemin[45]=point.new(34,118)	chemin[45].mechant=1.4	chemin[45].rayon=5500
chemin[46]=point.new(46,153)	chemin[46].mechant=1.4	chemin[46].rayon=5000
chemin[47]=point.new(58,190)	chemin[47].mechant=1.4	chemin[47].rayon=5000
chemin[48]=point.new(94,209)	chemin[48].mechant=1.4	chemin[48].rayon=5000
chemin[49]=point.new(132,217)	chemin[49].mechant=1.5	chemin[49].rayon=5000
chemin[50]=point.new(174,218)	chemin[50].mechant=1.4	chemin[50].rayon=5000
chemin[51]=point.new(216,221)	chemin[51].mechant=1.4	chemin[51].rayon=5000
chemin[52]=point.new(258,219)	chemin[52].mechant=1.1	chemin[52].rayon=5000
chemin[53]=point.new(302,215)	chemin[53].mechant=1.1	chemin[53].rayon=5000
chemin[54]=point.new(344,205)	chemin[54].mechant=1.2	chemin[54].rayon=5000
chemin[55]=point.new(388,190)	chemin[55].mechant=1.4	chemin[55].rayon=5000
chemin[56]=point.new(431,185)	chemin[56].mechant=1.6	chemin[56].rayon=5000
chemin[57]=point.new(477,188)	chemin[57].mechant=1.6	chemin[57].rayon=6000
chemin[58]=point.new(521,197)	chemin[58].mechant=1.6	chemin[58].rayon=5000
chemin[59]=point.new(564,208)	chemin[59].mechant=1.6	chemin[59].rayon=5000
chemin[60]=point.new(617,229)	chemin[60].mechant=1.6	chemin[60].rayon=5000
--[[chemin[57]=point.new(570,3103
chemin[58]=point.new(570,-3103
chemin[59]=point.new(-580,-310)
chemin[60]=point.new(-580,310)
chemin[61]=point.new(0,0)

chemin[62]=point.new(0,0)
chemin[63]=point.new(-40,0)
chemin[64]=point.new(-40,300)]]

obstacle0nb=0

--obstaclenb=0--
--obstacle1nb=0--
obstaclenb=52 --38--nombre de point definissant les petits obstacles
obstacle={}
obstacle[1]=point.new(-350,65)
obstacle[2]=point.new(-237,122)
obstacle[3]=point.new(-106,160)
obstacle[4]=point.new(100,-88)
obstacle[5]=point.new(148,-88)
obstacle[6]=point.new(83,-137)
obstacle[7]=point.new(43,-141)
obstacle[8]=point.new(-33,-165)
obstacle[9]=point.new(-105,-189)
obstacle[10]=point.new(-204,-289)
obstacle[11]=point.new(-151,-287)
obstacle[12]=point.new(603,172)
obstacle[13]=point.new(-69,156)
obstacle[14]=point.new(206,-131)
obstacle[15]=point.new(-64,-175)
obstacle[16]=point.new(85,-84)
obstacle[17]=point.new(122,-85)
obstacle[18]=point.new(-287,-225)
obstacle[19]=point.new(-594,-20)
obstacle[20]=point.new(-400,80)
obstacle[21]=point.new(-259,98)
obstacle[22]=point.new(170,-85)
obstacle[24]=point.new(-6,173)
obstacle[25]=point.new(138,-156)
obstacle[26]=point.new(-146,-221)
obstacle[27]=point.new(-492,-223)
obstacle[28]=point.new(-305,80)
obstacle[29]=point.new(101,-207)
obstacle[30]=point.new(502,-177)
obstacle[31]=point.new(279,-176)
obstacle[32]=point.new(350,-176)
obstacle[33]=point.new(398,-176)
obstacle[34]=point.new(305,-176)
obstacle[35]=point.new(437,-93)
obstacle[36]=point.new(441,-61)
obstacle[37]=point.new(441,-25)
obstacle[38]=point.new(422,0)
obstacle[39]=point.new(400,22)
obstacle[40]=point.new(372,45)
obstacle[41]=point.new(327,60)
obstacle[42]=point.new(286,60)
obstacle[43]=point.new(241,55)
obstacle[44]=point.new(194,42)
obstacle[45]=point.new(146,42)
obstacle[46]=point.new(104,49)
obstacle[47]=point.new(-149,32)
obstacle[48]=point.new(-109,37)
obstacle[49]=point.new(-64,41)
obstacle[50]=point.new(-23,44)
obstacle[51]=point.new(17,61)
obstacle[52]=point.new(57,53)
obstacle[23]=point.new(-223,-149)

obstacle1nb=15 --9--nombre de point definisant le nombre de point du gros obstacle
obstacle1={}--gros cercle
obstacle1[1]=point.new(-610,301)
obstacle1[2]=point.new(-361,298)
obstacle1[3]=point.new(-150,298)
obstacle1[4]=point.new(6,301)
obstacle1[5]=point.new(226,305)
obstacle1[6]=point.new(412,305)
obstacle1[7]=point.new(587,305)
obstacle1[8]=point.new(609,-302)
obstacle1[9]=point.new(613,-180)
obstacle1[10]=point.new(-10,-306)
obstacle1[11]=point.new(-611,-305)
obstacle1[12]=point.new(-374,-316)
obstacle1[13]=point.new(-490,223)
obstacle1[14]=point.new(-338,191)
obstacle1[15]=point.new(-631,-150)

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
obstacleim[1]=display.newImage(map11sheeto1,1)
obstacleim[1].anchorY=1
obstacleim[1].x=-1776.5
obstacleim[1].y=1024
obstacleim[2]=display.newImage(map11sheeto2,1)
obstacleim[2].anchorY=1
obstacleim[2].x=1542.5
obstacleim[2].y=1024
obstacleim[3]=display.newImage(map11sheeto3,1)
obstacleim[3].anchorY=1
obstacleim[3].x=573.5
obstacleim[3].y=1024
obstacleim[4]=display.newImage(map11sheeto4,1)
obstacleim[4].anchorY=1
obstacleim[4].x=-1956
obstacleim[4].y=-27

decoration={}
decoration[1]={}
decoration[1].x=-125*0.3
decoration[1].y=-30*0.3
decoration[1].type=17
decoration[1].planche=1
decoration[1].scale=0.3
decoration[1].anchorY=1
decoration[2]={}
decoration[2].x=1495.5*0.3
decoration[2].y=522*0.3
decoration[2].type=17
decoration[2].planche=1
decoration[2].scale=0.3
decoration[2].anchorY=1
decoration[3]={}
decoration[3].x=-342
decoration[3].y=64
decoration[3].type=9
decoration[3].planche=1
decoration[3].scale=0.3
decoration[3].anchorY=1
decoration[4]={}
decoration[4].x=-150
decoration[4].y=170
decoration[4].type=13
decoration[4].planche=1
decoration[4].scale=0.3
decoration[4].anchorY=1
decoration[5]={}
decoration[5].x=-120
decoration[5].y=165
decoration[5].type=12
decoration[5].planche=1
decoration[5].scale=0.3
decoration[5].anchorY=1
decoration[6]={}
decoration[6].x=-90
decoration[6].y=-120
decoration[6].type=5
decoration[6].planche=1
decoration[6].scale=0.3
decoration[6].anchorY=1
decoration[7]={}
decoration[7].x=401
decoration[7].y=-230
decoration[7].type=15
decoration[7].planche=1
decoration[7].scale=0.3
decoration[7].anchorY=1
decoration[8]={}
decoration[8].x=420
decoration[8].y=-160
decoration[8].type=14
decoration[8].planche=1
decoration[8].scale=0.3
decoration[8].anchorY=1
decoration[9]={}
decoration[9].x=25
decoration[9].y=-85
decoration[9].type=16
decoration[9].planche=1
decoration[9].scale=0.3
decoration[9].anchorY=1
decoration[10]={}
decoration[10].x=78
decoration[10].y=0
decoration[10].type=14
decoration[10].planche=1
decoration[10].scale=0.3
decoration[10].anchorY=1
decoration[11]={}
decoration[11].x=104
decoration[11].y=3
decoration[11].type=13
decoration[11].planche=1
decoration[11].scale=0.3
decoration[11].anchorY=1
decoration[12]={}
decoration[12].x=162
decoration[12].y=4
decoration[12].type=12
decoration[12].planche=1
decoration[12].scale=0.3
decoration[12].anchorY=1
end
t.vague=function()--donnees sur les vagues du niveau
vague={}
--nbvague=3--15
for k=1,leveldata[11].wave,1 do
	vague[k]={}
	vague[k][1]=200
end
vague[1]={2,236,236,0,2,236,236,0,2,236,236,0,5,206,206,206,206,206,0,0,5,236,236,236,236,236,-1,4,263,263,263,263,-1,3,206,206,206,0,0,-1,4,206,206,206,206,1,-1,5,206,206,206,206,206,1,-1,4,206,206,206,206,2,236,236,2,236,236,0,2,236,236,2,236,236,1,2,236,236}
vague[2]={206,0,0,4,263,263,263,263,0,-1,4,264,264,264,264,0,-1,4,263,263,263,263,4,264,264,264,264,0,4,206,206,206,206,4,206,206,206,206,4,206,206,206,206,4,206,206,206,206,0,-1,2,236,236,-1,2,236,236,-1,2,236,236,-1,2,236,236}
vague[3]={-1,4,212,212,212,212,1,-1,4,206,206,206,206,1,-1,4,212,212,212,212,0,0,-1,4,263,263,263,263,0,-1,4,264,264,264,264,-1,2,263,263,-1,2,264,264,-1,2,263,263,-1,2,264,264,0,0,-1,3,236,236,236,1,-1,3,236,236,236,1,-1,3,236,236,236,1,-1,3,236,236,236,1,-1,3,236,236,236,0,0,0,0,-1,3,236,236,236,1,-1,3,236,236,236,1,-1,3,236,236,236,1,-1,4,236,236,236,236,0,0,2,266,266}
vague[4]={206,0,0,0,0,2,263,263,266,3,236,236,236,4,236,236,236,236,3,236,236,236,4,236,236,236,236,3,236,236,236,4,236,236,236,236,3,236,236,236,3,236,236,236,4,236,236,236,236,0,0,0,0,0,-1,5,200,200,200,200,200,-1,5,200,200,200,200,200,-1,5,200,200,200,200,200,-1,5,200,200,200,200,200,-1,5,200,200,200,200,200,-1,5,200,200,200,200,200,-1,5,200,200,200,200,200,0,0,0,0,-1,3,263,263,263,-1,3,263,263,263,-1,3,263,263,263,-1,3,263,263,263,-1,4,265,265,265,265,-1,265,265,265,265,0,0,0,0,206}
vague[5]={5,236,236,236,271,271,5,236,236,236,271,271,5,236,236,236,271,271,5,236,236,236,271,271,5,236,236,236,271,271,5,236,236,236,271,271,5,236,236,236,271,271,5,236,236,236,271,271,5,236,236,236,271,271,0,0,0,-1,4,218,218,218,218,0,0,0,-1,5,219,219,219,219,219,-1,5,212,212,212,212,212,-1,5,212,212,212,212,212,0,0,0,0,0,0,0,0,0,206}
vague[6]={206,0,0,0,0,0,0,266,0,0,0,0,0,266,0,266,-1,266,0,0,0,-1,266,0,266,0,0,-1,266,266,0,-1,266,-1,266,0,0,0,0,0,0,0,0,0,-1,7,265,265,265,265,265,261,261,0,0,-1,7,261,265,261,265,261,265,261,0,0,-1,7,261,265,261,265,261,265,261,0,0,0,-1,7,261,265,261,265,261,265,261,0,0,-1,7,261,265,261,265,261,265,261,0,0,0,0,261}
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
