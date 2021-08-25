local t={}
t.new=function()--gestion du niveau 1 du jeu, doit toujours suivre le meme modele
	-- map1=display.newImage(map1sheet,1) -- display.newImage( "carte/level1/carte1a.png", 0,0,true )--devrai etre en local pour niveau1
	-- map1.x=0
	-- map1.y=0
	--map1p=display.newCircle(0,0,10) --display.newImage(map1psheet,1) -- display.newImage( "carte/level1/carte1p.png", 0,0,true )
	--map1p.x=0
	--map1p.y=0
	--map1.xScale=2
	--map1.yScale=2
	pouvoirdisp=0
	--argent=300
	--ennemipasse=10--nombre d'ennemi qui peuvent encore passer avant qu'on perdre---------------------------------------------------------------------------------------------------------------------

	t=1
end
t.affichagecarte=function(pole)
	if donneecharger[1]==0 then
		donneecharger[1]=1
		if issimulator then
			local memUsed = (collectgarbage("count")) / 1000
			local texUsed = system.getInfo( "textureMemoryUsed" ) / 1000000
			--print("\n---------MEMORY USAGE INFORMATION chargement1 avant---------")
			--print("System Memory Used:", string.format("%.03f", memUsed), "Mb")
			print("Texture Memory Used avant chargement level1: ", string.format("%.03f", texUsed), "Mb")
		end
		map1sheethg=graphics.newImageSheet( "carte/level1/hg.jpg", { width=2048, height=1024, numFrames=1,sheetContentWidth=2048,sheetContentHeight=1024 } )
		map1sheethd=graphics.newImageSheet( "carte/level1/hd.jpg", { width=2048, height=1024, numFrames=1,sheetContentWidth=2048,sheetContentHeight=1024 } )
		map1sheetbg=graphics.newImageSheet( "carte/level1/bg.jpg", { width=2048, height=1024, numFrames=1,sheetContentWidth=2048,sheetContentHeight=1024 } )
		map1sheetbd=graphics.newImageSheet( "carte/level1/bd.jpg", { width=2048, height=1024, numFrames=1,sheetContentWidth=2048,sheetContentHeight=1024 } )
		map1sheetobd=graphics.newImageSheet( "carte/level1/bd.png", { width=263, height=148, numFrames=1,sheetContentWidth=263,sheetContentHeight=148 } )
		map1sheetobg1=graphics.newImageSheet( "carte/level1/bg1.png", { width=1000, height=655, numFrames=1,sheetContentWidth=1000,sheetContentHeight=655 } )
		map1sheetobg2=graphics.newImageSheet( "carte/level1/bg2.png", { width=1116, height=665, numFrames=1,sheetContentWidth=1116,sheetContentHeight=665 } )
		map1sheetomid=graphics.newImageSheet( "carte/level1/mid.png", { width=1133, height=462, numFrames=1,sheetContentWidth=1133,sheetContentHeight=462 } )
		--map1sheet=graphics.newImageSheet( "carte/level1/carte1a.png", { width=2048, height=1024, numFrames=1 } )
		--map1psheet=graphics.newImageSheet("carte/level1/carte1p.png", { width=2048, height=1024, numFrames=1 } )
		--map1obstanim1=graphics.newImageSheet("carte/level1/animtest.png", { width=100, height=100, numFrames=3,sheetContentWidth=100,sheetContentHeight=300 } )
		if taupeanim==nil then
			taupeanim=graphics.newImageSheet("carte/level1/taupe1.png", { width=56, height=55, numFrames=5 } )
			taupeanimseq =
			{
			    name="liq",
			    frames={1,2,3,4,5,5,5,2,2,2,1,1,1,1}, -- frame indexes of animation, in image sheet
			    time =4000,           -- Optional. In ms.  If not supplied, then sprite is frame-based.
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
		if issimulator then
			local memUsed = (collectgarbage("count")) / 1000
			local texUsed = system.getInfo( "textureMemoryUsed" ) / 1000000
			--print("\n---------MEMORY USAGE INFORMATION chargement1 avant---------")
			--print("System Memory Used:", string.format("%.03f", memUsed), "Mb")
			print("Texture Memory Used apres chargement level1: ", string.format("%.03f", texUsed), "Mb")
		end
	end

	hg=display.newImage(map1sheethg,1) --display.newImage( "carte/level2/hg.png", -1024,-512,true )
	hg.x=-1024
	hg.y=-512
	hd=display.newImage(map1sheethd,1) --display.newImage( "carte/level2/hd.png",1024,-512,true )
	hd.x=1024
	hd.y=-512
	bg=display.newImage(map1sheetbg,1) --display.newImage( "carte/level2/bg.png", -1024,512,true )
	bg.x=-1024
	bg.y=512
	bd=display.newImage(map1sheetbd,1) --display.newImage( "carte/level2/bd.png", 1024,512,true )
	bd.x=1024
	bd.y=512
	-- obd=display.newImage(map1sheetobd,1) --display.newImage( "carte/level2/bd.png", 1024,512,true )
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
	local tunededep=200 --0
	if issimulator then
		--tunededep=2000
	end
	local nbperso=leveldata[1].life
	if modeinfini or modesquelette then
		tunededep=tunedep
		nbperso=10
	end
	argentdep=-(tunededep)*3--hugo modifier uniquement le nombre le reste permet de crypter la donné-------------------------------------------------------------------
	ennemipassedep=nbperso--nombre d'ennemi qui peuvent encore passer avant qu'on perdre---hugo------------------------------------------------------------------------------------------------------------------
end

t.chemi=function()--donnees sur les differents points de la carte
local point= require( "point" )
cheminlargeur=1 --2 -- largeur de la zone non construcible autour du chemin
genepointinit=25
-- distancedetection=1 -- distance de detection si <1 les soldats se detecteront de moins loin
intersection={}
intersection.nb=0--2
--exemple
--intersection[1]={pt=11, ty=1, un=1, deux=13}
--intersection[2]={pt=25, ty=0, un=27}
--intersection[1]={pt=18, ty=2, un=29, deux=20,proba=2}
--intersection[2]={pt=20, ty=2, un=30, deux=22,proba=2}
--chemin[10].rayon=1000 --taille de la zone ou peut se trouver les gentils
--chemin[10].mechant=0.2 --recerement du chemin ils vont plus etre aussi ecarté
--intersection[2]={pt=46, ty=0, un=21}
cheminarr=nil
-- cheminarr={} --si des chemins sont des arrivés
-- cheminarr[1]=25 --fin numero 2 du chemin
-- cheminarr[2]=12 --fin numero 3 du chemin

-- pointdeppro={}
-- pointdeppro[1]=0.25 -- probabilité pour le levelinf de l'entré numero i (pointdep[i+1]) , pour une meme probabilité que sur les autres entré mettre 0.5. Min 0, max 1, avec deux chiffres apres la virgule max

cheminnb=29-- --nombre de point definisant le chemin -1--------------------------------------------------------------------------------------------------
chemin={}
--chemin[10].rayon=1000 --taille de la zone ou peut se trouver les gentils
--chemin[10].mechant=0.2 --recerement du chemin ils vont plus etre aussi ecarté

chemin[1]=point.new(-611,-38)
chemin[2]=point.new(-567,-36)
chemin[3]=point.new(-523,-36)
chemin[4]=point.new(-481,-34)
chemin[5]=point.new(-439,-33)
chemin[6]=point.new(-395,-38)
chemin[7]=point.new(-352,-38)
chemin[8]=point.new(-310,-34)
chemin[9]=point.new(-268,-28)
chemin[10]=point.new(-225,-21)
chemin[11]=point.new(-182,-21)
chemin[12]=point.new(-139,-21)
chemin[13]=point.new(-95,-18)
chemin[14]=point.new(-51,-21)
chemin[15]=point.new(-8,-20)
chemin[16]=point.new(36,-21)
chemin[17]=point.new(80,-15)
chemin[18]=point.new(123,-7)
chemin[19]=point.new(166,0)
chemin[20]=point.new(209,-12)
chemin[21]=point.new(253,-7)
chemin[22]=point.new(294,1)
chemin[23]=point.new(337,1)
chemin[24]=point.new(379,1)
chemin[25]=point.new(421,-4)
chemin[26]=point.new(462,5)
chemin[27]=point.new(499,-12)
chemin[28]=point.new(543,-8)
chemin[29]=point.new(587,-8)
chemin[30]=point.new(612,-5)
-- for i=10,20,2 do -- mode zombie cheloux  et sans le 2 ca fait un truc normal
-- 	chemin[i].mechant=10
-- end

obstacle0nb=1
obstacle0={} --obstacle de 
obstacle0[1]=point.new(-609,-198) 
obstacle0[1].rayon=1000

obstaclenb=69--nombre de point definissant les petits obstacles
obstacle={}
obstacle[1]=point.new(-609,-198)
obstacle[2]=point.new(-539,-210)
obstacle[3]=point.new(-468,-212)
obstacle[4]=point.new(-385,-213)
obstacle[5]=point.new(-317,-230)
obstacle[6]=point.new(-270,-261)
obstacle[7]=point.new(-193,-282)
obstacle[8]=point.new(-117,-260)
obstacle[9]=point.new(-47,-254)
obstacle[10]=point.new(37,-252)
obstacle[11]=point.new(129,-244)
obstacle[12]=point.new(221,-239)
obstacle[13]=point.new(311,-225)
obstacle[14]=point.new(394,-213)
obstacle[15]=point.new(486,-197)
obstacle[16]=point.new(566,-181)
obstacle[17]=point.new(608,-126)
obstacle[18]=point.new(-606,116)
obstacle[19]=point.new(-556,147)
obstacle[20]=point.new(-505,164)
obstacle[21]=point.new(-447,170)
obstacle[22]=point.new(-391,175)
obstacle[23]=point.new(-312,180)
obstacle[24]=point.new(-247,201)
obstacle[25]=point.new(-182,219)
obstacle[26]=point.new(-112,260)
obstacle[27]=point.new(-60,282)
obstacle[28]=point.new(119,299)
obstacle[29]=point.new(109,235)
obstacle[30]=point.new(44,214)
obstacle[31]=point.new(-24,201)
obstacle[32]=point.new(10,173)
obstacle[33]=point.new(112,175)
obstacle[34]=point.new(129,138)
obstacle[35]=point.new(176,218)
obstacle[36]=point.new(237,186)
obstacle[37]=point.new(215,294)
obstacle[38]=point.new(34,287)
obstacle[39]=point.new(177,149)
obstacle[40]=point.new(309,289)
obstacle[41]=point.new(290,235)
obstacle[42]=point.new(384,214)
obstacle[43]=point.new(350,167)
obstacle[44]=point.new(355,140)
obstacle[45]=point.new(446,140)
obstacle[46]=point.new(532,140)
obstacle[47]=point.new(608,140)
obstacle[48]=point.new(-570,253)
obstacle[49]=point.new(177,-296)
obstacle[50]=point.new(346,-295)
obstacle[51]=point.new(290,-293)
obstacle[52]=point.new(408,-287)
obstacle[53]=point.new(-164,261)
obstacle[54]=point.new(-583,181)
obstacle[55]=point.new(400,152)
obstacle[56]=point.new(124,118)
obstacle[57]=point.new(400,136)
obstacle[58]=point.new(486,141)
obstacle[59]=point.new(-6,-256)
obstacle[60]=point.new(83,-251)
obstacle[61]=point.new(174,-244)
obstacle[62]=point.new(262,-233)
obstacle[63]=point.new(351,-216)
obstacle[64]=point.new(436,-215)
obstacle[65]=point.new(-233,-269)
obstacle[66]=point.new(-351,-218)
obstacle[67]=point.new(-429,-213)
obstacle[68]=point.new(-505,-208)
obstacle[69]=point.new(-572,-207)

obstacle1nb=8--nombre de point definisant le nombre de point du gros obstacle
obstacle1={}--gros cercle
obstacle1[1]=point.new(-613,302)
obstacle1[2]=point.new(-435,300)
obstacle1[3]=point.new(-310,299)
obstacle1[4]=point.new(607,300)
obstacle1[5]=point.new(449,295)
obstacle1[6]=point.new(-613,-308)
obstacle1[7]=point.new(-416,-308)
obstacle1[8]=point.new(535,-277)


-- if obstaclegene==nil then --------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 	obstaclegene={}
-- end
-- obstaclegene.nb=1 --nombre d'obstacle ou le general ne peux pas aller.
-- obstaclegene[1]=point.new(0,0) --coordonnée du point d'interdiction
-- obstaclegene[1].rayon=18888 -- rayon de la zone interdite (facultatif)
-- obstaclegene[1].point=1 --point de retour (facultatif)
-- obstaclegene[2]=point.new(169,-259)
-- obstaclegene[3]=point.new(254,121)
-- obstaclegene[3].rayon=15000

--mine:
mineinfo={}
mineinfo.nb=0

--obstaclsold.nb=0 --nombre d'obstacle ou les soldats ne peuvent pas aller.
-- obstaclsold[1]=point.new(-55,-10)
-- obstaclsold[1].point=10
-- obstaclsold[1].rayon=1000
-- obstaclsold[2]=point.new(0,-10)

feupassesoldat={} -- premiere dimension dit le point ou peut y avoir des flammes
feupassesoldat[1]={}
feupassesoldat[1].etat=0 -- etat de flamme
feupassesoldat[1].x=0
feupassesoldat[1].y=160
feupassesoldat[1].group=1024+250
feupassesoldat[1].rotate=17 -- faculatif
feupassesoldat[1].xScale=0.30
feupassesoldat[1].yScale=0.38
feupassesoldat[1].rotate=17 -- faculatif
feupassesoldat[1].seq="fl1"

feupassesoldat[2]={}
feupassesoldat[2].etat=0 -- etat de flamme
feupassesoldat[2].x=130
feupassesoldat[2].y=85
feupassesoldat[2].seq="fl" -- nom de l'anim de la flamme facultatif
feupassesoldat[2].group=200+1024 -- numero du groupe facultatif
feupassesoldat[2].xScale=0.45
feupassesoldat[2].yScale=0.2

feupassesoldat[3]={}
feupassesoldat[3].etat=0 -- etat de flamme
feupassesoldat[3].x=45
feupassesoldat[3].y=120
feupassesoldat[3].seq="braszero" -- nom de l'anim de la flamme facultatif
feupassesoldat[3].group=200+1024 -- numero du groupe facultatif
feupassesoldat[3].xScale=0.45
feupassesoldat[3].yScale=0.4

feupassesoldat[4]={}
feupassesoldat[4].etat=0 -- etat de flamme
feupassesoldat[4].x=240
feupassesoldat[4].y=165
feupassesoldat[4].xScale=0.6
feupassesoldat[4].yScale=0.4
feupassesoldat[4].group=1024+250
feupassesoldat[4].rotate=-5 -- faculatif

end
t.obsim=function()
if obstacleim==nil then
	obstacleim={}
end
--#obstacleim=4
--exemple
--obstacleim={}--tuto pour recuperer les données de coordonnée: 1) Dans paint.net afficher la carte entiere en png. 2) dans un autre fichier l'image de l'obstacle 3) copier tout l'image de l'obstacle (ctrl A), coller cette selection dans la carte la placé au bonne endroit. 4) sur la barre tout en bas on a "haut de selection..." il faut prendre le premier nombre puis additionner avec la moitié du premier nombre de taille de delimitation puis enlever 2048, on obtient l'abscisse. Pour le y faire de meme en prennat les deuxiemes valeurs et en enlevaant 1024
-- map1sheetobd
-- 	map1sheetobg1
-- 	map1sheetobg2
-- 	map1sheetomid
local coordonneedu=#obstacleim+1
obstacleim[coordonneedu]=display.newImage(map1sheetobd,1)
obstacleim[coordonneedu].x=1802
obstacleim[coordonneedu].y=296
--obstacleim[1].group=2024 --group ou se trouve l image par defaut se trouvera 2048+ y
obstacleim[coordonneedu+1]=display.newImage(map1sheetobg1,1)
obstacleim[coordonneedu+1].x=-1548
obstacleim[coordonneedu+1].y=418.5
obstacleim[coordonneedu+2]=display.newImage(map1sheetobg2,1)
obstacleim[coordonneedu+2].x=-490
obstacleim[coordonneedu+2].y=691.5
obstacleim[coordonneedu+3]=display.newImage(map1sheetomid,1)
obstacleim[coordonneedu+3].x=408
obstacleim[coordonneedu+3].y=459
--obstacleim[1]=display.newImage("AnimVF/mechant/veteran/Veteranmvmg.png",0,-300,true)
--obstacleim[1].xScale=0.2
--obstacleim[1].yScale=obstacleim[1].xScale

