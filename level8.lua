

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
	if donneecharger[8]==0 then
		donneecharger[8]=1
		map8sheethg=graphics.newImageSheet( "carte/level8/hg.jpg", { width=2048, height=1024, numFrames=1,sheetContentWidth=2048,sheetContentHeight=1024 } )
		map8sheethd=graphics.newImageSheet( "carte/level8/hd.jpg", { width=2048, height=1024, numFrames=1,sheetContentWidth=2048,sheetContentHeight=1024 } )
		map8sheetbg=graphics.newImageSheet( "carte/level8/bg.jpg", { width=2048, height=1024, numFrames=1,sheetContentWidth=2048,sheetContentHeight=1024 } )
		map8sheetbd=graphics.newImageSheet( "carte/level8/bd.jpg", { width=2048, height=1024, numFrames=1,sheetContentWidth=2048,sheetContentHeight=1024 } )
		map8sheeto1=graphics.newImageSheet( "carte/level8/1.png", { width=559, height=689, numFrames=1,sheetContentWidth=559,sheetContentHeight=689 } )
		map8sheeto2=graphics.newImageSheet( "carte/level8/2.png", { width=2048, height=295, numFrames=1,sheetContentWidth=2048,sheetContentHeight=295 } )
		map8sheeto3=graphics.newImageSheet( "carte/level8/3.png", { width=1325, height=299, numFrames=1,sheetContentWidth=1325,sheetContentHeight=299 } )
		map8sheeto4=graphics.newImageSheet( "carte/level8/4.png", { width=107, height=531, numFrames=1,sheetContentWidth=107,sheetContentHeight=531 } )
		if lapinanim==nil then
			lapinanim=graphics.newImageSheet("carte/level5/lapin.png", { width=80, height=55, numFrames=7 } )
			lapinanimseq =
			{
			    name="liq",
			    frames= {1,1,2,2,3,4,5,5,5,6,7,1,1}, -- frame indexes of animation, in image sheet
			    time = 4000,           -- Optional. In ms.  If not supplied, then sprite is frame-based.
			   loopCount=1         -- Optional. Default is 0.
			} 
			-- desert=true
		end
	end
	hg=display.newImage(map8sheethg,1) --display.newImage( "carte/level2/hg.png", -1024,-512,true )
	hg.x=-1024
	hg.y=-512
	hd=display.newImage(map8sheethd,1) --display.newImage( "carte/level2/hd.png",1024,-512,true )
	hd.x=1024
	hd.y=-512
	bg=display.newImage(map8sheetbg,1) --display.newImage( "carte/level2/bg.png", -1024,512,true )
	bg.x=-1024
	bg.y=512
	bd=display.newImage(map8sheetbd,1) --display.newImage( "carte/level2/bd.png", 1024,512,true )
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
genepointinit=nil
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
chemin[1]=point.new(-611,-15)
chemin[1].mechant=2.5
chemin[2]=point.new(-565,-12)
chemin[2].mechant=2.5
chemin[3]=point.new(-502,-15)
chemin[3].mechant=2.5
chemin[4]=point.new(-468,8)
chemin[5]=point.new(-458,47)
chemin[6]=point.new(-445,73)
chemin[7]=point.new(-429,105)
chemin[8]=point.new(-408,141)
chemin[9]=point.new(-422,-2)
chemin[10]=point.new(-381,-2)
chemin[11]=point.new(-344,-4)
chemin[12]=point.new(-305,-2)
chemin[13]=point.new(-611,-17)
chemin[13].mechant=2.5
chemin[14]=point.new(-543,-15)
chemin[14].mechant=2.5
chemin[15]=point.new(-482,-17)
chemin[15].mechant=2.5
chemin[16]=point.new(-453,-53)
chemin[17]=point.new(-437,-97)
chemin[18]=point.new(-426,-141)
chemin[19]=point.new(-403,-181)
chemin[20]=point.new(-364,-206)
chemin[21]=point.new(-320,-207)
chemin[22]=point.new(-275,-205)
chemin[23]=point.new(-383,178)
chemin[24]=point.new(-344,194)
chemin[25]=point.new(-302,206)
chemin[26]=point.new(-253,207)
chemin[27]=point.new(-208,203)
chemin[28]=point.new(-165,194)
chemin[29]=point.new(-125,175)
chemin[30]=point.new(-99,139)
chemin[31]=point.new(-68,110)
chemin[32]=point.new(-30,84)
chemin[33]=point.new(10,95)
chemin[34]=point.new(-232,-208)
chemin[35]=point.new(-191,-204)
chemin[36]=point.new(-151,-195)
chemin[37]=point.new(-118,-173)
chemin[38]=point.new(-92,-143)
chemin[39]=point.new(-66,-106)
chemin[40]=point.new(-21,-100)
chemin[41]=point.new(-261,-2)
chemin[42]=point.new(-217,0)
chemin[43]=point.new(-175,-4)
chemin[44]=point.new(-130,-5)
chemin[45]=point.new(-102,-39)
chemin[46]=point.new(-104,27)
chemin[47]=point.new(52,100)
chemin[48]=point.new(80,66)
chemin[49]=point.new(109,32)
chemin[50]=point.new(78,134)
chemin[51]=point.new(109,164)
chemin[52]=point.new(22,-98)
chemin[53]=point.new(65,-98)
chemin[54]=point.new(85,-140)
chemin[55]=point.new(93,-62)
chemin[56]=point.new(142,-11)
chemin[57]=point.new(184,-6)
chemin[58]=point.new(226,-6)
chemin[59]=point.new(267,-6)
chemin[60]=point.new(309,-5)
chemin[61]=point.new(139,193)
chemin[62]=point.new(180,206)
chemin[63]=point.new(222,207)
chemin[64]=point.new(263,204)
chemin[65]=point.new(308,204)
chemin[66]=point.new(352,194)
chemin[67]=point.new(390,178)
chemin[68]=point.new(420,147)
chemin[69]=point.new(431,105)
chemin[70]=point.new(117,-174)
chemin[71]=point.new(153,-199)
chemin[72]=point.new(195,-210)
chemin[73]=point.new(237,-208)
chemin[74]=point.new(280,-207)
chemin[75]=point.new(324,-200)
chemin[76]=point.new(371,-195)
chemin[77]=point.new(408,-166)
chemin[78]=point.new(426,-126)
chemin[79]=point.new(353,-7)
chemin[80]=point.new(395,-4)
chemin[81]=point.new(436,-2)
chemin[82]=point.new(478,-2)
chemin[83]=point.new(519,-2)
chemin[84]=point.new(429,-82)
chemin[85]=point.new(449,-44)
chemin[86]=point.new(431,61)
chemin[87]=point.new(459,29)
chemin[88]=point.new(564,1)
chemin[89]=point.new(607,1)

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
obstaclenb=136--nombre de point definissant les petits obstacles
obstacle={}
obstacle[1]=point.new(-606,-119)
obstacle[2]=point.new(-564,-106)
obstacle[3]=point.new(-523,-109)
obstacle[4]=point.new(-492,-160)
obstacle[5]=point.new(-465,-213)
obstacle[6]=point.new(-414,-255)
obstacle[7]=point.new(-360,-280)
obstacle[8]=point.new(-304,-277)
obstacle[9]=point.new(-253,-278)
obstacle[10]=point.new(-209,-275)
obstacle[11]=point.new(-152,-285)
obstacle[12]=point.new(-94,-301)
obstacle[13]=point.new(-79,-288)
obstacle[14]=point.new(-35,-304)
obstacle[15]=point.new(25,-295)
obstacle[16]=point.new(81,-288)
obstacle[17]=point.new(-98,-267)
obstacle[18]=point.new(151,-306)
obstacle[19]=point.new(129,-270)
obstacle[20]=point.new(187,-267)
obstacle[21]=point.new(233,-270)
obstacle[22]=point.new(283,-269)
obstacle[23]=point.new(337,-262)
obstacle[24]=point.new(382,-293)
obstacle[25]=point.new(457,-272)
obstacle[26]=point.new(515,-269)
obstacle[27]=point.new(587,-261)
obstacle[28]=point.new(608,-191)
obstacle[29]=point.new(608,-134)
obstacle[30]=point.new(608,-77)
obstacle[31]=point.new(612,87)
obstacle[32]=point.new(608,138)
obstacle[33]=point.new(612,191)
obstacle[34]=point.new(607,242)
obstacle[35]=point.new(597,297)
obstacle[36]=point.new(543,302)
obstacle[37]=point.new(507,302)
obstacle[38]=point.new(447,294)
obstacle[39]=point.new(438,268)
obstacle[40]=point.new(483,273)
obstacle[41]=point.new(390,294)
obstacle[42]=point.new(343,281)
obstacle[43]=point.new(288,264)
obstacle[44]=point.new(215,266)
obstacle[45]=point.new(140,264)
obstacle[46]=point.new(81,292)
obstacle[47]=point.new(15,297)
obstacle[48]=point.new(-78,287)
obstacle[49]=point.new(-139,292)
obstacle[50]=point.new(-162,256)
obstacle[51]=point.new(-146,266)
obstacle[52]=point.new(-216,292)
obstacle[53]=point.new(-299,295)
obstacle[54]=point.new(-250,281)
obstacle[55]=point.new(-333,273)
obstacle[56]=point.new(-411,260)
obstacle[57]=point.new(-611,84)
obstacle[58]=point.new(-575,95)
obstacle[59]=point.new(-533,97)
obstacle[60]=point.new(-499,141)
obstacle[61]=point.new(-476,211)
obstacle[62]=point.new(-600,44)
obstacle[63]=point.new(-562,37)
obstacle[64]=point.new(-520,47)
obstacle[65]=point.new(-604,-49)
obstacle[66]=point.new(-539,-49)
obstacle[67]=point.new(-471,-96)
obstacle[68]=point.new(-160,-223)
obstacle[69]=point.new(-341,-223)
obstacle[70]=point.new(429,-189)
obstacle[71]=point.new(416,147)
obstacle[72]=point.new(350,206)
obstacle[73]=point.new(192,206)
obstacle[74]=point.new(-196,212)
obstacle[75]=point.new(-393,194)
obstacle[76]=point.new(-422,43)
obstacle[77]=point.new(-91,-88)
obstacle[78]=point.new(608,7)
obstacle[79]=point.new(-341,-4)
obstacle[80]=point.new(-289,1)
obstacle[81]=point.new(-234,1)
obstacle[82]=point.new(-183,-2)
obstacle[83]=point.new(-455,94)
obstacle[84]=point.new(-430,146)
obstacle[85]=point.new(-351,204)
obstacle[86]=point.new(-297,204)
obstacle[87]=point.new(-248,212)
obstacle[88]=point.new(-143,198)
obstacle[89]=point.new(-115,147)
obstacle[90]=point.new(-76,110)
obstacle[91]=point.new(-24,95)
obstacle[92]=point.new(28,103)
obstacle[93]=point.new(75,128)
obstacle[94]=point.new(116,162)
obstacle[95]=point.new(137,194)
obstacle[96]=point.new(-130,11)
obstacle[97]=point.new(-92,48)
obstacle[98]=point.new(-108,-40)
obstacle[99]=point.new(244,204)
obstacle[100]=point.new(298,206)
obstacle[101]=point.new(388,178)
obstacle[102]=point.new(428,97)
obstacle[103]=point.new(438,43)
obstacle[104]=point.new(445,-10)
obstacle[105]=point.new(500,-6)
obstacle[106]=point.new(549,-4)
obstacle[107]=point.new(433,-62)
obstacle[108]=point.new(425,-119)
obstacle[109]=point.new(-398,-24)
obstacle[110]=point.new(-432,-76)
obstacle[111]=point.new(-432,-136)
obstacle[112]=point.new(-403,-181)
obstacle[113]=point.new(-291,-207)
obstacle[114]=point.new(-238,-211)
obstacle[115]=point.new(-123,-182)
obstacle[116]=point.new(-34,-93)
obstacle[117]=point.new(20,-93)
obstacle[118]=point.new(70,-84)
obstacle[119]=point.new(89,-38)
obstacle[120]=point.new(88,16)
obstacle[121]=point.new(60,63)
obstacle[122]=point.new(81,-139)
obstacle[123]=point.new(117,-181)
obstacle[124]=point.new(164,-204)
obstacle[125]=point.new(218,-212)
obstacle[126]=point.new(273,-213)
obstacle[127]=point.new(327,-205)
obstacle[128]=point.new(372,-197)
obstacle[129]=point.new(392,-15)
obstacle[130]=point.new(337,-8)
obstacle[131]=point.new(283,-7)
obstacle[132]=point.new(229,-5)
obstacle[133]=point.new(174,-5)
obstacle[134]=point.new(387,-5)
obstacle[135]=point.new(104,34)
obstacle[136]=point.new(400,22)
obstacle1nb=5--nombre de point definisant le nombre de point du gros obstacle
obstacle1={}--gros cercle
obstacle1[1]=point.new(-609,-306)
obstacle1[2]=point.new(-515,-304)
obstacle1[3]=point.new(-609,302)
obstacle1[4]=point.new(-598,209)
obstacle1[5]=point.new(-512,294)

