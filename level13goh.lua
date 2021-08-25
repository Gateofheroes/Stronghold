

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
	if donneecharger[13]==0 then
		donneecharger[13]=1
		map13sheethg=graphics.newImageSheet( "goh/carte/level13/hd.jpg", { width=2048, height=1024, numFrames=1,sheetContentWidth=2048,sheetContentHeight=1024 } )
		map13sheethd=graphics.newImageSheet( "goh/carte/level13/hg.jpg", { width=2048, height=1024, numFrames=1,sheetContentWidth=2048,sheetContentHeight=1024 } )
		map13sheetbg=graphics.newImageSheet( "goh/carte/level13/bd.jpg", { width=2048, height=1024, numFrames=1,sheetContentWidth=2048,sheetContentHeight=1024 } )
		map13sheetbd=graphics.newImageSheet( "goh/carte/level13/bg.jpg", { width=2048, height=1024, numFrames=1,sheetContentWidth=2048,sheetContentHeight=1024 } )
		map13sheeto1=graphics.newImageSheet( "goh/carte/level13/teeth_rocks.png", { width=557, height=590, numFrames=1,sheetContentWidth=557,sheetContentHeight=590 } )
	end
	hg=display.newImage(map13sheethg,1) --display.newImage( "goh/carte/level2/hd.jpg", -1024,-512,true )
	hg.x=-1024
	hg.y=-512
	hd=display.newImage(map13sheethd,1) --display.newImage( "goh/carte/level2/hg.jpg",1024,-512,true )
	hd.x=1024
	hd.y=-512
	bg=display.newImage(map13sheetbg,1) --display.newImage( "goh/carte/level2/bd.jpg", -1024,512,true )
	bg.x=-1024
	bg.y=512
	bd=display.newImage(map13sheetbd,1) --display.newImage( "goh/carte/level2/bg.jpg", 1024,512,true )
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
	local tunededep=500
	local nbperso=leveldata[13].life
	if modeinfini or modesquelette then
		tunededep=tunedep
		nbperso=10
	end
	argentdep=-(tunededep)*3--hugo-------------------------------------------------------------------
	ennemipassedep=nbperso--nombre d'ennemi qui peuvent encore passer avant qu'on perdre---hugo------------------------------------------------------------------------------------------------------------------
	
end
t.chemi=function()--donnees sur les differents points de la carte
local point= require( "point" )
genepointinit=77
----------------------------------------------------------------------------------------hugo debut -----------------------------------------------------------------------
pointdep={}--entré secondaire 
pointdep[1]=34 --24 55 78

cheminarr={}
cheminarr[1]=32
cheminarr[2]=62

