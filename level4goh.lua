local t={} --niveau inf
t.new=function()--gestion du niveau 4 du jeu, doit toujours suivre le meme modele
	--map1= display.newImage( "goh/carte/level2/carte1a.jpg", 0,0,true )--devrai etre en local pour niveau1
	-- map1p = display.newCircle(0,0,10)      --nil--display.newImage( "goh/carte/level2/carte1p.jpg", 0,0,true )
	-- map1p.isVisible=false
	pouvoirdisp=3
	-- modeinfini=true
	-- dureepartie=2
	-- accelererenn=1.3
	t=1
end
t.affichagecarte=function(pole)
	if donneecharger[4]==0 then
		donneecharger[4]=1
		map4sheethg=graphics.newImageSheet( "goh/carte/level4/hd.jpg", { width=2048, height=1024, numFrames=1,sheetContentWidth=2048,sheetContentHeight=1024 } )
		map4sheethd=graphics.newImageSheet( "goh/carte/level4/hg.jpg", { width=2048, height=1024, numFrames=1,sheetContentWidth=2048,sheetContentHeight=1024 } )
		map4sheetbg=graphics.newImageSheet( "goh/carte/level4/bd.jpg", { width=2048, height=1024, numFrames=1 ,sheetContentWidth=2048,sheetContentHeight=1024} )
		map4sheetbd=graphics.newImageSheet( "goh/carte/level4/bg.jpg", { width=2048, height=1024, numFrames=1,sheetContentWidth=2048,sheetContentHeight=1024 } )
		map4sheeto1=graphics.newImageSheet( "goh/carte/level4/left_bttm_trees.png", { width=409, height=338, numFrames=1,sheetContentWidth=409,sheetContentHeight=338 } )
		map4sheeto2=graphics.newImageSheet( "goh/carte/level4/left_bttm_trees2.png", { width=424, height=409, numFrames=1,sheetContentWidth=424,sheetContentHeight=409 } )
		map4sheeto3=graphics.newImageSheet( "goh/carte/level4/left_top_tree.png", { width=462, height=413, numFrames=1,sheetContentWidth=462,sheetContentHeight=413 } )
		map4sheeto4=graphics.newImageSheet( "goh/carte/level4/mid_bttm_tree.png", { width=247, height=317, numFrames=1,sheetContentWidth=247,sheetContentHeight=317 } )
		map4sheeto5=graphics.newImageSheet( "goh/carte/level4/right_bottm_fence.png", { width=1945, height=187, numFrames=1,sheetContentWidth=1945,sheetContentHeight=187 } )
		map4sheeto6=graphics.newImageSheet( "goh/carte/level4/right_bottom_cliff.png", { width=600, height=765, numFrames=1,sheetContentWidth=600,sheetContentHeight=765 } )
		map4sheeto7=graphics.newImageSheet( "goh/carte/level4/windmill.png", { width=454, height=650, numFrames=1,sheetContentWidth=454,sheetContentHeight=650 } )
		map4sheeto8=graphics.newImageSheet( "goh/carte/level4/bttm_tree_L.png", { width=1284, height=237, numFrames=1,sheetContentWidth=1284,sheetContentHeight=237 } )
		map4sheeto9=graphics.newImageSheet( "goh/carte/level4/bttm_tree_R.png", { width=1583, height=373, numFrames=1,sheetContentWidth=1583,sheetContentHeight=373 } )
	end
	hg=display.newImage(map4sheethg,1) --display.newImage( "goh/carte/level2/hd.jpg", -1024,-512,true )
	hg.x=-1024
	hg.y=-512
	hd=display.newImage(map4sheethd,1) --display.newImage( "goh/carte/level2/hg.jpg",1024,-512,true )
	hd.x=1024
	hd.y=-512
	bg=display.newImage(map4sheetbg,1) --display.newImage( "goh/carte/level2/bd.jpg", -1024,512,true )
	bg.x=-1024
	bg.y=512
	bd=display.newImage(map4sheetbd,1) --display.newImage( "goh/carte/level2/bg.jpg", 1024,512,true )
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
	local nbperso=leveldata[4].life
	if modeinfini or modesquelette then
		tunededep=tunedep
		nbperso=10
	end
	argentdep=-(tunededep)*3--hugo-------------------------------------------------------------------
	ennemipassedep=nbperso--nombre d'ennemi qui peuvent encore passer avant qu'on perdre---hugo------------------------------------------------------------------------------------------------------------------
	
