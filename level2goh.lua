local t={}
t.new=function()--gestion du niveau 2 du jeu, doit toujours suivre le meme modele
	
	--map1= display.newImage( "goh/carte/level2/carte1a.jpg", 0,0,true )--devrai etre en local pour niveau1
	-- map1p = display.newCircle(0,0,10)      --nil--display.newImage( "goh/carte/level2/carte1p.jpg", 0,0,true )
	-- map1p.isVisible=false
	pouvoirdisp=0
	t=1
end
t.affichagecarte=function(pole)
	if donneecharger[2]==0 then
		donneecharger[2]=1
		map2sheethg=graphics.newImageSheet( "goh/carte/level2/hd.jpg", { width=2048, height=1024, numFrames=1,sheetContentWidth=2048,sheetContentHeight=1024 } )
		map2sheethd=graphics.newImageSheet( "goh/carte/level2/hg.jpg", { width=2048, height=1024, numFrames=1,sheetContentWidth=2048,sheetContentHeight=1024 } )
		map2sheetbg=graphics.newImageSheet( "goh/carte/level2/bd.jpg", { width=2048, height=1024, numFrames=1,sheetContentWidth=2048,sheetContentHeight=1024 } )
		map2sheetbd=graphics.newImageSheet( "goh/carte/level2/bg.jpg", { width=2048, height=1024, numFrames=1,sheetContentWidth=2048,sheetContentHeight=1024 } )
		map2sheeto1=graphics.newImageSheet( "goh/carte/level2/trees.png", { width=318, height=335, numFrames=1,sheetContentWidth=318,sheetContentHeight=335 } )
		map2sheeto2=graphics.newImageSheet( "goh/carte/level2/mid_lef_trees.png", { width=340, height=401, numFrames=1,sheetContentWidth=340,sheetContentHeight=401 } )
		--map2sheeto2=graphics.newImageSheet("goh/carte/level2/top_tree.png", { width=247, height=335, numFrames=1,sheetContentWidth=247,sheetContentHeight=335 } )
	end
		
	hg=display.newImage(map2sheethg,1) --display.newImage( "goh/carte/level2/hd.jpg", -1024,-512,true )
	hg.x=-1024
	hg.y=-512
	hd=display.newImage(map2sheethd,1) --display.newImage( "goh/carte/level2/hg.jpg",1024,-512,true )
	hd.x=1024
	hd.y=-512
	bg=display.newImage(map2sheetbg,1) --display.newImage( "goh/carte/level2/bd.jpg", -1024,512,true )
	bg.x=-1024
	bg.y=512
	bd=display.newImage(map2sheetbd,1) --display.newImage( "goh/carte/level2/bg.jpg", 1024,512,true )
	bd.x=1024
	bd.y=512
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
t.donneebase=function ()--donnees de bases sur le niveau
	local tunededep=200
	local nbperso=leveldata[2].life
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
intersection={}
intersection.nb=1
intersection[1]={pt=8, ty=2, un=11, deux=25, proba=2}
--intersection[2]={pt=1, ty=2, un=10, deux=20, proba=2}
--exemple
-- intersection[1]={pt=10, ty=1, un=12, deux=33,proba=1}--probabilité fait un si 0 sinon fait 2, proba dit qu'on genere une variable alea de 0 à proba donc quand proba vaut 1 on a un chance sur deux d'aller sur chaque chemin
-- intersection[2]={pt=30, ty=0, un=51,proba=1}
cheminnb=46-- --nombre de point definisant le chemin -1--------------------------------------------------------------------------------------------------
chemin={}
chemin[1]=point.new(-608,-142)	chemin[1].mechant=0.8		chemin[1].rayon=2000
chemin[2]=point.new(-568,-142)	chemin[2].mechant=0.9		chemin[2].rayon=2000
chemin[3]=point.new(-508,-139)	chemin[3].mechant=1.1		chemin[3].rayon=2000
chemin[4]=point.new(-464,-137)	chemin[4].mechant=1.2		chemin[4].rayon=2000
chemin[5]=point.new(-421,-137)	chemin[5].mechant=1.1		chemin[5].rayon=2000
chemin[6]=point.new(-379,-142)	chemin[6].mechant=1.1		chemin[6].rayon=2000
chemin[7]=point.new(-338,-140)	chemin[7].mechant=1.1		chemin[7].rayon=2000
chemin[8]=point.new(-295,-133)	chemin[8].mechant=1.1		chemin[8].rayon=2000
chemin[9]=point.new(-257,-128)	chemin[9].mechant=1		chemin[9].rayon=2000
chemin[10]=point.new(-220,-126)	chemin[10].mechant=1	chemin[10].rayon=2000
chemin[11]=point.new(-195,-115)	chemin[11].mechant=1	chemin[11].rayon=2000
chemin[12]=point.new(-180,-90)	chemin[12].mechant=1.2	chemin[12].rayon=2000
chemin[13]=point.new(-156,-35)	chemin[13].mechant=1.5	chemin[13].rayon=2000
chemin[14]=point.new(-103,26)	chemin[14].mechant=1.4	chemin[14].rayon=2000
chemin[15]=point.new(-45,84)	chemin[15].mechant=1.6	chemin[15].rayon=2000
chemin[16]=point.new(34,117)	chemin[16].mechant=1.7	chemin[16].rayon=2000
chemin[17]=point.new(119,133)	chemin[17].mechant=1.6	chemin[17].rayon=2000
chemin[18]=point.new(207,136)	chemin[18].mechant=1.6	chemin[18].rayon=2000
chemin[19]=point.new(251,134)	chemin[19].mechant=1	chemin[19].rayon=2000
chemin[20]=point.new(161,133)	chemin[20].mechant=1.6	chemin[20].rayon=2000
chemin[21]=point.new(73,128)	chemin[21].mechant=1.5	chemin[21].rayon=2000
chemin[22]=point.new(-8,105)	chemin[22].mechant=1.6	chemin[22].rayon=2000
chemin[23]=point.new(-76,56)	chemin[23].mechant=1.6	chemin[23].rayon=2000
chemin[24]=point.new(-125,-5)	chemin[24].mechant=1.5	chemin[24].rayon=2000
chemin[25]=point.new(-173,-75)	chemin[25].mechant=1.2	chemin[25].rayon=2000
chemin[26]=point.new(-141,-122)	chemin[26].mechant=1.2	chemin[26].rayon=2000
chemin[27]=point.new(-98,-130)	chemin[27].mechant=1.2	chemin[27].rayon=2000
chemin[28]=point.new(-57,-132)	chemin[28].mechant=1	chemin[28].rayon=2000
chemin[29]=point.new(-16,-132)	chemin[29].mechant=1	chemin[29].rayon=2000
chemin[30]=point.new(24,-131)	chemin[30].mechant=1	chemin[30].rayon=2000
chemin[31]=point.new(63,-130)	chemin[31].mechant=1	chemin[31].rayon=2000
chemin[32]=point.new(106,-129)	chemin[32].mechant=1	chemin[32].rayon=2000
chemin[33]=point.new(149,-127)	chemin[33].mechant=1.1	chemin[33].rayon=2000
chemin[34]=point.new(190,-122)	chemin[34].mechant=1.1	chemin[34].rayon=2000
chemin[35]=point.new(233,-114)	chemin[35].mechant=1	chemin[35].rayon=2000
chemin[36]=point.new(274,-105)	chemin[36].mechant=1.2	chemin[36].rayon=2000
chemin[37]=point.new(314,-83)	chemin[37].mechant=1.1	chemin[37].rayon=2000
chemin[38]=point.new(351,-60)	chemin[38].mechant=1.2	chemin[38].rayon=2000
chemin[39]=point.new(387,-38)	chemin[39].mechant=1.3	chemin[39].rayon=2000
chemin[40]=point.new(416,-8)	chemin[40].mechant=1.6	chemin[40].rayon=2000
chemin[41]=point.new(448,23)	chemin[41].mechant=1.7	chemin[41].rayon=2000
chemin[42]=point.new(477,55)	chemin[42].mechant=1.7	chemin[42].rayon=2000
chemin[43]=point.new(502,94)	chemin[43].mechant=1.5	chemin[43].rayon=2000
chemin[44]=point.new(524,131)	chemin[44].mechant=1.6	chemin[44].rayon=2000
chemin[45]=point.new(559,159)	chemin[45].mechant=1.6	chemin[45].rayon=2000
chemin[46]=point.new(596,183)	chemin[46].mechant=1.6	chemin[46].rayon=2000
chemin[47]=point.new(609,193)	chemin[47].mechant=1.6	chemin[47].rayon=2000

