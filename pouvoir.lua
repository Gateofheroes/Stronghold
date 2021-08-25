--fichier gerant les 3 pouvoirs
--mettre en place l'action des pouvoirs
--il faut resoudre les conflit de niveau 2(peut etre facile faire la meme methode que pour le 1 pour la position du pouvoir sur la carte), deuxieme type de conflit quand on clique en meme temps sur un bat ou gene et un pouvoir et construire(1,2,3) et le bat avec le general; dernier conflit a regler clique sur bat en meme temps que sur le general
local t = {}

local animdep1=require("animdep")--plus utile mais elur presence ne change rien
local pouvoirbis1=require("pouvoirbis")
local pause1=require("pause")
if not functionload then
function animationapparition(x,y,taille,sens,explo) -- taille de l'anim, sens nil pour apparition, false pour disparition
	if fpschoisi<1.3 then
		-- local destructeurpartiel=function(obj)
		-- 	group[obj.group]:remove(obj)
		-- 	obj:removeSelf()
		-- 	obj=nil
		-- end

		-- local poussiere1=display.newSprite(impro.explosion,impro.explosionseq)
		-- if sens~=nil then
		-- 	poussiere1.xScale=2*taille
		-- 	sens=nil
		-- 	sens=0.01
		-- else
		-- 	poussiere1.xScale=0.01
		-- 	sens=2*taille
		-- end
		-- poussiere1.yScale=poussiere1.xScale
		-- poussiere1:setSequence("explosion")
		-- poussiere1.alpha=1
		-- poussiere1.x=x
		-- poussiere1.y=y
		-- local latransition1=transition.to(poussiere1,{time=700*vitessejeuin,alpha=0,yScale=sens,xScale=sens,onComplete=destructeurpartieltran,onCancel=destructeurpartieltran,tag="elementtype"})
		-- poussiere1.group=mathfloor(2048)
		-- group[poussiere1.group]:insert(poussiere1)
		-- spritegestion(poussiere1,1)
		-- if jeupause.etat==1 then
		-- 	transition.pause(latransition1)
		-- end

			local anim
			if explo==nil then
				anim=display.newSprite(effetexplo.apparition,effetexplo.apparitionseq)
				print("anim apparition")
			else
				anim=display.newSprite(effetexplo.explosion,effetexplo.explosionseq)
				print("anim explo")
			end
			anim:setSequence("levelup")
			anim.x=x
			anim.y=y
			anim.xScale=0.3*taille
			anim.yScale=anim.xScale
			anim.group=mathfloor(anim.y+1024)
			group[anim.group]:insert(anim)
			spritegestion(anim)
	end
end
function vibrationBouton(bp1)
	transition.to(bp1,{time=100,rotation=30,transition=easing.continuousLoop})
	transition.to(bp1,{time=100,delay=100,rotation=-30,transition=easing.continuousLoop})
end
local function vibrationPouvoir(bp1,bp2)
	if bp1.init==true then
		vibrationBouton(bp1)
		vibrationBouton(bp2)
	else
		bp1.init=true
	end
end
function chargementttpouvoir(numtimerpouvoir)
	local function chargementpv( event,unefois)--gestion du chargment des trois pouvoirs
		if removetotal==false and removepartiel1==false then--normalement non necessaire a voir pourquoi on est obliger de le mettre
				if pouvoirdisp>0 then
					if pv1ch.pv1cpt<tchpv1 then
						pv1ch.height=pv1ch.height-100*pouvoir1.xScale/tchpv1--tchpv1 est le temps de chargement du pouvoir 1 en sec
						pv1ch.pv1cpt=pv1ch.pv1cpt+0.25
						if pv1ch.pv1cpt>=tchpv1 then
							print("pouvoir 1 charger")
							pv1cl.isVisible=true
							vibrationPouvoir(pv1cl,pouvoir1)
						end
					else
						pv1cl.isVisible=true
					end
					if pouvoirdisp>1 then
						if pv2ch.pv2cpt<tchpv2 then
							pv2ch.height=pv2ch.height-100*pouvoir1.xScale/tchpv2
							pv2ch.pv2cpt=pv2ch.pv2cpt+0.25
							if pv2ch.pv2cpt>=tchpv2 then
								print("pouvoir 1 charger")
								pv2cl.isVisible=true
								vibrationPouvoir(pv2cl,pouvoir2)
							end
						else
							pv2cl.isVisible=true
						end
						if pouvoirdisp>2 then
							if pv3ch.pv3cpt<tchpv3 then
								if pouvoir3activer==0 then
									pv3ch.height=pv3ch.height-100*pouvoir1.xScale/tchpv3
									pv3ch.pv3cpt=pv3ch.pv3cpt+0.25
								end
								if pv3ch.pv3cpt>=tchpv3 then
									print("pouvoir 1 charger")
									pv3cl.isVisible=true
									vibrationPouvoir(pv3cl,pouvoir3)
								end
							else
								pv3cl.isVisible=true
							end
						end
					end
				end
		
		else
			--timer:cancel(chagement)
		end
		if unefois==nil then
			chargement1=timer.performWithDelay( 250*vitessejeuin, chargementpv )
			local bla=timerpause(1,chargement1,numtimerpouvoir[1])
		end
	end
	chargement=timer.performWithDelay( 250*vitessejeuin, chargementpv )
	numtimerpouvoir[1]=timerpause(1,chargement,nil)
	function unchargementpouvoir()
		chargementpv(nil,true)
	end
end
end
t.pouvoir = function ()
--print("il se passe plein de truc")
local function priorite1( )--une partie de la gestion des priorité lorsqu'on clique sur plusieur bouton
	--print(numtapb,enconst)
	if(numtapb==0)then
		numtapb=0
		-- ici animation avec listener
		local creadisp=function(obj)
			construireinf.isVisible=false
			construirearch.isVisible=false
			construirearch.x=construirearch.x1
			construirearch.y=construirearch.y1
			construireinf.x=construireinf.x1
			construireinf.y=construireinf.y1
			construirearch.xScale=construirearch.scale
			construirearch.yScale=construirearch.scale
			construireinf.xScale=construireinf.scale
			construireinf.yScale=construireinf.scale
		end
		print("effacer pouvoir 69")
		transition.to(construireinf,{time=250,transition=easing.inCirc, y=construire.y,xScale=construireinf.scale*0.5,yScale=construireinf.scale*0.5, x=construire.x, onComplete=creadisp})
		transition.to(construirearch,{time=250,transition=easing.inCirc,xScale=construirearch.scale*0.5,yScale=construirearch.scale*0.5, y=construire.y, x=construire.x})
		--construireinf.isVisible=false
		--construirearch.isVisible=false
	end	
	if(enconst==1)then
		removenbat()
	end
end
pouvoir3activer=0


--paramettre des differents pouvoirs du jeu dependant de la race
----------------------------------------------------------------------hugo------------------------------------------------------
tchpv1=mathfloor(20*savegameall.bonuspouvoir[1].loadt)--temps de chargement du pouvoir 1-- il faut qu'il puisse y avoir 3 renfort aumaximum sur le terrain (max=2)
tchpv2=mathfloor(30*savegameall.bonuspouvoir[2].loadt)
tchpv3=mathfloor(250*savegameall.bonuspouvoir[3].loadt)



	
		
local bonuspv2=1
if savegameall.bonuspouvoir[2].bonus~=1 then
	bonuspv2=1.2
end
bonus12=5*savegameall.bonuspouvoir[3].bonus1--attaque--pour le pouvoir 3
bonus22=300*savegameall.bonuspouvoir[3].bonus2--rayon impact
bonus11=10*savegameall.bonuspouvoir[3].bonus1--attaque
bonus21=-10*savegameall.bonuspouvoir[3].bonus2--cadence
bonus31=1*savegameall.bonuspouvoir[3].bonus2--vitessse
bonus10=2*savegameall.bonuspouvoir[3].bonus1--attaque
bonus20=5*savegameall.bonuspouvoir[3].bonus2--porte
bonus13=3
bonus4=savegameall.bonuspouvoir[3].bonus3-- bonus agissant sur l'augmentation des bonus des soldats (agit en multiplication)
if race==2 then
	attaquepouvoir2=400*savegameall.bonuspouvoir[2].attaque*bonuspv2--attaque du pouvoir au total sur tout les soldats--pouvoir 2
	rayonatt=5000--rayon de l'attaque
	pouvoir1resteactduree=20000--temps que reste les renforts sur le terrain
elseif race==1 then
	attaquepouvoir2=20*savegameall.bonuspouvoir[2].attaque--attaque du pouvoir par fleche--abime qu'une personne par fleche
	nbfleche=40*savegameall.bonuspouvoir[2].bonus
	rayonatt=200*bonuspv2
	randompos=60--plus le nb est petit plus les fleches vont etre concentrer en un point
	pouvoir1resteactduree=20000--temps que reste les renforts sur le terrain
	randompos=math.log(randompos)--a ne pas toucher
else
	attaquepouvoir2=60*savegameall.bonuspouvoir[2].attaque--attaque par meteorite sur tout les personnes en dessous
	nbfleche=15*savegameall.bonuspouvoir[2].bonus--nombre de meteorite et non fleche
	rayonatt=350*bonuspv2
	randompos=120
	pouvoir1resteactduree=20000--temps que reste les renforts sur le terrain
	randompos=math.log(randompos)--a ne pas toucher
