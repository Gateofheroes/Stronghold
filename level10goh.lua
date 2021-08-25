

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
	if donneecharger[10]==0 then
		donneecharger[10]=1
		map10sheethg=graphics.newImageSheet( "goh/carte/level10/hd.jpg", { width=2048, height=1024, numFrames=1,sheetContentWidth=2048,sheetContentHeight=1024 } )
		map10sheethd=graphics.newImageSheet( "goh/carte/level10/hg.jpg", { width=2048, height=1024, numFrames=1,sheetContentWidth=2048,sheetContentHeight=1024 } )
		map10sheetbg=graphics.newImageSheet( "goh/carte/level10/bd.jpg", { width=2048, height=1024, numFrames=1,sheetContentWidth=2048,sheetContentHeight=1024 } )
		map10sheetbd=graphics.newImageSheet( "goh/carte/level10/bg.jpg", { width=2048, height=1024, numFrames=1,sheetContentWidth=2048,sheetContentHeight=1024 } )
		map10sheeto1=graphics.newImageSheet( "goh/carte/level10/top_houses.png", { width=438, height=254, numFrames=1,sheetContentWidth=438,sheetContentHeight=254 } )
	end
	hg=display.newImage(map10sheethg,1) --display.newImage( "goh/carte/level2/hd.jpg", -1024,-512,true )
	hg.x=-1024
	hg.y=-512
	hd=display.newImage(map10sheethd,1) --display.newImage( "goh/carte/level2/hg.jpg",1024,-512,true )
	hd.x=1024
	hd.y=-512
	bg=display.newImage(map10sheetbg,1) --display.newImage( "goh/carte/level2/bd.jpg", -1024,512,true )
	bg.x=-1024
	bg.y=512
	bd=display.newImage(map10sheetbd,1) --display.newImage( "goh/carte/level2/bg.jpg", 1024,512,true )
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
	local tunededep=700
	local nbperso=leveldata[10].life
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
pointdep={}--entré secondaire 
pointdep[1]=11

cheminarr={} --si des chemins sont des arrivés
cheminarr[1]=53 --fin numero 2 du chemin

intersection={}
intersection.nb=4
intersection[1]={pt=9, ty=1, un=22, deux=34, proba=1}
intersection[2]={pt=19, ty=1, un=22, deux=34, proba=1}
intersection[3]={pt=32, ty=0, un=46}
intersection[4]={pt=45, ty=1, un=47, deux=55, proba=1}