end
t.chemi=function()--donnees sur les differents points de la carte
local point= require( "point" )
genepointinit=20
cheminarr=nil
----------------------------------------------------------------------------------------hugo debut -----------------------------------------------------------------------
intersection={}
intersection.nb=7
intersection[1]={pt=12, ty=2, un=34, deux=15, proba=2}
intersection[2]={pt=33, ty=0, un=61}
intersection[3]={pt=29, ty=1, un=32, deux=49, proba=2}
intersection[4]={pt=59, ty=0, un=70}
intersection[7]={pt=46, ty=2, un=50, deux=15,proba=2 }
intersection[5]={pt=47, ty=0, un=52}
intersection[6]={pt=59, ty=0, un=71}

pointdep={}--entré secondaire 
pointdep[1]=35 --
--exemple

--intersection[1]={pt=11, ty=2, un=42, deux=15,proba=2}
cheminnb=75-- --nombre de point definisant le chemin -1--------------------------------------------------------------------------------------------------
chemin={}
chemin[1]=point.new(-613,-185)	chemin[1].mechant=1.4	chemin[1].rayon=1000
chemin[2]=point.new(-570,-210)	chemin[2].mechant=1.4	chemin[2].rayon=1000
chemin[3]=point.new(-525,-212)	chemin[3].mechant=1.4	chemin[3].rayon=1000
chemin[4]=point.new(-481,-208)	chemin[4].mechant=1.4	chemin[4].rayon=1000
chemin[5]=point.new(-440,-198)	chemin[5].mechant=1.5	chemin[5].rayon=1000
chemin[6]=point.new(-397,-190)	chemin[6].mechant=1.5	chemin[6].rayon=1000
chemin[7]=point.new(-353,-180)	chemin[7].mechant=1.5	chemin[7].rayon=1000
chemin[8]=point.new(-311,-170)	chemin[8].mechant=1.4	chemin[8].rayon=1000
chemin[9]=point.new(-268,-160)	chemin[9].mechant=1.5	chemin[9].rayon=1000
chemin[10]=point.new(-227,-150)	chemin[10].mechant=1.5	chemin[10].rayon=1000
chemin[11]=point.new(-180,-144)	chemin[11].mechant=1.5	chemin[11].rayon=1000
chemin[12]=point.new(-138,-136)	chemin[12].mechant=1.5	chemin[12].rayon=1000
chemin[13]=point.new(-120,-102)	chemin[13].mechant=1.5	chemin[13].rayon=1000
chemin[14]=point.new(-113,-69)	chemin[14].mechant=1.4	chemin[14].rayon=1000
chemin[15]=point.new(-120,-34)	chemin[15].mechant=1.3	chemin[15].rayon=1000
chemin[16]=point.new(-151,-22)	chemin[16].mechant=1.1	chemin[16].rayon=1000
chemin[17]=point.new(-193,-21)	chemin[17].mechant=1.2	chemin[17].rayon=1000
chemin[18]=point.new(-239,-21)	chemin[18].mechant=1.2	chemin[18].rayon=1000
chemin[19]=point.new(-288,-20)	chemin[19].mechant=1.1	chemin[19].rayon=1000
chemin[20]=point.new(-325,-10)	chemin[20].mechant=1.2	chemin[20].rayon=1000
chemin[21]=point.new(-371,0)	chemin[21].mechant=1.2	chemin[21].rayon=1000
chemin[22]=point.new(-418,9)	chemin[22].mechant=1.2	chemin[22].rayon=1000
chemin[23]=point.new(-446,13)	chemin[23].mechant=1	chemin[23].rayon=1000
chemin[24]=point.new(-388,6)	chemin[24].mechant=1.3	chemin[24].rayon=1000
chemin[25]=point.new(-347,-5)	chemin[25].mechant=1.3	chemin[25].rayon=1000
chemin[26]=point.new(-299,-16)	chemin[26].mechant=1.2	chemin[26].rayon=1000
chemin[27]=point.new(-255,-20)	chemin[27].mechant=1.2	chemin[27].rayon=1000
chemin[28]=point.new(-212,-17)	chemin[28].mechant=1.3	chemin[28].rayon=1000
chemin[29]=point.new(-172,-22)	chemin[29].mechant=1.1	chemin[29].rayon=1000
chemin[30]=point.new(-132,-25)	chemin[30].mechant=1.2	chemin[30].rayon=1000
chemin[31]=point.new(-106,-41)	chemin[31].mechant=1.5	chemin[31].rayon=1000
chemin[32]=point.new(-100,-84)	chemin[32].mechant=1.5	chemin[32].rayon=1000
chemin[33]=point.new(-87,-130)	chemin[33].mechant=1.7	chemin[33].rayon=1000
chemin[34]=point.new(-42,-144)	chemin[34].mechant=1.3	chemin[34].rayon=1000
chemin[35]=point.new(-614,304)	chemin[35].mechant=1.2	chemin[35].rayon=1000
chemin[36]=point.new(-567,295)	chemin[36].mechant=1.2	chemin[36].rayon=1000
chemin[37]=point.new(-527,278)	chemin[37].mechant=1.3	chemin[37].rayon=1000
chemin[38]=point.new(-488,255)	chemin[38].mechant=1.4	chemin[38].rayon=1000
chemin[39]=point.new(-454,227)	chemin[39].mechant=1.8	chemin[39].rayon=1000
chemin[40]=point.new(-414,206)	chemin[40].mechant=1.9	chemin[40].rayon=1000
chemin[41]=point.new(-375,184)	chemin[41].mechant=1.7	chemin[41].rayon=1000
chemin[42]=point.new(-333,163)	chemin[42].mechant=1.6	chemin[42].rayon=1000
chemin[43]=point.new(-294,143)	chemin[43].mechant=1.4	chemin[43].rayon=1000
chemin[44]=point.new(-250,130)	chemin[44].mechant=1.8	chemin[44].rayon=1000
chemin[45]=point.new(-208,117)	chemin[45].mechant=1.6	chemin[45].rayon=1000
chemin[46]=point.new(-166,105)	chemin[46].mechant=1.8	chemin[46].rayon=1000
chemin[47]=point.new(-125,86)	chemin[47].mechant=1.9	chemin[47].rayon=1000
chemin[48]=point.new(-93,59)	chemin[48].mechant=1.7	chemin[48].rayon=1000
chemin[49]=point.new(-101,18)	chemin[49].mechant=1.7	chemin[49].rayon=1000
chemin[50]=point.new(-56,87)	chemin[50].mechant=1.5	chemin[50].rayon=1000
chemin[51]=point.new(-15,93)	chemin[51].mechant=1.4	chemin[51].rayon=1000
chemin[52]=point.new(28,99)		chemin[52].mechant=1.3	chemin[52].rayon=1000
chemin[53]=point.new(71,104)	chemin[53].mechant=1.5	chemin[53].rayon=1000
chemin[54]=point.new(116,110)	chemin[54].mechant=1.4	chemin[54].rayon=1000
chemin[55]=point.new(160,104)	chemin[55].mechant=1.4	chemin[55].rayon=1000
chemin[56]=point.new(201,97)	chemin[56].mechant=1.4	chemin[56].rayon=1000
chemin[57]=point.new(245,80)	chemin[57].mechant=1.3	chemin[57].rayon=1000
chemin[58]=point.new(280,49)	chemin[58].mechant=1.3	chemin[58].rayon=1000
chemin[59]=point.new(312,18)	chemin[59].mechant=1.4	chemin[59].rayon=1000
chemin[60]=point.new(355,11)	chemin[60].mechant=1.5	chemin[60].rayon=1000
chemin[61]=point.new(2,-148)	chemin[61].mechant=1.4	chemin[61].rayon=1000
chemin[62]=point.new(45,-156)	chemin[62].mechant=1.4	chemin[62].rayon=1000
chemin[63]=point.new(89,-162)	chemin[63].mechant=1.3	chemin[63].rayon=1000
chemin[64]=point.new(134,-161)	chemin[64].mechant=1.4	chemin[64].rayon=1000
chemin[65]=point.new(177,-151)	chemin[65].mechant=1.5	chemin[65].rayon=1000
chemin[66]=point.new(218,-139)	chemin[66].mechant=1.4	chemin[66].rayon=1000
chemin[67]=point.new(252,-113)	chemin[67].mechant=1.3	chemin[67].rayon=1000
chemin[68]=point.new(285,-88)	chemin[68].mechant=1.3	chemin[68].rayon=1000
chemin[69]=point.new(311,-43)	chemin[69].mechant=1.2	chemin[69].rayon=1000
chemin[70]=point.new(342,-4)	chemin[70].mechant=1.4	chemin[70].rayon=1000
chemin[71]=point.new(402,18)	chemin[71].mechant=1.2	chemin[71].rayon=1000
chemin[72]=point.new(448,18)	chemin[72].mechant=1.3	chemin[72].rayon=1000
chemin[73]=point.new(489,18)	chemin[73].mechant=1.3	chemin[73].rayon=1000
chemin[74]=point.new(535,16)	chemin[74].mechant=1.2	chemin[74].rayon=1000
chemin[75]=point.new(577,11)	chemin[75].mechant=1.3	chemin[75].rayon=1000
chemin[76]=point.new(617,11)	chemin[76].mechant=1.4	chemin[76].rayon=1000


