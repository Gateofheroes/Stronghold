local t={}--gestion du tir de projectile(soldat + tour)
if not functionload then
coattir=coroutine.create(function ()

local function anglebasic(x1,y1,actadvx,actadvy)--calcul de l'angle sans effet
	local denom=mathsqrt((x1-actadvx)*(x1-actadvx)+(y1-actadvy)*(y1-actadvy))
	if denom<0.05 and denom>=0 then
		denom=0.05
	elseif denom>-0.05 and denom<=0 then
		denom=0.05
	end

	--angle de la trajectoire
	local angle=math.acos((actadvx-x1)/denom)*180/3.14
	if y1>actadvy then
		angle=-angle
	end
	return angle
end
local function poussiereevenement(x,y,typepro)--effet de pousiere lorsqu'un boulet touche le sol(faudrai une image de pousiere(actuelement c'est l'image de l'ombre qui est utiliser))
	if removepartiel1~=true and y<2048 and y>-2048 then
		local poussiere=nil
		local latransition=nil
		-- local destructeurpartiel=function(obj)
		-- 	group[obj.group]:remove(obj)
		-- 	obj:removeSelf()
		-- 	obj=nil
		-- end
		

		if typepro=="14" then
			local poussiere1=nil
			local metennoirlanim=function (obj)
				obj:setFillColor(0.5)
			end
			poussiere1=display.newSprite(impro.explosion,impro.explosionseq)
			if not goh then
				poussiere1.xScale=0.8
			else
				poussiere1.xScale=0.2
			end
			poussiere1.yScale=poussiere1.xScale
			poussiere1:setSequence("explosion")
			--poussiere1:play()
			poussiere1.alpha=0.7

			poussiere1.x=x
			if not goh then
				local latransition1=transition.to(poussiere1,{delay=300*vitessejeuin,time=200*vitessejeuin,alpha=0,yScale=0.4,xScale=0.6,y=y+10,onComplete=destructeurpartieltran,onCancel=destructeurpartieltran,tag="elementtype",onStart=metennoirlanim})
				poussiere1.y=y
				if jeupause.etat==1 then
					transition.pause(latransition1)
				end
			else
				poussiere1.y=y-20
			end
			poussiere1.group=mathfloor(y+1024)
			group[poussiere1.group]:insert(poussiere1)
			spritegestion(poussiere1,1)
		end
			poussiere=display.newImage(impro.poussiere,1)
			poussiere.xScale=0.01
			local coefxscale=1
			if typepro=="14" then
				coefxscale=1.5
			end
			poussiere.yScale=poussiere.xScale
			poussiere.alpha=0.8
			poussiere.x=x
			poussiere.y=y
			latransition=transition.to(poussiere,{time=300*coefxscale*vitessejeuin,transition=easing.outQuad,alpha=0.5,xScale=0.14*coefxscale,yScale=0.14*coefxscale,y=y-10*coefxscale,onComplete=destructeurpartieltran,onCancel=destructeurpartieltran,tag="elementtype"})
		--end
		poussiere.group=mathfloor(y+1024)
		group[poussiere.group]:insert(poussiere)
		if jeupause.etat==1 then
			transition.pause(latransition)
		end
	end
	--transition.pause("elementtype")
	--poussiere.pause1=0
	--poussiere.cpt=0
	--local function listpoussiere(event)
		-- if removepartiel1==true then
		-- 	if poussiere~=nil then
		-- 		if poussiere.group~=nil and not removetotal then
		-- 			group[poussiere.group]:remove(poussiere)
		-- 			poussiere:removeSelf()
		-- 		end
		-- 	end
		-- 	poussiere=nil
		-- 	Runtime:removeEventListener( "enterFrame",listpoussiere)
		-- elseif jeupause.etat==1 then--technique numero 3 de mise en pause(plus de probleme avec les processeurs mtk et probleme de deferencement)
		-- 	if poussiere.pause1==0 then
		-- 		poussiere.pause1=1
		-- 		--if poussiere.actif==true then
		-- 			--poussiere:pause()
		-- 		--end
		-- 	end
		-- else
		-- 	if poussiere.pause1==1 then
		-- 		poussiere.pause1=0
		-- 		--animliqobj.principale:play()
		-- 	end
		-- 	if poussiere.cpt<30 then
		-- 		poussiere.xScale=poussiere.xScale+0.1
		-- 		poussiere.yScale=poussiere.xScale
		-- 		poussiere.y=poussiere.y-0.5
		-- 		poussiere.alpha=poussiere.alpha-0.03
		-- 		poussiere.cpt=poussiere.cpt+1
		-- 	else
		-- 		if poussiere~=nil then
		-- 			if poussiere.group~=nil and not removetotal then
		-- 				group[poussiere.group]:remove(poussiere)
		-- 				poussiere:removeSelf()
		-- 			end
		-- 		end
		-- 		poussiere=nil
		-- 		Runtime:removeEventListener( "enterFrame",listpoussiere)
		-- 	end
		-- end
	--end
	--Runtime:addEventListener("enterFrame",listpoussiere)
end
function perteviepro(x,y,impact,attaquebase,orientation,numero,type1,pole)--demande que l'on enleve les vies d'un personnage
	local cpt3=0
	local attcptvar=1
	local attaque=attaquebase
	local mini=1
	local maxi=nbsoldat
	if orientation==1 then
		mini=nbsoldatg
		maxi=0
	end
	for i=mini,maxi do
	--for i=1,nbsoldat,1 do
		--print("pole "..pole.." i "..i.." pole "..isoldat[i].pole)
		if isoldat[i].vivant and pole==isoldat[i].pole then -- orientation~=isoldat[i].orientation and -- and (zone1==isoldat[i].zone1 or zone2==isoldat[i].zone2) then
			local distanceprosold
			if goh then
				distanceprosold=mathabs(x-(isoldat[i].x1+isoldat[i].centrex*isoldat[i].direction))+mathabs(y-(isoldat[i].y1+isoldat[i].centrey-isoldat[i].height*0.35))
			else
				distanceprosold=mathabs(x-(isoldat[i].x1+isoldat[i].centrex*isoldat[i].direction))+mathabs(y-(isoldat[i].y1+isoldat[i].centrey))
			end
			-- print("impact "..impact.." distanceprosold "..distanceprosold.." numero "..i)
			if impact>distanceprosold then
				if distanceprosold<1 then
					distanceprosold=1
				end
				local attaquereel=mathfloor(attaque*(impact+3)/(impact+2*distanceprosold))
				-- debut retourdinformation
				if type1~=0 then
					ibatiment[numero].vieenlever=ibatiment[numero].vieenlever+attaquereel
					if isoldat[i].vie+5<isoldat[i].vietotale  then
						if true then -- issimulator then
							if fpschoisicycle==0 and (fpschoisi<1.5 and isoldat[i].pole==0) then
								local animsplashseq={name="levelup",
									frames={2,3,4,5,5,5,5,5,5,5,5,5,5,5},--frames= {1,4,5,3}, -- frame indexes of animation, in image sheet
									time = 500,
									loopCount = 1, }
								local animsplash=display.newSprite(imgbat.pique3,animsplashseq)
								animsplash.x=isoldat[i].ombre.x
								animsplash.y=isoldat[i].ombre.y-1
								animsplash.xScale=0.15
								animsplash.yScale=0.15
								animsplash.fill.effect = "filter.brightness"
								animsplash.fill.effect.intensity =0.6
								animsplash:setFillColor(1,0,0)
								animsplash.alpha=0.8
								animsplash:setSequence("levelup")
								spritegestion(animsplash,0)
								animsplash.group=mathfloor(animsplash.y-9)+1024
								group[animsplash.group]:insert(animsplash)
							end
						end
					end
				else
					if isoldat[numero].orientation==0 then
						--print("enleve vie de "..numero1.."de la part"..numero)
						if isoldat[numero].classe<4 then
							ibatiment[isoldat[numero].numbat].vieenlever=ibatiment[isoldat[numero].numbat].vieenlever+attaquereel--*fpschoisi
						elseif isoldat[numero].classe<7 then
							--vie enlever par le pv1
							retinf.attpv1=retinf.attpv1+attaquereel--*fpschoisi
						else
							retinf.attgene=retinf.attgene+attaquereel--*fpschoisi
							--vie enlever par le general
						end	
						enlevevie(numero,attaquereel)
						if isoldat[numero].typesoldat==172 then
							local viemax=(isoldat[numero].level^0.75)*100
							if viemax*5< isoldat[instance2.fin].vie then
								local numnew=spawnsoldat(instance2.fin,isoldat[instance2.fin].typesoldat,nil,0)
								convertunit(numnew)
								local attaque=isoldat[instance2.fin].vietotale-isoldat[instance2.fin].vie
								pertevie(numnew,attaque)
								if isoldat[numnew].vie>viemax then
									pertevie(numnew,isoldat[numnew].vie-viemax)
								end
								if goh then
									animationlevelup(isoldat[numnew].x1+isoldat[numnew].centrex,isoldat[numnew].y1+isoldat[numnew].centrey-isoldat[numnew].height*0.35,3)
								else
									animationlevelup(isoldat[numnew].x1+isoldat[numnew].centrex,isoldat[numnew].y1+isoldat[numnew].centrey,3)
								end
								pertevie(instance2.fin,100000)
							end
						end
					end
					print("vie enlver par une unité atttir l82")
				end
				-- fin retourdinformation
				--print("enleve les vies "..attaquereel)
				pertevie(i,attaquereel)
				-- print("attaque de "..attaquereel)
				cpt3=cpt3+1
				if cpt3>=4 then
					attcptvar=attcptvar*0.9
					if attcptvar<0.2 then
						attcptvar=0.2
					end
					attaque=mathfloor(attaque*attcptvar)
					cpt3=1
				end
				--print("impact"..(impact/(impact+2*distanceprosold)))
			end
		end
	end
