local t={}
t.new=function()--gestion du niveau 1 du jeu, doit toujours suivre le meme modele

	-- map1=display.newImage(map1sheet,1) -- display.newImage( "goh/carte/level1/carte1a.jpg", 0,0,true )--devrai etre en local pour niveau1
	-- map1.x=0
	-- map1.y=0
	--map1p=display.newCircle(0,0,10) --display.newImage(map1psheet,1) -- display.newImage( "goh/carte/level1/carte1p.jpg", 0,0,true )
	--map1p.x=0
	--map1p.y=0
	--map1.xScale=2
	--map1.yScale=2
	pouvoirdisp=3
	--argent=300
	--ennemipasse=10--nombre d'ennemi qui peuvent encore passer avant qu'on perdre---------------------------------------------------------------------------------------------------------------------

	t=1
end
t.affichagecarte=function(pole)
	if donneecharger[14]==0 then
		donneecharger[14]=1
		map14sheethg=graphics.newImageSheet( "goh/carte/level14/hd.jpg", { width=2048, height=1024, numFrames=1,sheetContentWidth=2048,sheetContentHeight=1024 } )
		map14sheethd=graphics.newImageSheet( "goh/carte/level14/hg.jpg", { width=2048, height=1024, numFrames=1,sheetContentWidth=2048,sheetContentHeight=1024 } )
		map14sheetbg=graphics.newImageSheet( "goh/carte/level14/bd.jpg", { width=2048, height=1024, numFrames=1,sheetContentWidth=2048,sheetContentHeight=1024 } )
		map14sheetbd=graphics.newImageSheet( "goh/carte/level14/bg.jpg", { width=2048, height=1024, numFrames=1,sheetContentWidth=2048,sheetContentHeight=1024 } )
		map14sheeto1=graphics.newImageSheet( "goh/carte/level14/left_trees.png", { width=328, height=777, numFrames=1,sheetContentWidth=328,sheetContentHeight=777 } )
		map14sheeto2=graphics.newImageSheet( "goh/carte/level14/bttm_left_trees.png", { width=889, height=356, numFrames=1,sheetContentWidth=889,sheetContentHeight=356 } )
		map14sheeto3=graphics.newImageSheet( "goh/carte/level14/statue.png", { width=256, height=350, numFrames=6,sheetContentWidth=768,sheetContentHeight=700 } )
	end
		
	hg=display.newImage(map14sheethg,1) --display.newImage( "goh/carte/level2/hd.jpg", -1024,-512,true )
	hg.x=-1024
	hg.y=-512
	hd=display.newImage(map14sheethd,1) --display.newImage( "goh/carte/level2/hg.jpg",1024,-512,true )
	hd.x=1024
	hd.y=-512
	bg=display.newImage(map14sheetbg,1) --display.newImage( "goh/carte/level2/bd.jpg", -1024,512,true )
	bg.x=-1024
	bg.y=512
	bd=display.newImage(map14sheetbd,1) --display.newImage( "goh/carte/level2/bg.jpg", 1024,512,true )
	bd.x=1024
	bd.y=512
	-- obd=display.newImage(map1sheetobd,1) --display.newImage( "goh/carte/level2/bg.jpg", 1024,512,true )
	-- obd.x=1024
	-- obd.y=512
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
	local tunededep=10000
	local nbperso=leveldata[17].life
	if modeinfini or modesquelette then
		tunededep=tunedep
		nbperso=10
	end
	argentdep=-(tunededep)*3--hugo modifier uniquement le nombre le reste permet de crypter la donné-------------------------------------------------------------------
	ennemipassedep=nbperso--nombre d'ennemi qui peuvent encore passer avant qu'on perdre---hugo------------------------------------------------------------------------------------------------------------------
end

t.chemi=function()--donnees sur les differents points de la carte
local point= require( "point" )
genepointinit=43

pointdep={}
pointdep[1]=7
pointdep[2]=35

