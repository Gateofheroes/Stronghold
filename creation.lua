 local numtap=0--gestion de la demande de creation de d'un batiment
 local animconst = require ( "constructanim" )
 local batiment = require( "batiment" )
 local ancienxvalide=nil
 local ancienyvalide=nil
 local bugmulticlic=0
 --nbatiment1exist=nil
 local compteuropt=0
 local cliccreabouton=false
if not functionload then
	function removenbatbt()--supression de bouton pour la creation d'un batiment
		if groupebattemp~=nil then
			-- group[2048]:remove(groupebattemp)
			-- groupebattemp:removeSelf()
			display.remove(groupebattemp)
			groupebattemp=nil
		end
		if grcreabatcer~=nil then
			display.remove(grcreabatcer)
			-- grcreabatcer:removeSelf()
			grcreabatcer=nil
			cercle=nil
		end

		-- print("remove bouton\n\n\n\n")
		-- if valider~=nil then
		--  	group[2048]:remove( valider )
		-- 	valider:removeSelf()
		-- 	valider=nil

		-- 	supprimer:removeEventListener( "tap", supprimer )
		-- 	group[2048]:remove( supprimer )
		-- 	supprimer:removeSelf()
		-- 	supprimer=nil

		-- 	group[2048]:remove(interdit)
		-- 	interdit:removeSelf( )
		-- 	interdit=nil

		-- 	grcreabatcer:removeSelf()
		-- 	grcreabatcer=nil
		-- 	for i, v in ipairs(cercle) do
		-- 		cercle[i]=nil
		-- 	end
		-- 	cercle=nil

		-- 	group[2048].remove(conttext)
		-- 	conttext:removeSelf()
		-- 	conttext=nil

		-- 	group[2048]:remove(conttextOr)
		-- 	conttextOr:removeSelf()
		-- 	conttextOr=nil
		-- end
	end
	function removenbat(faite)--supression du batiment temporaire
		if enconst~=0 then
			print("removenbat")
		 -- 	nbatiment:removeEventListener( "touch", nbatiment )
			-- nbatiment:removeEventListener( "tap", nbatiment )
			-- group[2048]:remove(nbatiment)
			display.remove(nbatiment.image)
			-- nbatiment:removeSelf()
			-- local function timertemp(event)
			-- 	nbatiment=nil
			-- end
			-- local timertemp1=timer.performWithDelay(50,timertemp)
			enconst=0
			removenbatbt()
			if tuto==2 and not faite then
				if tutoaction==1 or tutoaction==2 then
					print("sup bat tuto")
					actiondefaite()
				end
			end
		end
	end
	-- function removebattemp()
	-- 	group[2048]:remove(groupebattemp)
	-- 	groupebattemp:removeSelf()
	-- 	groupebattemp=nil
	-- end

end
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

	construirearchTexte.x=construirearchTexte.x1
	construirearchTexte.y=construirearchTexte.y1
	construireinfTexte.x=construireinfTexte.x1
	construireinfTexte.y=construireinfTexte.y1

	construirearchOr.x=construirearchOr.x1
	construirearchOr.y=construirearchOr.y1
	construireinfOr.x=construireinfOr.x1
	construireinfOr.y=construireinfOr.y1

	construirearchTexte.xScale=construirearchTexte.scale
	construirearchTexte.yScale=construirearchTexte.scale
	construireinfTexte.xScale=construireinfTexte.scale
	construireinfTexte.yScale=construireinfTexte.scale

	construirearchOr.xScale=construirearchOr.scale
	construirearchOr.yScale=construirearchOr.scale
	construireinfOr.xScale=construireinfOr.scale
	construireinfOr.yScale=construireinfOr.scale

	construireinfTexte.isVisible=false
	construirearchTexte.isVisible=false
	construireinfOr.isVisible=false
	construirearchOr.isVisible=false

end

if not functionload then
function removecrea(partiel)--pas utiliser
	numtapba=0
	-- animation ici avec listener
	print("effacer crea 51")
	transition.to(construireinf,{time=250,transition=easing.inCirc, y=construire.y,xScale=construireinf.scale*0.5,yScale=construireinf.scale*0.5, x=construire.x, onComplete=creadisp})
	transition.to(construirearch,{time=250,transition=easing.inCirc,xScale=construirearch.scale*0.5,yScale=construirearch.scale*0.5, y=construire.y, x=construire.x})
	transition.to(construireinfTexte,{time=250,transition=easing.inCirc,xScale=construirearchTexte.scale*0.5,yScale=construirearchTexte.scale*0.5, y=construire.y, x=construire.x})
	transition.to(construireinfOr,{time=250,transition=easing.inCirc,xScale=construirearchOr.scale*0.5,yScale=construirearchOr.scale*0.5, y=construire.y, x=construire.x})
	transition.to(construirearchTexte,{time=250,transition=easing.inCirc,xScale=construirearchTexte.scale*0.5,yScale=construirearchTexte.scale*0.5, y=construire.y, x=construire.x})
	transition.to(construirearchOr,{time=250,transition=easing.inCirc,xScale=construirearchOr.scale*0.5,yScale=construirearchOr.scale*0.5, y=construire.y, x=construire.x})
	-- construireinfTexte.isVisible=false
	-- construirearchTexte.isVisible=false
	-- construireinfOr.isVisible=false
	-- construirearchOr.isVisible=false
	--construireinf.isVisible=false
	--construirearch.isVisible=false
	numtapb=0
	if partiel==true then
		removenbat()
	end
	if tuto==2 then
		if tutoaction==1 then
			print("removecrea l55")
			actiondefaite()
		end
	end
end
end
local function autorisefunction(testinbatiment)
	local autorise=0
	if testinbatiment==nil then
		autorise=1
	end
	if autorise==0 then
		if testinbatiment.y==nil then
			autorise=1
		end 
	end
	if autorise==0 then
		if testinbatiment.y+30<mayminuspos2+30 or testinbatiment.y+30>maypos2 or testinbatiment.x<maxminuspos2+30 or testinbatiment.x>maxpos2-30 then
			autorise=1
		end
	end
	if autorise==0 and not modezombie and not modepanique then
		local i=1
		if not goh then
			while i<=cheminnb+1 do
				--for i=1,cheminnb+1,1 do 
				local coef=1
				if chemin[i].mechant~=nil and not modepanique then
					if chemin[i].mechant>1 then
						coef=chemin[i].mechant*0.9
					end
				end
				-- if not modepanique and cheminlargeur~=nil then
				-- 	coef=coef*cheminlargeur
				-- end
				if 1500*coef*cheminlargeur>((testinbatiment.x-chemin[i].x)*(testinbatiment.x-chemin[i].x)+(testinbatiment.y+30-chemin[i].y)*(testinbatiment.y+30-chemin[i].y)) then
					autorise=1
					i=cheminnb+2
				end
				i=i+1
			end
		else
			while i<=cheminnb+1 do
				local rayonauto=1500
				if chemin[i].rayon~=nil then 
					rayonauto=chemin[i].rayon
				end
				if rayonauto>((testinbatiment.x-chemin[i].x)*(testinbatiment.x-chemin[i].x)+(testinbatiment.y+30-chemin[i].y)*(testinbatiment.y+30-chemin[i].y)) then
					autorise=1
					i=cheminnb+2
				end
				i=i+1
			end
		end
	end
	if autorise==0 then
		local i=1
		while i<=obstaclenb do
		--for i=1,obstaclenb,1 do--wandrille le 11 correspond au nb de point de collision (obstacle)------------------------------------------------------------------------------------------------------------
			if 3000>((testinbatiment.x-obstacle[i].x)*(testinbatiment.x-obstacle[i].x)+(testinbatiment.y+30-obstacle[i].y)*(testinbatiment.y+30-obstacle[i].y))then
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
			if 20000>((testinbatiment.x-obstacle1[i].x)*(testinbatiment.x-obstacle1[i].x)+(testinbatiment.y+30-obstacle1[i].y)*(testinbatiment.y+30-obstacle1[i].y))then
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
				if rayon>((testinbatiment.x-obstacle0[i].x)*(testinbatiment.x-obstacle0[i].x)+(testinbatiment.y+30-obstacle0[i].y)*(testinbatiment.y+30-obstacle0[i].y))then
					autorise=1
					i=obstacle0nb+1
				end
				i=i+1
			end
		end
	end
	-- if autorise==0 then
	-- 	local i=1
	-- 	while i<=#obstacleim do
	-- 	--for i=1,#obstacleim,1 do
	-- 		if 500>((testinbatiment.x-obstacleim[i].x)^2+(testinbatiment.y+30-obstacleim[i].y)^2)then
	-- 			autorise=1
	-- 			i=#obstacleim+1
	-- 		end
	-- 		i=i+1
	-- 	end
	-- end
	if autorise==0 then
		if nbbatiment>0 then
			local i=1
			while i<=nbbatiment do
				if ibatiment[i]~=nil then
					--for i=1,nbbatiment do//for remplacer par while
					if ibatiment[i].x1~=nil and ibatiment[i].y1~=nil and ibatiment[i].sup1==0 then
						if 10000>((testinbatiment.x-ibatiment[i].x1)*(testinbatiment.x-ibatiment[i].x1)+(1.25*(testinbatiment.y-ibatiment[i].y1))*(1.25*(testinbatiment.y-ibatiment[i].y1))) then
							autorise=1
							i=nbbatiment+1
						end
					end
				end
				i=i+1
			end
		end
	end
	return autorise