obstacle0nb=0

obstaclenb=126--nombre de point definissant les petits obstacles
obstacle={}
obstacle[1]=point.new(188,-295)
obstacle[2]=point.new(247,-282)
obstacle[3]=point.new(-600,250)
obstacle[4]=point.new(-587,188)
obstacle[5]=point.new(-574,131)
obstacle[6]=point.new(-557,76)
obstacle[7]=point.new(-508,35)
obstacle[8]=point.new(-608,92)
obstacle[9]=point.new(-601,30)
obstacle[10]=point.new(-543,-2)
obstacle[11]=point.new(-487,0)
obstacle[12]=point.new(-567,-145)
obstacle[13]=point.new(-513,-156)
obstacle[14]=point.new(-606,-103)
obstacle[15]=point.new(-604,-44)
obstacle[16]=point.new(-601,-194)
obstacle[17]=point.new(-596,-282)
obstacle[18]=point.new(-533,-217)
obstacle[19]=point.new(-481,-210)
obstacle[20]=point.new(-435,-200)
obstacle[21]=point.new(-385,-186)
obstacle[22]=point.new(-326,-176)
obstacle[23]=point.new(-269,-161)
obstacle[24]=point.new(-221,-150)
obstacle[25]=point.new(-170,-143)
obstacle[26]=point.new(-118,-126)
obstacle[27]=point.new(-58,-130)
obstacle[28]=point.new(-3,-150)
obstacle[29]=point.new(54,-156)
obstacle[30]=point.new(110,-160)
obstacle[31]=point.new(168,-150)
obstacle[32]=point.new(224,-129)
obstacle[33]=point.new(137,-165)
obstacle[34]=point.new(197,-156)
obstacle[35]=point.new(268,-99)
obstacle[36]=point.new(306,-61)
obstacle[37]=point.new(330,-11)
obstacle[38]=point.new(335,10)
obstacle[39]=point.new(394,14)
obstacle[40]=point.new(447,14)
obstacle[41]=point.new(503,15)
obstacle[42]=point.new(556,6)
obstacle[43]=point.new(612,1)
obstacle[44]=point.new(288,34)
obstacle[45]=point.new(244,78)
obstacle[46]=point.new(203,95)
obstacle[47]=point.new(159,104)
obstacle[48]=point.new(117,105)
obstacle[49]=point.new(72,99)
obstacle[50]=point.new(29,100)
obstacle[51]=point.new(-15,91)
obstacle[52]=point.new(-57,82)
obstacle[53]=point.new(-107,74)
obstacle[54]=point.new(-123,87)
obstacle[55]=point.new(-167,99)
obstacle[56]=point.new(-211,110)
obstacle[57]=point.new(-250,126)
obstacle[58]=point.new(-295,141)
obstacle[59]=point.new(-334,164)
obstacle[60]=point.new(-377,185)
obstacle[61]=point.new(-417,204)
obstacle[62]=point.new(-453,225)
obstacle[63]=point.new(-489,255)
obstacle[64]=point.new(-530,276)
obstacle[65]=point.new(-611,303)
obstacle[66]=point.new(-432,297)
obstacle[67]=point.new(-300,209)
obstacle[68]=point.new(-289,282)
obstacle[69]=point.new(-359,294)
obstacle[70]=point.new(-367,232)
obstacle[71]=point.new(-242,294)
obstacle[72]=point.new(-182,284)
obstacle[73]=point.new(-128,271)
obstacle[74]=point.new(-75,263)
obstacle[75]=point.new(-23,263)
obstacle[76]=point.new(35,260)
obstacle[77]=point.new(84,260)
obstacle[78]=point.new(135,261)
obstacle[79]=point.new(192,261)
obstacle[80]=point.new(249,268)
obstacle[81]=point.new(306,266)
obstacle[82]=point.new(366,268)
obstacle[83]=point.new(420,256)
obstacle[84]=point.new(30,299)
obstacle[85]=point.new(117,302)
obstacle[86]=point.new(211,292)
obstacle[87]=point.new(278,292)
obstacle[88]=point.new(-39,302)
obstacle[89]=point.new(200,157)
obstacle[90]=point.new(217,212)
obstacle[91]=point.new(-102,11)
obstacle[92]=point.new(-108,-51)
obstacle[93]=point.new(-107,-91)
obstacle[94]=point.new(-155,-18)
obstacle[95]=point.new(-212,-25)
obstacle[96]=point.new(-268,-23)
obstacle[97]=point.new(-323,-15)
obstacle[98]=point.new(-377,-4)
obstacle[99]=point.new(-432,6)
obstacle[100]=point.new(-120,32)
obstacle[101]=point.new(-118,-83)
obstacle[102]=point.new(53,-25)
obstacle[103]=point.new(108,-26)
obstacle[104]=point.new(141,-28)
obstacle[105]=point.new(97,-34)
obstacle[106]=point.new(-343,-308)
obstacle[107]=point.new(-280,-308)
obstacle[108]=point.new(-275,-296)
obstacle[109]=point.new(-223,-283)
obstacle[110]=point.new(-184,-280)
obstacle[111]=point.new(-141,-277)
obstacle[112]=point.new(-90,-282)
obstacle[113]=point.new(-32,-300)
obstacle[114]=point.new(23,-296)
obstacle[115]=point.new(77,-293)
obstacle[116]=point.new(131,-295)
obstacle[117]=point.new(188,-295)
obstacle[118]=point.new(247,-282)
obstacle[119]=point.new(535,-161)
obstacle[120]=point.new(597,-155)
obstacle[121]=point.new(478,-170)
obstacle[122]=point.new(444,-184)
obstacle[123]=point.new(-32,-300)
obstacle[124]=point.new(23,-296)
obstacle[125]=point.new(77,-293)
obstacle[126]=point.new(131,-295)