end
---------------------------------------------------------------hugo---------------------------------------------------------
--init de la partie affichage des pouvoir
pouvoir=display.newGroup()
grpartie:insert(pouvoir)
if pouvoirdisp>0 then
	pvaction=display.newImage(imbouton.menupause,11) --imbouton.pvaction,1)
	pvaction.isVisible=false

	pouvoir1=display.newImage(imbouton.pouvoir,1)--display.newImage( "bouton/pouvoir1.png", 0,actualcontentheight-200*0.1,true )--l'image fait 400 de hauteur et il y a zoom de 0.3 dessus
	pouvoir1.x=xminscreen+200*0.2*0.5*apparence+10--actualcontentwidth+(xminscreen)-200*0.1
	pouvoir1.y=contentcentery+0.5*actualcontentheight-200*0.2*0.5*apparence
	pouvoir1.xScale=0.2*apparence--pouvoir en deux clics
	pouvoir1.yScale=pouvoir1.xScale
	pouvoir:insert(pouvoir1)
	if goh then
		pvaction.xScale=pouvoir1.xScale*pouvoir1.width/pvaction.width
		pvaction.yScale=pvaction.xScale
	end

	pv1cl=display.newImage(imbouton.pouvoir,2) --display.newRect(pouvoir1.x,pouvoir1.y,400*pouvoir1.xScale,400*pouvoir1.xScale)--bouton du pouvoir 1
	pv1cl.x=pouvoir1.x
	pv1cl.y=pouvoir1.y
	pv1cl.xScale=pouvoir1.xScale
	pv1cl.yScale=pouvoir1.yScale
	pv1cl.alpha=1--0.01
	pv1cl.isVisible=false
	pouvoir:insert(pv1cl)

	pv1ch=display.newRect(pouvoir1.x,pouvoir1.y+100*pouvoir1.xScale,200*pouvoir1.xScale,1)
	if goh then
		pv1ch.mask=graphics.newMask( "goh/bouton/mask/mask1.png" )
		pv1ch:setMask(pv1ch.mask)
		pv1ch.maskX=pouvoir1.x-pv1ch.x
		pv1ch.maskY=pouvoir1.y-pv1ch.y
		pv1ch.maskScaleX=pouvoir1.xScale
		pv1ch.maskScaleY=pv1ch.maskScaleX
	end
	pv1ch.alpha=0.3
	pouvoir:insert(pv1ch)
	if pouvoirdisp>1 then
		if race==2 then
			pouvoir2=display.newImage(imbouton.pouvoir,5)--display.newImage( "bouton/pouvoir2.png", 200*0.3,actualcontentheight-200*0.1,true )--l'image fait 400 de hauteur et il y a zoom de 0.3 dessus
			pv2cl=display.newImage(imbouton.pouvoir,6)
		elseif race==1 then
			pouvoir2=display.newImage(imbouton.pouvoir,3)
			pv2cl=display.newImage(imbouton.pouvoir,4)
		else
			pouvoir2=display.newImage(imbouton.pouvoir,7)
			pv2cl=display.newImage(imbouton.pouvoir,8)
		end
		pouvoir2.x=pouvoir1.x+10+200*pouvoir1.xScale
		pouvoir2.y=pouvoir1.y
		pouvoir2.xScale=pouvoir1.xScale--pouvoir en deux ou plus
		pouvoir2.yScale=pouvoir1.xScale
		pouvoir:insert(pouvoir2)

		--pv2cl=display.newImage(imbouton.pouvoir2pret,1) --display.newRect(pouvoir2.x,pouvoir2.y,400*pouvoir1.xScale,400*pouvoir1.xScale)--bouton du pouvoir 2
		pv2cl.x=pouvoir2.x
		pv2cl.y=pouvoir2.y
		pv2cl.xScale=pouvoir2.xScale
		pv2cl.yScale=pouvoir2.yScale
		pv2cl.alpha=1 --0.01
		pv2cl.isVisible=false
		pouvoir:insert(pv2cl)

		pv2ch=display.newRect(pouvoir2.x,pouvoir2.y+100*pouvoir1.xScale,200*pouvoir1.xScale,1)
		pv2ch.alpha=0.3
		pouvoir:insert(pv2ch)
		if goh then
			if race==2 then
				pv2ch.mask=graphics.newMask( "goh/bouton/mask/mask3.png" )
				pv2ch:setMask(pv2ch.mask)
				pv2ch.maskX=pouvoir2.x-pv2ch.x
				pv2ch.maskY=pouvoir2.y-pv2ch.y
				pv2ch.maskScaleX=pouvoir2.xScale
				pv2ch.maskScaleY=pv2ch.maskScaleX
			elseif race==1 then
				pv2ch.mask=graphics.newMask( "goh/bouton/mask/mask2.png" )
				pv2ch:setMask(pv2ch.mask)
				pv2ch.maskX=pouvoir2.x-pv2ch.x
				pv2ch.maskY=pouvoir2.y-pv2ch.y
				pv2ch.maskScaleX=pouvoir2.xScale
				pv2ch.maskScaleY=pv2ch.maskScaleX
			else
				pv2ch.mask=graphics.newMask( "goh/bouton/mask/mask4.png" )
				pv2ch:setMask(pv2ch.mask)
				pv2ch.maskX=pouvoir2.x-pv2ch.x
				pv2ch.maskY=pouvoir2.y-pv2ch.y
				pv2ch.maskScaleX=pouvoir2.xScale
				pv2ch.maskScaleY=pv2ch.maskScaleX
			end
		end
		if pouvoirdisp>2 then
			pouvoir3=display.newImage(imbouton.pouvoir,9)--display.newImage( "bouton/pouvoir3.png", 400*0.3,actualcontentheight-200*0.1,true )--l'image fait 400 de hauteur et il y a zoom de 0.3 dessus
			pouvoir3.x=pouvoir2.x+10+200*pouvoir1.xScale--400*0.3
			pouvoir3.y=pouvoir1.y
			pouvoir3.xScale=pouvoir1.xScale--pouvoir en 1 clic
			pouvoir3.yScale=pouvoir1.xScale
			pouvoir:insert(pouvoir3)

			pv3cl=display.newImage(imbouton.pouvoir,11)--bouton du pouvoir 3
			pv3cl.x=pouvoir3.x
			pv3cl.y=pouvoir3.y
			pv3cl.xScale=pouvoir1.xScale
			pv3cl.yScale=pouvoir1.xScale
			pv3cl.alpha=1
			pv3cl.isVisible=false
			pouvoir:insert(pv3cl)
			pv3clactif=display.newImage(imbouton.pouvoir,10)
			pv3clactif.x=pouvoir3.x
			pv3clactif.y=pouvoir3.y
			pv3clactif.xScale=pouvoir3.xScale
			pv3clactif.yScale=pouvoir3.yScale
			pv3clactif.isVisible=false
			pouvoir:insert(pv3clactif)

			pv3ch=display.newRect(pouvoir3.x,pouvoir3.y+100*pouvoir1.xScale,200*pouvoir1.xScale,1)
			pv3ch.alpha=0.3
			pouvoir:insert(pv3ch)
			if goh then
				pv3ch.mask=graphics.newMask( "goh/bouton/mask/mask5.png" )
				pv3ch:setMask(pv3ch.mask)
				pv3ch.maskX=pouvoir3.x-pv3ch.x
				pv3ch.maskY=pouvoir3.y-pv3ch.y
				pv3ch.maskScaleX=pouvoir3.xScale
				pv3ch.maskScaleY=pv3ch.maskScaleX
			end
		end
	end
end










