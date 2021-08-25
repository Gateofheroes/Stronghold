local t={}
t.new=function()--gestion du niveau 2 du jeu, doit toujours suivre le meme modele
	--pouvoirdisp=3
	t=1
	--pouvoirdisp=0
	--generalobligatoir=0-- niveau du gene autorisé 0 pour pas de gene, 1 pour de level1, 2 de deuxieme niveau...
end
t.affichagecarte=function(pole)
		
	if donneecharger[21]==0 then
		donneecharger[21]=1
		map21sheet=graphics.newImageSheet( "carte/levelmulti1/carte.jpg", { width=2048, height=2048, numFrames=1,sheetContentWidth=2048,sheetContentHeight=2048 } )
		map21sheetbg=graphics.newImageSheet( "carte/levelmulti1/bg.png", { width=1024, height=1024, numFrames=1,sheetContentWidth=1048,sheetContentHeight=1024 } )
		map21sheetobg1=graphics.newImageSheet("carte/levelmulti1/obj1.png", { width=589, height=521, numFrames=1,sheetContentWidth=589,sheetContentHeight=521 } )
	end

	cartemulti=display.newImage(map21sheet,1) --display.newImage( "carte/levelmulti1/carte.png",0,0,true )
	cartemulti.x=0
	cartemulti.y=0
	map1=display.newGroup()
	map1p=display.newImage(map21sheetbg,1) --display.newImage( "carte/levelmulti1/bg.png",-512*0.3,512*0.3,true )
	map1p.x=-512*0.3
	map1p.y=512*0.3
	map1:insert(cartemulti)
	--map1:insert(bg)
	--map1= display.newImage( "carte/level2/carte1a.png", 0,0,true )--devrai etre en local pour niveau1
	--map1p = display.newCircle(0,0,10)      --nil--display.newImage( "carte/level2/carte1p.png", 0,0,true )
	--map1p.isVisible=false
end
t.donneebase=function () --donnees de bases sur le niveau
	if multi==1 then
		argentdep=-(fricmulticreation)*3--hugo-------------------------------------------------------------------
	elseif multi==2 then
		argentdep=savegamemulti.save[mapmultisave][numsavegame].fricdebut --savemulti[2].fricdebut
	end
	ennemipassedep=1--10--nombre d'ennemi qui peuvent encore passer avant qu'on perdre---hugo------------------------------------------------------------------------------------------------------------------	
end
t.chemi=function()--donnees sur les differents points de la carte
local point= require( "point" )
----------------------------------------------------------------------------------------hugo debut -----------------------------------------------------------------------
intersection={}
intersection.nb=0
--exemple
--intersection[1]={pt=11, ty=2, un=42, deux=15}
cheminnb=34-- --nombre de point definisant le chemin -1--------------------------------------------------------------------------------------------------
chemin={}
chemin[1]=point.new(-55,-320)
chemin[2]=point.new(-55,-307)
chemin[3]=point.new(-44,-280)
chemin[4]=point.new(-19,-257)
chemin[5]=point.new(10,-243)
chemin[6]=point.new(40,-237)
chemin[7]=point.new(71,-222)
chemin[8]=point.new(112,-207)
chemin[9]=point.new(143,-189)
chemin[10]=point.new(169,-169)
chemin[11]=point.new(192,-132)
chemin[12]=point.new(200,-100)
chemin[13]=point.new(204,-67)
chemin[14]=point.new(199,-28)
chemin[15]=point.new(183,1)
chemin[16]=point.new(154,23)
chemin[17]=point.new(114,35)
chemin[18]=point.new(79,26)
chemin[19]=point.new(46,8)
chemin[20]=point.new(8,-13)
chemin[21]=point.new(-26,-21)
chemin[22]=point.new(-64,-21)
chemin[23]=point.new(-98,-2)
chemin[24]=point.new(-120,23)
chemin[25]=point.new(-134,46)
chemin[26]=point.new(-130,78)
chemin[27]=point.new(-131,112)
chemin[28]=point.new(-121,150)
chemin[29]=point.new(-98,191)
chemin[30]=point.new(-72,219)
chemin[31]=point.new(-43,241)
chemin[32]=point.new(-17,270)
chemin[33]=point.new(0,290)
chemin[34]=point.new(20,300)
chemin[35]=point.new(50,320)

obstacle0nb=0