obstacle1nb=5--nombre de point definisant le nombre de point du gros obstacle
obstacle1={}--gros cercle
obstacle1[1]=point.new(551,299)
obstacle1[2]=point.new(554,214)
obstacle1[3]=point.new(603,-278)
obstacle1[4]=point.new(486,-287)
obstacle1[5]=point.new(393,-306)


--mine:
mineinfo={}
mineinfo.nb=1
mineinfo[1]=point.new(-508,-20)
mineinfo[1].nbmine=1
mineinfo[1].nbmine1=7

end
t.obsim=function()
if obstacleim==nil then
	obstacleim={}
end
obstacleim[1]=display.newImage(map4sheeto1,1)
obstacleim[1].anchorY=1
obstacleim[1].x=-1522.5
obstacleim[1].y=1024
obstacleim[2]=display.newImage(map4sheeto2,1)
obstacleim[2].anchorY=1
obstacleim[2].x=-1098
obstacleim[2].y=869
obstacleim[3]=display.newImage(map4sheeto3,1)
obstacleim[3].anchorY=1
obstacleim[3].x=-1783
obstacleim[3].y=-378
obstacleim[4]=display.newImage(map4sheeto4,1)
obstacleim[4].anchorY=1
obstacleim[4].x=671.5
obstacleim[4].y=625
obstacleim[5]=display.newImage(map4sheeto5,1)
obstacleim[5].anchorY=1
obstacleim[5].x=451
obstacleim[5].y=946
obstacleim[6]=display.newImage(map4sheeto6,1)
obstacleim[6].anchorY=1
obstacleim[6].x=1748
obstacleim[6].y=1024
obstacleim[7]=display.newImage(map4sheeto7,1)
obstacleim[7].anchorY=1
obstacleim[7].x=296
obstacleim[7].y=57
obstacleim[8]=display.newImage(map4sheeto8,1)
obstacleim[8].anchorY=1
obstacleim[8].x=-670
obstacleim[8].y=1024
obstacleim[9]=display.newImage(map4sheeto9,1)
obstacleim[9].anchorY=1
obstacleim[9].x=791.5
obstacleim[9].y=1024
if decoranim==nil then
	decoranim={}