--pvaction.x=pouvoir1.x
--pvaction.y=pouvoir1.y
pv1clicactiver=0--est a 1 quand on a cliquer sur le pouvoir et qu'il reste une action a faire
pv2clicactiver=0
pv3clic=0--pour les priorité (se met a 1 quand on clique sur l'un des boutons)
pv2clic=0
pv1clic=0
clicpouvoir1=0--si on clique sur le bouton pouvoir1 alors qu'il n'est pas charger
clicpouvoir2=0
clicpouvoir3=0
if pv1ch==nil then
	pv1ch={}
end
if pv2ch==nil then
	pv2ch={}
end
if pv3ch==nil then
	pv3ch={}
end
	pv1ch.pv1cpt=tchpv1-0.25 --compteur permettant de savoir quand le pouvoir est pret
--elseif pouvoirdisp>1 then
	pv2ch.pv2cpt=tchpv2-0.25
--elseif pouvoirdisp>2 then
	pv3ch.pv3cpt=tchpv3-0.25
--end
print("init timer pouvoir")
if numtimerpouvoir==nil then
	numtimerpouvoir={}--pour la pause
	print("jeupause.timernb= "..jeupause.timernb)
	for i=1,10 do
		jeupause.timernb=jeupause.timernb+1
		numtimerpouvoir[i]=jeupause.timernb
		jeupause.timerlibre[numtimerpouvoir[i]]=2
	end
end


pouvoir1action={}
pouvoir1activer={}
pouvoir1cpt=1

local function creationgroup( event )
	grouppvaction=display.newGroup()
	group[2048]:insert(grouppvaction)
end
creationgroup1=timer.performWithDelay( 100, creationgroup )


-- local function chargementpv( event )--gestion du chargment des trois pouvoirs
-- 	if removetotal==false then
-- 	if removepartiel1==false then--normalement non necessaire a voir pourquoi on est obliger de le mettre
-- 		if pouvoirdisp>0 then
-- 			if pv1cpt<tchpv1 then
-- 				pv1ch.height=pv1ch.height-200*pouvoir1.xScale/tchpv1--tchpv1 est le temps de chargement du pouvoir 1 en sec
-- 				pv1cpt=pv1cpt+0.25
-- 			else
-- 				pv1cl.isVisible=true
-- 			end
-- 			if pouvoirdisp>1 then
-- 				if pv2cpt<tchpv2 then
-- 					pv2ch.height=pv2ch.height-200*pouvoir1.xScale/tchpv2
-- 					pv2cpt=pv2cpt+0.25
-- 				else
-- 					pv2cl.isVisible=true
-- 				end
-- 				if pouvoirdisp>2 then
-- 					if pv3cpt<tchpv3 then
-- 						if pouvoir3activer==0 then
-- 							pv3ch.height=pv3ch.height-200*pouvoir1.xScale/tchpv3
-- 							pv3cpt=pv3cpt+0.25
-- 						end
-- 					else
-- 						pv3cl.isVisible=true
-- 					end
-- 				end
-- 			end
-- 		end
-- 	end
-- 	else
-- 		--timer:cancel(chagement)
-- 	end
-- end
-- chargement=timer.performWithDelay( 250, chargementpv, 0 )
-- numtimerpouvoir[1]=timerpause(3,chargement,nil)
-- jeupause.timer[numtimerpouvoir[1]]=chargement
-- jeupause.timerlibre[numtimerpouvoir[1]]=3
chargementttpouvoir(numtimerpouvoir)

local function pv1verif(x,y)--verification que l'on peu poser les pv1 a cet endroit
	local autorise
	
   --	print("POS.X = " .. event.x, "POS.Y = ".. event.y);
	autorise=1
	if modezombie then
		autorise=0
		if autorise==0 then
			local i=1
			while i<=obstaclenb do
			--for i=1,obstaclenb,1 do--wandrille le 11 correspond au nb de point de collision (obstacle)------------------------------------------------------------------------------------------------------------
				if 3000>((x-obstacle[i].x)^2+(y+30-obstacle[i].y)^2)then
					autorise=1
					i=obstaclenb+1
				end
				i=i+1
			end
		end
		if autorise==0 then
			local i=1
			while i<=obstacle1nb do
			--for i=1,obstacle1nb,1 do--wandrille le 1 correspond au nb de point de collison(obstacle1)----------------------------------------------------------------------------------------------------------------
				if 20000>((x-obstacle1[i].x)^2+(y+30-obstacle1[i].y)^2)then
					autorise=1
					i=obstacle1nb+1
				end
				i=i+1
			end
		end
		if autorise==0 then
			if obstacle0nb>=1 then
				local i=1
				while i<=obstacle0nb do
					local rayon=500
					if obstacle0[i].rayon~=nil then
						rayon=obstacle0[i].rayon
					end
					if rayon>((x-obstacle0[i].x)^2+(y+30-obstacle0[i].y)^2)then
						autorise=1
						i=obstacle0nb+1
					end
					i=i+1
				end
			end
		end
	else
		if not goh then
			for j=1, cheminnb+1,1 do--2000
				if 2500>((x-chemin[j].x)^2+(y-chemin[j].y)^2)then
					autorise=0
				end
			end
		else
			local i=2
			while i<=cheminnb do
				local coef=1
				if chemin[i].mechant~=nil and not modepanique then
					if chemin[i].mechant>1 then
						coef=chemin[i].mechant*chemin[i].mechant
					end
				end
				if 400*coef*cheminlargeur>((x-chemin[i].x)*(x-chemin[i].x)+(y-chemin[i].y)*(y-chemin[i].y))then
					autorise=0
					i=cheminnb+1
				end
				i=i+1
			end
		end
	end
	if contreai==1 then
		if y>1024*0.3 then
			autorise=1
		end
	end
	return autorise
end
local function findpv1better(self1)
	print("lancement du test")
	local drapeau1=self1
	local autorise=pv1verif(self1.x,self1.y)
	if autorise==0 then
		print("coodonée deja bonne")
		drapeau1.x=self1.x
		drapeau1.y=self1.y
	else
		drapeau1.x=self1.x+30
		drapeau1.y=self1.y+30
		self1.x=self1.x-30
		self1.y=self1.y-30
		local xdirec=1
		if drapeau1.x>self1.x then
			xdirec=-1
		end
		local ydirec=1
		if drapeau1.x>self1.y then
			ydirec=-1
		end
		local distancemin=10^6 --(self1.x-drapeau1.x)*(self1.x-drapeau1.x)+(self1.y-drapeau1.y)*(self1.y-drapeau1.y)
		if distancemin>1000 then --1000
			local limitex1carre=drapeau1.x+30*(-xdirec)
			local limitex2carre=self1.x+30*(xdirec)
			local limitey1carre=drapeau1.y+30*(-ydirec)
			local limitey2carre=self1.y+30*(ydirec)
			local ancienxvalide=drapeau1.x
			local ancienyvalide=drapeau1.y
			local testposbat={}
			testposbat.x=drapeau1.x
			testposbat.y=drapeau1.y
			local i=limitex1carre
			local varrandx=mathfloor(mathabs(limitex1carre-limitex2carre)*0.2)
			if varrandx<10 then
				varrandx=10
			end
			local varrandy=mathfloor(mathabs(limitey1carre-limitey2carre)*0.2)
			if varrandy<10 then
				varrandy=10
			end
			while i*xdirec<limitex2carre*(xdirec) do
				testposbat.x=i
				local j=limitey1carre
				while j*ydirec<limitey2carre*(ydirec) do
					testposbat.y=j
					local autorise1=pv1verif(testposbat.x,testposbat.y)
					if autorise1==0 then
						local distancemintest=(self1.x-testposbat.x)*(self1.x-testposbat.x)+(self1.y-testposbat.y)*(self1.y-testposbat.y)
						if distancemin>distancemintest then
							autorise=0
							distancemin=distancemintest
							ancienxvalide=testposbat.x
							ancienyvalide=testposbat.y
							drapeau1.x=ancienxvalide
							drapeau1.y=ancienyvalide
							print("autorise for "..drapeau1.x..","..drapeau1.y)
						end
					end
					j=j+varrandy*ydirec
				end
				i=i+varrandx*(xdirec)
			end
		end
	end
	return autorise,drapeau1.x,drapeau1.y
end
local function clicpv1tap(event)--lorsqu'on demande de mettre le pouvoir 1 a un endroit
	--print("clicpv1tap")
	--print("event x"..event.x.."event y"..event.y)
	clicsurqqcfunc()
	priorite1( )
	--print("etape-1")
	if fenaff==false and  clicpause==0 and clicpv1info==false then
		--print("etape0")
		if ipv1clic==1 and pv1ch.pv1cpt>=tchpv1 then
			local function pv1clicactiver1( event )
				pv1clicactiver=0
				clicpv1info=true
				--gg=nil	
			end
			pv1clicactiver1=timer.performWithDelay( 50, pv1clicactiver1 )
		end
		if findelapartie==false then --jeupause.etat==0 then
			--print("etape1 ipv1clic"..ipv1clic.." pv1cpt "..pv1cpt.." tchpv1 "..tchpv1)
			if ipv1clic==1 and pv1ch.pv1cpt>=tchpv1 then
				-- debut retourdinformation
				retinf.pv1nb=retinf.pv1nb+1
				-- fin retourinformation
				--print("etape2")
				if pouvoir1action[pouvoir1cpt]~=nil then
					pouvoir1action[pouvoir1cpt]:removeSelf()
					pouvoir1action[pouvoir1cpt]=nil 
				end
				pouvoir1action[pouvoir1cpt]=display.newImage(imbouton.menupause,11) -- imbouton.pvaction,1)--display.newImage("bouton/pouvoir1.png",(-background.x+event.x)/taille,(-background.y+event.y)/taille,true)
				local x=(-background.x+event.x)/taille
				local y=(-background.y+event.y)/taille
				pouvoir1action[pouvoir1cpt].x=x
				pouvoir1action[pouvoir1cpt].y=y
				if goh then
					pouvoir1action[pouvoir1cpt].xScale=0.23
				else
					pouvoir1action[pouvoir1cpt].xScale=1
				end
				pouvoir1action[pouvoir1cpt].yScale=pouvoir1action[pouvoir1cpt].xScale
				grouppvaction:insert(pouvoir1action[pouvoir1cpt])--group[2048]
				local autorise
				--=pv1verif(x,y)
				local self1={}
				self1.x=x
				self1.y=y
				autorise,x,y=findpv1better(self1)
				print("autorise1 "..autorise.." x "..x.." y "..y)
				--print("autorise"..autorise)
				if autorise==1 then
					pv1interditbis.x=pouvoir1action[pouvoir1cpt].x
					pv1interditbis.y=pouvoir1action[pouvoir1cpt].y
					pv1interditbis.isVisible=true
					pv1interdit.x=pouvoir1action[pouvoir1cpt].x
					pv1interdit.y=pouvoir1action[pouvoir1cpt].y
					pv1interdit.isVisible=true
					grouppvaction:remove(pouvoir1action[pouvoir1cpt])--group[2048]
					pouvoir1action[pouvoir1cpt]:removeSelf()
					--pouvoir1action[pouvoir1cpt]=nil
					pouvoir1action[pouvoir1cpt]=nil
					local function pv1interdittimer1(event)
						--jeupause.timerlibre[numtimerpouvoir[2]]=2
						pv1interditbis.isVisible=false
						pv1interdit.isVisible=false

		
					end
					local pv1interdittimer=timer.performWithDelay( 1000,pv1interdittimer1)
					
					-- pv1interdittimer.cpt=pouvoir1cpt
					-- if numtimerpouvoir[2]==nil then
					-- 	numtimerpouvoir[2]=timerpause(1,pv1interdittimer,nil)
					-- else
					-- 	local lenum=timerpause(1,pv1interdittimer,numtimerpouvoir[2])
					-- end
					pvaction.isVisible=false
					Runtime:removeEventListener( "tap",clicpv1)
				else
					if testbugpv1clic==true then
						testbugpv1clic=false
						pvaction.isVisible=false
				   		pv1cl.isVisible=false
						pv1ch.height=2*200*pouvoir1.xScale
						pv1ch.pv1cpt=0
					
						--jeupause.timer[numtimerpouvoir[3]]=pv1clicactiver1
						--jeupause.timerlibre[numtimerpouvoir[3]]=1
						local function pouvoir1actionaff(event)
							jeupause.timerlibre[numtimerpouvoir[3]]=2
							if pouvoir1action[pouvoir1cpt]~=nil then
								pouvoir1action[pouvoir1cpt].isVisible=false
							end
							pouvoir1cpt=pouvoir1cpt+1
							if pouvoir1cpt==5 then
								pouvoir1cpt=1
							end
						end
						pouvoir1actionaff=timer.performWithDelay( 1000,pouvoir1actionaff)
						-- jeupause.timer[numtimerpouvoir[3]]=pouvoir1actionaff
						-- jeupause.timerlibre[numtimerpouvoir[3]]=1
						if numtimerpouvoir[3]==nil then
							numtimerpouvoir[3]=timerpause(1,pouvoir1actionaff,nil)
						else
							local lenum=timerpause(1,pouvoir1actionaff,numtimerpouvoir[3])
						end
						pouvoir1activer[pouvoir1cpt]={}
						pouvoir1activer[pouvoir1cpt][1]=1
						local anim=display.newSprite(effetexplo.apparition,effetexplo.apparitionseq)
						anim:setSequence("levelup")
						anim.x=pouvoir1action[pouvoir1cpt].x
						anim.y=pouvoir1action[pouvoir1cpt].y
						anim.xScale=0.3
						anim.yScale=anim.xScale
						anim.group=mathfloor(anim.y+1024)
						group[anim.group]:insert(anim)
						spritegestion(anim)
						--action du pouvoirl
						local soldatt=require("soldat")
						local k=1
						local l=1
						print("savegameall.bonuspouvoir[1].nbsold"..savegameall.bonuspouvoir[1].nbsold)
						while l<=savegameall.bonuspouvoir[1].nbsold do 
							if k>=3 then
								k=1
							end
							--nbsoldat=nbsoldat+1
							local numsoldat=findnbsoldat(0) --nbsoldat
							pouvoir1activer[pouvoir1cpt][1+l]=numsoldat

							local typeso=140
							if race==2 then
								typeso=140+mathrandom(0,2)
							elseif race==0 then
								if k==1 then
									typeso=140+mathrandom(0,2)
								else
									typeso=143+mathrandom(0,2)
									if typeso==144 then
										typeso=146
									end
								end
							elseif race==1 then
								typeso=143+mathrandom(0,2)
								if typeso==144 then
									typeso=146
								end
							end
							print("spawn 1 sold pv1 pouvoir 395")
							local hello=soldatt.new(numsoldat,typeso,pouvoir1cpt)
							hello:debut(numsoldat)
							k=k+1
							l=l+1
						end
						local function  pouvoir1cpt1( event )
							if event.source.timernum1>=19 then
								jeupause.timerlibre[numtimerpouvoir[event.source.timernum]]=2
								--print(event.source.cpt)
								pouvoir1activer[event.source.cpt][1]=0
								if findelapartie==false then -- verifier ici
									for i=2,savegameall.bonuspouvoir[1].nbsold+1 do
										-- if pouvoir1activer[event.source.cpt][i]~=nil then
											-- if isoldat[pouvoir1activer[event.source.cpt][i]].vie>0 and isoldat[pouvoir1activer[event.source.cpt][i]].vivant then
											-- 	animationapparition(isoldat[pouvoir1activer[event.source.cpt][i]].x1,isoldat[pouvoir1activer[event.source.cpt][i]].y1,1,true)
											-- end
											if isoldat[pouvoir1activer[event.source.cpt][i]].vivant then
												local anim=display.newSprite(effetexplo.apparition,effetexplo.apparitionseq)
												anim:setSequence("levelup")
												anim.x=isoldat[pouvoir1activer[event.source.cpt][i]].x1
												anim.y=isoldat[pouvoir1activer[event.source.cpt][i]].y1
												anim.xScale=0.3
												anim.yScale=anim.xScale
												anim.group=mathfloor(anim.y+1024)
												group[anim.group]:insert(anim)
												spritegestion(anim)
											end
											isoldat[pouvoir1activer[event.source.cpt][i]].vie=0
											isoldat[pouvoir1activer[event.source.cpt][i]].vivant=false
											if savegameall.xpactive then
												isoldat[pouvoir1activer[event.source.cpt][i]].rectxp.width=0
												isoldat[pouvoir1activer[event.source.cpt][i]].rectxp.alpha=0
												isoldat[pouvoir1activer[event.source.cpt][i]].rectxp.isVisible=false
											end
										--end
									end 
								end
							elseif findelapartie==false then
								--pouvoir1resteact=event.source
								local pouvoir1resteact=timer.performWithDelay(1000*vitessejeuin,pouvoir1cpt1,1)
								pouvoir1resteact.timernum1=event.source.timernum1+1
								pouvoir1resteact.timernum=event.source.timernum
								pouvoir1resteact.cpt=event.source.cpt
								local lenum=timerpause(1,pouvoir1resteact,numtimerpouvoir[event.source.timernum])
							else
								jeupause.timerlibre[numtimerpouvoir[event.source.timernum]]=2
								--print(event.source.cpt)
								pouvoir1activer[event.source.cpt][1]=0
								--timer.cancel(event.source)
							end
							-- isoldat[pouvoir1activer[event.source.cpt][2]].vie=0
							-- isoldat[pouvoir1activer[event.source.cpt][2]].vivant=false  
							-- --if race<2 then
							-- 	isoldat[pouvoir1activer[event.source.cpt][3]].vie=0
							-- 	isoldat[pouvoir1activer[event.source.cpt][3]].vivant=false
								-- if race==0 then
								-- 	isoldat[pouvoir1activer[event.source.cpt][4]].vie=0
								-- 	isoldat[pouvoir1activer[event.source.cpt][4]].vivant=false
								-- end
							--end
							--tuer les soldats
						end
						animationapparition(pouvoir1action[pouvoir1cpt].x,pouvoir1action[pouvoir1cpt].y,1)
						print("animationapparition")
						-- local function  pouvoir1cpt1load( event )
						-- 	event.source.timernum1=event.source.timernum1+1
						-- 	if event.source.timernum1>=20 then

						-- 	else

						-- 	end

						-- end
						-- local pouvoir1resteact=timer.performWithDelay(1000*vitessejeuin,pouvoir1cpt1)
						
						--dureeatt=1000*vitessejeuin --20000
						local pouvoir1resteact=timer.performWithDelay(1000*vitessejeuin,pouvoir1cpt1,1) --20) -- 20000*vitessejeuin
						--pouvoir1resteact.dureeatt=dureeatt
						pouvoir1resteact.timernum1=0
						if numtimerpouvoir[4]==nil then
							numtimerpouvoir[4]=timerpause(1,pouvoir1resteact,nil)
							pouvoir1resteact.timernum=4
						else
							if jeupause.timerlibre[numtimerpouvoir[4]]==2 then
								local lenum=timerpause(1,pouvoir1resteact,numtimerpouvoir[4])
								pouvoir1resteact.timernum=4
							else
								pouvoir1resteact.timernum=7
								if numtimerpouvoir[7]==nil then
									numtimerpouvoir[7]=timerpause(1,pouvoir1resteact,nil)
								else
									local lenum=timerpause(1,pouvoir1resteact,numtimerpouvoir[7])
								end
							end
						end
						-- jeupause.timer[numtimerpouvoir[4]]=pouvoir1resteact
						-- jeupause.timerlibre[numtimerpouvoir[4]]=1
						pouvoir1resteact.cpt=pouvoir1cpt
						display.remove(pv1affinter)
						--pv1affinter:removeSelf()
						pv1affinter=nil
					  	Runtime:removeEventListener( "tap",clicpv1)
					  	if tuto==2 then
							if tutoaction==13 then
								actionfaite()
							end
						end
				   	else
				   		pvaction.isVisible=false
				   	end
			   	end
			else
				ipv1clic=ipv1clic+1
			end
		end
	end
