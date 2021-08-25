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
	if donneecharger[5]==0 then
		donneecharger[5]=1
		map5sheethg=graphics.newImageSheet( "carte/level5/hg.jpg", { width=2048, height=1024, numFrames=1,sheetContentWidth=2048,sheetContentHeight=1024 } )
		map5sheethd=graphics.newImageSheet( "carte/level5/hd.jpg", { width=2048, height=1024, numFrames=1,sheetContentWidth=2048,sheetContentHeight=1024 } )
		map5sheetbg=graphics.newImageSheet( "carte/level5/bg.jpg", { width=2048, height=1024, numFrames=1,sheetContentWidth=2048,sheetContentHeight=1024 } )
		map5sheetbd=graphics.newImageSheet( "carte/level5/bd.jpg", { width=2048, height=1024, numFrames=1,sheetContentWidth=2048,sheetContentHeight=1024 } )
		map5sheeto1=graphics.newImageSheet( "carte/level5/1.png", { width=872, height=2048, numFrames=1,sheetContentWidth=872,sheetContentHeight=2048 } )
		map5sheeto2=graphics.newImageSheet( "carte/level5/2.png", { width=678, height=873, numFrames=1,sheetContentWidth=678,sheetContentHeight=873 } )
		map5sheeto3=graphics.newImageSheet( "carte/level5/3.png", { width=333, height=565, numFrames=1,sheetContentWidth=333,sheetContentHeight=565 } )
		map5sheeto4=graphics.newImageSheet( "carte/level5/4.png", { width=474, height=273, numFrames=1,sheetContentWidth=474,sheetContentHeight=273 } )
		map5sheeto5=graphics.newImageSheet( "carte/level5/5.png", { width=1700, height=117, numFrames=1,sheetContentWidth=1700,sheetContentHeight=117 } )
		map5sheeto6=graphics.newImageSheet( "carte/level5/6.png", { width=576, height=186, numFrames=1,sheetContentWidth=576,sheetContentHeight=186 } )
		if lapinanim==nil then
			lapinanim=graphics.newImageSheet("carte/level5/lapin.png", { width=80, height=55, numFrames=7 } )
			lapinanimseq =
			{
			    name="liq",
			    frames= {1,1,2,2,3,4,5,5,5,6,7,1,1}, -- frame indexes of animation, in image sheet
			    time = 4000,           -- Optional. In ms.  If not supplied, then sprite is frame-based.
			   loopCount=1         -- Optional. Default is 0.
			} 
		end
	end
	hg=display.newImage(map5sheethg,1) --display.newImage( "carte/level2/hg.png", -1024,-512,true )
	hg.x=-1024
	hg.y=-512
	hd=display.newImage(map5sheethd,1) --display.newImage( "carte/level2/hd.png",1024,-512,true )
	hd.x=1024
	hd.y=-512
	bg=display.newImage(map5sheetbg,1) --display.newImage( "carte/level2/bg.png", -1024,512,true )
	bg.x=-1024
	bg.y=512
	bd=display.newImage(map5sheetbd,1) --display.newImage( "carte/level2/bd.png", 1024,512,true )
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
	local tunededep=300
	local nbperso=leveldata[5].life
	if modeinfini or modesquelette then
		tunededep=tunedep
		nbperso=10
	end
	argentdep=-(tunededep)*3--hugo-------------------------------------------------------------------
	ennemipassedep=nbperso--nombre d'ennemi qui peuvent encore passer avant qu'on perdre---hugo------------------------------------------------------------------------------------------------------------------
	
end
t.chemi=function()--donnees sur les differents points de la carte
local point= require( "point" )
cheminlargeur=2.5
distancedetection=0.4
genepointinit=nil
cheminarr=nil

pointdep={}--entré secondaire 
pointdep[1]=31 --
pointdeppro={}
pointdeppro[2]=0.15 -- probabilité pour le levelinf de l'entré numero i (pointdep[i+1]) , pour une meme probabilité que sur les autres entré mettre 0.5. Min 0, max 1, avec deux chiffres apres la virgule max
----------------------------------------------------------------------------------------hugo debut -----------------------------------------------------------------------
intersection={}
intersection.nb=1
intersection[1]={pt=28, ty=0, un=34}

