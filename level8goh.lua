

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
	if donneecharger[8]==0 then
		donneecharger[8]=1
		map8sheethg=graphics.newImageSheet( "goh/carte/level8/hd.jpg", { width=2048, height=1024, numFrames=1,sheetContentWidth=2048,sheetContentHeight=1024 } )
		map8sheethd=graphics.newImageSheet( "goh/carte/level8/hg.jpg", { width=2048, height=1024, numFrames=1,sheetContentWidth=2048,sheetContentHeight=1024 } )
		map8sheetbg=graphics.newImageSheet( "goh/carte/level8/bd.jpg", { width=2048, height=1024, numFrames=1,sheetContentWidth=2048,sheetContentHeight=1024 } )
		map8sheetbd=graphics.newImageSheet( "goh/carte/level8/bg.jpg", { width=2048, height=1024, numFrames=1,sheetContentWidth=2048,sheetContentHeight=1024 } )
		map8sheeto1=graphics.newImageSheet( "goh/carte/level8/left_mid_tree.png", { width=479, height=347, numFrames=1,sheetContentWidth=479,sheetContentHeight=347 } )
	end
	hg=display.newImage(map8sheethg,1) --display.newImage( "goh/carte/level2/hd.jpg", -1024,-512,true )
	hg.x=-1024
	hg.y=-512
	hd=display.newImage(map8sheethd,1) --display.newImage( "goh/carte/level2/hg.jpg",1024,-512,true )
	hd.x=1024
	hd.y=-512
	bg=display.newImage(map8sheetbg,1) --display.newImage( "goh/carte/level2/bd.jpg", -1024,512,true )
	bg.x=-1024
	bg.y=512
	bd=display.newImage(map8sheetbd,1) --display.newImage( "goh/carte/level2/bg.jpg", 1024,512,true )
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
	local nbperso=leveldata[8].life
	if modeinfini or modesquelette then
		tunededep=tunedep
		nbperso=10
	end
	argentdep=-(tunededep)*3--hugo-------------------------------------------------------------------
	ennemipassedep=nbperso--nombre d'ennemi qui peuvent encore passer avant qu'on perdre---hugo------------------------------------------------------------------------------------------------------------------
	
end
t.chemi=function()--donnees sur les differents points de la carte
local point= require( "point" )
genepointinit=10
cheminarr=nil
----------------------------------------------------------------------------------------hugo debut -----------------------------------------------------------------------
pointdep={}--entré secondaire 
pointdep[1]=13

intersection={}
intersection.nb=20
intersection[1]={pt=3, ty=1, un=5, deux=9, proba=1}
intersection[2]={pt=7, ty=0, un=24}
intersection[3]={pt=21, ty=0, un=34}
intersection[4]={pt=11, ty=0, un=42}
intersection[5]={pt=42, ty=1, un=45, deux=46, proba=1}
intersection[6]={pt=44, ty=0, un=39}
intersection[7]={pt=45, ty=0, un=32}
intersection[8]={pt=32, ty=0, un=47}
intersection[9]={pt=46, ty=1, un=48, deux=50, proba=1}
intersection[10]={pt=39, ty=0, un=52}
intersection[11]={pt=52, ty=1, un=54, deux=55, proba=1}
intersection[12]={pt=48, ty=0, un=56}
intersection[13]={pt=50, ty=0, un=61}
intersection[14]={pt=53, ty=0, un=70}
intersection[15]={pt=59, ty=0, un=79}
intersection[16]={pt=76, ty=0, un=84}
intersection[17]={pt=67, ty=0, un=86}
intersection[18]={pt=84, ty=0, un=82}
intersection[19]={pt=86, ty=0, un=82}
intersection[20]={pt=82, ty=0, un=88}

