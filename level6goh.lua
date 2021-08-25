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
	if donneecharger[6]==0 then
		donneecharger[6]=1
		map6sheethg=graphics.newImageSheet( "goh/carte/level6/hd.jpg", { width=2048, height=1024, numFrames=1,sheetContentWidth=2048,sheetContentHeight=1024 } )
		map6sheethd=graphics.newImageSheet( "goh/carte/level6/hg.jpg", { width=2048, height=1024, numFrames=1,sheetContentWidth=2048,sheetContentHeight=1024 } )
		map6sheetbg=graphics.newImageSheet( "goh/carte/level6/bd.jpg", { width=2048, height=1024, numFrames=1,sheetContentWidth=2048,sheetContentHeight=1024 } )
		map6sheetbd=graphics.newImageSheet( "goh/carte/level6/bg.jpg", { width=2048, height=1024, numFrames=1,sheetContentWidth=2048,sheetContentHeight=1024 } )
	end
	hg=display.newImage(map6sheethg,1) --display.newImage( "goh/carte/level2/hd.jpg", -1024,-512,true )
	hg.x=-1024
	hg.y=-512
	hd=display.newImage(map6sheethd,1) --display.newImage( "goh/carte/level2/hg.jpg",1024,-512,true )
	hd.x=1024
	hd.y=-512
	bg=display.newImage(map6sheetbg,1) --display.newImage( "goh/carte/level2/bd.jpg", -1024,512,true )
	bg.x=-1024
	bg.y=512
	bd=display.newImage(map6sheetbd,1) --display.newImage( "goh/carte/level2/bg.jpg", 1024,512,true )
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
	local tunededep=400
	local nbperso=leveldata[6].life
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
pointdep[1]=47
pointdeppro={}
pointdeppro[2]=0.04 -- probabilité pour le levelinf de l'entré numero i (pointdep[i+1]) , pour une meme probabilité que sur les autres entré mettre 0.5. Min 0, max 1, avec deux chiffres apres la virgule max