--mine:
mineinfo={}
mineinfo.nb=2
-- local i=0
-- while i<=mineinfo.nb do
-- 	mineinfo[i]={}
-- end
mineinfo[1]=point.new(345,-113)
mineinfo[2]=point.new(348,99)

obstaclsold={}
obstaclsold.nb=0 --nombre d'obstacle ou les soldats ne peuvent pas aller.

feupassesoldat={} -- premiere dimension dit le point ou peut y avoir des flammes
feupassesoldat[1]={}
feupassesoldat[1].etat=0 -- etat de flamme
feupassesoldat[1].x=-550
feupassesoldat[1].y=-190
feupassesoldat[1].xScale=0.7
feupassesoldat[1].yScale=0.2

feupassesoldat[2]={}
feupassesoldat[2].etat=0 -- etat de flamme
feupassesoldat[2].x=-550
feupassesoldat[2].y=125
feupassesoldat[2].seq="braszero" -- nom de l'anim de la flamme facultatif
feupassesoldat[2].xScale=0.45
feupassesoldat[2].yScale=0.4
feupassesoldat[2].group=1024+200

feupassesoldat[3]={}
feupassesoldat[3].etat=0 -- etat de flamme
feupassesoldat[3].x=-550
feupassesoldat[3].y=-162
feupassesoldat[3].xScale=0.7
feupassesoldat[3].yScale=0.2

