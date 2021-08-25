local t={} --niveau inf
t.new=function()--gestion du niveau 4 du jeu, doit toujours suivre le meme modele
	--map1= display.newImage( "carte/level2/carte1a.png", 0,0,true )--devrai etre en local pour niveau1
	-- map1p = display.newCircle(0,0,10)      --nil--display.newImage( "carte/level2/carte1p.png", 0,0,true )
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
		map4sheethg=graphics.newImageSheet( "carte/level4/hg.jpg", { width=2048, height=1024, numFrames=1,sheetContentWidth=2048,sheetContentHeight=1024 } )
		map4sheethd=graphics.newImageSheet( "carte/level4/hd.jpg", { width=2048, height=1024, numFrames=1,sheetContentWidth=2048,sheetContentHeight=1024 } )
		map4sheetbg=graphics.newImageSheet( "carte/level4/bg.jpg", { width=2048, height=1024, numFrames=1 ,sheetContentWidth=2048,sheetContentHeight=1024} )
		map4sheetbd=graphics.newImageSheet( "carte/level4/bd.jpg", { width=2048, height=1024, numFrames=1,sheetContentWidth=2048,sheetContentHeight=1024 } )
		map4sheeto1=graphics.newImageSheet( "carte/level4/bg.png", { width=1709, height=891, numFrames=1,sheetContentWidth=1709,sheetContentHeight=891 } )
		map4sheeto2=graphics.newImageSheet( "carte/level4/bm.png", { width=2000, height=228, numFrames=1,sheetContentWidth=2000,sheetContentHeight=228 } )
		map4sheeto3=graphics.newImageSheet( "carte/level4/c.png", { width=217, height=377, numFrames=1,sheetContentWidth=217,sheetContentHeight=377 } )
		map4sheeto4=graphics.newImageSheet( "carte/level4/g.png", { width=286, height=722, numFrames=1,sheetContentWidth=286,sheetContentHeight=722 } )
		map4sheeto5=graphics.newImageSheet( "carte/level4/ani.png", { width=500, height=499, numFrames=1,sheetContentWidth=500,sheetContentHeight=499 } )
		if taupeanim==nil then
			taupeanim=graphics.newImageSheet("carte/level1/taupe1.png", { width=56, height=55, numFrames=5 } )
			taupeanimseq =
			{
			    name="liq",
			    frames= {1,2,3,4,5,5,5,2,2,2,1,1,1,1}, -- frame indexes of animation, in image sheet
			    time = 4000,           -- Optional. In ms.  If not supplied, then sprite is frame-based.
			   loopCount=1         -- Optional. Default is 0.
			}
			veranimseq={
				name="liq", 
				frames={1,1,1,2,2,2,3,4,5,6,7,8,9,10,10,10,10,9,8,7,6,5,4,3,2,2,2,1,1,1}, -- frame indexes of animation, in image sheet
				time = 10000,           -- Optional. In ms.  If not supplied, then sprite is frame-based.
				loopCount=1
			}
			veranim=graphics.newImageSheet("carte/level1/verdeterre.png", { width=18, height=26, numFrames=10 } )
		end
	end
	hg=display.newImage(map4sheethg,1) --display.newImage( "carte/level2/hg.png", -1024,-512,true )
	hg.x=-1024
	hg.y=-512
	hd=display.newImage(map4sheethd,1) --display.newImage( "carte/level2/hd.png",1024,-512,true )
	hd.x=1024
	hd.y=-512
	bg=display.newImage(map4sheetbg,1) --display.newImage( "carte/level2/bg.png", -1024,512,true )
	bg.x=-1024
	bg.y=512
	bd=display.newImage(map4sheetbd,1) --display.newImage( "carte/level2/bd.png", 1024,512,true )
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
intersection[6]={pt=59, ty=0, un=70}

pointdep={}--entré secondaire 
pointdep[1]=35 --
--exemple