intersection={}
intersection.nb=1
intersection[1]={pt=45, ty=0, un=49}
cheminnb=57-- --nombre de point definisant le chemin -1--------------------------------------------------------------------------------------------------
chemin={}
chemin[1]=point.new(-378,-308)	chemin[1].mechant=1.7	chemin[1].rayon=5000
chemin[2]=point.new(-389,-265)	chemin[2].mechant=1.7	chemin[2].rayon=5000
chemin[3]=point.new(-398,-223)	chemin[3].mechant=1.7	chemin[3].rayon=5000
chemin[4]=point.new(-409,-181)	chemin[4].mechant=1.7	chemin[4].rayon=5000
chemin[5]=point.new(-420,-137)	chemin[5].mechant=1.7	chemin[5].rayon=5000
chemin[6]=point.new(-429,-94)	chemin[6].mechant=1.7	chemin[6].rayon=5000
chemin[7]=point.new(-440,-48)	chemin[7].mechant=1.7	chemin[7].rayon=5000
chemin[8]=point.new(-451,-4)	chemin[8].mechant=1.7	chemin[8].rayon=5000
chemin[9]=point.new(-460,40)	chemin[9].mechant=1.7	chemin[9].rayon=5000
chemin[10]=point.new(-471,83)	chemin[10].mechant=1.7	chemin[10].rayon=5000
chemin[11]=point.new(-465,127)	chemin[11].mechant=1.7	chemin[11].rayon=5000
chemin[12]=point.new(-442,164)	chemin[12].mechant=1.7	chemin[12].rayon=5000
chemin[13]=point.new(-400,178)	chemin[13].mechant=1.7	chemin[13].rayon=5000
chemin[14]=point.new(-356,188)	chemin[14].mechant=1.7	chemin[14].rayon=5000
chemin[15]=point.new(-312,177)	chemin[15].mechant=1.9	chemin[15].rayon=5000
chemin[16]=point.new(-278,142)	chemin[16].mechant=2.2	chemin[16].rayon=5000
chemin[17]=point.new(-254,104)	chemin[17].mechant=1.8	chemin[17].rayon=5000
chemin[18]=point.new(-239,60)	chemin[18].mechant=1.7	chemin[18].rayon=5000
chemin[19]=point.new(-229,16)	chemin[19].mechant=1.7	chemin[19].rayon=5000
chemin[20]=point.new(-219,-20)	chemin[20].mechant=1.7	chemin[20].rayon=5000
chemin[21]=point.new(-211,-54)	chemin[21].mechant=1.7	chemin[21].rayon=5000
chemin[22]=point.new(-202,-87)	chemin[22].mechant=1.7	chemin[22].rayon=5000
chemin[23]=point.new(-192,-131)	chemin[23].mechant=1.8	chemin[23].rayon=5000
chemin[24]=point.new(-171,-182)	chemin[24].mechant=1.7	chemin[24].rayon=5000
chemin[25]=point.new(-134,-220)	chemin[25].mechant=1.3	chemin[25].rayon=5000
chemin[26]=point.new(-86,-235)	chemin[26].mechant=1.5	chemin[26].rayon=5000
chemin[27]=point.new(-39,-236)	chemin[27].mechant=1.4	chemin[27].rayon=5000
chemin[28]=point.new(-3,-212)	chemin[28].mechant=1.5	chemin[28].rayon=5000
chemin[29]=point.new(20,-176)	chemin[29].mechant=1.5	chemin[29].rayon=5000
chemin[30]=point.new(19,-134)	chemin[30].mechant=1.6	chemin[30].rayon=5000
chemin[31]=point.new(24,-86)	chemin[31].mechant=1.6	chemin[31].rayon=5000
chemin[32]=point.new(28,-37)	chemin[32].mechant=1.7	chemin[32].rayon=5000
chemin[33]=point.new(31,12)		chemin[33].mechant=1.7	chemin[33].rayon=5000
chemin[34]=point.new(35,57)		chemin[34].mechant=1.7	chemin[34].rayon=5000
chemin[35]=point.new(40,102)	chemin[35].mechant=1.7	chemin[35].rayon=5000
chemin[36]=point.new(59,148)	chemin[36].mechant=1.7	chemin[36].rayon=5000
chemin[37]=point.new(103,170)	chemin[37].mechant=1.7	chemin[37].rayon=5000
chemin[38]=point.new(150,172)	chemin[38].mechant=1.9	chemin[38].rayon=5000
chemin[39]=point.new(192,156)	chemin[39].mechant=1.9	chemin[39].rayon=5000
chemin[40]=point.new(233,128)	chemin[40].mechant=1.9	chemin[40].rayon=5000
chemin[41]=point.new(241,84)	chemin[41].mechant=2	chemin[41].rayon=5000
chemin[42]=point.new(244,39)	chemin[42].mechant=1.9	chemin[42].rayon=5000
chemin[43]=point.new(242,-8)	chemin[43].mechant=1.9	chemin[43].rayon=5000
chemin[44]=point.new(239,-54)	chemin[44].mechant=2	chemin[44].rayon=5000
chemin[45]=point.new(237,-100)	chemin[45].mechant=1.9	chemin[45].rayon=5000
chemin[46]=point.new(239,-148)	chemin[46].mechant=1.9	chemin[46].rayon=5000
chemin[47]=point.new(200,-261)	chemin[47].mechant=1	chemin[47].rayon=5000
chemin[48]=point.new(221,-235)	chemin[48].mechant=1.2	chemin[48].rayon=5000
chemin[49]=point.new(243,-208)	chemin[49].mechant=2	chemin[49].rayon=5000
chemin[50]=point.new(288,-218)	chemin[50].mechant=1.7	chemin[50].rayon=5000
chemin[51]=point.new(333,-232)	chemin[51].mechant=1.5	chemin[51].rayon=5000
chemin[52]=point.new(377,-226)	chemin[52].mechant=1.5	chemin[52].rayon=5000
chemin[53]=point.new(425,-223)	chemin[53].mechant=1.5	chemin[53].rayon=5000
chemin[54]=point.new(472,-217)	chemin[54].mechant=1.5	chemin[54].rayon=5000
chemin[55]=point.new(516,-214)	chemin[55].mechant=1.5	chemin[55].rayon=5000
chemin[56]=point.new(561,-208)	chemin[56].mechant=1.5	chemin[56].rayon=5000
chemin[57]=point.new(594,-207)	chemin[57].mechant=1.5	chemin[57].rayon=5000
chemin[58]=point.new(617,-204)	chemin[58].mechant=1.7	chemin[58].rayon=5000


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
obstaclenb=36--nombre de point definissant les petits obstacles
obstacle={}
obstacle[1]=point.new(423,-304)
obstacle[2]=point.new(460,-303)
obstacle[3]=point.new(-611,149)
obstacle[4]=point.new(-611,86)
obstacle[5]=point.new(-614,20)
obstacle[6]=point.new(-611,-46)
obstacle[7]=point.new(-609,-115)
obstacle[8]=point.new(-603,-182)
obstacle[9]=point.new(-603,-256)
obstacle[10]=point.new(-583,-308)
obstacle[11]=point.new(-508,-306)
obstacle[12]=point.new(-432,-304)
obstacle[13]=point.new(-469,-306)
obstacle[14]=point.new(-533,-308)
obstacle[15]=point.new(-573,-143)
obstacle[16]=point.new(-573,-182)
obstacle[17]=point.new(-584,-225)
obstacle[18]=point.new(-296,-304)
obstacle[19]=point.new(-261,-267)
obstacle[20]=point.new(-270,303)
obstacle[21]=point.new(-130,299)
obstacle[22]=point.new(-32,303)
obstacle[23]=point.new(-83,302)
obstacle[24]=point.new(52,302)
obstacle[25]=point.new(99,299)
obstacle[26]=point.new(146,299)
obstacle[27]=point.new(190,303)
obstacle[28]=point.new(239,303)
obstacle[29]=point.new(285,303)
obstacle[30]=point.new(337,300)
obstacle[31]=point.new(486,185)
obstacle[32]=point.new(607,-110)
obstacle[33]=point.new(607,-166)
obstacle[34]=point.new(260,-308)
obstacle[35]=point.new(312,-304)
obstacle[36]=point.new(372,-304)

