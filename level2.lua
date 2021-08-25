local t={}
t.new=function()--gestion du niveau 2 du jeu, doit toujours suivre le meme modele
	
	--map1= display.newImage( "carte/level2/carte1a.png", 0,0,true )--devrai etre en local pour niveau1
	-- map1p = display.newCircle(0,0,10)      --nil--display.newImage( "carte/level2/carte1p.png", 0,0,true )
	-- map1p.isVisible=false
	pouvoirdisp=0
	t=1
end
t.affichagecarte=function(pole)
	if donneecharger[2]==0 then
		donneecharger[2]=1
		map2sheethg=graphics.newImageSheet( "carte/level2/hg.jpg", { width=2048, height=1024, numFrames=1,sheetContentWidth=2048,sheetContentHeight=1024 } )
		map2sheethd=graphics.newImageSheet( "carte/level2/hd.jpg", { width=2048, height=1024, numFrames=1,sheetContentWidth=2048,sheetContentHeight=1024 } )
		map2sheetbg=graphics.newImageSheet( "carte/level2/bg.jpg", { width=2048, height=1024, numFrames=1,sheetContentWidth=2048,sheetContentHeight=1024 } )
		map2sheetbd=graphics.newImageSheet( "carte/level2/bd.jpg", { width=2048, height=1024, numFrames=1,sheetContentWidth=2048,sheetContentHeight=1024 } )
		map2sheetobd1=graphics.newImageSheet( "carte/level2/map1p1.png", { width=1400, height=910, numFrames=1,sheetContentWidth=1400,sheetContentHeight=910 } )
		map2sheetobd2=graphics.newImageSheet( "carte/level2/map1p2.png", { width=1409, height=401, numFrames=1,sheetContentWidth=1409,sheetContentHeight=401 } )
		map2sheetomid=graphics.newImageSheet( "carte/level2/obstacle1.png", { width=337, height=298, numFrames=1,sheetContentWidth=337,sheetContentHeight=298 } )
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
		
	hg=display.newImage(map2sheethg,1) --display.newImage( "carte/level2/hg.png", -1024,-512,true )
	hg.x=-1024
	hg.y=-512
	hd=display.newImage(map2sheethd,1) --display.newImage( "carte/level2/hd.png",1024,-512,true )
	hd.x=1024
	hd.y=-512
	bg=display.newImage(map2sheetbg,1) --display.newImage( "carte/level2/bg.png", -1024,512,true )
	bg.x=-1024
	bg.y=512
	bd=display.newImage(map2sheetbd,1) --display.newImage( "carte/level2/bd.png", 1024,512,true )
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
intersection[1]={pt=4, ty=2, un=6, deux=20, proba=2}
--intersection[2]={pt=1, ty=2, un=10, deux=20, proba=2}
--exemple
-- intersection[1]={pt=10, ty=1, un=12, deux=33,proba=1}--probabilité fait un si 0 sinon fait 2, proba dit qu'on genere une variable alea de 0 à proba donc quand proba vaut 1 on a un chance sur deux d'aller sur chaque chemin
-- intersection[2]={pt=30, ty=0, un=51,proba=1}
cheminnb=29-- --nombre de point definisant le chemin -1--------------------------------------------------------------------------------------------------
chemin={}
chemin[1]=point.new(-613,-143)
chemin[2]=point.new(-526,-150)
chemin[3]=point.new(-439,-155)
chemin[4]=point.new(-351,-143)
chemin[5]=point.new(-263,-129)
chemin[6]=point.new(-194,-120)
chemin[7]=point.new(-147,-13)
chemin[8]=point.new(-99,53)
chemin[9]=point.new(-35,110)
chemin[10]=point.new(40,133)
chemin[11]=point.new(105,139)
chemin[12]=point.new(151,138)
chemin[13]=point.new(151,138)
chemin[14]=point.new(61,133)
chemin[15]=point.new(9,126)
chemin[16]=point.new(-76,86)
chemin[17]=point.new(-128,19)
chemin[18]=point.new(-171,-46)
chemin[19]=point.new(-167,-92)
chemin[20]=point.new(-92,-124)
chemin[21]=point.new(-11,-130)
chemin[22]=point.new(72,-132)
chemin[23]=point.new(150,-132)
chemin[24]=point.new(233,-127)
chemin[25]=point.new(311,-101)
chemin[26]=point.new(376,-46)
chemin[27]=point.new(434,14)
chemin[28]=point.new(485,79)
chemin[29]=point.new(550,167)
chemin[30]=point.new(610,216)