cheminnb=73-- --nombre de point definisant le chemin -1--------------------------------------------------------------------------------------------------
chemin={}
chemin[1]=point.new(109,-308)
chemin[2]=point.new(109,-267)
chemin[3]=point.new(115,-226)
chemin[4]=point.new(120,-184)
chemin[5]=point.new(123,-140)
chemin[6]=point.new(117,-100)
chemin[7]=point.new(110,-62)
chemin[8]=point.new(96,-21)
chemin[9]=point.new(83,13)
chemin[10]=point.new(65,44)
chemin[11]=point.new(32,70)
chemin[12]=point.new(3,83)
chemin[13]=point.new(-34,84)
chemin[14]=point.new(-75,91)
chemin[15]=point.new(-132,91)
chemin[16]=point.new(-171,88)
chemin[17]=point.new(-212,81)
chemin[18]=point.new(-257,63)
chemin[19]=point.new(-286,24)
chemin[20]=point.new(-295,-28)
chemin[21]=point.new(-291,-77)
chemin[22]=point.new(-257,-109)
chemin[23]=point.new(-215,-114)
chemin[24]=point.new(-169,-114)
chemin[25]=point.new(-121,-119)
chemin[26]=point.new(-80,-140)
chemin[27]=point.new(-58,-181)
chemin[28]=point.new(-80,-223)
chemin[29]=point.new(-116,-243)
chemin[30]=point.new(-2,-308)
chemin[31]=point.new(-23,-270)
chemin[32]=point.new(-63,-251)
chemin[33]=point.new(-106,-246)
chemin[34]=point.new(-153,-248)
chemin[35]=point.new(-195,-248)
chemin[36]=point.new(-239,-244)
chemin[37]=point.new(-285,-245)
chemin[38]=point.new(-330,-242)
chemin[39]=point.new(-374,-232)
chemin[40]=point.new(-410,-203)
chemin[41]=point.new(-441,-169)
chemin[42]=point.new(-462,-128)
chemin[43]=point.new(-467,-86)
chemin[44]=point.new(-471,-46)
chemin[45]=point.new(-473,1)
chemin[46]=point.new(-464,43)
chemin[47]=point.new(-451,86)
chemin[48]=point.new(-433,121)
chemin[49]=point.new(-405,154)
chemin[50]=point.new(-374,188)
chemin[51]=point.new(-332,207)
chemin[52]=point.new(-291,224)
chemin[53]=point.new(-247,237)
chemin[54]=point.new(-205,238)
chemin[55]=point.new(-162,242)
chemin[56]=point.new(-114,242)
chemin[57]=point.new(-66,240)
chemin[58]=point.new(-23,242)
chemin[59]=point.new(24,238)
chemin[60]=point.new(68,229)
chemin[61]=point.new(108,217)
chemin[62]=point.new(153,204)
chemin[63]=point.new(194,185)
chemin[64]=point.new(234,164)
chemin[65]=point.new(275,139)
chemin[66]=point.new(311,112)
chemin[67]=point.new(343,79)
chemin[68]=point.new(374,48)
chemin[69]=point.new(408,16)
chemin[70]=point.new(449,-9)
chemin[71]=point.new(493,-32)
chemin[72]=point.new(533,-41)
chemin[73]=point.new(577,-53)
chemin[74]=point.new(610,-54)
--for i=1,74 do
	--chemin[i].mechant=0.7