intersection={}
intersection.nb=3
intersection[1]={pt=1, ty=1, un=3, deux=5, proba=2}
intersection[2]={pt=5, ty=0, un=22}
intersection[3]={pt=3, ty=0, un=47}
intersection[4]={pt=6, ty=0, un=22}
intersection[5]={pt=4, ty=0, un=4}
--exemple
--intersection[1]={pt=11, ty=1, un=1, deux=13}
--intersection[2]={pt=25, ty=0, un=27}
--intersection[1]={pt=18, ty=2, un=29, deux=20,proba=2}
--intersection[2]={pt=20, ty=2, un=30, deux=22,proba=2}
--chemin[10].rayon=1000 --taille de la zone ou peut se trouver les gentils
--chemin[10].mechant=0.2 --recerement du chemin ils vont plus etre aussi ecarté
--intersection[2]={pt=46, ty=0, un=21}
cheminarr={}
cheminarr[1]=34
cheminarr[2]=60
cheminarr[3]=33
-- cheminarr={} --si des chemins sont des arrivés
-- cheminarr[1]=25 --fin numero 2 du chemin
-- cheminarr[2]=12 --fin numero 3 du chemin

cheminnb=59-- --nombre de point definisant le chemin -1--------------------------------------------------------------------------------------------------
chemin={}
--chemin[10].rayon=1000 --taille de la zone ou peut se trouver les gentils
--chemin[10].mechant=0.2 --recerement du chemin ils vont plus etre aussi ecarté
chemin[1]=point.new(22,303)		chemin[1].mechant=1.5	chemin[1].rayon=6000
chemin[2]=point.new(21,235)		chemin[2].mechant=2.4	chemin[2].rayon=6000
chemin[3]=point.new(68,204)		chemin[3].mechant=1.6	chemin[3].rayon=6000
chemin[4]=point.new(120,178)	chemin[4].mechant=1.7	chemin[4].rayon=4000
chemin[5]=point.new(-28,216)	chemin[5].mechant=1.9	chemin[5].rayon=6000
chemin[6]=point.new(-80,185)	chemin[6].mechant=1.8	chemin[6].rayon=6000
chemin[7]=point.new(-614,-49)	chemin[7].mechant=1.8	chemin[7].rayon=3000
chemin[8]=point.new(-569,-42)	chemin[8].mechant=1.7	chemin[8].rayon=7000
chemin[9]=point.new(-525,-26)	chemin[9].mechant=1.9	chemin[9].rayon=6000
chemin[10]=point.new(-496,9)	chemin[10].mechant=1.7	chemin[10].rayon=6000
chemin[11]=point.new(-484,55)	chemin[11].mechant=1.8	chemin[11].rayon=8000
chemin[12]=point.new(-484,99)	chemin[12].mechant=1.7	chemin[12].rayon=8000
chemin[13]=point.new(-478,143)	chemin[13].mechant=1.9	chemin[13].rayon=8000
chemin[14]=point.new(-462,176)	chemin[14].mechant=2	chemin[14].rayon=6000
chemin[15]=point.new(-427,195)	chemin[15].mechant=1.9	chemin[15].rayon=4000
chemin[16]=point.new(-385,202)	chemin[16].mechant=1.8	chemin[16].rayon=4000
chemin[17]=point.new(-340,208)	chemin[17].mechant=1.8	chemin[17].rayon=4000
chemin[18]=point.new(-300,206)	chemin[18].mechant=1.7	chemin[18].rayon=4000
chemin[19]=point.new(-262,195)	chemin[19].mechant=1.6	chemin[19].rayon=4000
chemin[20]=point.new(-217,179)	chemin[20].mechant=1.6	chemin[20].rayon=4000
chemin[21]=point.new(-173,169)	chemin[21].mechant=2	chemin[21].rayon=6000
chemin[22]=point.new(-130,156)	chemin[22].mechant=2.4	chemin[22].rayon=3000
chemin[23]=point.new(-106,118)	chemin[23].mechant=1.5	chemin[23].rayon=5000
chemin[24]=point.new(-79,83)	chemin[24].mechant=1.5	chemin[24].rayon=5000
chemin[25]=point.new(-61,31)	chemin[25].mechant=1.8	chemin[25].rayon=6000
chemin[26]=point.new(-61,-16)	chemin[26].mechant=1.8	chemin[26].rayon=6000
chemin[27]=point.new(-74,-61)	chemin[27].mechant=1.6	chemin[27].rayon=6000
chemin[28]=point.new(-105,-101)	chemin[28].mechant=1.6	chemin[28].rayon=3000
chemin[29]=point.new(-145,-117)	chemin[29].mechant=1.8	chemin[29].rayon=3000
chemin[30]=point.new(-188,-118)	chemin[30].mechant=1.7	chemin[30].rayon=3000
chemin[31]=point.new(-225,-102)	chemin[31].mechant=1.5	chemin[31].rayon=3000
chemin[32]=point.new(-264,-84)	chemin[32].mechant=1.2	chemin[32].rayon=3000
chemin[33]=point.new(-277,-74)	chemin[33].mechant=1.1	chemin[33].rayon=3000
chemin[34]=point.new(-287,-58)	chemin[34].mechant=1	chemin[34].rayon=3000
chemin[35]=point.new(248,-306)	chemin[35].mechant=1.5	chemin[35].rayon=5000
chemin[36]=point.new(207,-281)	chemin[36].mechant=1.5	chemin[36].rayon=5000
chemin[37]=point.new(174,-246)	chemin[37].mechant=1.5	chemin[37].rayon=5000
chemin[38]=point.new(151,-209)	chemin[38].mechant=1.6	chemin[38].rayon=5000
chemin[39]=point.new(143,-167)	chemin[39].mechant=1.8	chemin[39].rayon=7000
chemin[40]=point.new(138,-123)	chemin[40].mechant=1.6	chemin[40].rayon=7000
chemin[41]=point.new(138,-83)	chemin[41].mechant=1.6	chemin[41].rayon=7000
chemin[42]=point.new(132,-39)	chemin[42].mechant=1.5	chemin[42].rayon=7000
chemin[43]=point.new(130,3)		chemin[43].mechant=1.6	chemin[43].rayon=7000
chemin[44]=point.new(129,44)	chemin[44].mechant=1.7	chemin[44].rayon=7000
chemin[45]=point.new(125,88)	chemin[45].mechant=1.9	chemin[45].rayon=7000
chemin[46]=point.new(138,133)	chemin[46].mechant=2.3	chemin[46].rayon=3000
chemin[47]=point.new(170,159)	chemin[47].mechant=1.9	chemin[47].rayon=5000
chemin[48]=point.new(212,167)	chemin[48].mechant=2	chemin[48].rayon=5000
chemin[49]=point.new(254,174)	chemin[49].mechant=2	chemin[49].rayon=5000
chemin[50]=point.new(298,177)	chemin[50].mechant=2	chemin[50].rayon=7000
chemin[51]=point.new(343,174)	chemin[51].mechant=2	chemin[51].rayon=7000
chemin[52]=point.new(387,172)	chemin[52].mechant=2.2	chemin[52].rayon=7000
chemin[53]=point.new(425,139)	chemin[53].mechant=2.1	chemin[53].rayon=8000
chemin[54]=point.new(456,100)	chemin[54].mechant=1.7	chemin[54].rayon=6000
chemin[55]=point.new(475,59)	chemin[55].mechant=1.5	chemin[55].rayon=6000
chemin[56]=point.new(487,15)	chemin[56].mechant=1.6	chemin[56].rayon=6000
chemin[57]=point.new(478,-32)	chemin[57].mechant=1.5	chemin[57].rayon=5000
chemin[58]=point.new(456,-67)	chemin[58].mechant=1.6	chemin[58].rayon=3000
chemin[59]=point.new(414,-76)	chemin[59].mechant=1.3	chemin[59].rayon=3000
chemin[60]=point.new(378,-77)	chemin[60].mechant=1.3	chemin[60].rayon=3000