cheminnb=88-- --nombre de point definisant le chemin -1--------------------------------------------------------------------------------------------------
chemin={}
chemin[1]=point.new(-617,5)		chemin[1].mechant=3	chemin[1].rayon=3500
chemin[2]=point.new(-568,2)		chemin[2].mechant=3	chemin[2].rayon=3500
chemin[3]=point.new(-505,4)		chemin[3].mechant=3	chemin[3].rayon=3500
chemin[4]=point.new(-471,3)		chemin[4].mechant=2	chemin[4].rayon=3500
chemin[5]=point.new(-461,45)	chemin[5].mechant=2	chemin[5].rayon=3500
chemin[6]=point.new(-463,89)	chemin[6].mechant=1.4	chemin[6].rayon=3500
chemin[7]=point.new(-460,131)	chemin[7].mechant=1.3	chemin[7].rayon=3500
chemin[8]=point.new(-430,162)	chemin[8].mechant=1.2	chemin[8].rayon=3500
chemin[9]=point.new(-423,-3)	chemin[9].mechant=2.5	chemin[9].rayon=3500
chemin[10]=point.new(-382,2)	chemin[10].mechant=2.2	chemin[10].rayon=3500
chemin[11]=point.new(-343,1)	chemin[11].mechant=2.2	chemin[11].rayon=3500
chemin[12]=point.new(-306,-1)	chemin[12].mechant=2.2	chemin[12].rayon=3500
chemin[13]=point.new(-617,0)	chemin[13].mechant=3	chemin[13].rayon=3500
chemin[14]=point.new(-541,3)	chemin[14].mechant=3	chemin[14].rayon=3500
chemin[15]=point.new(-484,-21)	chemin[15].mechant=2	chemin[15].rayon=3500
chemin[16]=point.new(-465,-62)	chemin[16].mechant=1.5	chemin[16].rayon=3500
chemin[17]=point.new(-460,-112)	chemin[17].mechant=1.4	chemin[17].rayon=3500
chemin[18]=point.new(-454,-151)	chemin[18].mechant=1.3	chemin[18].rayon=3500
chemin[19]=point.new(-415,-179)	chemin[19].mechant=1.1	chemin[19].rayon=3500
chemin[20]=point.new(-372,-198)	chemin[20].mechant=1.2	chemin[20].rayon=3500
chemin[21]=point.new(-317,-201)	chemin[21].mechant=1.1	chemin[21].rayon=3500
chemin[22]=point.new(-274,-201)	chemin[22].mechant=1.1	chemin[22].rayon=3500
chemin[23]=point.new(-393,186)	chemin[23].mechant=1.3	chemin[23].rayon=3500
chemin[24]=point.new(-349,199)	chemin[24].mechant=1.3	chemin[24].rayon=3500
chemin[25]=point.new(-305,199)	chemin[25].mechant=1.3	chemin[25].rayon=3500
chemin[26]=point.new(-260,199)	chemin[26].mechant=1.3	chemin[26].rayon=3500
chemin[27]=point.new(-216,198)	chemin[27].mechant=1.3	chemin[27].rayon=3500
chemin[28]=point.new(-173,181)	chemin[28].mechant=1.2	chemin[28].rayon=3500
chemin[29]=point.new(-133,152)	chemin[29].mechant=1.2	chemin[29].rayon=3500
chemin[30]=point.new(-94,125)	chemin[30].mechant=1.5	chemin[30].rayon=3500
chemin[31]=point.new(-65,113)	chemin[31].mechant=2	chemin[31].rayon=3500
chemin[32]=point.new(-21,109)	chemin[32].mechant=2	chemin[32].rayon=3500
chemin[33]=point.new(29,112)	chemin[33].mechant=2	chemin[33].rayon=3500
chemin[34]=point.new(-231,-201)	chemin[34].mechant=1.3	chemin[34].rayon=3500
chemin[35]=point.new(-190,-195)	chemin[35].mechant=1.1	chemin[35].rayon=3500
chemin[36]=point.new(-153,-178)	chemin[36].mechant=1	chemin[36].rayon=3500
chemin[37]=point.new(-121,-153)	chemin[37].mechant=1.1	chemin[37].rayon=3500
chemin[38]=point.new(-85,-124)	chemin[38].mechant=1.5	chemin[38].rayon=3500
chemin[39]=point.new(-59,-111)	chemin[39].mechant=1.8	chemin[39].rayon=3500
chemin[40]=point.new(-21,-111)	chemin[40].mechant=2	chemin[40].rayon=3500
chemin[41]=point.new(-260,-2)	chemin[41].mechant=2.2	chemin[41].rayon=3500
chemin[42]=point.new(-218,-2)	chemin[42].mechant=2.2	chemin[42].rayon=3500
chemin[43]=point.new(-187,-2)	chemin[43].mechant=1.9	chemin[43].rayon=3500
chemin[44]=point.new(-152,-46)	chemin[44].mechant=1.3	chemin[44].rayon=3500
chemin[45]=point.new(-105,-79)	chemin[45].mechant=1.1	chemin[45].rayon=3500
chemin[46]=point.new(-130,58)	chemin[46].mechant=1.2	chemin[46].rayon=3500
chemin[47]=point.new(73,103)	chemin[47].mechant=1.7	chemin[47].rayon=3500
chemin[48]=point.new(106,70)	chemin[48].mechant=1.3	chemin[48].rayon=3500
chemin[49]=point.new(144,42)	chemin[49].mechant=1.3	chemin[49].rayon=3500
chemin[50]=point.new(101,133)	chemin[50].mechant=1.4	chemin[50].rayon=3500
chemin[51]=point.new(134,157)	chemin[51].mechant=1	chemin[51].rayon=3500
chemin[52]=point.new(21,-114)	chemin[52].mechant=2	chemin[52].rayon=3500
chemin[53]=point.new(65,-111)	chemin[53].mechant=1.4	chemin[53].rayon=3500
chemin[54]=point.new(101,-133)	chemin[54].mechant=1.3	chemin[54].rayon=3500
chemin[55]=point.new(109,-74)	chemin[55].mechant=1.2	chemin[55].rayon=3500
chemin[56]=point.new(152,-41)	chemin[56].mechant=1.4	chemin[56].rayon=3500
chemin[57]=point.new(187,2)		chemin[57].mechant=2.2	chemin[57].rayon=3500
chemin[58]=point.new(225,-4)	chemin[58].mechant=2.2	chemin[58].rayon=3500
chemin[59]=point.new(269,-2)	chemin[59].mechant=2.2	chemin[59].rayon=3500
chemin[60]=point.new(313,-3)	chemin[60].mechant=2.2	chemin[60].rayon=3500
chemin[61]=point.new(167,182)	chemin[61].mechant=1.1	chemin[61].rayon=3500
chemin[62]=point.new(204,198)	chemin[62].mechant=1.1	chemin[62].rayon=3500
chemin[63]=point.new(239,197)	chemin[63].mechant=1.2	chemin[63].rayon=3500
chemin[64]=point.new(273,195)	chemin[64].mechant=1.2	chemin[64].rayon=3500
chemin[65]=point.new(309,195)	chemin[65].mechant=1.2	chemin[65].rayon=3500
chemin[66]=point.new(355,195)	chemin[66].mechant=1.2	chemin[66].rayon=3500
chemin[67]=point.new(407,177)	chemin[67].mechant=1.2	chemin[67].rayon=3500
chemin[68]=point.new(449,152)	chemin[68].mechant=1.2	chemin[68].rayon=3500
chemin[69]=point.new(464,107)	chemin[69].mechant=1.3	chemin[69].rayon=3500
chemin[70]=point.new(139,-162)	chemin[70].mechant=1.2	chemin[70].rayon=3500
chemin[71]=point.new(171,-181)	chemin[71].mechant=1.1	chemin[71].rayon=3500
chemin[72]=point.new(200,-198)	chemin[72].mechant=1.3	chemin[72].rayon=3500
chemin[73]=point.new(241,-202)	chemin[73].mechant=1.3	chemin[73].rayon=3500
chemin[74]=point.new(281,-203)	chemin[74].mechant=1.3	chemin[74].rayon=3500
chemin[75]=point.new(324,-202)	chemin[75].mechant=1.3	chemin[75].rayon=3500
chemin[76]=point.new(374,-198)	chemin[76].mechant=1.3	chemin[76].rayon=3500
chemin[77]=point.new(413,-178)	chemin[77].mechant=1.1	chemin[77].rayon=3500
chemin[78]=point.new(452,-148)	chemin[78].mechant=1.1	chemin[78].rayon=3500
chemin[79]=point.new(352,-4)	chemin[79].mechant=2.2	chemin[79].rayon=3500
chemin[80]=point.new(401,-1)	chemin[80].mechant=2.2	chemin[80].rayon=3500
chemin[81]=point.new(447,-4)	chemin[81].mechant=2.2	chemin[81].rayon=3500
chemin[82]=point.new(483,-4)	chemin[82].mechant=2.2	chemin[82].rayon=3500
chemin[83]=point.new(524,-2)	chemin[83].mechant=2.2	chemin[83].rayon=3500
chemin[84]=point.new(460,-100)	chemin[84].mechant=1.3	chemin[84].rayon=3500
chemin[85]=point.new(460,-49)	chemin[85].mechant=1.6	chemin[85].rayon=3500
chemin[86]=point.new(465,65)	chemin[86].mechant=1.4	chemin[86].rayon=3500
chemin[87]=point.new(465,26)	chemin[87].mechant=1.8	chemin[87].rayon=3500
chemin[88]=point.new(562,-6)	chemin[88].mechant=2.2	chemin[88].rayon=3500
chemin[89]=point.new(617,-1)	chemin[89].mechant=2.2	chemin[89].rayon=3500

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
obstaclenb=39--nombre de point definissant les petits obstacles
obstacle={}
obstacle[1]=point.new(-429,-58)
obstacle[2]=point.new(-385,-30)
obstacle[3]=point.new(-158,-269)
obstacle[4]=point.new(-91,-270)
obstacle[5]=point.new(-28,-265)
obstacle[6]=point.new(38,-269)
obstacle[7]=point.new(95,-261)
obstacle[8]=point.new(159,-264)
obstacle[9]=point.new(234,-272)
obstacle[10]=point.new(300,-274)
obstacle[11]=point.new(358,-274)
obstacle[12]=point.new(420,-287)
obstacle[13]=point.new(483,-278)
obstacle[14]=point.new(568,-278)
obstacle[15]=point.new(607,-230)
obstacle[16]=point.new(612,-180)
obstacle[17]=point.new(612,-126)
obstacle[18]=point.new(563,-254)
obstacle[19]=point.new(470,294)
obstacle[20]=point.new(425,302)
obstacle[21]=point.new(138,303)
obstacle[22]=point.new(-468,300)
obstacle[23]=point.new(-575,194)
obstacle[24]=point.new(62,-249)
obstacle[25]=point.new(-65,-259)
obstacle[26]=point.new(-8,-264)
obstacle[27]=point.new(-125,-254)
obstacle[28]=point.new(426,45)
obstacle[29]=point.new(382,13)
obstacle[30]=point.new(384,-26)
obstacle[31]=point.new(428,-51)
obstacle[32]=point.new(-435,64)
obstacle[33]=point.new(-396,33)
obstacle[34]=point.new(358,-100)
obstacle[35]=point.new(398,-88)
obstacle[36]=point.new(320,140)
obstacle[37]=point.new(343,110)
obstacle[38]=point.new(392,117)
obstacle[39]=point.new(333,-65)


