local t={} --niveau inf
t.new=function()--gestion du niveau 4 du jeu, doit toujours suivre le meme modele
	--map1= display.newImage( "goh/carte/level2/carte1a.png", 0,0,true )--devrai etre en local pour niveau1
	-- map1p = display.newCircle(0,0,10)      --nil--display.newImage( "goh/carte/level2/carte1p.png", 0,0,true )
	-- map1p.isVisible=false
	pouvoirdisp=3
	-- modeinfini=true
	t=1
end
t.affichagecarte=function(pole)	
	if donneecharger[9]==0 then
		donneecharger[9]=1
		map9sheethg=graphics.newImageSheet( "goh/carte/level9/hd.jpg", { width=2048, height=1024, numFrames=1,sheetContentWidth=2048,sheetContentHeight=1024 } )
		map9sheethd=graphics.newImageSheet( "goh/carte/level9/hg.jpg", { width=2048, height=1024, numFrames=1,sheetContentWidth=2048,sheetContentHeight=1024 } )
		map9sheetbg=graphics.newImageSheet( "goh/carte/level9/bd.jpg", { width=2048, height=1024, numFrames=1,sheetContentWidth=2048,sheetContentHeight=1024 } )
		map9sheetbd=graphics.newImageSheet( "goh/carte/level9/bg.jpg", { width=2048, height=1024, numFrames=1,sheetContentWidth=2048,sheetContentHeight=1024 } )
		map9sheeto2=graphics.newImageSheet( "goh/carte/level9/rail.png", { width=899, height=199, numFrames=1,sheetContentWidth=899,sheetContentHeight=199 } )
	end
	hg=display.newImage(map9sheethg,1) --display.newImage( "goh/carte/level2/hd.png", -1024,-512,true )
	hg.x=-1024
	hg.y=-512
	hd=display.newImage(map9sheethd,1) --display.newImage( "goh/carte/level2/hg.png",1024,-512,true )
	hd.x=1024
	hd.y=-512
	bg=display.newImage(map9sheetbg,1) --display.newImage( "goh/carte/level2/bd.png", -1024,512,true )
	bg.x=-1024
	bg.y=512
	bd=display.newImage(map9sheetbd,1) --display.newImage( "goh/carte/level2/bg.png", 1024,512,true )
	bd.x=1024
	bd.y=512
	-- hg=display.newImage( "goh/carte/level3/hd.png", -1024,-512,true )
	-- hd=display.newImage( "goh/carte/level3/hg.png",1024,-512,true )
	-- bg=display.newImage( "goh/carte/level3/bd.png", -1024,512,true )
	-- bd=display.newImage( "goh/carte/level3/bg.png", 1024,512,true )
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