if obstacleanim==nil then
	obstacleanim={}
end
-- coordonneedu=#obstacleanim+1
-- -- #obstacleanim=1
-- -- obstacleanim={}
-- local sequenceData1 =
-- 	{
-- 	    name="liq",
-- 	    frames= {1,2,3}, -- frame indexes of animation, in image sheet
-- 	    time = 2000,           -- Optional. In ms.  If not supplied, then sprite is frame-based.
-- 	   -- loopCount =         -- Optional. Default is 0.
-- 	} 
-- obstacleanim[coordonneedu]=display.newSprite(map1obstanim1,sequenceData1)
-- obstacleanim[coordonneedu]:setSequence( "liq" )
-- obstacleanim[coordonneedu]:play()
-- obstacleanim[coordonneedu].xScale=0.2
-- obstacleanim[coordonneedu].yScale=obstacleanim[coordonneedu].xScale
-- obstacleanim[coordonneedu].y=100
-- obstacleanim[coordonneedu].x=0
-- obstacleanim[coordonneedu].group=mathfloor(obstacleanim[coordonneedu].y)+1024


if decoranim==nil then
	decoranim={}
end
coordonneedu=#decoranim+1
decoranim[coordonneedu]=display.newSprite(taupeanim,taupeanimseq)
decoranim[coordonneedu]:setSequence( "liq" )
decoranim[coordonneedu]:play()
decoranim[coordonneedu].x=0
decoranim[coordonneedu].y=0
decoranim[coordonneedu].xScale=0.3
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
decoration[1].x=382
decoration[1].y=-117
decoration[1].type=20
decoration[1].planche=1
decoration[1].scale=0.2
decoration[2]={}
decoration[2].x=-189
decoration[2].y=-171
decoration[2].type=11
decoration[2].planche=1
decoration[2].scale=0.2
-- decoration[3]={}
-- decoration[3].x=-72
-- decoration[3].y=70
-- decoration[3].type=6
-- decoration[3].planche=1
-- decoration[3].scale=0.2