feupassesoldat[4]={}
feupassesoldat[4].etat=0 -- etat de flamme
feupassesoldat[4].x=-520
feupassesoldat[4].y=-135
feupassesoldat[4].xScale=0.30
feupassesoldat[4].yScale=0.2

end
t.obsim=function()
if obstacleim==nil then
	obstacleim={}
end
local coordonneedu=#obstacleim+1

-- #obstacleim=4--1
-- --exemple
-- obstacleim={}
-- obstacleim[1]=display.newImage( "carte/level2/bdp.png", 550,140,true )
-- obstacleim[1].xScale=0.2
-- obstacleim[1].yScale=0.2
obstacleim[coordonneedu]=nil
obstacleim[coordonneedu]=display.newImage(map8sheeto1,1)
obstacleim[coordonneedu].x=-1604.5
obstacleim[coordonneedu].y=634.5
obstacleim[coordonneedu+1]=nil
obstacleim[coordonneedu+1]=display.newImage(map8sheeto2,1)
obstacleim[coordonneedu+1].x=-301
obstacleim[coordonneedu+1].y=876.5
obstacleim[coordonneedu+2]=nil
obstacleim[coordonneedu+2]=display.newImage(map8sheeto3,1)
obstacleim[coordonneedu+2].x=1385.5
obstacleim[coordonneedu+2].y=874.5
obstacleim[coordonneedu+3]=nil
obstacleim[coordonneedu+3]=display.newImage(map8sheeto4,1)
obstacleim[coordonneedu+3].x=1994.5
obstacleim[coordonneedu+3].y=459.5


