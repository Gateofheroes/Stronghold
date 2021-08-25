

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
	if donneecharger[7]==0 then
		donneecharger[7]=1
		map7sheethg=graphics.newImageSheet( "goh/carte/level7/hd.jpg", { width=2048, height=1024, numFrames=1,sheetContentWidth=2048,sheetContentHeight=1024 } )
		map7sheethd=graphics.newImageSheet( "goh/carte/level7/hg.jpg", { width=2048, height=1024, numFrames=1,sheetContentWidth=2048,sheetContentHeight=1024 } )
		map7sheetbg=graphics.newImageSheet( "goh/carte/level7/bd.jpg", { width=2048, height=1024, numFrames=1,sheetContentWidth=2048,sheetContentHeight=1024 } )
		map7sheetbd=graphics.newImageSheet( "goh/carte/level7/bg.jpg", { width=2048, height=1024, numFrames=1,sheetContentWidth=2048,sheetContentHeight=1024 } )
	end
	hg=display.newImage(map7sheethg,1) --display.newImage( "goh/carte/level2/hd.jpg", -1024,-512,true )
	hg.x=-1024
	hg.y=-512
	hd=display.newImage(map7sheethd,1) --display.newImage( "goh/carte/level2/hg.jpg",1024,-512,true )
	hd.x=1024
	hd.y=-512
	bg=display.newImage(map7sheetbg,1) --display.newImage( "goh/carte/level2/bd.jpg", -1024,512,true )
	bg.x=-1024
	bg.y=512
	bd=display.newImage(map7sheetbd,1) --display.newImage( "goh/carte/level2/bg.jpg", 1024,512,true )
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
genepointinit=53
cheminarr=nil
----------------------------------------------------------------------------------------hugo debut -----------------------------------------------------------------------
pointdep={}
pointdep[1]=14
pointdep[2]=27
pointdep[3]=43
pointdep[4]=54

pointdeppro={}
pointdeppro[2]=0.4 -- probabilité pour le levelinf de l'entré numero i (pointdep[i+1]) , pour une meme probabilité que sur les autres entré mettre 0.5. Min 0, max 1, avec deux chiffres apres la virgule max
pointdeppro[3]=0.4
pointdeppro[4]=0.1
pointdeppro[5]=0.1


intersection={}
intersection.nb=1
--exemple
intersection={}
intersection.nb=4
 intersection[1]={pt=12, ty=0, un=23}
 intersection[2]={pt=25, ty=0, un=41}
 intersection[3]={pt=41, ty=0, un=62}
 intersection[4]={pt=52, ty=0, un=61}
cheminnb=72-- --nombre de point definisant le chemin -1--------------------------------------------------------------------------------------------------
chemin={}