obstacle1nb=7--nombre de point definisant le nombre de point du gros obstacle
obstacle1={}--gros cercle
obstacle1[1]=point.new(-613,305)
obstacle1[2]=point.new(-536,-12)
obstacle1[3]=point.new(-609,-306)
obstacle1[4]=point.new(-609,-163)
obstacle1[5]=point.new(-456,-306)
obstacle1[6]=point.new(-305,-308)
obstacle1[7]=point.new(610,303)
--mine:
mineinfo={}
mineinfo.nb=2
-- local i=0
-- while i<=mineinfo.nb do
-- 	mineinfo[i]={}
-- end
mineinfo[1]=point.new(365,-130)
mineinfo[2]=point.new(368,99)

obstaclsold={}
obstaclsold.nb=0 --nombre d'obstacle ou les soldats ne peuvent pas aller.

--feupassesoldat={} -- premiere dimension dit le point ou peut y avoir des flammes

end
t.obsim=function()
if obstacleim==nil then
	obstacleim={}
end
obstacleim[1]=display.newImage(map8sheeto1,1)
obstacleim[1].anchorY=1
obstacleim[1].x=-1847
obstacleim[1].y=417
--#obstacleanim=0
if decoranim==nil then
	decoranim={}
end

decoration={}
decoration[1]={}
decoration[1].x=-1882.5*0.3
decoration[1].y=720*0.3
decoration[1].type=4
decoration[1].planche=2
decoration[1].scale=0.3
decoration[1].anchorY=1
end
t.vague=function()--donnees sur les vagues du niveau
vague={}
--nbvague=3--15
for k=1,leveldata[8].wave,1 do
	vague[k]={}
	vague[k][1]=200