--end
--chemin[29].mechant=0.4
--chemin[28].mechant=0.4
--chemin[35].mechant=0.5
--chemin[34].mechant=0.5
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
obstaclenb=64--nombre de point definissant les petits obstacles
obstacle={}
obstacle[1]=point.new(-614,-175)
obstacle[2]=point.new(-609,-243)
obstacle[3]=point.new(-595,-303)
obstacle[4]=point.new(-534,-304)
obstacle[5]=point.new(-567,-270)
obstacle[6]=point.new(-484,-326)
obstacle[7]=point.new(-417,-340)
obstacle[8]=point.new(-614,177)
obstacle[9]=point.new(-609,234)
obstacle[10]=point.new(-613,287)
obstacle[11]=point.new(-562,285)
obstacle[12]=point.new(-507,279)
obstacle[13]=point.new(-555,241)
obstacle[14]=point.new(-450,305)
obstacle[15]=point.new(-372,303)
obstacle[16]=point.new(-429,-134)
obstacle[17]=point.new(-310,300)
obstacle[18]=point.new(-268,297)
obstacle[19]=point.new(-212,295)
obstacle[20]=point.new(-141,300)
obstacle[21]=point.new(-92,299)
obstacle[22]=point.new(-29,292)
obstacle[23]=point.new(28,289)
obstacle[24]=point.new(90,305)
obstacle[25]=point.new(158,305)
obstacle[26]=point.new(216,305)
obstacle[27]=point.new(267,305)
obstacle[28]=point.new(321,305)
obstacle[29]=point.new(373,305)
obstacle[30]=point.new(212,305)
obstacle[31]=point.new(382,245)
obstacle[32]=point.new(390,209)
obstacle[33]=point.new(425,168)
obstacle[34]=point.new(443,138)
obstacle[35]=point.new(489,115)
obstacle[36]=point.new(541,95)
obstacle[37]=point.new(594,92)
obstacle[38]=point.new(610,38)
obstacle[39]=point.new(612,-17)
obstacle[40]=point.new(363,258)
obstacle[41]=point.new(-578,183)
obstacle[42]=point.new(-630,-119)
obstacle[43]=point.new(-630,-72)
obstacle[44]=point.new(-630,-23)
obstacle[45]=point.new(-630,29)
obstacle[46]=point.new(-630,82)
obstacle[47]=point.new(-630,132)
obstacle[48]=point.new(283,-58)
obstacle[49]=point.new(320,-82)
obstacle[50]=point.new(359,-106)
obstacle[51]=point.new(389,-134)
obstacle[52]=point.new(425,-131)
obstacle[53]=point.new(472,-136)
obstacle[54]=point.new(517,-141)
obstacle[55]=point.new(550,-144)
obstacle[56]=point.new(605,-142)
obstacle[57]=point.new(287,-124)
obstacle[58]=point.new(295,-182)
obstacle[59]=point.new(278,-230)
obstacle[60]=point.new(258,-207)
obstacle[61]=point.new(225,-230)
obstacle[62]=point.new(219,-287)
obstacle[63]=point.new(158,-308)
obstacle[64]=point.new(53,-308)

obstacle1nb=5--nombre de point definisant le nombre de point du gros obstacle
obstacle1={}--gros cercle
obstacle1[1]=point.new(610,230)
obstacle1[2]=point.new(538,292)
obstacle1[3]=point.new(607,-304)
obstacle1[4]=point.new(468,-285)
obstacle1[5]=point.new(356,-285)
--mine:
mineinfo={}
mineinfo.nb=1
mineinfo[1]=point.new(-546,126)

obstaclsold={}
obstaclsold.nb=0 --nombre d'obstacle ou les soldats ne peuvent pas aller.

feupassesoldat={} -- premiere dimension dit le point ou peut y avoir des flammes
feupassesoldat[1]={}
feupassesoldat[1].etat=0 -- etat de flamme
feupassesoldat[1].x=470
feupassesoldat[1].y=183
feupassesoldat[1].xScale=0.55
feupassesoldat[1].yScale=0.6
feupassesoldat[1].rotate=-20 -- faculatif
feupassesoldat[1].group=1024+150+30

feupassesoldat[2]={}
feupassesoldat[2].etat=0 -- etat de flamme
feupassesoldat[2].x=600
feupassesoldat[2].y=175
feupassesoldat[2].xScale=0.35
feupassesoldat[2].yScale=0.45
feupassesoldat[2].rotate=15 -- faculatif


end
t.obsim=function()
if obstacleim==nil then
	obstacleim={}