obstacle0nb=0

obstaclenb=88--nombre de point definissant les petits obstacles
obstacle={}
obstacle[1]=point.new(232,138)
obstacle[2]=point.new(131,193)
obstacle[3]=point.new(-600,-89)
obstacle[4]=point.new(-562,-86)
obstacle[5]=point.new(-551,-29)
obstacle[6]=point.new(-515,-3)
obstacle[7]=point.new(-471,26)
obstacle[8]=point.new(-413,32)
obstacle[9]=point.new(-232,113)
obstacle[10]=point.new(-221,155)
obstacle[11]=point.new(-224,203)
obstacle[12]=point.new(-173,214)
obstacle[13]=point.new(-131,240)
obstacle[14]=point.new(-75,253)
obstacle[15]=point.new(103,253)
obstacle[16]=point.new(2,256)
obstacle[17]=point.new(49,261)
obstacle[18]=point.new(160,243)
obstacle[19]=point.new(224,250)
obstacle[20]=point.new(283,247)
obstacle[21]=point.new(347,258)
obstacle[22]=point.new(399,284)
obstacle[23]=point.new(462,287)
obstacle[24]=point.new(556,248)
obstacle[25]=point.new(607,190)
obstacle[26]=point.new(608,159)
obstacle[27]=point.new(607,-130)
obstacle[28]=point.new(498,-158)
obstacle[29]=point.new(553,-139)
obstacle[30]=point.new(315,-228)
obstacle[31]=point.new(263,-228)
obstacle[32]=point.new(200,-238)
obstacle[33]=point.new(135,-248)
obstacle[34]=point.new(73,-269)
obstacle[35]=point.new(-10,-301)
obstacle[36]=point.new(163,-298)
obstacle[37]=point.new(234,-298)
obstacle[38]=point.new(-78,-300)
obstacle[39]=point.new(-53,-287)
obstacle[40]=point.new(-133,-278)
obstacle[41]=point.new(-185,-267)
obstacle[42]=point.new(-239,-261)
obstacle[43]=point.new(-294,-244)
obstacle[44]=point.new(-341,-215)
obstacle[45]=point.new(-289,-306)
obstacle[46]=point.new(-606,-143)
obstacle[47]=point.new(-533,-143)
obstacle[48]=point.new(-471,-140)
obstacle[49]=point.new(-424,-140)
obstacle[50]=point.new(-375,-140)
obstacle[51]=point.new(-321,-140)
obstacle[52]=point.new(-265,-119)
obstacle[53]=point.new(-211,-111)
obstacle[54]=point.new(-149,-111)
obstacle[55]=point.new(-97,-121)
obstacle[56]=point.new(-43,-127)
obstacle[57]=point.new(14,-125)
obstacle[58]=point.new(67,-129)
obstacle[59]=point.new(118,-124)
obstacle[60]=point.new(171,-119)
obstacle[61]=point.new(226,-104)
obstacle[62]=point.new(280,-93)
obstacle[63]=point.new(325,-74)
obstacle[64]=point.new(372,-45)
obstacle[65]=point.new(415,-7)
obstacle[66]=point.new(452,32)
obstacle[67]=point.new(483,77)
obstacle[68]=point.new(519,122)
obstacle[69]=point.new(558,164)
obstacle[70]=point.new(-175,-68)
obstacle[71]=point.new(-150,-24)
obstacle[72]=point.new(-116,18)
obstacle[73]=point.new(-83,60)
obstacle[74]=point.new(-36,92)
obstacle[75]=point.new(16,112)
obstacle[76]=point.new(72,123)
obstacle[77]=point.new(125,134)
obstacle[78]=point.new(179,141)
obstacle[79]=point.new(111,-30)
obstacle[80]=point.new(-144,-46)
obstacle[81]=point.new(439,3)
obstacle[82]=point.new(-113,16)
obstacle[83]=point.new(-97,31)
obstacle[84]=point.new(491,74)
obstacle[85]=point.new(520,120)
obstacle[86]=point.new(478,48)
obstacle[87]=point.new(524,120)
obstacle[88]=point.new(560,160)

