local t={}
t.new=function()--gestion du niveau 2 du jeu, doit toujours suivre le meme modele
	--map1= display.newImage( "carte/level2/carte1a.png", 0,0,true )--devrai etre en local pour niveau1
	-- map1p = display.newCircle(0,0,10)      --nil--display.newImage( "carte/level2/carte1p.png", 0,0,true )
	-- map1p.isVisible=false
	pouvoirdisp=3

	t=1
end
t.affichagecarte=function(pole)
	if donneecharger[3]==0 then
		donneecharger[3]=1
		map3sheethg=graphics.newImageSheet( "carte/level3/hg.jpg", { width=2048, height=1024, numFrames=1,sheetContentWidth=2048,sheetContentHeight=1024 } )
		map3sheethd=graphics.newImageSheet( "carte/level3/hd.jpg", { width=2048, height=1024, numFrames=1,sheetContentWidth=2048,sheetContentHeight=1024 } )
		map3sheetbg=graphics.newImageSheet( "carte/level3/bg.jpg", { width=2048, height=1024, numFrames=1,sheetContentWidth=2048,sheetContentHeight=1024 } )
		map3sheetbd=graphics.newImageSheet( "carte/level3/bd.jpg", { width=2048, height=1024, numFrames=1,sheetContentWidth=2048,sheetContentHeight=1024 } )
		map3sheeto1=graphics.newImageSheet( "carte/level3/g.png", { width=269, height=910, numFrames=1,sheetContentWidth=269,sheetContentHeight=910 } )
		map3sheeto2=graphics.newImageSheet( "carte/level3/hg1.png", { width=148, height=192, numFrames=1,sheetContentWidth=148,sheetContentHeight=192 } )
		map3sheeto3=graphics.newImageSheet( "carte/level3/pont.png", { width=459, height=277, numFrames=1,sheetContentWidth=459,sheetContentHeight=277 } )
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
		if poisson==nil then
			poisson=graphics.newImageSheet( "carte/level12/poisson.png", { width=461, height=157, numFrames=7 } )
			poissonseq =
			{
			    name="liq",
			    frames= {1,2,3,4,5,6,7}, -- frame indexes of animation, in image sheet
			    time = 1500,           -- Optional. In ms.  If not supplied, then sprite is frame-based.
			   loopCount=1         -- Optional. Default is 0.
			} 
		end
		if requin==nil then
			requin=graphics.newImageSheet( "carte/level12/requin.png", { width=191, height=106, numFrames=1 } )
			requinseq =
			{
			   time=2000,
			   x1=150,
			   y1=100,
			  -- onComplete=removeimage
			} 
		end
	end
	hg=display.newImage(map3sheethg,1) --display.newImage( "carte/level2/hg.png", -1024,-512,true )
	hg.x=-1024
	hg.y=-512
	hd=display.newImage(map3sheethd,1) --display.newImage( "carte/level2/hd.png",1024,-512,true )
	hd.x=1024
	hd.y=-512
	bg=display.newImage(map3sheetbg,1) --display.newImage( "carte/level2/bg.png", -1024,512,true )
	bg.x=-1024
	bg.y=512
	bd=display.newImage(map3sheetbd,1) --display.newImage( "carte/level2/bd.png", 1024,512,true )
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
	local tunededep=200
	local nbperso=leveldata[3].life
	if modeinfini or modesquelette then
		tunededep=tunedep
		nbperso=10
	end
	argentdep=-(tunededep)*3--hugo-------------------------------------------------------------------
	ennemipassedep=nbperso--nombre d'ennemi qui peuvent encore passer avant qu'on perdre---hugo-----------------------------------------------------------------------------------------------------------------
	
end
t.chemi=function()--donnees sur les differents points de la carte
local point= require( "point" )
genepointinit=46
cheminarr=nil
----------------------------------------------------------------------------------------hugo debut -----------------------------------------------------------------------
intersection={}
intersection.nb=3
intersection[1]={pt=31, ty=0, un=14}

intersection[2]={pt=30, ty=0, un=40}
intersection[3]={pt=16, ty=0, un=40}
--exemple
--intersection[1]={pt=11, ty=2, un=42, deux=15,proba=2}