--#obstacleanim=0
if decoranim==nil then
	decoranim={}
end
coordonneedu=#decoranim+1
decoranim[coordonneedu]=nil
decoranim[coordonneedu]=display.newSprite(lapinanim,lapinanimseq)
decoranim[coordonneedu]:setSequence( "liq" )
decoranim[coordonneedu]:play()
decoranim[coordonneedu].x=0
decoranim[coordonneedu].y=0
decoranim[coordonneedu].xScale=0.3
decoranim[coordonneedu].yScale=decoranim[coordonneedu].xScale
decoranim[coordonneedu].posi=1 --0 pour coordonnée donnée donc decoranim[1].x1=XX et decoranim[1].x2=XX ,1 pour random sur les zones contructible, 2 pour sur le chemin
decoranim[coordonneedu].cadence=4000 --tout les combien de temps se produit l'anim
--decoranim=nil

decoration={}
decoration[1]={}
decoration[1].x=-287
decoration[1].y=115
decoration[1].type=25
decoration[1].planche=1
decoration[1].scale=0.35
decoration[2]={}
decoration[2].x=8
decoration[2].y=196
decoration[2].type=26
decoration[2].planche=1
decoration[2].scale=0.1
decoration[3]={}
decoration[3].x=200
decoration[3].y=-129
decoration[3].type=29
decoration[3].planche=1
decoration[3].scale=0.2



