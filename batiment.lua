local batiment={}--gestion du batiment apres qu'il soit construit
if not functionload then
local function notgohtrouverbras(numero)
	local sequenceData1 ={
		{
		    name="bras",
		    frames={1,2,3,1},
		    time=300,
		    loopCount=1
		} ,
		{
		    name="cata1",
		    frames={4,5,6,6,4},
		    time=500,
		    loopCount=1
		},
		{
		    name="cata2",
		    frames={7,8,9,9,7},
		    time=500,
		    loopCount=1
		},
		{
		    name="cata3",
		    frames={10,11,12,12,10},
		    time=500,
		    loopCount=1
		},
		{
		    name="bali",
		    frames={13,14,15,15,13},
		    time=300,
		    loopCount=1
		}
	}
	ibatiment[numero].bras=display.newSprite(imgbat.brascata, sequenceData1 )
	ibatiment[numero].bras.x=ibatiment[numero].xpro+ibatiment[numero].x1
	ibatiment[numero].bras.y=ibatiment[numero].ypro+ibatiment[numero].y1
	ibatiment[numero].bras.xScale=0.15
	ibatiment[numero].bras.yScale=ibatiment[numero].bras.xScale
	ibatiment[numero].bras.numgroup=mathfloor(ibatiment[numero].y1)+12+1024
	group[ibatiment[numero].bras.numgroup]:insert(ibatiment[numero].bras)
end
function gohtrouverbras(numero)
	local valuepause1=0
	local valueplay1=false
	local valueoldframe=nil
	if ibatiment[numero].bras~=nil then
		valuepause1=ibatiment[numero].bras.pause1
		valueplay1=ibatiment[numero].bras.play1
		valueoldframe=ibatiment[numero].bras.oldframe
		display.remove(ibatiment[numero].bras)
	end
	local sequenceData=imgbat.tiranim[ibatiment[numero].type2][ibatiment[numero].niveau].property.seq or {frames={1,1},time=100,loopCount=1}
	ibatiment[numero].bras=display.newSprite(imgbat.tiranim[ibatiment[numero].type2][ibatiment[numero].niveau].sheet,sequenceData)
	-- local xoffset=imgbat.tiranim[ibatiment[numero].type2][ibatiment[numero].niveau].property.x or 0
	-- local yoffset=imgbat.tiranim[ibatiment[numero].type2][ibatiment[numero].niveau].property.y or 0
	ibatiment[numero].bras.anchorX=imgbat.tiranim[ibatiment[numero].type2][ibatiment[numero].niveau].property.anchorX or 0.5
	ibatiment[numero].bras.anchorY=imgbat.tiranim[ibatiment[numero].type2][ibatiment[numero].niveau].property.anchorY or 0.5
	ibatiment[numero].bras.x=ibatiment[numero].xpro+ibatiment[numero].x1--+xoffset
	ibatiment[numero].bras.y=ibatiment[numero].ypro+ibatiment[numero].y1--+yoffset
	ibatiment[numero].bras.xScale=imgbat.tiranim[ibatiment[numero].type2][ibatiment[numero].niveau].property.scale
	ibatiment[numero].bras.yScale=ibatiment[numero].bras.xScale
	ibatiment[numero].bras.numgroup=ibatiment[numero].group+2
	group[ibatiment[numero].bras.numgroup]:insert(ibatiment[numero].bras)
	ibatiment[numero].bras.angle=0
	ibatiment[numero].bras.pause1=valuepause1
	ibatiment[numero].bras.play1=valueplay1
	ibatiment[numero].bras.oldframe=valueoldframe
end
local function animationamelio(frame,object)
	local imgbouton=display.newImage(imbouton.batiment,frame)
	imgbouton.x=object.x
	imgbouton.y=object.y
	imgbouton.xScale=object.xScale
	imgbouton.yScale=object.yScale
	imgbouton.fill.effect = "filter.exposure"
	imgbouton.fill.effect.exposure=0
	background:insert(imgbouton)
	local objecttransition=function(obj)
		display.remove(obj)
		obj=nil
		-- if obj~=nil then
		-- 	background:remove(imgbouton)
		-- 	imgbouton:removeSelf()
		-- 	imgbouton=nil
		-- end
	end
	transition.to(imgbouton,{time=65,rotation=30})
	transition.to(imgbouton,{time=800,x=ibatiment[object.num].x1,y=ibatiment[object.num].y1,transition=easing.inOutCubic})
	transition.to(imgbouton,{delay=600,time=250,alpha=0,xScale=object.xScale*2,yScale=object.yScale*2,transition=easing.outQuad})
	transition.to(imgbouton.fill.effect,{delay=600,time=250,exposure=2,transition=easing.outQuad,onComplete=objecttransition})
	print("affiche image")
end
local batiment_mt = { __index = batiment }
local soldatt=require("soldat")
local batimentbis1=require("batimentbis")
local attbatiment1=require("attbatiment")
local  boutondev1remove=false --si on est entrain de faire disparaitre les boutons
local bpbatdisp=function(obj)
	if boutondev1~=nil then 
		if lignesoldat~=nil then
			for i=1,#lignesoldat do
				boutondev1:remove(lignesoldat[i])
				lignesoldat[i]:removeSelf()
				lignesoldat[i]=nil
			end
			lignesoldat=nil
		end
		boutondev1:removeSelf()
		boutondev1=nil
		nivsup=nil
		vendre=nil
		choixgauche=nil
		choixdroite=nil
		bdrapeau=nil
	end
	boutondev1remove=false
end
function batiment:att(nume,instance3)
	attaquebatiment(nume)
end
local function draptestautorise(event,typedaction,posxbat,posybat,drap)
	local autorise=1
	if typedaction~=nil then
		selfx=typedaction.x
		selfy=typedaction.y
	end
	if selfy+30<mayminuspos2+30 or selfy+30>maypos2-30 or selfx<maxminuspos2+30 or selfx>maxpos2-30 then
		autorise=2
	end
	if modezombie or modepanique then
		if autorise~=2 then
			if ibatiment[drap.num].porte>(selfx-posxbat)*(selfx-posxbat)+(1.25*(selfy-posybat))*(1.25*(selfy-posybat)) then
				autorise=0
				if autorise==0 then
					local i=1
					while i<=obstaclenb do
						if 3000>((selfx-obstacle[i].x)*(selfx-obstacle[i].x)+(selfy+30-obstacle[i].y)*(selfy+30-obstacle[i].y))then
							autorise=1
							i=obstaclenb+1
						end
						i=i+1
					end
				end
				if autorise==0 then
					local i=1
					while i<=obstacle1nb do
						if 20000>((selfx-obstacle1[i].x)*(selfx-obstacle1[i].x)+(selfy+30-obstacle1[i].y)*(selfy+30-obstacle1[i].y))then
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
							if rayon>((selfx-obstacle0[i].x)*(selfx-obstacle0[i].x)+(selfy+30-obstacle0[i].y)*(selfy+30-obstacle0[i].y))then
								autorise=1
								i=obstacle0nb+1
							end
							i=i+1
						end
					end
				end
			end
			print("modezombie")
		else
			autorise=1
		end
	else
		if autorise==1 then
			local i=2
			if not goh then
				while i<=cheminnb do
					local rayonauto=2000
					if chemin[i].rayon~=nil then 
						rayonauto=chemin[i].rayon
					end
					if rayonauto>((selfx-chemin[i].x)*(selfx-chemin[i].x)+(selfy-chemin[i].y+ibatiment[drap.num].pole)*(selfy-chemin[i].y+ibatiment[drap.num].pole))then
						if ibatiment[drap.num].porte>(selfx-posxbat)*(selfx-posxbat)+(1.25*(selfy-posybat))*(1.25*(selfy-posybat)) then
							autorise=0
							i=cheminnb+1
						end
					end
					i=i+1
				end
			else
				while i<=cheminnb do
					local coef=1
					if chemin[i].mechant~=nil and not modepanique then
						if chemin[i].mechant>1 then
							coef=chemin[i].mechant*chemin[i].mechant
						end
					end
					if 400*coef*cheminlargeur>((selfx-chemin[i].x)*(selfx-chemin[i].x)+(selfy-chemin[i].y+ibatiment[drap.num].pole)*(selfy-chemin[i].y+ibatiment[drap.num].pole))then
						if ibatiment[drap.num].porte>(selfx-posxbat)*(selfx-posxbat)+(1.25*(selfy-posybat))*(1.25*(selfy-posybat)) then
							autorise=0
							i=cheminnb+1
						end
					end
					i=i+1
				end
			end
		else
			autorise=1
		end
	end
	return(autorise)
end
local function drapeauinit(numero)
	local distmin=(chemin[2].x-ibatiment[numero].x1)^2+(chemin[2].y+ibatiment[numero].pole-ibatiment[numero].y1)^2
	local chemini=2
	for i=3,cheminnb,1 do
		local dist1=(chemin[i].x-ibatiment[numero].x1)^2+(chemin[i].y+ibatiment[numero].pole-ibatiment[numero].y1)^2
		if(distmin> dist1) then
			distmin=dist1
			chemini=i
		end
	end
	ibatiment[numero].drap.x=chemin[chemini].x
	ibatiment[numero].drap.y=chemin[chemini].y+ibatiment[numero].pole
	if (chemin[chemini].x-ibatiment[numero].x1)^2+(chemin[chemini].y-ibatiment[numero].y1)^2<=1500 then -- recherche un point qui repond au critere (pas derriere un batiment)
		local trouverpos=false
		local dirchx=1
		local dirchy=0
		local direct=-1
		local largeur=1
		local largfai=0
		local largfin=0
		local testcoor={}
		testcoor.x=chemin[chemini].x
		testcoor.y=chemin[chemini].y
		local trouverpos=false
		local distancemin=-1
		local ix,iy
		while largeur<5 do --not trouverpos and 
			largfai=0
			largfin=largfin+1
			if largfin>=2 then
				largfin=0
				largeur=largeur+1
			end
			direct=direct+1
			if direct>=4 then
				direct=0
			end
			if direct==0 then
				dirchx=1
				dirchy=0
			elseif direct==1 then
				dirchx=0
				dirchy=1
			elseif direct==2 then
				dirchx=-1
				dirchy=0
			elseif direct==3 then
				dirchx=0
				dirchy=-1
			end
			while largfai<=largeur do-- and not trouverpos do
				largfai=largfai+1
				testcoor.x=testcoor.x+7*dirchx*largfai
				testcoor.y=testcoor.y+7*dirchy*largfai
				local autorise1=true
				if (testcoor.x-(ibatiment[numero].x1+ibatiment[numero].xbase))^2+(1.25*(testcoor.y-(ibatiment[numero].y1+ibatiment[numero].ybase)))^2>ibatiment[numero].porte*0.95 then
					autorise1=false
				end
				if (testcoor.x-ibatiment[numero].x1)^2+(testcoor.y-ibatiment[numero].y1)^2<=1500*1.15 then
					autorise1=false
				end
				local itrouver=-1
				local mindistpoint=-1
				if autorise1 then
					local i=2
					while i<cheminnb do
						local rayonauto=2000
						if chemin[i].rayon~=nil then 
							rayonauto=chemin[i].rayon
						end
						local distcalc =((testcoor.x-chemin[i].x)*(testcoor.x-chemin[i].x)+(testcoor.y-chemin[i].y+ibatiment[numero].pole)*(testcoor.y-chemin[i].y+ibatiment[numero].pole))
						if rayonauto>distcalc and (distcalc<distancemin or distancemin==-1) then
							itrouver=i
							distancemin=distcalc
							print("itrouver(1) "..distcalc.." ")
							ix=testcoor.x
							iy=testcoor.y
						end
						i=i+1
					end
					if itrouver==-1 then
						autorise1=false
					end
				end
				if autorise1 then
				 	trouverpos=true
				end
			end
		end
		if trouverpos then
			ibatiment[numero].drap.x=ix--testcoor.x
			ibatiment[numero].drap.y=iy+ibatiment[numero].pole --testcoor.y+ibatiment[numero].pole
		end
	end