--obstaclenb=0--
--obstacle1nb=0--
obstaclenb=70--nombre de point definissant les petits obstacles
obstacle={}
obstacle[1]=point.new(118,-308)
obstacle[2]=point.new(144,-299)
obstacle[3]=point.new(171,-293)
obstacle[4]=point.new(207,-276)
obstacle[5]=point.new(233,-262)
obstacle[6]=point.new(260,-240)
obstacle[7]=point.new(276,-221)
obstacle[8]=point.new(288,-191)
obstacle[9]=point.new(295,-161)
--obstacle[10]=point.new(303,-135)
obstacle[10]=point.new(98,-271)
obstacle[11]=point.new(37,-299)
obstacle[12]=point.new(302,-107)
obstacle[13]=point.new(258,-106)
obstacle[14]=point.new(258,-61)
obstacle[15]=point.new(302,-66)
obstacle[16]=point.new(302,-18)
obstacle[17]=point.new(258,-20)
obstacle[18]=point.new(300,24)
obstacle[19]=point.new(303,72)
obstacle[20]=point.new(303,107)
obstacle[21]=point.new(303,152)
obstacle[22]=point.new(302,207)
obstacle[23]=point.new(301,254)
obstacle[24]=point.new(302,310)
obstacle[25]=point.new(304,252)
obstacle[26]=point.new(261,330)
obstacle[27]=point.new(205,330)
obstacle[28]=point.new(154,330)
obstacle[29]=point.new(116,330)
obstacle[30]=point.new(73,330)
obstacle[31]=point.new(45,330)
obstacle[32]=point.new(-31,330)
obstacle[33]=point.new(-72,330)
obstacle[34]=point.new(-101,330)
obstacle[35]=point.new(-127,330)
obstacle[36]=point.new(-144,330)
obstacle[37]=point.new(-196,330)
obstacle[38]=point.new(-251,330)
obstacle[39]=point.new(-302,330)
obstacle[40]=point.new(133,185)
obstacle[41]=point.new(289,-308)
obstacle[42]=point.new(-107,-307)
obstacle[43]=point.new(-108,-287)
obstacle[44]=point.new(-160,-287)
obstacle[45]=point.new(-196,-275)
obstacle[46]=point.new(-217,-262)
obstacle[47]=point.new(-169,-226)
obstacle[48]=point.new(-174,-190)
obstacle[49]=point.new(-170,-138)
obstacle[50]=point.new(-190,-120)
obstacle[51]=point.new(-245,-109)
obstacle[52]=point.new(-289,-109)
obstacle[53]=point.new(-303,-60)
obstacle[54]=point.new(-302,-11)
obstacle[55]=point.new(-302,91)
obstacle[56]=point.new(-302,116)
obstacle[57]=point.new(-307,170)
obstacle[58]=point.new(-306,209)
obstacle[59]=point.new(-307,241)
obstacle[60]=point.new(-295,260)
obstacle[61]=point.new(-295,268)
obstacle[62]=point.new(-295,287)
obstacle[63]=point.new(-295,300)
obstacle[64]=point.new(-295,301)
obstacle[65]=point.new(-295,-156)
obstacle[66]=point.new(-302,-155)
obstacle[67]=point.new(-254,-203)
obstacle[68]=point.new(-304,-308)
obstacle[69]=point.new(-256,-308)
obstacle[70]=point.new(-207,-307)

obstacle1nb=2--nombre de point definisant le nombre de point du gros obstacle
obstacle1={}--gros cercle
obstacle1[1]=point.new(-500,-250)
obstacle1[2]=point.new(-590,-200)

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
local coordonneedu=#obstacleim+1
-- #obstacleim=1
--exemple
obstacleim[coordonneedu]=display.newImage(map21sheetobg1,1)
obstacleim[coordonneedu].x=550
obstacleim[coordonneedu].y=450
obstacleim[coordonneedu].xScale=1
obstacleim[coordonneedu].yScale=1
-- obstacleim[1]=display.newImage( "carte/level2/bdp.png", 550,140,true )
-- obstacleim[1].xScale=0.2
-- obstacleim[1].yScale=0.2

--#obstacleanim=0


------------------------------------------------------------fin hugo---------------------------------------------------------------
end
t.vague=function()--donnees sur les vagues du niveau
vague={}
local k=nil
nbvague=3--nombre de vague dans le niveau--hugo--
--on met -1 quand c'est le dernier soldat
for k=1,nbvague,1 do
	vague[k]={}
end
vague[1]={nb=29,210,0,0,260,1,210,1,5,210,210,210,210,210,200,200,0,0,5,210,210,210,210,210,5,210,210,210,210,210,261,263,262}
vague[2]={nb=50,203,5,203,203,203,203,203,5,203,202,205,206,201,0,0,5,203,203,203,203,203,5,203,203,203,203,203,5,203,203,203,203,203,5,203,203,203,203,203,0,0,5,260,261,262,263,264,3,265,266,267,204}
vague[3]={nb=48,204,1,5,204,204,204,204,204,204,0,0,5,210,210,210,210,210,5,210,210,210,210,210,5,210,210,210,210,210,5,210,210,210,210,210,0,0,5,203,203,203,203,203,5,203,203,203,203,203,5,203,203,203,203,203}


end
return t