chemin[1]=point.new(-615,60)	chemin[1].mechant=1.5	    chemin[1].rayon=3200
chemin[2]=point.new(-578,60)	chemin[2].mechant=1.5	    chemin[2].rayon=3200
chemin[3]=point.new(-544,59)	chemin[3].mechant=1.4	    chemin[3].rayon=3200
chemin[4]=point.new(-504,58)	chemin[4].mechant=1.4	    chemin[4].rayon=3200
chemin[5]=point.new(-460,58)	chemin[5].mechant=1.5	    chemin[5].rayon=3200
chemin[6]=point.new(-419,47)	chemin[6].mechant=1.5	    chemin[6].rayon=3200
chemin[7]=point.new(-380,28)	chemin[7].mechant=1.5	    chemin[7].rayon=3200
chemin[8]=point.new(-343,3)	    chemin[8].mechant=1.5	    chemin[8].rayon=3200
chemin[9]=point.new(-312,4)		chemin[9].mechant=1.5	    chemin[9].rayon=3200
chemin[10]=point.new(-280,21)	chemin[10].mechant=1.5	chemin[10].rayon=3200
chemin[11]=point.new(-242,40)	chemin[11].mechant=1.5	chemin[11].rayon=3200
chemin[12]=point.new(-206,76)	chemin[12].mechant=1.7	chemin[12].rayon=3200
chemin[13]=point.new(-177,62)	chemin[13].mechant=1.7	chemin[13].rayon=3200
chemin[14]=point.new(-478,304)	chemin[14].mechant=1.5	chemin[14].rayon=3200
chemin[15]=point.new(-492,256)	chemin[15].mechant=1.6	chemin[15].rayon=3200
chemin[16]=point.new(-458,229)	chemin[16].mechant=1.5	chemin[16].rayon=3200
chemin[17]=point.new(-414,204)	chemin[17].mechant=1.5	chemin[17].rayon=3200
chemin[18]=point.new(-371,180)	chemin[18].mechant=1.5	chemin[18].rayon=3200
chemin[19]=point.new(-326,153)	chemin[19].mechant=1.5	chemin[19].rayon=3200
chemin[20]=point.new(-284,128)	chemin[20].mechant=1.5	chemin[20].rayon=3200
chemin[21]=point.new(-240,107)	chemin[21].mechant=1.5	chemin[21].rayon=3200
chemin[22]=point.new(-200,79)	chemin[22].mechant=1.7	chemin[22].rayon=3200
chemin[23]=point.new(-156,52)	chemin[23].mechant=1.6	chemin[23].rayon=3200
chemin[24]=point.new(-118,30)	chemin[24].mechant=1.5	chemin[24].rayon=3200
chemin[25]=point.new(-81,8)	    chemin[25].mechant=1.5	chemin[25].rayon=3200
chemin[26]=point.new(-38,-20)	chemin[26].mechant=1.5	chemin[26].rayon=3200
chemin[27]=point.new(-359,-306)	chemin[27].mechant=1.5	chemin[27].rayon=3200
chemin[28]=point.new(-392,-283)	chemin[28].mechant=1.5	chemin[28].rayon=3200
chemin[29]=point.new(-410,-268)	chemin[29].mechant=1.5	chemin[29].rayon=3200
chemin[30]=point.new(-381,-239)	chemin[30].mechant=1.5	chemin[30].rayon=3200
chemin[31]=point.new(-342,-220)	chemin[31].mechant=1.4	chemin[31].rayon=3200
chemin[32]=point.new(-306,-199)	chemin[32].mechant=1.4	chemin[32].rayon=3200
chemin[33]=point.new(-268,-176)	chemin[33].mechant=1.4	chemin[33].rayon=3200
chemin[34]=point.new(-226,-155)	chemin[34].mechant=1.4	chemin[34].rayon=3200
chemin[35]=point.new(-187,-134)	chemin[35].mechant=1.5	chemin[35].rayon=3200
chemin[36]=point.new(-150,-111)	chemin[36].mechant=1.5	chemin[36].rayon=3200
chemin[37]=point.new(-111,-88)	chemin[37].mechant=1.5	chemin[37].rayon=3200
chemin[38]=point.new(-73,-65)	chemin[38].mechant=1.5	chemin[38].rayon=3200
chemin[39]=point.new(-42,-43)	chemin[39].mechant=1.5	chemin[39].rayon=3200
chemin[40]=point.new(0,-25)	    chemin[40].mechant=1.2	chemin[40].rayon=3200
chemin[41]=point.new(38,-20)	chemin[41].mechant=1.2	chemin[41].rayon=3200
chemin[42]=point.new(64,-20)	chemin[42].mechant=1.5	chemin[42].rayon=3200
chemin[43]=point.new(28,-307)	chemin[43].mechant=1.6	chemin[43].rayon=3200
chemin[44]=point.new(27,-265)	chemin[44].mechant=1.6	chemin[44].rayon=3200
chemin[45]=point.new(23,-216)	chemin[45].mechant=1.6	chemin[45].rayon=3200
chemin[46]=point.new(-10,-202)	chemin[46].mechant=1.5	chemin[46].rayon=3200
chemin[47]=point.new(25,-179)	chemin[47].mechant=1.5	chemin[47].rayon=3200
chemin[48]=point.new(62,-150)	chemin[48].mechant=1.4	chemin[48].rayon=3200
chemin[49]=point.new(103,-129)	chemin[49].mechant=1.4	chemin[49].rayon=3200
chemin[50]=point.new(142,-103)	chemin[50].mechant=1.4	chemin[50].rayon=3200
chemin[51]=point.new(140,-77)	chemin[51].mechant=1.5	chemin[51].rayon=3200
chemin[52]=point.new(104,-47)	chemin[52].mechant=1.4	chemin[52].rayon=3200
chemin[53]=point.new(77,-17)	chemin[53].mechant=1.5	chemin[53].rayon=3200
chemin[54]=point.new(-27,302)	chemin[54].mechant=1.4	chemin[54].rayon=3200
chemin[55]=point.new(-13,254)	chemin[55].mechant=1.4	chemin[55].rayon=3200
chemin[56]=point.new(-13,209)	chemin[56].mechant=1.4	chemin[56].rayon=3200
chemin[57]=point.new(7,170)	    chemin[57].mechant=1.4	chemin[57].rayon=3200
chemin[58]=point.new(46,147)	chemin[58].mechant=1.4	chemin[58].rayon=3200
chemin[59]=point.new(82,120)	chemin[59].mechant=1.4	chemin[59].rayon=3200
chemin[60]=point.new(88,74)	    chemin[60].mechant=1.4	chemin[60].rayon=3200
chemin[61]=point.new(98,24)		chemin[61].mechant=1.5	chemin[61].rayon=3200
chemin[62]=point.new(145,29)	chemin[62].mechant=1.5	chemin[62].rayon=3200
chemin[63]=point.new(186,50)	chemin[63].mechant=1.5	chemin[63].rayon=3200
chemin[64]=point.new(218,63)	chemin[64].mechant=1.4	chemin[64].rayon=3200
chemin[65]=point.new(254,43)	chemin[65].mechant=1.4	chemin[65].rayon=3200
chemin[66]=point.new(295,25)	chemin[66].mechant=1.4	chemin[66].rayon=3200
chemin[67]=point.new(342,19)	chemin[67].mechant=1.5	chemin[67].rayon=3200
chemin[68]=point.new(395,18)	chemin[68].mechant=1.5	chemin[68].rayon=3200
chemin[69]=point.new(444,21)	chemin[69].mechant=1.5	chemin[69].rayon=3200
chemin[70]=point.new(493,19)	chemin[70].mechant=1.5	chemin[70].rayon=3200
chemin[71]=point.new(543,21)	chemin[71].mechant=1.5	chemin[71].rayon=3200
chemin[72]=point.new(590,29)	chemin[72].mechant=1.4	chemin[72].rayon=3200
chemin[73]=point.new(616,48)	chemin[73].mechant=1.4	chemin[73].rayon=3200

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
obstaclenb=29--nombre de point definissant les petits obstacles
obstacle={}
obstacle[1]=point.new(187,-109)
obstacle[2]=point.new(146,-74)
obstacle[3]=point.new(-604,-4)
obstacle[4]=point.new(-552,-28)
obstacle[5]=point.new(-419,-91)
obstacle[6]=point.new(-404,-127)
obstacle[7]=point.new(-478,-280)
obstacle[8]=point.new(-201,-306)
obstacle[9]=point.new(-159,-270)
obstacle[10]=point.new(149,-166)
obstacle[11]=point.new(206,-169)
obstacle[12]=point.new(262,-169)
obstacle[13]=point.new(321,-160)
obstacle[14]=point.new(381,-166)
obstacle[15]=point.new(446,-161)
obstacle[16]=point.new(509,-160)
obstacle[17]=point.new(564,-173)
obstacle[18]=point.new(366,170)
obstacle[19]=point.new(421,154)
obstacle[20]=point.new(470,159)
obstacle[21]=point.new(522,194)
obstacle[22]=point.new(-347,300)
obstacle[23]=point.new(-297,279)
obstacle[24]=point.new(-255,268)
obstacle[25]=point.new(-221,282)
obstacle[26]=point.new(-613,271)
obstacle[27]=point.new(-608,232)
obstacle[28]=point.new(-601,209)
obstacle[29]=point.new(-68,-204)