end
if not functionload then
	if true then
		solenmov=false
		local var,xori,yori,self,numerobat,soldrap,solcercle,drapeau1,soldrapold
		local self1={}
		local selfori={}
		local compteuropt=0
		function removesoldrap()
			if soldrap~=nil then
				group[soldrap.group]:remove(soldrap)
				soldrap:removeSelf()
				soldrap=nil
			end
		end
		function soldatdeplacer(event,self)--test de function
				if "began" ==event.phase and not fenaff then --and not generalenmov then
					var=0
					self1.x=self.x
					self1.y=self.y
					selfori.x=self.x
					selfori.y=self.y
					numerobat=isoldat[event.target.id].numbat
					self1.num=numerobat
					clicsurqqcfunc()
					if(enconst==1)then--corrige le probleme uniquement quand on clique pas en meme temps sur pouvoir et valider
						removenbat()
					end
					geneclic1=timer.performWithDelay( 50,geneclic1 )
					if fenaff==false and  clicpause==0 and pv1clic==0 and pv2clic==0 and pv3clic==0 and clicconstruire==0 and clicinfanterie==0 and clicarcher==0 and clicpouvoir1==0 and clicpouvoir2==0 and clicpouvoir3==0 and pv2clicactiver==0 and pv1clicactiver==0 and boutondev==0 and drapeausolclic==0 then 
						var=0
						self1.x=self.x
						self1.y=self.y
					end
				elseif "moved" ==event.phase and not fenaff then --and generalenmov then
					var=var+(event.x-event.xStart)^2+(event.x-event.yStart)^2
					if var>=500 and soldrap==nil then
						hideConstrucButton()
						soldrap=display.newGroup()
						soldrap.group=2048
						group[soldrap.group]:insert(soldrap)
						solcercle=display.newCircle(ibatiment[numerobat].x1+ibatiment[numerobat].xbase,(ibatiment[numerobat].y1+ibatiment[numerobat].pole+ibatiment[numerobat].ybase),mathsqrt(ibatiment[numerobat].porte)*0.95)--cercle=display.newCircle(event.target.x,event.target.y,mathsqrt(ibatiment[event.target.num].porte))
						solcercle.yScale=0.80
						solcercle:setStrokeColor(0,0.5,0,0.8)
						solcercle:setFillColor(0,0,0,0.1)
						solcercle.strokeWidth = 2
						soldrap:insert(solcercle)
						transition.from(solcercle,{time=500,transition=easing.outBack,xScale=solcercle.xScale*0.1,yScale=solcercle.xScale*0.1})
						drapeau1=display.newImage(imbouton.batiment,9)
						drapeau1.x=self1.x
						drapeau1.y=self1.y
						if not goh then
							drapeau1.xScale=0.15
						else
							drapeau1.xScale=0.09
						end
						drapeau1.yScale=drapeau1.xScale
						soldrap:insert(drapeau1)
						soldrapold=display.newImage(imbouton.batiment,9)
						soldrapold.x=ibatiment[numerobat].drap.x
						soldrapold.y=ibatiment[numerobat].drap.y
						if not goh then
							soldrapold.xScale=0.15*apparence
						else
							soldrapold.xScale=0.09*apparence
						end
						soldrapold.yScale=soldrapold.xScale
						soldrapold.alpha=0.5
						soldrap:insert(soldrapold)
					end
					if soldrap~=nil then
						self1.x =selfori.x+(event.x-event.xStart)/taille
						self1.y =selfori.y+(event.y-event.yStart)/taille
						local autorise=draptestautorise(event,self1,(ibatiment[numerobat].x1+ibatiment[numerobat].xbase),(ibatiment[numerobat].y1+ibatiment[numerobat].pole+ibatiment[numerobat].ybase),self1)
						if autorise==0 then
							drapeau1.x=self1.x
							drapeau1.y=self1.y
						else
							compteuropt=compteuropt+1
							if compteuropt>2 then
								compteuropt=0
								local xdirec=1
								if drapeau1.x>self1.x then
									xdirec=-1
								end
								local ydirec=1
								if drapeau1.x>self1.y then
									ydirec=-1
								end
								local distancemin=(self1.x-drapeau1.x)*(self1.x-drapeau1.x)+(self1.y-drapeau1.y)*(self1.y-drapeau1.y)
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
									testposbat.num=numerobat
									local i=limitex1carre
									local varrandx=mathfloor(mathabs(limitex1carre-limitex2carre)*0.1)
									if varrandx<1 then
										varrandx=1
									end
									local varrandy=mathfloor(mathabs(limitey1carre-limitey2carre)*0.1)
									if varrandy<1 then
										varrandy=1
									end
									while i*xdirec<limitex2carre*(xdirec) do
										testposbat.x=i
										local j=limitey1carre
										while j*ydirec<limitey2carre*(ydirec) do
											testposbat.y=j
											local autorise1=draptestautorise(event,testposbat,(ibatiment[numerobat].x1+ibatiment[numerobat].xbase),(ibatiment[numerobat].y1+ibatiment[numerobat].pole+ibatiment[numerobat].ybase),testposbat)
											if autorise1==0 then
												local distancemintest=(self1.x-testposbat.x)*(self1.x-testposbat.x)+(self1.y-testposbat.y)*(self1.y-testposbat.y)
												if distancemin>distancemintest then
													distancemin=distancemintest
													ancienxvalide=testposbat.x
													ancienyvalide=testposbat.y
												end
											end
											j=j+varrandy*ydirec
										end
										i=i+varrandx*(xdirec)
									end
									drapeau1.x=ancienxvalide
									drapeau1.y=ancienyvalide
								end
							end
						end
					end
				elseif soldrap~=nil then
					ibatiment[numerobat].drap.x=drapeau1.x
					ibatiment[numerobat].drap.y=drapeau1.y
					for k=nbsoldatg,0 do
						if isoldat[k].numbat==numerobat then
							if isoldat[k].vivant then
								if mathsqrt(((drapeau1.x+isoldat[k].xposi-isoldat[k].x1)^2+(drapeau1.y+isoldat[k].yposi-isoldat[k].y1)^2))>60 then
									if isoldat[k].encombat==1 then
										isoldat[k].vivant=false
										isoldat[k].endeplacement=1
									end
								end
							end
						end
					end
					if soldrap~=nil then
						transition.to(solcercle,{time=500,transition=easing.outBack,xScale=solcercle.xScale*0.1,yScale=solcercle.xScale*0.1})
						local function soldraptimer(event)
							removesoldrap()
						end
						timer.performWithDelay(400,soldraptimer)
					end
				end
		end
	end
function finmiseajourevol(numero,dev)--fin de l'animation du devellopement du batiment
	if ibatiment[numero].type1==1 or (modearmy and ibatiment[numero].type1==2) then
		--resolution du problem lorsqu'on devellope le batiment et que le point de raliment des soldats est en dehors du cercle
		if ibatiment[numero].niveau~=1 and (ibatiment[numero].drap.x-(ibatiment[numero].x1+ibatiment[numero].xbase))^2+(1.25*(ibatiment[numero].drap.y-(ibatiment[numero].y1+ibatiment[numero].ybase)))^2>ibatiment[numero].porte then
			drapeauinit(numero)
		end
		if not modearmy then
			gerergenerersoldat(numero,ibatiment[numero].niveau)
		end	
	end