end
local function pv1clinit()--init du pouvoir 1
	pv1affinter=display.newGroup()
	group[2048]:insert(pv1affinter)--??
	-- if pv1interditbis~=nil then
	-- 	pv1interditbis:removeSelf()
	-- 	pv1interditbis=nil
	-- end
	pv1interditbis=display.newImage(imbouton.menupause,11) --imbouton.pvaction,1)--display.newImage("bouton/pouvoir1.png",0,0,true)
	pv1interditbis.x=0
	pv1interditbis.y=0
	pv1interditbis.isVisible=false
	if goh then
		pv1interditbis.xScale=0.023
	else
		pv1interditbis.xScale=0.1
	end
	pv1interditbis.yScale=pv1interditbis.xScale
	pv1affinter:insert(pv1interditbis)
	-- if pv1interdit~=nil then
	-- 	pv1interdit:removeSelf()
	-- 	pv1interdit=nil
	-- end
	pv1interdit=display.newImage(imbouton.interdit,1)--display.newImage("bouton/interdit.png",0,0,true)
	pv1interdit.x=0
	pv1interdit.y=0
	pv1interdit.isVisible=false
	pv1interdit.xScale=0.5
	pv1interdit.yScale=0.5
	pv1affinter:insert(pv1interdit)
	pvaction.isVisible=true
	pvaction.x=pouvoir1.x
	pvaction.y=pouvoir1.y
end
local function pv1cltap()--lorsqu'on demande de cliquer sur le bouton pouvoir
	clicsurqqcfunc()
	priorite1( )
	if fenaff==false then
	if pv1clicactiver==0 then
		pv1clic=1
		--print("pv1clic",pv1clic)
		function pv1clic1activer1(event)
			pv1clicactiver=1
		end
		pv1clic1activer2=timer.performWithDelay( 50, pv1clic1activer1 )
		
		priorite1()
		if findelapartie==false then --jeupause.etat==0 then
		
			ipv1clic=0
			pv1clinit()
			testbugpv1clic=true
			clicpv1info=false--bug de multiclic sur le positionnement du pouvoir
			function clicpv1(event)

				clicpv1tap(event)

			end
			Runtime:addEventListener("tap",clicpv1)
		end
		local function pv1clic1( event )
			--print("test")
			pv1clic=0
			pvaction.isVisible=true
			--print("pv1clic",pv1clic)
		end
		pv1clic1=timer.performWithDelay( 50, pv1clic1 )
	else
		pvaction.isVisible=false
		pv1clicactiver=0
		pv1affinter:removeSelf()
		pv1affinter=nil
		Runtime:removeEventListener( "tap",clicpv1)
		if tuto==2 then
			if tutoaction==13 then
				actiondefaite()
			end
		end
	end
	end
