local t={}--gestion de l'attque du pouvoir 2 pour aleger le fichier pouvoir
if not functionload then
function envoyerfl(flechecpt,sheet1,sequenceData,randompos,xoffset,yoffset,flechex,flechey,vitesse,num1,fleche)
	--print("flechecpt"..flechecpt)
	fleche[flechecpt]=display.newSprite(sheet1,sequenceData)
	if race~=1 then
		fleche[flechecpt].xScale=0.5
		fleche[flechecpt].yScale=fleche[flechecpt].xScale
	end
	-- local randomx=mathrandom(-randompos*randompos,randompos*randompos)
	-- local randomy=mathrandom(-randompos*randompos,randompos*randompos)
	-- if randomx<0 then
	-- 	randomx=-mathsqrt(-randomx)
	-- else
	-- 	randomx=mathsqrt(randomx)
	-- end
	-- if randomy<0 then
	-- 	randomy=-mathsqrt(-randomy)
	-- else
	-- 	randomy=mathsqrt(randomy)
	-- end
	local random={}
	-- local randomx=nil
	-- local randomy=nil
	local toucher=0
	for i=1,2 do 
		--local randomtest=mathrandom(1,randompos*randompos)
		--local randomtest=mathrandom(-randompos*randompos,randompos*randompos)
		local randomtest=mathrandom(2,randompos*13)*0.1--randompos)
		--print("randomtest"..randomtest)
		randomtest=randomtest^2.75
		local signe=mathrandom(0,1)
		if signe==1 then
			randomtest=-randomtest
		end
		--randomtest=10*randompos/randomtest
		--randomtest=mathrandom(randomtest)
		--if randomtest>randompos then
		--	randomtest=mathsqrt(randomtest)
		--end
		--if mathrandom(0,1)==1 then
		--	randomtest=-randomtest
		--end
		--randomtest=randomtest/(2*mathsqrt(randomtest*randomtest))
		random[i]=randomtest
	end
	--local randomy=mathrandom(-randompos,randompos)
	fleche[flechecpt].x=flechex+random[1]+xoffset--mathrandom(-randompos,randompos)+xoffset--random[1]
	fleche[flechecpt].y=flechey+random[2]+yoffset--mathrandom(-randompos,randompos)+yoffset--random[2]
	--print(fleche[flechecpt].y.."  "..fleche[flechecpt].x)
	fleche[flechecpt].cpt=1
	fleche[flechecpt].cpt1=0
	if race==1 then
	fleche[flechecpt]:rotate(-40)
	end
	fleche[flechecpt]:setSequence( "air" )
	group[2048]:insert(fleche[flechecpt])
	--local function instance( event )
	--	if(event.phase=="loop")then
	local function movefleche (event )
		if jeupause.etat==1 then--technique numero 3 de mise en pause(plus de probleme avec les processeurs mtk et probleme de deferencement)
			if fleche[flechecpt].pause1==0 then
				fleche[flechecpt].pause1=1
				fleche[flechecpt]:pause()
			end
		else
			if fleche[flechecpt].pause1==1 then
				fleche[flechecpt].pause1=0
				fleche[flechecpt]:play()
			end
		--if fleche[flechecpt].pause1==0 then
			--print(fleche[flechecpt].cpt)
			if fleche[flechecpt].cpt<40 then
				if race==1 then
					fleche[flechecpt]:rotate(vitesse*vitessejeu)
				end
				fleche[flechecpt].x=fleche[flechecpt].x+vitesse*0.5*vitessejeu
				fleche[flechecpt].y=fleche[flechecpt].y+vitesse*vitessejeu
				if race==0 then
					fleche[flechecpt].y=fleche[flechecpt].y+2*vitesse*vitessejeu
					fleche[flechecpt].xScale=fleche[flechecpt].xScale-0.005*vitesse*vitessejeu
						fleche[flechecpt].yScale=fleche[flechecpt].yScale-0.005*vitesse*vitessejeu
				else
					fleche[flechecpt].xScale=fleche[flechecpt].xScale-0.01*vitesse*vitessejeu
					fleche[flechecpt].yScale=fleche[flechecpt].yScale-0.01*vitesse*vitessejeu
				end

				
				fleche[flechecpt].cpt=fleche[flechecpt].cpt+vitesse*vitessejeu
			else
				if toucher==0 then
				for j=1,nbsoldat do
				--local j=1
				--while j<=nbsoldat do
					if isoldat[j].orientation==1 and isoldat[j].vivant==true then
						local calcul=(isoldat[j].x1-fleche[flechecpt].x)^2+(isoldat[j].y1-fleche[flechecpt].y)^2
						if rayonatt>calcul then --isoldat[j].vie>0  then
							--print("toucher")
							--print(j)
							if race==0 then
								-- debut retourdinformation
								retinf.attpv2=retinf.attpv2+attaquepouvoir2
								-- fin retourdinformation
								pertevie(j,attaquepouvoir2,1)
							else
								-- debut retourdinformation
								local attquepv2act=attaquepouvoir2*rayonatt/(rayonatt+2*calcul)
								retinf.attpv2=retinf.attpv2+attquepv2act
								-- fin retourdinformation
								pertevie(j,attquepv2act,1)
							end
							if race==1 then
								fleche[flechecpt].ennemi=j
								fleche[flechecpt].randy=mathrandom(7)-3
								fleche[flechecpt].randx=mathrandom(7)-3
								fleche[flechecpt].group=mathfloor(fleche[flechecpt].y+3)+1024
								group[2048]:remove(fleche[flechecpt])
								fleche[flechecpt]:setSequence( "toucher" )
								group[fleche[flechecpt].group]:insert(fleche[flechecpt])
								toucher=1
								break
							end
							
						end
					end
				end
				if toucher==0 then
					group[2048]:remove(fleche[flechecpt])
					group[mathfloor(fleche[flechecpt].y)+1024-10]:insert(fleche[flechecpt])
					fleche[flechecpt]:setSequence( "sol" )
					local i=0
					local function supfle1( event )
						i=i+1
						if i<7 then
							local supfle=timer.performWithDelay(500,supfle1)
							local lenum=timerpause(4,supfle,num1[flechecpt])
							if lenum==-1 then
								i=7
							end
						end
						if i>=7 then
							--local flechecpt=event.source.numero
							jeupause.timerlibre[num1[flechecpt]]=0
							group[mathfloor(fleche[flechecpt].y)+1024-10]:remove(fleche[flechecpt])
							fleche[flechecpt]:removeSelf()
						end
					end
					local supfle=timer.performWithDelay(1,supfle1)
					num1[flechecpt]=timerpause(3,supfle,nil)
					Runtime:removeEventListener( "enterFrame",movefleche)
					if race==0 then
						-- local destructeurpartiel=function(obj)
						-- 	group[obj.group]:remove(obj)
						-- 	obj:removeSelf()
						-- 	obj=nil
						-- end
						local poussiere=display.newImage(impro.poussiere,1)
						poussiere.xScale=0.01
						if typepro=="14" then
							coefxscale=1.5
						end
						poussiere.yScale=poussiere.xScale
						poussiere.alpha=0.8
						poussiere.x=fleche[flechecpt].x
						poussiere.y=fleche[flechecpt].y
						local latransition=transition.to(poussiere,{time=300*vitessejeuin,transition=easing.outQuad,alpha=0.5,xScale=0.14,yScale=0.14,y=fleche[flechecpt].y-10,onComplete=destructeurpartieltran,onCancel=destructeurpartieltran,tag="elementtype"})
						poussiere.group=mathfloor(poussiere.y+1024)
						group[poussiere.group]:insert(poussiere)
						if jeupause.etat==1 then
							transition.pause(latransition)
						end
					end
				end
				end
				if toucher==1 then
					fleche[flechecpt].cpt1=fleche[flechecpt].cpt1+1
					group[fleche[flechecpt].group]:remove(fleche[flechecpt])
					if fleche[flechecpt].cpt1<=90 and isoldat[fleche[flechecpt].ennemi].vivant==true then
					--print("ennemi"..fleche[flechecpt].ennemi..fleche[flechecpt].randy..fleche[flechecpt].y..isoldat[fleche[flechecpt].ennemi].y1)
						fleche[flechecpt].y=isoldat[fleche[flechecpt].ennemi].y1+image[isoldat[fleche[flechecpt].ennemi].typesoldat].centrey+fleche[flechecpt].randy+isoldat[fleche[flechecpt].ennemi].effetvero
						fleche[flechecpt].x=isoldat[fleche[flechecpt].ennemi].x1+image[isoldat[fleche[flechecpt].ennemi].typesoldat].centrex+fleche[flechecpt].randx
						fleche[flechecpt].group=mathfloor(fleche[flechecpt].y+3)+1024
						group[fleche[flechecpt].group]:insert(fleche[flechecpt])
					else
						fleche[flechecpt]:removeSelf()
						Runtime:removeEventListener( "enterFrame",movefleche)
					end
				end
				
			end
		end
		--end
	end
	--fleche[flechecpt]:addEventListener( "sprite", instance )
		fleche[flechecpt].pause1=0
		fleche[flechecpt]:play()
		Runtime:addEventListener("enterFrame",movefleche)
		--movefleche.numero=flechecpt

end
end
t.batimentbis= function()
local a=1
end
return t