

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
	if donneecharger[13]==0 then
		donneecharger[13]=1
		map13sheethg=graphics.newImageSheet( "carte/level13/hg.jpg", { width=2048, height=1024, numFrames=1,sheetContentWidth=2048,sheetContentHeight=1024 } )
		map13sheethd=graphics.newImageSheet( "carte/level13/hd.jpg", { width=2048, height=1024, numFrames=1,sheetContentWidth=2048,sheetContentHeight=1024 } )
		map13sheetbg=graphics.newImageSheet( "carte/level13/bg.jpg", { width=2048, height=1024, numFrames=1,sheetContentWidth=2048,sheetContentHeight=1024 } )
		map13sheetbd=graphics.newImageSheet( "carte/level13/bd.jpg", { width=2048, height=1024, numFrames=1,sheetContentWidth=2048,sheetContentHeight=1024 } )
		map13sheeto1=graphics.newImageSheet( "carte/level13/1.png", { width=189, height=175, numFrames=1,sheetContentWidth=189,sheetContentHeight=175 } )
	end
	hg=display.newImage(map13sheethg,1) --display.newImage( "carte/level2/hg.png", -1024,-512,true )
	hg.x=-1024
	hg.y=-512
	hd=display.newImage(map13sheethd,1) --display.newImage( "carte/level2/hd.png",1024,-512,true )
	hd.x=1024
	hd.y=-512
	bg=display.newImage(map13sheetbg,1) --display.newImage( "carte/level2/bg.png", -1024,512,true )
	bg.x=-1024
	bg.y=512
	bd=display.newImage(map13sheetbd,1) --display.newImage( "carte/level2/bd.png", 1024,512,true )
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
intersection[1]={pt=7, ty=1, un=9, deux=66, proba=1}
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
chemin[1]=point.new(-613,-308)
chemin[2]=point.new(-574,-283)
chemin[3]=point.new(-533,-259)
chemin[4]=point.new(-494,-235)
chemin[5]=point.new(-461,-208)
chemin[6]=point.new(-424,-182)
chemin[7]=point.new(-385,-155)
chemin[8]=point.new(-347,-130)
chemin[9]=point.new(-320,-108) -- -312,-108)
chemin[9].mechant=2
chemin[10]=point.new(-284,-143)
chemin[11]=point.new(-247,-168)
chemin[12]=point.new(-206,-174)
chemin[13]=point.new(-164,-168)
chemin[14]=point.new(-120,-156)
chemin[15]=point.new(-90,-129)
chemin[16]=point.new(-60,-100)
chemin[17]=point.new(-12,-96)
chemin[18]=point.new(33,-100)
chemin[19]=point.new(75,-104)
chemin[20]=point.new(118,-126)
chemin[21]=point.new(162,-134)
chemin[22]=point.new(206,-124)
chemin[23]=point.new(246,-107)
chemin[24]=point.new(278,-82)
chemin[25]=point.new(319,-102)
chemin[26]=point.new(354,-126)
chemin[27]=point.new(387,-155)
chemin[28]=point.new(424,-183)
chemin[29]=point.new(460,-202)
chemin[30]=point.new(497,-228)
chemin[31]=point.new(535,-254)
chemin[32]=point.new(571,-280)
chemin[33]=point.new(612,-304)
chemin[34]=point.new(-611,302)
chemin[35]=point.new(-563,287)
chemin[36]=point.new(-525,263)
chemin[37]=point.new(-489,235)
chemin[38]=point.new(-455,211)
chemin[39]=point.new(-417,183)
chemin[40]=point.new(-380,159)
chemin[41]=point.new(-343,133)
chemin[42]=point.new(-287,147)
chemin[43]=point.new(-248,165)
chemin[44]=point.new(-206,178)
chemin[45]=point.new(-164,185)
chemin[46]=point.new(-121,167)
chemin[47]=point.new(-87,138)
chemin[48]=point.new(-60,108)
chemin[49]=point.new(-14,110)
chemin[50]=point.new(31,116)
chemin[51]=point.new(77,125)
chemin[52]=point.new(120,134)
chemin[53]=point.new(165,138)
chemin[54]=point.new(209,128)
chemin[55]=point.new(255,103)
chemin[56]=point.new(302,107)
chemin[57]=point.new(342,129)
chemin[58]=point.new(384,151)
chemin[59]=point.new(418,177)
chemin[60]=point.new(451,209)
chemin[61]=point.new(488,234)
chemin[62]=point.new(537,268)
chemin[63]=point.new(568,287)
chemin[64]=point.new(-312,-63)
chemin[65]=point.new(-297,-23)
chemin[66]=point.new(-258,-2)
chemin[67]=point.new(-216,3)
chemin[68]=point.new(-169,2)
chemin[69]=point.new(-125,3)
chemin[70]=point.new(-323,83)
chemin[71]=point.new(-310,40) -- -300,41)
chemin[71].mechant=2.2
chemin[72]=point.new(-96,-31)
chemin[73]=point.new(-73,-65)
chemin[74]=point.new(-101,40)
chemin[75]=point.new(-78,63)
chemin[76]=point.new(273,-39)
chemin[77]=point.new(272,0)
chemin[78]=point.new(267,42)
chemin[79]=point.new(608,299)

--chemin[62]=point.new(0,0)
--chemin[63]=point.new(-40,0)
--chemin[64]=point.new(-40,300)]]

obstacle0nb=0