cheminnb=78-- --nombre de point definisant le chemin -1--------------------------------------------------------------------------------------------------
chemin={}
chemin[1]=point.new(-620,-312)	chemin[1].mechant=2		chemin[1].rayon=5000
chemin[2]=point.new(-572,-285)	chemin[2].mechant=1.5	chemin[2].rayon=2000
chemin[3]=point.new(-539,-247)	chemin[3].mechant=1.1	chemin[3].rayon=4200
chemin[4]=point.new(-517,-203)	chemin[4].mechant=1.6	chemin[4].rayon=6000
chemin[5]=point.new(-491,-165)	chemin[5].mechant=1.3	chemin[5].rayon=3500
chemin[6]=point.new(-460,-154)	chemin[6].mechant=1.1	chemin[6].rayon=4000
chemin[7]=point.new(-421,-142)	chemin[7].mechant=1.1	chemin[7].rayon=3500
chemin[8]=point.new(-380,-132)	chemin[8].mechant=1		chemin[8].rayon=3500
chemin[9]=point.new(-336,-130)	chemin[9].mechant=0.8	chemin[9].rayon=3500
chemin[10]=point.new(-290,-120)	chemin[10].mechant=0.4	chemin[10].rayon=1000
chemin[11]=point.new(-241,-108)	chemin[11].mechant=0.4	chemin[11].rayon=1000
chemin[12]=point.new(-200,-104)	chemin[12].mechant=0.4	chemin[12].rayon=26000
chemin[13]=point.new(-160,-100)	chemin[13].mechant=0.4	chemin[13].rayon=1000
chemin[14]=point.new(-125,-107)	chemin[14].mechant=0.4	chemin[14].rayon=1000
chemin[15]=point.new(-70,-113)	chemin[15].mechant=0.4	chemin[15].rayon=10000
chemin[16]=point.new(-19,-107)	chemin[16].mechant=1.5	chemin[16].rayon=8000
chemin[17]=point.new(16,-153)	chemin[17].mechant=1	chemin[17].rayon=3000
chemin[18]=point.new(48,-185)	chemin[18].mechant=1.1	chemin[18].rayon=3000
chemin[19]=point.new(86,-200)	chemin[19].mechant=1.1	chemin[19].rayon=3000
chemin[20]=point.new(130,-207)	chemin[20].mechant=1.2	chemin[20].rayon=3000
chemin[21]=point.new(173,-196)	chemin[21].mechant=1.1	chemin[21].rayon=3000
chemin[22]=point.new(212,-184)	chemin[22].mechant=0.9	chemin[22].rayon=3000
chemin[23]=point.new(246,-158)	chemin[23].mechant=1.2	chemin[23].rayon=3000
chemin[24]=point.new(277,-136)	chemin[24].mechant=1	chemin[24].rayon=3000
chemin[25]=point.new(314,-110)	chemin[25].mechant=1.8	chemin[25].rayon=3000
chemin[26]=point.new(349,-119)	chemin[26].mechant=1.7	chemin[26].rayon=3000
chemin[27]=point.new(391,-123)	chemin[27].mechant=1.6	chemin[27].rayon=3000
chemin[28]=point.new(436,-124)	chemin[28].mechant=1.4	chemin[28].rayon=3000
chemin[29]=point.new(477,-120)	chemin[29].mechant=1.4	chemin[29].rayon=3000
chemin[30]=point.new(518,-128)	chemin[30].mechant=1.8	chemin[30].rayon=3000
chemin[31]=point.new(566,-149)	chemin[31].mechant=2	chemin[31].rayon=3000
chemin[32]=point.new(617,-160)	chemin[32].mechant=1.8	chemin[32].rayon=3000
chemin[33]=point.new(2,-74)		chemin[33].mechant=1.2	chemin[33].rayon=3000
chemin[34]=point.new(28,-37)	chemin[34].mechant=1.3	chemin[34].rayon=3000
chemin[35]=point.new(68,-5)		chemin[35].mechant=2	chemin[35].rayon=3000
chemin[36]=point.new(111,-3)	chemin[36].mechant=1.4	chemin[36].rayon=3000
chemin[37]=point.new(156,-1)	chemin[37].mechant=1.2	chemin[37].rayon=3000
chemin[38]=point.new(196,-1)	chemin[38].mechant=1.4	chemin[38].rayon=3000
chemin[39]=point.new(232,2)		chemin[39].mechant=2	chemin[39].rayon=3000
chemin[40]=point.new(260,5)		chemin[40].mechant=2	chemin[40].rayon=3000
chemin[41]=point.new(279,-14)	chemin[41].mechant=1.2	chemin[41].rayon=3000
chemin[42]=point.new(297,-62)	chemin[42].mechant=1	chemin[42].rayon=3000
chemin[43]=point.new(-620,24)	chemin[43].mechant=1.3	chemin[43].rayon=3000
chemin[44]=point.new(-564,0)	chemin[44].mechant=1.2	chemin[44].rayon=3000
chemin[45]=point.new(-519,8)	chemin[45].mechant=1.1	chemin[45].rayon=3000
chemin[46]=point.new(-478,35)	chemin[46].mechant=1.2	chemin[46].rayon=3000
chemin[47]=point.new(-436,59)	chemin[47].mechant=1	chemin[47].rayon=3000
chemin[48]=point.new(-397,76)	chemin[48].mechant=1	chemin[48].rayon=3000
chemin[49]=point.new(-355,81)	chemin[49].mechant=0.8	chemin[49].rayon=3000
chemin[50]=point.new(-313,87)	chemin[50].mechant=0.4	chemin[50].rayon=3000
chemin[51]=point.new(-281,91)	chemin[51].mechant=0.4	chemin[51].rayon=3000
chemin[52]=point.new(-238,99)	chemin[52].mechant=0.4	chemin[52].rayon=3000
chemin[53]=point.new(-191,103)	chemin[53].mechant=0.4	chemin[53].rayon=30000
chemin[54]=point.new(-152,99)	chemin[54].mechant=0.4	chemin[54].rayon=3000
chemin[55]=point.new(-112,95)	chemin[55].mechant=0.4	chemin[55].rayon=3000
chemin[56]=point.new(-75,91)	chemin[56].mechant=0.4	chemin[56].rayon=3000
chemin[57]=point.new(-29,86)	chemin[57].mechant=1	chemin[57].rayon=3000
chemin[58]=point.new(11,107)	chemin[58].mechant=1	chemin[58].rayon=3000
chemin[59]=point.new(17,77)		chemin[59].mechant=1.2	chemin[59].rayon=5000
chemin[60]=point.new(48,39)		chemin[60].mechant=1	chemin[60].rayon=3000
chemin[61]=point.new(42,132)	chemin[61].mechant=1.2	chemin[61].rayon=3000
chemin[62]=point.new(73,167)	chemin[62].mechant=1.2	chemin[62].rayon=3500
chemin[63]=point.new(111,188)	chemin[63].mechant=1.8	chemin[63].rayon=3500
chemin[64]=point.new(161,195)	chemin[64].mechant=1.9	chemin[64].rayon=3000
chemin[65]=point.new(208,191)	chemin[65].mechant=1.9	chemin[65].rayon=5000
chemin[66]=point.new(245,176)	chemin[66].mechant=1.9	chemin[66].rayon=5000
chemin[67]=point.new(268,151)	chemin[67].mechant=1.6	chemin[67].rayon=4000
chemin[68]=point.new(292,128)	chemin[68].mechant=1.4	chemin[68].rayon=3300
chemin[69]=point.new(308,104)	chemin[69].mechant=1.8	chemin[69].rayon=3000
chemin[70]=point.new(289,49)	chemin[70].mechant=1.2	chemin[70].rayon=3000
chemin[71]=point.new(303,75)	chemin[71].mechant=1.3	chemin[71].rayon=3000
chemin[72]=point.new(347,98)	chemin[72].mechant=1.7	chemin[72].rayon=3000
chemin[73]=point.new(390,97)	chemin[73].mechant=1.6	chemin[73].rayon=3000
chemin[74]=point.new(430,99)	chemin[74].mechant=1.4	chemin[74].rayon=3000
chemin[75]=point.new(472,99)	chemin[75].mechant=1.4	chemin[75].rayon=3000
chemin[76]=point.new(514,96)	chemin[76].mechant=2	chemin[76].rayon=3000
chemin[77]=point.new(554,97)	chemin[77].mechant=2	chemin[77].rayon=3000
chemin[78]=point.new(590,108)	chemin[78].mechant=2	chemin[78].rayon=3000
chemin[79]=point.new(617,115)	chemin[79].mechant=2	chemin[79].rayon=5000

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
obstaclenb=66--59--nombre de point definissant les petits obstacles
obstacle={}
obstacle[1]=point.new(-580,-212)
obstacle[2]=point.new(-580,-127)
obstacle[3]=point.new(-560,-92)
obstacle[4]=point.new(-560,-46)
obstacle[5]=point.new(-595,159)
obstacle[6]=point.new(-532,200)
obstacle[7]=point.new(-467,205)
obstacle[8]=point.new(-399,214)
obstacle[9]=point.new(-338,226)
obstacle[10]=point.new(15,276)
obstacle[11]=point.new(-26,6)
obstacle[12]=point.new(-435,-297)
obstacle[13]=point.new(-490,-300)
obstacle[14]=point.new(87,284)
obstacle[15]=point.new(114,310)
obstacle[16]=point.new(-19,-222)
obstacle[17]=point.new(-39,-255)
obstacle[18]=point.new(-316,-183)
obstacle[19]=point.new(-321,55)
obstacle[20]=point.new(295,292)
obstacle[21]=point.new(461,-254)
obstacle[22]=point.new(419,-251)
obstacle[23]=point.new(220,-320)
obstacle[24]=point.new(-494,9)
obstacle[25]=point.new(-445,45)
obstacle[26]=point.new(-387,70)
obstacle[27]=point.new(-60,175)
obstacle[28]=point.new(-48,209)
obstacle[29]=point.new(-34,241)
obstacle[30]=point.new(45,121)
obstacle[31]=point.new(74,-38)
obstacle[32]=point.new(111,-25)
obstacle[33]=point.new(157,-22)
obstacle[34]=point.new(194,-22)
obstacle[35]=point.new(241,-26)
obstacle[36]=point.new(276,-62)
obstacle[37]=point.new(70,-211)
obstacle[38]=point.new(97,-216)
obstacle[39]=point.new(127,-220)
obstacle[40]=point.new(156,-215)
obstacle[41]=point.new(177,-205)
obstacle[42]=point.new(210,-193)
obstacle[43]=point.new(244,-175)
obstacle[44]=point.new(262,-161)
obstacle[45]=point.new(283,-143)
obstacle[46]=point.new(516,-143)
obstacle[47]=point.new(493,-135)
obstacle[48]=point.new(467,-134)
obstacle[49]=point.new(441,-138)
obstacle[50]=point.new(418,-138)
obstacle[51]=point.new(395,-138)
obstacle[52]=point.new(373,-135)
obstacle[53]=point.new(351,-132)
obstacle[54]=point.new(328,-128)
obstacle[55]=point.new(310,-130)
obstacle[56]=point.new(335,69)
obstacle[57]=point.new(337,76)
obstacle[58]=point.new(365,77)
obstacle[59]=point.new(393,76)
obstacle[60]=point.new(422,75)
obstacle[61]=point.new(447,70)
obstacle[62]=point.new(474,75)
obstacle[63]=point.new(499,75)
obstacle[64]=point.new(530,77)
obstacle[65]=point.new(560,77)
obstacle[66]=point.new(599,82)
-- obstacle[1]=point.new(-245,-280)
-- obstacle[1]=point.new(-42,287)
-- obstacle[2]=point.new(18,281)
-- obstacle[3]=point.new(80,292)
-- obstacle[4]=point.new(162,295)
-- obstacle[5]=point.new(317,302)
-- obstacle[6]=point.new(455,303)
-- obstacle[7]=point.new(390,294)
-- obstacle[8]=point.new(594,297)
-- obstacle[9]=point.new(514,292)
-- obstacle[10]=point.new(415,274)
-- obstacle[11]=point.new(468,260)
-- obstacle[12]=point.new(-530,263)
-- obstacle[13]=point.new(-499,230)
-- obstacle[14]=point.new(-463,211)
-- obstacle[15]=point.new(-562,212)
-- obstacle[16]=point.new(-515,173)
-- obstacle[17]=point.new(-606,-75)
-- obstacle[18]=point.new(-595,-145)
-- obstacle[19]=point.new(-604,-223)
-- obstacle[20]=point.new(-524,-308)
-- obstacle[21]=point.new(-483,-301)
-- obstacle[22]=point.new(-423,-303)
-- obstacle[23]=point.new(-614,292)
-- obstacle[24]=point.new(-613,214)
-- obstacle[25]=point.new(-600,146)
-- obstacle[26]=point.new(-600,95)
-- obstacle[27]=point.new(-352,-304)
-- obstacle[28]=point.new(24,-306)
-- obstacle[29]=point.new(81,-306)
-- obstacle[30]=point.new(140,-306)
-- obstacle[31]=point.new(221,-300)
-- obstacle[32]=point.new(296,-295)
-- obstacle[33]=point.new(356,-291)
-- obstacle[34]=point.new(428,-288)
-- obstacle[35]=point.new(498,-283)
-- obstacle[36]=point.new(602,-290)
-- obstacle[37]=point.new(599,-248)
-- obstacle[38]=point.new(543,-251)
-- obstacle[39]=point.new(511,-243)
-- obstacle[40]=point.new(468,-244)
-- obstacle[41]=point.new(423,-226)
-- obstacle[42]=point.new(372,-241)
-- obstacle[43]=point.new(322,-257)
-- obstacle[44]=point.new(602,-61)
-- obstacle[45]=point.new(600,-19)
-- obstacle[46]=point.new(586,12)
-- obstacle[47]=point.new(548,-32)
-- obstacle[48]=point.new(535,7)
-- obstacle[49]=point.new(96,165)
-- obstacle[50]=point.new(158,167)
-- obstacle[51]=point.new(148,-115)
-- obstacle[52]=point.new(213,-102)
-- obstacle[53]=point.new(-38,-72)
-- obstacle[54]=point.new(-28,-23)
-- obstacle[55]=point.new(-41,33)
-- obstacle[56]=point.new(608,219)
-- obstacle[57]=point.new(605,173)
-- obstacle[58]=point.new(612,77)
-- obstacle[59]=point.new(600,-179)
-- obstacle[60]=point.new(-35,-296)