end
function miseajourvalevol(numero,statistique)--mise a jour d'information lorsque le batiment est a mitié fini d'etre develloper
	if ibatiment[numero].pv3==true then
		group[ibatiment[numero].bandepv3gr]:remove(ibatiment[numero].bandepv3)
		ibatiment[numero].bandepv3:removeSelf()
	end
	ibatiment[numero].pv3=false
	--debut retourdinformation
		ibatiment[numero].heure=gettime()
		if ibatiment[numero].vieenlevertt==nil then
			ibatiment[numero].vieenlevertt=0
			ibatiment[numero].heuredeb=ibatiment[numero].heure
		else
			ibatiment[numero].vieenlevertt=ibatiment[numero].vieenlevertt+ibatiment[numero].vieenlever
		end
		ibatiment[numero].vieenlever=0
		retinfordredecreanb=retinfordredecreanb+1
		if retinf.ordredecrea=="{" then
			--retinf.ordredecrea=retinf.ordredecrea..[["]]retinfordredecreanb[["{"id":"]]..numero..[[",value":"]]..ibatiment[numero].type1..ibatiment[numero].type2..ibatiment[numero].niveau..[["}]]
		else
			retinf.ordredecrea=retinf.ordredecrea..[[,]] --"]]..numero.." "..ibatiment[numero].type1..ibatiment[numero].type2..ibatiment[numero].niveau..[["]]
		end
		retinf.ordredecrea=retinf.ordredecrea..[["]]..retinfordredecreanb..[[":{"id":"]]..numero..[[","value":"]]..ibatiment[numero].type1..ibatiment[numero].type2..ibatiment[numero].niveau..[["}]]
		if issimulator then
			local loadsave = require("loadsave")
			loadsave.print_r (retinf.ordredecrea)
		end
	-- fin retourdinformation
	ibatiment[numero].numsolarmy=1
	if ibatiment[numero].type1==1 then--contact
		ibatiment[numero].cadence=2000--permet d'afficher une baniere quand le bat a son pv3 actif

		if ibatiment[numero].type2==0 then--infanterie
			if ibatiment[numero].niveau==1 then
				-- debut retourdinformation
					--retinf.ordredecrea=retinf.ordredecrea.." x"..ibatiment[numero].x.." y"..ibatiment[numero].y
				-- fin retourinformation
				ibatiment[numero].message=texttraduction.batiment[1] --"Barrack"
				ibatiment[numero].porte=10000 -- si modifier aussi modifer au donnée init a developement1 (un peu plus bas)
				ibatiment[numero].nbunit=2
				ibatiment[numero].armyt=45
			elseif ibatiment[numero].niveau==2 then
				ibatiment[numero].message=texttraduction.batiment[2] --"Fort"
				ibatiment[numero].porte=12000
				ibatiment[numero].nbunit=3
				ibatiment[numero].armyt=30
			elseif ibatiment[numero].niveau==3 then
				ibatiment[numero].message=texttraduction.batiment[3] --"Fortress"
				ibatiment[numero].porte=13500
				ibatiment[numero].nbunit=3
				ibatiment[numero].armyt=30
			elseif ibatiment[numero].niveau==4 then
				ibatiment[numero].message=texttraduction.batiment[4] --"Castle"
				ibatiment[numero].porte=15500
				ibatiment[numero].nbunit=4
				ibatiment[numero].nbunittotal=ibatiment[numero].nbunit
				ibatiment[numero].armyt=22
			end
		elseif ibatiment[numero].type2==1 then--geant
			if ibatiment[numero].niveau==2 then
				ibatiment[numero].message=texttraduction.batiment[5] --"Cave"
				ibatiment[numero].porte=10000
				ibatiment[numero].nbunit=1
				ibatiment[numero].armyt=90
			elseif ibatiment[numero].niveau==3 then
				ibatiment[numero].message=texttraduction.batiment[6] --"Cavern"
				ibatiment[numero].porte=10000
				ibatiment[numero].nbunit=1
				ibatiment[numero].armyt=90
			elseif ibatiment[numero].niveau==4 then
				ibatiment[numero].message=texttraduction.batiment[7] --"Antrum"
				ibatiment[numero].porte=11000
				ibatiment[numero].nbunit=2
				ibatiment[numero].nbunittotal=ibatiment[numero].nbunit
				ibatiment[numero].armyt=45
			end
		elseif ibatiment[numero].type2==2 then--cavalerie
			if ibatiment[numero].niveau==2 then
				ibatiment[numero].message=texttraduction.batiment[8] --"Farm"
				ibatiment[numero].porte=70000
				ibatiment[numero].nbunit=1
				ibatiment[numero].armyt=90
			elseif ibatiment[numero].niveau==3 then
				ibatiment[numero].message=texttraduction.batiment[9] --"Stable"
				ibatiment[numero].porte=80000
				ibatiment[numero].nbunit=2
				ibatiment[numero].armyt=45
			elseif ibatiment[numero].niveau==4 then
				ibatiment[numero].message=texttraduction.batiment[10] --"Paladin"
				ibatiment[numero].porte=90000
				ibatiment[numero].nbunit=2
				ibatiment[numero].nbunittotal=ibatiment[numero].nbunit
				ibatiment[numero].armyt=45
			end
		end
		ibatiment[numero].armyt=ibatiment[numero].armyt*2
	elseif ibatiment[numero].type1==2 then----tir--manipuler porter distance et vitesse avec precaution!!------
		ibatiment[numero].nbunit=2
		if ibatiment[numero].type2==0 then--archer--les variables inchanger sont conserver lors d'une evolution
			if ibatiment[numero].niveau==1 then
				local zone1bis=(ibatiment[numero].y1)/619*4 --deux données en une
				local zone1y=mathfloor(zone1bis*0.5)+2
				local zone2y=mathfloor((zone1bis)*0.5+0.5)+2
				zone1bis=(ibatiment[numero].x1)/1229*6 --deux données en une
				local zone1x=mathfloor(zone1bis*0.5)+2
				local zone2x=mathfloor((zone1bis)*0.5+0.5)+2
				ibatiment[numero].zone1=zone1y*3+zone1x
				ibatiment[numero].zone2=zone2y*3+zone2x
				-- debut retourdinformation
				--retinf.ordredecrea=retinf.ordredecrea.." x"..ibatiment[numero].x.." y"..ibatiment[numero].y
				-- fin retourdinformation
				--print("init value type1=2,type2=0,n=1 :"..numero)
				if goh then
					ibatiment[numero].attaque=23
				else
					ibatiment[numero].attaque=17
				end
				ibatiment[numero].porte=20000
				if goh then
					ibatiment[numero].cadence=3000--40
				else
					ibatiment[numero].cadence=2500
				end
				ibatiment[numero].armyt=2000/ibatiment[numero].cadence*400
				ibatiment[numero].vitesse=1
				ibatiment[numero].impact=0
				ibatiment[numero].nbfleche=1--3
				ibatiment[numero].fleche={}
				ibatiment[numero].flecheinf={}
				ibatiment[numero].message=texttraduction.batiment[11] --"Watchtower"
				if statistique==nil then
				for i=1,ibatiment[numero].nbfleche,1 do--remettre ce bloc au cas ou on augmente le nombre de projectile
					ibatiment[numero].fleche[i]=0
				end
				if not goh then
					ibatiment[numero].ypro=-21
					ibatiment[numero].xpro=-1
				else
					ibatiment[numero].ypro=-23
					ibatiment[numero].xpro=0
				end
				if not goh then
					notgohtrouverbras(numero)
				else
					gohtrouverbras(numero)
				end

				ibatiment[numero].bras.angle=0
				ibatiment[numero].bras.pause1=0
				ibatiment[numero].bras.play1=false
				ibatiment[numero].bras.oldframe=nil
				-- local function animtirbatbras( event )
				-- 	if ibatiment[numero].sup1~=1 then	
				-- 		if ibatiment[numero].bras.play1==true then
				-- 			if jeupause.etat==1 then--technique numero 3 de mise en pause(plus de probleme avec les processeurs mtk et probleme de deferencement)
				-- 				if ibatiment[numero].bras.pause1==0 then
				-- 					ibatiment[numero].bras.pause1=1
				-- 					ibatiment[numero].bras:pause()
				-- 				end
				-- 			else
				-- 				if ibatiment[numero].bras.pause1==1 then
				-- 					ibatiment[numero].bras.pause1=0
				-- 					ibatiment[numero].bras:play()
				-- 				end
				-- 				if ibatiment[numero].bras.frame==4 and ibatiment[numero].bras.oldframe~=4 then
				-- 					ibatiment[numero].bras.oldframe=4
				-- 					ibatiment[numero].bras.play1=false
				-- 					print("ibatiment.attaque "..ibatiment[numero].attaque)
				-- 					demandepro(1,numero,ibatiment[numero].x1+ibatiment[numero].xpro,ibatiment[numero].y1+ibatiment[numero].ypro,ibatiment[numero],ibatiment[numero].pole) --,ibatiment[numero].zone1,ibatiment[numero].zone2)
				-- 				else
				-- 					ibatiment[numero].bras.oldframe=nil
				-- 				end
				-- 			end
				-- 		end
				-- 	else
				-- 		Runtime:removeEventListener( "enterFrame",animtirbatbras)
				-- 	end
				-- end
				-- Runtime:addEventListener("enterFrame",animtirbatbras)
				end
			elseif ibatiment[numero].niveau==2 then--fleche
				ibatiment[numero].message=texttraduction.batiment[12] --"Crossbow" 
				if goh then
					ibatiment[numero].attaque=99--63
				else
					ibatiment[numero].attaque=42--5
				end
				ibatiment[numero].porte=30000
				if not goh then
					ibatiment[numero].ypro=-20
					ibatiment[numero].xpro=-4
				else
					ibatiment[numero].ypro=-46
					ibatiment[numero].xpro=0
				end
				if not goh then
					if ibatiment[numero].bras==nil then 
						notgohtrouverbras(numero)
					end
					ibatiment[numero].bras.x=ibatiment[numero].xpro+ibatiment[numero].x1
					ibatiment[numero].bras.y=ibatiment[numero].ypro+ibatiment[numero].y1
				end
				if niveauch==1 and tuto~=0 and not goh then
					ibatiment[numero].attaque=ibatiment[numero].attaque*0.5
					ibatiment[numero].cadence=12000
				end
				if goh then
					ibatiment[numero].cadence=6500--4500
				else
					ibatiment[numero].cadence=6000--1000--40
				end
				ibatiment[numero].armyt=2000/ibatiment[numero].cadence*200
				ibatiment[numero].vitesse=1.2
				local nbflecheancien=ibatiment[numero].nbfleche
				if not goh then
					ibatiment[numero].nbfleche=2
					for i=nbflecheancien,ibatiment[numero].nbfleche,1 do
						ibatiment[numero].fleche[i]=0
					end
				end
				print("numerobat "..numero)
				if niveauch==12 and modenormal and numero==3 then
					if niveau12cercle~=nil then
						if niveau12cercle==1 then
							niveau12cercle=2
							ibatiment[numero].porte=ibatiment[numero].porte*2.8
						else
							niveau12cercle=0
						end
					end
				end
			elseif ibatiment[numero].niveau==3 then
				ibatiment[numero].message=texttraduction.batiment[13] --"Heavy tower"
				ibatiment[numero].porte=40000
				if goh then
					ibatiment[numero].attaque=170--80
					ibatiment[numero].cadence=5000--2500--60
				else
					ibatiment[numero].attaque=48
					ibatiment[numero].cadence=3000--60
				end
				
				ibatiment[numero].armyt=200*2000/ibatiment[numero].cadence
				ibatiment[numero].vitesse=1.3
				if not goh then
					ibatiment[numero].ypro=-21
					ibatiment[numero].xpro=0
				else
					ibatiment[numero].ypro=-55
					ibatiment[numero].xpro=0
				end
				if not goh then
					ibatiment[numero].bras.x=ibatiment[numero].xpro+ibatiment[numero].x1
					ibatiment[numero].bras.y=ibatiment[numero].ypro+ibatiment[numero].y1
				end
				if niveauch==12 and modenormal and numero==3 then
					if niveau12cercle~=nil then
						if niveau12cercle==2 then
							niveau12cercle=3
							ibatiment[numero].porte=ibatiment[numero].porte*2.65
						else
							niveau12cercle=0
						end
					end
				end
			elseif ibatiment[numero].niveau==4 then
				if statistique==nil and not goh then
					ibatiment[numero].bras.xScale=0.2
					ibatiment[numero].bras.yScale=ibatiment[numero].bras.xScale
					ibatiment[numero].ypro=-23
					ibatiment[numero].xpro=0.5
					ibatiment[numero].bras.x=ibatiment[numero].xpro+ibatiment[numero].x1
					ibatiment[numero].bras.y=ibatiment[numero].ypro+ibatiment[numero].y1
				end
				ibatiment[numero].message=texttraduction.batiment[14] --"Ballista"
				ibatiment[numero].porte=50000
				if goh then
					ibatiment[numero].attaque=200 --95
					ibatiment[numero].cadence=8000--4000--90
				else
					ibatiment[numero].attaque=63
					ibatiment[numero].cadence=4000--90
				end
				if goh then
					ibatiment[numero].ypro=-67
					ibatiment[numero].xpro=0
				end
				ibatiment[numero].armyt=2000/ibatiment[numero].cadence*132
				ibatiment[numero].vitesse=1.4
				local nbflecheancien=ibatiment[numero].nbfleche
				if goh then
					ibatiment[numero].nbfleche=2
				else
					ibatiment[numero].nbfleche=3
				end
				for i=nbflecheancien,ibatiment[numero].nbfleche,1 do
					ibatiment[numero].fleche[i]=0
				end
				if niveauch==12 and modenormal and numero==3 then
					if niveau12cercle~=nil then
						if niveau12cercle==3 then
							niveau12cercle=0
							ibatiment[numero].porte=ibatiment[numero].porte*2.5
						else
							niveau12cercle=0
						end
					end
				end
			end
			if race==1 and not issimulator then
				ibatiment[numero].porte=ibatiment[numero].porte*1.1
				ibatiment[numero].attaque=ibatiment[numero].attaque*1.1
			end
		elseif ibatiment[numero].type2==1 then----boulet
			if ibatiment[numero].niveau==2 then
				ibatiment[numero].nbfleche=1
				if statistique==nil and not goh then
					ibatiment[numero].ypro=-27
					ibatiment[numero].xpro=0
					if ibatiment[numero].bras==nil then
						notgohtrouverbras(numero)
					end
					ibatiment[numero].bras.xScale=ibatiment[numero].xScale
					ibatiment[numero].bras.yScale=ibatiment[numero].yScale
					ibatiment[numero].bras.x=ibatiment[numero].xpro+ibatiment[numero].x1+1
					ibatiment[numero].bras.y=ibatiment[numero].ypro+ibatiment[numero].y1+3
				end
				if goh then
					ibatiment[numero].ypro=-55
					ibatiment[numero].xpro=3
				end
				ibatiment[numero].message=texttraduction.batiment[15] --"Catapult"
				ibatiment[numero].porte=20000
				ibatiment[numero].attaque=35
				ibatiment[numero].cadence=2000--29
				ibatiment[numero].armyt=2000/ibatiment[numero].cadence*400
				ibatiment[numero].vitesse=0.75
				ibatiment[numero].impact=20.5
			elseif ibatiment[numero].niveau==3 then
				if statistique==nil and not goh then
					ibatiment[numero].bras.xScale=ibatiment[numero].xScale
					ibatiment[numero].bras.yScale=ibatiment[numero].yScale
					ibatiment[numero].bras.x=ibatiment[numero].xpro+ibatiment[numero].x1
					ibatiment[numero].bras.y=ibatiment[numero].ypro+ibatiment[numero].y1-2
				end
				ibatiment[numero].message=texttraduction.batiment[16] --"Onager"
				ibatiment[numero].porte=30000
				ibatiment[numero].attaque=45
				ibatiment[numero].cadence=2000--37
				ibatiment[numero].armyt=2000/ibatiment[numero].cadence*400
				ibatiment[numero].vitesse=0.75
				ibatiment[numero].impact=24
			elseif ibatiment[numero].niveau==4 then
				if statistique==nil and not goh then
					ibatiment[numero].bras.xScale=ibatiment[numero].xScale
					ibatiment[numero].bras.yScale=ibatiment[numero].yScale
					ibatiment[numero].bras.x=ibatiment[numero].xpro+ibatiment[numero].x1
					ibatiment[numero].bras.y=ibatiment[numero].ypro+ibatiment[numero].y1+2
				end
				if goh then
					ibatiment[numero].ypro=-60
					ibatiment[numero].xpro=3
				end
				ibatiment[numero].message=texttraduction.batiment[17] --"Trebuchet"
				ibatiment[numero].porte=40000
				ibatiment[numero].attaque=59
				ibatiment[numero].cadence=2500--40
				ibatiment[numero].armyt=2000/(ibatiment[numero].cadence)*400
				ibatiment[numero].vitesse=0.8
				ibatiment[numero].impact=29.7
			end
			if race==0 and not issimulator then
				ibatiment[numero].porte=ibatiment[numero].porte*1.1
				ibatiment[numero].attaque=ibatiment[numero].attaque*1.1
			end
		elseif ibatiment[numero].type2==2 then--lave
			ibatiment[numero].attaquencours=0
			if ibatiment[numero].niveau==2 then
				ibatiment[numero].nbfleche=1
				ibatiment[numero].message=texttraduction.batiment[18] --"Hot water"
				ibatiment[numero].porte=12000
				ibatiment[numero].attaque=45*0.4 --45*0.4 --13 -- duree d'anim 3000+500 entre tir attaque pendant 0.73 du temps 0.3 sec att 0.3 + att   pd 3500 att=0, pd 2200 att=13+13/3*2200/300=45 donc attsec=45/(2200+3500)*1000=7.9
				ibatiment[numero].cadence=2000 -- 3000+500 +2200(att)=5700 *attsec=45
				ibatiment[numero].armyt=2000/ibatiment[numero].cadence*30
				ibatiment[numero].vitesse=1
				ibatiment[numero].dureeliq=2200*2
				if not goh then
					ibatiment[numero].ypro=-20.5
					ibatiment[numero].xpro=0.5
				else
					ibatiment[numero].ypro=-51.8
					ibatiment[numero].xpro=0
				end
			elseif ibatiment[numero].niveau==3 then
				ibatiment[numero].message=texttraduction.batiment[19] --"Lava"
				ibatiment[numero].porte=15000
				ibatiment[numero].attaque=67*0.4 --67*0.4-- 19 --modifier ici mettre le nombre que tu veux. De meme pour les autres niveaux -------------------------------------------------------------------------------------------------------------
				ibatiment[numero].cadence=2000   -- pd 2350 att=19+19/3*2350/300=67 attsec=11.5
				ibatiment[numero].armyt=2000/ibatiment[numero].cadence*30
				ibatiment[numero].vitesse=1 
				ibatiment[numero].dureeliq=2350*2
				if not goh then
					ibatiment[numero].ypro=-4.4
					ibatiment[numero].xpro=7.1
				else
					ibatiment[numero].ypro=-15
					ibatiment[numero].xpro=2.5
				end
			elseif ibatiment[numero].niveau==4 then
				ibatiment[numero].message=texttraduction.batiment[20] --"Acid"
				ibatiment[numero].porte=19000
				ibatiment[numero].attaque=241*0.5*0.4 --241*0.5*0.4 --33
				ibatiment[numero].cadence=2000 -- pd 2600 att=128 attsec=21.0
				ibatiment[numero].armyt=2000/ibatiment[numero].cadence*30
				ibatiment[numero].vitesse=1
				ibatiment[numero].dureeliq=8000 --2600
				if not goh then
					ibatiment[numero].ypro=0
					ibatiment[numero].xpro=0
				else
					ibatiment[numero].ypro=-56
					ibatiment[numero].xpro=2.5
				end
			end
			if race==2 and not issimulator then
				ibatiment[numero].porte=ibatiment[numero].porte*1.1
				ibatiment[numero].attaque=ibatiment[numero].attaque*1.1
			end
			--if ibatiment[numero].niveau==2 then
			installationpique(numero)
			--end
		end
		ibatiment[numero].cadence=ibatiment[numero].cadence*cadencegent

	elseif ibatiment[numero].type1==3 then
		if statistique==nil then
			--print("evolution argentsec")
		end
		ibatiment[numero].message=texttraduction.batiment[21] --"Abandoned mine"
		if ibatiment[numero].niveau==2 then
			ibatiment[numero].message=texttraduction.batiment[22] --"Mine"
			ibatiment[numero].argentsec=4--doit etre un multiple de 4
		elseif ibatiment[numero].niveau==3 then
			ibatiment[numero].message=texttraduction.batiment[23] --"Goblin mine"
			isoldat[ibatiment[numero].numsol].vie=isoldat[ibatiment[numero].numsol].vie+150
			isoldat[ibatiment[numero].numsol].vietotale=250
			ibatiment[numero].argentsec=8
		elseif ibatiment[numero].niveau==4 then
			ibatiment[numero].message=texttraduction.batiment[24] --"Dwarf mine"
			isoldat[ibatiment[numero].numsol].vie=isoldat[ibatiment[numero].numsol].vie+350
			isoldat[ibatiment[numero].numsol].vietotale=600
			ibatiment[numero].argentsec=12
		end
	end
	ibatiment[numero].attsec=attaquebatsec[race+1][ibatiment[numero].type1][ibatiment[numero].type2+1][ibatiment[numero].niveau]
	ibatiment[numero].typebat=ibatiment[numero].type1*3*5+(ibatiment[numero].type2)*5+ibatiment[numero].niveau-15
	if savegameall.bonusbatiment[ibatiment[numero].typebat]~=nil then
		for i=1,#savegameall.bonusbatiment.tableau[ibatiment[numero].type1] do
			if savegameall.bonusbatiment[ibatiment[numero].typebat][savegameall.bonusbatiment.tableau[ibatiment[numero].type1][i]]~=nil then
				local nbflecheancien
				if savegameall.bonusbatiment.tableau[ibatiment[numero].type1][i]=="nbfleche" then
					nbflecheancien=ibatiment[numero].nbfleche
				end
				ibatiment[numero][savegameall.bonusbatiment.tableau[ibatiment[numero].type1][i]]=(ibatiment[numero][savegameall.bonusbatiment.tableau[ibatiment[numero].type1][i]] or 1) + (savegameall.bonusbatiment[ibatiment[numero].typebat][savegameall.bonusbatiment.tableau[ibatiment[numero].type1][i]] or 0)
				if savegameall.bonusbatiment.tableau[ibatiment[numero].type1][i]=="nbfleche" then
					for j=nbflecheancien,ibatiment[numero].nbfleche,1 do
						ibatiment[numero].fleche[j]=0
					end
				end
			end
		end
	end
	if ibatiment[numero].type1==3 then
		if multi~=0 then
			ibatiment[numero].argentsec=2*ibatiment[numero].argentsec
		elseif modeinfini==true then
			ibatiment[numero].argentsec=mathfloor(0.25*ibatiment[numero].argentsec)
		end
		ibatiment[numero].argentsec=mathfloor(ibatiment[numero].argentsec/dureepartie*mineimpact)*varminerevcorrectdif
		if ibatiment[numero].argentsec==0 then
			ibatiment[numero].argentsec=1
		end
	else
		ibatiment[numero].armyt=ibatiment[numero].armyt*0.3
		ibatiment[numero].armytt=ibatiment[numero].numsolarmy+ibatiment[numero].armyt*0.8
	end
	if numero==affinfotab.num and affinfotab.type==1 and removepartiel1==false and affinfogr.isVisible then
		affinfo(numero,false)
	end