intersection={}
intersection.nb=9
intersection[1]={pt=8, ty=1, un=10, deux=65, proba=1}
intersection[2]={pt=40, ty=1, un=70, deux=42, proba=1}
intersection[3]={pt=72, ty=0, un=68}
intersection[4]={pt=68, ty=1, un=73, deux=75, proba=1}
intersection[5]={pt=72, ty=0, un=16}
intersection[6]={pt=74, ty=0, un=49}
intersection[7]={pt=23, ty=1, un=76, deux=26, proba=1}
intersection[8]={pt=78, ty=0, un=55}
intersection[9]={pt=63, ty=0, un=79}
cheminnb=78-- --nombre de point definisant le chemin -1--------------------------------------------------------------------------------------------------
chemin={}
chemin[1]=point.new(-600,-312)	chemin[1].mechant=2	chemin[1].rayon=45000
chemin[2]=point.new(-546,-274)	chemin[2].mechant=2	chemin[2].rayon=3000
chemin[3]=point.new(-522,-254)	chemin[3].mechant=2	chemin[3].rayon=3000
chemin[4]=point.new(-491,-232)	chemin[4].mechant=2	chemin[4].rayon=3000
chemin[5]=point.new(-462,-207)	chemin[5].mechant=2	chemin[5].rayon=3000
chemin[6]=point.new(-427,-182)	chemin[6].mechant=2	chemin[6].rayon=3000
chemin[7]=point.new(-392,-156)	chemin[7].mechant=2	chemin[7].rayon=5000
chemin[8]=point.new(-344,-137)	chemin[8].mechant=2	chemin[8].rayon=6000
chemin[9]=point.new(-301,-121)	chemin[9].mechant=1.4	chemin[9].rayon=1000
chemin[10]=point.new(-283,-158)	chemin[10].mechant=1.2	chemin[10].rayon=3000
chemin[11]=point.new(-246,-175)	chemin[11].mechant=1.3	chemin[11].rayon=3000
chemin[12]=point.new(-205,-180)	chemin[12].mechant=1.2	chemin[12].rayon=3000
chemin[13]=point.new(-163,-179)	chemin[13].mechant=1.2	chemin[13].rayon=3000
chemin[14]=point.new(-115,-167)	chemin[14].mechant=1.7	chemin[14].rayon=3000
chemin[15]=point.new(-81,-134)	chemin[15].mechant=2.3	chemin[15].rayon=6000
chemin[16]=point.new(-57,-113)	chemin[16].mechant=2	chemin[16].rayon=3000
chemin[17]=point.new(-14,-92)	chemin[17].mechant=1.7	chemin[17].rayon=3000
chemin[18]=point.new(35,-84)	chemin[18].mechant=1.4	chemin[18].rayon=3000
chemin[19]=point.new(80,-89)	chemin[19].mechant=1.1	chemin[19].rayon=3000
chemin[20]=point.new(119,-113)	chemin[20].mechant=1.3	chemin[20].rayon=4500
chemin[21]=point.new(166,-105)	chemin[21].mechant=1.2	chemin[21].rayon=4500
chemin[22]=point.new(203,-98)	chemin[22].mechant=1	chemin[22].rayon=4500
chemin[23]=point.new(239,-89)	chemin[23].mechant=1.4	chemin[23].rayon=4500
chemin[24]=point.new(278,-79)	chemin[24].mechant=2	chemin[24].rayon=3000
chemin[25]=point.new(320,-102)	chemin[25].mechant=1.7	chemin[25].rayon=4000
chemin[26]=point.new(354,-126)	chemin[26].mechant=1.6	chemin[26].rayon=5000
chemin[27]=point.new(392,-148)	chemin[27].mechant=1.6	chemin[27].rayon=5000
chemin[28]=point.new(430,-173)	chemin[28].mechant=1.6	chemin[28].rayon=5000
chemin[29]=point.new(466,-195)	chemin[29].mechant=1.7	chemin[29].rayon=3000
chemin[30]=point.new(502,-225)	chemin[30].mechant=1.9	chemin[30].rayon=3000
chemin[31]=point.new(540,-248)	chemin[31].mechant=2	chemin[31].rayon=3000
chemin[32]=point.new(578,-283)	chemin[32].mechant=2	chemin[32].rayon=3000
chemin[33]=point.new(612,-305)	chemin[33].mechant=2	chemin[33].rayon=60000
chemin[34]=point.new(-613,304)	chemin[34].mechant=2	chemin[34].rayon=3000
chemin[35]=point.new(-588,288)	chemin[35].mechant=2	chemin[35].rayon=8000
chemin[36]=point.new(-563,274)	chemin[36].mechant=2.2	chemin[36].rayon=8000
chemin[37]=point.new(-515,250)	chemin[37].mechant=2.2	chemin[37].rayon=8000
chemin[38]=point.new(-472,226)	chemin[38].mechant=2.2	chemin[38].rayon=8000
chemin[39]=point.new(-428,195)	chemin[39].mechant=2.2	chemin[39].rayon=6000
chemin[40]=point.new(-377,159)	chemin[40].mechant=2.2	chemin[40].rayon=6000
chemin[41]=point.new(-331,128)	chemin[41].mechant=2.4	chemin[41].rayon=3000
chemin[42]=point.new(-291,155)	chemin[42].mechant=1.7	chemin[42].rayon=6000
chemin[43]=point.new(-248,168)	chemin[43].mechant=1.4	chemin[43].rayon=6000
chemin[44]=point.new(-204,174)	chemin[44].mechant=1.4	chemin[44].rayon=6000
chemin[45]=point.new(-162,182)	chemin[45].mechant=1.6	chemin[45].rayon=3000
chemin[46]=point.new(-116,163)	chemin[46].mechant=1.9	chemin[46].rayon=3000
chemin[47]=point.new(-89,134)	chemin[47].mechant=2	chemin[47].rayon=6000
chemin[48]=point.new(-47,118)	chemin[48].mechant=1.9	chemin[48].rayon=3000
chemin[49]=point.new(-11,107)	chemin[49].mechant=2	chemin[49].rayon=3000
chemin[50]=point.new(33,103)	chemin[50].mechant=2	chemin[50].rayon=3000
chemin[51]=point.new(85,93)		chemin[51].mechant=1.7	chemin[51].rayon=3000
chemin[52]=point.new(123,123)	chemin[52].mechant=1.9	chemin[52].rayon=3000
chemin[53]=point.new(168,131)	chemin[53].mechant=1.7	chemin[53].rayon=3000
chemin[54]=point.new(209,119)	chemin[54].mechant=1.5	chemin[54].rayon=3000
chemin[55]=point.new(253,91)	chemin[55].mechant=2.1	chemin[55].rayon=5000
chemin[56]=point.new(310,91)	chemin[56].mechant=1.8	chemin[56].rayon=5000
chemin[57]=point.new(351,119)	chemin[57].mechant=1.6	chemin[57].rayon=3000
chemin[58]=point.new(383,149)	chemin[58].mechant=1.6	chemin[58].rayon=3000
chemin[59]=point.new(419,179)	chemin[59].mechant=1.6	chemin[59].rayon=3000
chemin[60]=point.new(457,203)	chemin[60].mechant=1.6	chemin[60].rayon=3000
chemin[61]=point.new(488,234)	chemin[61].mechant=1.6	chemin[61].rayon=3000
chemin[62]=point.new(537,268)	chemin[62].mechant=1.6	chemin[62].rayon=3000
chemin[63]=point.new(568,287)	chemin[63].mechant=1.6	chemin[63].rayon=3000
chemin[64]=point.new(-301,-76)	chemin[64].mechant=1.6	chemin[64].rayon=3000
chemin[65]=point.new(-289,-29)	chemin[65].mechant=2	chemin[65].rayon=3000
chemin[66]=point.new(-251,-8)	chemin[66].mechant=1.5	chemin[66].rayon=3000
chemin[67]=point.new(-208,-6)	chemin[67].mechant=1.5	chemin[67].rayon=3000
chemin[68]=point.new(-166,-4)	chemin[68].mechant=1.6	chemin[68].rayon=3000
chemin[69]=point.new(-126,-6)	chemin[69].mechant=1.5	chemin[69].rayon=3000
chemin[70]=point.new(-325,77)	chemin[70].mechant=1.9	chemin[70].rayon=3000
chemin[71]=point.new(-316,29)	chemin[71].mechant=2.6	chemin[71].rayon=6000
chemin[72]=point.new(-102,-40)	chemin[72].mechant=1.4	chemin[72].rayon=3000
chemin[73]=point.new(-63,-68)	chemin[73].mechant=1.4	chemin[73].rayon=3000
chemin[74]=point.new(-97,43)	chemin[74].mechant=1.6	chemin[74].rayon=3000
chemin[75]=point.new(-68,73)	chemin[75].mechant=1.9	chemin[75].rayon=3000
chemin[76]=point.new(275,-40)	chemin[76].mechant=2	chemin[76].rayon=5000
chemin[77]=point.new(278,1)		chemin[77].mechant=1.6	chemin[77].rayon=5000
chemin[78]=point.new(268,41)	chemin[78].mechant=1	chemin[78].rayon=5000
chemin[79]=point.new(599,304)	chemin[79].mechant=1.4	chemin[79].rayon=40000