end
local function clicpv2tap(event)--demande de pouvoir 2
	clicsurqqcfunc()--(2 on glisse le pouvoir 2 surl'endroit ou on veut qu'il s'applique)
	priorite1( )

	if  fenaff==false and  clicpause==0 then
	if ipv2clic==1 and pv2ch.pv2cpt==tchpv2 then
		local function pv2clicactiver1( event )
			pv2clicactiver=0
			--pvaction.isVisible=true
			--
		end
		pv2clicactiver1=timer.performWithDelay( 50, pv2clicactiver1 )
	end
	if findelapartie==false then --jeupause.etat==0 then
	if ipv2clic==1 and pv2ch.pv2cpt==tchpv2 then
		-- debut retourdinformation
		retinf.pv2nb=retinf.pv2nb+1
		-- fin retourinformation
		display.remove(pouvoir2action)
		-- if pouvoir2action~=nil then
		-- 	pouvoir2action:removeSelf()
			pouvoir2action=nil 
		-- end
		pouvoir2action=display.newImage(imbouton.menupause,11) -- imbouton.pvaction,1)--display.newImage("bouton/pouvoir2.png",(-background.x+event.x)/taille,(-background.y+event.y)/taille,true)
		pouvoir2action.x=(-background.x+event.x)/taille
		pouvoir2action.y=(-background.y+event.y)/taille
		if goh then
			pouvoir2action.xScale=0.23
		else
			pouvoir2action.xScale=1
		end
		pouvoir2action.yScale=pouvoir2action.xScale
		grouppvaction:insert(pouvoir2action)--group[2048]
		pvaction.isVisible=false
	   		--print("POS.X = " .. event.x, "POS.Y = ".. event.y);
	   		pv2cl.isVisible=false
		pv2ch.height=2*200*pouvoir1.xScale
		pv2ch.pv2cpt=0

		local function pouvoir2actionaff(event)
				--pouvoir2action.isVisible=false
				jeupause.timerlibre[numtimerpouvoir[5]]=2
				if pouvoir2action~=nil then
					grouppvaction:remove(pouvoir2action)--group[2048]
					pouvoir2action:removeSelf()
					pouvoir2action=nil
				end
		end
		pouvoir2actionaff=timer.performWithDelay( 200,pouvoir2actionaff)
		if numtimerpouvoir[5]==nil then
			numtimerpouvoir[5]=timerpause(1,pouvoir2actionaff,nil)
		else
			local lenum=timerpause(1,pouvoir2actionaff,numtimerpouvoir[5])
		end
		-- jeupause.timer[numtimerpouvoir[5]]=pouvoir2actionaff
		-- jeupause.timerlibre[numtimerpouvoir[5]]=1
		--local nbfleche=10--20
		if race==2 then
			local foudre={}
			foudre.x=pouvoir2action.x
			foudre.y=pouvoir2action.y-20
			-- local sequenceData =
			-- {
			-- name="foudre",
			-- frames= {1,2,1,2,2,1}, -- frame indexes of animation, in image sheet
			-- time = 1000*vitessejeuin,           -- Optional. In ms.  If not supplied, then sprite is frame-based.
			-- loopCount =2        -- Optional. Default is 0.
			-- }
			-- local sheet1 =impro.foudre-- graphics.newImageSheet( "batiment/projectiles/foudre.png", { width=50, height=50, numFrames=2 } )
			-- local foudre=display.newSprite(sheet1,sequenceData)
			-- foudre.x=pouvoir2action.x
			-- foudre.y=pouvoir2action.y-20
			-- foudre.nb=mathfloor(foudre.y)+1024
			-- group[foudre.nb]:insert(foudre)
			-- foudre.cpt=0
			-- foudre.pause1=0
			-- local function 
			local function trouvecible(attaquepv)
				local maxvie=0
				local tropvie=0
				local numerosold=0
				local distancemin=-1
				for j=1,nbsoldat,1 do
					if isoldat[j].orientation==1 then --if isoldat[j].typesoldat>=200 then
						local calcul=(isoldat[j].x1-foudre.x)*(isoldat[j].x1-foudre.x)+(isoldat[j].y1-foudre.y-20)*(isoldat[j].y1-foudre.y-20)
						if rayonatt>(calcul) and isoldat[j].vivant==true then -- isoldat[j].vie>0  then
							-- if distancemin>calcul or distancemin==-1 then
							-- 	distancemin=calcul
							-- 	numerosold=j
							-- end
							if maxvie==0 then -- permet de choisir l'ennemi le plus adapté ( le pouvoir le butte en un coup)
								numerosold=j
								maxvie=1
								if isoldat[j].vie>attaquepv then
									tropvie=isoldat[j].vie
								end
							end
							if (distancemin>calcul or distancemin==-1) and isoldat[j].vie<=attaquepv then
								distancemin=calcul
								numerosold=j
								maxvie=isoldat[j].vie
								tropvie=0
							elseif tropvie~=0 and isoldat[j].vie>attaquepv then
								if distancemin>calcul or distancemin==-1 then -- isoldat[j].vie<tropvie then
									numerosold=j
									maxvie=1
									tropvie=isoldat[j].vie
									distancemin=calcul
								end
							end

							-- if maxvie==0 then -- permet de choisir l'ennemi le plus adapté ( le pouvoir le butte en un coup)
							-- 	numerosold=j
							-- 	maxvie=1
							-- 	if isoldat[j].vie>attaquepv then
							-- 		tropvie=isoldat[j].vie
							-- 	end
							-- end
							-- if maxvie<=isoldat[j].vie and isoldat[j].vie<=attaquepv then
							-- 	numerosold=j
							-- 	maxvie=isoldat[j].vie
							-- 	tropvie=0
							-- elseif tropvie~=0 and isoldat[j].vie>attaquepv then
							-- 	if isoldat[j].vie<tropvie then
							-- 		numerosold=j
							-- 		maxvie=1
							-- 		tropvie=isoldat[j].vie
							-- 	end
							-- end
						end
					end
				end
				return(numerosold)
			end
			local function attquepouvoir2foudrevie()

				local attquepv2=attaquepouvoir2
				local premierk=true
				local numerosold=1
				while(numerosold~=0) do
					numerosold=trouvecible(attaquepouvoir2)
					if numerosold~=0 then
						premierk=false
						local viesold=isoldat[numerosold].vie
						affsang(numerosold,2)
						affsang(numerosold,3)
						affsang(numerosold,3)
						affsang(numerosold,3)
						affsang(numerosold,4)
						affsang(numerosold,5)
						-- debut retourdinformation
						retinf.attpv2=retinf.attpv2+attquepv2
						-- fin retourdinformation
						pertevie(numerosold,attquepv2,1)
						attquepv2=attquepv2-viesold
						if savegameall.bonuspouvoir[2].bonus==1 or attquepv2<=0 then 
							numerosold=0
						end
					end
				end
				-- if numerosold~=0 then
				-- 	affsang(numerosold,2)
				-- 	affsang(numerosold,3)
				-- 	affsang(numerosold,3)
				-- 	affsang(numerosold,3)
				-- 	if savegameall.bonuspouvoir[2].bonus>1 then
				-- 		if isoldat[numerosold].vie*2<attaquepouvoir2 then
				-- 			while pv2cpt*2<tchpv2 do
				-- 				if pv2cpt<tchpv2 then
				-- 					pv2ch.height=pv2ch.height-200*pouvoir1.xScale/tchpv2
				-- 					pv2cpt=pv2cpt+0.25
				-- 				else
				-- 					pv2cl.isVisible=true
				-- 				end
				-- 			end
				-- 		end
				-- 	end
				-- 	pertevie(numerosold,attaquepouvoir2)
				-- else
				if premierk then
					while pv2ch.pv2cpt<tchpv2 do
						if pv2ch.pv2cpt<tchpv2 then
							pv2ch.height=pv2ch.height-200*pouvoir1.xScale/tchpv2
							pv2ch.pv2cpt=pv2ch.pv2cpt+0.25
						else
							pv2cl.isVisible=true
						end
					end
				end
				-- local tabsoldat={}
				-- local nbtabsoldat=0
				-- --print("attaque1")
				-- for j=1,nbsoldat,1 do
				-- 	if isoldat[j].orientation==1 then --if isoldat[j].typesoldat>=200 then
				-- 		local calcul=(isoldat[j].x1-foudre.x)^2+(isoldat[j].y1-foudre.y-20)^2
				-- 		if rayonatt>(calcul*nombre) and isoldat[j].vivant==true then -- isoldat[j].vie>0  then
				-- 			--local animdep1=require("animdep")
				-- 			--pertevie(j,attaquepouvoir2/3)
				-- 			nbtabsoldat=nbtabsoldat+1
				-- 			tabsoldat[nbtabsoldat]=j
				-- 			--isoldat[j].vie=isoldat[j].vie-attaquepouvoir2/3
				-- 			--isoldat[j].rectvie.width=mathfloor(isoldat[j].vie/isoldat[j].vietotale*20)
				-- 			--isoldat[j].rectvie.alpha=1
				-- 			--isoldat[j].rectvie:setFillColor(1-isoldat[j].vie/isoldat[j].vietotale,isoldat[j].vie/isoldat[j].vietotale,0 )
				-- 		end
				-- 	end
				-- end
				-- if nbtabsoldat>0 then
				-- 	local attaquepouvoir2foudre=mathfloor(attaquepouvoir2/(3*nbtabsoldat)*10)/10
				-- 	--print("attaque foudre:".. attaquepouvoir2foudre)
				-- 	for j=1,nbtabsoldat do
				-- 		pertevie(tabsoldat[j], attaquepouvoir2foudre)
				-- 	end
				-- end
			end
			-- local function move (event )
			-- 	if findelapartie then
			-- 		Runtime:removeEventListener( "enterFrame",move)
			-- 		group[foudre.nb]:remove(foudre)
			-- 		foudre:removeSelf()
			-- 		foudre=nil
			-- 	elseif foudre~=nil then
			-- 		if jeupause.etat==1 then -- jeupause.etat==1 then--technique numero 3 de mise en pause(plus de probleme avec les processeurs mtk et probleme de deferencement)
			-- 			if foudre.pause1==0 then
			-- 				foudre.pause1=1
			-- 				foudre:pause()
			-- 			end
			-- 		else
			-- 			if foudre.pause1==1 then
			-- 				foudre.pause1=0
			-- 				foudre:play()
			-- 			end
			-- 			--print("frame"..foudre.frame)
			-- 			if foudre.frame==2 and foudre.cpt~=foudre.frame then
			-- 				foudre.cpt=foudre.frame
			-- 				attquepouvoir2foudrevie()
			-- 			elseif foudre.frame==3 and foudre.cpt~=foudre.frame then
			-- 					foudre.cpt=foudre.frame
			-- 					--if self.event.frame==3 then
			-- 					--if foudre.pause1==0 then
			-- 					-- if foudre.cpt==1 then
			-- 					-- 	attquepouvoir2foudrevie(3)
			-- 					-- elseif foudre.cpt==6 then
			-- 					-- 	attquepouvoir2foudrevie(2)
			-- 					-- elseif foudre.cpt>12 then
							
			-- 				Runtime:removeEventListener( "enterFrame",move)
			-- 				group[foudre.nb]:remove(foudre)
			-- 				foudre:removeSelf()
			-- 				foudre=nil
			-- 			end
			-- 		--	foudre.cpt=foudre.cpt+1
			-- 		-- if foudre.cpt>13 then
			-- 		-- 	foudre:removeSelf()
			-- 		-- end
			-- 		end
			-- 	else
			-- 		Runtime:removeEventListener( "enterFrame",move)
			-- 	end
			-- end
			-- foudre:play()
			-- Runtime:addEventListener("enterFrame",move)
			local function attaquefoudre( event ) 
				jeupause.timerlibre[event.source.numero]=0
				attquepouvoir2foudrevie()
			end
			local foudretimer=timer.performWithDelay(100,attaquefoudre)
			foudretimer.numero=timerpause(1,foudretimer,nil)	

		else--pour elfe et geant fleche pour fleche et meteorite
		local fleche={}
		local flechex=pouvoir2action.x
		local flechey=pouvoir2action.y
		--local randompos=30	
		local vitesse=6
		local randomdure=1000
		local xoffset=nil
		local yoffset=nil
		local sequenceData={}
		if race==1 then
		sequenceData={
				{
				name="air",
				frames= {1}, -- frame indexes of animation, in image sheet
				time = 1000*vitessejeuin,           -- Optional. In ms.  If not supplied, then sprite is frame-based.
				loopCount =10        -- Optional. Default is 0.
				},
				{
				name="sol",
				frames={2},
				time=10*vitessejeuin,
				loopcount=1
				},
				{
				name="toucher",
				frames={3},
				time=10*vitessejeuin,
				loopcount=1
				}
			}
		else
			sequenceData ={
			{
			name="air",
			frames= {1}, -- frame indexes of animation, in image sheet
			time = 1000*vitessejeuin,           -- Optional. In ms.  If not supplied, then sprite is frame-based.
			loopCount =10        -- Optional. Default is 0.
			},
			{
			name="sol",
			frames={2},
			time=10*vitessejeuin,
			loopcount=1
			},
		}
		end
		local sheet1=nil
		if race==1 then
			sheet1 =impro.flechepluie-- graphics.newImageSheet( "batiment/projectiles/flechepluie.png", { width=17, height=35, numFrames=2 } )
			xoffset=-20
			yoffset=-40
		else
			sheet1 =impro.meteorite-- graphics.newImageSheet( "batiment/projectiles/meteorite.png", { width=17, height=35, numFrames=2 } )
			xoffset=-20
			yoffset=-120
		end
		local num1={}
		local num2={}
		lancerfle={}
		for flechecpt=1,nbfleche,1 do
			local function lancerfle1( event ) 
				--print("lancerfle.numero"..event.source.numero)
				local flechecpt=event.source.numero
			jeupause.timerlibre[num2[flechecpt]]=0
				envoyerfl(flechecpt,sheet1,sequenceData,randompos,xoffset,yoffset,flechex,flechey,vitesse,num1,fleche)
			end
			lancerfle[flechecpt]={}
			lancerfle[flechecpt]=timer.performWithDelay( mathrandom(1,randomdure)*vitessejeuin, lancerfle1 )
			--print("flechecpt"..flechecpt)
			lancerfle[flechecpt].numero=flechecpt
			num2[flechecpt]=timerpause(1,lancerfle[flechecpt],nil)	
		end
		end
	   		Runtime:removeEventListener( "tap",clicpv2)
		else
			ipv2clic=ipv2clic+1
		end
	end
	end	