------------------------------------------------------------fin hugo---------------------------------------------------------------
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
vague[4]={4,207,208,207,207,-1,4,207,208,207,207,4,207,208,207,207,-1,4,207,208,207,207,0,0,9,235,235,235,235,235,235,235,235,235,-1,9,235,235,235,235,235,235,235,235,235,1,1,9,235,235,235,235,235,235,235,235,235,-1,9,235,235,235,235,235,235,235,235,235,1,1,9,235,235,235,235,235,235,235,235,235,-1,9,235,235,235,235,235,235,235,235,235,0,0,0,0,0,0,-10,3,270,270,270,-1,3,270,270,270,0,-10,3,270,270,270,-1,3,270,270,270,1,-10,3,270,270,270,-1,3,270,270,270,0,0,0,-10,3,270,270,270,-1,3,270,270,270,0,-10,3,270,270,270,-1,3,270,270,270,0,-10,3,270,270,270,-1,3,270,270,270,1,-10,3,270,270,270,-1,3,270,270,270,0,-10,3,270,270,270,-1,3,270,270,270,0,-10,3,270,270,270,-1,3,270,270,270,9,217,217,217,217,217,217,217,207,208,0,0,0,0,203}
vague[5]={203,0,0,0,9,207,208,207,208,207,207,207,208,208,0,-1,9,207,208,207,208,207,207,207,208,208,0,0,0,0,0,0,9,270,270,270,270,270,270,270,270,270,0,-1,9,270,270,270,270,270,270,270,270,270,0,0,0,9,235,235,235,235,235,235,235,235,235,0,-1,9,235,235,235,235,235,235,235,235,235,0,9,235,235,235,235,235,235,235,235,235,0,-1,9,235,235,235,235,235,235,235,235,235,0,9,235,235,235,235,235,235,235,235,235,0,-1,9,235,235,235,235,235,235,235,235,235,0,9,235,235,235,235,235,235,235,235,235,0,-1,9,235,235,235,235,235,235,235,235,235,0,-1,4,217,217,217,217,3,217,217,217,208,207,0,0,0,0,0,0,9,203,203,203,203,203,203,203,203,203}
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