end
function evolution(numero,dev,vitessedanim)--demande de devellopement du batiment -- non local
	--0 pour niveau superieur, 1 pour collone gauche et 2 pour droite
	if (dev==0)then
		ibatiment[numero].niveau=ibatiment[numero].niveau+1
	end
	if(dev==1)then
		ibatiment[numero].niveau=ibatiment[numero].niveau+1
		ibatiment[numero].type2=1
	end
	if(dev==2)then
		ibatiment[numero].niveau=ibatiment[numero].niveau+1
		ibatiment[numero].type2=2
	end
	local animconst = require ( "constructanim" )
	if ibatiment[numero].type1==2 and dev<3 then
		ibatiment[numero].sup=1
	end
	if affinfotab.type==1 and affinfotab.num==numero and dev~=3 and affinfogr.isVisible then
		affinfo(numero,false)
	end
	if dev<3 then
		constructionanim(ibatiment[numero],0,vitessedanim)
	end
end

function pasassezfric()--animation lorsqu'il manque de l'argent pour la faire
	if tunemanque==false then
		tunemanque=true
		local tunexscale=tune.xScale
		transition.to(tune,{time=500,transition=easing.inOutBack,x=tune.x1-60})
		transition.to(tune,{time=500,transition=easing.inOutBack,y=tune.y1+10,xScale=tune.xScale*2,yScale=tune.yScale*2,delay=500})
		transition.to(tune,{time=500,transition=easing.inOutBack,y=tune.y1,xScale=tunexscale,yScale=tunexscale,delay=1000})
		transition.to(tune,{time=400,transition=easing.inOutQuint,x=tune.x1,delay=1500})
		tune:setFillColor( 1, 0, 0 )
		local k=0 
		local pair=0   	
		local function listener( event )
			if k<4 then
				if pair==0 then
					pair=1
					tune:setFillColor(0.8, 0.8, 0 )
				else
					pair=0
					tune:setFillColor( 1, 0, 0 )
				end
				k=k+1
				timer.performWithDelay( 400, listener )
			else
				tunemanque=false
				tune:setFillColor(0.8, 0.8, 0 )
			end
		end
		timer.performWithDelay( 400, listener )
	end
end
end
local function argentdev(numero,dev)--verifiaction si on a assez d'argent pour effectuer le devellopement
	--tout modification doivent etre aussi faite dans creation
	local prix1=0
	if dev==0 then
		prix1=prix[ibatiment[numero].type1][ibatiment[numero].type2][ibatiment[numero].niveau+1]
	else
		if dev==1 then
			prix1=prix[ibatiment[numero].type1][1][ibatiment[numero].niveau+1]
		else
			if dev==2 then
				prix1=prix[ibatiment[numero].type1][2][ibatiment[numero].niveau+1]
			end
		end
	end
	if ibatiment[numero].type1==3 then
		if modeinfini==true then
			prix1=prix1*2
		end
	end
	if argent-(-(prix1)*3)<=0 then
		argent=argent-(-(prix1)*3)
		vartune()
		evolution(numero,dev)
	else
		pasassezfric()
	end
end	

local function init(lebatiment,typebatiment,numbatiment)--creation du batiment(se passe a la moitié de l'animation de constructionn)
	local tbatiment={}--tableau contenant tout les variable definisant un batiment
	tbatiment.niveau=1
	tbatiment.type2=0
	tbatiment.type1=typebatiment
	tbatiment.num=numbatiment
	tbatiment.bat=lebatiment
	tbatiment.endev=0
	tbatiment.attaque=5
	if typebatiment==1  or (modearmy and typebatiment==2) then
		ibatiment[numbatiment].drap=display.newImage(imbouton.batiment,9) -- imbouton.drapeau,1)--display.newImage("bouton/drapeau.png",chemin[chemini].x,chemin[chemini].y)
		if ibatiment[numero].niveau~=1 and (ibatiment[numero].drap.x-(ibatiment[numero].x1+ibatiment[numero].xbase))^2+(1.25*(ibatiment[numero].drap.y-(ibatiment[numero].y1+ibatiment[numero].ybase)))^2>ibatiment[numero].porte then
			drapeauinit(numbatiment)
		end
		ibatiment[numbatiment].drap.isVisible=false
		if not goh then
			ibatiment[numbatiment].drap.xScale=0.1*apparence
		else
			ibatiment[numbatiment].drap.xScale=0.07*apparence
		end
		ibatiment[numbatiment].drap.yScale=ibatiment[numbatiment].drap.xScale
		ibatiment[numbatiment].drap.alpha=0.5
		ibatiment[numbatiment].drap.pos=mathfloor(ibatiment[numbatiment].drap.y)+1024
		group[ibatiment[numbatiment].drap.pos]:insert(ibatiment[numbatiment].drap)
	end
	return tbatiment
end

function batiment.new( lebatiment, typebatiment,numbatiment )--creation de la class batiment(plus utiliser)
	local newBatiment={-----------------probleme pour recupere les valeurs accepte qu avec es vriable global
	tbatiment=init(lebatiment,typebatiment,numbatiment)
		}
	return setmetatable( newBatiment, batiment_mt )