obstacle1nb=9--nombre de point definisant le nombre de point du gros obstacle
obstacle1={}--gros cercle
obstacle1[1]=point.new(-591,-304)
obstacle1[2]=point.new(-443,-303)
obstacle1[3]=point.new(-578,247)
obstacle1[4]=point.new(-357,251)
obstacle1[5]=point.new(-351,127)
obstacle1[6]=point.new(-613,105)
obstacle1[7]=point.new(608,302)
obstacle1[8]=point.new(602,-251)
obstacle1[9]=point.new(423,-296)


--mine:
mineinfo={}
mineinfo.nb=1
mineinfo[1]=point.new(238,105)
mineinfo[1].nbmine=1
--mineinfo[1].nbmine1=2 --numero de la deuxieme intersection relié a la mine
------------------------------------------------------------fin hugo---------------------------------------------------------------
obstaclsold={}
obstaclsold.nb=0 --nombre d'obstacle ou les soldats ne peuvent pas aller.

end
t.obsim=function()
if obstacleim==nil then
	obstacleim={}
end
obstacleim[1]=display.newImage(map2sheeto1,1)
obstacleim[1].anchorY=1
obstacleim[1].x=-1895
obstacleim[1].y=-205
obstacleim[2]=display.newImage(objetdec[3],9)
obstacleim[2].anchorY=1
obstacleim[2].x=379
obstacleim[2].y=18
obstacleim[3]=display.newImage(objetdec[3],9)
obstacleim[3].anchorY=1
obstacleim[3].x=426
obstacleim[3].y=665
obstacleim[5]=display.newImage(map2sheeto2,1)
obstacleim[5].anchorY=1
obstacleim[5].x=-1187
obstacleim[5].y=245
-- obstacleim[4]=display.newImage(objetdec[3],9)
-- obstacleim[4].anchorY=1
-- obstacleim[4].x=379
-- obstacleim[4].y=-18
obstacleim[4]=display.newImage(objetdec[3],9)
obstacleim[4].anchorY=1
obstacleim[4].x=426
obstacleim[4].y=665