obstacle0nb=0
obstacle0={} --obstacle de 
--obstacle0[1]=point.new(-609,-198) 
--obstacle0[1].rayon=1000

obstaclenb=28 --76 --153--nombre de point definissant les petits obstacles
obstacle={}
obstacle[1]=point.new(-606,52)
obstacle[2]=point.new(-600,119)
obstacle[3]=point.new(-603,178)
obstacle[4]=point.new(-611,292)
obstacle[5]=point.new(-604,240)
obstacle[6]=point.new(581,-118)
obstacle[7]=point.new(578,-53)
obstacle[8]=point.new(581,13)
obstacle[9]=point.new(524,-108)
obstacle[10]=point.new(215,122)
obstacle[11]=point.new(-387,173)
obstacle[12]=point.new(-347,177)
obstacle[13]=point.new(-296,171)
obstacle[14]=point.new(-243,165)
obstacle[15]=point.new(-208,142)
obstacle[16]=point.new(-163,123)
obstacle[17]=point.new(-287,-105)
obstacle[18]=point.new(-240,-127)
obstacle[19]=point.new(-182,-141)
obstacle[20]=point.new(-133,-128)
obstacle[21]=point.new(-85,-113)
obstacle[22]=point.new(-525,-179)
obstacle[23]=point.new(126,298)
obstacle[24]=point.new(185,297)
obstacle[25]=point.new(309,291)
obstacle[26]=point.new(251,295)
obstacle[27]=point.new(-307,-44)
obstacle[28]=point.new(345,-89)