obstacle0nb=0

obstaclenb=101--nombre de point definissant les petits obstacles
obstacle={}
obstacle[1]=point.new(-609,89)
obstacle[2]=point.new(-520,99)
obstacle[3]=point.new(-430,125)
obstacle[4]=point.new(-346,183)
obstacle[5]=point.new(-263,243)
obstacle[6]=point.new(-160,277)
obstacle[7]=point.new(-74,303)
obstacle[8]=point.new(-216,256)
obstacle[9]=point.new(-305,214)
obstacle[10]=point.new(-466,79)
obstacle[11]=point.new(-375,125)
obstacle[12]=point.new(-559,79)
obstacle[13]=point.new(-315,154)
obstacle[14]=point.new(-263,212)
obstacle[15]=point.new(294,290)
obstacle[16]=point.new(290,261)
obstacle[17]=point.new(343,240)
obstacle[18]=point.new(403,232)
obstacle[19]=point.new(457,268)
obstacle[20]=point.new(384,292)
obstacle[21]=point.new(444,224)
obstacle[22]=point.new(-595,-239)
obstacle[23]=point.new(-505,-238)
obstacle[24]=point.new(-404,-235)
obstacle[25]=point.new(-308,-235)
obstacle[26]=point.new(-214,-235)
obstacle[27]=point.new(-165,-244)
obstacle[28]=point.new(-554,-308)
obstacle[29]=point.new(-460,-288)
obstacle[30]=point.new(-362,-280)
obstacle[31]=point.new(-269,-280)
obstacle[32]=point.new(-193,-280)
obstacle[33]=point.new(-552,-220)
obstacle[34]=point.new(-460,-218)
obstacle[35]=point.new(-360,-226)
obstacle[36]=point.new(-261,-218)
obstacle[37]=point.new(-552,-202)
obstacle[38]=point.new(-307,-216)
obstacle[39]=point.new(-6,-308)
obstacle[40]=point.new(47,-300)
obstacle[41]=point.new(119,-290)
obstacle[42]=point.new(208,-290)
obstacle[43]=point.new(304,-290)
obstacle[44]=point.new(389,-280)
obstacle[45]=point.new(467,-251)
obstacle[46]=point.new(519,-207)
obstacle[47]=point.new(605,-169)
obstacle[48]=point.new(612,-96)
obstacle[49]=point.new(581,-161)
obstacle[50]=point.new(607,-304)
obstacle[51]=point.new(607,-243)
obstacle[52]=point.new(533,-293)
obstacle[53]=point.new(80,-290)
obstacle[54]=point.new(259,-290)
obstacle[55]=point.new(164,-290)
obstacle[56]=point.new(346,-290)
obstacle[57]=point.new(426,-267)
obstacle[58]=point.new(496,-228)
obstacle[59]=point.new(546,-176)
obstacle[60]=point.new(587,-137)
obstacle[61]=point.new(-609,-174)
obstacle[62]=point.new(-536,-179)
obstacle[63]=point.new(-479,-179)
obstacle[64]=point.new(-403,-179)
obstacle[65]=point.new(-320,-173)
obstacle[66]=point.new(-614,-145)
obstacle[67]=point.new(-440,-156)
obstacle[68]=point.new(-396,-148)
obstacle[69]=point.new(-352,-145)
obstacle[70]=point.new(-308,-140)
obstacle[71]=point.new(-265,-132)
obstacle[72]=point.new(-202,-116)
obstacle[73]=point.new(-184,-62)
obstacle[74]=point.new(-146,-13)
obstacle[75]=point.new(-104,48)
obstacle[76]=point.new(-59,92)
obstacle[77]=point.new(9,126)
obstacle[78]=point.new(59,133)
obstacle[79]=point.new(106,138)
obstacle[80]=point.new(150,136)
obstacle[81]=point.new(-141,-121)
obstacle[82]=point.new(-89,-129)
obstacle[83]=point.new(-46,-130)
obstacle[84]=point.new(6,-133)
obstacle[85]=point.new(59,-133)
obstacle[86]=point.new(112,-137)
obstacle[87]=point.new(164,-133)
obstacle[88]=point.new(216,-130)
obstacle[89]=point.new(265,-117)
obstacle[90]=point.new(314,-98)
obstacle[91]=point.new(356,-64)
obstacle[92]=point.new(395,-28)
obstacle[93]=point.new(433,11)
obstacle[94]=point.new(467,53)
obstacle[95]=point.new(497,95)
obstacle[96]=point.new(528,141)
obstacle[97]=point.new(568,180)
obstacle[98]=point.new(-232,-178)
obstacle[99]=point.new(-94,-254)
obstacle[100]=point.new(-102,-293)
obstacle[101]=point.new(-56,-275)