end
local function testinterdit(testinbatiment,deb,batconfli)--verifiaction si on a le droit de positionner le batiment
	if testinbatiment~=nil then
	--print("1testinbatiment.x= "..testinbatiment.x)
	autorise=autorisefunction(testinbatiment)
	-- if batconfli~=0 then
	-- 	--print("batconfli!=0")
	-- 	cercle[batconfli]:setFillColor(0.8,0.2,0.2,0.2 )
	-- 	cercle[batconfli]:setStrokeColor( 1, 0.2, 0.2,0.5 )
		batconfli=0
	-- end
	if nbbatiment>0 and grcreabatcer~=nil then
		for i=1,nbbatiment do
			if ibatiment[i]~=nil then
				if ibatiment[i].x1==nil or ibatiment[i].sup1~=0 then
					--print("coucou")
					if cercle[i+2]~=nil then
						grcreabatcer:remove(cercle[i+2])
						cercle[i+2]:removeSelf()
						cercle[i+2]=nil
					end
				else
					if cercle[i+2]==nil then
						cercle[i+2]=display.newCircle(grcreabatcer,ibatiment[i].x1+ibatiment[i].xbase,ibatiment[i].y1+ibatiment[i].ybase,50)
						cercle[i+2]:setFillColor(0.8,0.2,0.2,0.2 )
						cercle[i+2].strokeWidth = 2
						cercle[i+2]:setStrokeColor( 1, 0.2, 0.2,0.5 )
						cercle[i+2].yScale=0.8
					end
					if 10000>((testinbatiment.x-ibatiment[i].x1)*(testinbatiment.x-ibatiment[i].x1)+(1.25*(testinbatiment.y-ibatiment[i].y1))*(1.25*(testinbatiment.y-ibatiment[i].y1))) then
						autorise=1
						batconfli=i+2
						cercle[i+2]:setFillColor(1,0.2,0.2,0.5 )
						cercle[i+2]:setStrokeColor( 1, 0.2, 0.2,0.8 )
					else
						cercle[i+2]:setFillColor(0.8,0.2,0.2,0.2 )
						cercle[i+2]:setStrokeColor( 1, 0.2, 0.2,0.5 )
					end
				end
			end
		end
	end
	if autorise==1 then
		--print("autorise==1")
		if ancienxvalide~=nil then
			
			--print("ancienxvalide~=nil")
			compteuropt=compteuropt+1
			if compteuropt>2 then
				compteuropt=0		
				local distancemin=(testinbatiment.x-ancienxvalide)*(testinbatiment.x-ancienxvalide)+(testinbatiment.y-ancienyvalide)*(testinbatiment.y-ancienyvalide)
				if distancemin>1000 then
					local limitex1carre=ancienxvalide
					local limitex2carre=testinbatiment.x
					local limitey1carre=ancienyvalide
					local limitey2carre=testinbatiment.y

					local minx=limitex1carre
					local maxx=limitex2carre
					if minx>maxx then
						maxx=limitex1carre
						minx=limitex2carre
					end
					maxx=maxx+60
					minx=minx-60
					local miny=limitey1carre
					local maxy=limitey2carre
					if miny>maxy then
						miny=limitey2carre
						maxy=limitey1carre
					end
					maxy=maxy+60
					miny=miny-60

					local testposbat={}
					testposbat.x=minx -- ancienxvalide
					testposbat.y=miny -- ancienyvalide
					local varrandx=mathfloor((maxx-minx)*0.2)
					--print("maxx "..maxx.." minx "..minx.." result "..varrandx)
					if varrandx<10 then
						varrandx=10
					end
					local varrandy=mathfloor((maxy-miny)*0.2)
					--print("maxy "..maxy.." miny "..miny.." result "..varrandy)
					if varrandy<10 then
						varrandy=10
					end
					-- print("nb operation "..(((maxx-minx)/varrandx)*((maxy-miny)/varrandy)))
					-- if ((maxx-minx)/varrandx)*((maxy-miny)/varrandy)<20 then
					-- 	print("precision ajouter")
					-- 	while ((maxx-minx)/varrandx)*((maxy-miny)/varrandy)<20 do
					-- 		varrandx=varrandx*0.9
					-- 		varrandy=varrandy*0.9
					-- 	end
					-- end
					while testposbat.x<maxx do --i*xdirec<limitex2carre*(xdirec) do
						while testposbat.y<maxy do --j*ydirec<limitey2carre*(ydirec) do
							local distancemintest=(testinbatiment.x-testposbat.x)*(testinbatiment.x-testposbat.x)+(testinbatiment.y-testposbat.y)*(testinbatiment.y-testposbat.y)
							if distancemin>distancemintest then
								local autorise1=autorisefunction(testposbat)
								if autorise1==0 then
									distancemin=distancemintest
									ancienxvalide=testposbat.x
									ancienyvalide=testposbat.y
								end
							end
							testposbat.y=testposbat.y+varrandy
						end
						testposbat.y=miny
						testposbat.x=testposbat.x+varrandx
					end
				end
			end
			if groupebattemp~=nil then 
				groupebattemp.nbatiment1.isVisible=true
				groupebattemp.nbatiment1.x=testinbatiment.x+batimentinit[testinbatiment.typebatiment][0][1].x
				groupebattemp.nbatiment1.y=testinbatiment.y+batimentinit[testinbatiment.typebatiment][0][1].y
			end
			testinbatiment.y=ancienyvalide
			testinbatiment.x=ancienxvalide
			testinbatiment.image.x=testinbatiment.x+batimentinit[testinbatiment.typebatiment][0][1].x
			testinbatiment.image.y=testinbatiment.y+batimentinit[testinbatiment.typebatiment][0][1].y
			if tuto==2 then
				if tutoaction==2 then
					if fleche.type then
						background:remove(fleche)
						fleche:removeSelf()
						fleche=display.newImage(imbouton.swipe,1)
						background:insert(fleche)
						fleche.group=1
						fleche.type=false
					end
					fleche.xScale=0.5
					fleche.yScale=0.5
					fleche.x=testinbatiment.x+fleche.width*fleche.xScale*0.5 --nbatiment.x-fleche.width*0.6*fleche.xScale
					fleche.y=testinbatiment.y+fleche.height*fleche.yScale*0.5 --nbatiment.y-fleche.height*0.6*fleche.yScale
				end
			end
			-- if groupebattemp~=nil then
			-- 	groupebattemp.interdit.x=groupebattemp.nbatiment1.x
			-- 	groupebattemp.interdit.y=groupebattemp.nbatiment1.y
			-- 	groupebattemp.interdit.isVisible=true
			-- end
			autorise=0
		else
			local trouverpos=false
			local dirchx=1
			local dirchy=0
			local direct=-1
			local largeur=1
			local largfai=0
			local largfin=0
			local testcoor={}
			testcoor.x=testinbatiment.x
			testcoor.y=testinbatiment.y
			while not trouverpos and largeur<5 do
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
				while largfai<=largeur and not trouverpos do
					largfai=largfai+1
					testcoor.x=testcoor.x+7*dirchx*largfai
					testcoor.y=testcoor.y+7*dirchy*largfai
					local autorise1=autorisefunction(testcoor)
					if autorise1==0 then
						trouverpos=true
					end
					--local lecercle=display.newCircle(group[2048],testcoor.x,testcoor.y,7)
				end
			end
			if trouverpos then
				if groupebattemp~=nil then 
					--print("trouverpos")
					groupebattemp.nbatiment1.isVisible=false --true
					--nbatiment1.x=testcoor.y --testinbatiment.x
					--nbatiment1.y=testcoor.x --testinbatiment.y
					-- groupebattemp.interdit.x=testinbatiment.x
					-- groupebattemp.interdit.y=testinbatiment.y
					groupebattemp.conttext.x=testinbatiment.x
					groupebattemp.conttextOr.x=groupebattemp.conttext.x+25*apparence
					groupebattemp.conttext.y=testinbatiment.y-30-10*apparence
					groupebattemp.conttextOr.y=groupebattemp.conttext.y
				end
				testinbatiment.y=testcoor.y
				--print("3testinbatiment.x= "..testinbatiment.x)
				testinbatiment.x=testcoor.x
				--print("4testinbatiment.x= "..testinbatiment.x)
				testinbatiment.image.x=testinbatiment.x+batimentinit[testinbatiment.typebatiment][0][1].x
				testinbatiment.image.y=testinbatiment.y+batimentinit[testinbatiment.typebatiment][0][1].y
				ancienxvalide=testcoor.x
				ancienyvalide=testcoor.y
				if tuto==2 then
					if tutoaction==2 then
						if fleche.type then
							background:remove(fleche)
							fleche:removeSelf()
							fleche=display.newImage(imbouton.swipe,1)
							background:insert(fleche)
							fleche.group=1
							fleche.type=false
						end
						fleche.xScale=0.5
						fleche.yScale=0.5
						fleche.x=testinbatiment.x+fleche.width*fleche.xScale*0.5 --nbatiment.x-fleche.width*0.6*fleche.xScale
						fleche.y=testinbatiment.y+fleche.height*fleche.yScale*0.5 --nbatiment.y-fleche.height*0.6*fleche.yScale
					end
				end
				-- interdit.x=nbatiment1.x
				-- interdit.y=nbatiment1.y
				--groupebattemp.interdit.isVisible=true
				autorise=0
			end
		end
		if ancienxvalide==nil then
			groupebattemp.nbatiment1.isVisible=false
			-- groupebattemp.interdit.x=testinbatiment.x
			-- groupebattemp.interdit.y=testinbatiment.y
			-- groupebattemp.interdit.isVisible=true
			if tuto==2 then
				if tutoaction==2 then
					if not fleche.type then
						fleche.xScale=0.5
						fleche.yScale=0.5
						fleche.x=testinbatiment.x+fleche.width*fleche.xScale*0.5 --nbatiment.x-fleche.width*0.6*fleche.xScale
						fleche.y=testinbatiment.y+fleche.height*fleche.yScale*0.5 --nbatiment.y-fleche.height*0.6*fleche.yScale
					end
				end
			end
		end
	else
		--print("autorise~=1")
		if groupebattemp~=nil then 
			groupebattemp.nbatiment1.isVisible=false
			--groupebattemp.interdit.isVisible=false
		end
		ancienxvalide=testinbatiment.x
		ancienyvalide=testinbatiment.y
		if tuto==2 then
			if tutoaction==2 then
				if not fleche.type then
					background:remove(fleche)
					fleche:removeSelf()
					fleche=display.newImage(imbouton.fleche,1)
					background:insert(fleche)
					fleche.group=1
					fleche.xScale=1.2
					fleche.yScale=1.2
					fleche.type=true
					print("remplace fleche")
				end
				fleche.xScale=1.2
				fleche.yScale=1.2
				fleche.x=nbatiment.x-fleche.width*0.6*fleche.xScale
				fleche.y=nbatiment.y-fleche.height*0.6*fleche.yScale
				transition.from(fleche,{time=200,transition=easing.inCirc,xScale=fleche.xScale*0.9,yScale=fleche.yScale*0.9})
			end
		end
	end
	if groupebattemp~=nil then
		groupebattemp.supprimer.x=testinbatiment.x
		groupebattemp.supprimer.y=testinbatiment.y+30+30*apparence
		groupebattemp.valider.x=testinbatiment.x
		groupebattemp.valider.y=testinbatiment.y+10
		groupebattemp.valider.isVisible = false
		groupebattemp.supprimer.isVisible=false
	end
	-- interdit.x=testinbatiment.x
	-- interdit.y=testinbatiment.y
	-- interdit.isVisible=false
	if cercle~=nil then
		if cercle[1]~=nil then
			cercle[1].x=testinbatiment.x
			cercle[1].y=testinbatiment.y+30
		end
	end 
	cercleporte.x=testinbatiment.x
	cercleporte.y=testinbatiment.y+30
	if(autorise==1)then
		
		cercle[1]:setFillColor(1,0.2,0.2,0.7 )
		cercle[1]:setStrokeColor( 1, 0.2, 0.2,1 )
		if deb==1 then
			groupebattemp.supprimer.isVisible=true
		end
		--interdit.isVisible=true
	else
		if cercle~=nil then
			if cercle[1]~=nil then
				cercle[1]:setFillColor(0.8,0.2,0.2,0.4 )
				cercle[1]:setStrokeColor( 0, 0.5, 0,0.8 )
			end
		end
		if deb==1 then
			if groupebattemp~=nil then 
				--groupebattemp.interdit.isVisible=false
				groupebattemp.supprimer.isVisible=true
				--groupebattemp.valider.alpha=1--0.5
				groupebattemp.valider.isVisible=true
				groupebattemp.conttext.isVisible=true
				groupebattemp.conttextOr.isVisible=true
			end
		end
	end
	--print("2testinbatiment.x= "..testinbatiment.x)
	return batconfli