obstacle1nb=8 --4--nombre de point definisant le nombre de point du gros obstacle
obstacle1={}--gros cercle
obstacle1[1]=point.new(-613,-260)
obstacle1[2]=point.new(-439,-303)
obstacle1[3]=point.new(-221,-343)
obstacle1[4]=point.new(-17,-303)
obstacle1[5]=point.new(580,-280)
obstacle1[6]=point.new(414,-300)
obstacle1[7]=point.new(610,260)
obstacle1[8]=point.new(483,299)
--mine:
mineinfo={}
mineinfo.nb=0

--obstaclsold.nb=0 --nombre d'obstacle ou les soldats ne peuvent pas aller.
-- obstaclsold[1]=point.new(-55,-10)
-- obstaclsold[1].point=10
-- obstaclsold[1].rayon=1000
-- obstaclsold[2]=point.new(0,-10)

 end
t.obsim=function()
if obstacleim==nil then
	obstacleim={}
end
obstacleim[1]=display.newImage(map14sheeto1,1)
obstacleim[1].anchorY=1
obstacleim[1].x=-1884
obstacleim[1].y=677

obstacleim[2]=display.newImage(map14sheeto2,1)
obstacleim[2].anchorY=1
obstacleim[2].x=-1884
obstacleim[2].y=677

obstacleim[2]=display.newSprite(map14sheeto3,{frames={1,2,3,4,5,6},time=100,loopCount=1})
obstacleim[2].anchorY=1
obstacleim[2].x=-300/0.3
obstacleim[2].y=-10
obstacleim[2]:setFrame(1)

obstacleim[3]=display.newSprite(map14sheeto3,{frames={1,2,3,4,5,6},time=100,loopCount=1})
obstacleim[3].anchorY=1
obstacleim[3].x=343/0.3
obstacleim[3].y=-50/0.3
obstacleim[3]:setFrame(1)