end

decoration={} -- ligne a mettre pour la création avec assistance
decoration[1]={}
decoration[1].x=-1339.5*0.3
decoration[1].y=353*0.3
decoration[1].type=7
decoration[1].planche=1
decoration[1].scale=0.3
decoration[1].anchorY=1
decoration[2]={}
decoration[2].x=-1318*0.3
decoration[2].y=-289*0.3
decoration[2].type=7
decoration[2].planche=1
decoration[2].scale=0.3
decoration[2].anchorY=1
decoration[3]={}
decoration[3].x=-1300*0.3
decoration[3].y=-275*0.3
decoration[3].type=6
decoration[3].planche=1
decoration[3].scale=0.3
decoration[3].anchorY=1
------------------------------------------------------------fin hugo---------------------------------------------------------------
end
t.vague=function()--donnees sur les vagues du niveau
vague={}
--nbvague=3--15
for k=1,leveldata[4].wave,1 do
	vague[k]={}
	vague[k][1]=200
end
-- print("pourquoi ici?")
-- for i=1,100 do --50 do
-- 	vague[1][i+(i-1)*5]=5
-- 	for j=1,5 do
-- 		vague[1][i+(i-1)*5+j]=201
-- 	end
-- end
-- --vague[1]={nb=48,260,0,0,0,0,0,0,0,0,0,0,260,0,260,0,260,0,260,0,260,0,260,0,5,205,205,205,205,205,0,5,261,210,210,210,261,0,0,0,0,5,214,214,214,214,214,0,0,0,5,204,204,204,204,204,0,0,5,206,206,206,206,206}
-- vague[2]={0,0,0,0,0,0,5,204,203,204,203,204,5,203,204,203,204,203,0,0,0,0,0,260,261,262,263,264,265,266,267,5,260,260,260,262,263,5,260,260,264,265,267}
-- vague[3]={0,0,0,0,0,0,0,0,0,0,0,5,204,204,204,204,204,0,0,0,5,204,204,204,204,204,0,0,0,0,0,0,0,0,5,260,260,260,260,260,0,5,260,260,260,260,260,0,5,260,260,260,260,260}