obstacle1nb=10--nombre de point definisant le nombre de point du gros obstacle
obstacle1={}--gros cercle
obstacle1[1]=point.new(314,-301)
obstacle1[2]=point.new(171,-301)
obstacle1[3]=point.new(-611,-306)
obstacle1[4]=point.new(-611,-165)
obstacle1[5]=point.new(-518,-139)
obstacle1[6]=point.new(607,300)
obstacle1[7]=point.new(451,299)
obstacle1[8]=point.new(296,305)
obstacle1[9]=point.new(603,-304)
obstacle1[10]=point.new(455,-303)
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
if decoranim==nil then
	decoranim={}
end
decoration={}
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
	vague[1]={230,207,208,-12,-1,5,235,235,235,235,235,-2,5,235,235,235,235,235,-3,5,235,235,235,235,235,-4,5,235,235,235,235,235,230,207,208,-12,-1,5,235,235,235,235,235,-2,5,235,235,235,235,235,-3,5,235,235,235,235,235,-4,5,235,235,235,235,235,230,207,208,-12,-1,5,235,235,235,235,235,-2,5,235,235,235,235,235,-3,5,235,235,235,235,235,-4,5,235,235,235,235,235,230,207,208,-12,-1,5,235,235,235,235,235,-2,5,235,235,235,235,235,-3,5,235,235,235,235,235,-4,5,235,235,235,235,235,230,207,208,-12,-1,5,235,235,235,235,235,-2,5,235,235,235,235,235,-3,5,235,235,235,235,235,-4,5,235,235,235,235,235,230,207,208,-12,-1,5,235,235,235,235,235,-2,5,235,235,235,235,235,-3,5,235,235,235,235,235,-4,5,235,235,235,235,235,230,207,208,-12,-1,5,235,235,235,235,235,-2,5,235,235,235,235,235,-3,5,235,235,235,235,235,-4,5,235,235,235,235,235,230,207,208,0,0,0,-12,-1,5,235,235,235,235,235,-2,5,235,235,235,235,235,-3,5,235,235,235,235,235,-4,5,235,235,235,235,235,230,207,208,-12,-1,5,235,235,235,235,235,-2,5,235,235,235,235,235,-3,5,235,235,235,235,235,-4,5,235,235,235,235,235,230,207,208,-12,-1,5,235,235,235,235,235,-2,5,235,235,235,235,235,-3,5,235,235,235,235,235,-4,5,235,235,235,235,235,230,207,208,-12,-1,5,235,235,235,235,235,-2,5,235,235,235,235,235,-3,5,235,235,235,235,235,-4,5,235,235,235,235,235}
end
return t