--chemin[62]=point.new(0,0)
--chemin[63]=point.new(-40,0)
--chemin[64]=point.new(-40,300)]]

obstacle0nb=0

--obstaclenb=0--
--obstacle1nb=0--
obstaclenb=50 --83--nombre de point definissant les petits obstacles
obstacle={}
obstacle[1]=point.new(262,-276)
obstacle[2]=point.new(343,-270)
obstacle[3]=point.new(188,-273)
obstacle[4]=point.new(133,-261)
obstacle[5]=point.new(84,-253)
obstacle[6]=point.new(22,-273)
obstacle[7]=point.new(-22,-256)
obstacle[8]=point.new(-91,-257)
obstacle[9]=point.new(-163,-261)
obstacle[10]=point.new(-237,-259)
obstacle[11]=point.new(-309,-254)
obstacle[12]=point.new(-373,-253)
obstacle[13]=point.new(-347,-47)
obstacle[14]=point.new(-106,289)
obstacle[15]=point.new(-500,38)
obstacle[16]=point.new(-220,286)
obstacle[17]=point.new(-310,291)
obstacle[18]=point.new(159,-32)
obstacle[19]=point.new(187,15)
obstacle[20]=point.new(151,42)
obstacle[21]=point.new(100,-46)
obstacle[22]=point.new(88,28)
obstacle[23]=point.new(-167,280)
obstacle[24]=point.new(253,230)
obstacle[25]=point.new(464,-47)
obstacle[26]=point.new(458,18)
obstacle[27]=point.new(21,-102)
obstacle[28]=point.new(-385,14)
obstacle[29]=point.new(-380,61)
obstacle[30]=point.new(-385,-54)
obstacle[31]=point.new(-502,-14)
obstacle[32]=point.new(-249,-29)
obstacle[33]=point.new(-210,-24)
obstacle[34]=point.new(-163,-24)
obstacle[35]=point.new(-132,-31)
obstacle[36]=point.new(-145,143)
obstacle[37]=point.new(-45,65)
obstacle[38]=point.new(-82,29)
obstacle[39]=point.new(-43,-148)
obstacle[40]=point.new(-115,-92)
obstacle[41]=point.new(28,66)
obstacle[42]=point.new(-287,98)
obstacle[43]=point.new(290,-126)
obstacle[44]=point.new(345,88)
obstacle[45]=point.new(427,160)
obstacle[46]=point.new(-433,150)
obstacle[47]=point.new(-394,122)
obstacle[48]=point.new(81,126)
obstacle[49]=point.new(307,24)
obstacle[50]=point.new(381,126)