end
local function calculangle(type1,numero,x1,y1,tir,actadvx,actadvy,x2,y2,numfl,typetra)--calcul de l'angle avec effet(3D+tir en cloche avec ou sans portance)
	--local actadvx=isoldat[numero1].x1
	--local actadvy=isoldat[numero1].y1
	--local x2=x1 
	--local y2=y1
	--if type1==1 then
	--	x2=ibatiment[numero].x+ibatiment[numero].xbase
	--	y2=ibatiment[numero].y+ibatiment[numero].ybase
	--end
	local dist=nil
	local distreel=nil
	local denom=mathsqrt((x1-actadvx)*(x1-actadvx)+(y1-actadvy)*(y1-actadvy))
	if denom<0.05 and denom>=0 then
		denom=0.05
	elseif denom>-0.05 and denom<=0 then
		denom=0.05
	end

	--angle de la trajectoire
	local angle=math.acos((actadvx-x1)/denom)*180/3.14
	if y1>actadvy then
		angle=-angle
	end
	--print("angle: "..angle)
	dist=mathfloor(denom*26/(mathsqrt(20000)*tir.vitesse))
	if type1==1 then
		distreel=mathfloor(mathsqrt((x2-actadvx)*(x2-actadvx)+(y2-actadvy)*(y2-actadvy))*26/(mathsqrt(20000)*tir.vitesse))
	else
		distreel=dist
	end
	--print("instance2.dist ="..instance2.dist)
	--angle de l'effet en cloche
	local angle1=0
	local angle2=0
	local angleor=nil--angle d'origine de l'effet de la fleche
	local testanglepoureffet=0
	if angle>95 then
		testanglepoureffet=1
	elseif angle<85 and angle>-85 then
		testanglepoureffet=1
	elseif angle<-95 then
		testanglepoureffet=1
	end
	local testangleeff=0
	if typetra==2 or (typetra==1 and (typepro=="01" or typepro=="02" or typepro=="03")) then--(typetra)
		testangleeff=1
	elseif typetra==0 and typepro=="14" then--typepro~="14" then
		testangleeff=1
	end
	--print("testanglepoureffet: "..testanglepoureffet.."testangleeff: "..testangleeff)
	if (typetra~=1 or (typetra==1 and (typepro=="01" or typepro=="02" or typepro=="03"))) and testanglepoureffet==1 then-- testangleeff==1 and testanglepoureffet==1 then--(typetra==2 or (typetra==0 and typepro~="14")) and (angle>95 or (angle<85 and angle>-85) or angle<-95) then
		--print("effet angle")
		if dist>=35 then--distreel
			angle2=45
		elseif dist>=25 then
			angle2=35
		elseif dist>=15 then
			angle2=25
		elseif dist>=7 then
			angle2=10
		else
			angle2=5
		end
		--angle2=45
		local limmax=nil
		if angle<85 and angle>-85 then
			limmax=85
		elseif angle>95 or angle<-95 then
			limmax=95
		end
		if angle>limmax-5 then
			angle2=0.5*angle2
		elseif angle>limmax-5-10 then
			angle2=0.7*angle2
		elseif angle>limmax-5-20 then
			angle2=0.8*angle2
		elseif angle>limmax-5-30 then
			angle2=0.9*angle2
		end
		if angle<85 and angle>=0 then
			angle2=-angle2
			
			--print("entre 60 et 0")
			if angle+1*angle2>85 then
				angle2=85-angle
			end
		elseif angle>-85 and angle<0 then
			angle2=-angle2
			--print("entre -60 et 0")
			if angle+1*angle2>85 then
				angle2=85-angle
			end
		elseif angle>95 then
			angle2=angle2
			--print("sup a 95")
			if angle+1*angle2<95 then
				angle2=95-angle
				--print("correction")
			end
		elseif  angle<-95 then
			angle2=angle2
			--print("inf a -120")
			if angle+1*angle2>-95 then
				angle2=-95-angle
			end
		end
		angle1=angle1+1*angle2
	end
	local angle2pos=1
	if angle2<0 then
		angle2pos=-1
	end
	angleor=angle2
	local tabtemp={}
	tabtemp.angleor=angleor
	tabtemp.angle=angle
	tabtemp.angle2=angle2
	tabtemp.testanglepoureffet=testanglepoureffet
	tabtemp.dist=dist
	tabtemp.distreel=distreel
	tabtemp.angle2pos=angle2pos
	if type1==0 then
		isoldat[numero].tir.flecheinf[numfl]=tabtemp
		if numfl==1 then -- and ibatiment[numero].type2==0 then
			if actadvx>x1 then
				if isoldat[numero].tir.bras.xscalepos==1 then
					isoldat[numero].tir.bras.xScale=-1*	isoldat[numero].tir.bras.xScale
					isoldat[numero].tir.bras.xscalepos=-1

				end
			else
				if isoldat[numero].tir.bras.xscalepos==-1 then
					isoldat[numero].tir.bras.xScale=-1*	isoldat[numero].tir.bras.xScale
					isoldat[numero].tir.bras.xscalepos=1
				end
			end
			--print("actu direction")
			-- isoldat[numero].tir.bras:rotate(-isoldat[numero].tir.bras.angle)
			-- isoldat[numero].tir.bras.angle=angle+1*angle2
			-- isoldat[numero].tir.bras:rotate(isoldat[numero].tir.bras.angle)
		end
	else
		if numfl==1 and goh and ibatiment[numero].type2<=1 then
			if actadvx>x1 then
				if ibatiment[numero].bras.xScale>0 then
					ibatiment[numero].bras.xScale=-ibatiment[numero].bras.xScale
				end
			elseif ibatiment[numero].bras.xScale<0 then
				ibatiment[numero].bras.xScale=-ibatiment[numero].bras.xScale
			end
		end
		if numfl==1 and ibatiment[numero].type2==0 and ibatiment[numero].niveau~=4 and not goh then
			ibatiment[numero].bras:rotate(-ibatiment[numero].bras.angle)-- a optimiser faire une seule rotation
			-- local angleaction=0
			-- if (angle2pos==1 and angle2>-10)or (angle2pos==-1 and angle2<10) then
			-- 	angleaction=1
			-- end
			-- if angleaction~=0 then
			-- 	angleaction=(-angle2pos*angleor*angleaction/dist*5)*1
			-- end
			-- print("angleaction"..angleaction)
			ibatiment[numero].bras.angle=angle+1*angle2 -- +angleaction 
			if ibatiment[numero].bras.angle>90 then
				ibatiment[numero].bras.yScale=-ibatiment[numero].bras.xScale
				ibatiment[numero].bras.angle=ibatiment[numero].bras.angle+45
				if ibatiment[numero].bras.angle<150 then
					ibatiment[numero].bras.angle=150
				end
			else
				ibatiment[numero].bras.yScale=ibatiment[numero].bras.xScale
				if ibatiment[numero].bras.angle>30 then
					ibatiment[numero].bras.angle=30
				elseif ibatiment[numero].bras.angle<-120 then
					ibatiment[numero].bras.angle=-140
				elseif ibatiment[numero].bras.angle<-85 then
					ibatiment[numero].bras.angle=-85
				elseif ibatiment[numero].bras.angle<0 then
					ibatiment[numero].bras.angle=ibatiment[numero].bras.angle+angle2
				end
			end
			print("ibatiment[numero].bras.angle "..ibatiment[numero].bras.angle.." angle "..angle.." angle2 "..angle2)
			-- print("ibatiment[numero].bras.angle "..ibatiment[numero].bras.angle)
			-- if ibatiment[numero].bras.angle>225 and ibatiment[numero].bras.angle<270 then
			-- 	ibatiment[numero].bras.angle=225
			-- elseif ibatiment[numero].bras.angle<-225 and ibatiment[numero].bras.angle>-270 then
			-- 	ibatiment[numero].bras.angle=-225
			-- elseif ibatiment[numero].bras.angle<165 and ibatiment[numero].bras.angle>90 then
			-- 	ibatiment[numero].bras.angle=165
			-- elseif ibatiment[numero].bras.angle>45 and ibatiment[numero].bras.angle<90 then
			-- 	ibatiment[numero].bras.angle=45
			-- elseif ibatiment[numero].bras.angle<-45 and ibatiment[numero].bras.angle>-90 then
			-- 	ibatiment[numero].bras.angle=-45
			-- elseif ibatiment[numero].bras.angle>-165 and ibatiment[numero].bras.angle<-90 then
			-- 	ibatiment[numero].bras.angle=-165
			-- end
			--print("ibatiment[numero].bras.angle1 "..ibatiment[numero].bras.angle)
			ibatiment[numero].bras:rotate(ibatiment[numero].bras.angle)
		end
		ibatiment[numero].flecheinf[numfl]=tabtemp
	end