end
local function pv2clinit()--init du pouvoir 2
	--print("le texte")
	pvaction.x=pouvoir2.x
	pvaction.y=pouvoir2.y
	pvaction.isVisible=true
	function pv2clic1activer1(event)
		pv2clicactiver=1
	end
	pv2clic1activer2=timer.performWithDelay( 50, pv2clic1activer1 )
end
local function pv2cltap()--demande de clic sur le pouvoir 2
	clicsurqqcfunc()
	if fenaff==false and pv2clicactiver==0 then
	pv2clic=1
	priorite1()
	if findelapartie==false then --jeupause.etat==0 then
		pv2clinit()
	if race<=2 then--pouvoir en deux cliques --mis a =< 2 remplacer pour pouvoir geant en pls clique
		--pv2clicactiver=1
		-- function pv2clic1activer1(event)
		-- 	pv2clicactiver=1
		-- end
		-- pv2clic1activer2=timer.performWithDelay( 50, pv2clic1activer1 )
		ipv2clic=0
		function clicpv2(event)
			clicpv2tap(event)
		end
		Runtime:addEventListener("tap",clicpv2);
	else
	end
	end
	local function pv2clic1( event )
		--print("test")
		pv2clic=0
		pvaction.isVisible=true
		--print("pv2clic",pv1clic)
	end
	pv2clic1=timer.performWithDelay( 50, pv2clic1 )
	end