end
local function tabboutondev(frame,eventtarget,dev,tutoobj,plusplus)
	clicsurqqcfunc()
	if clicpause==0 and pv1clic==0 and pv2clic==0 and pv3clic==0 and clicconstruire==0 and clicinfanterie==0 and clicarcher==0 and clicpouvoir1==0 and clicpouvoir2==0 and clicpouvoir3==0 then
		animationamelio(frame,eventtarget)
		if plusplus==nil then
			argentdev(eventtarget.num,dev)
			if tutoobj~=nil then
				if tuto==2 then
					if tutoaction==tutoobj then										
						actionfaite()
					end
				end
			end
		else -- if plusplus==1 then
			print("plusplus "..plusplus)
			if argent-(-(eventtarget.prix)*3)<=0 then
				argent=argent-(-(eventtarget.prix)*3)
				vartune()
				if plusplus==1 then
					if(eventtarget.type2==2)then
						ibatiment[eventtarget.num].cadence=ibatiment[eventtarget.num].cadence-1000
						if ibatiment[eventtarget.num].cadence<500 then
							ibatiment[eventtarget.num].cadence=500
						end
						ibatiment[eventtarget.num].attaque=ibatiment[eventtarget.num].attaque+ibatiment[eventtarget.num].attaque*0.5/(ibatiment[eventtarget.num].nbflechebase-2)
						ibatiment[eventtarget.num].attsec=mathfloor(ibatiment[eventtarget.num].attaque*1000/ibatiment[eventtarget.num].cadence*ibatiment[eventtarget.num].nbfleche*ibatiment[eventtarget.num].porte^0.3/10*ibatiment[eventtarget.num].dureeliq/3000)
						ibatiment[eventtarget.num].nbflechebase=ibatiment[eventtarget.num].nbflechebase+1
					else
						ibatiment[eventtarget.num].nbfleche=ibatiment[eventtarget.num].nbfleche+1
						ibatiment[eventtarget.num].fleche[ibatiment[eventtarget.num].nbfleche]=0
						local attaquedubat=mathfloor(ibatiment[eventtarget.num].attaque*1000/ibatiment[eventtarget.num].cadence*ibatiment[eventtarget.num].nbfleche)
						if eventtarget.type2==1 then
							attaquedubat=mathfloor(attaquedubat*ibatiment[eventtarget.num].impact^0.5/10)
						end
						ibatiment[eventtarget.num].attsec=attaquedubat
					end
				else
					print("eventtarget.num="..eventtarget.num)
					ibatiment[eventtarget.num].nbunittotal=ibatiment[eventtarget.num].nbunittotal+1
					generersoldat(eventtarget.num,ibatiment[eventtarget.num].niveau)
					ibatiment[eventtarget.num].attsec=mathfloor(ibatiment[eventtarget.num].nbunittotal*image[100+ibatiment[eventtarget.num].type2*10+ibatiment[eventtarget.num].niveau].attsec)
				end
				if eventtarget.num==affinfotab.num and affinfotab.type==1 and removepartiel1==false and affinfogr.isVisible then
					affinfo(eventtarget.num,false)
				end
				if ibatiment[eventtarget.num].pole==0 then
					fricanim(1,ibatiment[eventtarget.num].x1,ibatiment[eventtarget.num].y1)
				end
			else
				pasassezfric()
			end
		end
	end
end
local function removetaplistener()

end
local function createboutondev(image,frame,position,eventtarget,impactbp,tutoobj,plusplus,mine)
	prixmulti=mine or 1
	local bouton=display.newImage(image,frame)
	local xoffset
	local yoffset
	if position==0 then -- nivsup
		xoffset=impactbp.x2
		yoffset=-50*apparence+impactbp.y1
	elseif position==1 then
		xoffset=50*apparence+impactbp.x1 -- choixgauche 7 x3
		yoffset=impactbp.y2
	elseif position==2 then
		xoffset=-50*apparence+impactbp.x3
		yoffset=impactbp.y2
	end
	bouton.x=eventtarget.x1+xoffset
	bouton.y=eventtarget.y1+yoffset
	
	if not goh then
		bouton.xScale=0.35*apparence
	else
		bouton.xScale=0.2*apparence
	end
	bouton.yScale=bouton.xScale
	bouton.num=eventtarget.num
	boutondev1:insert(bouton)
	bouton.txt=display.newEmbossedText(boutondev1,prix[ibatiment[eventtarget.num].type1][ibatiment[eventtarget.num].type2][ibatiment[eventtarget.num].niveau+1]*prixmulti, bouton.x, bouton.y-40, fonttype, 23*apparence*fontsize )
	bouton.txt:setFillColor(colortextfill[1],colortextfill[2],colortextfill[3])
	bouton.txt:setEmbossColor(colortextemb)
	bouton.or1=display.newImage(imbouton.monnaie,3)
	bouton.or1.x=bouton.txt.x+25*apparence
	bouton.or1.y=bouton.txt.y
	bouton.or1.xScale=0.1*apparence
	bouton.or1.yScale=bouton.or1.xScale
	boutondev1:insert(bouton.or1)
	if tutoobj~=nil then
		if tuto==2 then
			if tutoaction==tutoobj then
				if tutoobj~=5 then
					vendre.isVisible=false
					vendre.txt.isVisible=false
					vendre.or1.isVisible=false
				end
				if fleche.group==0 then
					grpartie:remove(fleche)
					fleche.group=1
					background:insert(fleche)
				end
				fleche.x=bouton.x-fleche.width*0.6*fleche.xScale
				fleche.y=bouton.y-fleche.height*0.6*fleche.yScale
				transition.from(fleche,{time=200,transition=easing.inCirc, x=fleche.x+fleche.width*0.1*fleche.xScale,y=fleche.y+fleche.height*0.1*fleche.yScale,xScale=fleche.xScale*0.9,yScale=fleche.yScale*0.9})
			end
		end
	end
	transition.from(bouton.or1,{time=500,transition=easing.outBack, y=eventtarget.y1, x=eventtarget.x1,xScale=bouton.or1.xScale*0.5,yScale=bouton.or1.xScale*0.5})
	transition.from(bouton,{time=500,transition=easing.outBack, y=eventtarget.y1, x=eventtarget.x1,xScale=bouton.xScale*0.5,yScale=bouton.xScale*0.5})
	transition.from(bouton.txt,{time=500,transition=easing.outBack, y=eventtarget.y1, x=eventtarget.x1,xScale=bouton.txt.xScale*0.5,yScale=bouton.txt.xScale*0.5})
	if plusplus~=nil then
		if plusplus==1 then
			if ibatiment[eventtarget.num].nbflechebase==nil then
				ibatiment[eventtarget.num].nbflechebase=ibatiment[eventtarget.num].nbfleche
				if ibatiment[eventtarget.num].nbflechebase==nil then
					ibatiment[eventtarget.num].nbflechebase=1
				end
			end
			local differencexpo=ibatiment[eventtarget.num].nbfleche-ibatiment[eventtarget.num].nbflechebase
			if differencexpo>3 and differencexpo<5 then
				differencexpo=differencexpo^2
			elseif differencexpo>=5 and differencexpo<9 then
				differencexpo=differencexpo^3
			elseif differencexpo>=9 then
				differencexpo=differencexpo^4
			end
			bouton.prix=mathfloor((prix[ibatiment[eventtarget.num].type1][ibatiment[eventtarget.num].type2][5]/ibatiment[eventtarget.num].nbflechebase)*(1+(differencexpo)*0.1)/50)*50
			bouton.txt.text=bouton.prix
		elseif plusplus==2 then
			print("plusplus=2")
			local differencexpo=ibatiment[eventtarget.num].nbunittotal-ibatiment[eventtarget.num].nbunit
			if differencexpo>3 and differencexpo<5 then
				differencexpo=differencexpo^2
			elseif differencexpo>=5 and differencexpo<9 then
				differencexpo=differencexpo^3
			elseif differencexpo>=9 then
				differencexpo=differencexpo^4
			end
			bouton.prix=mathfloor((prix[ibatiment[eventtarget.num].type1][ibatiment[eventtarget.num].type2][5]/ibatiment[eventtarget.num].nbunit)*(1+(differencexpo)*0.1)/25)*25
			bouton.txt.text=bouton.prix
		end
	end
	if mine~=nil then
		local act=0
		if ibatiment[eventtarget.num].niveau>=2 and isoldat[ibatiment[eventtarget.num].numsol].vie==isoldat[ibatiment[eventtarget.num].numsol].vietotale and isoldat[ibatiment[eventtarget.num].numsol].encombat==0 then
			vendre.alpha=1
			if ibatiment[eventtarget.num].niveau<4 and isoldat[ibatiment[eventtarget.num].numsol].ennemi==0 then
				bouton.alpha=1
				act=1
			end
			if ibatiment[eventtarget.num].argentcum~=0 then
				--choixgauche.alpha=1
				act=act+2
			end
		else
			if ibatiment[eventtarget.num].niveau==1 then
				bouton.alpha=1
				act=1
				--print("etape4")
			end
			if ibatiment[eventtarget.num].niveau>=2 then
				vendre.alpha=0.5
			end
		end
		if act<2 and ibatiment[eventtarget.num].niveau>=2 then
			--choixgauche.alpha=0.5
		else
			act=act-2
		end
		if act==0 and ibatiment[eventtarget.num].niveau<4 then
			bouton.alpha=0.5
			--print("etape3")
		end
	end
	function bouton:tap(event)
		if bouton.alpha==1 and ibatiment[eventtarget.num].boutonpret and not batimentboutonclic then
			batimentboutonclic=true
			print("Tap bouton")
			tabboutondev(frame,event.target,position,tutoobj,plusplus)
		end
	end
	bouton:addEventListener( "tap",bouton)
	--return bouton