end
function tirpro(type1,numero,x1,y1,numero1,numfl,sheet1,impact,orientation,x2,y2,typepro,typetra,tir,pole) --,zone1,zone2)--tir du projectile avec animation
	--print("pole"..pole)
	--local pause1=require("pause")
	--local tir={}
	--local orientation=0--x1 position du projectile
	--local x2=x1--position de la base du soldat pour calculer la distance
	--local y2=y1
	--local typepro="01"--type de projectile
	--local typetra=0--type de trajectoire 0 sans asservissement (boulet),1 vas sur la cible avec un leger asservissement, 2 asservissement totale 
	--local sheet1 =impro.projectiles
	if goh then
		if type1==1 then
			if ibatiment[numero].type1==2 and ibatiment[numero].type2==1 then
				affbrouillardglob(nil,x1,y1,ibatiment[numero].bras.numgroup+10,1,3)
				-- affbrouillardglob(nil,x1,y1,nil)
				-- affbrouillardglob(nil,x1,y1,nil)
			end
		end
	end
	sontirds=sontirds+1
	if typetra==0 then
		audio.play(son.combatcanon,{channel=mathrandom(15,19)})
	else
		local alea=mathrandom(3)
		audio.play(son.combatarc[alea],{channel=alea+14})
	end
	local instance2 = display.newSprite( sheet1, sequence.tir )
	local advx=nil--position de l'adversaire pour tir sans asservissement
	local advy=nil
	local cpt=0--compteur
	local eftytra=0--contrer l'asservissement qui corrige l'effet
	--local impact=0--rayon de l'impact
	local ombre=nil--ombre du projectile
	--print("numero1:"..numero1)
	print("atttir 417 "..numero1)
	local actadvx=isoldat[numero1].x1+isoldat[numero1].direction*isoldat[numero1].centrex
	local actadvy
	if goh then
		actadvy=isoldat[numero1].y1+isoldat[numero1].centrey-isoldat[numero1].height*0.35
	else
		actadvy=isoldat[numero1].y1+isoldat[numero1].centrey
	end
	--local poussiere=nil
	if typepro=="01" or typepro=="02" or typepro=="03" or typepro=="04" then
		ombre=display.newImage(imbouton.ombrefl,1)
	else
		ombre=display.newImage(imbouton.ombrebou,1)
	end
	if typetra==1 or typetra==2 then--if type1==0 or (type1==1 and ibatiment[numero].type2==0) then
		--ombre=display.newImage(imbouton.ombrefl,1)
	else
		advx=actadvx--isoldat[numero1].x1
		advy=actadvy--isoldat[numero1].y1
		--ombre=display.newImage(imbouton.ombrebou,1)
		-- if poussiere==nil then
		-- 	poussiere=display.newImage(impro.poussiere,1)
		-- 	poussiere.isVisible=false
		-- end
		
	end
		ombre.x=x2
		ombre.y=y2
		ombre.alpha=0.3
		if typetra==1 then
			ombre.alpha=0.3
			ombre.xScale=0.3
			ombre.yScale=0.3
		else
			ombre.alpha=0.3
			ombre.xScale=0.5
			ombre.yScale=0.5
		end
		group[2]:insert(ombre)
		instance2:setSequence(typepro)
		instance2.x = x1
		instance2.y = y1
		instance2.xScale = 0.15
		if type1==0 then
			instance2.xScale=isoldat[numero].tir.projscale
			ombre.xScale=4*instance2.xScale
			ombre.yScale=ombre.xScale
		end
		instance2.yScale=instance2.xScale
		
		local trainee=display.newImage(impro.trainee,1)--display.newImage("batiment/projectiles/trainee.png",instance2.x,instance2.y)
		trainee.x=instance2.x-0.05
		trainee.y=instance2.y-0.05
		trainee.xScale=instance2.xScale
		trainee.yScale=instance2.yScale
		--[[local denom=mathsqrt((x1-actadvx)^2+(y1-actadvy)^2)
		if denom<0.05 and denom>=0 then
			denom=0.05
		elseif denom>-0.05 and denom<=0 then
			denom=0.05
		end

		--angle de la trajectoire
		local angle=math.acos((actadvx-x1)/denom)*180/3.14
		if y1>isoldat[numero1].y1 then
			angle=-angle
		end
		--print("angle: "..angle)
		instance2.dist=mathfloor(denom*26/(mathsqrt(20000)*tir.vitesse))
		if type1==1 then
			instance2.distreel=mathfloor(mathsqrt((x2-actadvx)^2+(y2-actadvy)^2)*26/(mathsqrt(20000)*tir.vitesse))
		else
			instance2.distreel=instance2.dist
		end
		--print("instance2.dist ="..instance2.dist)
		--angle de l'effet en cloche
		local angle1=0
		local angle2=0
		local angleor=nil--angle d'origine de l'effet de la fleche
		local testanglepoureffet=0
		if angle>95 then
			testanglepoureffet=1
		elseif angle<85 and angle>-85 then
			testanglepoureffet=1
		elseif angle<-95 then
			testanglepoureffet=1
		end
		local testangleeff=0
		if typetra==2 then
			testangleeff=1
		elseif typetra==0 and typepro=="14" then--typepro~="14" then
			testangleeff=1
		end
		--print("testanglepoureffet: "..testanglepoureffet.."testangleeff: "..testangleeff)
		if typetra~=1 and testanglepoureffet==1 then-- testangleeff==1 and testanglepoureffet==1 then--(typetra==2 or (typetra==0 and typepro~="14")) and (angle>95 or (angle<85 and angle>-85) or angle<-95) then
			--print("effet angle")
			if instance2.dist>=35 then--distreel
				angle2=45
			elseif instance2.dist>=25 then
				angle2=35
			elseif instance2.dist>=15 then
				angle2=25
			elseif instance2.dist>=7 then
				angle2=10
			else
				angle2=5
			end
			--angle2=45
			local limmax=nil
			if angle<85 and angle>-85 then
				limmax=85
			elseif angle>95 or angle<-95 then
				limmax=95
			end
			if angle>limmax-5 then
				angle2=0.5*angle2
			elseif angle>limmax-5-10 then
				angle2=0.7*angle2
			elseif angle>limmax-5-20 then
				angle2=0.8*angle2
			elseif angle>limmax-5-30 then
				angle2=0.9*angle2
			end
			if angle<85 and angle>=0 then
				angle2=-angle2
				
				--print("entre 60 et 0")
				if angle+1*angle2>85 then
					angle2=85-angle
				end
			elseif angle>-85 and angle<0 then
				angle2=-angle2
				--print("entre -60 et 0")
				if angle+1*angle2>85 then
					angle2=85-angle
				end
			elseif angle>95 then
				angle2=angle2
				--print("sup a 95")
				if angle+1*angle2<95 then
					angle2=95-angle
					--print("correction")
				end
			elseif  angle<-95 then
				angle2=angle2
				--print("inf a -120")
				if angle+1*angle2>-95 then
					angle2=-95-angle
				end
			end
			angle1=angle1+1*angle2
		end
		local angle2pos=1
		if angle2<0 then
			angle2pos=-1
		end
		angleor=angle2]]
		if type1==0 then 
			if typepro=="12" then
				if isoldat[numero].gene==1 then
					instance2:setFillColor(0,1,0)
				end
			end
		end
		if numfl~=1 then
			calculangle(type1,numero,x1,y1,tir,actadvx,actadvy,x2,y2,numfl,typetra)
		end
		local angle=nil
		local angleor=nil
		local angle2=nil
		local testanglepoureffet=nil
		local angle2pos=nil
		if type1==0 then
			angle=isoldat[numero].tir.flecheinf[numfl].angle
			angleor=isoldat[numero].tir.flecheinf[numfl].angleor
			angle2=isoldat[numero].tir.flecheinf[numfl].angle2
			testanglepoureffet=isoldat[numero].tir.flecheinf[numfl].testanglepoureffet
			instance2.dist=isoldat[numero].tir.flecheinf[numfl].dist
			instance2.distreel=isoldat[numero].tir.flecheinf[numfl].distreel
			angle2pos=isoldat[numero].tir.flecheinf[numfl].angle2pos
		else
			angle=ibatiment[numero].flecheinf[numfl].angle
			angleor=ibatiment[numero].flecheinf[numfl].angleor
			angle2=ibatiment[numero].flecheinf[numfl].angle2
			testanglepoureffet=ibatiment[numero].flecheinf[numfl].testanglepoureffet
			instance2.dist=ibatiment[numero].flecheinf[numfl].dist
			instance2.distreel=ibatiment[numero].flecheinf[numfl].distreel
			angle2pos=ibatiment[numero].flecheinf[numfl].angle2pos
		end

		--print("angle2 :"..angle2.." angle: "..angle)
		--necessaire angleor angle angle2 testanglepoureffet
		ombre:rotate(angle)
		instance2:rotate(angle+1*angle2)
		trainee:rotate(angle+1*angle2)
		group[2048]:insert(instance2)
		group[2048]:insert(trainee)
		instance2.gros=0
		--instance2.cpt=0
		instance2.fin=0--0 si pas fini si fini et pas de mec toucher -1 et sinon numero du mec toucher
		instance2.pause1=0
		instance2:play()
		--constante de dep du pro sans asservissement
		local depx=nil
		local depy=nil
		if typetra==0 then
			depx=(advx-x1)/instance2.dist
			depy=(advy-y1)/instance2.dist
		end
		--instance2.anframe=nil
		instance2.fpschoisi=true --affichage effet
		if fpschoisi>=2 then
			instance2.fpschoisi=false
			ombre.isVisible=false
			trainee.isVisible=false
		end
		local function instance( event )
			if removepartiel1==true then
				group[2048]:remove( trainee )
				trainee:removeSelf( )
				instance2:pause()
				Runtime:removeEventListener( "enterFrame",instance)
				group[2048]:remove(instance2)
				instance2:removeSelf( )
				group[2]:insert(ombre)
				ombre:removeSelf()
				instance2=nil
				trainee=nil
				ombre=nil
			else
			if jeupause.etat==1 then--technique numero 3 de mise en pause(plus de probleme avec les processeurs mtk et probleme de deferencement)
				if instance2.pause1==0 then
					instance2.pause1=1
					instance2:pause()
				end
			else
				if instance2.pause1==1 then
					instance2.pause1=0
					instance2:play()
				end
				if true then
			--if instance2.frame~=instance2.anframe then--if(event.phase=="loop")then
			--	instance2.anframe=instance2.frame
			--if instance2.pause1==0 then
				if isoldat[numero1].vivant==true then
					actadvx=isoldat[numero1].x1+isoldat[numero1].centrex*isoldat[numero1].direction
					if goh then
						actadvy=isoldat[numero1].y1+isoldat[numero1].centrey-isoldat[numero1].height*0.35
					else
						actadvy=isoldat[numero1].y1+isoldat[numero1].centrey
					end
				end
				--deplacement du projectile
				if typetra~=2 then
					ancienx=instance2.x
					ancieny=instance2.y
				end
				if typetra==0 then
					cpt=cpt+1*fpschoisi --mdmoyennechosi
					instance2:translate(depx*fpschoisi,depy*fpschoisi)
					--instance2.x=instance2.x+depx*fpschoisi--26
					--instance2.y=instance2.y+depy*fpschoisi--26
					if instance2.fpschoisi then
						ombre.x=instance2.x+depx+(x2-x1)*(instance2.dist-(cpt+1))/instance2.dist
						ombre.y=instance2.y+depy+(y2-y1)*(instance2.dist-(cpt+1))/instance2.dist
					end
				elseif typetra==1 then
					cpt=cpt+1*fpschoisi
					instance2:translate((actadvx-x1)/instance2.dist*fpschoisi,(actadvy-y1)/instance2.dist*fpschoisi)
					--instance2.x=instance2.x+(actadvx-x1)/instance2.dist*fpschoisi--26
					--instance2.y=instance2.y+(actadvy-y1)/instance2.dist*fpschoisi--26
				elseif typetra==2 then
					cpt=cpt+1*fpschoisi
					instance2.x=x1+cpt*(actadvx-x1)/instance2.dist
					instance2.y=y1+cpt*(actadvy-y1)/instance2.dist
					if instance2.fpschoisi then
						ombre.x=x1+cpt*(actadvx-x1)/instance2.dist+(x2-x1)*(instance2.dist-cpt)/instance2.dist
						ombre.y=y1+cpt*(actadvy-y1)/instance2.dist+(y2-y1)*(instance2.dist-cpt)/instance2.dist
					end
				end
				if instance2.fpschoisi then
					if typetra~=2 then
						if typetra~=1 then
							ombre:translate(instance2.x-ancienx,instance2.y-ancieny)
							--ombre.x=ombre.x+instance2.x-ancienx
							--ombre.y=ombre.y+instance2.y-ancieny
						else
							ombre.x=instance2.x+2
							ombre.y=instance2.y+2
						end
					end
				end
				local calculdist1=(x1-actadvx)*(x1-actadvx)+(y1-isoldat[numero1].y1)*(y1-isoldat[numero1].y1)

				--effet angle de la cloche


				--effet cloche
				if typretra==1 and (typepro~="01" or typepro~="02" or typepro~="03") then
					local calculdist2=(instance2.x-actadvx)*(instance2.x-actadvx)+(instance2.y-actadvy)*(instance2.y-actadvy)
					if calculdist1<calculdist2*2 then
					--if instance2.cpt<instance2.dist/2 then
						instance2.xScale=instance2.xScale+0.01
						if numfl>=2 then
							instance2:translate(-(numfl+1)*0.5,0)
							-- instance2.x=instance2.x-(numfl+1)*0.5
						end
					else
						instance2.xScale=instance2.xScale-0.01
						if numfl>=2 then
							instance2:translate((numfl-1)*0.5,0)
							-- instance2.x=instance2.x+(numfl-1)*0.5
						end
					end
					if instance2.xScale<0.15 then
						instance2.xScale=0.15
					end
				end
				if typetra==0 or typetra==2 or (typetra==1 and (typepro=="01" or typepro=="02" or typepro=="03")) then
					local i=nil
					if cpt<=instance2.dist/5 then
						i=1
					elseif cpt<=instance2.dist*2/5 then
						i=2
					elseif cpt<=instance2.dist*3/5 then
						i=3
					elseif cpt<=instance2.dist*4/5 then
						i=4
					else
						i=5
					end
					if typetra==2 then
						eftytra=eftytra+trajectoire.fle[i]*1
						instance2.y=instance2.y+eftytra
						instance2.xScale=instance2.xScale-trajectoire.fle[i]*0.01
					else
						instance2.y=instance2.y+trajectoire.boul[i]*1
						instance2.xScale=instance2.xScale-trajectoire.boul[i]*0.01
					end
					if  typetra~=1 and testanglepoureffet==1 then-- (typetra==2 or (typetra==0 and typepro~="14")) and (angle>95 or (angle<85 and angle>-85) or angle<-95) then
						--print("correctif".."angle2pos: "..angle2pos.."angleor: "..angleor)
						local angleaction=0
						if (angle2pos==1 and angle2>-10)or (angle2pos==-1 and angle2<10) then
						--if angle2>angle2pos*-10 then--regarde si l'angle est pos
							--if angle2>-10 then
								if typetra==2 then
									angleaction=-trajectoire.fleangle[i]-- -trajectoire.fleangle[i]
								else
									angleaction=-trajectoire.boulangle[i]
								end
								if angle>90 or angle<-90 then
									angleaction=-angleaction
								end
							--end
						--else
						--	if angle2<10 then
						--		if typetra==2 then
						--			angleaction=trajectoire.fleangle[i]
						--		else
						--			angleaction=trajectoire.boulangle[i]
						--		end
						--	end
						end
						if angleaction~=0 then
							angleaction=-angle2pos*angleor*angleaction/instance2.dist*5
							angle2=angle2+angleaction
							--print("angle2 evol"..angle2.."rotate"..angleaction)
							if typetra==2 or (typetra==0 and typepro=="14") or (typetra==1 and (typepro=="01" or typepro=="02" or typepro=="03")) then
								instance2:rotate(angleaction)
							end
							if instance2.fpschoisi then
								trainee:rotate(angleaction)
							end
						end
					end
					if typetra==0 and typepro~="14" then
						instance2:rotate(5)
					end
				end
				if instance2.fpschoisi then
					trainee.y=instance2.y
					trainee.x=instance2.x
					instance2.yScale=instance2.xScale
					trainee.xScale=instance2.xScale-0.05
					trainee.yScale=instance2.xScale-0.05
				end
				--verification si le projectile est arrivé
				if typetra==0 or typetra==2 then
					if cpt>=instance2.dist then
						if typetra==2 then
							instance2.fin=numero1
							--print("type2 ".. instance2.fin)
						else
							--print("pertevie"..pole)
							perteviepro(instance2.x,instance2.y,impact,tir.attaque,orientation,numero,type1,pole)
							-- for i=1,nbsoldat,1 do
							-- 	if orientation~=isoldat[i].orientation and isoldat[i].vivant==true then
							-- 		local distanceprosold=(instance2.x-isoldat[i].x1)^2+(instance2.y-isoldat[i].y1)^2
							-- 		if impact>distanceprosold then
							-- 			if distanceprosold<1 thenx
							-- 				distanceprosold=1
							-- 			end
							-- 			pertevie(i,tir.attaque*impact/(impact+2*distanceprosold))
							-- 			print("impact"..(impact/(impact+2*distanceprosold)))
							-- 		end
							-- 	end
							-- end
							instance2.fin=-1
							if instance2.fpschoisi then
								if instance2.y~=nil then
									if typetra~=1 and typetra~=2 and type1~=0 then
										-- local pousiere=nil
										-- poussiere=display.newImage(impro.poussiere,1)
										-- poussiere.isVisible=false
										-- poussiere.x=instance2.x
										-- poussiere.y=instance2.y
										-- if instance2.y>=2048 or instance2.y<=-2048 then
										-- 	--for i=0,100 do
										-- 		--print("error nombre non reel")
										-- 	--end
										-- else
										-- 	--print("instance2.y "..instance2.y)
										-- 	poussiere.group=mathfloor(instance2.y+1024)
										-- 	--print("poussiere group "..poussiere.group)
										-- 	group[poussiere.group]:insert(poussiere)
										-- 	poussiereevenement(poussiere)
											poussiereevenement(instance2.x,instance2.y,typepro)
										--end
									end
								else
									--print("bug poussiere atttir 629")
								end
							end
						end
					end
				elseif typetra==1 then
					if mathabs(instance2.x-actadvx)+mathabs(instance2.y-actadvy)<15 then
						if isoldat[numero1].vivant==true then
							instance2.fin=numero1
							--print("type1 ".. instance2.fin)
							--pertevie(numero1,isoldat[numero].tir.attaque)
						else
							instance2.fin=-1
							--print("type1".. instance2.fin)
						end
					elseif calculdist1<(instance2.x-x1)*(instance2.x-x1)+(instance2.y-y1)*(instance2.y-y1) then
						local mini=1
						local maxi=nbsoldat
						if orientation==1 then
							mini=nbsoldatg
							maxi=0
						end
						for i=mini,maxi do
						--for i=1,nbsoldat,1 do
							if orientation~=isoldat[i].orientation and i~=numero1 and isoldat[i].vivant==true and pole==isoldat[i].pole then
								if goh then
									if 15>mathabs(instance2.x-(isoldat[i].x1+isoldat[i].direction*isoldat[i].centrex))+mathabs(instance2.y-(isoldat[i].y1+isoldat[i].centrey-isoldat[i].height*0.35)) then
										instance2.fin=i
										break
									end
								else
									if 15>mathabs(instance2.x-(isoldat[i].x1+isoldat[i].direction*isoldat[i].centrex))+mathabs(instance2.y-(isoldat[i].y1+isoldat[i].centrey)) then
										instance2.fin=i
										break
									end
								end
							end
						end
						if instance2.fin==0 then
							instance2.fin=-1
				end	end	end	
				if instance2.fin~=0 then
					local etaitvivant=false
					if instance2.fin~=-1 then
						if isoldat[instance2.fin].vivant==true then
							etaitvivant=true
							--debut retourdinformation
							if type1~=0 then
								if ibatiment[numero]~=nil then -- condition suffisante a corriger le bug de revente de bat lorsque le pro et en l'air et que le tel lag a donf
									ibatiment[numero].vieenlever=ibatiment[numero].vieenlever+tir.attaque
								end
							else
								if isoldat[numero].orientation==0 then
									--print("enleve vie de "..numero1.."de la part"..numero)
									if isoldat[numero].classe<4 then
										ibatiment[isoldat[numero].numbat].vieenlever=ibatiment[isoldat[numero].numbat].vieenlever+tir.attaque--*fpschoisi
									elseif isoldat[numero].classe<7 then
										--vie enlever par le pv1
										retinf.attpv1=retinf.attpv1+tir.attaque--*fpschoisi
									else
										retinf.attgene=retinf.attgene+tir.attaque--*fpschoisi
										--vie enlever par le general
									end	
									enlevevie(numero,tir.attaque)
									if isoldat[numero].typesoldat==172 then
										local viemax=(isoldat[numero].level^0.75)*100
										if viemax*5< isoldat[instance2.fin].vie then
											local numnew=spawnsoldat(instance2.fin,isoldat[instance2.fin].typesoldat,nil,0)
											convertunit(numnew)
											local attaque=isoldat[instance2.fin].vietotale-isoldat[instance2.fin].vie
											pertevie(numnew,attaque)
											if isoldat[numnew].vie>viemax then
												pertevie(numnew,isoldat[numnew].vie-viemax)
											end
											if goh then
												animationlevelup(isoldat[numnew].x1+isoldat[numnew].centrex,isoldat[numnew].y1+isoldat[numnew].centrey-isoldat[numnew].height*0.35,3)
											else
												animationlevelup(isoldat[numnew].x1+isoldat[numnew].centrex,isoldat[numnew].y1+isoldat[numnew].centrey,3)
											end
											pertevie(instance2.fin,100000)
										end
									end
								end
								
								print("vie enlever par une unité atttir l747")
							end
							-- fin retourdinformation
							pertevie(instance2.fin,tir.attaque,1)
					end	end
					if instance2.fpschoisi then
						local sheet2 =impro.projectiles1
						sequence.tir.time=30
						local instance3 = display.newSprite(sheet2,sequence.tir)
						instance3:setSequence(typepro)
						instance3.numero=instance2.fin
						instance3.x = instance2.x
						instance3.y = instance2.y
						instance3.xScale=instance2.xScale
						instance3.yScale=instance2.yScale
						if type1==0 then
							if typepro=="14" then
								instance3:setFillColor(1,0,0)
								instance3.xScale=instance3.xScale*0.4
								instance3.yScale=instance3.yScale*0.4
							end
						end
						if typepro=="01" or typepro=="02" or typepro=="03" or typepro=="04" then
							instance3:rotate(angle)
						end
						instance3.group=mathfloor(instance3.y)+1024-10
						instance3.group=3
						instance3.anim=0
						if instance2.fin~=-1 and (typepro=="01" or typepro=="02" or typepro=="03" or typepro=="04") then
							if isoldat[instance2.fin].vivant==true or etaitvivant then
								instance3.numero=instance2.fin
								instance3.group=mathfloor(actadvy+3)+1024
								instance3.xpos=actadvx-instance3.x
								instance3.ypos=actadvy-instance3.y
								instance3.anim=1
								instance3.cpt=0
						end	end
						group[instance3.group]:insert(instance3)
						instance3.pause1=0
						instance3:play()
						local function instance31( event )
							if jeupause.etat==1 then--technique numero 3 de mise en pause(plus de probleme avec les processeurs mtk et probleme de deferencement)
								if instance3.pause1==0 then
									instance3.pause1=1
									instance3:pause()
								end
							else
								if instance3.pause1==1 then
									instance3.pause1=0
									instance3:play()
								end
								if isoldat[instance3.numero].vivant==true then -- isoldat[instance3.numero].vie>0 then
									instance3.x=isoldat[instance3.numero].x1+instance3.xpos+isoldat[instance3.numero].direction*isoldat[instance3.numero].centrex
									local ancieny=instance3.y
									if goh then
										instance3.y=isoldat[instance3.numero].y1+instance3.ypos+isoldat[instance3.numero].centrey+isoldat[instance3.numero].effetvero-isoldat[instance3.numero].height*0.35
									else
										instance3.y=isoldat[instance3.numero].y1+instance3.ypos+isoldat[instance3.numero].centrey+isoldat[instance3.numero].effetvero
									end
									if instance3.y~=ancieny then
										group[instance3.group]:remove(instance3)
										instance3.group=mathfloor(isoldat[instance3.numero].y1+3)+1024
										group[instance3.group]:insert(instance3)
									end
								else
									instance3.cpt=100
								end
								instance3.cpt=instance3.cpt+1
								if instance3.cpt>100 then
									Runtime:removeEventListener( "enterFrame",instance31)
									group[instance3.group]:remove(instance3)
									instance3:removeSelf( )
						end	end	end				
						if instance3.anim==1 then
							Runtime:addEventListener( "enterFrame", instance31 )
							ombre.alpha=0
							group[2]:remove(ombre)
							ombre:removeSelf()
							ombre=nil
						else
							ombre.xScale=ombre.xScale*2/3
							ombre.yScale=ombre.xScale
							ombre.x=instance3.x
							ombre.y=instance3.y
							local num
							local i=0
							local function proplan(event)
								i=i+1
								if i<7 then
									local proplan1=timer.performWithDelay( 500,proplan)
									local lenum=timerpause(4,proplan1,num)
									if lenum==-1 then
										i=7
								end	end
								if i>=7 then
									--print("num"..num)
									jeupause.timerlibre[num]=0
									group[instance3.group]:remove(instance3)
									instance3:removeSelf( )
									ombre.alpha=0
									group[2]:remove(ombre)
									ombre:removeSelf()
									ombre=nil
							end	end
							local proplan1=timer.performWithDelay( 1,proplan)
							num=timerpause(3,proplan1,nil)
						end
					else
						group[2]:remove(ombre)
						ombre:removeSelf()
						ombre=nil
					end
					group[2048]:remove( trainee )
					trainee:removeSelf( )
					instance2:pause()
					Runtime:removeEventListener( "enterFrame",instance)
					group[2048]:remove(instance2)
					instance2:removeSelf( )
					instance2=nil
					trainee=nil
				end
		
			end
			end
			end
		end
		Runtime:addEventListener("enterFrame",instance)
