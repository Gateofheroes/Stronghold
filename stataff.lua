local t={}
t.stataff=function ()
end
function stataff1()
	-- affiche
	 -- nb kill
	 -- xp gene gagné
	 -- tour la plus rentable (ombre de la tour)
	 -- si gagné
	  -- record
	  -- rang
	   -- les premiers: si impossible
	   -- ensuite par etoile
	   -- frics a la fin
	--
	local groupstat=display.newGroup()
	local ymax=0
	local ysize=100
	local xtext=100
	local function transitiontext(letext,duree)
		local valeurfinale=tonumber(letext.text)
		local cpt=-1
		local begin
		local letexttext
		local function printTimeSinceStart( event )
			if begin==nil then
				begin=event.time
			end
			letexttext=mathfloor(valeurfinale*(event.time-begin)/duree)
			if letexttext>valeurfinale then
				letext.text=valeurfinale
				Runtime:removeEventListener( "enterFrame", printTimeSinceStart )
			else
				letext.text=letexttext
			end
		end 
		Runtime:addEventListener( "enterFrame", printTimeSinceStart )
		-- local function timerfin(event)
		-- 	cpt=cpt+fps
		-- 	letext.text=mathfloor(valeurfinale*cpt/duree)
		-- 	if cpt<duree then
		-- 		timer.performWithDelay(fps,timerfin)
		-- 	else
		-- 		letext.text=valeurfinale
		-- 	end
		-- end
		-- timer.performWithDelay(fps,timerfin)
	end
	local function displayimgtext(imagename,framenumber,textcon,color,returnimg)
		local imgtemp=display.newImage(imagename,framenumber)
		imgtemp.yScale=ysize/imgtemp.height
		imgtemp.xScale=imgtemp.yScale
		imgtemp.y=ymax
		imgtemp.anchorX=0
		imgtemp:setFillColor(color)
		groupstat:insert(imgtemp)
		if textcon~="" then
			local texttemp=display.newEmbossedText(textcon,xtext,ymax,fonttype,40*fontsize)
			texttemp.anchorX=0
			texttemp:setEmbossColor(colortextemb)
			texttemp:setFillColor(0)
			texttemp.yScale=ysize/texttemp.height
			texttemp.xScale=texttemp.yScale
			groupstat:insert(texttemp)
			if tonumber(texttemp.text)>1 then
				transitiontext(texttemp,2000)
			end
		end
		ymax=ymax+ysize
		if returnimg then
			return imgtemp
		end
	end
	local affbat=false
	local affrank=false
	local affgene=false
	if genexpdeb~=nil and generaltest and isoldat[genenum].numdev~=nil then
		if savegamedev[isoldat[genenum].numdev]~=nil then
			affgene=true
		end
	end
	if true then
		for i=1,nbbatiment do
			if ibatiment[i].niveau~=nil then
				if ibatiment[i].type1~=3 then
					if ibatiment[i].vieenlever~=nil then
						if ibatiment[i].vieenlever>0 then
							affbat=true
							break
						end
					end
				end
			end
		end
		if ennemipasse>0 and tune.text~=nil and niveauch~=nil and modenormal then
			affrank=true
		end
	end
	if true then
		print("imbouton.menupause")
		local imgtemp=displayimgtext(imbouton.menupause,12,"",1,true)
		ymax=ymax+ysize
		local infostat
		function imgtemp:tap(event)
			if infostat==nil then
				infostat=display.newGroup()
				groupstat:insert(infostat)
				infostat.text={}
				local i1=0
				for i=1,4 do
					if (i==2 and affbat) or (i==4 and affrank) or i==1 or (i==3 and affgene) then
						i1=i1+1
						infostat.text[i]=display.newEmbossedText(infostat,texttraduction.statinfo[i],xtext*2,ysize*(1+i1),fonttype,40*fontsize)
						if(i==4) then
							infostat.text[i].x=xtext*3
						end
						infostat.text[i].anchorX=0
						infostat.text[i]:setEmbossColor(colortextemb1)
						infostat.text[i]:setFillColor(0)
						infostat.text[i].yScale=ysize/infostat.text[i].height
						infostat.text[i].xScale=infostat.text[i].yScale
					end
				end
				-- infostat.text1=display.newEmbossedText(infostat,"Kills",xtext*2,ysize*2,fonttype,40
				-- infostat.text2=display.newEmbossedText(infostat,"Kills by the better tower",xtext*2,ysize*3,fonttype,40
				-- infostat.text3=display.newEmbossedText(infostat,"Kills by the hero",xtext*2,ysize*4,fonttype,40
			else
				groupstat:remove(infostat)
				infostat:removeSelf()
				infostat=nil
			end
		end
		imgtemp:addEventListener("tap",imgtemp)
	end
	if true then -- nombre de kill
		print("race"..nombredekill)
		displayimgtext(imagemenu.race,4,nombredekill,1)
	end
	if affbat then -- batiment max
		local maxattaque=0
		local imax=0

		for i=1,nbbatiment do
			if ibatiment[i]~=nil then
				if ibatiment[i].niveau~=nil then
					if ibatiment[i].type1~=3 then
						if ibatiment[i].vieenlever~=nil then
							if ibatiment[i].vieenlever>maxattaque then
								imax=i
							end
						end
					end
				end
			end
		end
		if imax~=0 then
			local imagename
			local numeroframe=1
			local batimentmax
			if ibatiment[imax].niveau>=1 then
				if ibatiment[imax].type1==1 then
					imagename=imgbat.inf
					--batimentmax=display.newImage(imgbat.inf,1)
				else
					imagename=imgbat.arc
					--batimentmax=display.newImage(imgbat.arc,1)
				end
			else
				if ibatiment[imax].type1==1 then
					imagename=imgbat.contact
				else
					imagename=imgbat.distance
				end
				if ibatiment[imax].type2==0 then
					numeroframe=ibatiment[imax].niveau
				elseif ibatiment[imax].type2==1 then
					if ibatiment[imax].type1==1 then
						numeroframe=3+3+ibatiment[imax].niveau
					else
						numeroframe=3+ibatiment[imax].niveau
					end
				else
					if ibatiment[imax].type1==1 then
						numeroframe=3+ibatiment[imax].niveau
					else
						numeroframe=3+3+ibatiment[imax].niveau
					end
				end
				numeroframe=numeroframe-1
				--batimentmax=display.newImage(imagename,numeroframe)
			end
			print("bat"..mathfloor(ibatiment[imax].vieenlever/nombredeviett*nombredekill))
			displayimgtext(imagename,numeroframe,mathfloor(ibatiment[imax].vieenlever/nombredeviett*nombredekill),0)
			-- batimentmax:setFillColor(0)
			-- batimentmax.yScale=ysize/batimentmax.height
			-- batimentmax.xScale=batimentmax.yScale
			-- batimentmax.y=ymax
			-- batimentmax.anchorX=0
			-- groupstat:insert(batimentmax)
			-- local batimentatt=display.newEmbossedText(mathfloor(ibatiment[imax].vieenlever/nombredeviett*nombredekill),xtext,ymax,fonttype,40)
			-- batimentatt.anchorX=0
			-- batimentatt:setEmbossColor(colortextemb)
			-- batimentatt:setFillColor(0)
			-- batimentatt.yScale=ysize/batimentatt.height
			-- batimentatt.xScale=batimentatt.yScale
			-- groupstat:insert(batimentatt)
			-- ymax=ymax+ysize
		end
	end
	if affgene then -- general nb kill
		local typeso=isoldat[genenum].typesoldat
		local xpgagne=savegamedev[isoldat[genenum].numdev]-genexpdeb
		local tue=0
		if nombredeviett==0 or nombredekill==0 or nombredeviett==0 then
			tue=0
		else
			tue=mathfloor(xpgagne/nombredeviett*nombredekill)
		end
		displayimgtext(image[typeso].depgauche,1,tue,0)
	end
	if affrank then
		local x1=tune.text
		local x2=ennemipasse
		local x3=niveauch
		local resul=mathfloor(-6690.75982*x3+840.253213*x3^2+-32.2872838*x3^3+-1307.09264*x2+792.32653*x2*x3+-124.595253*x2*x3^2+5.13612572*x2*x3^3+-315.784947*x2^2+76.3664936*x2^2*x3+-3.16668512*x2^2*x3^2+-12.7160446*x2^3+0.034701348*x2^3*x3+1.43627913*x1+-0.373679001*x1*x3+0.0165848923*x1*x3^2+7.43036663e-05*x1*x3^3+-0.388583436*x1*x2+0.0885490833*x1*x2*x3+-0.00237472312*x1*x2*x3^2+-0.0137276102*x1*x2^2+-0.00289841991*x1*x2^2*x3+0.00187359115*x1*x2^3+4.0576581e-05*x1^2+1.01070979e-05*x1^2*x3+-6.44137555e-07*x1^2*x3^2+-9.04539825e-06*x1^2*x2+-7.5110007e-07*x1^2*x2*x3+1.32762434e-06*x1^2*x2^2+-1.89678795e-09*x1^3+-1.62437006e-10*x1^3*x3+3.14966314e-10*x1^3*x2+19008.027*1+0.365440489*x2^4)
		if resul<1 then
			resul=1
		end
		if (not goh and niveauch==15) or (goh and niveauch==16) then
			while(resul>102) do
				resul=resul*0.7
			end
			resul=mathfloor(resul)
		end
		print("rank"..resul)
		local imgtemp=displayimgtext(imbouton.menupause,10,resul,0,true)
		imgtemp.anchorX=0.5
		imgtemp.anchorY=0
		imgtemp:rotate(-90)
	end
	groupstat.alpha=0.5
	return groupstat
end
return (t)