--intersection[1]={pt=11, ty=2, un=42, deux=15,proba=2}
cheminnb=75-- --nombre de point definisant le chemin -1--------------------------------------------------------------------------------------------------
chemin={}
chemin[1]=point.new(-614,-215)
chemin[2]=point.new(-569,-216)
chemin[3]=point.new(-525,-216)
chemin[4]=point.new(-482,-207)
chemin[5]=point.new(-440,-197)
chemin[6]=point.new(-396,-185)
chemin[7]=point.new(-354,-172)
chemin[8]=point.new(-313,-163)
chemin[9]=point.new(-271,-148)
chemin[10]=point.new(-229,-140)
chemin[11]=point.new(-186,-129)
chemin[12]=point.new(-146,-119)
chemin[13]=point.new(-104,-103)
chemin[14]=point.new(-94,-64)
chemin[15]=point.new(-104,-23)
chemin[16]=point.new(-146,-7)
chemin[17]=point.new(-193,-7)
chemin[18]=point.new(-240,-7)
chemin[19]=point.new(-286,-3)
chemin[20]=point.new(-331,0)
chemin[21]=point.new(-373,5)
chemin[22]=point.new(-419,13)
chemin[23]=point.new(-429,15)
chemin[24]=point.new(-386,8)
chemin[25]=point.new(-343,2)
chemin[26]=point.new(-299,-5)
chemin[27]=point.new(-255,-8)
chemin[28]=point.new(-212,-11)
chemin[29]=point.new(-170,-7)
chemin[30]=point.new(-128,-5)
chemin[31]=point.new(-104,-39)
chemin[32]=point.new(-94,-81)
chemin[33]=point.new(-79,-120)
chemin[34]=point.new(-42,-145)
chemin[35]=point.new(-614,299)
chemin[36]=point.new(-570,286)
chemin[37]=point.new(-530,269)
chemin[38]=point.new(-489,251)
chemin[39]=point.new(-448,240)
chemin[40]=point.new(-409,216)
chemin[41]=point.new(-373,190)
chemin[42]=point.new(-334,164)
chemin[43]=point.new(-295,141)
chemin[44]=point.new(-252,126)
chemin[45]=point.new(-209,115)
chemin[46]=point.new(-167,105)
chemin[47]=point.new(-125,95)
chemin[48]=point.new(-92,63)
chemin[49]=point.new(-105,20)
chemin[50]=point.new(-55,84)
chemin[51]=point.new(-16,100)
chemin[52]=point.new(27,110)
chemin[53]=point.new(69,115)
chemin[54]=point.new(113,116)
chemin[55]=point.new(158,112)
chemin[56]=point.new(204,102)
chemin[57]=point.new(246,82)
chemin[58]=point.new(284,56)
chemin[59]=point.new(314,24)
chemin[60]=point.new(355,4)
chemin[61]=point.new(1,-158)
chemin[62]=point.new(46,-158)
chemin[63]=point.new(90,-158)
chemin[64]=point.new(134,-155)
chemin[65]=point.new(179,-154)
chemin[66]=point.new(219,-141)
chemin[67]=point.new(259,-123)
chemin[68]=point.new(290,-95)
chemin[69]=point.new(311,-58)
chemin[70]=point.new(357,1)
chemin[71]=point.new(401,9)
chemin[72]=point.new(446,12)
chemin[73]=point.new(488,11)
chemin[74]=point.new(533,11)
chemin[75]=point.new(576,7)
chemin[76]=point.new(612,3)


obstacle0nb=0

obstaclenb=35--nombre de point definissant les petits obstacles
obstacle={}
obstacle[1]=point.new(-500,147)
obstacle[2]=point.new(-613,151)
obstacle[3]=point.new(-574,142)
obstacle[4]=point.new(-572,157)
obstacle[5]=point.new(-609,-3)
obstacle[6]=point.new(-613,-2850)
obstacle[7]=point.new(-536,-280)
obstacle[8]=point.new(-442,-280)
obstacle[9]=point.new(-356,-280)
obstacle[10]=point.new(-260,-280)
obstacle[11]=point.new(-177,-280)
obstacle[12]=point.new(-77,-280)
obstacle[13]=point.new(13,-280)
obstacle[14]=point.new(98,-280)
obstacle[15]=point.new(-130,-280)
obstacle[16]=point.new(-217,-280)
obstacle[17]=point.new(-308,-280)
obstacle[18]=point.new(171,-282)
obstacle[19]=point.new(242,-275)
obstacle[20]=point.new(320,-270)
obstacle[21]=point.new(-34,-283)
obstacle[22]=point.new(56,-281)
obstacle[23]=point.new(135,-280)
obstacle[24]=point.new(203,-285)
obstacle[25]=point.new(277,-278)
obstacle[26]=point.new(413,-119)
obstacle[27]=point.new(586,-119)
obstacle[28]=point.new(586,125)
obstacle[29]=point.new(545,185)
obstacle[30]=point.new(492,225)
obstacle[31]=point.new(433,230)
obstacle[32]=point.new(382,260)
obstacle[33]=point.new(330,290)
obstacle[34]=point.new(520,185)
obstacle[35]=point.new(103,-17)