end
--#obstacleim=6--1
--exemple
--obstacleim={}
-- obstacleim[1]=display.newImage( "carte/level2/bdp.png", 550,140,true )
-- obstacleim[1].xScale=0.2
-- obstacleim[1].yScale=0.2
local coordonneedu=#obstacleim+1
obstacleim[coordonneedu]=display.newImage(map5sheeto1,1)
obstacleim[coordonneedu].x=-1612
obstacleim[coordonneedu].y=0
obstacleim[coordonneedu].group=2048
obstacleim[coordonneedu+1]=display.newImage(map5sheeto2,1)
obstacleim[coordonneedu+1].x=903
obstacleim[coordonneedu+1].y=-587.5
obstacleim[coordonneedu+2]=display.newImage(map5sheeto3,1)
obstacleim[coordonneedu+2].x=1881.5
obstacleim[coordonneedu+2].y=35.5
obstacleim[coordonneedu+3]=display.newImage(map5sheeto4,1)
obstacleim[coordonneedu+3].x=1565
obstacleim[coordonneedu+3].y=507.5
obstacleim[coordonneedu+4]=display.newImage(map5sheeto5,1)
obstacleim[coordonneedu+4].x=-287
obstacleim[coordonneedu+4].y=965.5
obstacleim[coordonneedu+5]=display.newImage(map5sheeto6,1)
obstacleim[coordonneedu+5].x=861
obstacleim[coordonneedu+5].y=918

--#obstacleanim=0

--decoranim=nil
if decoranim==nil then
	decoranim={}
end
coordonneedu=#decoranim+1
decoranim[coordonneedu]=display.newSprite(lapinanim,lapinanimseq)
decoranim[coordonneedu]:setSequence( "liq" )
decoranim[coordonneedu]:play()
decoranim[coordonneedu].x=0
decoranim[coordonneedu].y=0
decoranim[coordonneedu].xScale=0.3
decoranim[coordonneedu].yScale=decoranim[coordonneedu].xScale
decoranim[coordonneedu].posi=1 --0 pour coordonnée donnée donc decoranim[1].x1=XX et decoranim[1].x2=XX ,1 pour random sur les zones contructible, 2 pour sur le chemin
decoranim[coordonneedu].cadence=4000 --tout les combien de temps se produit l'anim
--decoranim[1].legroup= <0 pour group y-.legroup et >0 pour que ca soit group=.legroup 


decoration={} -- ligne a mettre pour la création avec assistance
decoration[1]={}
decoration[1].x=-143
decoration[1].y=-46
decoration[1].type=22
decoration[1].planche=1
decoration[1].scale=0.3
decoration[2]={}
decoration[2].x=214
decoration[2].y=48
decoration[2].type=25
decoration[2].planche=1
decoration[2].scale=0.35
decoration[3]={}
decoration[3].x=-290
decoration[3].y=131
decoration[3].type=24
decoration[3].planche=1
decoration[3].scale=0.2
------------------------------------------------------------fin hugo---------------------------------------------------------------
end
t.vague=function()--donnees sur les vagues du niveau
vague={}
--nbvague=3--15
for k=1,leveldata[5].wave,1 do
	vague[k]={}
	vague[k][1]=200
end
vague[1]={5,203,203,203,203,203,0,0,5,203,203,203,203,203,203,0,0,3,207,208,208,5,270,270,270,203,203,203,0,0,0,0,5,203,203,203,203,203,0,0,5,203,203,203,208,207,0,0,0,3,203,203,203,5,203,203,207,208,207,5,207,208,207,208,203,5,203,270,270,203,203,5,203,203,203,203,203}
vague[2]={-1,203,1,2,207,208,2,207,208,2,207,207,2,208,207,2,208,207,0,0,0,0,5,203,203,203,203,203,203,203,203,203,1,270,270,-1,207,0,-1,270,5,270,270,270,207,270,5,203,203,203,203,203,1,5,270,270,270,270,270,5,270,270,270,270,270,5,270,270,270,270,270}
vague[3]={270,5,270,270,270,270,270,5,270,270,270,270,270,5,270,270,270,270,270,5,270,270,270,270,270,270,5,203,203,203,203,203,5,203,203,203,203,203,5,203,203,203,203,203,5,207,208,207,208,207,5,207,208,270,208,207,5,207,208,207,208,208,207}
vague[4]={270,5,207,208,207,208,207,5,207,208,207,208,207,5,207,208,207,208,207,5,207,208,208,207,207,5,207,208,207,208,207,5,203,203,203,203,203,5,203,203,203,203,203,5,203,203,203,203,203,1,5,203,203,203,203,203,5,203,203,203,203,203,5,203,203,203,203,203,0,0,0,0,5,270,270,270,270,270,5,270,270,270,270,270,5,270,270,270,270,270,5,270,270,270,270,270,5,270,270,270,270,270}
vague[5]={3,215,215,215,215,270,0,0,0,0,5,270,270,270,270,270,5,270,270,270,270,270,3,215,215,215,215,3,208,208,208,3,208,208,208,0,0,0,0,5,203,203,203,203,203,203,1,5,203,203,203,203,203,203,1,5,203,203,203,203,203,203,5,203,203,203,203,203,203,5,203,203,203,203,203,203,5,203,203,203,203,203,203,-1,3,215,215,215,270,270,5,270,270,270,270,270,5,270,270,270,270,270,5,270,270,270,270,270,5,270,270,270,270,270}