obstacle1nb=8 --7--nombre de point definisant le nombre de point du gros obstacle
obstacle1={}--gros cercle
obstacle1[1]=point.new(-590,-130)
obstacle1[2]=point.new(-612,-25)
obstacle1[3]=point.new(-614,33)
obstacle1[4]=point.new(349,302)
obstacle1[5]=point.new(201,334)
obstacle1[6]=point.new(48,304)
obstacle1[7]=point.new(590,-56)
obstacle1[8]=point.new(580,19)
--mine:
mineinfo={}
mineinfo.nb=1
-- local i=0
-- while i<=mineinfo.nb do
-- 	mineinfo[i]={}
-- end
mineinfo[1]=point.new(65,-25)
mineinfo[1].nbmine=1

obstaclsold={}
obstaclsold.nb=0 --nombre d'obstacle ou les soldats ne peuvent pas aller.

 end
t.obsim=function()
if obstacleim==nil then
	obstacleim={}
end
obstacleim[1]=display.newImage(map13sheeto1,1)
obstacleim[1].anchorY=1
obstacleim[1].x=576.5
obstacleim[1].y=299

--#obstacleanim=0

--decoranim=nil

decoration={}
decoration[1]={}
decoration[1].x=-1212*0.3
decoration[1].y=907*0.3
decoration[1].type=16
decoration[1].planche=1
decoration[1].scale=0.3
decoration[1].anchorY=1

decoration[2]={}
decoration[2].x=-1070*0.3
decoration[2].y=795*0.3
decoration[2].type=1
decoration[2].planche=1
decoration[2].scale=0.3
decoration[2].anchorY=1

decoration[3]={}
decoration[3].x=-1088*0.3
decoration[3].y=-662*0.3
decoration[3].type=1
decoration[3].planche=1
decoration[3].scale=0.3
decoration[3].anchorY=1

decoration[4]={}
decoration[4].x=583*0.3
decoration[4].y=527*0.3
decoration[4].type=1
decoration[4].planche=1
decoration[4].scale=0.3
decoration[4].anchorY=1

decoration[5]={}
decoration[5].x=583*0.3
decoration[5].y=-527*0.3
decoration[5].type=1
decoration[5].planche=1
decoration[5].scale=0.3
decoration[5].anchorY=1

decoration[6]={}
decoration[6].x=1389*0.3
decoration[6].y=174*0.3
decoration[6].type=1
decoration[6].planche=1
decoration[6].scale=0.3
decoration[6].anchorY=1