decoration={}
decoration[1]={}
decoration[1].x=-1537*0.3
decoration[1].y=962*0.3
decoration[1].type=10
decoration[1].planche=3
decoration[1].scale=0.3
decoration[1].anchorY=1
decoration[2]={}
decoration[2].x=-1348.5*0.3
decoration[2].y=1024*0.3
decoration[2].type=11
decoration[2].planche=3
decoration[2].scale=0.3
decoration[2].anchorY=1
decoration[3]={}
decoration[3].x=-1108.5*0.3
decoration[3].y=1054*0.3
decoration[3].type=10
decoration[3].planche=3
decoration[3].scale=0.3
decoration[3].anchorY=1
decoration[4]={}
decoration[4].x=-890.5*0.3
decoration[4].y=983*0.3
decoration[4].type=12
decoration[4].planche=3
decoration[4].scale=0.3
decoration[4].anchorY=1
decoration[5]={}
decoration[5].x=-1940*0.3
decoration[5].y=145*0.3
decoration[5].type=10
decoration[5].planche=3
decoration[5].scale=0.3
decoration[5].anchorY=1
decoration[6]={}
decoration[6].x=1892*0.3
decoration[6].y=-82*0.3
decoration[6].type=11
decoration[6].planche=3
decoration[6].scale=0.3
decoration[6].anchorY=1
decoration[7]={}
decoration[7].x=2006.5*0.3
decoration[7].y=-223*0.3
decoration[7].type=12
decoration[7].planche=3
decoration[7].scale=0.3
decoration[7].anchorY=1
decoration[8]={}
decoration[8].x=-292
decoration[8].y=-178
decoration[8].type=15
decoration[8].planche=1
decoration[8].scale=0.3
decoration[8].anchorY=1


end
t.vague=function()--donnees sur les vagues du niveau
vague={}
local k=nil
--nbvague=5--15
for k=1,leveldata[17].wave,1 do
	vague[k]={}
	vague[k][1]=200