cheminnb=61-- --nombre de point definisant le chemin -1--------------------------------------------------------------------------------------------------
chemin={}
chemin[1]=point.new(-617,-138)	chemin[1].mechant=1.1	chemin[1].rayon=6000
chemin[2]=point.new(-570,-142)	chemin[2].mechant=1.2	chemin[2].rayon=6000
chemin[3]=point.new(-526,-147)	chemin[3].mechant=1.3	chemin[3].rayon=6000
chemin[4]=point.new(-482,-135)	chemin[4].mechant=1.3	chemin[4].rayon=6000
chemin[5]=point.new(-437,-123)	chemin[5].mechant=1.3	chemin[5].rayon=6000
chemin[6]=point.new(-399,-99)	chemin[6].mechant=1.2	chemin[6].rayon=6000
chemin[7]=point.new(-366,-71)	chemin[7].mechant=1		chemin[7].rayon=6000
chemin[8]=point.new(-333,-45)	chemin[8].mechant=1.2	chemin[8].rayon=6000
chemin[9]=point.new(-307,-11)	chemin[9].mechant=1.6	chemin[9].rayon=3000
chemin[10]=point.new(-285,-1)	chemin[10].mechant=1.6	chemin[10].rayon=3000
chemin[11]=point.new(-617,132)	chemin[11].mechant=1.4	chemin[11].rayon=3000
chemin[12]=point.new(-570,134)	chemin[12].mechant=1.5	chemin[12].rayon=4000
chemin[13]=point.new(-530,131)	chemin[13].mechant=1.4	chemin[13].rayon=5000
chemin[14]=point.new(-487,128)	chemin[14].mechant=1.3	chemin[14].rayon=5000
chemin[15]=point.new(-441,118)	chemin[15].mechant=1.2	chemin[15].rayon=3000
chemin[16]=point.new(-406,99)	chemin[16].mechant=1.2	chemin[16].rayon=4000
chemin[17]=point.new(-370,72)	chemin[17].mechant=1.3	chemin[17].rayon=3000
chemin[18]=point.new(-348,39)	chemin[18].mechant=1.3	chemin[18].rayon=5000
chemin[19]=point.new(-304,8)	chemin[19].mechant=1.5	chemin[19].rayon=3000
chemin[20]=point.new(-285,-4)	chemin[20].mechant=1.6	chemin[20].rayon=3000
chemin[21]=point.new(-258,-59)	chemin[21].mechant=1.3	chemin[21].rayon=3000
chemin[22]=point.new(-214,-84)	chemin[22].mechant=1.2	chemin[22].rayon=3000
chemin[23]=point.new(-167,-95)	chemin[23].mechant=1.2	chemin[23].rayon=3000
chemin[24]=point.new(-120,-100)	chemin[24].mechant=1.1	chemin[24].rayon=3000
chemin[25]=point.new(-72,-109)	chemin[25].mechant=1.3	chemin[25].rayon=3000
chemin[26]=point.new(-24,-104)	chemin[26].mechant=1.5	chemin[26].rayon=3000
chemin[27]=point.new(20,-100)	chemin[27].mechant=1.5	chemin[27].rayon=3000
chemin[28]=point.new(64,-94)	chemin[28].mechant=1.4	chemin[28].rayon=3000
chemin[29]=point.new(113,-83)	chemin[29].mechant=1.1	chemin[29].rayon=3000
chemin[30]=point.new(158,-64)	chemin[30].mechant=1.2	chemin[30].rayon=3000
chemin[31]=point.new(202,-51)	chemin[31].mechant=1	chemin[31].rayon=3000
chemin[32]=point.new(247,-36)	chemin[32].mechant=1.5	chemin[32].rayon=3000
chemin[33]=point.new(289,-17)	chemin[33].mechant=1.6	chemin[33].rayon=3000
chemin[34]=point.new(-242,36)	chemin[34].mechant=1.2	chemin[34].rayon=3500
chemin[35]=point.new(-204,56)	chemin[35].mechant=1.4	chemin[35].rayon=3000
chemin[36]=point.new(-159,68)	chemin[36].mechant=1.6	chemin[36].rayon=3000
chemin[37]=point.new(-111,83)	chemin[37].mechant=1.3	chemin[37].rayon=3000
chemin[38]=point.new(-75,84)	chemin[38].mechant=1.2	chemin[38].rayon=3000
chemin[39]=point.new(-21,84)	chemin[39].mechant=1.3	chemin[39].rayon=3000
chemin[40]=point.new(23,82)		chemin[40].mechant=1.8	chemin[40].rayon=3000
chemin[41]=point.new(70,78)		chemin[41].mechant=1.6	chemin[41].rayon=3000
chemin[42]=point.new(118,80)	chemin[42].mechant=1.4	chemin[42].rayon=3000
chemin[43]=point.new(162,74)	chemin[43].mechant=1.2	chemin[43].rayon=3000
chemin[44]=point.new(204,53)	chemin[44].mechant=1.3	chemin[44].rayon=4000
chemin[45]=point.new(233,18)	chemin[45].mechant=1.3	chemin[45].rayon=4000
chemin[46]=point.new(309,-14)	chemin[46].mechant=1.8	chemin[46].rayon=3000
chemin[47]=point.new(337,-57)	chemin[47].mechant=1.4	chemin[47].rayon=3000
chemin[48]=point.new(367,-88)	chemin[48].mechant=1.6	chemin[48].rayon=3000
chemin[49]=point.new(396,-106)	chemin[49].mechant=1.7	chemin[49].rayon=3000
chemin[50]=point.new(443,-115)	chemin[50].mechant=1.4	chemin[50].rayon=3000
chemin[51]=point.new(484,-125)	chemin[51].mechant=1.4	chemin[51].rayon=3000
chemin[52]=point.new(533,-140)	chemin[52].mechant=1.5	chemin[52].rayon=3000
chemin[53]=point.new(575,-142)	chemin[53].mechant=1.6	chemin[53].rayon=3000
chemin[54]=point.new(617,-141)	chemin[54].mechant=1.5	chemin[54].rayon=3000
chemin[55]=point.new(333,31)	chemin[55].mechant=1.2	chemin[55].rayon=4000
chemin[56]=point.new(362,70)	chemin[56].mechant=1.4	chemin[56].rayon=4000
chemin[57]=point.new(398,97)	chemin[57].mechant=2	chemin[57].rayon=4000
chemin[58]=point.new(435,118)	chemin[58].mechant=1.9	chemin[58].rayon=3000
chemin[59]=point.new(477,128)	chemin[59].mechant=1.8	chemin[59].rayon=3000
chemin[60]=point.new(523,129)	chemin[60].mechant=1.8	chemin[60].rayon=3000
chemin[61]=point.new(567,124)	chemin[61].mechant=1.8	chemin[61].rayon=3000
chemin[62]=point.new(617,125)	chemin[62].mechant=1.2	chemin[62].rayon=3000



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
obstaclenb=52 --80--nombre de point definissant les petits obstacles
obstacle={}
obstacle[1]=point.new(-606,-68)
obstacle[2]=point.new(-523,-60)
obstacle[3]=point.new(424,279)
obstacle[4]=point.new(-496,-23)
obstacle[5]=point.new(-535,5)
obstacle[6]=point.new(-604,5)
obstacle[7]=point.new(237,168)
obstacle[8]=point.new(279,197)
obstacle[9]=point.new(194,185)
obstacle[10]=point.new(-241,166)
obstacle[11]=point.new(-322,170)
obstacle[12]=point.new(-410,-237)
obstacle[13]=point.new(-367,-285)
obstacle[14]=point.new(-306,-285)
obstacle[15]=point.new(-474,-277)
obstacle[16]=point.new(-568,-290)
obstacle[17]=point.new(444,-183)
obstacle[18]=point.new(603,-188)
obstacle[19]=point.new(-361,-242)
obstacle[20]=point.new(23,205)
obstacle[21]=point.new(131,178)
obstacle[22]=point.new(274,-62)
obstacle[23]=point.new(-283,149)
obstacle[24]=point.new(67,189)
obstacle[25]=point.new(560,229)
obstacle[26]=point.new(10,-184)
obstacle[27]=point.new(531,239)
obstacle[28]=point.new(-52,219)
obstacle[29]=point.new(362,-121)
obstacle[30]=point.new(-237,24)
obstacle[31]=point.new(-74,61)
obstacle[32]=point.new(-197,33)
obstacle[33]=point.new(-152,43)
obstacle[34]=point.new(21,52)
obstacle[35]=point.new(69,51)
obstacle[36]=point.new(-23,62)
obstacle[37]=point.new(-113,72)
obstacle[38]=point.new(155,55)
obstacle[39]=point.new(191,38)
obstacle[40]=point.new(115,58)
obstacle[41]=point.new(-245,-86)
obstacle[42]=point.new(-213,-99)
obstacle[43]=point.new(-185,-112)
obstacle[44]=point.new(-153,-116)
obstacle[45]=point.new(-124,-121)
obstacle[46]=point.new(-73,-125)
obstacle[47]=point.new(69,-109)
obstacle[48]=point.new(115,-96)
obstacle[49]=point.new(160,-77)
obstacle[50]=point.new(202,-66)
obstacle[51]=point.new(392,-125)
obstacle[52]=point.new(338,-94)