obstacle1nb=4--nombre de point definisant le nombre de point du gros obstacle
obstacle1={}--gros cercle
obstacle1[1]=point.new(-608,299)
obstacle1[2]=point.new(-440,299)
obstacle1[3]=point.new(-528,251)
obstacle1[4]=point.new(-351,300)

--mine:
mineinfo={}
mineinfo.nb=1
mineinfo[1]=point.new(218,125)
mineinfo[1].nbmine=1
--mineinfo[1].nbmine1=2 --numero de la deuxieme intersection relié a la mine
------------------------------------------------------------fin hugo---------------------------------------------------------------
obstaclsold={}
obstaclsold.nb=0 --nombre d'obstacle ou les soldats ne peuvent pas aller.

-- feupassesoldat={}
-- feupassesoldat[1]={}
-- feupassesoldat[1].etat=0 -- etat de flamme
-- feupassesoldat[1].x=-400
-- feupassesoldat[1].y=-270
-- feupassesoldat[1].xScale=0.47
-- feupassesoldat[1].yScale=0.2

-- feupassesoldat[2]={}
-- feupassesoldat[2].etat=0 -- etat de flamme
-- feupassesoldat[2].x=-375
-- feupassesoldat[2].y=-250
-- feupassesoldat[2].xScale=0.68
-- feupassesoldat[2].yScale=0.25

-- feupassesoldat[3]={}
-- feupassesoldat[3].etat=0 -- etat de flamme
-- feupassesoldat[3].x=-210
-- feupassesoldat[3].y=-255
-- feupassesoldat[3].xScale=0.75
-- feupassesoldat[3].yScale=0.4

-- feupassesoldat[4]={}
-- feupassesoldat[4].etat=0 -- etat de flamme
-- feupassesoldat[4].x=-200
-- feupassesoldat[4].y=-205
-- feupassesoldat[4].xScale=0.75
-- feupassesoldat[4].yScale=0.45

end
t.obsim=function()
if obstacleim==nil then
	obstacleim={}
end
--#obstacleim=3
--exemple
local coordonneedu=#obstacleim+1
obstacleim[coordonneedu]=display.newImage( map2sheetomid,1)
obstacleim[coordonneedu].x=685.5
obstacleim[coordonneedu].y=92
obstacleim[coordonneedu+1]=display.newImage( map2sheetobd1,1)
obstacleim[coordonneedu+1].x=-1348
obstacleim[coordonneedu+1].y=398
obstacleim[coordonneedu+2]=display.newImage( map2sheetobd2,1)
obstacleim[coordonneedu+2].x=56.5
obstacleim[coordonneedu+2].y=823.5


-- #obstacleanim=0

-- decoranim={}
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

decoration={} -- ligne a mettre pour la création avec assistance
decoration[1]={}
decoration[1].x=-438
decoration[1].y=-49
decoration[1].type=19
decoration[1].planche=1
decoration[1].scale=0.15
decoration[2]={}
decoration[2].x=27
decoration[2].y=27
decoration[2].type=20
decoration[2].planche=1
decoration[2].scale=0.2
decoration[3]={}
decoration[3].x=-39
decoration[3].y=-236
decoration[3].type=5
decoration[3].planche=1
decoration[3].scale=0.2

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
vague[1]={210,211,0,0,0,210,211,0,0,210,210,0,210,0,0,211,211,0,0,0,3,210,211,210}
vague[2]={210,211,210,210,0,0,0,0,0,206,202,0,209,0,0,0,213,212,0,0,0,0,0,214,214,0,214,0,0,0,211,0,0,210,211}
vague[3]={5,200,200,200,200,200,0,0,0,0,5,200,200,200,200,200,0,200,200,0,0,210,211,211,210,211,201,205}
vague[4]={3,267,267,267,0,0,0,0,5,200,200,200,200,200,0,0,0,5,201,205,201,205,201,0,0,0,0,0,0,0,0,0,5,213,213,213,213,213,0,210,211,211,210,211,201,0,0,5,201,205,201,205,201}

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