vague[1]={-10,4,270,270,270,270,-1,5,200,200,200,200,200,0,0,0,0,0,0,0,0,0,-1,218,-10,-1,3,270,270,270,-1,270,-1,270,5,202,206,206,206,202,0,-10,-1,3,270,270,270,-1,270,5,202,206,206,206,202,201}
vague[2]={202,0,0,0,0,0,3,264,264,270,270,270,-1,3,267,267,270,-1,270,-1,270,219,-1,2,218,219,-1,219,0,0,0,0,0,0,0}
vague[3]={3,200,200,200,200,-1,2,200,200,-1,200,-1,200,0,0,0,3,200,200,200,200,-1,3,200,200,200,-1,200,-1,200,0,0,0,0,0,0,2,218,218,0,0,0,2,219,219,219,0,0,0,0,0,0,0,0,-1,3,264,264,264,0,0,-1,3,270,270,270,-1,270,-1,270}
vague[4]={200,0,3,200,200,200,200,200,3,200,200,200,200,200,3,200,200,200,200,200,-1,2,218,218,0,0,-1,2,219,219,0,0,-1,3,206,202,206,-1,3,206,202,206}
vague[5]={4,218,218,218,218,-1,4,218,218,218,218,0,0,0,0,5,270,270,270,270,270,-1,5,270,270,270,270,270,0,0,0,0,0,0,0,0,0,0,0,0,0,0,266,-1,266}

