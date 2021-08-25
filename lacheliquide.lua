local t={}--fichier gerant l'attaque des batiments qui lachent du liquide
if not functionload then
local function vieliquide(numero,xbase,ybase,attaque,porte)--enleve les vies des adversaires dans le cercle
	local att=attaque
	local cpt5=0
	local attcptvar=1
	for i=1,nbsoldat do
		if isoldat[i].vivant==true and isoldat[i].orientation==1 and isoldat[i].pole==ibatiment[numero].pole then
			if porte>((isoldat[i].x1-xbase)*(isoldat[i].x1-xbase)+(1.25*(isoldat[i].y1-ybase))*(1.25*(isoldat[i].y1-ybase))) then
				-- debut retourdinformation
				ibatiment[numero].vieenlever=ibatiment[numero].vieenlever+att
				-- fin retourdinformation
				pertevie(i,att) --,2)
				cpt5=cpt5+1
				if cpt5>=10 then
					attcptvar=attcptvar*0.9
					if attcptvar<0.2 then
						attcptvar=0.2
					end
					att=mathfloor(attaque*attcptvar)
					cpt5=1
					if att<1 then
						att=1
						cpt5=-1000
					end
				end
			end
		end
	end
end
local function rechercheuniquement(numero,xbat,ybat)
	local ennemi=false
	for i=1,nbsoldat do
		if isoldat[i].orientation==1 and isoldat[i].vivant==true and isoldat[i].pole==ibatiment[numero].pole then
			if ibatiment[numero].porte>((isoldat[i].x1-xbat)^2+(1.25*(isoldat[i].y1-ybat))^2) then
				ennemi=true
				break
			end
		end
	end
	return ennemi