end
vague[1]={-10,2,207,208,-1,2,207,208,1,-10,2,207,208,-1,2,207,208,-10,3,270,270,270,-1,3,270,270,270,1,-10,3,270,270,270,-1,3,270,270,270,0,-10,3,270,270,270,-1,3,270,270,270,0,1,-10,3,270,270,270,-1,3,270,270,270,1,-10,3,270,270,270,-1,3,270,270,270,0,-10,3,270,270,270,-1,3,270,270,270,0,0,0,-10,3,270,270,270,-1,3,270,270,270,0,1,-10,3,270,270,270,-1,3,270,270,270,0,-10,3,270,270,270,-1,3,270,270,270,0,0,0,-10,3,270,270,270,-1,3,270,270,270,1,-10,3,270,270,270,-1,3,270,270,270,0,-10,3,270,270,270,-1,3,270,270,270,-10,3,270,270,270,-1,3,270,270,270,1,-10,3,270,270,270,-1,3,270,270,270,0,-10,3,270,270,270,-1,3,270,270,270}
vague[2]={215,-1,2,215,215,2,216,216,-1,216,-10,4,270,270,270,270,-1,4,270,270,270,270,-10,4,270,270,270,270,-1,4,270,270,270,270,-10,4,270,270,270,270,-1,4,270,270,270,270,0,0,0,0,0,-10,4,270,270,270,270,-1,4,270,270,270,270,0,0,4,203,203,203,203,-1,4,203,203,203,203,0,0,0,0,9,203,203,203,203,203,203,203,203,203,-1,9,203,203,203,203,203,203,203,203,203}
vague[3]={203,0,0,0,5,263,263,263,263,263,-1,5,263,263,263,263,263,9,235,235,235,235,235,235,235,235,235,-1,9,235,235,235,235,235,235,235,235,235,1,1,9,235,235,235,235,235,235,235,235,235,-1,9,235,235,235,235,235,235,235,235,235,1,1,9,235,235,235,235,235,235,235,235,235,-1,9,235,235,235,235,235,235,235,235,235,0,0,0,0,262,-1,262}
vague[4]={4,207,208,207,207,-1,4,207,208,207,207,4,207,208,207,207,-1,4,207,208,207,207,0,0,9,235,235,235,235,235,235,235,235,235,-1,9,235,235,235,235,235,235,235,235,235,1,1,9,235,235,235,235,235,235,235,235,235,-1,9,235,235,235,235,235,235,235,235,235,1,1,9,235,235,235,235,235,235,235,235,235,-1,9,235,235,235,235,235,235,235,235,235,0,0,0,0,0,0,-10,3,270,270,270,-1,3,270,270,270,0,-10,3,270,270,270,-1,3,270,270,270,1,-10,3,270,270,270,-1,3,270,270,270,0,0,0,-10,3,270,270,270,-1,3,270,270,270,0,-10,3,270,270,270,-1,3,270,270,270,0,-10,3,270,270,270,-1,3,270,270,270,1,-10,3,270,270,270,-1,3,270,270,270,0,-10,3,270,270,270,-1,3,270,270,270,0,-10,3,270,270,270,-1,3,270,270,270,9,217,217,217,217,217,207,208,0,0,0,0,203}
vague[5]={203,0,0,0,9,207,208,207,208,207,207,207,208,208,0,-1,9,207,208,207,208,207,207,207,208,208,0,0,0,0,0,0,9,270,270,270,270,270,270,270,270,270,0,-1,9,270,270,270,270,270,270,270,270,270,0,0,0,9,235,235,235,235,235,235,235,235,235,0,-1,9,235,235,235,235,235,235,235,235,235,0,9,235,235,235,235,235,235,235,235,235,0,-1,9,235,235,235,235,235,235,235,235,235,0,9,235,235,235,235,235,235,235,235,235,0,-1,9,235,235,235,235,235,235,235,235,235,0,9,235,235,235,235,235,235,235,235,235,0,-1,9,235,235,235,235,235,235,235,235,235,0,-1,4,217,217,3,217,217,217,208,207,0,0,0,0,0,0,9,203,203,203,203,203,203,203,203,203}
vague[6]={203,0,0,0,0,0,204,0,0,-1,216,-1,216,-1,216,-1,216,-1,216,-1,216,-1,216,-1,216,-1,216,0,0,216,216,216,216,216,216,216,216,216,0,0,0,0,0,9,260,260,260,260,260,260,260,260,260,0,0,-1,9,260,260,260,260,260,260,260,260,260,0,1,9,260,260,260,260,260,260,260,260,260,0,1,1,-1,9,260,260,260,260,260,260,260,260,260}
vague[7]={9,207,208,207,208,207,207,207,208,208,-1,9,207,208,207,208,207,207,207,208,208,0,9,207,208,207,208,207,207,207,208,208,-1,9,207,208,207,208,207,207,207,208,208,204,204,-1,204,0,0,9,207,208,207,208,207,207,207,208,208,-1,9,207,208,207,208,207,207,207,208,208,9,207,208,207,208,207,207,207,208,208,-1,9,207,208,207,208,207,207,207,208,208}
-------------------------------------------------------------debut hugo-----------------------------------------------------
--0 retarde de la durer de spawn de 3 soldat et 1 de la durer de 1 soldat
--de 2 à 5 permet de spawner plusieurs soldat a la fois.
--vague[1].nb=2--nb soldat dans la vague

modeinfdif=0-- 0 pour facile, 1 pour normal, 2 pour difficile

end
t.vaguewave=function()
	vague={}
	vague[1]={5,216,216,216,216,216,5,216,216,216,216,216,5,216,216,216,216,216,5,216,216,216,216,216,5,216,216,216,216,216,5,221,221,221,221,221}
end
return t