obstacle1nb=14 --4--nombre de point definisant le nombre de point du gros obstacle
obstacle1={}--gros cercle
obstacle1[1]=point.new(-133,-303)
obstacle1[2]=point.new(612,-11)
obstacle1[3]=point.new(-606,295)
obstacle1[4]=point.new(-444,301)
obstacle1[5]=point.new(-299,298)
obstacle1[6]=point.new(-159,320)
obstacle1[7]=point.new(-19,325)
obstacle1[8]=point.new(122,298)
obstacle1[9]=point.new(550,350)
obstacle1[10]=point.new(515,-306)
obstacle1[11]=point.new(239,-298)
obstacle1[12]=point.new(360,-300)
obstacle1[13]=point.new(58,-299)
obstacle1[14]=point.new(432,-16)

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
obstacleim[1]=display.newImage(map10sheeto1,1)
obstacleim[1].anchorY=1
obstacleim[1].x=1578
obstacleim[1].y=-148
obstacleim[2]=display.newImage(objetdec[2],6)
obstacleim[2].anchorY=1
obstacleim[2].x=275/0.3
obstacleim[2].y=-66/0.3

if decoranim==nil then
	decoranim={}
end
decoration={}
decoration[1]={}
decoration[1].x=943.5*0.3
decoration[1].y=150*0.3
decoration[1].type=6
decoration[1].planche=2
decoration[1].scale=0.3
decoration[1].anchorY=1