end
vague[1]={-11,-2,9,203,203,203,203,203,203,203,203,204,-1,9,203,203,203,203,203,203,203,203,204,9,204,203,203,203,203,203,203,203,203,-11,-2,9,204,203,203,203,203,203,203,203,203,-1,9,204,203,203,203,203,203,203,203,203,9,204,203,203,203,203,203,203,203,203,-1,9,204,203,203,203,203,203,203,203,203,-11,-2,9,204,203,203,203,203,203,203,203,203,9,204,203,203,203,203,203,203,203,203,-1,9,204,203,203,203,203,203,203,203,203,-2,9,204,203,203,203,203,203,203,203,203,-1,204,204,-2,204,-1,204,204,-2,204,-1,204,204,-2,204,-1,204,204,-2,204,-1,204,204,-2,204}
vague[2]={262,262,269,-1,262,-1,262,-1,269,-2,262,-2,262,-2,269,0,262,262,269,-1,262,-1,262,-1,269,-2,262,-2,262,-2,269,0,0,0,0,3,269,269,269,-1,3,269,269,269,-2,3,269,269,269,3,269,269,269,-1,3,269,269,269,-2,3,269,269,269,3,269,269,269,-1,3,269,269,269,-2,3,269,269,269}
vague[3]={0,0,0,0,3,269,269,269,-1,3,269,269,269,-2,3,269,269,269,3,269,269,269,-1,3,269,269,269,-2,3,269,269,269,3,269,269,269,-1,3,269,269,269,-2,3,269,269,269,3,269,269,269,-1,3,269,269,269,-2,3,269,269,269,3,269,269,269,-1,3,269,269,269,-2,3,269,269,269,3,269,269,269,-1,3,269,269,269,-2,3,269,269,269,3,269,269,269,-1,3,269,269,269,-2,3,269,269,269,3,269,269,269,-1,3,269,269,269,-2,3,269,269,269,3,269,269,269,-1,3,269,269,269,-2,3,269,269,269}
vague[4]={8,269,269,269,269,269,269,269,269,-1,8,269,269,269,269,269,269,269,269,-2,8,269,269,269,269,269,269,269,269,8,269,269,269,269,269,269,269,269,-1,8,269,269,269,269,269,269,269,269,-2,8,269,269,269,269,269,269,269,269,8,269,269,269,269,269,269,269,269,-1,8,269,269,269,269,269,269,269,269,-2,8,269,269,269,269,269,269,269,269,8,269,269,269,269,269,269,269,269,-1,8,269,269,269,269,269,269,269,269,-2,8,269,269,269,269,269,269,269,269,8,269,269,269,269,269,269,269,269,-1,8,269,269,269,269,269,269,269,269,-2,8,269,269,269,269,269,269,269,269,8,269,269,269,269,269,269,269,269,-1,8,269,269,269,269,269,269,269,269,-2,8,269,269,269,269,269,269,269,269}
vague[4]={-1,2,261,261,2,261,261,-2,4,237,237,237,237,0,0,0,-1,5,237,237,237,237,237,5,237,237,237,237,237,-2,3,237,237,237,0,0,0,-1,2,261,261,261,-2,2,261,261,0,0,0,0,-1,9,237,237,237,237,237,237,237,237,237,9,237,237,237,237,237,237,237,237,237,0,0,-2,9,237,237,237,237,237,237,237,237,237,0,0,0,0,0,-1,2,260,260,2,260,260,-2,2,260,260,0,0,0,0,-1,5,220,220,220,220,220,-2,5,220,220,220,220,220,0,0,0,-1,221,-2,221,0,0,0,0,0,0,-1,5,220,220,220,220,220,4,237,237,237,237,-2,3,237,237,237,0,0,0,-1,260,3,260,260,260,-2,260,0,0,-1,262,-2,262,0,0,0}
vague[5]={-1,9,237,237,237,237,237,237,237,237,237,9,237,237,237,237,237,237,237,237,237,-2,9,237,237,237,237,237,237,237,237,237,0,0,0,0,0,262,-2,262,0,0,0,0,0,-1,5,270,270,270,270,270,5,270,270,270,270,270,0,0,-2,5,270,270,270,270,270,0,0,0,0,0,-1,9,237,237,237,237,237,237,237,237,237,9,237,237,237,237,237,237,237,237,237,0,0,-2,9,237,237,237,237,237,237,237,237,237,0,0,0,0,-1,221,221,-2,221,0,0,0,0,-1,5,270,270,270,270,270,5,270,270,270,270,270,-2,5,270,270,270,270,270,0,0,0}
vague[6]={-1,5,270,270,270,270,270,5,270,270,270,270,270,-2,5,270,270,270,270,270,0,0,0,-1,9,237,237,237,237,237,237,237,237,237,9,237,237,237,237,237,237,237,237,237,-2,9,237,237,237,237,237,237,237,237,237,0,0,0,0,-1,262,-2,262,0,0,0,0,-1,9,237,237,237,237,237,237,237,237,237,9,237,237,237,237,237,237,237,237,237,-2,9,237,237,237,237,237,237,237,237,237,0,0,0,0,-2,5,270,270,270,270,270,0,0,0,-1,5,270,270,270,270,270,5,270,270,270,270,270,0,0,-2,5,270,270,270,270,270,0,0,0,-1,9,237,237,237,237,237,237,237,237,237,9,237,237,237,237,237,237,237,237,237,-2,9,237,237,237,237,237,237,237,237,237,0,0,0,0,-1,262,262,-2,262,0,0,0,0,0,-1,5,270,270,270,270,270,5,270,270,270,270,270,0,0,-2,5,270,270,270,270,270,0,0,0,0}
vague[7]={-1,3,261,261,261,3,261,261,261,0,0,-2,3,261,261,261,0,0,0,-1,9,237,237,237,237,237,237,237,237,237,9,237,237,237,237,237,237,237,237,237,0,0,-2,9,237,237,237,237,237,237,237,237,237,0,0,0,0,-1,262,0,0,-2,262,0,0,0,0,-1,221,-2,221,0,0,-1,9,237,237,237,237,237,237,237,237,237,9,237,237,237,237,237,237,237,237,237,0,0,-2,9,237,237,237,237,237,237,237,237,237,0,0,0,0,-1,3,260,260,260,3,260,260,260,0,0,-2,3,260,260,260,0,0,0}
vague[8]={-1,5,238,238,238,238,238,5,238,238,238,238,238,0,0,-2,5,238,238,238,238,238,0,0,0,-1,9,270,270,270,270,270,270,270,270,270,9,270,270,270,270,270,270,270,270,270,0,0,-2,9,270,270,270,270,270,270,270,270,270,0,0,0,0,-1,2,221,221,2,221,221,-2,2,221,221,0,0,0,0,0,-1,9,237,237,237,237,237,237,237,237,237,9,237,237,237,237,237,237,237,237,237,0,0,-2,9,237,237,237,237,237,237,237,237,237,0,0,0,5,261,261,261,261,261,3,261,261,261,-2,5,261,261,261,0,0,0,0,-1,9,270,270,270,270,270,270,270,270,270,9,270,270,270,270,270,270,270,270,270,0,0,0,-2,9,270,270,270,270,270,270,270,270,270,0,0,0}
vague[9]={-1,9,270,270,270,270,270,270,270,270,270,9,270,270,270,270,270,270,270,270,270,0,0,-2,9,270,270,270,270,270,270,270,270,270,0,0,0,-1,2,221,221,2,221,221,-2,221,221,0,0,0,0,0,-1,9,238,238,238,238,238,238,238,238,238,9,238,238,238,238,238,238,238,238,238,0,0,-2,9,238,238,238,238,238,238,238,238,238,0,0,0,-1,9,237,237,237,237,237,237,237,237,237,9,237,237,237,237,237,237,237,237,237,0,0,-2,9,237,237,237,237,237,237,237,237,237,0,0,0,-1,3,261,261,261,3,261,261,261,-2,3,261,261,261,0,0,0}
vague[10]={-1,3,261,261,261,5,261,261,261,261,261,-2,5,261,261,261,261,261,0,0,0,0,-1,9,237,237,237,237,237,237,237,237,237,9,237,237,237,237,237,237,237,237,237,0,0,-2,9,237,237,237,237,237,237,237,237,237,-1,262,-2,262,0,0,0,-1,9,237,237,237,237,237,237,237,237,237,9,237,237,237,237,237,237,237,237,237,0,0,-2,9,237,237,237,237,237,237,237,237,237,0,0,0,0,-1,9,270,270,270,270,270,270,270,270,270,9,270,270,270,270,270,270,270,270,270,0,0,-2,9,270,270,270,270,270,270,270,270,270,-1,2,221,221,2,221,221,-2,2,221,221}
vague[11]={-1,3,221,221,221,3,221,221,221,-2,221,221,0,0,0,0,-1,6,260,260,260,260,260,260,6,260,260,260,260,260,260,0,0,-2,6,260,260,260,260,260,260,0,0,0,0,-1,9,238,238,238,238,238,238,238,238,238,9,238,238,238,238,238,238,238,238,238,0,0,-2,9,238,238,238,238,238,238,238,238,238,0,0,0,0,-1,5,261,261,261,261,261,5,261,261,261,261,261,0,0,-2,5,261,261,261,261,261,0,0,0,0,-1,9,237,237,237,237,237,237,237,237,237,9,237,237,237,237,237,237,237,237,237,0,0,-2,9,237,237,237,237,237,237,237,237,237,0,0,0,0,-1,2,262,262,2,262,262,-1,2,262,262,-2,2,262,262,0,0,0,0,0,0,0,0,0,0,0,5,224,224,224,224,224,-1,5,224,224,224,224,224,-2,5,224,224,224,224,224}
-- nbvague=10
-- --on met -1 quand c'est le dernier soldat
-- for k=1,leveldata[1].wave,1 do
-- 	vague[k]={}
-- end
-- --vague[1]={nb=60,260,0,0,261,203,1,203,2,203,203,4,203,203,203,203,5,203,203,203,203,203,0,0,0,5,203,203,203,203,203,5,203,203,203,203,203,5,203,203,203,203,203,5,203,203,203,203,203,5,203,203,203,203,203,5,203,203,203,203,203}
-- vague[1].nb=30
-- local quatre=6
-- for i=1,200 do
-- 	if quatre>=6 then
-- 		vague[1][i]=5
-- 		quatre=0
-- 	else
-- 		vague[1][i]=210
-- 	end
-- 	quatre=quatre+1
-- end
-- vague[1].nb=190
-- for i=0,2 do
-- 	vague[1][i+1]=260--200+i
-- end
-- for i=15,20 do
-- 	vague[1][i+1]=0
-- end
-- for i=20,30 do
-- 	vague[1][i+1]=260--200+i
-- end
-- vague[1].nb=30
-- vague[2].nb=49
-- for i=0,4 do
-- 	if i==0 then
-- 		vague[2][1]=4
-- 	else
-- 		vague[2][i*10]=4
-- 	end
-- 	for j=1,9 do
-- 		vague[2][i*10+j]=200
-- 		if j==5 then
-- 			vague[2][i*10+5]=4
-- 		end
-- 	end
-- end
-- vague[3].nb=99
-- for i=0,9 do
-- 	if i==0 then
-- 		vague[3][1]=4
-- 	else
-- 		vague[3][i*10]=4
-- 	end
-- 	for j=1,9 do
-- 		vague[3][i*10+j]=260
-- 		if j==5 then
-- 			vague[3][i*10+5]=4
-- 		end
-- 	end
-- end
-- vague[4].nb=99
-- for i=0,9 do
-- 	if i==0 then
-- 		vague[4][1]=4
-- 	else
-- 		vague[4][i*10]=4
-- 	end
-- 	for j=1,9 do
-- 		vague[4][i*10+j]=210
-- 		if j==5 then
-- 			vague[4][i*10+5]=4
-- 		end
-- 	end
-- end
-- vague[5]={nb=3,0,0,0}