end
function demandepro(type1,numero,x1,y1,tir,pole) --,zone1,zone2)--demande le tir d'un projectile
	print("demandepro")
	--print("pole"..pole)
	--local pause1=require("pause")
	if type1==0 then
		 isoldat[numero].tir.tirer=0
	end
	--print("envoi pro")
	--tout ce qui va etre constant à tout les projectiles
	
	local tir={}
	local sheet1 =impro.projectiles
	local impact=0--rayon de l'impact
	local orientation=0--x1 position du projectile
	local x2=x1--position de la base du soldat pour calculer la distance
	local y2=y1
	local typepro="01"--type de projectile
	local typetra=0--type de trajectoire 0 sans asservissement (boulet),1 vas sur la cible avec un leger asservissement, 2 asservissement totale 
	if type1==0 then
		tir=isoldat[numero].tir
		orientation=isoldat[numero].orientation
		typetra=isoldat[numero].tir.typetra --1
		typepro=isoldat[numero].tir.proj
		impact=isoldat[numero].tir.impact
		-- tir.zone1=isoldat[numero].zone1
		-- tir.zone2=isoldat[numero].zone2
	elseif type1==1 then
		tir=ibatiment[numero]
		x2=ibatiment[numero].x1+ibatiment[numero].xbase
		y2=ibatiment[numero].y1+ibatiment[numero].ybase
		-- tir.zone1=ibatiment[numero].zone1
		-- tir.zone2=ibatiment[numero].zone2
		if ibatiment[numero].type2==0 then
			if ibatiment[numero].niveau==1 then
				typepro="01"
			else
				if ibatiment[numero].niveau==2 then
					typepro= "02"
				else
					if ibatiment[numero].niveau==3 then
						typepro="03"
					else
						typepro="04"
					end
				end
			end
			typetra=2
		elseif ibatiment[numero].type2==1 then
			if ibatiment[numero].niveau==2 then
				typepro="12"
			else
				if ibatiment[numero].niveau==3 then
					typepro="13"
				else
					typepro="14"
				end
			end
			typetra=0
			impact=ibatiment[numero].impact
		end
	end
	for k=1,tir.nbfleche,1 do
		local num
		local function envoyerfl(event)
			jeupause.timerlibre[num]=0
			if tir.fleche[k]>=nbsoldatg and tir.fleche[k]<=nbsoldat and tir.fleche[k]~=0 then
				tirpro(type1,numero,x1,y1,tir.fleche[k],k,sheet1,impact,orientation,x2,y2,typepro,typetra,tir,pole) --,zone1,zone2)
				--print("pole"..pole)
			end
		end
		local letimer=timer.performWithDelay( 60*(k-1)*vitessejeuin+1,envoyerfl)
		num=timerpause(1,letimer,nil)
	end
	if type1==0 then
		--timersoldatatt(numero,0)
	end