--obstaclenb=0--
--obstacle1nb=0--
obstaclenb=83--nombre de point definissant les petits obstacles
obstacle={}
obstacle[1]=point.new(-116,303)
obstacle[2]=point.new(-173,305)
obstacle[3]=point.new(-230,302)
obstacle[4]=point.new(-285,303)
obstacle[5]=point.new(-341,302)
obstacle[6]=point.new(-287,282)
obstacle[7]=point.new(-227,279)
obstacle[8]=point.new(-149,292)
obstacle[9]=point.new(-100,276)
obstacle[10]=point.new(-55,247)
obstacle[11]=point.new(119,240)
obstacle[12]=point.new(-606,-241)
obstacle[13]=point.new(-603,-192)
obstacle[14]=point.new(-604,-140)
obstacle[15]=point.new(-611,-83)
obstacle[16]=point.new(-611,-28)
obstacle[17]=point.new(-611,26)
obstacle[18]=point.new(-611,84)
obstacle[19]=point.new(-614,138)
obstacle[20]=point.new(-611,191)
obstacle[21]=point.new(-611,243)
obstacle[22]=point.new(-574,-197)
obstacle[23]=point.new(-578,-145)
obstacle[24]=point.new(-578,-90)
obstacle[25]=point.new(-582,-41)
obstacle[26]=point.new(-580,9)
obstacle[27]=point.new(-585,57)
obstacle[28]=point.new(-583,112)
obstacle[29]=point.new(-585,165)
obstacle[30]=point.new(-595,219)
obstacle[31]=point.new(-559,-27)
obstacle[32]=point.new(-499,-304)
obstacle[33]=point.new(-442,-296)
obstacle[34]=point.new(-380,-295)
obstacle[35]=point.new(-307,-291)
obstacle[36]=point.new(-248,-295)
obstacle[37]=point.new(-186,-298)
obstacle[38]=point.new(-129,-291)
obstacle[39]=point.new(-80,-293)
obstacle[40]=point.new(-408,-285)
obstacle[41]=point.new(-349,-280)
obstacle[42]=point.new(-218,-285)
obstacle[43]=point.new(-162,-283)
obstacle[44]=point.new(-5,-291)
obstacle[45]=point.new(47,-236)
obstacle[46]=point.new(103,-223)
obstacle[47]=point.new(181,-212)
obstacle[48]=point.new(138,-204)
obstacle[49]=point.new(226,-202)
obstacle[50]=point.new(234,-246)
obstacle[51]=point.new(76,-226)
obstacle[52]=point.new(18,-257)
obstacle[53]=point.new(70,-298)
obstacle[54]=point.new(106,-296)
obstacle[55]=point.new(161,-288)
obstacle[56]=point.new(229,-295)
obstacle[57]=point.new(309,-303)
obstacle[58]=point.new(358,-296)
obstacle[59]=point.new(257,-274)
obstacle[60]=point.new(439,-290)
obstacle[61]=point.new(402,-290)
obstacle[62]=point.new(498,-301)
obstacle[63]=point.new(520,-306)
obstacle[64]=point.new(512,7)
obstacle[65]=point.new(492,-30)
obstacle[66]=point.new(512,-77)
obstacle[67]=point.new(499,19)
obstacle[68]=point.new(495,53)
obstacle[69]=point.new(507,102)
obstacle[70]=point.new(483,295)
obstacle[71]=point.new(247,225) -- 247,219)
obstacle[72]=point.new(169,-78)
obstacle[73]=point.new(149,-53)
obstacle[74]=point.new(185,33)
obstacle[75]=point.new(154,82)
obstacle[76]=point.new(166,-4)
obstacle[77]=point.new(213,-27)
obstacle[78]=point.new(-200,85)
obstacle[79]=point.new(-197,-102)
obstacle[80]=point.new(86,-48)
obstacle[81]=point.new(86,38)
obstacle[82]=point.new(-63,105)
obstacle[83]=point.new(71,-4)

obstacle1nb=7--nombre de point definisant le nombre de point du gros obstacle
obstacle1={}--gros cercle
obstacle1[1]=point.new(35,314)
obstacle1[2]=point.new(177,330)
obstacle1[3]=point.new(319,314)
obstacle1[4]=point.new(607,-151)
obstacle1[5]=point.new(605,-93)
obstacle1[6]=point.new(607,20)
obstacle1[7]=point.new(607,128)
--mine:
mineinfo={}
mineinfo.nb=1
-- local i=0
-- while i<=mineinfo.nb do
-- 	mineinfo[i]={}
-- end
mineinfo[1]=point.new(87,1)
mineinfo[1].nbmine=1

obstaclsold={}
obstaclsold.nb=0 --nombre d'obstacle ou les soldats ne peuvent pas aller.

 end
t.obsim=function()
if obstacleim==nil then
	obstacleim={}
end
local coordonneedu=#obstacleim+1
-- #obstacleim=2
-- --exemple
-- obstacleim={}
obstacleim[coordonneedu]=display.newImage(map13sheeto1,1)
obstacleim[coordonneedu].x=-660.5
obstacleim[coordonneedu].y=-324.5
obstacleim[coordonneedu+1]=display.newImage(map13sheeto1,1)
obstacleim[coordonneedu+1].x=-664.5
obstacleim[coordonneedu+1].y=283.5



--#obstacleanim=0

--decoranim=nil

decoration={}
decoration[2]={}
decoration[2].x=-489
decoration[2].y=-93
decoration[2].type=18
decoration[2].planche=1
decoration[2].scale=0.15
decoration[3]={}
decoration[3].x=-428
decoration[3].y=68
decoration[3].type=17 --bug--
decoration[3].planche=1
decoration[3].scale=0.2
decoration[4]={}
decoration[4].x=-16
decoration[4].y=-12
decoration[4].type=15
decoration[4].planche=1
decoration[4].scale=0.2
decoration[1]={}
decoration[1].x=365
decoration[1].y=-26
decoration[1].type=10
decoration[1].planche=1
decoration[1].scale=0.15



------------------------------------------------------------fin hugo---------------------------------------------------------------
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