-- decoration[2]={}
-- decoration[2].y=50
-- decoration[2].x=50

end
t.vague=function()--donnees sur les vagues du niveau
vague={}
vagueaboss1=nil -- numero de la vague a boss (actuellement compatible à 3 vagues avec boss)
vagueaboss2=nil
vagueaboss3=nil
if not modepanique and not modezombie then
	local k=nil
	--nbvague=5--15 --modifier la donnée dans le fichier devellopement, tres important sert pour la fiche de carte
	for k=1,leveldata[1].wave,1 do
		vague[k]={}
		vague[k][1]=200
	end
	-- de -10 à -inf c'est le nombre de group (-lenumero-8) de spawn spawner en meme temps donc si on met -10 on spawn 2 group donc si apres il y a -2 ca va spawner sur l'entré 3 puis un 4 ca va spawner 4 soldat dit just apres ensuite on peut avoir un 4 ca va spawner 4 soldat sur l'entré une ensuite on met l'identifiant des 4soldats

	--vague[1]={nb=5,200,0,0,0,200}

	 -- Require the 'loadsave' module
	vague[1]={210,211,210,0,0,3,210,210,211,0,0,5,210,211,210,210,210,0,211}
	vague[3]={2,213,213,0,0,0,0,5,211,210,210,211,210,0,0,0,5,210,210,210,210,211,0,0,0,5,210,213,211,210,211,0,0,0,0,0,0,0,0,0,0,0,0,0,0,226,226,226,270,270,270,270,0,0,0,0,0,0,0,0,0,3,210,211,211,3,213,213,213}
	vague[2]={213,0,0,0,3,210,211,211,0,0,0,3,211,211,211,0,0,0,3,211,211,211,0,0,0,213,213}
	if generaltest~=0 then
		if generaltest==179 then
			vague[1]={5,270,270,270,270,270,9,200,200,200,200,200,200,200,200,200,9,205,205,205,205,205,205,205,205,205,0,0,5,218,218,218,218,218,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
		elseif generaltest==178 then
			vague[1]={5,270,270,270,270,270,9,200,200,200,200,200,200,200,200,200,7,205,205,205,205,205,205,205,0,0,218,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
		elseif generaltest==177 then
			vague[1]={5,270,270,270,270,270,0,0,0,9,200,200,200,200,200,200,200,200,200,0,0,0,3,205,205,205,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
		elseif generaltest==172 then
			vague[1]={218,0,0,218,218,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,5,270,270,270,270,270,9,200,200,200,200,200,200,200,200,200,0,0,0,0,0,9,205,205,205,205,205,205,205,205,205,0,0,0,0,0,0,5,218,218,218,218,218,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
		elseif generaltest==171 then
			vague[1]={270,270,270,270,270,0,0,0,200,200,200,200,200,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
		elseif generaltest==174 then
			vague[1]={203,1,1,203,1,1,203,1,1,203,1,1,203,1,1,203,1,1,203,1,1,203,1,1,203,1,1,203,1,1,203,1,1,203,1,1,203,1,1,203,1,1,203,203,1,203,1,203,203,1,203,1,203,203,1,203,1,203,1,203,1,203,1,203,1,203,1,203,1,203,1,203,1,200,1,200,1,200,1,200,200,1,200,200,1,200,200,1,205,205,205,205,205,205,205,0,0,218,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
		elseif generaltest==175 then
			vague[1]={210,210,210,0,0,0,0,0,200,200,200,200,200,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
		end
		vague[2]={5,263,263,263,263,263,5,263,263,263,263,263,5,263,263,263,263,263,5,263,263,263,263,263,5,263,263,263,263,263,5,263,263,263,263,263,5,263,263,263,263,263,5,263,263,263,263,263,5,263,263,263,263,263,5,263,263,263,263,263,5,263,263,263,263,263}
		vague[3]={5,262,262,262,262,262,5,262,262,262,262,262,5,262,262,262,262,262,5,262,262,262,262,262,5,262,262,262,262,262,5,262,262,262,262,262,5,262,262,262,262,262,5,262,262,262,262,262,5,262,262,262,262,262,5,262,262,262,262,262,5,262,262,262,262,262}
	end
else
	-- -- vague[1]={-10,3,210,210,210,-1,3,210,210,210,0,0,0,0,-10,5,210,210,210,210,210,-1,5,210,210,210,210,210,0,0,0,0,0,-10,5,210,210,210,210,210,-1,5,210,210,210,210,210,0,-10,5,210,210,210,210,210,-1,5,210,210,210,210,210,0,-10,5,210,210,210,210,210,-1,5,210,210,210,210,210,-10,5,210,210,210,210,210,-1,5,210,210,210,210,210,-10,5,210,210,210,210,210,-1,5,210,210,210,210,210} --,nb=25,269,268,267,-10,260,-1,261,-1,262,0,0,0,0,-11,5,200,200,200,200,200,-1,2,201,201,-1,3,202,202,202} --{nb=20,2,210,210,0,0,0,0,5,210,210,210,210,210,0,202,3,201,201,201,0,0}
	-- for i=1,20 do --debut partie zombie 2
	-- 	vague[1][(i-1)*5+1]=5
	-- 	for j=1,5 do
	-- 		vague[1][(i-1)*5+j]=238
	-- 	end
	-- end
	-- local i=1
	-- local j=13
	-- local k=1
	-- while i<200 do
	-- 	k=k+1
	-- 	j=j+1
	-- 	if j==14 then
	-- 		j=1
	-- 		vague[1][i]=0
	-- 		i=i+1
	-- 		vague[1][i]=0
	-- 		i=i+1
	-- 		vague[1][i]=0
	-- 		i=i+1
	-- 		vague[1][i]=-10
	-- 		k=5
	-- 	elseif k==5 then
	-- 		vague[1][i]=5
	-- 		k=0
	-- 	else
	-- 		vague[1][i]=238
	-- 	end
	-- 	i=i+1
	-- end
	-- while i<210 do
	-- 	vague[1][i]=238
	-- 	i=i+1
	-- end
	-- vague[1][1]=238
	-- vague[1][2]=238 -- fin partie zoombie 2
	-- -- vague[1]={238,0,0,0,238}
	-- -- for i=1,200 do
	-- -- 	vague[1][i]=238
	-- -- end
	-- -- for i=1,180,12 do
	-- -- 	vague[1][i]=10
	-- -- end
	-- -- for i=2,

	-- local quantite=2
	-- local densite1=2 -- de 2 a +inf
	-- local densite2=2 -- de 2 a 9
	-- for k=1,30 do
	-- 	vague[k]={}
	-- 	vague[k][1]=200
	-- end
	-- for l=1,30 do
	-- 	local numerotest=0
	-- 	print("vague "..l.." densite "..densite1*densite2)
	-- 	for i=1,quantite do
	-- 		numerotest=numerotest+1
	-- 		vague[l][numerotest]=-8-densite1
	-- 		for j=1,densite1 do
	-- 			numerotest=numerotest+1
	-- 			vague[l][numerotest]=densite2
	-- 			for k=1,densite2 do
	-- 				numerotest=numerotest+1
	-- 				vague[l][numerotest]=238
	-- 			end
	-- 		end
	-- 	end
	-- 	local densitetotal=densite1*densite2
	-- 	densite2=densite2+mathfloor(densitetotal^0.3/densite1)
	-- 	--densite2=densite2+2
	-- 	if densite2>9 then
	-- 		densite1=densite1+1
	-- 		densite2=5
	-- 	end
	-- 	quantite=quantite+mathfloor(quantite^0.3)
	-- 	-- if modepanique then
	-- 	-- 	for i=1,#vague[1] do
	-- 	-- 		if vague[1][i]==238 then
	-- 	-- 			vague[1][i]=244
	-- 	-- 		end
	-- 	-- 	end
	-- 	-- end
	-- end
	-- if modepanique then
	-- 	for l=1,30 do
	-- 		for i=1,#vague[l] do
	-- 			if vague[l][i]==238 then
	-- 				vague[l][i]=244
	-- 			end
	-- 		end
	-- 	end
	-- end
	-- local function wavegenegroup(nbspawnzombie,zombiewave,numtab,densite)
	-- 	local zombiespawn=0
	-- 	while 
	-- 	return zombiewave,numtab
	-- end
	-- local densite=20
	-- local nbzombie=100
	-- for l=1,leveldata[1].wave do
	-- 	local zombiewave=0
	-- 	local numtab=1
	-- 	while zombiewave<nbzombie do
	-- 		local densiteatteinte=0
	-- 		while densiteatteinte<densite or zombiewave>=nbzombie do
	-- 			if true then --zombiewave>nbzombie-10 or densiteatteinte<densite-10 then
	-- 				if zombiewave>nbzombie-1 or densiteatteinte==densite-1 then
	-- 					vague[l][numtab]=238
	-- 					zombiewave=zombiewave+1
	-- 					numtab=numtab+1
	-- 					densiteatteinte=densiteatteinte+1
	-- 				else
	-- 					local nbzombierest=nbzombie-zombiewave
	-- 					if nbzombierest>densite-densiteatteinte then
	-- 						nbzombierest=densite-densiteatteinte
	-- 						print("nbzombierest "..nbzombierest)
	-- 					end
	-- 					vague[l][numtab]=nbzombierest
	-- 					numtab=numtab+1
	-- 					for i=1,nbzombierest do
	-- 						vague[l][numtab]=238
	-- 						numtab=numtab+1
	-- 						zombiewave=zombiewave+1
	-- 						densiteatteinte=densiteatteinte+1
	-- 					end
	-- 				end
	-- 			else
	-- 				-- local nbboucle=(densite-densiteatteinte)/10
	-- 				-- if nbboucle~=mathfloor(nbboucle) then
	-- 				-- 	nbboucle=mathfloor(nbboucle)-1
	-- 				-- end
	-- 				-- vague[l][numtab]=-8-nbboucle
	-- 			end
	-- 		end
	-- 	end
	-- end
	-- for i=2,leveldata[1].wave do --zombie derniere partie
	-- 	vague[i]=vague[1]
	-- end --fin
end
-- vague[1]={-10,3,210,210,210,-1,3,210,210,210,0,0,0,0,-10,5,210,210,210,210,210,-1,5,210,210,210,210,210}
-- vague[2]={-10,3,210,210,210,-1,3,210,210,210,0,0,0,0,-10,5,210,210,210,210,210,-1,5,210,210,210,210,210,0,0,0,0,0,-10,5,210,210,210,210,210,-1,5,210,210,210,210,210}
-- vague[2]={nb=7,0,0,0,3,211,210,210,0,0,5,211,211,211,211,211,0,5,210,210,210,210,210,5,210,211,210,211,210}
-- vague[3]={260,5,210,211,211,211,210,0,0,200,200,2,260,260,0,0,0,5,201,201,201,201,201,0,0,0,204,0,0}
-- vague[4]={0,0,2,260,260,0,5,210,210,211,211,211,0,5,210,210,211,211,211,0,210,210,211,211,211,0,2,201,201,0,0,204,0,0}
-- vague[5]={0,0,2,260,261,0,5,201,201,201,201,201,0,0,5,201,201,201,201,201,0,0,0,0,0,0,260,0,0,0,269}
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
	vague[1]={9,270,270,270,270,270,270,270,270,270,9,270,270,270,270,270,270,270,270,270,9,270,270,270,270,270,270,270,270,269,0,0,0,0,0,0,0,0,0,0,0,0,0,0,9,227,227,227,227,227,227,227,205,9,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,227,227,227,227,227,227}
end
return t