obstacle1nb=2--nombre de point definisant le nombre de point du gros obstacle
obstacle1={}--gros cercle
obstacle1[1]=point.new(491,-206)
obstacle1[2]=point.new(612,303)

--mine:
mineinfo={}
mineinfo.nb=1
mineinfo[1]=point.new(-507,17)
mineinfo[1].nbmine=1
mineinfo[1].nbmine1=7

obstaclsold={}
obstaclsold.nb=0 --nombre d'obstale ou les soldats ne peuvent pas aller.

feupassesoldat={} -- premiere dimension dit le point ou peut y avoir des flammes
feupassesoldat[1]={}
feupassesoldat[1].etat=0 -- etat de flamme
feupassesoldat[1].x=107
feupassesoldat[1].y=-70
feupassesoldat[1].xScale=0.35
feupassesoldat[1].yScale=0.2
feupassesoldat[1].group=1990
feupassesoldat[2]={}
feupassesoldat[2].etat=0 -- etat de flamme
feupassesoldat[2].x=440
feupassesoldat[2].y=-253
feupassesoldat[2].xScale=0.47
feupassesoldat[2].yScale=0.2

feupassesoldat[3]={}
feupassesoldat[3].etat=0 -- etat de flamme
feupassesoldat[3].x=530
feupassesoldat[3].y=-240
feupassesoldat[3].xScale=0.28
feupassesoldat[3].yScale=0.2


-- feupassesoldat[2]={}
-- feupassesoldat[2].etat=0 -- etat de flamme
-- feupassesoldat[2].x=130
-- feupassesoldat[2].y=85
-- feupassesoldat[2].seq="fl" -- nom de l'anim de la flamme facultatif
-- feupassesoldat[2].group=200+1024 -- numero du groupe facultatif
-- feupassesoldat[2].xScale=0.45
-- feupassesoldat[2].yScale=0.2

end
t.obsim=function()
if obstacleim==nil then
	obstacleim={}
end

-- #obstacleim=5--1
-- --exemple
-- obstacleim={}
-- obstacleim[1]=display.newImage( "carte/level2/bdp.png", 550,140,true )
-- obstacleim[1].xScale=0.2
-- obstacleim[1].yScale=0.2
local coordonneedu=#obstacleim+1
obstacleim[coordonneedu]=display.newImage( map4sheeto1,1 )
obstacleim[coordonneedu].x=1193.5
obstacleim[coordonneedu].y=578.5
obstacleim[coordonneedu+1]=display.newImage( map4sheeto2,1 )
obstacleim[coordonneedu+1].x=-661
obstacleim[coordonneedu+1].y=910
obstacleim[coordonneedu+2]=display.newImage( map4sheeto3,1 )
obstacleim[coordonneedu+2].x=351.5
obstacleim[coordonneedu+2].y=-215.5
obstacleim[coordonneedu+2].group=1990
obstacleim[coordonneedu+3]=display.newImage( map4sheeto4,1 )
obstacleim[coordonneedu+3].x=-1905
obstacleim[coordonneedu+3].y=-375
obstacleim[coordonneedu+3].group=2048-100
obstacleim[coordonneedu+4]=display.newImage( map4sheeto5,1 )
obstacleim[coordonneedu+4].x=353
obstacleim[coordonneedu+4].y=-265.5
obstacleim[coordonneedu+4].group=1991
-- obstacleim[5].nature=1
-- obstacleim[5].rotation=-2000
-- obstacleim[5].rotation=60000
-- obstacleim[5].iterations=100
local moulinblabla1=function(obj)
	print("yop0")
	lancemoulinori(obj.num)
	--animmoulin(obj.num)
end
local moulinblabla=function(obj)
	print("yop")
	animmoulin(obj.num)
end
obstacleim[coordonneedu+4].anim=true
function animmoulin(num)
	print("1yop")
	if obstacleim[num]~=nil then
		obstacleim[num].anim=transition.to( obstacleim[num], { rotation=-2000, time=60000, iterations=100,onComplete=moulinblabla, onCancel=moulinblabla1 } )
	end
end
function lancemoulinori(num)
	print("lancemoulinori")
	local function lancemoulin( event )
		animmoulin(event.source.num)
	end
	local lancemoulin1=timer.performWithDelay(500,lancemoulin)
	lancemoulin1.num=num