-------------------------------------------------------------debut hugo-----------------------------------------------------
--0 retarde de la durer de spawn de 3 soldat et 1 de la durer de 1 soldat
--de 2 à 5 permet de spawner plusieurs soldat a la fois.
--vague[1].nb=2--nb soldat dans la vague

modeinfdif=0-- 0 pour facile, 1 pour normal, 2 pour difficile

end
t.vaguewave=function()
	vague={}
	vague[1]={9,235,235,235,235,235,235,235,235,235,235,9,235,235,235,235,235,235,235,235,235,235,9,235,235,235,235,235,235,235,235,235,235,9,235,235,235,235,235,235,235,235,235,235,9,235,235,235,235,235,235,235,235,235,235,0,9,244,244,244,244,244,244,244,244,244,9,244,244,244,244,244,244,244,244,244,0,9,244,244,244,244,244,244,244,244,244,9,244,244,244,244,244,244,244,244,244,0,0,9,244,244,244,244,244,244,244,244,244,9,244,244,244,244,244,244,244,244,244,9,244,244,244,244,244,244,244,244,244,0,9,244,244,244,244,244,244,244,244,244,9,244,244,244,244,244,244,244,244,244,0,0,9,244,244,244,244,244,244,244,244,244,9,244,244,244,244,244,244,244,244,244,9,244,244,244,244,244,244,244,244,244,0,9,244,244,244,244,244,244,244,244,244,9,244,244,244,244,244,244,244,244,244,0,0,9,244,244,244,244,244,244,244,244,244,-1,9,244,244,244,244,244,244,244,244,244,-1,9,244,244,244,244,244,244,244,244,244,-1,9,244,244,244,244,244,244,244,244,244,-1,9,244,244,244,244,244,244,244,244,244,-1,9,244,244,244,244,244,244,244,244,244,-1,9,244,244,244,244,244,244,244,244,244,-1,9,244,244,244,244,244,244,244,244,244,-1,9,244,244,244,244,244,244,244,244,244,-1,9,244,244,244,244,244,244,244,244,244,-1,9,244,244,244,244,244,244,244,244,244,-1,9,244,244,244,244,244,244,244,244,244,-1,9,244,244,244,244,244,244,244,244,244,-1,9,244,244,244,244,244,244,244,244,244,-1,9,244,244,244,244,244,244,244,244,244,-1,9,244,244,244,244,244,244,244,244,244,-1,9,244,244,244,244,244,244,244,244,244,-1,9,244,244,244,244,244,244,244,244,244,-1,9,244,244,244,244,244,244,244,244,244,-13,-1,9,244,244,244,244,244,244,244,244,244,-1,9,244,244,244,244,244,244,244,244,244,-1,9,244,244,244,244,244,244,244,244,244,-1,9,244,244,244,244,244,244,244,244,244,-1,9,244,244,244,244,244,244,244,244,244,-11,-1,9,244,244,244,244,244,244,244,244,244,-1,9,244,244,244,244,244,244,244,244,244,-1,9,244,244,244,244,244,244,244,244,244,-11,-1,9,244,244,244,244,244,244,244,244,244,-1,9,244,244,244,244,244,244,244,244,244,-1,9,244,244,244,244,244,244,244,244,244,-15,-1,9,244,244,244,244,244,244,244,244,244,-1,9,244,244,244,244,244,244,244,244,244,-1,9,244,244,244,244,244,244,244,244,244,-1,9,244,244,244,244,244,244,244,244,244,-1,9,244,244,244,244,244,244,244,244,244,-1,9,244,244,244,244,244,244,244,244,244,-1,9,244,244,244,244,244,244,244,244,244}
end
return t