end

function rechercheverif(type1,numero,x1,y1)--recherche les adversaire sur lequel tirer avec tout les projectiles de la volée
	-- objectifs:
		-- chaque projectile doit avoir une cible si possible
		-- les projectiles doivent chercher a avoir des cibles differentes
		-- les projectiles de degat de zone cherche les plus gros groupe d'unité
		-- les projectiles classique vise les unités les plus proches de l'arriver pour les defenseurs ou les plus proches d'eux pour les attaquants
		-- les projectiles d'une meme volée doivent avoir des trajectoires possibles. 
			--Ex: Il ne faut pas qu'une baliste qui tire 2 carreaux a la fois aillent dans deux directions differentes
			
	local typeproj=0
	local x2=x1 -- copie des variables pour qu'elles ne puisses pas etre detruite pendant l'execution de la fonction
	local y2=y1-- variable x1 et y1 sont des variables lié directement aux coordonnées direct de la position du tireur
	local tir={} -- tableau contenant les informations du tireur
	local orientation=0 -- defini si l'unité qui tir est le joueur ou l'adversaire
	local pole=0 -- referenciel utiliser pour le multijoueur ou plusieurs parties sont lancés en meme temps sur un meme ecran
	if type1==0 then--unitée qui tire
		tir=isoldat[numero].tir
		orientation=isoldat[numero].orientation
		pole=isoldat[numero].pole
	elseif type1==1 then -- batiment qui tire
		if ibatiment[numero].type2==1 then -- batiment avec une catapult
			typeproj=1 -- le projectil est un boulet
		end
		tir=ibatiment[numero]
		x2=ibatiment[numero].x1+ibatiment[numero].xbase -- coordonnée de l'engin de tir
		y2=ibatiment[numero].y1+ibatiment[numero].ybase
		pole=ibatiment[numero].pole
	end

	-------------------------------------- initialisation des variables ----------------------
	local angleproj={}
	for i=1,tir.nbfleche do -- initialisation des variables pour le choix des cibles
		angleproj[i]=1000
	end
	if tir.fleche==nil then
		tir.fleche={}
	end
	if tir.fleche[1]==nil then
		if tir.nbfleche==nil then
			tir.nbfleche=1
		end
		for i=1,tir.nbfleche,1 do
			tir.fleche[i]=0
		end
	end
	if tir.fleche[1]~=0 then
		if isoldat[tir.fleche[1]].orientation==orientation then
			for i=1,tir.nbfleche,1 do
				tir.fleche[i]=0
				angleproj[i]=1000
			end
		end
	end
	local typeproj1=typeproj -- indique si l'unité tir plusieurs projectiles
	if tir.nbfleche>1 then
		typeproj1=0 -- si des catapult tir plusieurs projectils par volé
	end
	-------------------------------------Calcul pour trouver un adversaire --------------------
	-------------------------------------Prise en compte des tirs precedents------------------
	if typeproj1==0 then -- si la tour tire plusieurs projectiles ou ne fait pas des degats de zone 
		if tir.fleche[1]~=0 then -- on regarde si le premier projectil avait une cible
			for i=1,tir.nbfleche,1 do -- on parcours tout les projectils
				local cpteve=i -- permet de parcourir du projectile actuel jusqu'au premier
				while cpteve<=tir.nbfleche and (tir.fleche[i]==0 or (isoldat[tir.fleche[i]].vivant==false  or (isoldat[tir.fleche[i]].x1-x2)*(isoldat[tir.fleche[i]].x1-x2)+(1.25*(isoldat[tir.fleche[i]].y1-y2))*(1.25*(isoldat[tir.fleche[i]].y1-y2))>=tir.porte)) do -- est vrai si le projectil a une cible, si la cible n'est pas morte et toujours a porte
					tir.fleche[i]=0 -- reinit de la cible selectionné
					angleproj[i]=1000
					print("projectiles "..i.." n'a plus d'aversaire")
					for j=i+1,tir.nbfleche,1 do -- decalage de toute les cibles selectionnés vers le projectiles actuels
						if tir.fleche[j]~=0 then
							tir.fleche[j-1]=tir.fleche[j]
							angleproj[j-1]=angleproj[j]
							tir.fleche[j]=0
							angleproj[j]=1000
						end
					end
					cpteve=cpteve+1
				end
			end
			for i=1,tir.nbfleche,1 do
				if tir.fleche[i]~=0 then
					if isoldat[tir.fleche[i]].vivant==false  or (isoldat[tir.fleche[i]].x1-x2)*(isoldat[tir.fleche[i]].x1-x2)+(1.25*(isoldat[tir.fleche[i]].y1-y2))*(1.25*(isoldat[tir.fleche[i]].y1-y2))>=tir.porte then -- verification si la condition est toujours vrai
						tir.fleche[i]=0
						angleproj[i]=1000
						print("projectiles "..i.." n'a plus d'aversaire, etape 2 signifie bug")
					else
						local j=i+1
						if angleproj[i]==1000 then
							if goh then -- si le jeu joue est stronghold ou Gate Of Heroes
								angleproj[i]=anglebasic(x1,y1,isoldat[tir.fleche[i]].x1+isoldat[tir.fleche[i]].centrex,isoldat[tir.fleche[i]].y1+isoldat[tir.fleche[i]].centrey-isoldat[tir.fleche[i]].height*0.35)
							else
								angleproj[i]=anglebasic(x1,y1,isoldat[tir.fleche[i]].x1+isoldat[tir.fleche[i]].centrex,isoldat[tir.fleche[i]].y1+isoldat[tir.fleche[i]].centrey) -- calcul de l'angle de trajectoire pour atteindre la cible
						end	end
						while j<=tir.nbfleche do
							if tir.fleche[j]==tir.fleche[i] then -- si deux projectiles on la meme cible
								tir.fleche[j]=0 -- reinit
								angleproj[j]=1000
							end
							if tir.fleche[j]~=0 then
								if angleproj[j]==1000 then
									if goh then
										angleproj[j]= anglebasic(x1,y1,isoldat[tir.fleche[j]].x1+isoldat[tir.fleche[j]].centrex,isoldat[tir.fleche[j]].y1+isoldat[tir.fleche[j]].centrey-isoldat[tir.fleche[j]].height*0.35)
									else
										angleproj[j]= anglebasic(x1,y1,isoldat[tir.fleche[j]].x1+isoldat[tir.fleche[j]].centrex,isoldat[tir.fleche[j]].y1+isoldat[tir.fleche[j]].centrey)
									end
								end
								if angleproj[j]-angleproj[i]>20 or angleproj[j]-angleproj[i]<-20 then -- verification si les angles entres les differents projectiles ne sont pas trop eleve
									tir.fleche[j]=0 -- reinit
									angleproj[j]=1000
							end	end
							j=j+1
			end	end	end	end	end	
		-- trouvé de nouveau adversaire
		local ennemi=0
		local i=1
		while i<=tir.nbfleche do
			if tir.fleche[i]==0 then
				ennemi=1
				i=tir.nbfleche+1
			end
			i=i+1
		end
		if ennemi==1 then -- si un projectile n'a pas de cible
			local min={} -- distance minimum trouvé par projectile
			local pot={} -- id de l'unité ayant le minimum
			local angleobj=1000
			for i=1,tir.nbfleche,1 do
				if tir.fleche[i]~=0 then
					pot[i]=tir.fleche[i]
					min[i]=0
					if angleproj[i]==1000 then -- si l'angle n'a pas encore ete calcule
						if goh then
							angleproj[i]= anglebasic(x1,y1,isoldat[tir.fleche[i]].x1+isoldat[tir.fleche[i]].centrex,isoldat[tir.fleche[i]].y1+isoldat[tir.fleche[i]].centrey-isoldat[tir.fleche[i]].height*0.35)
						else
							angleproj[i]= anglebasic(x1,y1,isoldat[tir.fleche[i]].x1+isoldat[tir.fleche[i]].centrex,isoldat[tir.fleche[i]].y1+isoldat[tir.fleche[i]].centrey)
					end	end
				else
					pot[i]=0 -- reinit
					min[i]=-1
					angleproj[i]=1000
			end	end
			local mini=1 -- les unités sont toutes dans un tableau. Les indices negatifs sont celles du joueur et celles positives celles de l'adversaire
			local maxi=nbsoldat
			if orientation==1 then
				mini=nbsoldatg
				maxi=0
			end
			for j=mini,maxi do
				if isoldat[j].pole==pole then -- and (zone1==isoldat[j].zone1 or zone2==isoldat[j].zone2) then (test avec un decoupage de la carte en zone pour ne pas chercher partout mais des unités ont une porté infini ou presque)
					local dejaadv=0
					for k=1,tir.nbfleche,1 do
						if tir.fleche[k]==j then
							dejaadv=1
					end end
					if isoldat[j].vivant==true and orientation~=isoldat[j].orientation and dejaadv==0 then -- on regarde si l'unité est vivante, si elle est du camp adverse, si elle n'est pas deja ciblé par un autre projectile
						local calcul=(isoldat[j].x1-x2)*(isoldat[j].x1-x2)+(1.25*(isoldat[j].y1-y2))*(1.25*(isoldat[j].y1-y2)) -- calcul de la distance
						if calcul<tir.porte then -- si l'unité est dans la porté de la tour (valeur au carré comprenant la presepective)
							local ver=1
							while ver<=tir.nbfleche do
								if tir.fleche[ver]==0 then--pas d'adv
									if min[ver]==-1 then--pas d'adv potentiel
										if type1==0 then--recherche pour soldat pouvant tirer
											min[ver]=calcul-- recuperation de la distance trouvé
										else
											min[ver]=linftabpro[isoldat[j].point] -- si l'unité est gentile elle va cibler les unités les plus avancer sur le chemin. 
										end
										pot[ver]=j
										ver=tir.nbfleche -- break du while
									elseif min[tir.nbfleche]~=-1 then--si tt les pro ont des adv potentiels
										if type1==0 and min[ver]>calcul then -- on regarde si la cible est plus interressante que celle selectionne
											min[ver]=calcul
											pot[ver]=j
											ver=tir.nbfleche
										elseif type1==1 and min[ver]<linftabpro[isoldat[j].point] then
											min[ver]=linftabpro[isoldat[j].point]
											pot[ver]=j
											ver=tir.nbfleche
								end end	end
								ver=ver+1
			end	end	end end end
			if pot[1]~=0 or tir.fleche[1]~=0 then -- si au moins une cible est trouve
				local minvalue -- distance minimum trouve
				local minnum=0 -- id de la cible
				for i=1,tir.nbfleche do
					if tir.fleche[i]~=0 then
						if type1==0 then
							min[i]=(isoldat[tir.fleche[i]].x1-x2)*(isoldat[tir.fleche[i]].x1-x2)+(1.25*(isoldat[tir.fleche[i]].y1-y2))*(1.25*(isoldat[tir.fleche[i]].y1-y2))
						elseif type1==1 then
							min[i]=linftabpro[isoldat[tir.fleche[i]].point]
					end	end
					if min[i]~=-1 then
						if minnum==0 then
							minnum=i
							minvalue=min[i]
						else
							if type1==0 and minvalue>min[i] then
								minnum=i
								minvalue=min[i]
							elseif type1==1 and minvalue<min[i] then
								minnum=i
								minvalue=min[i]
				end	end	end	end
				if angleobj==1000 then
					if angleproj[minnum]==1000 then
						if goh then
							angleproj[minnum]= anglebasic(x1,y1,isoldat[pot[minnum]].x1+isoldat[pot[minnum]].centrex,isoldat[pot[minnum]].y1+isoldat[pot[minnum]].centrey-isoldat[pot[minnum]].height*0.35)
						else
							angleproj[minnum]= anglebasic(x1,y1,isoldat[pot[minnum]].x1+isoldat[pot[minnum]].centrex,isoldat[pot[minnum]].y1+isoldat[pot[minnum]].centrey)
					end	end
					angleobj=angleproj[minnum] -- angle de la cible de reference
				end
				for ver=1,tir.nbfleche,1 do
					if pot[ver]~=0 then
						local angleprovi
						if goh then
							angleprovi=anglebasic(x1,y1,isoldat[pot[ver]].x1+isoldat[pot[ver]].centrex,isoldat[pot[ver]].y1+isoldat[pot[ver]].centrey-isoldat[pot[ver]].height*0.35)
						else
							angleprovi=anglebasic(x1,y1,isoldat[pot[ver]].x1+isoldat[pot[ver]].centrex,isoldat[pot[ver]].y1+isoldat[pot[ver]].centrey)
						end
						if angleprovi-angleobj<40 and angleprovi-angleobj>-40 then -- si la cible du projectile est dans un angle correcte pour faire parti de la meme vole
							tir.fleche[ver]=pot[ver]
						else
							tir.fleche[ver]=pot[minnum] -- sinon il prend pour cible la cible de ref
						end
					else
						tir.fleche[ver]=pot[minnum]-- sinon il prend pour cible la cible de ref
		end	end	end	end
		if type1==0 then
			isoldat[numero].tir.fleche=tir.fleche -- transmission des resultats
		elseif type1==1 then
			ibatiment[numero].fleche=tir.fleche -- transmission des resultats
		end
	else -- si la tour a qu'un seul projectile et est une unité qui fait des degats de zone
		if tir.fleche[1]~=0 then -- on regarde si la tour à un projectile et est toujours d'actualité
			if isoldat[tir.fleche[1]].vivant==false  or (isoldat[tir.fleche[1]].x1-x2)*(isoldat[tir.fleche[1]].x1-x2)+(1.25*(isoldat[tir.fleche[1]].y1-y2))*(1.25*(isoldat[tir.fleche[1]].y1-y2))>=tir.porte then -- isoldat[tir.fleche[i]].vie<=0
				tir.fleche[1]=0
		end	end
		if tir.fleche[1]==0 then
			local numerosol=0
			local nbsoldatatt={}
			local maxsoldat=-1
			local mini=1
			local maxi=nbsoldat
			if orientation==1 then
				mini=nbsoldatg
				maxi=0
			end
			for j=mini,maxi do -- trouve la cible qui a le plus d'unité autour d'elle pour les tours faisant des degats de zone
				if isoldat[j].pole==pole then
					nbsoldatatt[j]=0
					if isoldat[j].vivant==true then
						if (isoldat[j].x1-x2)*(isoldat[j].x1-x2)+(1.25*(isoldat[j].y1-y2))*(1.25*(isoldat[j].y1-y2))<tir.porte then
							for i=mini,maxi,2 do
								if isoldat[i].vivant==true and pole==isoldat[i].pole then
									if mathabs(isoldat[j].x1-isoldat[i].x1)+mathabs(isoldat[j].y1-isoldat[i].y1)<18 then
										nbsoldatatt[j]=nbsoldatatt[j]+1
							end	end	end
							print("soldat "..j.."a "..nbsoldatatt[j].."autour de lui")
							if nbsoldatatt[j]>maxsoldat then
								numerosol=j
								maxsoldat=nbsoldatatt[j]
			end	end	end	end	end
			if numerosol~=0 then
				tir.fleche[1]=numerosol
				ibatiment[numero].fleche=tir.fleche
	end	end	end
	------------------------------------Fin de la selection des cibles
	if  tir.fleche[1]~=0 then
		if type1==1 then -- tir d'un batiment
			local typetra1=nil
			if ibatiment[numero].type2==0 then
				typetra1=2
			else
				typetra1=0
			end
			if goh then -- orientation de l'animation de tir
				calculangle(type1,numero,x1,y1,ibatiment[numero],isoldat[ibatiment[numero].fleche[1]].x1+isoldat[ibatiment[numero].fleche[1]].centrex,isoldat[ibatiment[numero].fleche[1]].y1+isoldat[ibatiment[numero].fleche[1]].centrey-isoldat[ibatiment[numero].fleche[1]].height*0.35,ibatiment[numero].x1+ibatiment[numero].xbase,ibatiment[numero].y1+ibatiment[numero].ybase,1,typetra1)
			else
				calculangle(type1,numero,x1,y1,ibatiment[numero],isoldat[ibatiment[numero].fleche[1]].x1+isoldat[ibatiment[numero].fleche[1]].centrex,isoldat[ibatiment[numero].fleche[1]].y1+isoldat[ibatiment[numero].fleche[1]].centrey,ibatiment[numero].x1+ibatiment[numero].xbase,ibatiment[numero].y1+ibatiment[numero].ybase,1,typetra1)
			end
			ibatiment[numero].bras:play() -- lancement de l'annimation de tir
			ibatiment[numero].bras.play1=true
			local function animtirbatbras( event ) -- listener sur l'animation de tir
				if ibatiment[numero].sup1~=1 then	
					if ibatiment[numero].bras.play1==true then
						if jeupause.etat==1 then--technique numero 3 de mise en pause(plus de probleme avec les processeurs mtk et probleme de deferencement)
							if ibatiment[numero].bras.pause1==0 then -- gestion de l'anim qui se met en pause quand le jeu se met en pause... (vieille version, il faut utiliser les nouvelles fonctions)
								ibatiment[numero].bras.pause1=1
								ibatiment[numero].bras:pause()
							end
						else
							if ibatiment[numero].bras.pause1==1 then
								ibatiment[numero].bras.pause1=0
								ibatiment[numero].bras:play()
							end
							if ibatiment[numero].bras.frame>=ibatiment[numero].bras.numFrames-1 and ibatiment[numero].bras.oldframe~=ibatiment[numero].bras.numFrames then -- si l'animation d'attaque est fini
								ibatiment[numero].bras.oldframe=ibatiment[numero].bras.frame
								ibatiment[numero].bras.play1=false
								print("ibatiment.attaque "..ibatiment[numero].attaque)
								demandepro(1,numero,ibatiment[numero].x1+ibatiment[numero].xpro,ibatiment[numero].y1+ibatiment[numero].ypro,ibatiment[numero],ibatiment[numero].pole) -- tir du ou des projectiles
								Runtime:removeEventListener( "enterFrame",animtirbatbras)
							else
								ibatiment[numero].bras.oldframe=ibatiment[numero].bras.frame
					end	end	end
				else
					Runtime:removeEventListener( "enterFrame",animtirbatbras)
			end	end
			Runtime:addEventListener("enterFrame",animtirbatbras)
		else -- tir d'une unité
			isoldat[numero].tir.test=1
			isoldat[numero].tir.instance.isVisible=false
			group[isoldat[numero].tir.bras.group+1]:remove(isoldat[numero].tir.bras)
			isoldat[numero].tir.bras.group=isoldat[numero].numgroup
			group[isoldat[numero].tir.bras.group+1]:insert(isoldat[numero].tir.bras)
			local xtir=0
			local ytir=0
			if image[isoldat[numero].typesoldat].tir.x~=nil then
				xtir=image[isoldat[numero].typesoldat].tir.x
				if isoldat[numero].tir.bras.xScale<0 then
					xtir=-xtir
			end	end
			if goh then
				xtir=0
			end
			if image[isoldat[numero].typesoldat].tir.y~=nil then
				ytir=image[isoldat[numero].typesoldat].tir.y
			end 
			isoldat[numero].tir.bras.x=x1+xtir
			isoldat[numero].tir.bras.y=y1+ytir
			isoldat[numero].tir.bras.isVisible=true
			if goh then
				calculangle(type1,numero,x1,y1,isoldat[numero].tir,isoldat[isoldat[numero].tir.fleche[1]].x1+isoldat[isoldat[numero].tir.fleche[1]].centrex,isoldat[isoldat[numero].tir.fleche[1]].y1+isoldat[isoldat[numero].tir.fleche[1]].centrey-isoldat[isoldat[numero].tir.fleche[1]].height*0.35,isoldat[numero].x1,isoldat[numero].y1,1,1)
			else
				calculangle(type1,numero,x1,y1,isoldat[numero].tir,isoldat[isoldat[numero].tir.fleche[1]].x1+isoldat[isoldat[numero].tir.fleche[1]].centrex,isoldat[isoldat[numero].tir.fleche[1]].y1+isoldat[isoldat[numero].tir.fleche[1]].centrey,isoldat[numero].x1,isoldat[numero].y1,1,1)
			end
			isoldat[numero].tir.bras.timeScale=vitessejeu
			isoldat[numero].tir.bras:play()
			isoldat[numero].tir.bras.play1=true
			print("lancement de l'anim de tir")
			local function animtirsolbras( event )
				if isoldat[numero].vie>0 then	
					if isoldat[numero].tir.bras.play1==true then
						if jeupause.etat==1 then--technique numero 3 de mise en pause(plus de probleme avec les processeurs mtk et probleme de deferencement)
							if isoldat[numero].tir.bras.pause1==0 then
								isoldat[numero].tir.bras.pause1=1
								isoldat[numero].tir.bras:pause()
							end
						else
							if isoldat[numero].tir.bras.pause1==1 then
								isoldat[numero].tir.bras.pause1=0
								isoldat[numero].tir.bras:play()
							end
							if isoldat[numero].tir.bras.frame>=isoldat[numero].tir.bras.numFrames-1*vitessejeu and isoldat[numero].tir.bras.oldframe~=isoldat[numero].tir.bras.numFrames then
								isoldat[numero].tir.bras.oldframe=isoldat[numero].tir.bras.numFrames
								isoldat[numero].tir.bras.play1=false
								if isoldat[tir.fleche[1]].ennemi==numero and isoldat[tir.fleche[1]].encombat==1 then
									pertevie(tir.fleche[1],isoldat[numero].tir.attaque)
									isoldat[numero].tir.tirer=0
								else
									demandepro(0,numero,isoldat[numero].x1,isoldat[numero].y1,isoldat[numero].tir,isoldat[numero].pole)
								end
								print("demande de pro avec un pole de "..pole)
								isoldat[numero].tir.bras.isVisible=false
								isoldat[numero].tir.instance.isVisible=true
								isoldat[numero].tir.bras.isVisible=false
								Runtime:removeEventListener( "enterFrame",animtirsolbras)
								if isoldat[numero].orientation~=0 then
									animdep1.animdep(isoldat[numero].tir.bras.x,chemin[isoldat[numero].point+1].x+isoldat[numero].xposi,isoldat[numero].tir.bras.y,chemin[isoldat[numero].point+1].y+isoldat[numero].yposi-isoldat[numero].centrey+isoldat[numero].pole,numero)
								end
							else
								isoldat[numero].tir.bras.oldframe=1
					end	end	end
				else
					isoldat[numero].tir.bras.isVisible=false
					Runtime:removeEventListener( "enterFrame",animtirsolbras)
			end	end
			Runtime:addEventListener("enterFrame",animtirsolbras)
		end	
	else -- ne tire pas de projectile
		if type1==0 then
			isoldat[numero].tir.tirer=-1 -- indique qu'il vient de chercher une cible
	end	end
end
end)
coroutine.resume(coattir)
end
return t