if modeperftest then
	for i=1,100 do --50 do
		vague[1][i+(i-1)*5]=9
		for j=1,9 do
			vague[1][i+(i-1)*9+j]=201
		end
	end
	local nbcase=0
	for i=1,100 do
		--nbcase=nbcase+1
		--vague[1][nbcase]=-10
		for k=1,5 do
			if k==1 then
				nbcase=nbcase+1
				vague[1][nbcase]=-13
			end
			for j=1,2 do
				if j==2 then
					nbcase=nbcase+1
					vague[1][nbcase]=-1
				end
				nbcase=nbcase+1
				vague[1][nbcase]=9
				for k=1,9 do
					nbcase=nbcase+1
					vague[1][nbcase]=201
				end
			end
		end
	end
end
-------------------------------------------------------------debut hugo-----------------------------------------------------
--0 retarde de la durer de spawn de 3 soldat et 1 de la durer de 1 soldat
--de 2 à 5 permet de spawner plusieurs soldat a la fois.
--vague[1].nb=2--nb soldat dans la vague

-- vague[2].nb=3
-- vague[3].nb=5
-- vague[4].nb=6
-- vague[5].nb=11
--vague[1]={nb=29,210,0,0,260,1,210,1,5,210,210,210,210,210,200,200,0,0,5,210,210,210,210,210,5,210,210,210,210,210,261,263,262}
--vague[2]={nb=50,203,5,203,203,203,203,203,5,203,202,205,206,201,0,0,5,203,203,203,203,203,5,203,203,203,203,203,5,203,203,203,203,203,5,203,203,203,203,203,0,0,5,260,261,262,263,264,3,265,266,267,204}
--vague[3]={nb=48,204,1,5,204,204,204,204,204,204,0,0,5,210,210,210,210,210,5,210,210,210,210,210,5,210,210,210,210,210,5,210,210,210,210,210,0,0,5,203,203,203,203,203,5,203,203,203,203,203,5,203,203,203,203,203}
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
	vague[1]={204,-1,204,4,218,218,218,218,-1,4,218,218,218,218,9,264,264,264,264,264,264,264,264,264,-1,8,264,264,264,264,264,264,264,264,0,0,8,264,264,264,264,264,264,264,264,-1,9,264,264,264,264,264,264,264,264,264}
end
return t