end
if pouvoirdisp>0 then
	local var=0
	function pouvoir1:touch(event)--touch pour pouvoir 1 et pouvoir 2 appelle les fonctions au-dessus
		--gestion du pouvoir 1(deux posibilité: 1 on clique sur le bouton pouvoir1 et ensuite on clique a l'endroit ou on veut le mettre)
		--(2 on glisse le pouvoir 2 surl'endroit ou on veut qu'il s'applique)
		if fenaff==false  and findelapartie==false then --and jeupause.etat==0
			local result = true
			local phase = event.phase
			local previousTouches = self.previousTouches
			local numTotalTouches = 1
			if ( previousTouches ) then
				-- add in total from previousTouches, subtract one if event is already in the array
				numTotalTouches = numTotalTouches + self.numPreviousTouches
				if previousTouches[event.id] then
					numTotalTouches = numTotalTouches - 1
				end
			end
			-- if (phase=="ended" or "cancelled"==phase) then
			-- 		print("display new text")
			--  		display.newText("not focus and ended or cancelled",contentcenterx,contentcentery, native.systemFont, 18 )
			-- 		if var>500 then --if ((self.x-self.myX)^2+(self.y-self.myY)^2)<10000 then
			-- 			--print("end move")
			-- 			--print("self.myX"..self.myX.."selfx"..selfx)
			-- 			if self.pv==1 then
			-- 				--print("end pv1")
			-- 				grouppvaction:remove(pouvoir1action[pouvoir1cpt])--group[2048]
			-- 				pouvoir1action[pouvoir1cpt]:removeSelf()
			-- 				pouvoir1action[pouvoir1cpt]=nil
			-- 				local autorise=pv1verif((-background.x+event.x)/taille,(-background.y+event.y)/taille)
			-- 				if autorise==0 then
			-- 					if (event.x-pouvoir1.x)^2+(event.y-pouvoir1.y)^2<400 then
			-- 						autorise=1
			-- 					end
			-- 					if autorise==0 and pouvoirdisp>1 then
			-- 						if (event.x-pouvoir2.x)^2+(event.y-pouvoir2.y)^2<400 then
			-- 							autorise=1
			-- 						end
			-- 					end
			-- 					if autorise==0 and pouvoirdisp>2 then
			-- 						if (event.x-pouvoir3.x)^2+(event.y-pouvoir3.y)^2<400 then
			-- 							autorise=1
			-- 						end
			-- 					end
			-- 				end
			-- 				--print("autorise"..autorise)
			-- 				if autorise==1 then
			-- 					pv1cltap()
			-- 				else
			-- 					clicpv1tap(event)
			-- 				end

			-- 			elseif self.pv==2 then
			-- 				grouppvaction:remove(pouvoir2action)--group[2048]
			-- 				pouvoir2action:removeSelf()
			-- 				pouvoir2action=nil
			-- 				local autorise=0
			-- 				if contreai==1 then
			-- 					if ((-background.y+event.y)/taille)>1024*0.3 then
			-- 						autorise=1
			-- 					end
			-- 				end
			-- 				if (event.x-pouvoir1.x)^2+(event.y-pouvoir1.y)^2<400 then
			-- 					autorise=1
			-- 				end
			-- 				if autorise==0 and pouvoirdisp>1 then
			-- 					if (event.x-pouvoir2.x)^2+(event.y-pouvoir2.y)^2<400 then
			-- 						autorise=1
			-- 					end
			-- 				end
			-- 				if autorise==0 and pouvoirdisp>2 then
			-- 					if (event.x-pouvoir3.x)^2+(event.y-pouvoir3.y)^2<400 then
			-- 						autorise=1
			-- 					end
			-- 				end
			-- 				if autorise==1 then --if (event.x-pouvoir1.x)^2+(event.y-pouvoir1.y)^2<400 or (event.x-pouvoir2.x)^2+(event.y-pouvoir2.y)^2<400 or (event.x-pouvoir3.x)^2+(event.y-pouvoir3.y)^2<400 then
			-- 					pv2clicactiver=0
			-- 					pvaction.isVisible=false
			-- 				else
			-- 					clicpv2tap(event)
			-- 				end
			-- 				--construirearchtap(selfx,selfy,2)
			-- 				--var=0
			-- 			end
			-- 		end
			-- end 
			if "began" == phase then
				retinf.nbaction=retinf.nbaction+1
				removenbat()
				if ( not self.isFocus ) then
					display.getCurrentStage():setFocus( self )
					self.isFocus = true
					self.myX =(-background.x+event.x)/taille--(-background.x+contentcenterx)/taille--constx-80*apparence event.x/taille-self.x-- event.x/(taille^0.55)-self.x------------------------------------a modifier ici ou plus bas
					self.myY =(-background.x+event.x)/taille--(-background.y+contentcentery)/taille-- constyevent.y/taille-self.y----------------probleme du a taille qui vaut 1 par defaut alors qu'il devrait valoir (?)
					previousTouches = {}
					self.previousTouches = previousTouches
					self.numPreviousTouches = 0
				elseif ( not self.distance ) then
					local dx,dy				
				end
				if not previousTouches[event.id] then
					self.numPreviousTouches = self.numPreviousTouches + 1
				end
				previousTouches[event.id] = event
				--print("init")
		 		
				self.autorisepv=0
				if pouvoirdisp>1 then
					if (pouvoir1.x-event.x)^2+(pouvoir1.y-event.y)^2<(pouvoir2.x-event.x)^2+(pouvoir2.y-event.y)^2 then
					--if (pv1cl.x-event.x)^2+(pv1cl.y-event.y)^2<(pv2cl.x-event.x)^2+(pv2cl.y-event.y)^2 then
						self.pv=1--permet de ssavoir sur quel bouton on a cliquer
						if pv1cl.isVisible==true then
							self.autorisepv=1
							if tuto==2 then
								if tutoaction==12 then
									actionfaite()
								end
							end
						end
					else
						self.pv=2
						if pv2cl.isVisible==true then
							self.autorisepv=1
						end
					end
				else
					self.pv=1
					if pv1cl.isVisible==true then
						self.autorisepv=1
						if tuto==2 then
							if tutoaction==12 then
								actionfaite()
							end
						end
					end
				end
				if self.autorisepv==1  then
					self.deb=true
					
					numtap=0
					self.myX =(-background.x+event.x)/taille--(-background.x+constx-80*apparence)/taille--constx-80*apparence event.x/taille-self.x-- event.x/(taille^0.55)-self.x------------------------------------a modifier ici ou plus bas
					self.myY =(-background.y+event.y)/taille--(-background.y+consty)/taille
					self.x1=(-background.x+event.x)/taille--event.x/taille-self.myX
					self.y1=(-background.y+event.y)/taille--event.y/taille-self.myY
					--print("self.myX"..self.myX.."selfx"..selfx)
					self.xori=self.x1
					self.yori=self.y1
					var=0
					depla=false

				end
				for i=1,5 do
					if pouvoir1action[i]~=nil then
						pouvoir1action[i].isVisible=false
					end
				end
				--print("self.autorisepv"..self.autorisepv)
			end
			if self.isFocus and phase~="began" and self.autorisepv==1 then
				if "moved" == phase then
					depla=true
					if ( self.distance ) then
						local dx,dy			
					else
						var=var+(self.x1-self.xori)*(self.x1-self.xori)+(self.y1-self.yori)*(self.y1-self.yori)
						--print("var"..var)
						self.x1=(-background.x+event.x)/taille--event.x/taille-self.myX
						self.y1=(-background.y+event.y)/taille--event.y/taille-self.myY
						if var>500 then
							if self.pv==1 then
								if self.deb==true then
									if pv1clicactiver==1 then
										pvaction.isVisible=false
										pv1clicactiver=0
										pv1affinter:removeSelf()
										pv1affinter=nil
										Runtime:removeEventListener( "tap",clicpv1)
									end
									
									self.deb=false
								end
								if pv1clicactiver==0 then
									priorite1( )
									backgroundtap()
									pv1clicactiver=1
									clicpv1info=false
									ipv1clic=1--0
									testbugpv1clic=true
									-- pvaction.isVisible=true
									-- pvaction.x=pouvoir2.x
									-- pvaction.y=pouvoir2.y
									pv1clinit()
									if pouvoir1action[pouvoir1cpt]~=nil then
										pouvoir1action[pouvoir1cpt]:removeSelf()
										pouvoir1action[pouvoir1cpt]=nil 
									end
									pouvoir1action[pouvoir1cpt]=display.newImage(imbouton.menupause,11) -- imbouton.pvaction,1)
									if goh then
										pouvoir1action[pouvoir1cpt].xScale=0.23
									else
										pouvoir1action[pouvoir1cpt].xScale=1
									end
									pouvoir1action[pouvoir1cpt].yScale=pouvoir1action[pouvoir1cpt].xScale
									grouppvaction:insert(pouvoir1action[pouvoir1cpt])--group[2048]
								end	
								--else
									--display.newImage("bouton/pouvoir1.png",(-background.x+event.x)/taille,(-background.y+event.y)/taille,true)
									local x=(-background.x+event.x)/taille
									local y=(-background.y+event.y)/taille
									pouvoir1action[pouvoir1cpt].x=x
									pouvoir1action[pouvoir1cpt].y=y
									local self1={}
									self1.x=x
									self1.y=y
									local autorise,x,y=findpv1better(self1)
									-- local autorise=pv1verif(x,y) --

									--print("autorise"..autorise)
									if autorise==1 then
										-- group[2048]:remove(pouvoir1action[pouvoir1cpt])
										-- pouvoir1action[pouvoir1cpt]:removeSelf()
										pv1interditbis.x=pouvoir1action[pouvoir1cpt].x
										pv1interditbis.y=pouvoir1action[pouvoir1cpt].y
										pv1interditbis.isVisible=true
										pv1interdit.x=pouvoir1action[pouvoir1cpt].x
										pv1interdit.y=pouvoir1action[pouvoir1cpt].y
										pv1interdit.isVisible=true
									else
										pv1interdit.isVisible=false
										pv1interditbis.isVisible=false
									end
								--end
							elseif self.pv==2 then
								if self.deb==true then
									if pv2clicactiver==1 then
										pv2clicactiver=0
										pvaction.isVisible=false
										Runtime:removeEventListener( "tap",clicpv2)
									end
									self.deb=false
								end
								if pv2clicactiver==0 then
									--print("init pv2")
									priorite1( )
									backgroundtap()
									ipv2clic=1
									pv2clinit()
									pv2clicactiver=1
									--pvaction.isVisible=true
									if pouvoir2action~=nil then
										display.remove(pouvoir2action)
										-- :removeSelf()
										pouvoir2action=nil 
									end
									pouvoir2action=display.newImage(imbouton.menupause,11) --imbouton.pvaction,1)--display.newImage("bouton/pouvoir2.png",(-background.x+event.x)/taille,(-background.y+event.y)/taille,true)
									if goh then
										pouvoir2action.xScale=0.23
									else
										pouvoir2action.xScale=1
									end
									pouvoir2action.yScale=pouvoir2action.xScale
									grouppvaction:insert(pouvoir2action)--group[2048]
									pvaction.isVisible=true--false
								end
								local x=(-background.x+event.x)/taille
								local y=(-background.y+event.y)/taille
								pouvoir2action.x=x
								pouvoir2action.y=y
							end	
						end
					end
					if not previousTouches[event.id] then
						self.numPreviousTouches = self.numPreviousTouches + 1
					end
					previousTouches[event.id] = event
				elseif "ended" == phase or "cancelled" == phase then
					--print("ended")
					if previousTouches[event.id] then
						self.numPreviousTouches = self.numPreviousTouches - 1
						previousTouches[event.id] = nil
					end

					if ( #previousTouches > 0 ) then
						self.distance = nil
					else
						display.getCurrentStage():setFocus( nil )
					end
						
					--print("var end"..var)
					if var>500 then --if ((self.x-self.myX)^2+(self.y-self.myY)^2)<10000 then
						--print("end move")
						--print("self.myX"..self.myX.."selfx"..selfx)
						if self.pv==1 then
							--print("end pv1")
							if pouvoir1action[pouvoir1cpt]~=nil then
								grouppvaction:remove(pouvoir1action[pouvoir1cpt])--group[2048]
								pouvoir1action[pouvoir1cpt]:removeSelf()
								pouvoir1action[pouvoir1cpt]=nil
							end
							--local autorise=pv1verif((-background.x+event.x)/taille,(-background.y+event.y)/taille)
							local self1={}
							self1.x=(-background.x+event.x)/taille
							self1.y=(-background.y+event.y)/taille
							local autorise
							print("avant test 1 event.x="..event.x.." event.y "..event.y)
							autorise,event.x,event.y=findpv1better(self1)
							event.x=event.x*taille+background.x
							event.y=event.y*taille+background.y
							print("apres test 1 autorise "..autorise.." event.x "..event.x.." event.y "..event.y)
							if autorise==0 then
								if (event.x-pouvoir1.x)^2+(event.y-pouvoir1.y)^2<400 then
									autorise=1
								end
								if autorise==0 and pouvoirdisp>1 then
									if (event.x-pouvoir2.x)^2+(event.y-pouvoir2.y)^2<400 then
										autorise=1
									end
								end
								if autorise==0 and pouvoirdisp>2 then
									if (event.x-pouvoir3.x)^2+(event.y-pouvoir3.y)^2<400 then
										autorise=1
									end
								end
							end
							print("autorise "..autorise)
							--print("autorise"..autorise)
							if autorise==1 then
								pv1cltap()
							else
								clicpv1tap(event)
							end
						elseif self.pv==2 then
							if pouvoir2action~=nil then
								-- grouppvaction:remove(pouvoir2action)--group[2048]
								-- pouvoir2action:removeSelf()
								display.remove(pouvoir2action)
								pouvoir2action=nil
							end
							local autorise=0
							if contreai==1 then
								if ((-background.y+event.y)/taille)>1024*0.3 then
									autorise=1
								end
							end
							if (event.x-pouvoir1.x)^2+(event.y-pouvoir1.y)^2<400 then
								autorise=1
							end
							if autorise==0 and pouvoirdisp>1 then
								if (event.x-pouvoir2.x)^2+(event.y-pouvoir2.y)^2<400 then
									autorise=1
								end
							end
							if autorise==0 and pouvoirdisp>2 then
								if (event.x-pouvoir3.x)^2+(event.y-pouvoir3.y)^2<400 then
									autorise=1
								end
							end
							if autorise==1 then --if (event.x-pouvoir1.x)^2+(event.y-pouvoir1.y)^2<400 or (event.x-pouvoir2.x)^2+(event.y-pouvoir2.y)^2<400 or (event.x-pouvoir3.x)^2+(event.y-pouvoir3.y)^2<400 then
								pv2clicactiver=0
								pvaction.isVisible=false
							else
								clicpv2tap(event)
							end
							--construirearchtap(selfx,selfy,2)
						end
					elseif var<80 then
						if self.pv==1 then
							pv1cltap()
						elseif self.pv==2 then
							pv2cltap()
						end
					end
					--end
					display.getCurrentStage():setFocus( nil )
		       		self.isFocus = false
					--if event.x
				end
			end
			if self.isFocus and phase~="began" and "moved" ~= phase and ( "ended" == phase or "cancelled" == phase) and self.autorisepv==0 then
				--print("ended")
				if previousTouches[event.id] then
					self.numPreviousTouches = self.numPreviousTouches - 1
					previousTouches[event.id] = nil
				end

				if ( #previousTouches > 0 ) then
					self.distance = nil
				else
					display.getCurrentStage():setFocus( nil )
				end
				display.getCurrentStage():setFocus( nil )
		       		self.isFocus = false
			end
			if phase=="cancelled" or phase=="ended" then
				if pv1interdit~=nil then
					pv1interdit.isVisible=false
				end
				if pv1interditbis~=nil then
					pv1interditbis.isVisible=false
				end
			end
				return result

		
		else
			display.getCurrentStage():setFocus( nil )
			self.isFocus=false
			if var>500 then --if ((self.x-self.myX)^2+(self.y-self.myY)^2)<10000 then
				--print("end move")
				--print("self.myX"..self.myX.."selfx"..selfx)
				if self.pv==1 then
					--print("end pv1")
					if pouvoir1action[pouvoir1cpt]~=nil then
						grouppvaction:remove(pouvoir1action[pouvoir1cpt])--group[2048]
						pouvoir1action[pouvoir1cpt]:removeSelf()
					end
					pouvoir1action[pouvoir1cpt]=nil
					pv1clicactiver=0
					pvaction.isVisible=false
				elseif self.pv==2 then
					if pouvoir2action~=nil then
						grouppvaction:remove(pouvoir2action)--group[2048]
						pouvoir2action:removeSelf()
					end
					pouvoir2action=nil
					pv2clicactiver=0
					pvaction.isVisible=false
				end
			end
		end
	end
	--pv1cl:addEventListener( "touch", pv1cl )--pouvoir1
	pouvoir1:addEventListener( "touch", pouvoir1) --pv1cl )
	if pouvoirdisp>1 then
		pouvoir2:addEventListener( "touch", pouvoir1) --pv1cl )
		--pv2cl:addEventListener( "touch", pv1cl )
	end