if decoranim==nil then
	decoranim={}
end

decoration={} -- ligne a mettre pour la création avec assistance
decoration[1]={}
decoration[1].x=-886*0.3
decoration[1].y=-240*0.3
decoration[1].type=5
decoration[1].planche=1
decoration[1].scale=0.3
decoration[1].anchorY=1

end
t.vague=function()--donnees sur les vagues du niveau
vague={}
local k=nil
--nbvague=3--nombre de vague dans le niveau--hugo--
--on met -1 quand c'est le dernier soldat
for k=1,leveldata[2].wave,1 do
	vague[k]={}
	vague[k][1]=200
end
-------------------------------------------------------------debut hugo-----------------------------------------------------
--0 retarde de la durer de spawn de 3 soldat et 1 de la durer de 1 soldat
--de 2 à 5 permet de spawner plusieurs soldat a la fois.
--vague[1].nb=2--nb soldat dans la vague
-- vague[2].nb=3
-- vague[3].nb=5
-- vague[4].nb=6
-- vague[5].nb=11
vague[1]={210,211,206,0,0,0,210,206,211,0,0,210,210,0,210,0,0,211,211,0,0,0,3,210,211,210,206}
vague[2]={206,202,0,0,0,0,0,0,210,211,210,210,0,0,0,206,212,0,0,0,0,0,214,214,0,214,0,0,0,211,0,0,210,211}
vague[3]={5,200,200,200,200,200,0,0,0,0,5,200,200,200,200,200,0,200,200,0,0,210,211,211,210,211,201,205}
vague[4]={3,267,267,267,0,0,0,0,5,200,200,200,200,200,0,0,0,5,201,205,201,205,201,0,0,0,0,0,0,0,0,0,5,206,206,206,206,206,0,210,211,211,210,211,201,0,0,5,201,205,201,205,201}