-- for k=6,10 do
-- 	vague[k].nb=99
-- 	for i=0,9 do
-- 		if i==0 then
-- 			vague[k][1]=4
-- 		else
-- 			vague[k][i*10]=4
-- 		end
-- 		for j=1,9 do
-- 			vague[k][i*10+j]=200+j
-- 			if j==5 then
-- 				vague[k][i*10+5]=4
-- 			end
-- 		end
-- 	end
-- end

--nbvague=1--a supprimer
--vague[1].nb=2--nb soldat dans la vague
--vague[2].nb=3
-- vague[3].nb=5
-- vague[4].nb=6

--vague[1][1]=210
--vague[1][2]=0

-- vague[2][1]=230
-- vague[2][2]=230
-- vague[2][3]=230

-- vague[3][1]=200
-- vague[3][2]=200
-- vague[3][3]=200
-- vague[3][4]=200
-- vague[3][5]=200

-- vague[4][1]=230
-- vague[4][2]=230
-- vague[4][3]=230
-- vague[4][4]=230
-- vague[4][5]=230
-- vague[4][6]=230
end
t.vaguewave=function()
	vague={}
	vague[1]={-11,9,224,224,224,224,224,224,224,224,224,-1,9,224,224,224,224,224,224,224,224,224,-2,9,224,224,224,224,224,224,224,224,224,0,0,0,0,0,0,0,0,0,0,0,0,-11,9,223,223,223,223,223,223,223,223,223,-1,9,223,223,223,223,223,223,223,223,223,-2,1,223,223,223,-11,9,272,272,272,272,272,272,272,272,272,-1,9,272,272,272,272,272,272,272,272,272,-2,9,272,272,272,272,272,272,272,272,272,0,0,0,0,0,0,0,0,0,6,221,221,221,221,221,221,-1,6,221,221,221,221,221,221,-2,6,221,221,221,221,221,221,-11,2,284,284,-1,2,284,284,-2,2,284,284}
end
return t