obstacle1nb=8--nombre de point definisant le nombre de point du gros obstacle
obstacle1={}--gros cercle
obstacle1[1]=point.new(607,-306)
obstacle1[2]=point.new(454,302)
obstacle1[3]=point.new(-613,303)
obstacle1[4]=point.new(113,-308)
obstacle1[5]=point.new(-139,-306)
obstacle1[6]=point.new(607,299)
obstacle1[7]=point.new(607,193)
obstacle1[8]=point.new(607,42)

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
for k=1,leveldata[6].wave,1 do
	vague[k]={}
	vague[k][1]=200
end
vague[1]={5,203,203,203,203,203,207,208,0,0,0,0,9,207,207,207,207,207,207,207,207,207,1,1,9,207,207,207,207,207,207,207,207,207,0,0,0,0,0,0,0,0,0,0,0,0,203}
vague[2]={216,216,1,203,203,0,0,203,203,0,0,0,0,0,0,0,3,203,203,203,2,216,203,1,3,207,208,207,0,0,0,0,0,0,0,0,0,0,207,208,208,216,216,1,203,203,203,0,0,0,0,0,0,0,0,0,203}
vague[3]={5,203,203,203,203,203,0,4,216,1,203,203,1,216,0,5,207,208,207,208,207,208,0,0,0,0,0,0,0,0,0,0,0,9,203,203,203,203,203,203,203,203,203,0,0,0,0,0,0,9,207,208,207,207,208,207,208,207,208,0,0,0,0,0,0,0,0,0,0,0,216,203,216,203,216,203,216,203,216,203,216,203,207,203,208,203,207,203,0,0,0,0,0,0,0,0,0,203}
vague[4]={3,203,203,203,3,203,203,203,3,203,203,203,3,203,203,203,3,203,203,203,3,203,203,203,3,203,203,203,3,203,203,203,0,0,0,0,0,0,0,207,203,216,207,203,216,207,203,216,207,203,216,207,203,216,207,203,207,203,207,203,207,203,216,207,203,216,207,203,0,0,0,0,0,-1,203}
vague[5]={203,0,0,0,0,2,207,203,2,207,203,2,207,203,3,216,207,203,3,216,207,203,3,203,207,203,3,207,207,203,3,216,207,203,3,216,207,203,203,203,203,203,216,207,203,216,207,203,0,0,0,217,-1,203}
-------------------------------------------------------------debut hugo-----------------------------------------------------
--0 retarde de la durer de spawn de 3 soldat et 1 de la durer de 1 soldat
--de 2 à 5 permet de spawner plusieurs soldat a la fois.
--vague[1].nb=2--nb soldat dans la vague

modeinfdif=0-- 0 pour facile, 1 pour normal, 2 pour difficile

end
t.vaguewave=function()
	vague={}
	vague[1]={204,204,204,204,204,204,204,204,204,204,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,225}
end
return t