end
 end
local function nouv(typebatiment)--nuveau batiment temporel créé
	--local batiment = require( "batiment" )
	--if  cliccreabouton==false then
	-- tuto ici
	-- if coroutine.running()~=nil then
	-- 	print("coroutine creation: "..coroutine.running())
	-- else
	-- 	print("coroutine creation: nil")
	-- end
	cliccreabouton=true
	local function listenercliccreabouton(event)
		cliccreabouton=false
		print("remove listener")
	end	
	local timercliccreabouton=timer.performWithDelay( 500, listenercliccreabouton )

		local batconfli=0
		  numtap=0
		local function nbatimenttap()--demande de construction du batiment(endroit chossi)
			if(autorise==0 and numtapb==0 and clicpouvoir1==0 and clicpouvoir2==0 and clicpouvoir3==0 and geneclic==0)then
				numtap=numtap+1
				-- if(numtap==1)then
				-- 	valider.alpha = 1
				-- 	--text5 = display.newText( "1", 180, 10, native.systemFontBold, 12 )
				-- end

				
				if(numtap==1)then
					--corriger pb lorsque on clique en meme temps sur le bouton construire azerty
				--	print("numtapb")
				--	print(numtapb)
					removenbatbt()
					if argent-(-(prix[typebatiment][0][1])*3)<=0 then
						argent=argent-(-3*prix[typebatiment][0][1])
						--print(argent)
						vartune()
						--tune.text=-argent/3 --.." d'or"
						--if -argent/3>-1 and -argent/3<1  then
						--	print("mise a 0 abs")
							--tune.text=1
						--	tune.text=0
						--end
						
						nbatiment.type1=typebatiment
						constructionanim(nbatiment,1)
						if 1500>((nbatiment.x-genepoint.x)^2+(nbatiment.y-genepoint.y)^2) then
	 						local function testautorisation(self)
								local autorise=1
								if self.y+30<mayminuspos2+30 or self.y+30>maypos2-30 or self.x<maxminuspos2+30 or self.x>maxpos2-30 then
									autorise=2
								end
								if autorise==1 then
									if modezombie or modepanique then
										autorise=0
									else
										local i=1
										if not goh then
											while i<=cheminnb+1 do
											--for i=1, cheminnb+1,1 do
												if 2000>((self.x-chemin[i].x)^2+(self.y+30-chemin[i].y)^2)then
													autorise=0
												end
												i=i+1
											end
										else
											while i<=cheminnb+1 do
												local coef=1
												if chemin[i].mechant~=nil and not modepanique then
													if chemin[i].mechant>1 then
														coef=chemin[i].mechant*chemin[i].mechant
													end
												end
												if 400*coef*cheminlargeur>((self.x-chemin[i].x)*(self.x-chemin[i].x)+(self.y-chemin[i].y)*(self.y-chemin[i].y))then
													autorise=0
												end
												i=i+1
											end
										end
									end
								end
								if autorise==2 then
									autorise=1
								end
								if autorise==0 then
									local i=1
									while i<=nbbatiment do
										if ibatiment[i]~=nil then
											if ibatiment[i].x~=nil and ibatiment[i].sup1==0 then
												--for i=1,nbbatiment do//for remplacer par while
												if 1500>((self.x-ibatiment[i].x1)^2+((self.y-ibatiment[i].y1))^2) then
													autorise=1
													i=nbbatiment+1
												end
											end
										end
										i=i+1
									end
									if 1500>((self.x-nbatiment.x)^2+((self.y-nbatiment.y))^2) then
										autorise=1
									end
								end
								return autorise
							end
	 						local testposbat={}
	 						testposbat.x=genepoint.x
							testposbat.y=genepoint.y
							local i=1
							local xy=0
							local plusmoins=1
							local cpt=0
							local autorise=1
							while autorise==1 do
								if xy==0 then
									testposbat.x=testposbat.x+plusmoins*30
								else
									testposbat.y=testposbat.y+plusmoins*30
								end
								cpt=cpt+1
								if cpt==i then
									cpt=0
									if xy==0 then
										xy=1
									else
										xy=0
										plusmoins=-plusmoins
										i=i+1
									end
								end
								--print("test autorise "..testposbat.x.." "..testposbat.y)
								--local pointteset=display.newCircle(group[2048],testposbat.x,testposbat.y, 2 )
								autorise=testautorisation(testposbat)
							end
							-- local k=1
							-- while k<=nbsoldat do
							-- 	if isoldat[k].gene==1 then
							-- 		if isoldat[k].encombat==1 then
							-- 			isoldat[k].vivant=false
							-- 			isoldat[k].endeplacement=1
							-- 		end
							-- 		k=nbsoldat+1
							-- 	end
							-- end
							genepoint.x=testposbat.x
							genepoint.y=testposbat.y
						end
					else
						pasassezfric()
						-- tune.xScale=tune.xScale*7
						-- tune.yScale=tune.yScale*7
						-- tune:setFillColor( 1, 0, 0 )

						-- local k=0 
						-- local pair=0   	
						-- local function listener( event )
						-- 	k=k+1
						-- 	if pair==1 then
						-- 		print(pair)
						-- 		tune.xScale=tune.xScale*7
						-- 		tune.yScale=tune.yScale*7
						-- 		--pair=0
						-- 	end
						-- 	if pair==0 then
						-- 		print(pair)
						-- 		tune.xScale=tune.xScale/7
						-- 		tune.yScale=tune.yScale/7
						-- 		pair=1
						-- 	else
						-- 		pair=0
						-- 	end
						-- 	if k<10 then
						-- 		print(k)
						-- 		timer.performWithDelay( 500, listener )
						-- 	else
						-- 		tune.xScale=tune.xScale/7
						-- 		tune.yScale=tune.yScale/7
						-- 		tune:setFillColor( 1, 1, 1 )
						-- 	end
						-- end
						-- timer.performWithDelay( 500, listener )
						removenbat()
						-- group[2048]:remove(nbatiment)
						-- nbatiment:removeSelf()
						-- nbatiment=nil
					end
					numtap=0
					enconst=0

				end
			end
		end
		local var=0
		function nbatiment.image:touch( event )--placement du batiment
			local result = true
		 	--print()
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
	 
			if "began" == phase then
				retinf.nbaction=retinf.nbaction+1
				if ( not self.isFocus ) then
					display.getCurrentStage():setFocus( self )
					self.isFocus = true
					self.myX = event.x/taille-nbatiment.x-- event.x/(taille^0.55)-self.x------------------------------------a modifier ici ou plus bas
					self.myY = event.y/taille-nbatiment.y----------------probleme du a taille qui vaut 1 par defaut alors qu'il devrait valoir (?)
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
	 			xori=nbatiment.x
				yori=nbatiment.y
				var=0
			elseif self.isFocus then
				if "moved" == phase then
					if ( self.distance ) then
						local dx,dy			
					else
						--self.myx coordonnée de depart
						--var=var+(event.x*event.x)+(event.y*event.y)
						nbatiment.x = event.x/taille - self.myX
						nbatiment.y = event.y/taille - self.myY
						nbatiment.image.x=nbatiment.x+batimentinit[nbatiment.typebatiment][0][1].x
						nbatiment.image.y=nbatiment.y+batimentinit[nbatiment.typebatiment][0][1].y
						var=var+(nbatiment.x-xori)*(nbatiment.x-xori)+(nbatiment.y-yori)*(nbatiment.y-yori)
						-- supprimer.x=self.x
						-- supprimer.y=self.y+30+30*apparence
						-- valider.x=self.x
						-- valider.y=self.y+10
						-- valider.isVisible = false
						-- supprimer.isVisible=false
						-- interdit.x=self.x
						-- interdit.y=self.y
						-- interdit.isVisible=false
						-- cercle[1].x=self.x
						-- cercle[1].y=self.y+30
						batconfli=testinterdit(nbatiment,0,batconfli)
						if groupebattemp~=nil then
							groupebattemp.conttext.x=groupebattemp.valider.x
							groupebattemp.conttext.y=nbatiment.y-30-10*apparence
							groupebattemp.conttextOr.x=groupebattemp.conttext.x+25*apparence
							groupebattemp.conttextOr.y=groupebattemp.conttext.y
							groupebattemp.conttext.isVisible=false
							groupebattemp.conttextOr.isVisible=false
						end
						--numtap=0	
					end
	 
					if not previousTouches[event.id] then
						self.numPreviousTouches = self.numPreviousTouches + 1
					end
					previousTouches[event.id] = event
				elseif "ended" == phase or "cancelled" == phase then
					blabla=testinterdit(nbatiment,1,0)
					groupebattemp.nbatiment1.isVisible=false
					-- if nbatiment1exist~=nil then
					-- 	nbatiment1.isVisible=false

					-- end

					if previousTouches[event.id] then
						self.numPreviousTouches = self.numPreviousTouches - 1
						previousTouches[event.id] = nil
					end
	 
					if ( #previousTouches > 0 ) then
						-- must be at least 2 touches remaining to pinch/zoom
						self.distance = nil
					else
						-- previousTouches is empty so no more fingers are touching the screen
						-- Allow touch events to be sent normally to the objects they "hit"
						display.getCurrentStage():setFocus( nil )
						if(autorise==0)then
							groupebattemp.supprimer.isVisible=true
							--groupebattemp.valider.alpha=1--0.5
							groupebattemp.valider.isVisible=true
							groupebattemp.conttext.isVisible=true
							groupebattemp.conttextOr.isVisible=true
						end
						self.isFocus = false
						self.distance = nil
						self.xScaleOriginal = nil
						self.yScaleOriginal = nil
		 
						-- reset array
						self.previousTouches = nil
						self.numPreviousTouches = nil
						--print(self.x.." "..self.myX.."my"..self.y.." "..self.myY)
						--print(event.x.." "..self.x)
						--print("var"..var)
						--if newvar~=nil then
						--	newvar.text="var: "..var
					
						if var<80 then --if ((self.x-self.myX)^2+(self.y-self.myY)^2)<10000 then
							clicsurqqcfunc()
							local function timerdemerde(event)
								if(fenaff==false and  clicpause==0 and pv1clic==0 and pv2clic==0 and pv3clic==0 and clicconstruire==0 and clicinfanterie==0 and clicarcher==0 and clicpouvoir1==0 and clicpouvoir2==0 and clicpouvoir3==0 and pv1clicactiver==0 and pv2clicactiver==0 )then	--				
									if nbatiment.x==nil then
										nbatiment.x=xori
										if nbatiment.x==nil then
											nbatiment.x=(-background.x+contentcenterx)/taille
										end
									end
									if nbatiment.y==nil then
										nbatiment.y=yori
										if nbatiment.y==nil then
											nbatiment.y=(-background.y+contentcentery)/taille
										end
									end	
									if creationtime==0 then
										creationtime=1
										--print("et hop ca c'est fait")
										local function listenercreation(event)
											creationtime=0
											--print()
										end	
										local timer1creation=timer.performWithDelay( 100, listenercreation )
										nbatimenttap()
									end
									nbatiment.x=xori--à corriger si genere bug
									nbatiment.y=yori--
									nbatiment.image.x=nbatiment.x+batimentinit[nbatiment.typebatiment][0][1].x
									nbatiment.image.y=nbatiment.y+batimentinit[nbatiment.typebatiment][0][1].y
								end
							end
							local timerdemerde=timer.performWithDelay( 10, timerdemerde )
						else
							numtap=0
						end
					end

					--if event.x
				end
			end
	 
			return result
		end
	  
		-- register table listener
		function nbatiment.image:tap( event )--action lorsqu'on clique sur un le batiment ou le bouton confirmer
			clicsurqqcfunc()
			local function timerdemerde(event)
				if(fenaff==false and  clicpause==0 and pv1clic==0 and pv2clic==0 and pv3clic==0 and clicconstruire==0 and clicinfanterie==0 and clicarcher==0 and clicpouvoir1==0 and clicpouvoir2==0 and clicpouvoir3==0 and pv1clicactiver==0 and pv2clicactiver==0 )then	--				

					if creationtime==0 then
						creationtime=1
						clicsurval=true
						--print("et hop ca c'est fait")
						local function listenercreation(event)
							creationtime=0
							clicsurval=false
							--print()
						end	
						local timer1creation=timer.performWithDelay( 100, listenercreation )

						nbatimenttap()
					end
				else
					removenbat()
				end
			end
			local timerdemerde=timer.performWithDelay( 10, timerdemerde )
		end
		function groupebattempsupprimer( event )--clic sur annuler la demande de creationd'un batiment
			clicsurqqcfunc()
			if numtapb==0 and clicpouvoir1==0 and clicpouvoir2==0 and clicpouvoir3==0 and geneclic==0 then
				removenbat()
			end
		end
		--function valider:tap( event)

		--end
		-- function valider:tap(event)--clic sur valider la construction du batiment
		-- 	clicsurqqcfunc()
		-- 	local function timerdemerde(event)
		-- 	if(fenaff==false and  clicpause==0 and pv1clic==0 and pv2clic==0 and pv3clic==0 and clicconstruire==0 and clicinfanterie==0 and clicarcher==0 and clicpouvoir1==0 and clicpouvoir2==0 and clicpouvoir3==0 and pv1clicactiver==0 and pv2clicactiver==0 )then	--				

		-- 	if creationtime==0 then
		-- 		creationtime=1
		-- 		clicsurval=true
		-- 		--print("et hop ca c'est fait")
		-- 		local function listenercreation(event)
		-- 			creationtime=0
		-- 			clicsurval=false
		-- 			--print()
		-- 		end	
		-- 		local timer1creation=timer.performWithDelay( 100, listenercreation )
		-- 		nbatimenttap()
		-- 	end
		-- 	else
		-- 	removenbat()
		-- 	end
		-- 	end
		-- 	local timerdemerde=timer.performWithDelay( 10, timerdemerde )
		-- end
		groupebattemp.supprimer:addEventListener( "tap", groupebattempsupprimer )
		nbatiment.image:addEventListener( "touch", nbatiment.image )
		nbatiment.image:addEventListener( "tap", nbatiment.image )
		--valider:addEventListener("tap",valider)
	--return(t1)
	if tuto==2 then
		if tutoaction==1 or tutoaction==0 then
			actionfaite(1)
			print("nouv bat tuto")
		end
	end
end
local function ajouterbp(nbatiment,typebatiment,x,y)--creation des boutons liés au batiment temporel
	local affx,affy
	if x==nil then
		affx=(-background.x+contentcenterx)/taille--taille-----------------------------resoudre pb du placment lors du zoom dezoom, faut il mettre scale ou taille ou...
		affy=(-background.y+contentcentery)/taille
	else
		affx=x--(-background.x+x)/taille
		affy=y--(-background.y+y)/taille
	end
	--print("affx"..affx)
	nbatiment.x=affx
	nbatiment.y=affy
	nbatiment.image.x=nbatiment.x+batimentinit[nbatiment.typebatiment][0][1].x
	nbatiment.image.y=nbatiment.y+batimentinit[nbatiment.typebatiment][0][1].y
	nbatiment.xScale=nbatiment.xScale or 1
	nbatiment.yScale=nbatiment.yScale or 1
	if not goh then
		nbatiment.xScale = nbatiment.xScale*0.15--* 0.15
		nbatiment.yScale = nbatiment.yScale*0.15 --* 0.15
	else
		if typebatiment==1 then
			nbatiment.xScale = nbatiment.xScale*0.35--* 0.15
		else
			nbatiment.xScale = nbatiment.xScale*0.45--* 0.15
		end
		nbatiment.yScale =nbatiment.xScale
	end
	nbatiment.image.xScale=nbatiment.xScale
	nbatiment.image.yScale=nbatiment.yScale
	nbatiment.alpha=0.85
	nbatiment.image.alpha=nbatiment.alpha
	
	--group[2048]:
	groupebattemp.nbatiment1.x=nbatiment.image.x
	groupebattemp.nbatiment1.y=nbatiment.image.y
	groupebattemp.nbatiment1.xScale=nbatiment.xScale
	groupebattemp.nbatiment1.yScale=nbatiment.yScale
	groupebattemp.nbatiment1:setFillColor(1,0,0)
	groupebattemp:insert(groupebattemp.nbatiment1)
	groupebattemp.nbatiment1.alpha=0.65
	groupebattemp.nbatiment1.isVisible=false

	groupebattemp.supprimer=display.newImage(imbouton.batiment,10) -- imbouton.supprimer,1)--display.newImage("bouton/supprimer.png",nbatiment.x,nbatiment.y+35)
	groupebattemp.supprimer.x=nbatiment.x
	groupebattemp.supprimer.y=nbatiment.y+30+30*apparence
	if not goh then
		groupebattemp.supprimer.xScale=0.20*apparence
	else
		groupebattemp.supprimer.xScale=0.10*apparence
	end
	groupebattemp.supprimer.yScale=groupebattemp.supprimer.xScale
	groupebattemp.supprimer.isVisible=false
	groupebattemp:insert(groupebattemp.supprimer)
	groupebattemp.valider=display.newImage(imbouton.batiment,11) -- imbouton.valider,1)--display.newImage("bouton/valider.png",nbatiment.x,nbatiment.y)
	groupebattemp.valider.x=nbatiment.x
	groupebattemp.valider.y=nbatiment.y+10
	if not goh then
		groupebattemp.valider.xScale=0.3*apparence
	else
		groupebattemp.valider.xScale=0.2*apparence --0.15*apparence
	end
	groupebattemp.valider.yScale=groupebattemp.valider.xScale
	groupebattemp:insert(groupebattemp.valider)
	groupebattemp.valider.isVisible = false
	
	-- groupebattemp.interdit=display.newImage(imbouton.interdit,1)--display.newImage("bouton/interdit.png",nbatiment.x,nbatiment.y)
	-- groupebattemp.interdit.x=nbatiment.x
	-- groupebattemp.interdit.y=nbatiment.y
	-- groupebattemp.interdit.xScale=0.5
	-- groupebattemp.interdit.yScale=0.5
	-- groupebattemp:insert(groupebattemp.interdit)
	-- groupebattemp.interdit.isVisible = false

	grcreabatcer=display.newGroup()
	group[3]:insert(grcreabatcer)
	cercle={}
	cercle[1]=display.newCircle(grcreabatcer,nbatiment.x+0,nbatiment.y+30,50)
	cercle[1].yScale=0.8
	cercle[1]:setFillColor(0.8,0.2,0.2,0.4 )
	cercle[1].strokeWidth = 2
	cercle[1]:setStrokeColor( 1, 0.2, 0.2,0.8 )
	if nbbatiment>1 then
		for i=1,nbbatiment do
			if ibatiment[i]~=nil then
				if ibatiment[i].x~=nil and ibatiment[i].sup1==0 then
					cercle[i+2]=display.newCircle(grcreabatcer,ibatiment[i].x1+ibatiment[i].xbase,ibatiment[i].y1+ibatiment[i].ybase,50)
					cercle[i+2]:setFillColor(0.8,0.2,0.2,0.2 )
					cercle[i+2].strokeWidth = 2
					cercle[i+2]:setStrokeColor( 1, 0.2, 0.2,0.5 )
					cercle[i+2].yScale=0.8
				end
			end
		end
	end
	local porte
	if typebatiment==1 then
		porte=9000
	else
		porte=18000
	end
	cercleporte=display.newCircle(grcreabatcer,cercle[1].x,cercle[1].y,mathsqrt(porte))
	cercleporte.yScale=0.8
	cercleporte:setFillColor(0,0,0,0)
	cercleporte.strokeWidth=2
	cercleporte:setStrokeColor(0,0,1,0.3)

	-- local color = 
	-- {
	--    highlight ={r=1,g=1,b=1},-- { r=0.8, g=0.9, b=1 },
	--    shadow = { r=0, g=0, b=0 }
	-- }
	groupebattemp.conttext=display.newEmbossedText(prix[typebatiment][0][1], groupebattemp.valider.x, nbatiment.y-30-10*apparence,fonttype, 25*apparence*fontsize )
	groupebattemp.conttext:setFillColor(colortextfill[1],colortextfill[2],colortextfill[3])
	groupebattemp.conttext:setEmbossColor(colortextemb)
	groupebattemp.conttext.isVisible=false
	groupebattemp:insert(groupebattemp.conttext)
	groupebattemp.conttextOr=display.newImage(imbouton.monnaie,3)
	groupebattemp.conttextOr.x=groupebattemp.conttext.x+25*apparence
	groupebattemp.conttextOr.y=groupebattemp.conttext.y
	groupebattemp.conttextOr.xScale=0.1*apparence
	groupebattemp.conttextOr.yScale=groupebattemp.conttextOr.xScale
	groupebattemp.conttextOr.isVisible=false
	groupebattemp:insert(groupebattemp.conttextOr)