end
local function developement1(numero)--gestion des boutons de devellopement du batiment
	--ibatiment[numero].type1=self.tbatiment.type1-- ajouter dans l'objet : object.id = "ball object" contenant info sur le niveau et ...
	ibatiment[numero].type2=0--self.tbatiment.type2
	ibatiment[numero].num=numero
	ibatiment[numero].niveau=1--self.tbatiment.niveau
	ibatiment[numero].endev=1--self.tbatiment.endev
	ibatiment[numero].instance1=nil
	ibatiment[numero].sup=0--suprimer pour etre peut etre remplacer
	--ibatiment[numero].attaque=0--self.tbatiment.attaque
	ibatiment[numero].sup1=0--batiment suprimer definitivement
	ibatiment[numero].ypro=-17--altitude par rapport au batiment du projectile
	ibatiment[numero].xpro=0--altitude par rapport au batiment du projectile
	ibatiment[numero].ybase=30--position de la base pour le calcul de distance entre tour et soldat
	ibatiment[numero].xbase=0
	ibatiment[numero].porte=10000
	ibatiment[numero].nbfleche=0
	--ibatiment[numero].porte=0--18000--porté du batiment--hugo debut--------------------------------------------------------------
	--ibatiment[numero].cadence=0--29--cadence de tir du batiment 0 pour par defaut + baisse la cadence et - l'augmente
	--ibatiment[numero].vitesse=0--1--vitesse du projectile--faire attention que la porté*vitesse<cadence
	--ibatiment[numero].impact=0--rayon de l'impact du projectil----------------hugo fin-----------------------------------
	--ibatiment[numero].evol=0
	ibatiment[numero].supprimer=0
	ibatiment[numero].numlibre=false
	ibatiment[numero].message=texttraduction.batiment[25] --"batiment"
	 --miseajourvalevol(numero)
	--finmiseajourevol(numero,3)
	if ibatiment[numero].type1==3 then
		ibatiment[numero].argentsec=0
		ibatiment[numero].argentcum=0
		ibatiment[numero].cadence=3000
		ibatiment[numero].laframe=0
	end
	evolution(numero,3)
	clicdrapeau=0
	function ibatiment:tap( event )
			transition.cancel("boutdevremove")
			if boutondev1remove==true then
				bpbatdisp()
			end
			clicsurqqcfunc()
			affinfo(event.target.num,false)
			affinfotab.type=1
			affinfotab.num=event.target.num
			batimentboutonclic=false
			local autoriseclic=true
			if (ibatiment[event.target.num].pole==0 and contreaihaut==1 and contreai==0) or (ibatiment[event.target.num].pole~=0) then
				autoriseclic=false
			end
			if autoriseclic then
			local autorisemine=1
			if event.target.type1==3 and fenaff==false then
				if ibatiment[event.target.num].recuptune.isVisible==true then
					if tuto==2 then
						if tutoaction==7 then										
							actionfaite()
						end
					end
					audio.play(son.eventmineb)
					autorisemine=0
					clicsurqqcfunc()
					if  clicpause==0 and pv1clic==0 and pv2clic==0 and pv3clic==0 and clicconstruire==0 and clicinfanterie==0 and clicarcher==0 and clicpouvoir1==0 and clicpouvoir2==0 and clicpouvoir3==0 then
						ibatiment[event.target.num].recuptune.isVisible=false
						ibatiment[event.target.num].recuptune.clic=1
						local sequenceData1 =
							{
							    name="liq",
							    frames= {1,2,3,4,5,5},
							    time = 1000,
							    loopCount = 1
							} 
						local animfric=display.newSprite(imgbat.minefric,sequenceData1)
						animfric.x=ibatiment[event.target.num].recuptune.x-10.5
						animfric.y=ibatiment[event.target.num].recuptune.y
						animfric.xScale=ibatiment[event.target.num].recuptune.xScale
						animfric.yScale=ibatiment[event.target.num].recuptune.yScale
						group[2048]:insert(animfric)
						animfric:setSequence( "liq" )
						animfric:play()
						local function animfriclist( event )
							if animfric.frame>=animfric.numFrames then
								if ibatiment[event.target.num].pole==0 then
										fricanim(2,ibatiment[event.target.num].recuptune.x,ibatiment[event.target.num].recuptune.y)
								end
								group[2048]:remove(animfric)
								animfric:removeSelf()
								ibatiment[event.target.num].vieenlever=ibatiment[event.target.num].vieenlever+(ibatiment[event.target.num].argentcum)
								argent=argent+(-3*(mathfloor(ibatiment[event.target.num].argentcum)))
								ibatiment[event.target.num].argentcum=0
								ibatiment[event.target.num].chargement1.cpt=0
								ibatiment[event.target.num].chargement1.height=ibatiment[event.target.num].chargement1.cpt
								vartune()
								ibatiment[event.target.num].recuptune.clic=0
							end
						end
						animfric:addEventListener( "sprite", animfriclist )
						animfric.num=event.target.num
					end
					if(enconst==1)then
						removenbat()
					end
				end
			end
			if( autorisemine==1 and event.target.endev==0 and fenaff==false and  clicpause==0 and pv1clic==0 and pv2clic==0 and pv3clic==0 and clicconstruire==0 and clicinfanterie==0 and clicarcher==0 and clicpouvoir1==0 and clicpouvoir2==0 and clicpouvoir3==0 and pv1clicactiver==0 and pv2clicactiver==0 )then	--				
				batimenttap=1
				local function tempclic(event)
					batimenttap=0
				end
				timer.performWithDelay( 50,tempclic )
				if(enconst==1)then
					removenbat()
				end
				if(boutondev==0)then
					ibatiment[event.target.num].boutonpret=false
					local function boutonprettimer(event1)
						ibatiment[event.target.num].boutonpret=true
					end
					timer.performWithDelay(200,boutonprettimer)
					boutondev1=display.newGroup()
					background:insert(boutondev1)
					boutondev1.num=event.target.num
					animcercle=display.newImage(imbouton.cercle,1)
					animcercle.x=event.target.x1
					animcercle.y=event.target.y1
					animcercle.xScale=0.34*apparence
					animcercle.yScale=0.34*apparence
					animcercle.alpha=0.5
					transition.to(animcercle,{ time=60000, rotation=4000,tag="cercle" } )
					boutondev1:insert(animcercle)
					local calculdepx=0
					local calculdepy=0
					if 614<event.target.x1+animcercle.xScale*animcercle.width*0.5 then
						calculdepx=614-(event.target.x1+0.5*animcercle.xScale*animcercle.width)
					elseif -614>event.target.x1-animcercle.xScale*animcercle.width*0.5  then
						calculdepx=-614-(event.target.x1-0.5*animcercle.xScale*animcercle.width)
					end
					if 250<event.target.y1 then
						calculdepy=250-(event.target.y1+0.5*animcercle.yScale*animcercle.height)
					elseif -270>event.target.y1 then
						calculdepy=-270-(event.target.y1-0.5*animcercle.yScale*animcercle.height)
					end
					print("event.y"..event.target.y1)

					local impactx1=0
					if calculdepx<0 then
						impactx1=calculdepx*1.4
					end
					local impactx2=calculdepx/1.6
					local impactx3=0
					if calculdepx>0 then
						impactx3=calculdepx*1.4
					end
					local impacty3=0
					local impacty1=0
					if calculdepy<0 then
						impacty3=calculdepy*0.8
						impacty1=calculdepy*0.3
					end
					local impacty2=calculdepy*0.2
					
					if calculdepy>0 then
						impacty1=calculdepy*0.8
						impacty3=calculdepy*0.3
					end
					if calculdepx~=0 and calculdepy==0 then
						impacty1=-10
						impacty3=10
					elseif calculdepy~=0 and calculdepx==0 then
						impactx1=30
						impactx3=-30
					end
					local impactbp={}
					impactbp.x1=impactx1
					impactbp.x2=impactx2
					impactbp.x3=impactx3
					impactbp.y1=impacty1
					impactbp.y2=impacty2
					impactbp.y3=impacty3

					if event.target.type1==2 or event.target.type1==1 then
						cercle=display.newCircle(event.target.x1,event.target.y1+30,mathsqrt(ibatiment[event.target.num].porte)*0.95)
						cercle.yScale=0.80
						cercle:setStrokeColor(0,0.5,0,0.8)
						cercle:setFillColor(0,0,0,0.1)--0.9,0.9,0.9,0.07) --This will set the fill color to transparent
						cercle.strokeWidth = 2
						transition.from(cercle,{time=500,transition=easing.outBack,xScale=cercle.xScale*0.1,yScale=cercle.xScale*0.1})
						boutondev1:insert( cercle )
					end
					if  ibatiment[event.target.num].type1==1  or (modearmy and ibatiment[event.target.num].type1==2) then
						ibatiment[event.target.num].drap.isVisible=true
						bdrapeau=display.newImage(imbouton.batiment,9)
						bdrapeau.x=event.target.x1+25*apparence+impactx2
						bdrapeau.y=event.target.y1+45*apparence+impacty3
						print("bdrapeau.x "..bdrapeau.x.." bdrapeau.y "..bdrapeau.y)
						if not goh then
							bdrapeau.xScale=0.30*apparence
						else
							bdrapeau.xScale=0.18*apparence
						end
						bdrapeau.yScale=bdrapeau.xScale
						bdrapeau.num=event.target.num
						transition.from(bdrapeau,{time=500,transition=easing.outBack, y=event.target.y1, x=event.target.x1,xScale=bdrapeau.xScale*0.5,yScale=bdrapeau.xScale*0.5})
						boutondev1:insert(bdrapeau)
						drapcreation=0
						local compteuropt=0
						local posxbat=ibatiment[event.target.num].x1+ibatiment[event.target.num].xbase -- permet de diminuer le nombre de calcul
						local posybat=ibatiment[event.target.num].y1+ibatiment[event.target.num].pole+ibatiment[event.target.num].ybase
						local function drapinit(x,y)
							if x==nil then
								x=0
							end
							if y==nil then
								y=0
							end
							clicsurqqcfunc()
							ibatiment[event.target.num].drap.isVisible=true
							numdrap=event.target.num
							local function draptap1( event )
								draptap=1
							end
							draptap1=timer.performWithDelay( 10, draptap1 )	
							--faire apparaitre un nouveau drapeau pour choisir le nouvel endroit
							if grdrap~=nil then
								group[grdrap.group]:remove(grdrap)
								grdrap:removeSelf()
								grdrap=nil
							end
							grdrap=display.newGroup()
							grdrap.group=2048
							group[grdrap.group]:insert(grdrap)
							drap1=display.newImage(imbouton.batiment,9)
							drap1.x=x
							drap1.y=y
							if not goh then
								drap1.xScale=0.1*(apparence+0.2)
							else
								drap1.xScale=0.075*(apparence+0.2)
							end
							drap1.yScale=drap1.xScale
							grdrap:insert(drap1)

							drap=display.newRect(x,y, 45, 45 )
							drap.alpha=0.01
							drap.xScale=1/taille*apparence
							drap.yScale=1/taille*apparence
							drap.num=event.target.num
							grdrap:insert(drap)

							confirmerdrap=display.newImage(imbouton.batiment,11)
							confirmerdrap.x=drap1.x
							confirmerdrap.y=drap1.y
							confirmerdrap.xScale=drap1.xScale
							confirmerdrap.yScale=confirmerdrap.xScale
							confirmerdrap.isVisible=false
							confirmerdrap.num=event.target.num
							grdrap:insert(confirmerdrap)

							cercle=display.newCircle(ibatiment[event.target.num].x1,ibatiment[event.target.num].y1+30,mathsqrt(ibatiment[event.target.num].porte)*0.95)
							cercle.yScale=0.80
							cercle:setStrokeColor(0,0.5,0,0.8)
							cercle:setFillColor(0,0,0,0.1)
							cercle.strokeWidth = 2
							grdrap:insert( cercle )
						end
						local function drapmove(event,var)
							var=var+(selfx-xori)^2+(selfy-yori)^2
							selfx=(-background.x+event.x)/taille
							selfy=(-background.y+event.y)/taille
							if var>500 then
								if drapcreation==0 then
									drapcreation=1
								end
								drap.x =selfx -- coordonnée de depart
								drap.y =selfy
								local autorise=draptestautorise(event,nil,posxbat,posybat,drap)
								if autorise==0 then
									drap1.x=drap.x
									drap1.y=drap.y
								else
									compteuropt=compteuropt+1
									if compteuropt>2 then
										compteuropt=0
										local xdirec=1
										if drap1.x>drap.x then
											xdirec=-1
										end
										local ydirec=1
										if drap1.x>drap.y then
											ydirec=-1
										end
										local distancemin=(drap.x-drap1.x)*(drap.x-drap1.x)+(drap.y-drap1.y)*(drap.y-drap1.y)
										if distancemin>1000 then
										local limitex1carre=drap1.x+30*(-xdirec)
										local limitex2carre=drap.x+30*(xdirec)
										local limitey1carre=drap1.y+30*(-ydirec)
										local limitey2carre=drap.y+30*(ydirec)
										local ancienxvalide=drap1.x
										local ancienyvalide=drap1.y
											local testposbat={}
											testposbat.x=drap1.x
											testposbat.y=drap1.y
											local i=limitex1carre
											local varrandx=mathfloor(mathabs(limitex1carre-limitex2carre)*0.1)
											if varrandx<1 then
												varrandx=1
											end
											local varrandy=mathfloor(mathabs(limitey1carre-limitey2carre)*0.1)
											if varrandy<1 then
												varrandy=1
											end
											while i*xdirec<limitex2carre*(xdirec) do
												testposbat.x=i
												local j=limitey1carre
												while j*ydirec<limitey2carre*(ydirec) do
													testposbat.y=j
													if ibatiment[drap.num].porte>(testposbat.x-posxbat)*(testposbat.x-posxbat)+(1.25*(testposbat.y-posybat))*(1.25*(testposbat.y-posybat)) then
														local autorise1=draptestautorise(event,testposbat,posxbat,posybat,drap)
														if autorise1==0 then
															local distancemintest=(drap.x-testposbat.x)*(drap.x-testposbat.x)+(drap.y-testposbat.y)*(drap.y-testposbat.y)
															if distancemin>distancemintest then
																distancemin=distancemintest
																ancienxvalide=testposbat.x
																ancienyvalide=testposbat.y
															end
														end
													end
													j=j+varrandy*ydirec
												end
												i=i+varrandx*(xdirec)
											end
											drap1.x=ancienxvalide
											drap1.y=ancienyvalide
										end
									end
								end
							end	
							return(var)
						end
						local function draptapbat()							
							if confirmerdrap.isVisible==true then
								if clicconstruire==0 then
									if boutondev==1 then
										batiment:supbouton()
									end
									if pv1clicactiver==1 then
										Runtime:removeEventListener( "tap",clicpv1)
										group[2048]:remove(pv1affinter)
										pv1affinter:removeSelf()
										pv1affinter=nil
										pv1clicactiver=0
										pvaction.isVisible=false
									end
									if pv2clicactiver==1 then
										Runtime:removeEventListener( "tap",clicpv2)
										pv2clicactiver=0
										pvaction.isVisible=false
									end
									--priortié face au pouvoir 3 n'est pas faite!
									drapeausolclic=1
									local function drapeausolclic1( event )
										drapeausolclic=0
									end
									drapeausolclic1=timer.performWithDelay( 50, drapeausolclic1 )
									--print("pos")
									ibatiment[event.target.num].drap.x=drap1.x
									ibatiment[event.target.num].drap.y=drap1.y
									for k=nbsoldatg,0 do
										if isoldat[k].numbat==event.target.num then
											print("distancegene nouveau drap "..mathsqrt(((drap1.x+isoldat[k].xposi-isoldat[k].x1)^2+(drap1.y+isoldat[k].yposi-isoldat[k].y1)^2)))
											if isoldat[k].vivant then
												if mathsqrt(((drap1.x+isoldat[k].xposi-isoldat[k].x1)^2+(drap1.y+isoldat[k].yposi-isoldat[k].y1)^2))>60 then
													if isoldat[k].encombat==1 then
														isoldat[k].vivant=false
														isoldat[k].endeplacement=1
													end
												end
											end
										end
									end
									group[grdrap.group]:remove(grdrap)
									grdrap:removeSelf()
									grdrap=nil
									local numero3=event.target.num
									local function drapeautemp( event )
										ibatiment[numero3].drap.isVisible=false
									end
									drapeautemp=timer.performWithDelay( 1000, drapeautemp )
									
								end
							end
						end
						local function drapeaupos(xdrap,ydrap)
							drapcreation=1
							backgroundtap()
							drapinit(xdrap,ydrap)
							display.getCurrentStage():setFocus( nil )
			           		self.isFocus = false
							drap.x=drap1.x
							drap.y=drap1.y
							confirmerdrap.x=drap1.x
							confirmerdrap.y=drap1.y
							confirmerdrap.isVisible=true
							function drap:touch( event )
								local result = true
								local phase = event.phase
								local previousTouches = self.previousTouches
								local numTotalTouches = 1
								if ( previousTouches ) then
									numTotalTouches = numTotalTouches + self.numPreviousTouches
									if previousTouches[event.id] then
										numTotalTouches = numTotalTouches - 1
									end
								end
								if "began" == phase then
									retinf.nbaction=retinf.nbaction+1
									if ( not self.isFocus ) then
										display.getCurrentStage():setFocus( self )
										self.isFocus = true
										self.myX=event.x/taille-self.x
										self.myY=event.y/taille-self.y
										confirmerdrap.isVisible=false
										previousTouches={}
										self.previousTouches = previousTouches
										self.numPreviousTouches = 0
									elseif ( not self.distance ) then
										local dx,dy
									end
									if not previousTouches[event.id] then
										self.numPreviousTouches = self.numPreviousTouches + 1
									end
									previousTouches[event.id] = event
									xori=self.x
									yori=self.y
									var=0
								elseif self.isFocus then
									if "moved" == phase then
										if ( self.distance ) then
											local dx,dy			
										else
											var=drapmove(event,var)
										end
										if not previousTouches[event.id] then
											self.numPreviousTouches = self.numPreviousTouches + 1
										end
										previousTouches[event.id] = event
									elseif "ended" == phase or "cancelled" == phase then
										if previousTouches[event.id] then
											self.numPreviousTouches = self.numPreviousTouches - 1
											previousTouches[event.id] = nil
										end
										if ( #previousTouches > 0 ) then
											self.distance = nil
										else
											-- previousTouches is empty so no more fingers are touching the screen
											-- Allow touch events to be sent normally to the objects they "hit"
											display.getCurrentStage():setFocus( nil )
											self.isFocus = false
											self.distance = nil
											self.xScaleOriginal = nil
											self.yScaleOriginal = nil
											-- reset array
											self.previousTouches = nil
											self.numPreviousTouches = nil
										end
										self.x=drap1.x
										self.y=drap1.y
										confirmerdrap.x=drap1.x
										confirmerdrap.y=drap1.y
										confirmerdrap.isVisible=true
										draptap=0
										draptapbat()
									end
								end
								return result
							end
							drap:addEventListener( "touch", drap )
						end
						function bdrapeau:touch(event)--gestion du placement des batiments(touch pour infanterie et archer)
							local result = true
							local phase = event.phase
							local previousTouches = self.previousTouches
							local numTotalTouches = 1
							if ( previousTouches ) then
								numTotalTouches = numTotalTouches + self.numPreviousTouches
								if previousTouches[event.id] then
									numTotalTouches = numTotalTouches - 1
								end
							end
							if "began" == phase then
								retinf.nbaction=retinf.nbaction+1
								if ( not self.isFocus ) then
									display.getCurrentStage():setFocus( self )
									self.isFocus = true
									self.myX =(-background.x+event.x)/taille
									self.myY =(-background.x+event.x)/taille
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
								self.myX =(-background.x+event.x)/taille
								self.myY =(-background.y+event.y)/taille
								selfx=(-background.x+event.x)/taille
								selfy=(-background.y+event.y)/taille
								if (construireinf.x-event.x)^2+(construireinf.y-event.y)^2<(construirearch.x-event.x)^2+(construirearch.y-event.y)^2 then -- wtf??????
									self.typebatiment=1--permet de ssavoir sur quel bouton on a cliquer
								else
									self.typebatiment=2
								end
					 			xori=selfx
								yori=selfy
								var=0
								drapinit(ibatiment[event.target.num].drap.x,ibatiment[event.target.num].drap.y)
							elseif self.isFocus then
								if "moved" == phase then
									if ( self.distance ) then
										local dx,dy			
									else
										var=drapmove(event,var)
									end
									if not previousTouches[event.id] then
										self.numPreviousTouches = self.numPreviousTouches + 1
									end
									previousTouches[event.id] = event
								elseif "ended" == phase or "cancelled" == phase then
									if previousTouches[event.id] then
										self.numPreviousTouches = self.numPreviousTouches - 1
										previousTouches[event.id] = nil
									end
									if ( #previousTouches > 0 ) then
										self.distance = nil
									else
										display.getCurrentStage():setFocus( nil )
									end
										local xdrap=drap.x
									local ydrap=drap.y
									backgroundtap()
									local action=0
									if var<1 then
											clicsurqqcfunc()
									 	if  clicpause==0 and pv1clic==0 and pv2clic==0 and pv3clic==0 and clicconstruire==0 and clicinfanterie==0 and clicarcher==0 and clicpouvoir1==0 and clicpouvoir2==0 and clicpouvoir3==0 and pv1clicactiver==0 and pv2clicactiver==0 then
											action=0
										else
											action=1
										end
										local function draptap1( event )
											backgroundtap()
											if action==0 then
												drapeaupos(xdrap,ydrap)
											end
										end
										draptap1=timer.performWithDelay( 50, draptap1 )
									else
									xdrap=drap1.x
									ydrap=drap1.y
									drapeaupos(xdrap,ydrap)
									end
								else
									backgroundtap()
								end
							end
					 		return result
						end
						bdrapeau:addEventListener( "touch", bdrapeau )
						local function linesoldat(numsol,nbligne)
							local x1=event.target.x1
							local y1=event.target.y1
							lignesoldat[nbligne]=display.newLine(boutondev1,x1,y1,isoldat[numsol].x1,isoldat[numsol].y1)
							lignesoldat[nbligne]:setStrokeColor(0.34,0.38,0.67)
							lignesoldat[nbligne].strokeWidth=1
							lignesoldat[nbligne].num=numsol
							lignesoldat[nbligne].x1=x1
							lignesoldat[nbligne].y1=y1
							transition.to(lignesoldat[nbligne],{time=750,alpha=0,delay=300})
						end
						local nbligne=0
						lignesoldat={}
						for i=nbsoldatg,0 do
							if isoldat[i].orientation==0 and isoldat[i].vivant then
								if isoldat[i].numbat==event.target.num and isoldat[i].classe<4 then
									nbligne=nbligne+1
									linesoldat(i,nbligne)
								end
							end
						end
					end
					vendre=display.newImage(imbouton.batiment,13)
					vendre.x=event.target.x1+impactx2
					vendre.y=event.target.y1+50*apparence+impacty3
					if not goh then
						vendre.xScale=0.35*apparence
					else
						vendre.xScale=0.2*apparence
					end
					vendre.xScale=vendre.xScale*0.7
					vendre.yScale=vendre.xScale
					vendre.num=event.target.num
					boutondev1:insert(vendre)
					if event.target.type1~=3 or event.target.niveau~=1 then 
						if ibatiment[event.target.num].type1==1 or (modearmy and ibatiment[event.target.num].type1==2) then
							vendre.x=vendre.x-25*apparence
							vendre.y=vendre.y-5*apparence
							if not goh then
								vendre.xScale=0.30*apparence
							else
								vendre.xScale=0.19*apparence
							end
							vendre.xScale=vendre.xScale*0.7
							vendre.yScale=vendre.xScale
						end
						local textvendre=0 
						local niveauvendre=ibatiment[event.target.num].niveau
						while niveauvendre>=1 do
							textvendre=textvendre+prix[ibatiment[event.target.num].type1][ibatiment[event.target.num].type2][niveauvendre]
							niveauvendre=niveauvendre-1
						end
						local varrevenu=1
						if modenormal and multi==0 then
							if #vague-vagueencours==0 then
								varrevenu=0.2
							elseif #vague+vagueencours==1 then
								varrevenu=0.4
							elseif #vague+vagueencours==2 then
								varrevenu=0.6
							else
								varrevenu=1
							end
						end
						textvendre=mathfloor(0.5*textvendre*varrevenu)
						vendre.txt=display.newEmbossedText(boutondev1,textvendre, vendre.x, vendre.y+35*apparence, fonttype, 23*apparence*fontsize )
						vendre.txt:setFillColor(1,0,0)
						vendre.txt:setEmbossColor(colortextemb)
						vendre.or1=display.newImage(imbouton.monnaie,3)
						vendre.or1.x=vendre.txt.x+25*apparence
						vendre.or1.y=vendre.txt.y
						vendre.or1.xScale=0.1*apparence
						vendre.or1.yScale=vendre.or1.xScale
						boutondev1:insert(vendre.or1)
						transition.from(vendre.txt,{time=500,transition=easing.outBack, y=event.target.y1, x=event.target.x1,xScale=vendre.txt.xScale*0.5,yScale=vendre.txt.xScale*0.5})
						transition.from(vendre.or1,{time=500,transition=easing.outBack, y=event.target.y1, x=event.target.x1,xScale=vendre.or1.xScale*0.5,yScale=vendre.or1.xScale*0.5})
						function vendre:tap(event)
							if ibatiment[event.target.num].boutonpret and not batimentboutonclic and vendre~=nil then
								batimentboutonclic=true
								clicsurqqcfunc()
								vibrationBouton(vendre)
								if vendre.alpha==1 then
									if  clicpause==0 and pv1clic==0 and pv2clic==0 and pv3clic==0 and clicconstruire==0 and clicinfanterie==0 and clicarcher==0 and clicpouvoir1==0 and clicpouvoir2==0 and clicpouvoir3==0 and pv1clicactiver==0 and pv2clicactiver==0 then
									local animconst = require ( "constructanim" )
									audio.play(son.eventven)
									ibatiment[event.target.num].sup=1
									ibatiment[event.target.num].sup1=1
									ibatiment[event.target.num].supprimer=1
									local function timersky1(event)
										ibatiment[event.source.num].numlibre=true
									end
									timersky=timer.performWithDelay(1000,timersky1)
									timersky.num=event.target.num
									timerpause(1,timersky,nil)
									argent=argent+(-(textvendre)*3)
									vartune()
									animationamelio(13,event.target)
									constructionanim(ibatiment[event.target.num],2)
									end
								end
							end
						end
						vendre:addEventListener( "tap", vendre )
					else
						vendre.isVisible=false
					end
					transition.from(vendre,{time=500,transition=easing.outBack, y=event.target.y1, x=event.target.x1,xScale=vendre.xScale*0.5,yScale=vendre.xScale*0.5})
					if event.target.type1==1 then
						if event.target.niveau<4 then
							if(event.target.type2==0)then
								if savegameall.unlock[ibatiment[event.target.num].typebat+1]==1 or ((tuto==1 or tuto==2) and niveauch==1) or tutolevel0 then
									createboutondev(imbouton.batiment,2,0,event.target,impactbp,9)
								end
								if(event.target.niveau==1) then
									if savegameall.unlock[ibatiment[event.target.num].typebat+1*5+1]==1 or tutolevel0 then
										createboutondev(imbouton.batiment,5,1,event.target,impactbp)
									end
									if savegameall.unlock[ibatiment[event.target.num].typebat+2*5+1]==1 or tutolevel0 then
										createboutondev(imbouton.batiment,4,2,event.target,impactbp)
									end
								end
							end
							if event.target.type2==1 and (savegameall.unlock[ibatiment[event.target.num].typebat+1]==1 or tutolevel0) then
								createboutondev(imbouton.batiment,5,0,event.target,impactbp)
							end
							if event.target.type2==2 and (savegameall.unlock[ibatiment[event.target.num].typebat+1]==1  or tutolevel0) then
								createboutondev(imbouton.batiment,4,0,event.target,impactbp)
							end
						elseif not modearmy then
							createboutondev(imbouton.batiment,16+event.target.type2,0,event.target,impactbp,nil,2)
						end
					elseif event.target.type1==2 then
						if event.target.niveau<4 then
							if(event.target.type2==0)then
								if savegameall.unlock[ibatiment[event.target.num].typebat+1]==1 or ((tuto==1 or tuto==2) and niveauch==1) or tutolevel0 then
									createboutondev(imbouton.batiment,6,0,event.target,impactbp,9)
								end
								if(event.target.niveau==1)then
									if savegameall.unlock[ibatiment[event.target.num].typebat+5+1]==1 or tutolevel0 then
										createboutondev(imbouton.batiment,7,1,event.target,impactbp)
									end
									if savegameall.unlock[ibatiment[event.target.num].typebat+2*5+1]==1 or tutolevel0 then
										createboutondev(imbouton.batiment,8,2,event.target,impactbp)
									end
								end
							elseif event.target.type2==1 and (savegameall.unlock[ibatiment[event.target.num].typebat+1]==1 or tutolevel0) then
								createboutondev(imbouton.batiment,7,0,event.target,impactbp)
							elseif savegameall.unlock[ibatiment[event.target.num].typebat+1]==1 or tutolevel0 then
								createboutondev(imbouton.batiment,8,0,event.target,impactbp)
							end
						elseif not modearmy then
							createboutondev(imbouton.batiment,19+event.target.type2,0,event.target,impactbp,nil,1)
						end
					elseif event.target.type1==3 then
						if event.target.niveau<4 and (savegameall.unlock[ibatiment[event.target.num].typebat+1]==1 or tutolevel0) then
							local prixmulti=1
							if modeinfini==true then
								prixmulti=2
							end
							createboutondev(imbouton.batiment,14,0,event.target,impactbp,5,nil,prixmulti)
						end
						if event.target.niveau>=2 then 
							choixgauche=display.newImage(imbouton.batiment,12)
							choixgauche.x=event.target.x1-50*apparence+impactx1
							choixgauche.y=event.target.y1+impacty2
							if not goh then
								choixgauche.xScale=0.35*apparence
							else
								choixgauche.xScale=0.2*apparence
							end
							choixgauche.yScale=choixgauche.xScale
							choixgauche.num=event.target.num
							choixgauche.txt="tune"
							transition.from(choixgauche,{time=500,transition=easing.outBack, y=event.target.y1, x=event.target.x1,xScale=choixgauche.xScale*0.5,yScale=choixgauche.xScale*0.5})
							choixgauche.alpha=0.5
							if isoldat[ibatiment[event.target.num].numsol].vie==isoldat[ibatiment[event.target.num].numsol].vietotale and isoldat[ibatiment[event.target.num].numsol].encombat==0 then
								if ibatiment[event.target.num].argentcum~=0 then
									choixgauche.alpha=1
								end
							end

							function choixgauche:tap(event)
								if choixgauche.alpha==1 and ibatiment[event.target.num].boutonpret and not batimentboutonclic then
									clicsurqqcfunc()
									batimentboutonclic=true
									if tuto==2 then
										if tutoaction==7 then										
											actionfaite()
										end
									end
									if clicpause==0 and pv1clic==0 and pv2clic==0 and pv3clic==0 and clicconstruire==0 and clicinfanterie==0 and clicarcher==0 and clicpouvoir1==0 and clicpouvoir2==0 and clicpouvoir3==0 then
										local sequenceData1 =
											{
											    name="liq",
											    frames= {1,2,3,4,5,5},
											    time = 1000,
											    loopCount = 1
											} 
										audio.play(son.eventmineb)
										local animfric=display.newSprite(imgbat.minefric,sequenceData1)
										animfric.x=choixgauche.x-10.5
										animfric.y=choixgauche.y
										animfric.xScale=choixgauche.xScale
										animfric.yScale=choixgauche.yScale
										group[2048]:insert(animfric)
										animfric:setSequence( "liq" )
										animfric:play()
										local function animfriclist( event )
											if animfric.frame>=animfric.numFrames then
												if ibatiment[event.target.num].pole==0 then
													fricanim(2,animfric.x,animfric.y)
												end
												group[2048]:remove(animfric)
												animfric:removeSelf()
												ibatiment[event.target.num].vieenlever=ibatiment[event.target.num].vieenlever+ibatiment[event.target.num].argentcum
												argent=argent+(-3*mathfloor((ibatiment[event.target.num].argentcum)))
												ibatiment[event.target.num].argentcum=0
												ibatiment[event.target.num].chargement1.cpt=0
												ibatiment[event.target.num].chargement1.height=ibatiment[event.target.num].chargement1.cpt
												vartune()
											end
										end
										animfric:addEventListener( "sprite", animfriclist )
										animfric.num=event.target.num
									end
								end
							end
							choixgauche:addEventListener( "tap", choixgauche )
							boutondev1:insert(choixgauche)
						end
					end
					boutondev=1
				end
			end
		end
	end
	ibatiment[numero]:addEventListener( "tap", ibatiment )
end
if not functionload then
function initia(numero)--initialisation du batiment quand on le construit ou certain type de devellopement
	if ibatiment[numero].type1==1 or (modearmy and ibatiment[numero].type1==2) then
		ibatiment[numero].drap=display.newImage(imbouton.batiment,9)
		developement1(numero)
		drapeauinit(numero)
		ibatiment[numero].drap.isVisible=false
		if not goh then
			ibatiment[numero].drap.xScale=0.1*apparence
		else
			ibatiment[numero].drap.xScale=0.075*apparence
		end
		ibatiment[numero].drap.yScale=ibatiment[numero].drap.xScale
		ibatiment[numero].drap.alpha=0.5
		ibatiment[numero].drap.pos=mathfloor(ibatiment[numero].drap.y)+1024
		group[ibatiment[numero].drap.pos]:insert(ibatiment[numero].drap)
	else
		developement1(numero)
	end
end
end
function removetaplistener()
	if nivsup~=nil then
		if nivsup.list==nil then
			nivsup.list=true
			nivsup:removeEventListener( "tap", nivsup)
		end
	end
	if vendre~=nil then
		if vendre.list==nil then
				vendre.list=true
			vendre:removeEventListener( "tap", vendre)
		end
	end
	if choixgauche~=nil then
		if choixgauche.list==nil then
			choixgauche.list=true
			choixgauche:removeEventListener( "tap", choixgauche)
		end
	end
	if choixdroite~=nil then
		if choixdroite.list==nil then
			choixdroite.list=true
			choixdroite:removeEventListener( "tap", choixdroite)
		end
	end
	if bdrapeau~=nil then
		if bdrapeau.list==nil then
			bdrapeau.list=true
			bdrapeau:removeEventListener( "tap", bdrapeau)
		end
	end
end
function batiment:supbouton()--demande de supresion des boutons de devellopement
	print("yo mec")
	if tuto==2 then
		if tutoaction==5 then
			if boutondev1~=nil then
				if boutondev1.num~=nil then
					if ibatiment[boutondev1.num].type1==3 then
						if fleche.group==0 then
							grpartie:remove(fleche)
							fleche.group=1
							background:insert(fleche)
						end
						fleche.x=ibatiment[boutondev1.num].x1-fleche.width*0.6*fleche.xScale
						fleche.y=ibatiment[boutondev1.num].y1-fleche.height*0.6*fleche.yScale
						transition.from(fleche,{time=200,transition=easing.inCirc, x=fleche.x+fleche.width*0.1*fleche.xScale,y=fleche.y+fleche.height*0.1*fleche.yScale,xScale=fleche.xScale*0.9,yScale=fleche.yScale*0.9})
					end
				end
			end
		elseif tutoaction==9 then
			if boutondev1~=nil then
				if boutondev1.num~=nil then
					print("deplacer la petite merde")
					if fleche.group==0 then
						grpartie:remove(fleche)
						fleche.group=1
						background:insert(fleche)
					end
					fleche.x=ibatiment[boutondev1.num].x1-fleche.width*0.6*fleche.xScale
					fleche.y=ibatiment[boutondev1.num].y1-fleche.height*0.6*fleche.yScale
					transition.from(fleche,{time=200,transition=easing.inCirc, x=fleche.x+fleche.width*0.1*fleche.xScale,y=fleche.y+fleche.height*0.1*fleche.yScale,xScale=fleche.xScale*0.9,yScale=fleche.yScale*0.9})
				end
			end
		end
	end
	transition.cancel("cercle")
	removetaplistener()
	if lignesoldat~=nil then
		for i=1,#lignesoldat do
			if lignesoldat[i].num~=nil then
				if isoldat[lignesoldat[i].num].vivant then
					display.remove(lignesoldat[i])
					-- boutondev1:remove(lignesoldat[i])
					-- lignesoldat[i]:removeSelf()
					lignesoldat[i]=display.newLine(boutondev1,lignesoldat[i].x1,lignesoldat[i].y1,isoldat[lignesoldat[i].num].x1,isoldat[lignesoldat[i].num].y1)
					lignesoldat[i]:setStrokeColor(0.34,0.38,0.67)
					lignesoldat[i].strokeWidth=1
					lignesoldat[i].alpha=1
				end
			end
		end
	end
	if boutondev1remove==false then
		if boutondev1~=nil then
			if ibatiment[boutondev1.num].type1==1 or (ibatiment[boutondev1.num].type1==2 and modearmy)then
				ibatiment[boutondev1.num].drap.isVisible=false
				if grdrap~=nil then -- draptap==1 then
					group[grdrap.group]:remove(grdrap)
					grdrap:removeSelf()
					grdrap=nil
					draptap=0
				end
			end
			boutondev1remove=true
			transition.to(boutondev1,{time=500,transition=easing.inCirc,x=ibatiment[boutondev1.num].x1 ,y=ibatiment[boutondev1.num].y1 ,xScale=0.01,yScale=0.01, onComplete=bpbatdisp, onCancel=bpbatdisp ,tag="boutdevremove"})
		end
	end
	boutondev=0
end
end
return batiment
--http://coronalabs.com/blog/2011/09/29/tutorial-modular-classes-in-corona/