pointdep={}--entré secondaire 
pointdep[1]=18 --premiere entré secondaire (donc l'entré se fait sur le point 10)
pointdep[2]=32 --deuxieme entre secondaire (donc l'entre se fait sur le point 11)
-- pointdeppro={}
-- pointdeppro[1]=0.25 -- probabilité pour le levelinf de l'entré numero i (pointdep[i+1]) , pour une meme probabilité que sur les autres entré mettre 0.5. Min 0, max 1, avec deux chiffres apres la virgule max

cheminnb=51-- --nombre de point definisant le chemin -1--------------------------------------------------------------------------------------------------
chemin={}
chemin[1]=point.new(-614,103)
chemin[2]=point.new(-574,123)
chemin[3]=point.new(-534,138)
chemin[4]=point.new(-489,141)
chemin[5]=point.new(-445,138)
chemin[6]=point.new(-401,128)
chemin[7]=point.new(-359,113)
chemin[8]=point.new(-321,89)
chemin[9]=point.new(-284,63)
chemin[10]=point.new(-243,46)
chemin[11]=point.new(-201,33)
chemin[12]=point.new(-160,24)
chemin[13]=point.new(-118,16)
chemin[14]=point.new(-77,3)
chemin[15]=point.new(-34,-1)
chemin[16]=point.new(10,-1)
chemin[17]=point.new(53,-4)
chemin[18]=point.new(-614,-280)
chemin[19]=point.new(-583,-249)
chemin[20]=point.new(-557,-213)
chemin[21]=point.new(-534,-178)
chemin[22]=point.new(-510,-142)
chemin[23]=point.new(-482,-108)
chemin[24]=point.new(-445,-88)
chemin[25]=point.new(-404,-74)
chemin[26]=point.new(-362,-70)
chemin[27]=point.new(-318,-67)
chemin[28]=point.new(-274,-64)
chemin[29]=point.new(-230,-57)
chemin[30]=point.new(-186,-51)
chemin[31]=point.new(-147,-34)
chemin[32]=point.new(-143,-308)
chemin[33]=point.new(-118,-270)
chemin[34]=point.new(-90,-236)
chemin[35]=point.new(-55,-208)
chemin[36]=point.new(-25,-174)
chemin[37]=point.new(-1,-139)
chemin[38]=point.new(10,-98)
chemin[39]=point.new(20,-56)
chemin[40]=point.new(98,-5)
chemin[41]=point.new(143,-15)
chemin[41].mechant=0.7
chemin[42]=point.new(181,-44)
chemin[42].mechant=0.7
chemin[43]=point.new(226,-49)
chemin[43].mechant=0.7
chemin[44]=point.new(273,-47)
chemin[44].mechant=0.7
chemin[45]=point.new(317,-49)
chemin[45].mechant=0.7
chemin[46]=point.new(359,-65)
chemin[47]=point.new(405,-72)
chemin[48]=point.new(449,-78)
chemin[49]=point.new(493,-82)
chemin[50]=point.new(538,-78)
chemin[51]=point.new(582,-72)
chemin[52]=point.new(613,-67)

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
obstaclenb=57--nombre de point definissant les petits obstacles
obstacle={}
obstacle[1]=point.new(-595,12)
obstacle[2]=point.new(-596,-62)
obstacle[3]=point.new(-603,-144)
obstacle[4]=point.new(-609,-184)
obstacle[5]=point.new(-578,-41)
obstacle[6]=point.new(-572,33)
obstacle[7]=point.new(-608,211)
obstacle[8]=point.new(-604,273)
obstacle[9]=point.new(-533,297)
obstacle[10]=point.new(-208,302)
obstacle[11]=point.new(-121,273)
obstacle[12]=point.new(-34,238)
obstacle[13]=point.new(51,237)
obstacle[14]=point.new(145,211)
obstacle[15]=point.new(187,116)
obstacle[16]=point.new(192,20)
obstacle[17]=point.new(182,-87)
obstacle[18]=point.new(142,-167)
obstacle[19]=point.new(117,-251)
obstacle[20]=point.new(191,-307)
obstacle[21]=point.new(277,-285)
obstacle[22]=point.new(196,-221)
obstacle[23]=point.new(232,-142)
obstacle[24]=point.new(266,-59)
obstacle[25]=point.new(264,41)
obstacle[26]=point.new(312,81)
obstacle[27]=point.new(335,131)
obstacle[28]=point.new(247,125)
obstacle[29]=point.new(287,178)
obstacle[30]=point.new(357,96)
obstacle[31]=point.new(412,137)
obstacle[32]=point.new(483,120)
obstacle[33]=point.new(567,101)
obstacle[34]=point.new(523,104)
obstacle[35]=point.new(444,121)
obstacle[36]=point.new(592,-216)
obstacle[37]=point.new(546,-232)
obstacle[38]=point.new(494,-254)
obstacle[39]=point.new(442,-304)
obstacle[40]=point.new(-521,-306)
obstacle[41]=point.new(-454,-307)
obstacle[42]=point.new(-346,-301)
obstacle[43]=point.new(-248,-306)
obstacle[44]=point.new(189,66)
obstacle[45]=point.new(159,-127)
obstacle[46]=point.new(124,-210)
obstacle[47]=point.new(132,-303)
obstacle[48]=point.new(103,-270)
obstacle[49]=point.new(177,-80)
obstacle[50]=point.new(169,164)
obstacle[51]=point.new(99,219)
obstacle[52]=point.new(6,230)
obstacle[53]=point.new(-80,256)
obstacle[54]=point.new(280,43)
obstacle[55]=point.new(223,-188)
obstacle[56]=point.new(231,-261)
obstacle[57]=point.new(-206,-8)

obstacle1nb=5--nombre de point definisant le nombre de point du gros obstacle
obstacle1={}--gros cercle
obstacle1[1]=point.new(608,305)
obstacle1[2]=point.new(413,300)
obstacle1[3]=point.new(223,299)
obstacle1[4]=point.new(603,230)
obstacle1[5]=point.new(-8,350)

obstaclsold={}
obstaclsold.nb=3 --nombre d'obstacle ou les soldats ne peuvent pas aller.
 obstaclsold[1]=point.new(177,-169)
 obstaclsold[1].rayon=8888
 obstaclsold[2]=point.new(169,-259)
 obstaclsold[2].rayon=8888
 obstaclsold[3]=point.new(254,121)
 obstaclsold[3].rayon=15000



--mine:
mineinfo={}
mineinfo.nb=0 --1
-- local i=0
-- while i<=mineinfo.nb do
-- 	mineinfo[i]={}
-- end
-- mineinfo[1]=point.new(218,142)
-- mineinfo[1].nbmine=1

decoration={} -- ligne a mettre pour la création avec assistance
decoration[1]={}
decoration[1].x=-215
decoration[1].y=-150
decoration[1].type=15
decoration[1].planche=1
decoration[1].scale=0.2
decoration[2]={}
decoration[2].x=-167
decoration[2].y=131
decoration[2].type=1
decoration[2].planche=1
decoration[2].scale=0.2
decoration[3]={}
decoration[3].x=356
decoration[3].y=-195
decoration[3].type=3
decoration[3].planche=1
decoration[3].scale=0.2

end
t.obsim=function()
if obstacleim==nil then
	obstacleim={}
end
--#obstacleim=3--1
--exemple

local coordonneedu=#obstacleim+1
-- obstacleim[1]=display.newImage( "carte/level2/bdp.png", 550,140,true )
-- obstacleim[1].xScale=0.2
-- obstacleim[1].yScale=0.2
obstacleim[coordonneedu]=display.newImage( map3sheeto1,1 )
obstacleim[coordonneedu].x=-1913.5
obstacleim[coordonneedu].y=-284
obstacleim[coordonneedu].group=2000

obstacleim[coordonneedu+1]=display.newImage( map3sheeto2,1 )
obstacleim[coordonneedu+1].x=-678
obstacleim[coordonneedu+1].y=-104
obstacleim[coordonneedu+2]=display.newImage( map3sheeto3,1 )
obstacleim[coordonneedu+2].x=750.5
obstacleim[coordonneedu+2].y=-15.5
obstacleim[coordonneedu+2].group=2048
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
decoranim[coordonneedu].yScale=decoranim[coordonneedu].xScale
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

coordonneedu=#decoranim+1
decoranim[coordonneedu]=display.newSprite(poisson,poissonseq)
decoranim[coordonneedu]:setSequence( "liq" )
decoranim[coordonneedu]:play()
decoranim[coordonneedu].x=200
decoranim[coordonneedu].y=-290
decoranim[coordonneedu].xScale=0.2
decoranim[coordonneedu].yScale=decoranim[coordonneedu].xScale
decoranim[coordonneedu].posi=0 --0 pour coordonnée donnée donc decoranim[1].x1=XX et decoranim[1].x2=XX ,1 pour random sur les zones contructible, 2 pour sur le chemin
decoranim[coordonneedu].cadence=10000 --tout les combien de temps se produit l'anim

coordonneedu=#decoranim+1
decoranim[coordonneedu]=display.newSprite(poisson,poissonseq)
decoranim[coordonneedu]:setSequence( "liq" )
decoranim[coordonneedu]:play()
decoranim[coordonneedu].x=220
decoranim[coordonneedu].y=80
decoranim[coordonneedu].xScale=0.2
decoranim[coordonneedu].yScale=decoranim[coordonneedu].xScale
decoranim[coordonneedu].xScale=-decoranim[coordonneedu].xScale
decoranim[coordonneedu].posi=0 --0 pour coordonnée donnée donc decoranim[1].x1=XX et decoranim[1].x2=XX ,1 pour random sur les zones contructible, 2 pour sur le chemin
decoranim[coordonneedu].cadence=14000 --tout les combien de temps se produit l'anim


coordonneedu=#decoranim+1
decoranim[coordonneedu]=display.newImage(requin,1)
decoranim[coordonneedu].x=0
decoranim[coordonneedu].y=0
decoranim[coordonneedu].xdep=150
decoranim[coordonneedu].ydep=220
decoranim[coordonneedu].xScale=0.25
decoranim[coordonneedu].yScale=decoranim[coordonneedu].xScale
decoranim[coordonneedu].posi=-1 -- -1 pour transition au coordonnée donnée, -2 pareil que 1 et -3 pareil que 2, 0 pour coordonnée donnée donc decoranim[1].x1=XX et decoranim[1].x2=XX ,1 pour random sur les zones contructible, 2 pour sur le chemin
decoranim[coordonneedu].para=requinseq
decoranim[coordonneedu].para.y1=30
decoranim[coordonneedu].para.x1=110
decoranim[coordonneedu].cadence=17000 --tout les combien de temps se produit l'anim

end



------------------------------------------------------------fin hugo---------------------------------------------------------------
t.vague=function()--donnees sur les vagues du niveau
vague={}
local k=nil
--nbvague=3--nombre de vague dans le niveau--hugo--
--on met -1 quand c'est le dernier soldat
for k=1,leveldata[3].wave,1 do
	vague[k]={}
	vague[k][1]=200
end
-------------------------------------------------------------debut hugo-----------------------------------------------------
--0 retarde de la durer de spawn de 3 soldat et 1 de la durer de 1 soldat
--de 2 à 5 permet de spawner plusieurs soldat a la fois.
-- de -1 à -9 c'est le numero de l'entré non principale (-1 pour la deuxieme entré qui est déclarer plus haut dans chemin)
-- de -10 à -inf c'est le nombre de group (-lenumero-8) de spawn spawner en meme temps donc si on met -10 on spawn 2 group donc si apres il y a -2 ca va spawner sur l'entré 3 puis un 4 ca va spawner 4 soldat dit just apres ensuite on peut avoir un 4 ca va spawner 4 soldat sur l'entré une ensuite on met l'identifiant des 4soldats
--vague[1].nb=2--nb soldat dans la vague
-- vague[2].nb=3
-- vague[3].nb=5
-- vague[4].nb=6
-- vague[5].nb=11
-- for i=1,2 do --50 do
-- 	vague[1][i+(i-1)*5]=5
-- 	for j=1,5 do
-- 		vague[1][i+(i-1)*5+j]=204
-- 	end
-- end
--200
vague[1]={-2,267,264,-1,267,0,0,0,-2,5,210,211,210,211,210,0,5,210,211,210,211,210,0,0,-1,5,210,211,210,210,210,0,0,0,201,0,0,-1,206,0,-2,201,0,0,0,0,0,0,0,0,-1,200,200,-2,200}
vague[2]={3,226,226,226,-1,3,226,226,226,-2,3,226,226,226,0,0,0,0,-1,213,213,0,-2,213,0,0,0,0,0,0,0,0,3,270,270,270,0,0,-2,3,270,270,270,0,-1,3,270,270,270,0,0,0,0,0,0,0,3,270,270,270,0,-2,3,270,270,270,0,-1,3,270,270,270,-1,5,200,200,200,200,200,0,5,200,200,200,200,200,0,0,-2,5,200,200,200,200,200,0,0,0,0,205,-1,201,0,-2,205,0,0,0,0,5,202,206,213,202,206,213,0,0,0,0,-1,5,212,214,212,214,212}
vague[3]={5,270,270,270,270,270,-2,5,270,270,270,270,270,0,-1,3,264,267,264,0,0,0,0,0,-1,5,205,205,205,205,205,0,0,5,201,201,201,201,201,0,0,-2,5,201,201,201,201,201,0,0,0,0,0,0,200}
vague[4]={200,0,0,0,0,0,0,0,0,0,5,270,270,270,270,270,-2,5,270,270,270,270,270,0,-1,5,264,267,264,264,267,-1,2,218,218,218,218,0,0,-2,2,218,218}

--nbvague=3
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
	vague[1]={2,266,266,-1,9,267,267,267,267,267,267,267,267,267,-2,9,267,267,267,267,267,267,267,267,267,4,201,201,201,201,-1,4,201,201,201,201,-2,4,201,201,201,201,4,201,201,201,201,-1,4,201,201,201,201,-2,4,201,201,201,201,4,201,201,201,201,-1,4,201,201,201,201,-2,4,201,201,201,201,4,201,201,201,201,-1,4,201,201,201,201,-2,4,201,201,201,201,4,201,201,201,201,-1,4,201,201,201,201,-2,4,201,201,201,201,4,201,201,201,201,-1,4,201,201,201,201,-2,4,201,201,201,201}
end
return t