end
local t1 = {}--fonction qu'on declare, etudier facon de la declarer, obj trouver les void, fonction inutile
t1.creation = function ()--init de la creation de batiment creation des boutons
	system.activate( "multitouch" )

----------------------------------------------------------androidDisplayWidthInInches pour la taille des boutons!!
---------------------------------------------------------------------------------
	grcreation=display.newGroup()
	constx=xmaxscreen-150*0.5*apparence*0.5-10--100--actualcontentwidth-100
	consty=0.5*actualcontentheight+contentcentery-150*0.5*apparence*0.5-10--actualcontentheight-50
	construireinf=display.newImage(imbouton.batiment,2) -- imbouton.construireinf,1)--display.newImage("bouton/construireinf.png",constx,consty)
	construireinf.x=constx
	construireinf.y=consty
	construirearch=display.newImage(imbouton.batiment,3) -- imbouton.construirearch,1)--display.newImage("bouton/construirearch.png",constx,consty)
	construirearch.x=constx
	construirearch.y=consty
	construire=display.newImage(imbouton.batiment,1) --imbouton.construire,1)-- display.newImage( "bouton/construire.png", constx,consty )
	local construiregris=false
	local function construire100( event )
		if argent+100*3<=0 then
			if construiregris then
				construiregris=false
				construire:setFillColor(1)
				construirearch:setFillColor(1)
				construireinf:setFillColor(1)
			end
		else
			if not construiregris then
				construiregris=true
				construire:setFillColor(0.5)
				construirearch:setFillColor(0.5)
				construireinf:setFillColor(0.5)
			end
		end
	end
	Runtime:addEventListener( "enterFrame", construire100 )

	effecttranstion(construire)
	construire.x=constx
	construire.y=consty
	enconst=0--indique si un batiment est entrain d'etre placer