end
if not functionload then
function desactivpv3( )--desactive les effets du pouvoir 3
	pv3clactif.isVisible=false
	pouvoir3activer=0
		-- for i=1,nbsoldat,1 do
		-- 	if isoldat[i].orientation==0 then
		-- 		if isoldat[i].classe==0 and race==0 then
		-- 			isoldat[i].vitesse=isoldat[i].vitesse-1
		-- 			isoldat[i].attaque=isoldat[i].attaque-10
		-- 		elseif isoldat[i].classe==2 and race==1 then
		-- 			isoldat[i].vitesse=isoldat[i].vitesse-1
		-- 			isoldat[i].charge=isoldat[i].charge-5
		-- 			--isoldat[i].vie=isoldat[i].vietotale
		-- 		elseif isoldat[i].classe==1 and race==2 then
		-- 			isoldat[i].attaque=isoldat[i].attaque-10
		-- 			isoldat[i].agressivite=isoldat[i].agressivite-1
		-- 		end
		-- 	end
		-- end
		-- for i=1,nbbatiment do
		-- 	if ibatiment[i].type1==2 then
		-- 		if ibatiment[i].type2==0 then--archer
		-- 			if race==1 then
		-- 				ibatiment[i].attaque=ibatiment[i].attaque-bonus1
		-- 				ibatiment[i].cadence=ibatiment[i].cadence-bonus2
		-- 				ibatiment[i].vitesse=ibatiment[i].vitesse-bonus3
		-- 			end
		-- 		elseif ibatiment[i].type2==1 then--boulet
		-- 			if race==0 then
		-- 				ibatiment[i].attaque=ibatiment[i].attaque-bonus1
		-- 				ibatiment[i].impact=ibatiment[i].impact-bonus2
		-- 			end
		-- 		else--liquide
		-- 			if race==2 then
		-- 				ibatiment[i].attaque=ibatiment[i].attaque-bonus1
		-- 				ibatiment[i].porte=ibatiment[i].porte-bonus2
		-- 			end
		-- 		end
		-- 	end
		-- end
		local function pv3carrevisible()
			if pv3carre~=nil then
				pv3carre.isVisible=false
			end
		end
		if pv3carre~=nil then
			if pv3carre.isVisible==true then
				local pv3desacttest=function(obj)
					if obj.isVisible then
						obj.alpha=0
						transition.from(obj,{time=600,alpha=0.3,onComplete=pv3carrevisible})
					end
				end
				transition.to(pv3carre,{time=500,alpha=0.3,onComplete=pv3desacttest})
			end
		end
end
end
if pouvoirdisp>2 then
function pv3cl:tap(event)--action lorsqu'on clique sur le pouvoir 3
	--background.x=background.x+20

	clicsurqqcfunc()
	if fenaff==false then
	
		pv3clic=1
		if findelapartie==false then --jeupause.etat==0 and  then
			-- debut retourdinformation
			retinf.pv3nb=retinf.pv3nb+1
			-- fin retourinformation
			pv3cl.isVisible=false
			pv3ch.height=2*200*pouvoir1.xScale
			pv3ch.pv3cpt=0
			priorite1()
			
			pouvoir3activer=1
			pv3clactif.isVisible=true
			pv3carre.isVisible=true
			pv3carre.alpha=0.4
			local pv3carreesthe=function(obj)
				if obj.isVisible then
					print("obj.alpha "..obj.alpha)
					--if obj.alpha==0.4 then
					transition.to(obj,{delay=500,time=1000,alpha=0.2})
				end
			end

			transition.from(pv3carre,{time=500,alpha=0,onComplete=pv3carreesthe})
				-- for i=1,nbsoldat,1 do
				-- 	if isoldat[i].orientation==0 then
				-- 		if isoldat[i].classe==0 and race==0 then
				-- 			isoldat[i].vitesse=isoldat[i].vitesse+1
				-- 			isoldat[i].attaque=isoldat[i].attaque+10
				-- 		elseif isoldat[i].classe==2 and race==1 then
				-- 			isoldat[i].vitesse=isoldat[i].vitesse+1
				-- 			isoldat[i].charge=isoldat[i].charge+5
				-- 			isoldat[i].vie=isoldat[i].vietotale
				-- 		elseif isoldat[i].classe==1 and race==2 then
				-- 			isoldat[i].attaque=isoldat[i].attaque+10
				-- 			isoldat[i].agressivite=isoldat[i].agressivite+1
				-- 		end
				-- 	end
				-- end

				-- for i=1,nbbatiment,1 do
				-- 	if ibatiment[i].type1==2 then
				-- 		if ibatiment[i].type2==0 then--archer
				-- 			if race==1 then
				-- 				ibatiment[i].attaque=ibatiment[i].attaque+bonus1
				-- 				ibatiment[i].cadence=ibatiment[i].cadence+bonus2
				-- 				ibatiment[i].vitesse=ibatiment[i].vitesse+bonus3
				-- 			end
				-- 		elseif ibatiment[i].type2==1 then--boulet
				-- 			if race==0 then
				-- 				ibatiment[i].attaque=ibatiment[i].attaque+bonus1
				-- 				ibatiment[i].impact=ibatiment[i].impact+bonus2
				-- 			end
				-- 		else--liquide
				-- 			if race==2 then
				-- 				ibatiment[i].attaque=ibatiment[i].attaque+bonus1
				-- 				ibatiment[i].porte=ibatiment[i].porte+bonus2
				-- 			end
				-- 		end
				-- 	end
				-- end
			local function finpv31( event )
				jeupause.timerlibre[numtimerpouvoir[6]]=2
				desactivpv3( )
			end
			finpv3=timer.performWithDelay( 10000*vitessejeuin, finpv31 )	
			if numtimerpouvoir[6]==nil then
				numtimerpouvoir[6]=timerpause(1,finpv3,nil)
			else
				local lenum=timerpause(1,finpv3,numtimerpouvoir[6])
			end
			-- jeupause.timer[numtimerpouvoir[6]]=finpv3
			-- jeupause.timerlibre[numtimerpouvoir[6]]=1
		end
		--mettre l'action du pouvoir
		local function pv3clic1( event )
			--print("test")
			pv3clic=0
			--print("pv1clic",pv1clic)
		end
		pv3clic1=timer.performWithDelay( 50, pv3clic1 )
	end
end
	--pouvoir1:addEventListener( "touch", pv3cl )
	pv3cl:addEventListener( "tap", pv3cl )
end
--annuler le pouvoir si on clique sur un autre bouton du pouvoir
if pouvoirdisp>0 then
	function pouvoir1:tap(event)
		clicsurqqcfunc()
		clicpouvoir1=1
		removenbat()
	--	if(enconst==1)then--corrige le probleme uniquement quand on clique pas en meme temps sur pouvoir et valider
	--		removenbat()
	--	end
		local function clicpouvoir11( event )
			clicpouvoir1=0
		end
		clicpouvoir11=timer.performWithDelay( 50, clicpouvoir11 )
		if pv2clicactiver==1 then
			pv2clicactiver=0
			pvaction.isVisible=false
			Runtime:removeEventListener( "tap",clicpv2)
		end
		-- if pv1clicactiver==1 then
		-- 	pvaction.isVisible=false
		-- 	pv1clicactiver=0
		-- 	pv1affinter:removeSelf()
		-- 	Runtime:removeEventListener( "tap",clicpv1)
		-- end
	end
	pouvoir1:addEventListener( "tap", pouvoir1 )
end
if pouvoirdisp>1 then
	function pouvoir2:tap(event)
		clicsurqqcfunc()
		clicpouvoir2=1
		removenbat()
		-- if(enconst==1)then--corrige le probleme uniquement quand on clique pas en meme temps sur pouvoir et valider
		--	removenbat()
		--end
		local function clicpouvoir21( event )
			clicpouvoir2=0
		end
		clicpouvoir21=timer.performWithDelay( 50, clicpouvoir21 )
		if pv1clicactiver==1 then
			pvaction.isVisible=false
			pv1clicactiver=0
			display.remove(pv1affinter)
			-- pv1affinter:removeSelf()
			pv1affinter=nil
			Runtime:removeEventListener( "tap",clicpv1)
			if tuto==2 then
				if tutoaction==13 then
					actiondefaite()
				end
			end
		end
		if pv2clicactiver==1 then
			pv2clicactiver=0
			pvaction.isVisible=false
			Runtime:removeEventListener( "tap",clicpv2)
		end
	end
	pouvoir2:addEventListener( "tap", pouvoir2 )
end
if pouvoirdisp>2 then
	function pouvoir3:tap(event)
		clicsurqqcfunc()
		if grdrap~=nil then
			group[grdrap.group]:remove(grdrap)
			grdrap:removeSelf()
			grdrap=nil
		end
		-- if draptap==1 then
		-- 	group[1]:remove(grdrap)
		-- 	grdrap:removeSelf()
		draptap=0
		-- end
		clicpouvoir3=1
		removenbat()

		--if(enconst==1)then--corrige le probleme uniquement quand on clique pas en meme temps sur pouvoir et valider
		--	removenbat()
		-- end
		local function clicpouvoir21( event )
			clicpouvoir3=0
		end
		clicpouvoir21=timer.performWithDelay( 50, clicpouvoir21 )
		if pv1clicactiver==1 then
			pv1clicactiver=0
			pv1affinter:removeSelf()
			pv1affinter=nil
			Runtime:removeEventListener( "tap",clicpv1)
			if tuto==2 then
				if tutoaction==13 then
					actiondefaite()
				end
			end
		end
		if pv2clicactiver==1 then
			pv2clicactiver=0
			Runtime:removeEventListener( "tap",clicpv2)
		end
		pvaction.isVisible=false
	end

	pouvoir3:addEventListener( "tap", pouvoir3 )
end
end

return(t)