decoration[7]={}
decoration[7].x=1380*0.3
decoration[7].y=-15*0.3
decoration[7].type=1
decoration[7].planche=2
decoration[7].scale=0.3
decoration[7].anchorY=1

end
t.vague=function()--donnees sur les vagues du niveau
vague={}
--nbvague=3--15
for k=1,leveldata[13].wave,1 do
	vague[k]={}
	vague[k][1]=200
end
vague[1]={237,-1,237,237,-1,237,-1,237,237,-1,237,237,-1,237,-1,237,237,-1,237,237,-1,237,-1,237,237,-1,237,237,-1,237,-1,237,237,-1,237,237,-1,237,237,-1,237,-1,237,237,-1,237,237,-1,237,-1,237,237,-1,237,237,-1,237,-1,237,237,-1,237,237,-1,237,-1,237,237,-1,237,237,-1,237,-1,237,237,237,-1,237,237,-1,237,-1,237,237,-1,237,237,-1,237,-1,237,237,-1,237,237,-1,237,-1,237,237,-1,237,237,-1,237,-1,237,237,-1,237,237,-1,237,-1,237,237,4,237,237,237,237,-1,4,237,237,237,237,1,4,237,237,237,237,-1,4,237,237,237,237,1,4,237,237,237,237,-1,4,237,237,237,237,1,4,237,237,237,237,1,-1,4,237,237,237,237,1,4,237,237,237,237,1,-1,2,237,237,-1,2,237,237,2,237,237,2,237,237,-1,2,237,237,-1,2,237,237,1,4,237,237,237,237,1,-1,4,237,237,237,237,1,8,237,237,237,237,237,237,237,237,1,-1,4,237,237,237,237,-1,4,237,237,237,237,1,4,237,237,237,237,4,237,237,237,237,1,-1,4,237,237,237,237,-1,4,237,237,237,1,4,237,237,237,237,4,237,237,237,237,1,-1,4,237,237,237,237,0,0,0,0,-1,5,205,205,205,205,205,0,1,5,205,205,205,205,205,0,-1,5,205,205,205,205,205,1,3,205,205,205,1,-1,2,205,205,0,0,0,0,0,0,-1,5,205,205,205,205,205,0,5,205,205,205,205,205,0,1,-1,5,205,205,205,205,205,0,1,5,205,205,205,205,205,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,205}
vague[2]={9,220,220,220,220,220,220,220,220,220,-1,9,220,220,220,220,220,220,220,220,220,4,220,220,220,220,-1,5,220,220,220,220,220,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,5,263,263,263,263,263,-1,5,263,263,263,263,263,0,5,263,263,263,263,263,-1,3,263,263,263,2,263,263,0,0,0,0,0,0,0,261,261,261,261,261,0,-1,261,-1,261,261,-1,261,0,0,0,0,261,261,261,261,0,0,261,261,0,-1,261,-1,261,261,0,-1,261,261,218,-1,218,218,-1,218,218,-1,218,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,237}
vague[3]={263,263,0,263,0,263,263,0,263,0,263,0,263,263,0,263,0,263,0,263,263,0,263,0,263,0,263,263,0,0,0,0,0,0,0,0,263,263,0,263,0,263,263,0,263,0,263,263,0,263,0,263,0,263,0,263,0,263,0,263,0,263,0,263,0,263,0,0,0,0,0,0,220,221,220,0,0,0,0,0,0,0,0,0,0,9,220,220,220,220,220,220,220,220,220,9,220,220,220,220,220,220,220,220,220,9,220,220,220,220,220,220,220,220,220,0,0,0,0,0,0,0,0,0,0,0,221,0,0,221,0,0,221,0,0,221,0,0,221,0,0,221,0,0,221,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,220}
vague[4]={2,220,220,2,220,220,2,220,220,2,220,220,2,220,220,2,220,220,2,220,220,2,220,220,2,220,220,2,220,220,2,220,220,2,220,220,2,220,220,2,220,220,2,220,220,2,220,220,2,220,220,2,220,220,2,220,220,2,220,220,2,220,220,2,220,220,2,220,220,2,220,220,2,220,220,2,220,220,2,220,220,2,220,220,2,220,220,2,220,220,2,220,220,2,220,220,2,220,220,2,220,220,2,220,220,2,220,220,2,220,220,2,220,220,2,220,220,2,220,220,2,220,220,2,220,220,2,220,220,2,220,220,2,220,220,2,220,220,2,220,220,2,220,220,2,220,220,2,220,220,2,220,220,2,220,220,2,220,220,2,220,220,2,220,220,2,220,220,2,220,220,2,220,220,2,220,220,2,220,220,2,220,220,2,220,220,2,220,220,2,220,220,2,220,220,2,220,220,2,220,220,2,220,220,2,220,220,2,220,220,2,220,220,2,220,220,2,220,220,2,220,220,2,220,220,2,220,220,2,220,220,2,220,220,2,220,220,2,220,220,2,220,220,2,220,220,2,220,220,2,220,220,0,0,0,0,0,0,0,0,0,0,0,0,0,221,221,221,221,221,221,221,221,0,0,0,0,0,0,0,0,0,0,0,0,0,220}
vague[5]={-1,9,237,237,237,237,237,237,237,237,237,-1,9,237,237,237,237,237,237,237,237,237,-1,9,237,237,237,237,237,237,237,237,237,-1,9,237,237,237,237,237,237,237,237,237,-1,9,237,237,237,237,237,237,237,237,237,0,0,0,0,0,0,0,0,0,0,-1,9,237,237,237,237,237,237,237,237,237,-1,9,237,237,237,237,237,237,237,237,237,-1,9,237,237,237,237,237,237,237,237,237,-1,9,237,237,237,237,237,237,237,237,237,-1,9,237,237,237,237,237,237,237,237,237,-1,9,237,237,237,237,237,237,237,237,237,-1,9,237,237,237,237,237,237,237,237,237,-1,9,237,237,237,237,237,237,237,237,237,-1,9,237,237,237,237,237,237,237,237,237,-1,9,237,237,237,237,237,237,237,237,237,-1,9,237,237,237,237,237,237,237,237,237,-1,9,237,237,237,237,237,237,237,237,237,-1,9,237,237,237,237,237,237,237,237,237,-1,9,237,237,237,237,237,237,237,237,237,-1,9,237,237,237,237,237,237,237,237,237,-1,9,237,237,237,237,237,237,237,237,237,-1,9,237,237,237,237,237,237,237,237,237,-1,9,237,237,237,237,237,237,237,237,237,0,0,0,0,0,0,0,-1,9,218,218,218,218,218,218,218,218,218,-1,9,218,218,218,218,218,218,218,218,218,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,237}
vague[6]={-1,2,262,262,-1,269,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,216,-1,216,-1,216,-1,216,-1,216,-1,216,-1,216,-1,216,-1,216,0,0,0,0,-1,216,-1,216,-1,216,-1,216,-1,216,-1,216,-1,216,-1,216,-1,216,0,0,0,0,-1,216,-1,216,-1,216,-1,216,-1,216,-1,216,-1,216,-1,216,-1,216,0,0,0,0,-1,216,-1,216,-1,216,-1,216,-1,216,-1,216,-1,216,-1,216,-1,216,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,237}
vague[7]={216,216,216,216,216,216,216,216,216,0,0,216,216,216,216,216,216,216,216,216,0,0,216,216,216,216,216,216,216,216,216,0,0,216,216,216,216,216,216,216,216,216,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,237}
vague[8]={-1,9,237,237,237,237,237,237,237,237,237,9,220,220,220,220,220,220,220,220,220,-1,9,237,237,237,237,237,237,237,237,237,9,220,220,220,220,220,220,220,220,220,-1,9,237,237,237,237,237,237,237,237,237,9,220,220,220,220,220,220,220,220,220,-1,9,237,237,237,237,237,237,237,237,237,9,220,220,220,220,220,220,220,220,220,0,0,0,0,0,0,-1,9,237,237,237,237,237,237,237,237,237,9,220,220,220,220,220,220,220,220,220,-1,9,237,237,237,237,237,237,237,237,237,9,220,220,220,220,220,220,220,220,220,-1,9,237,237,237,237,237,237,237,237,237,9,220,220,220,220,220,220,220,220,220,-1,9,237,237,237,237,237,237,237,237,237,9,220,220,220,220,220,220,220,220,220,-1,9,237,237,237,237,237,237,237,237,237,9,220,220,220,220,220,220,220,220,220,-1,9,237,237,237,237,237,237,237,237,237,9,220,220,220,220,220,220,220,220,220,-1,9,237,237,237,237,237,237,237,237,237,9,220,220,220,220,220,220,220,220,220,0,0,0,0,0,0,0,0,0,0,0,220}
vague[9]={-1,283,0,-1,283,0,0,-1,283,0,-1,283,0,-1,283,0,-1,283,0,-1,283,0,-1,283,0,-1,283,0,0,0,0,0,0,-1,283,0,-1,283,0,-1,283,0,-1,283,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,221,0,-1,221,0,-1,221,0,-1,221,0,-1,221,0,-1,221,0,-1,221,0,-1,221,0,-1,221,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,221}
vague[10]={-1,9,237,237,237,237,237,237,237,237,237,9,280,280,280,280,280,280,280,280,280,-1,281,-1,281,-1,281,-1,281,-1,281,-1,281,-1,281,-1,281,-1,281,9,282,282,282,282,282,282,282,282,282,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,283,-1,283,-1,283,0,0,-1,283,-1,283,-1,283,-1,284,-1,284,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,285,0,0,-1,285,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,269,-1,269}
-------------------------------------------------------------debut hugo-----------------------------------------------------
--0 retarde de la durer de spawn de 3 soldat et 1 de la durer de 1 soldat
--de 2 à 5 permet de spawner plusieurs soldat a la fois.
--vague[1].nb=2--nb soldat dans la vague