obstacle1nb=11--11--nombre de point definisant le nombre de point du gros obstacle
obstacle1={}--gros cercle
obstacle1[1]=point.new(-246,-302)
obstacle1[2]=point.new(-144,301)
obstacle1[3]=point.new(610,298)
obstacle1[4]=point.new(513,302)
obstacle1[5]=point.new(417,301)
obstacle1[6]=point.new(366,-351)
obstacle1[7]=point.new(598,-303)
obstacle1[8]=point.new(101,-430)
obstacle1[9]=point.new(-530,305)
obstacle1[10]=point.new(-334,299)
obstacle1[11]=point.new(-100,-353)


-- obstacle1[1]=point.new(-395,290)
-- obstacle1[2]=point.new(-250,287)
-- obstacle1[3]=point.new(-154,287)
-- obstacle1[4]=point.new(-295,173)
-- obstacle1[5]=point.new(-198,131)
-- obstacle1[6]=point.new(-294,38)
-- obstacle1[7]=point.new(-169,-2)
-- obstacle1[8]=point.new(-242,-114)
-- obstacle1[9]=point.new(-178,-197)
-- obstacle1[10]=point.new(-217,-252)
-- obstacle1[11]=point.new(-160,-228)

obstaclsold={}
obstaclsold.nb=7--7 --nombre d'obstacle ou les soldats ne peuvent pas aller.
 obstaclsold[1]=point.new(-180,292)
 obstaclsold[1].rayon=30000
 obstaclsold[2]=point.new(-75,135)
 obstaclsold[2].rayon=888
 obstaclsold[3]=point.new(-301,133)
 obstaclsold[3].rayon=888
 obstaclsold[4]=point.new(-300,-72)
 obstaclsold[4].rayon=1000
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
mineinfo[1]=point.new(170,92)
mineinfo[1].nbmine=1

 end