end
function installationpique(numero)
	print("installationpique")
	if ibatiment[numero].pique~=nil then
		for i=1,#ibatiment[numero].pique do
			group[ibatiment[numero].pique[i].groupe]:remove(ibatiment[numero].pique[i])
			ibatiment[numero].pique[i]:removeSelf()
			ibatiment[numero].pique[i]=nil
		end
		ibatiment[numero].pique=nil
	end
	print("\n\n\n\n")
	local pointcercle={}
	local pointcerclebat={}
	local xbat=ibatiment[numero].x1+ibatiment[numero].xbase
	local ybat=ibatiment[numero].y1+ibatiment[numero].ybase

	local tailledudamier=5 --3
	if ibatiment[numero].niveau==2 then
		tailledudamier=4
	elseif ibatiment[numero].niveau==3 then
		tailledudamier=4
	end
	local distancex=mathsqrt(ibatiment[numero].porte)/tailledudamier
	local distancey=mathsqrt(ibatiment[numero].porte*0.8)/tailledudamier
	tailledudamier=tailledudamier+1 --prise en compte du  on alignement
	for i=1,cheminnb+1 do
		local coef=1
		if chemin[i].mechant~=nil and not modepanique then
			if chemin[i].mechant>1 then
				coef=chemin[i].mechant*0.9
			end
		end
		if ibatiment[numero].porte+1500*coef*cheminlargeur>((chemin[i].x-xbat)^2+(1.25*(chemin[i].y-ybat))^2) then
			pointcercle[#pointcercle+1]=i
		end
		-- vectoriser chemin entre les points et mettre des pics dessus, avec la bonne largeur(chemin)
	end
	for i=1,nbbatiment do
		if ibatiment[i]~=nil then
			if ibatiment[i].type1==3 and ibatiment[i].x1~=nil and ibatiment[i].y1~=nil then
				if 10000>((xbat-ibatiment[i].x1)*(xbat-ibatiment[i].x1)+(1.25*(ybat-ibatiment[i].y1))*(1.25*(ybat-ibatiment[i].y1))) then
					pointcerclebat[#pointcerclebat+1]=i
				end
			end
		end
	end
	print("fini de trouver les points "..#pointcercle)
	ibatiment[numero].pique={}
	local posx,posy
	local carrebon=false
	local k
	local sequenceDatapique
	local frameinsert
	if not goh then
		if ibatiment[numero].niveau<=3 then
			frameinsert={1,2,3}
			sequenceDatapique=
			{
			    name="walking",
			    frames=frameinsert,
			    time=2000,
			    loopCount=1,
			}
			if ibatiment[numero].niveau==3 then
				sequenceDatapique.time=1500
			end
		else
			frameinsert={1,2,3,3,4,4,4,4,5,5,5,5,5,5}
			sequenceDatapique=
			{
			    name="walking",
			    frames=frameinsert,
			    time=3000,
			    loopCount=1,
			}
		end
	else
		if ibatiment[numero].niveau<=3 then
			frameinsert={1,2,3,4,5,6,7,8,9,10,11,12}
			sequenceDatapique=
			{
			    name="walking",
			    frames=frameinsert,
			    time=2000,
			    loopCount=1,
			}
			if ibatiment[numero].niveau==3 then
				sequenceDatapique.time=1500
			end
		else
			frameinsert={1,2,3,4,5,6,7,8,9,10,11}
			sequenceDatapique=
			{
			    name="walking",
			    frames=frameinsert,
			    time=3000,
			    loopCount=1,
			}
		end
	end
	local loopCount=mathfloor(ibatiment[numero].dureeliq/sequenceDatapique.time)
	sequenceDatapique.time=ibatiment[numero].dureeliq
	for i=1,loopCount do
		for j=1,#frameinsert do
			table.insert(sequenceDatapique.frames,frameinsert[j])
		end
	end
	table.insert(sequenceDatapique.frames,1)
	ibatiment[numero].piquelooCount=loopCount+1
	print("loopCount "..sequenceDatapique.loopCount)
	local offsetpair=1 -- evite que les trucs soit aligné
	local coefdepair=0.5
	if ibatiment[numero].niveau==3 then
		coefdepair=0.25
	end
	for i=-tailledudamier,tailledudamier do
		posx=xbat+i*distancex
		if offsetpair==1 then
			offsetpair=0
		else
			offsetpair=1
		end
		--print("vaar x")
		for j=-tailledudamier,tailledudamier do
			posy=ybat+j*distancey+offsetpair*distancey*coefdepair
			carrebon=false
			k=1
			--print("var y")
			if ibatiment[numero].porte>((posx-xbat)^2+(1.25*(posy-ybat))^2) then
				if modezombie or modepanique then
					carrebon=true 
					else
					while k<=#pointcercle do
						--print("var k")
						local coef=1
						if chemin[k].mechant~=nil and not modepanique then
							if chemin[k].mechant>1 then
								coef=chemin[k].mechant*0.9
							end
						end
						if distancex+0.5*mathsqrt(1500*0.5*coef*cheminlargeur)>=mathabs(chemin[pointcercle[k]].x-posx) and distancey+0.5*mathsqrt(1500*coef*cheminlargeur)>=mathabs(1.25*(chemin[pointcercle[k]].y-posy)) then
						--if tailledudamier>(mathsqrt(((chemin[pointcercle[k]].x-posx)^2+(1.25*(chemin[pointcercle[k]].y-posy)^2)))) then
							carrebon=true
							k=#pointcercle
							print("point bon "..j.." "..i)
						end
						k=k+1
					end
				end
				if not carrebon then
					k=1
					while k<=#pointcerclebat do
						if distancex+0.5*mathsqrt(10000)>=mathabs(ibatiment[pointcerclebat[k]].x1-posx) and distancey+0.5*mathsqrt(10000)>=mathabs(1.25*(ibatiment[pointcerclebat[k]].y1-posy)) then
							carrebon=true
							k=#pointcerclebat
							print("point bon "..j.." "..i)
						end
						k=k+1
					end
				end
				if carrebon then
					ibatiment[numero].pique[#ibatiment[numero].pique+1]=display.newSprite(imgbat["pique"..(ibatiment[numero].niveau-1)],sequenceDatapique)
					ibatiment[numero].pique[#ibatiment[numero].pique]:setSequence("liq")
					ibatiment[numero].pique[#ibatiment[numero].pique]:setFrame(1)
					ibatiment[numero].pique[#ibatiment[numero].pique].x=posx
					ibatiment[numero].pique[#ibatiment[numero].pique].y=posy
					ibatiment[numero].pique[#ibatiment[numero].pique].xScale=distancex/ibatiment[numero].pique[#ibatiment[numero].pique].width
					ibatiment[numero].pique[#ibatiment[numero].pique].yScale=ibatiment[numero].pique[#ibatiment[numero].pique].xScale
					ibatiment[numero].pique[#ibatiment[numero].pique].groupe=mathfloor(ibatiment[numero].pique[#ibatiment[numero].pique].y+1024-ibatiment[numero].pique[#ibatiment[numero].pique].yScale*ibatiment[numero].pique[#ibatiment[numero].pique].height)
					group[ibatiment[numero].pique[#ibatiment[numero].pique].groupe]:insert(ibatiment[numero].pique[#ibatiment[numero].pique])
				end
			end
		end
	end
end
local function attaquepique(numero,xbase,ybase)
	-- if ibatiment[numero].niveau<=3 then
	-- 	audio.play(son.combatpique)
	-- end
	--audio.play(son.combatacid)
	--print("demande de tirer")
	local xpro=ibatiment[numero].x1+ibatiment[numero].xpro
	local ypro=ibatiment[numero].y1+ibatiment[numero].ypro
	--print("y batnu"..ibatiment[numero].y)
	--local groupliq=mathfloor(ibatiment[numero].y)+1024+13
	--print("groupliq"..groupliq)
	local sequenceData1
	if not goh then
		if ibatiment[numero].niveau==4 then
			sequenceData1 ={
			{
			    name="liq",
			    frames= {1,1,2,2,3,3}, -- frame indexes of animation, in image sheet
			    time = 3000,           -- Optional. In ms.  If not supplied, then sprite is frame-based.
			    loopCount = 1        -- Optional. Default is 0.
			} ,
			{
			 name="liq1",
		    frames= {2,3}, -- frame indexes of animation, in image sheet
		    time = 500,           -- Optional. In ms.  If not supplied, then sprite is frame-based.
		    loopCount = 100000 

			},
			{
			    name="liq2",
			    frames= {2,4,5,6,7}, -- frame indexes of animation, in image sheet
			    time = 1000,           -- Optional. In ms.  If not supplied, then sprite is frame-based.
			    loopCount = 1        -- Optional. Default is 0.
			}}
		else
			sequenceData1 ={
			{
			    name="liq",
			    frames= {1,1,2,2,3,3,4,4}, -- frame indexes of animation, in image sheet
			    time = 3000,           -- Optional. In ms.  If not supplied, then sprite is frame-based.
			    loopCount = 1        -- Optional. Default is 0.
			} ,
			{
			 name="liq1",
		    frames= {3,2,3,4}, -- frame indexes of animation, in image sheet
		    time = 500,           -- Optional. In ms.  If not supplied, then sprite is frame-based.
		    loopCount = 100000 

			},
			{
			    name="liq2",
			    frames= {4,3,2,1}, -- frame indexes of animation, in image sheet
			    time = 1000,           -- Optional. In ms.  If not supplied, then sprite is frame-based.
			    loopCount = 1        -- Optional. Default is 0.
			}}
		end
	else
		if ibatiment[numero].niveau==4 then
			sequenceData1 ={
			{
			    name="liq",
			    frames= {1,2,3,4,2,3,4,2,3,4,2,3,4}, -- frame indexes of animation, in image sheet
			    time = 3000,           -- Optional. In ms.  If not supplied, then sprite is frame-based.
			    loopCount = 1        -- Optional. Default is 0.
			} ,
			{
			 name="liq1",
		    frames= {2,3}, -- frame indexes of animation, in image sheet
		    time = 500,           -- Optional. In ms.  If not supplied, then sprite is frame-based.
		    loopCount = 100000 

			},
			{
			    name="liq2",
			    frames= {2,4,5,6,7}, -- frame indexes of animation, in image sheet
			    time = 1000,           -- Optional. In ms.  If not supplied, then sprite is frame-based.
			    loopCount = 1        -- Optional. Default is 0.
			}}
		else
			sequenceData1 ={
			{
			    name="liq",
			    frames= {1,2,3,4,2,3,4,2,3,4,2,3,4,2,3,4,2,3,4,2,3,4,2,3,4,2,3,4,2,3,4,2,3,4,2,3,4}, -- frame indexes of animation, in image sheet
			    time = 3000,           -- Optional. In ms.  If not supplied, then sprite is frame-based.
			    loopCount = 1        -- Optional. Default is 0.
			} ,
			{
			 name="liq1",
		    frames= {3,2,3,4}, -- frame indexes of animation, in image sheet
		    time = 500,           -- Optional. In ms.  If not supplied, then sprite is frame-based.
		    loopCount = 100000 

			},
			{
			    name="liq2",
			    frames= {4,3,2,1}, -- frame indexes of animation, in image sheet
			    time = 1000,           -- Optional. In ms.  If not supplied, then sprite is frame-based.
			    loopCount = 1        -- Optional. Default is 0.
			}}
		end
	end
	local imagesheet
	if not goh then
		if ibatiment[numero].niveau==2 then
			imagesheet=imgbat.liquide1
		elseif ibatiment[numero].niveau==3 then
			imagesheet=imgbat.liquide2
		else
			imagesheet=imgbat.liquide3
		end
	else
		imagesheet=imgbat.tiranim[2][ibatiment[numero].niveau].sheet
	end
	-- complement de l'anim d'attaque pour prise en compte de la duree d'attaque
	local nbimageinit=#sequenceData1[1].frames
	if true then
		local timeparimg=#sequenceData1[1].frames/sequenceData1[1].time
		local dureeajoute=mathfloor((ibatiment[numero].dureeliq-#sequenceData1[3].frames/timeparimg)*timeparimg/#sequenceData1[2].frames)
		sequenceData1[1].time=sequenceData1[1].time+ibatiment[numero].dureeliq --+sequenceData1[3].time
		for i=1,dureeajoute do
			for j=1,#sequenceData1[2].frames do
				table.insert(sequenceData1[1].frames,sequenceData1[2].frames[j])
			end
		end
		for i=1,#sequenceData1[3].frames do
			table.insert(sequenceData1[1].frames,sequenceData1[3].frames[i])
		end
		print("timeparimg "..timeparimg)
	end
	local principale=display.newSprite(imagesheet,sequenceData1)--impro.liquide.bat1, sequenceData1 )
	if goh then
		ibatiment[numero].bras.isVisible=false
	end
	if not goh then
		principale.group=mathfloor(ibatiment[numero].y1)+1024+13
	else
		principale.group=mathfloor(ibatiment[numero].group-ibatiment[numero].ypro) -- la
	end
	group[principale.group]:insert(principale)
	--animliqobj.principale.frameold=0
	principale.x=ibatiment[numero].x1+ibatiment[numero].xpro
	principale.y=ibatiment[numero].y1+ibatiment[numero].ypro

	principale.xScale=ibatiment[numero].xScale
	if goh then
		principale.xScale=imgbat.tiranim[2][ibatiment[numero].niveau].property.scale
	end
	principale.yScale=principale.xScale
	principale:setSequence( "liq" )
	spritegestion(principale)
	local solatt=0
	local frameatt=false
	local compteurframe=1
	local removelistener=false
	if issimulator then
		local attnbimg=(ibatiment[numero].pique[1].numFrames-1)/ibatiment[numero].piquelooCount
		print("attnbimg "..attnbimg.." numframe "..ibatiment[numero].pique[1].numFrames.." ibatiment[numero].piquelooCount "..ibatiment[numero].piquelooCount)
	end
	local function liquidelist(event)
		if removepartiel1==true then
			removelistener=true
		elseif jeupause.etat~=1 then
			if principale~=nil and solatt==0 then
				if ibatiment[numero].endev~=0 then
					principale.timeScale=10
					removelistener=true
				else
					if principale.frame>nbimageinit then
						solatt=1
					end
				end
			elseif solatt==0 then
				removelistener=true
				--Runtime:removeEventListener( "enterFrame",liquidelist)
			else
				if solatt==1 then
					solatt=2
					if ibatiment[numero].endev~=0 then
						removelistener=true
					else
						print("play pique\n\n\n")
						-- local i=1
						-- while i<=#ibatiment[numero].pique do
						-- 	spritegestion(ibatiment[numero].pique[i],2)
						-- 	i=i+1
						-- end
						for i=1,#ibatiment[numero].pique,2 do
							ibatiment[numero].pique[i]:setSequence("walking")
							--ibatiment[numero].pique[i]:play()
							spritegestion(ibatiment[numero].pique[i],2)
						end
						if ibatiment[numero].niveau<=3 then
							audio.play(son.combatpique)
						else
							audio.play(son.combatacid)
						end
						local function piquedecale(event)
							--local i=2
							--while i<=#ibatiment[numero].pique do
							if not removepartiel1 then
								if ibatiment[numero].endev==0 then 
									for i=2,#ibatiment[numero].pique,2 do
										ibatiment[numero].pique[i]:setSequence("walking")
										spritegestion(ibatiment[numero].pique[i],2)
										--i=i+2
									end
								end
							end
						end
						if ibatiment[numero].niveau<=3 then
							timer.performWithDelay(200,piquedecale)
						else
							timer.performWithDelay(400,piquedecale)
						end
					end
				elseif solatt==2 then
					if ibatiment[numero].endev~=0 then
						for i=1,#ibatiment[numero].pique do
							ibatiment[numero].pique[i].timeScale=10
						end
						removelistener=true
					else
						if #ibatiment[numero].pique>0 then
							if ibatiment[numero].pique[1].fini then
								ibatiment[numero].attaquencours=0
								removelistener=true
								--Runtime:removeEventListener( "enterFrame",liquidelist)
							else
								--print("ibatiment[numero].pique[1].frame "..ibatiment[numero].pique[1].frame)
								if ibatiment[numero].pique[1].frame<compteurframe+1 then
									frameatt=false
								elseif ibatiment[numero].pique[1].frame>=compteurframe+2 and not frameatt then
									frameatt=true
									compteurframe=ibatiment[numero].pique[1].frame
									print("envele vie\n\n\n\n\n")
									vieliquide(numero,xbase,ybase,ibatiment[numero].attaque/ibatiment[numero].piquelooCount,ibatiment[numero].porte)
								end
							end
						end
					end
				end
			end
		end
		if removelistener then
			if goh then
				ibatiment[numero].bras.isVisible=true
			end
			Runtime:removeEventListener( "enterFrame",liquidelist)
		end
	end
	Runtime:addEventListener("enterFrame",liquidelist)
end
local function attaqueliquide(numero,xbase,ybase)--gestions de l'attaque du bat
	audio.play(son.combatacid)
	--print("demande de tirer")
	local xpro=ibatiment[numero].x1+ibatiment[numero].xpro
	local ypro=ibatiment[numero].y1+ibatiment[numero].ypro
	--print("y batnu"..ibatiment[numero].y)
	local groupliq=mathfloor(ibatiment[numero].y1)+1024+13
	--print("groupliq"..groupliq)
	local animliqobj={}
	local sequenceData1 ={
	{
	    name="liq",
	    frames= {1,2,3,4,5,6},
	    time = 3000,
	    loopCount = 1
	} ,
	{
	 name="liq1",
    frames= {6,7},
    time = 500,
    loopCount = 100000 

	},
	{
	    name="liq2",
	    frames= {6,5,4,3,2,1},
	    time = 1000,
	    loopCount = 1
	}}
	local sequenceData2 =
	{
	    name="liq",
	    frames= {1,2,3},
	    time = 1000,
	   	loopCount =1
	} 
	local imagesheet
	local imagesheet1 --=imgbat.liquidecerclean
	if ibatiment[numero].niveau==2 then
		imagesheet=imgbat.liquide1
		imagesheet1=imgbat.liquidecerclean
		--imagesheet1=imgbat.liquidecercle1
		--imagesheet1:setFillColor( 0,0,255 )
	elseif ibatiment[numero].niveau==3 then
		imagesheet=imgbat.liquide2
		imagesheet1=imgbat.liquidecerclean1
		--imagesheet1:setFillColor( 255,0,0 )
		--imagesheet1=imgbat.liquidecercle2
	else
		imagesheet=imgbat.liquide3
		imagesheet1=imgbat.liquidecerclean
		--imagesheet1:setFillColor( 0,255,0 )
		--imagesheet1=imgbat.liquidecercle3
	end

	animliqobj.principale=display.newSprite(imagesheet,sequenceData1)--impro.liquide.bat1, sequenceData1 )
		group[groupliq]:insert(animliqobj.principale)
	animliqobj.principale.frameold=0

	animliqobj.principale.x=ibatiment[numero].x1
	animliqobj.principale.y=ibatiment[numero].y1

	animliqobj.principale.xScale=ibatiment[numero].xScale
	animliqobj.principale.yScale=ibatiment[numero].yScale
	animliqobj.principale.actif=true
	if ibatiment[numero].niveau==2 then
		animliqobj.principale.y=ibatiment[numero].y1+2
		animliqobj.principale.yScale=animliqobj.principale.yScale*0.8
		animliqobj.principale.xScale=animliqobj.principale.xScale*0.8
	end
	animliqobj.principale.timeScale=1*vitessejeu
	animliqobj.principale:setSequence( "liq" )
	animliqobj.principale:play()
	animliqobj.principale.pause1=0
	animliqobj.sol=display.newSprite(imagesheet1,sequenceData2)
	animliqobj.sol:setSequence( "liq" )
	animliqobj.sol.doitplay=false
	--animliqobj.sol:play()
	--animliqobj.sol=display.newImage(imagesheet1,1)
	if ibatiment[numero].niveau==2 then
		animliqobj.sol:setFillColor(0,0,1)
	elseif ibatiment[numero].niveau==3 then
		-- animliqobj.sol:setFillColor(1,0.1,0)
	else
		animliqobj.sol:setFillColor(0,1,0.1)
	end
	animliqobj.sol.x=xbase
	animliqobj.sol.y=ybase
	animliqobj.sol.taillemax=30
	animliqobj.sol.xScale=0.001--2*mathsqrt(ibatiment[numero].porte*0.70)/(200*animliqobj.sol.taillemax)--mathsqrt(ibatiment[numero].porte)/(200*animliqobj.sol.taillemax)--0.1--calibre le scale par rapport à la porte(pour cela il faut d'abord l'image finale de la flaque de liquide au sol)
	animliqobj.sol.xplus=2*mathsqrt(ibatiment[numero].porte*0.70)/(380*animliqobj.sol.taillemax)
	animliqobj.sol.yScale=animliqobj.sol.xScale
	animliqobj.sol.isVisible=false
	animliqobj.sol.alpha=0.8
	animliqobj.sol.cpt=-1
	animliqobj.sol.cptduree=0 --duree de l'attaque en ms
	animliqobj.sol.cptduree1=0

	animliqobj.sol.cptatt=0
	group[2]:insert(animliqobj.sol)
	local function liquidelist(event)
		if removepartiel1==true then
			group[groupliq]:remove(animliqobj.principale)
			animliqobj.principale:removeSelf()
			group[2]:remove(animliqobj.sol)
			animliqobj.sol:removeSelf()
			Runtime:removeEventListener( "enterFrame",liquidelist)
		else
			if jeupause.etat==1 then--technique numero 3 de mise en pause(plus de probleme avec les processeurs mtk et probleme de deferencement)
				if animliqobj.principale.pause1==0 then
					animliqobj.principale.pause1=1
					if animliqobj.principale.actif==true then
						animliqobj.principale:pause()
						if animliqobj.sol.doitplay then
							animliqobj.sol:pause()
						end
					end
				end
			else
				if animliqobj.principale.pause1==1 then
					animliqobj.principale.pause1=0
					if animliqobj.principale.actif==true then
						animliqobj.principale:play()
						if animliqobj.sol.doitplay then
							animliqobj.sol:play()
						end
					end
				end
				if ibatiment[numero].endev==0 then
					animliqobj.principale.timeScale=1*vitessejeu
					if animliqobj.principale.frameold==0 then
						if animliqobj.principale.frame>=animliqobj.principale.numFrames then --5  then
							 animliqobj.principale.frameold=1
							--print("frame==7")
							--animliqobj.principale:pause()
							
							animliqobj.principale:setSequence( "liq1" )
							animliqobj.principale.timeScale=vitessejeu
							animliqobj.principale:play()
							animliqobj.sol.isVisible=true
							animliqobj.sol.cpt=0
							vieliquide(numero,xbase,ybase,ibatiment[numero].attaque,ibatiment[numero].porte*2/3)
						end
					elseif animliqobj.principale.frameold==1 then
						if animliqobj.principale.frame>=14 then
							--print("frameold==2")
							animliqobj.principale.frameold=2
							
							--print("supression anim liquide")
							-- group[groupliq]:remove(animliqobj.principale)
							-- animliqobj.principale:removeSelf()
						end
					end
					if animliqobj.sol.cpt>=0 then
					
						animliqobj.sol.cpt=animliqobj.sol.cpt+1
						animliqobj.sol.cptatt=animliqobj.sol.cptatt+1
						if animliqobj.sol.cptatt>=10 then
							local tailleatt
							if animliqobj.sol.cpt>=animliqobj.sol.taillemax then
								tailleatt=1
							else
								tailleatt=animliqobj.sol.cpt/animliqobj.sol.taillemax
							end
							vieliquide(numero,xbase,ybase,ibatiment[numero].attaque/3,ibatiment[numero].porte*tailleatt)
							animliqobj.sol.cptatt=0
						end
						if animliqobj.sol.cpt>=animliqobj.sol.taillemax then
							-- local ennemi=rechercheuniquement(numero,xbase,ybase)
							-- if ennemi==true then
								
							-- else
							if animliqobj.sol.frame==3 then
								animliqobj.sol.doitplay=false
							end
							local timeraact=system.getTimer()
							if animliqobj.sol.cptduree1==0 then
								animliqobj.sol.cptduree1=timeraact
							else
								animliqobj.sol.cptduree=animliqobj.sol.cptduree+(timeraact-animliqobj.sol.cptduree1)*vitessejeu
								animliqobj.sol.cptduree1=timeraact
							end
							if animliqobj.sol.cptduree>ibatiment[numero].dureeliq then
								animliqobj.sol.cpt=-2
								animliqobj.principale:setSequence( "liq2" )
								animliqobj.principale.timeScale=vitessejeu
								animliqobj.principale:play()								
							end
						else
							if  not animliqobj.sol.doitplay then
								animliqobj.sol.doitplay=true
								animliqobj.sol:play()	
							end
							animliqobj.sol.xScale=animliqobj.sol.xScale+animliqobj.sol.xplus*animliqobj.sol.taillemax--2*mathsqrt(ibatiment[numero].porte*0.70)/200 -- animliqobj.sol.xScale+1/animliqobj.sol.taillemax
							animliqobj.sol.yScale=animliqobj.sol.xScale
							animliqobj.sol.cpt=animliqobj.sol.cpt+animliqobj.sol.taillemax
						end
					elseif animliqobj.sol.cpt<=-2 then
						animliqobj.sol.alpha=animliqobj.sol.alpha-0.02
						if animliqobj.principale.frame>=animliqobj.principale.numFrames then
							animliqobj.principale.actif=false
							ibatiment[numero].attaquencours=0
							group[groupliq]:remove(animliqobj.principale)
							animliqobj.principale:removeSelf()
							group[2]:remove(animliqobj.sol)
							animliqobj.sol:removeSelf()
							Runtime:removeEventListener( "enterFrame",liquidelist)
							ibatiment[numero].bras.isVisible=true
						end
					end
				else
					group[groupliq]:remove(animliqobj.principale)
					animliqobj.principale:removeSelf()
					group[2]:remove(animliqobj.sol)
					animliqobj.sol:removeSelf()
					Runtime:removeEventListener( "enterFrame",liquidelist)
					ibatiment[numero].bras.isVisible=true
				end
			end
		end
	end
	Runtime:addEventListener("enterFrame",liquidelist)

end
function rechercheliquide(numero)--fonction recherchant des adversaire
	if ibatiment[numero].attaquencours==0 then
		local ennemi=false
		local xbat=ibatiment[numero].x1+ibatiment[numero].xbase
		local ybat=ibatiment[numero].y1+ibatiment[numero].ybase
		--print("ybat"..ybat)
		ennemi=rechercheuniquement(numero,xbat,ybat)
		
		if ennemi==true then
			ibatiment[numero].attaquencours=1
			attaquepique(numero,xbat,ybat)
			--attaqueliquide(numero,xbat,ybat)
		end
	end
end
end
t.lacheliquide= function()
local a=1
end
return t