modeinfdif=0-- 0 pour facile, 1 pour normal, 2 pour difficile

end
t.vaguewave=function()
	vague={}
	vague[1]={4,268,268,268,268,-1,4,268,268,268,268,0,0,0,0,0,0,4,204,204,204,204,-1,4,204,204,204,204,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,5,237,237,237,237,237,-1,5,237,237,237,237,237,5,237,237,237,237,237,-1,5,237,237,237,237,237,5,237,237,237,237,237,-1,5,237,237,237,237,237,5,237,237,237,237,237,-1,5,237,237,237,237,237,5,237,237,237,237,237,-1,5,237,237,237,237,237,5,237,237,237,237,237,-1,5,237,237,237,237,237,5,237,237,237,237,237,-1,5,237,237,237,237,237,5,237,237,237,237,237,-1,5,237,237,237,237,237,5,237,237,237,237,237,-1,5,280,280,280,280,280,5,280,280,280,280,280,-1,5,280,280,280,280,280,5,280,280,280,280,280,-1,5,280,280,280,280,280,5,280,280,280,280,280,-1,5,280,280,280,280,280,5,280,280,280,280,280,-1,5,280,280,280,280,280,5,280,280,280,280,280,-1,5,280,280,280,280,280,5,280,280,280,280,280,-1,5,280,280,280,280,280,5,280,280,280,280,280,-1,5,280,280,280,280,280,5,280,280,280,280,280,-1,5,280,280,280,280,280,5,280,280,280,280,280,-1,5,280,280,280,280,280,5,280,280,280,280,280,-1,5,280,280,280,280,280,5,280,280,280,280,280,-1,5,280,280,280,280,280,5,280,280,280,280,280,-1,5,280,280,280,280,280,5,280,280,280,280,280,-1,5,280,280,280,280,280,5,280,280,280,280,280,-1,5,280,280,280,280,280,5,280,280,280,280,280,-1,5,280,280,280,280,280,5,280,280,280,280,280,-1,5,280,280,280,280,280,5,280,280,280,280,280,-1,5,280,280,280,280,280,5,280,280,280,280,280,-1,5,280,280,280,280,280,5,280,280,280,280,280,-1,5,280,280,280,280,280,5,280,280,280,280,280,-1,5,280,280,280,280,280,5,280,280,280,280,280,-1,5,280,280,280,280,280,5,280,280,280,280,280,-1,5,280,280,280,280,280,5,280,280,280,280,280,-1,5,280,280,280,280,280,5,280,280,280,280,280,-1,5,280,280,280,280,280,5,280,280,280,280,280,-1,5,280,280,280,280,280,5,280,280,280,280,280,-1,5,280,280,280,280,280,5,280,280,280,280,280,-1,5,280,280,280,280,280}
end
return t