decoration[2]={}
decoration[2].x=-481
decoration[2].y=100
decoration[2].type=16
decoration[2].planche=1
decoration[2].anchorY=1
decoration[2].scale=0.3

decoration[3]={}
decoration[3].x=-407
decoration[3].y=-24
decoration[3].type=9
decoration[3].planche=1
decoration[3].anchorY=1
decoration[3].scale=0.3

decoration[4]={}
decoration[4].x=-348
decoration[4].y=-123
decoration[4].type=11
decoration[4].planche=1
decoration[4].anchorY=1
decoration[4].scale=0.3
decoration[5]={}
decoration[5].x=236
decoration[5].y=180
decoration[5].type=12
decoration[5].planche=1
decoration[5].anchorY=1
decoration[5].scale=0.3
decoration[6]={}
decoration[6].x=249
decoration[6].y=188
decoration[6].type=12
decoration[6].planche=1
decoration[6].anchorY=1
decoration[6].scale=0.3


end
t.vague=function()--donnees sur les vagues du niveau
vague={}
--nbvague=3--15
for k=1,leveldata[10].wave,1 do
	vague[k]={}
	vague[k][1]=200
end
vague[1]={-10,240,-1,240,-10,240,-1,240,-10,240,-1,240,-10,240,-1,240,-10,240,-1,240,-10,240,-1,240,-10,240,-1,240,-10,240,-1,240,-10,240,-1,240,-10,240,-1,240,-10,240,-1,240,272}
vague[2]={-10,272,-1,272,1,1,-10,4,240,240,240,240,-1,2,240,240,0,0,0,270,-1,270,0,0,0,-10,3,241,241,241,-1,5,241,241,241,241,241,0,-10,5,241,241,241,241,241,-1,5,241,241,241,241,241,1,1,-10,272,-1,272,-10,272,-1,272}
vague[3]={-10,2,242,242,-1,2,242,242,0,0,0,0,0,-10,3,270,270,270,-1,3,270,270,270,1,-10,270,-1,3,270,270,270,1,-10,270,-1,3,270,270,270,1,-10,270,-1,3,270,270,270,-10,2,272,272,-1,2,272,272,0,-10,2,242,242,-1,2,242,242}
vague[4]={200,0,0,0,0,0,-10,9,200,200,200,200,200,200,200,200,200,-1,5,264,264,264,264,264,0,-10,5,240,240,240,240,240,-1,5,240,240,240,240,240,0,1,-10,5,241,241,241,241,241,-1,5,241,241,241,241,241,0,0,-10,5,242,242,242,242,242,-1,5,242,242,242,242,242,0,0,0,0,-10,5,243,243,243,243,243,-1,4,243,243,243,243,0,0,0,272,-1,272,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-10,5,243,243,243,243,243,-1,4,243,243,243,243,0,0,-10,4,242,242,242,242,-1,5,242,242,242,242,242,0,0,-10,5,241,241,241,241,241,-1,5,241,241,241,241,241,0,0,-10,2,272,272,-1,2,272,272,0,-10,4,272,272,272,272,-1,2,272,272,0,-10,4,272,272,272,272,-1,2,272,272,0,-10,4,272,272,272,272,-1,2,272,272,0,0,0,0,200}
vague[5]={-10,2,272,272,-1,2,272,272,-10,2,272,272,-1,2,272,272,-10,2,272,272,-1,2,272,272,0,0,0,0,0,-10,5,270,270,270,270,270,-1,2,270,270,-10,5,270,270,270,270,270,-1,2,270,270,-10,5,270,270,270,270,270,-1,2,270,270,-10,5,270,270,270,270,270,-1,2,270,270,-10,5,270,270,270,270,270,-1,2,270,270,-10,5,270,270,270,270,270,-1,2,270,270,-10,5,270,270,270,270,270,-1,2,270,270,-10,5,270,270,270,270,270,-1,2,270,270,-10,3,243,243,243,-1,3,243,243,243,0,0,0,0,0,0,0,0,0,240}
vague[6]={-10,2,243,243,-1,5,270,270,270,270,270,1,-10,2,243,243,-1,5,270,270,270,270,270,1,-10,2,243,243,-1,5,270,270,270,270,270,0,0,0,0,0,-10,-1,2,267,267,272,-10,-1,2,267,267,272,-10,-1,2,267,267,272,-10,-1,2,267,267,272,-10,-1,2,267,267,-10,-1,2,267,267,-10,-1,2,267,267,272,-10,-1,2,267,267,-10,-1,2,267,267,-10,-1,2,267,267,272,0,0,0,270}
vague[7]={9,236,236,236,236,236,236,236,236,236,-1,9,236,236,236,236,236,236,236,236,236,1,9,236,236,236,236,236,236,236,236,236,0,-1,9,236,236,236,236,236,236,236,236,236,9,236,236,236,236,236,236,236,236,236,0,-1,9,236,236,236,236,236,236,236,236,236,0,9,236,236,236,236,236,236,236,236,236,1,-1,9,236,236,236,236,236,236,236,236,236,1,9,236,236,236,236,236,236,236,236,236,0,-1,9,236,236,236,236,236,236,236,236,236,1,9,236,236,236,236,236,236,236,236,236,1,-1,9,236,236,236,236,236,236,236,236,236,0,9,236,236,236,236,236,236,236,236,236,1,-1,9,236,236,236,236,236,236,236,236,236,9,243,243,243,243,243,243,243,243,243,-1,9,243,243,243,243,243,243,243,243,243,0,0,0,0,0,0,0,0,0,0,240}
vague[8]={204,-1,204,0,0,0,0,0,0,0,0,0,269}
-------------------------------------------------------------debut hugo-----------------------------------------------------
--0 retarde de la durer de spawn de 3 soldat et 1 de la durer de 1 soldat
--de 2 à 5 permet de spawner plusieurs soldat a la fois.
--vague[1].nb=2--nb soldat dans la vague

modeinfdif=0-- 0 pour facile, 1 pour normal, 2 pour difficile

end
t.vaguewave=function()
	vague={}
	vague[1]={-10,3,272,272,272,-1,3,272,272,272,-10,3,272,272,272,-1,3,272,272,272,-10,3,272,272,272,-1,3,272,272,272,-10,3,272,272,272,-1,3,272,272,272,-10,9,227,227,227,227,227,227,227,227,227,-1,9,227,227,227,227,227,227,227,227,227,-10,9,240,240,240,240,240,240,240,240,240,-1,9,240,240,240,240,240,240,240,240,240,0,0,0,-10,9,262,262,262,262,262,262,262,262,262,-1,9,262,262,262,262,262,262,262,262,262}
end
return t