t.obsim=function()
if obstacleim==nil then
	obstacleim={}
end
obstacleim[1]=display.newImage(map9sheeto2,1)
obstacleim[1].anchorY=1
obstacleim[1].x=-649
obstacleim[1].y=-303
obstacleim[2]=display.newImage(map9sheeto2,1)
obstacleim[2].anchorY=1
obstacleim[2].x=-649
obstacleim[2].y=385
if decoranim==nil then
	decoranim={}
end
decoration={}
decoration[1]={}
decoration[1].x=161
decoration[1].y=-25
decoration[1].type=9
decoration[1].planche=1
decoration[1].scale=0.3
decoration[1].anchorY=1
decoration[2]={}
decoration[2].x=473
decoration[2].y=10
decoration[2].type=9
decoration[2].planche=1
decoration[2].scale=0.3
decoration[2].anchorY=1
decoration[3]={}
decoration[3].x=518
decoration[3].y=-22
decoration[3].type=10
decoration[3].planche=1
decoration[3].scale=0.3
decoration[3].anchorY=1


end
t.vague=function()--donnees sur les vagues du niveau
vague={}
--nbvague=3--15
for k=1,leveldata[9].wave,1 do
	vague[k]={}
	vague[k][1]=200
end
vague[1]={3,206,206,206,-1,3,206,206,206,0,3,236,236,236,-1,3,236,236,236,236,-1,236,0,0,5,206,206,206,206,206,-1,5,206,206,206,206,206,0,0,0,0,0,0,2,264,264,-1,2,264,264,-1,264,0,0,264,3,270,270,270,-1,264,-1,3,270,270,270,2,236,236,-1,2,236,236,3,206,206,206,-1,3,206,206,206,0,3,206,206,206,-1,3,206,206,206,1,1,3,206,206,206,-1,3,206,206,206,0,0,236,236,236,236,-1,236,-1,236,-1,236,-1,236,-1,206,206,206,-1,236,-1,236}
vague[2]={265,265,-1,265,-1,265,1,3,236,236,236,-1,3,236,236,236,5,210,210,210,210,210,-1,5,210,210,210,210,210,0,5,210,210,210,210,210,-1,5,210,210,210,210,210,0,-10,219,-1,219,0,0,0,0,267,267,267,267,267,-1,267,-1,267,-1,267,-1,267,-1,267,0,0,9,200,200,200,200,200,200,200,200,200,-1,9,200,200,200,200,200,200,200,200,200,0,3,205,205,205,-1,3,205,205,205,0,219,219,219,-1,219,-1,219,-1,219,0,0,200}
vague[3]={5,200,200,200,200,-1,7,200,200,200,200,200,200,200,0,9,200,200,200,200,200,200,200,200,200,-1,7,200,200,200,200,200,200,200,5,205,205,205,205,205,-1,5,205,205,205,205,205,0,-10,219,-1,219,0,0,0,9,200,200,200,200,200,200,200,200,200,-1,9,200,200,200,200,200,200,200,200,200,1,9,200,200,200,200,200,200,200,200,200,-1,9,200,200,200,200,200,200,200,200,200,1,9,200,200,200,200,200,200,200,200,200,-1,9,200,200,200,200,200,200,200,200,200,-10,2,219,219,-1,2,219,219}
vague[4]={9,205,205,205,205,205,205,205,205,205,-1,9,205,205,205,205,205,205,205,205,205,1,2,219,219,-1,2,219,219,0,0,0,9,200,200,200,200,200,200,200,200,200,1,9,200,200,200,200,200,200,200,200,200,-1,3,267,267,267,-1,3,267,267,267,-1,3,267,267,267,0,3,267,267,267,3,267,267,267,3,267,267,267}
vague[5]={-1,5,267,267,267,267,267,5,267,267,267,267,267,2,219,219,-1,2,219,219,0,0,0,0,-10,5,270,270,270,270,270,-1,3,270,270,270,1,-10,5,270,270,270,270,270,-1,3,270,270,270,0,-10,5,270,270,270,270,270,-1,3,270,270,270,1,-10,5,270,270,270,270,270,-1,3,270,270,270,0,-10,5,270,270,270,270,270,-1,3,270,270,270,-10,5,270,270,270,270,270,-1,3,270,270,270,1,-10,5,270,270,270,270,270,-1,3,270,270,270,-10,5,270,270,270,270,270,-1,3,270,270,270,5,205,205,205,205,205,-1,5,205,205,205,205,205,5,205,205,205,205,205,-1,5,205,205,205,205,205,0,0,218,219,-1,218,-1,219,0,0,0,267}
vague[6]={-1,5,267,267,267,267,267,5,267,267,267,267,267,0,-1,5,267,267,267,267,267,5,267,267,267,267,267,0,5,271,271,271,271,271,-1,5,271,271,271,271,271,0,0,9,206,206,206,206,206,206,206,206,206,-1,9,206,206,206,206,206,206,206,206,206,9,206,206,206,206,206,206,206,206,206,-1,9,206,206,206,206,206,206,206,206,206,9,206,206,206,206,206,206,206,206,206,-1,9,206,206,206,206,206,206,206,206,206,0,0,5,267,267,267,267,267,-1,5,267,267,267,267,267,5,267,267,267,267,267,-1,5,267,267,267,267,267}
vague[7]={-1,5,267,267,267,267,267,5,267,267,267,267,267,-1,5,267,267,267,267,267,5,267,267,267,267,267,0,-1,5,267,267,267,267,267,5,267,267,267,267,267,-1,5,267,267,267,267,267,5,267,267,267,267,267,-1,9,206,206,206,206,206,206,206,206,206,9,206,206,206,206,206,206,206,206,206,-1,9,206,206,206,206,206,206,206,206,206,9,206,206,206,206,206,206,206,206,206,-1,9,206,206,206,206,206,206,206,206,206,0,-1,9,206,206,206,206,206,206,206,206,206,9,206,206,206,206,206,206,206,206,206,-1,9,206,206,206,206,206,206,206,206,206,9,206,206,206,206,206,206,206,206,206,-1,9,206,206,206,206,206,206,206,206,206,-1,9,267,267,267,267,267,267,267,267,267,9,267,267,267,267,267,267,267,267,267,-1,9,267,267,267,267,267,267,267,267,267,9,267,267,267,267,267,267,267,267,267,272,-1,272}
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