-- vagueaboss1=4

-- vague[1]={nb=24,2,260,260,217,217,0,0,0,210,210,210,0,0,210,210,210,0,0,5,210,210,210,210,210,0,0,0}
-- vague[2]={nb=50,0,0,0,0,203,5,203,203,203,203,203,5,203,202,205,206,201,0,0,5,203,203,203,203,203,5,203,203,203,203,203,5,203,203,203,203,203,5,203,203,203,203,203,0,0,5,260,261,262,263,264,3,265,266,267,204}
-- vague[3]={nb=48,204,1,5,204,204,204,204,204,204,0,0,5,210,210,210,210,210,5,210,210,210,210,210,5,210,210,210,210,210,5,210,210,210,210,210,0,0,5,203,203,203,203,203,5,203,203,203,203,203,5,203,203,203,203,203}
-- vague[1]={nb=60,260,0,0,261,203,1,203,2,203,203,4,203,203,203,203,5,203,203,203,203,203,0,0,0,5,203,203,203,203,203,5,203,203,203,203,203,5,203,203,203,203,203,5,203,203,203,203,203,5,203,203,203,203,203,5,203,203,203,203,203}

-- vague[1][1]=260
-- vague[1][2]=261

-- vague[2][1]=262
-- vague[2][2]=263
-- vague[2][3]=264

-- vague[3][1]=265
-- vague[3][2]=266
-- vague[3][3]=266
-- vague[3][4]=200
-- vague[3][5]=200

-- vague[4][1]=230
-- vague[4][2]=230
-- vague[4][3]=230
-- vague[4][4]=230
-- vague[4][5]=230
-- vague[4][6]=230

-- vague[5][1]=235
-- vague[5][2]=235
-- vague[5][3]=235
-- vague[5][4]=235
-- vague[5][5]=235
-- vague[5][6]=210
-- vague[5][7]=210
-- vague[5][8]=210
-- vague[5][9]=210
-- vague[5][10]=210
-- vague[5][11]=260

---------------------------------------------------------------------------fin hugo-------------------------------------------

end
t.vaguewave=function()
	vague={}
	vague[1]={9,206,206,206,206,206,206,206,206,206,9,206,206,206,206,206,206,206,206,206,9,206,206,206,206,206,206,206,206,206,9,206,206,206,206,206,206,206,206,206,9,206,206,206,206,206,206,206,206,206,9,206,206,206,206,206,206,206,206,206,9,206,206,206,206,206,206,206,206,206,9,206,206,206,206,206,206,206,206,206,9,206,206,206,206,206,206,206,206,206,9,206,206,206,206,206,206,206,206,206,9,206,206,206,206,206,206,206,206,206,9,206,206,206,206,206,206,206,206,206,9,206,206,206,206,206,206,206,206,206,9,206,206,206,206,206,206,206,206,206,9,206,206,206,206,206,206,206,206,206,9,206,206,206,206,206,206,206,206,206,9,206,206,206,206,206,206,206,206,206,9,206,206,206,206,206,206,206,206,206,9,206,206,206,206,206,206,206,206,206,9,206,206,206,206,206,206,206,206,206,9,206,206,206,206,206,206,206,206,206}
end
return t