end
lancemoulinori(coordonneedu+4)
--animmoulin(coordonneedu+4)
obstacleim[coordonneedu+4].num=coordonneedu+4


-- obstacleim[coordonneedu+4].anim=transition.to( obstacleim[coordonneedu+4], { rotation=-100, time=3000, iterations=1 } )
-- local function listener2( event )
-- 	obstacleim[event.source.numspec].anim=transition.to( obstacleim[event.source.numspec], { rotation=-100, time=3000, iterations=1 } )
-- end
-- local letimerssdfg1=timer.performWithDelay( 3000, listener2 )
-- letimerssdfg1.numspec=coordonneedu+4
-- local function listener1( event )
-- 	obstacleim[event.source.numspec].anim=transition.to( obstacleim[event.source.numspec], { rotation=-2000, time=60000, iterations=100 } )
-- end
-- local letimerssdfg=timer.performWithDelay( 6000, listener1 )
-- letimerssdfg.numspec=coordonneedu+4
--#obstacleanim=0
if decoranim==nil then
	decoranim={}
end
coordonneedu=#decoranim+1
decoranim[coordonneedu]=display.newSprite(taupeanim,taupeanimseq)
decoranim[coordonneedu]:setSequence( "liq" )
decoranim[coordonneedu]:play()
decoranim[coordonneedu].x=0
decoranim[coordonneedu].y=0
decoranim[coordonneedu].xScale=0.2
decoranim[coordonneedu].yScale=decoranim[1].xScale
decoranim[coordonneedu].posi=1 --0 pour coordonnée donnée donc decoranim[1].x1=XX et decoranim[1].x2=XX ,1 pour random sur les zones contructible, 2 pour sur le chemin
decoranim[coordonneedu].cadence=4000 --tout les combien de temps se produit l'anim
--decoranim[1].legroup= <0 pour group y-.legroup et >0 pour que ca soit group=.legroup 


decoranim[coordonneedu+1]=display.newSprite(veranim,veranimseq)
decoranim[coordonneedu+1]:setSequence( "liq" )
decoranim[coordonneedu+1]:play()
-- decoranim[coordonneedu+1]:setFillColor(1,1,0)
decoranim[coordonneedu+1].x=0
decoranim[coordonneedu+1].y=0
decoranim[coordonneedu+1].xScale=0.4
decoranim[coordonneedu+1].yScale=decoranim[coordonneedu+1].xScale
decoranim[coordonneedu+1].posi=2 --0 pour coordonnée donnée donc decoranim[1].x=XX et decoranim[1].x=XX ,1 pour random sur les zones contructible, 2 pour sur le chemin
decoranim[coordonneedu+1].cadence=20000

-- decoration={}
-- decoration[1]={}
-- decoration[1].x=-215
-- decoration[1].y=-150
-- decoration[1].type=1
-- decoration[1].planche=1
-- decoration[1].scale=0.2
-- decoration[2]={}
-- decoration[2].x=-167
-- decoration[2].y=131
-- decoration[2].type=1
-- decoration[2].planche=1
-- decoration[2].scale=0.2
-- decoration[3]={}
-- decoration[3].x=356
-- decoration[3].y=-195
-- decoration[3].type=1
-- decoration[3].planche=1
-- decoration[3].scale=0.2

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

vague[1]={-10,4,270,270,270,270,-1,5,200,200,200,200,200,0,0,0,0,0,0,0,0,0,-1,218,-10,-1,3,270,270,270,-1,270,-1,270,5,202,206,209,213,202,0,-10,-1,3,270,270,270,-1,270,5,202,206,209,213,202,201}
vague[2]={202,0,0,0,0,0,3,264,264,270,270,270,-1,3,267,267,270,-1,270,-1,270,2,218,218,219,-1,2,218,218,-1,219,0,0,0,0,0,0,0,210}
vague[3]={3,200,200,200,200,200,-1,3,200,200,200,-1,200,-1,200,0,0,0,3,200,200,200,200,200,-1,3,200,200,200,-1,200,-1,200,0,0,0,0,0,0,2,218,218,218,0,0,0,2,219,219,219,0,0,0,0,0,0,0,0,-1,3,264,264,264,0,0,-1,3,270,270,270,-1,270,-1,270}
vague[4]={200,0,3,200,200,200,200,200,3,200,200,200,200,200,3,200,200,200,200,200,-1,2,218,218,0,0,-1,2,219,219,0,0,-1,3,206,202,213,-1,3,206,202,213}
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