--function scene:create( event )--bouton de construction: a modifier
	--text8 = display.newText( "create", 180, 10, native.systemFontBold, 20 )
	--local widthInches = system.getInfo( "androidDisplayWidthInInches" )--------Il faut la pro version
	--local heightInches = system.getInfo( "androidDisplayHeightInInches" )
	if not goh then
		construire.xScale=construire.xScale*0.5*apparence--+widthInches*0.2
	else
		construire.xScale=construire.xScale*0.25*apparence
	end
	construire.yScale=construire.xScale--+heightInches*0.2
	if not goh then
		construireinf.xScale=construireinf.xScale*0.5*apparence
	else
		construireinf.xScale=construireinf.xScale*0.25*apparence
	end
	construireinf.yScale=construireinf.xScale
	construireinf.scale=construireinf.xScale
	construireinf.x=constx-70*apparence
	construireinf.y=consty-40*apparence
	construireinf.x1=construireinf.x
	construireinf.y1=construireinf.y
	if not goh then
		construirearch.xScale=construirearch.xScale*0.5*apparence
	else
		construirearch.xScale=construirearch.xScale*0.25*apparence
	end
	construirearch.yScale=construirearch.xScale
	construirearch.scale=construirearch.xScale
	construirearch.y=consty-80*apparence
	construirearch.y1=construirearch.y
	construirearch.x1=construirearch.x
	construireinf.isVisible = false--invisible (on peut pas cliquer dessus)
	construirearch.isVisible = false
	construireinfTexte=display.newEmbossedText(grpartie,"100",construireinf.x1, construireinf.y1+30,fonttype, 17*apparence*fontsize )
	-- 	local color = 
	-- {
	--    highlight ={r=1,g=1,b=1},-- { r=0.8, g=0.9, b=1 },
	--    shadow = { r=0, g=0, b=0 }
	-- }
	construireinfTexte:setFillColor(colortextfill[1],colortextfill[2],colortextfill[3])
	construireinfTexte:setEmbossColor(colortextemb)
	construireinfTexte.isVisible=false
	construireinfTexte.alpha=0.7
	construireinfOr=display.newImage(imbouton.monnaie,3)
	construireinfOr.xScale=0.1*apparence
	construireinfOr.yScale=construireinfOr.xScale
	construireinfOr.scale=construireinfOr.yScale
	construireinfOr.isVisible=false
	construireinfOr.alpha=0.7
	construirearchTexte=display.newEmbossedText(grpartie,"100",construirearch.x1, construirearch.y1+30,fonttype, 17*apparence*fontsize )
	construirearchTexte:setFillColor(colortextfill[1],colortextfill[2],colortextfill[3])
	construirearchTexte:setEmbossColor(colortextemb)
	construirearchTexte.alpha=0.7
	construirearchOr=display.newImage(imbouton.monnaie,3)
	construirearchOr.x=construirearchTexte.x+20*apparence
	construirearchOr.y=construirearchTexte.y
	construirearchOr.x1=construirearchOr.x
	construirearchOr.y1=construirearchOr.y
	construirearchOr.xScale=0.1*apparence  
	construirearchOr.scale=construirearchOr.xScale
	construirearchOr.yScale=construirearchOr.xScale
	construirearchOr.alpha=0.7
	construirearchTexte.scale=construirearchTexte.xScale
	construireinfOr.x=construireinfTexte.x+20*apparence
	construireinfOr.x1=construireinfOr.x
	construireinfOr.y=construireinfTexte.y
	construireinfOr.y1=construireinfOr.y
	construireinfTexte.y1=construireinfTexte.y
	construireinfTexte.x1=construireinfTexte.x
	construireinfTexte.scale=construireinfTexte.xScale
	construirearchTexte.y1=construirearchTexte.y
	construirearchTexte.x1=construirearchTexte.x
	construirearchOr.isVisible=false
	construirearchTexte.isVisible=false
	grcreation:insert(construireinf)
	grcreation:insert(construirearch)
	grcreation:insert(construireinfTexte)
	grcreation:insert(construirearchTexte)
	grcreation:insert(construireinfOr)
	grcreation:insert(construirearchOr)
	grcreation:insert(construire)
	grpartie:insert(grcreation)
	clicconstruire=0
	clicinfanterie=0
	clicarcher=0
	if contreaihaut==1 and contreai==0 then
		construire.isVisible=false
	end

	function construire:tap( event )--clic sur le bouton construire permet d'afficher les deux boutons de choix de categorie de batiment 
		clicsurqqcfunc() 
		construire.fill.effect = "filter.sepia"
		construire.fill.effect.intensity=-2
		transition.to(construire.fill.effect, { time=500, intensity=0 } ) 
		local autorisation=true
		if tuto~=0 and not savegame.tuto1 and niveauch==1 then
			if nbbatiment>=2 then
				autorisation=false
			end
		end
		if autorisation==false then
			--print("pas autorisation "..tuto)
		end
		if fenaff==false and autorisation then
			if grdrap~=nil then --draptap==1 then
				if numdrap~=nil then
					if ibatiment[numdrap].drap~=nil then
						ibatiment[numdrap].drap.isVisible=false
					end
				end
				display.remove(grdrap)
				-- group[grdrap.group].remove(grdrap)
				-- grdrap:removeSelf()
				grdrap=nil
				draptap=0
			end
			clicconstruire=1
			--draptap==0 then
			--drappos[boutondev1.num].isVisible=false
			local function clicconstruire1( event )
				clicsurqqcfunc()
				clicconstruire=0
			end
			clicconstruire1=timer.performWithDelay( 50, clicconstruire1 )
			if pv1clicactiver==1 then
				pv1clicactiver=0
				pvaction.isVisible=false
				display.remove(pv1affinter)
				pv1affinter=nil
				Runtime:removeEventListener( "tap",clicpv1)
			end
			if pv2clicactiver==1 then
				pv2clicactiver=0
				pvaction.isVisible=false
				Runtime:removeEventListener( "tap",clicpv2)
			end
			
			numtapb=numtapb+1--nombre de fois qu'on clique sur le bouton construire
			-- print("\n\n\n\nnumtapb "..numtapb)
			print("\n\nnumtapb "..numtapb)
			-- if enconst==0 then
			-- 	numtapb=1
			-- end
			if (numtapb==1)then
				numtapba=0
				ancienxvalide=nil
				ancienyvalide=nil
				--îci animation
				construirearch.x=construirearch.x1
				construirearch.y=construirearch.y1
				construireinf.x=construireinf.x1
				construireinf.y=construireinf.y1
				construirearch.xScale=construirearch.scale
				construirearch.yScale=construirearch.scale
				construireinf.xScale=construireinf.scale
				construireinf.yScale=construireinf.scale
				construireinf.isVisible = true
				-- construireinf.x=constx-70*apparence
				-- construireinf.y=consty-40*apparence
				construirearch.isVisible = true

				construireinfTexte.isVisible=true
				construirearchTexte.isVisible=true
				construireinfOr.isVisible=true
				construirearchOr.isVisible=true
				construirearchTexte.x=construirearchTexte.x1
				construirearchTexte.y=construirearchTexte.y1
				construireinfTexte.x=construireinfTexte.x1
				construireinfTexte.y=construireinfTexte.y1

				construirearchTexte.xScale=construirearchTexte.scale
				construirearchTexte.yScale=construirearchTexte.scale
				construireinfTexte.xScale=construireinfTexte.scale
				construireinfTexte.yScale=construireinfTexte.scale
				construirearchOr.x=construirearchOr.x1
				construirearchOr.y=construirearchOr.y1
				construireinfOr.x=construireinfOr.x1
				construireinfOr.y=construireinfOr.y1
				construirearchOr.xScale=construirearchOr.scale
				construirearchOr.yScale=construirearchOr.scale
				construireinfOr.xScale=construireinfOr.scale
				construireinfOr.yScale=construireinfOr.scale


				transition.from(construireinf,{time=500,transition=easing.outBack, y=construire.y-10, x=construire.x+5,xScale=construireinf.scale*0.5,yScale=construireinf.scale*0.5})
				transition.from(construirearch,{time=500,transition=easing.outBack, y=construire.y-10, x=construire.x+5,xScale=construirearch.scale*0.5,yScale=construirearch.scale*0.5})
				transition.from(construireinfTexte,{time=500,transition=easing.outBack, y=construire.y-10, x=construire.x+5,xScale=construireinfTexte.scale*0.5,yScale=construireinfTexte.scale*0.5})
				transition.from(construirearchTexte,{time=500,transition=easing.outBack, y=construire.y-10, x=construire.x+5,xScale=construireinfTexte.scale*0.5,yScale=construireinfTexte.scale*0.5})
				transition.from(construireinfOr,{time=500,transition=easing.outBack, y=construire.y-10, x=construire.x+5,xScale=construireinfOr.scale*0.5,yScale=construireinfOr.scale*0.5})
				transition.from(construirearchOr,{time=500,transition=easing.outBack, y=construire.y-10, x=construire.x+5,xScale=construireinfOr.scale*0.5,yScale=construireinfOr.scale*0.5})
		
				if tuto==2 then
					if tutoaction==0 then
						actionfaite()
					end
				end
				--construirearch.x=constx-70*apparence
				-- construirearch.y=consty-80*apparence
				if(enconst==1)then
					-- background:remove(nbatiment)
					-- nbatiment:removeSelf()
					-- enconst=0
					removenbat()
				end
				if tuto~=0 and niveauch==1 then
					if tutoaction>0 then
						print("tuto "..tuto)
						if nbbatiment==1 then
							if  ibatiment[1].type1==2 then
								construirearch.isVisible=false
								construirearchTexte.isVisible=false
								construirearchOr.isVisible=false
							else
								construireinf.isVisible=false
								construireinfTexte.isVisible=false
								construireinfOr.isVisible=false
							end
						end
					end
				end
			else
				print("numtapb pas bon"..numtapb)
				-- numtapb=0
				-- -- ici animation avec listener
				-- print("effacer crea 825")
				-- transition.to(construireinf,{time=500,transition=easing.inCirc, y=construire.y,xScale=construireinf.scale*0.5,yScale=construireinf.scale*0.5, x=construire.x, onComplete=creadisp})
				-- transition.to(construirearch,{time=500,transition=easing.inCirc,xScale=construirearch.scale*0.5,yScale=construirearch.scale*0.5, y=construire.y, x=construire.x})
				-- --construireinf.isVisible=false
				-- --construirearch.isVisible=false
			end
			if tuto==2 then
				if tutoaction==13 then
					actiondefaite()
				end
			end
			--text7 = display.newText( "20", 180, 10, native.systemFontBold, 20 )
			if (boutondev==1) then
				--local batiment = require( "batiment" )
				draptap=0
				batiment.supbouton()
			end
		end
	end
	if not functionload then
	function hideConstrucButton()
		numtapba=0
		-- ici animation avec listener
		-- print("effacer crea 855")
		transition.to(construireinf,{time=250,transition=easing.inCirc, y=construire.y,xScale=construireinf.scale*0.5,yScale=construireinf.scale*0.5, x=construire.x, onComplete=creadisp})
		transition.to(construirearch,{time=250,transition=easing.inCirc,xScale=construirearch.scale*0.5,yScale=construirearch.scale*0.5, y=construire.y, x=construire.x})
		transition.to(construirearchOr,{time=250,transition=easing.inCirc,xScale=construirearchOr.scale*0.5,yScale=construirearchOr.scale*0.5, y=construire.y, x=construire.x})
		transition.to(construirearchTexte,{time=250,transition=easing.inCirc,xScale=construirearchTexte.scale*0.5,yScale=construirearchTexte.scale*0.5, y=construire.y, x=construire.x})
		transition.to(construireinfOr,{time=250,transition=easing.inCirc,xScale=construireinfOr.scale*0.5,yScale=construireinfOr.scale*0.5, y=construire.y, x=construire.x})
		transition.to(construireinfTexte,{time=250,transition=easing.inCirc,xScale=construireinfTexte.scale*0.5,yScale=construireinfTexte.scale*0.5, y=construire.y, x=construire.x})

		--construireinf.isVisible=false
		--construirearch.isVisible=false
		numtapb=0
		if tuto==2 then
			if tutoaction==1 then
				print("backgroundtap tuto")
				actiondefaite()
			end
		end
	end
	function backgroundtap()--action lorsqu'on clique sur la carte
		numtapba=numtapba+1--nombre de clique sur le background
		if draptap==1 and drapeausolclic==0 then
			--print("tap back drap out")
			ibatiment[numdrap].drap.isVisible=false
			if grdrap~=nil then
				group[grdrap.group]:remove(grdrap)
				grdrap:removeSelf()
				grdrap=nil
			end
			draptap=0
		end

		if(numtapba==2)then
			hideConstrucButton()
		end
		if genetap==1 then
			if genedrap~=nil then
				group[genedrap.group]:remove(genedrap)
				genedrap:removeSelf()
				genedrap=nil
			end
			genetap=0
		end
		--print("boutondev")
		--print(boutondev)

		if(boutondev==2)then-----------------------------resoudre le porbleme des bouton qui ne disparaissent pas
			--local batiment = require( "batiment" )
			batiment.supbouton()
		end	
		if(boutondev==1)then
			boutondev=2
		end

		--boutondev=boutondev+1
	end
	end
	function background:tap( event )
		backgroundtap()
	end
	local function initcreationbattemp()
		removenbatbt() --removebattemp()
		groupebattemp=display.newGroup()
		group[2048]:insert(groupebattemp)
	end
	local function construireinftap(x,y,nouveaubat)--clique sur le bouton construire infanterie
		if not cliccreabouton then
		if nouveaubat==0 or nouveaubat==1 then
		clicsurqqcfunc()
		clicinfanterie=1
		local function clicinfanterie1( event )
			clicinfanterie=0
		end
		clicinfanterie1=timer.performWithDelay( 50, clicinfanterie1 )
		enconst=1
		end
		local typebatiment=1
		--background.yScale--taille
		if nouveaubat==0 or nouveaubat==1 then
			nbatiment={}
			nbatiment.typebatiment=1
	 		nbatiment.image=display.newImage(imgbat.inf,1)--display.newImage("batiment/1_infanterie/infanterie1.png",affx,affy)
	 		group[2048]:insert(nbatiment.image)
			--print("c'est le moment"..background.xScale)
			initcreationbattemp()
			-- if nbatiment1exist~=nil then
	 	-- 		group[2048]:remove(nbatiment1)
	 	-- 		nbatiment1:removeSelf()
	 	-- 		nbatiment1exist=nil
	 	-- 	end
	 		groupebattemp.nbatiment1=display.newImage(imgbat.inf,1)
	 		groupebattemp:insert(groupebattemp.nbatiment1)
	 		--background:insert(nbatiment1)
	 		
	 		-- nbatiment1exist=true
			ajouterbp(nbatiment,typebatiment,x,y)
			--nbatiment.alpha=0.1
			print("action 2 "..nouveaubat)
			-- tuto suite
		end
		local blabla=testinterdit(nbatiment,1,0)
		
		if nouveaubat==0 or nouveaubat==2 then
			nouv(typebatiment)
			print("action 1 "..nouveaubat)
		end
	end
	end
	local function construirearchtap(x,y,nouveaubat)--clique sur le bouton construire un batiment de tir
		if not cliccreabouton then
		if nouveaubat==0 or nouveaubat==1 then
		clicsurqqcfunc()
		clicarcher=1
		local function clicarcher1( event )
			clicarcher=0
		end
		clicarcher1=timer.performWithDelay( 50, clicarcher1 )
		enconst=1
		end
		local typebatiment=2
		-- local affx=(-background.x+contentcenterx)/taille
		-- local affy=(-background.y+contentcentery)/taille
		if nouveaubat==0 or nouveaubat==1 then
			nbatiment={}
			nbatiment.typebatiment=2
	 		nbatiment.image=display.newImage(imgbat.arc,1)--display.newImage("batiment/4_archer/archers1.png",affx,affy)
	 		group[2048]:insert(nbatiment.image)
	 		initcreationbattemp()
	 		groupebattemp.nbatiment1=display.newImage(imgbat.arc,1)
	 		groupebattemp:insert(groupebattemp.nbatiment1)
	 		-- if nbatiment1exist~=nil then
	 		-- 	group[2048]:remove(nbatiment1)
	 		-- 	nbatiment1:removeSelf()
	 		-- 	nbatiment1exist=nil
	 		-- end
	 		-- nbatiment1=display.newImage(imgbat.arc,1)
	 		--background:insert(nbatiment1)
	 		
	 		-- nbatiment1exist=true

			ajouterbp(nbatiment,typebatiment,x,y)
			
		end
		print("nbatiment.x="..nbatiment.x)
		local blabla=testinterdit(nbatiment,1,0)
		print("nbatiment.x="..nbatiment.x)
		if nouveaubat==0 or nouveaubat==2 then
			nouv(typebatiment)
		end
		end
	end
	local batconfli=0
	function construireinf:touch(event)--gestion du placement des batiments(touch pour infanterie et archer)
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
		if "began" == phase then
			retinf.nbaction=retinf.nbaction+1
			-- if nbatiment~=nil then
			-- 	nbatiment.isVisible=false
			-- end
			-- if nbatiment1~=nil then
			-- 	nbatiment1.isVisible=false
			-- end
			-- if interdit~=nil then
			-- 	interdit.isVisible=false
			-- end
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
	 		numtap=0
			self.myX =(-background.x+event.x)/taille--(-background.x+constx-80*apparence)/taille--constx-80*apparence event.x/taille-self.x-- event.x/(taille^0.55)-self.x------------------------------------a modifier ici ou plus bas
			self.myY =(-background.y+event.y)/taille--(-background.y+consty)/taille
			selfx=(-background.x+event.x)/taille--event.x/taille-self.myX
			selfy=(-background.y+event.y)/taille--event.y/taille-self.myY
			if (construireinf.x-event.x)^2+(construireinf.y-event.y)^2<(construirearch.x-event.x)^2+(construirearch.y-event.y)^2 then
				self.typebatiment=1--permet de ssavoir sur quel bouton on a cliquer
			else
				self.typebatiment=2
			end
			--print("self.myX"..self.myX.."selfx"..selfx)

 			xori=selfx
			yori=selfy
			if enconst==0 or var==nil then
				var=0
			end
			--depla=false
		elseif self.isFocus then
			if "moved" == phase then --and groupebattemp~=nil then
				--depla=true
				if ( self.distance ) then
					local dx,dy			
				else
					
					--print("var"..var)
					selfx=(-background.x+event.x)/taille--event.x/taille-self.myX
					selfy=(-background.y+event.y)/taille--event.y/taille-self.myY
					var=var+(selfx-xori)^2+(selfy-yori)^2
					if var>500 then
						if enconst==0 then
							enconst=1
							if self.typebatiment==1 then
								construireinftap(selfx,selfy,1)--event.x,event.y)--selfx,selfy)
							elseif self.typebatiment==2 then
								construirearchtap(selfx,selfy,1)
							end
							backgroundtap()
						else
						nbatiment.x =selfx-- event.x/taille - self.myX
						nbatiment.y =selfy-- event.y/taille - self.myY
						nbatiment.image.x=nbatiment.x+batimentinit[nbatiment.typebatiment][0][1].x
						nbatiment.image.y=nbatiment.y+batimentinit[nbatiment.typebatiment][0][1].y
						if groupebattemp~=nil then
							groupebattemp.supprimer.x=selfx
							groupebattemp.supprimer.y=selfy+30+30*apparence
							groupebattemp.valider.x=selfx
							groupebattemp.valider.y=selfy+10
							groupebattemp.valider.isVisible = false
							groupebattemp.supprimer.isVisible=false
							-- groupebattemp.interdit.x=selfx -- yo
							-- groupebattemp.interdit.y=selfy
							-- groupebattemp.interdit.isVisible=false
						end
						cercleporte.x=selfx
						cercleporte.y=selfy+30
						if cercle~=nil then
							if cercle[1]~=nil then
								cercle[1].x=cercleporte.x
								cercle[1].y=cercleporte.y
							end
						end
						batconfli=testinterdit(nbatiment,0,batconfli)
						groupebattemp.conttext.x=groupebattemp.valider.x
						groupebattemp.conttextOr.x=groupebattemp.conttext.x+25*apparence
						groupebattemp.conttext.y=nbatiment.y-30-10*apparence
						groupebattemp.conttextOr.y=groupebattemp.conttext.y
						groupebattemp.conttextOr.isVisible=false
						groupebattemp.conttext.isVisible=false
						numtap=0	
						end
					end	
				end
				if not previousTouches[event.id] then
					self.numPreviousTouches = self.numPreviousTouches + 1
				end
				previousTouches[event.id] = event
			elseif "ended" == phase or "cancelled" == phase then
				-- if nbatiment1exist~=nil then
				-- 	nbatiment1.isVisible=false
				-- end
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
					if self.typebatiment==1 then
						construireinftap(selfx,selfy,2)--event.x,event.y)--selfx,selfy)
 					elseif self.typebatiment==2 then
 						construirearchtap(selfx,selfy,2)
 					end
					backgroundtap()
				elseif var<80 then
					if self.typebatiment==1 then
						construireinftap(nil,nil,0)
					elseif self.typebatiment==2 then
						construirearchtap(nil,nil,0)
					end
					-- if depla==true then
					 --	print("depla")
						 backgroundtap()
					--end
				end
				--end
				 display.getCurrentStage():setFocus( nil )
            self.isFocus = false
				--if event.x
			end
		end
 		return result
	end

	-- function construireinf:touch(event)
	-- 	construireinfarchtouch(event,self,1)
	-- 	return result
	-- end
	-- function construirearch:touch(event)
	-- 	construireinfarchtouch(event,self,2)
	-- 	return result
	-- end
	-- function construirearch:tap( event )
		
	-- end
	background:addEventListener( "tap", background )
	local function timerlancement1( event )
		construire:addEventListener( "tap", construire )
	end
	timerlancement=timer.performWithDelay( 500, timerlancement1 )
	
	-- construireinf:addEventListener( "tap",construireinf)
	construireinf:addEventListener( "touch",construireinf)
	--construireinf.typebatiment=1
	construirearch:addEventListener( "touch",construireinf)
	--construirearch.typebatiment=2
	-- construirearch:addEventListener( "tap",construirearch)
end
return(t1)