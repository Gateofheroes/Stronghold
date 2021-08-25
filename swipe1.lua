local function modifMainText(mainText,imbandeau,boutonconf)
	mainText.height=(boutonconf.y-boutonconf.height*boutonconf.yScale*0.5-imbandeau.y+imbandeau.yScale*imbandeau.height*0.5)
	print("mainText.height "..mainText.height)
end
local infsurdevf = require("infosurdev")
local function recoitinfogene(j,i,k,infswipeqmenu)
	local calcultest1=(j-1)*6*13+(i-1)*13+k

	local j1=j
	local i1=i
	local k1=k
	if infswipeqmenu==1 then
		if i>2 then
			j1=i-1
			i1=1
		end
		calcultest1=(j1-1)*6*13+(i1-1)*13+k1
	end
	i=i1
	j=j1
	k=k1
	calcultest1=(j-1)*6*13+(i-1)*13+k

	local valide=false
	local levelgene
	local xpmanquant
	local xpactuel
	local xpppourlevelup
	local numgene
	local vie
	local vieplus
	local attaque
	local attaqueplus
	local derniergene --dernier general unlock (true)
	local prix
	print("savegamedev[calcultest1]="..savegamedev[calcultest1].." j="..j.." i="..i)
	if savegamedev[calcultest1]==1 then
		if j==3 and i==1 then
			local raceswipe=0
			local niveaugene=0
			if k<=3 then
				valide=true
				raceswipe=1
				niveaugene=k
			elseif k>=5 and k<=8 then
				valide=true
				raceswipe=0
				niveaugene=k-4
				print("ici 123")
			elseif k>=9 and k<=11 then
				valide=true
				raceswipe=2
				niveaugene=k-8
				print("ici ou pas")
			end
			print("la race est "..raceswipe)
			print("ici k="..k)
			if valide then
				print("here2")
				numgene=320+raceswipe*10+niveaugene
				print("numgene "..numgene.." raceswipe "..raceswipe.." niveaugene "..niveaugene)
				local numimage=retournenumgene(raceswipe,niveaugene)
				print("numimage "..numimage)
				attaque,vie,levelgene,vieplus,attaqueplus,xpmanquant,xpactuel,xpppourlevelup=attviegene(numgene,numimage,true)
				print("xpmanquant "..xpmanquant)
				-- print("le general à "..savegamedev[numgene].." d'experience")
				-- local testcpt=1
				-- levelgene=0
				-- print("savegameall.generalxp "..#savegameall.generalxp)
				-- while testcpt<#savegameall.generalxp do
				-- 	print("testcpt "..testcpt)
				-- 	print("savegameall.generalxp[testcpt]"..savegameall.generalxp[testcpt])
				-- 	if savegamedev[numgene]<=savegameall.generalxp[testcpt] then
				-- 		levelgene=testcpt
				-- 		testcpt=#savegameall.generalxp+1
				-- 	end
				-- 	testcpt=testcpt+1
				-- end
				-- print("levelgene "..levelgene)
				-- xpmanquant=mathfloor(savegameall.generalxp[levelgene]*0.2)-mathfloor(savegamedev[numgene]*0.2)
				-- local xplevelavant=0
				-- if levelgene>1 then
				-- 	xplevelavant=mathfloor(savegameall.generalxp[levelgene-1]*0.2)

				-- end
				-- xpactuel=mathfloor(savegamedev[numgene]*0.2)-xplevelavant
				-- xpppourlevelup=mathfloor(savegameall.generalxp[levelgene]*0.2)-xplevelavant -- -mathfloor(savegamedev[numgene-1]*0.01)
				local legeneral=savegameall.generalch[raceswipe+1]
				if legeneral==nil then
					legeneral=savegameall.general[raceswipe+1]
				end
				print("legeneral "..legeneral.." niveaugene "..niveaugene)
				if niveaugene==4 then
					for i=1,3 do
						local legeneral1=savegameall.generalch[i]
						if legeneral1==nil then
							legeneral1=savegameall.general[i]
						end
						if legeneral1~=4 then
							niveaugene=1
						end
					end
				end
				if legeneral==niveaugene then -- savegameall.general[raceswipe+1]
					derniergene=true
				else
					derniergene=false
					xpmanquant=nil
					prix="Select"
					--levelgene=0
				end
				
				if derniergene then
					-- prix=0
					-- local prixrestant=xpmanquant
					-- local coef=1
					-- local coefvar=0.75
					-- while prixrestant>0 do
					-- 	if prixrestant>50 then
					-- 		prix=prix+50*coef
					-- 		prixrestant=prixrestant-50
					-- 		coef=coefvar*coef
					-- 		coefvar=coefvar+(1-coefvar)
					-- 		if coefvar>0.999 then
					-- 			coefvar=0.995
					-- 		end
					-- 		print("coef "..coef.." coefvar "..coefvar.." prix "..prix)
					-- 	else
					-- 		prix=prix+prixrestant*coef
					-- 		prixrestant=0
					-- 	end
					-- 	-- if prix>700 then
					-- 	-- 	prix=700
					-- 	-- 	prixrestant=0
					-- 	-- end
					-- end
					-- prix=mathfloor(prix)
					prix=mathfloor(5*levelgene*(xpmanquant/xpppourlevelup))*5
				end
				print("prix="..prix)
			end
		end
	end
	return valide,prix,derniergene,xpmanquant,levelgene,xpactuel,xpppourlevelup,numgene,vie,vieplus,attaque,attaqueplus
end
local function miseajourgeneaff(j,i,k,infswipe,titreText,mainText,boutontab,demandelevelup,boutonconf,infswipeqmenu)
	print("miseajourgeneaff")
	local valide
	local xpmanquant
	local levelgene
	local xpactuel
	local xpppourlevelup
	local numgene
	local vie
	local vieplus
	local attaque
	local attaqueplus
	local derniergene
	local prix

	local j1=j
	local i1=i
	local k1=k
	if infswipeqmenu==1 then
		if i>2 then
			j1=i-1
			i1=1
		end
		--calcultest1=(j1-1)*6*13+(i1-1)*13+k1
	end
	-- i=i1
	-- j=j1
	-- k=k1

	valide,prix,derniergene,xpmanquant,levelgene,xpactuel,xpppourlevelup,numgene,vie,vieplus,attaque,attaqueplus=recoitinfogene(j,i,k,infswipe.qmenu)
	if demandelevelup then
		print("demandelevelup")
		if valide then
			print("et valide et demande de levelup")
			savegamedev[numgene]=savegameall.generalxp[levelgene]+2
			--local loadsave = require("loadsave")
			--loadsave.saveTable(savegamedev, "undeuxtroissoleilbis.json" )
		end
		valide,prix,derniergene,xpmanquant,levelgene,xpactuel,xpppourlevelup,numgene,vie,vieplus,attaque,attaqueplus=recoitinfogene(j,i,k,infswipe.qmenu)
	else
		print("pas demandelevelup")
	end

	if valide then
		print("est valide")
		--if infswipe.bouton[j].page[i].bouton[k].titreText~=nil then
			titreText.text=infswipe.bouton[j].page[i].bouton[k].texttop --titreText

		--end
		titreText.text=titreText.text.." lvl "..levelgene
		print("titreText.text="..titreText.text)
		if xpactuel>1000000000 then
			xpactuel=mathfloor(xpactuel*0.000000001).."G"
		elseif xpactuel>1000000 then
			xpactuel=mathfloor(xpactuel*0.000001).."M"
		elseif xpactuel>1000 then
			xpactuel=mathfloor(xpactuel*0.001).."k"
		end
		if xpppourlevelup>1000000000 then
			xpppourlevelup=mathfloor(xpppourlevelup*0.000000001).."G"
		elseif xpppourlevelup>1000000 then
			xpppourlevelup=mathfloor(xpppourlevelup*0.000001).."M"
		elseif xpppourlevelup>1000 then
			xpppourlevelup=mathfloor(xpppourlevelup*0.001).."k"
		end
		print(texttraduction.hero[1])
		local textmain=texttraduction.hero[1].." "..levelgene.." "..texttraduction.hero[2].." "..xpactuel.."/"..xpppourlevelup.."\n"..texttraduction.hero[3]..""..vie.." "..texttraduction.hero[4]..""..attaque
		--mainText.text="\n\n\n\n\nlvl "..levelgene.." xp "..xpactuel.."/"..xpppourlevelup.."\nVie:"..vie.." att:"..attaque
		if derniergene then
			print("confprix "..prix)
			confprix.text=prix
			if xpmanquant>1000000000 then
				xpmanquant=mathfloor(xpmanquant*0.000000001).."G"
			elseif xpmanquant>1000000 then
				xpmanquant=mathfloor(xpmanquant*0.000001).."M"
			elseif xpmanquant>1000 then
				xpmanquant=mathfloor(xpmanquant*0.001).."k"
			end
			mainText.text=textmain.."\n\nBuy "..xpmanquant.." "..texttraduction.hero[2].." to\nto level "..(levelgene+1).." "..texttraduction.hero[4].."+"..attaqueplus.."\n"..texttraduction.hero[3].."+"..vieplus
			print("mainText.text="..mainText.text)
		else
			print("not derniergene")
			boutonconf.isVisible=false
			mainText.text=textmain
			confprix.alpha=0
			confprixmonnaie.alpha=0
			xpmanquant=nil
		end
		boutontab[j].bouton[i].bouton[k].textright.text="lvl "..levelgene
	else
		print("not valide")
	end
	if demandelevelup then
		local loadsave = require("loadsave")
		loadsave.saveTable(savegame, "undeuxtroissoleil.json" )
		loadsave.saveTable(savegamedev, "undeuxtroissoleilbis.json" )
	end
end
function slideViewlaunch(infswipe)
	local tab
	local affbandeau
	local tutoaffi=0
	local actionmenu
	if infswipe.qmenu==1 then
		actionmenu= require("menudedevfon")
	elseif infswipe.qmenu==2 then
		actionmenu= require("menucarte")
		if goh then
			tab=true
		end
	elseif infswipe.qmenu==3 then
		actionmenu = require("swipemulti")
	end
	display.setStatusBar(display.HiddenStatusBar)

	local slideView = require("Zunware_SlideView")

	local bpprec={}--information sur 
	bpprec.inf1=-1
	bpprec.inf2=0
	bpprec.inf3=0

	local groupmenu=display.newGroup()
	local imageMenu=display.newImage(infswipe.menu,1)--display.newImage("Menuprincipal/imageMenu.png", actualcontentwidth/2,actualcontentheight/2,true)
	imageMenu.x=contentcenterx--actualcontentwidth/2
	imageMenu.y=contentcentery--actualcontentheight/2
	local largeur=imageMenu.width/actualcontentwidth--1920/1080 dimension de l'image du menu
	local hauteur=imageMenu.height/actualcontentheight
	local zoom = 0
	if (largeur > hauteur) then
		zoom = hauteur
	else
		zoom = largeur
	end
	imageMenu.xScale=imageMenu.xScale*((1/zoom)+0.01)--zoom de l'image pour qu'elle occupe entierement l'ecran
	imageMenu.yScale=imageMenu.yScale*((1/zoom)+0.01)
	groupmenu:insert(imageMenu)

	local barver=display.newImage(imagemenu.barver,1) --"barver.png")
	barver.xScale=actualcontentwidth/barver.width/3
	print("barver "..actualcontentwidth-barver.xScale*barver.width)
	barver.yScale=actualcontentheight/barver.height
	barver.x=xmaxscreen-barver.xScale*barver.width*0.5
	barver.y=contentcentery --actualcontentheight/2+bandeau.yScale*10/2


	-- local bandeau=display.newImage(imagemenu.bandeau,1) --"bandeau.png")
	-- bandeau.xScale=actualcontentwidth/bandeau.width
	-- bandeau.yScale=actualcontentheight/bandeau.height*0.1
	-- bandeau.x=contentcenterx
	-- bandeau.y=yminscreen+bandeau.yScale*bandeau.height*0.5

	--boutonsheet=imagemenu.bouton --graphics.newImageSheet( "bouton.png", { width=50, height=25, numFrames=2 } )
		local sequenceData =
	{
	    name="boutonetat",
	    frames= {1,2,3,4,5,6}, -- frame indexes of animation, in image sheet
	    time = 3000,           -- Optional. In ms.  If not supplied, then sprite is frame-based.
	    loopCount = 1        -- Optional. Default is 0.
	}
	local sequenceData1=
	{
	    name="boutonetat",
	    frames= {1,2,3,4,4,4}, -- frame indexes of animation, in image sheet
	    time = 3000,           -- Optional. In ms.  If not supplied, then sprite is frame-based.
	    loopCount = 1        -- Optional. Default is 0.
	}
	local sequenceDataonglet =
	{
	    name="boutonetat",
	    frames= {1,2}, -- frame indexes of animation, in image sheet
	    time = 3000,           -- Optional. In ms.  If not supplied, then sprite is frame-based.
	    loopCount = 1        -- Optional. Default is 0.
	}
	local boutontab={}
	local bordgauche=xminscreen
	local nbgroupage=#infswipe.bouton
	local groupage=true
	if infswipe.bouton[1].bandeau~=nil then
		nbgroupage=#infswipe.bouton[1].fond
		groupage=false
	end
	print("\n\n\n\nnbgroupage "..nbgroupage)
	for i=1,nbgroupage do
		boutontab[i]=display.newSprite(imagemenu.onglet,sequenceDataonglet)      -- display.newSprite(imagemenu.bouton, sequenceData )
		boutontab[i].scalex=(actualcontentwidth-barver.xScale*barver.width)/boutontab[i].width/nbgroupage
		boutontab[i].xScale=boutontab[i].scalex --*0.9
		boutontab[i].scaley=actualcontentheight/boutontab[i].height*0.1
		boutontab[i].yScale=boutontab[i].scaley --*0.9
		boutontab[i].x=bordgauche+boutontab[i].xScale*boutontab[i].width*0.5
		bordgauche=boutontab[i].x+boutontab[i].xScale*boutontab[i].width*0.5
		boutontab[i].y=yminscreen+boutontab[i].yScale*boutontab[i].height*0.5
		boutontab[i].y1=boutontab[i].y
		boutontab[i].y=boutontab[i].y1+boutontab[i].scaley*0.05*boutontab[i].height
		boutontab[i].i=i
		local letext
		local sizetext=25
		if infswipe.bouton[1].bandeau~=nil then
			letext=infswipe.bouton[1].textp[i]
			if infswipe.bouton[1].textpt~=nil then
				if infswipe.bouton[1].textpt[i]~=nil then
					sizetext=sizetext*infswipe.bouton[1].textpt[i]
				end
			end
		else
			print("i "..i)
			letext=infswipe.bouton[i].text
			if infswipe.bouton[1].textpt~=nil then
				sizetext=sizetext*infswipe.bouton[1].textpt
			end
		end
		 
		boutontab[i].textet=sizetext --taille native du texte
		boutontab[i].texte=display.newEmbossedText(letext,boutontab[i].x,boutontab[i].y,fonttype,sizetext*fontsize) -- native.systemFontBold,sizetext)
		boutontab[i].texte:setEmbossColor(colortextemb)
		--boutontab[i].font=native.newFont( "Helvetica-Bold",16 )
		if colorbouttoptxt~=nil then
			boutontab[i].texte:setFillColor(colorbouttoptxt[i].red,colorbouttoptxt[i].green,colorbouttoptxt[i].blue)
		else
			boutontab[i].texte:setFillColor(1)
		end


		--boutontab[i]:setFillColor(0.5)
		if i>1 then
			boutontab[i]:setFrame(1)
			-- boutontab[i].slide.isVisible=false
			boutontab[i].xScale=boutontab[i].scalex*0.9 --0.9
			boutontab[i].yScale=boutontab[i].scaley*0.9
			boutontab[i].y=boutontab[i].y1+boutontab[i].scaley*0.1*boutontab[i].height
			boutontab[i].texte.y=boutontab[i].y1+boutontab[i].scaley*0.1*boutontab[i].height
		else
			boutontab[i]:setFrame(2)
			boutontab[i].texte.size=boutontab[i].textet*1.2
			boutontab[i].texte.y=boutontab[i].y1
			if infswipe.qmenu==2 then
				boutontab[i].texte:setFillColor(colorbouttoptxt[i].red*1.2,colorbouttoptxt[i].green*1.2,colorbouttoptxt[i].blue*1.2)
			else
				boutontab[i].texte:setFillColor(0.8,0.8,0)
			end
		end
		if tab~=nil then
			boutontab[i].isVisible=false
			boutontab[i].texte.isVisible=false
		end

	end
	local imbandeau=nil
	local titreText=display.newEmbossedText(" ",barver.x,boutontab[1].y1,fonttype,20*fontsize) --native.systemFont,20)
	if goh then
		titreText:setFillColor(0.2)
		titreText:setEmbossColor(colortextemb1)
	else
		titreText:setEmbossColor(colortextemb)
		titreText:setFillColor(0.85)
	end
	local mainText
	--if isiphone then
	mainText=display.newEmbossedText(infswipe.text,barver.x+15,titreText.y+20,barver.width*0.9*barver.xScale-15,0,fonttype,20*fontsize) --native.systemFont,20)
	if goh then
		mainText.size=15*fontsize
	end
	mainText.anchorY=0
	--else
		--mainText=display.newEmbossedText(" ",barver.x+3,titreText.y+20,fonttype,20) --native.systemFont,20)
	--end
	if goh then
		mainText:setFillColor(0.2)
		mainText:setEmbossColor(colortextemb2)
	else
		mainText:setEmbossColor(colortextemb)
		mainText:setFillColor(0.5)
	end
	local boutonconf=display.newImage(imagemenu.bpconf,1) --"bpconf.png")
	effecttranstion(boutonconf)
	boutonconf.x=barver.x
	boutonconf.x1=boutonconf.x
	boutonconf.xScale=barver.xScale*barver.width/boutonconf.width
	if goh then
		boutonconf.xScale=boutonconf.xScale*0.7
		boutonconf.yScale=boutonconf.xScale
	else
		boutonconf.yScale=boutonconf.xScale
		boutonconf.xScale=boutonconf.xScale*0.7
	end
	boutonconf.xScale1=boutonconf.xScale
	boutonconf.yScale1=boutonconf.yScale
	boutonconf.y=ymaxscreen-boutonconf.yScale*boutonconf.height*0.5-3
	boutonconf.isVisible=false


	local battorche1
	local torche1
	if not goh then
		battorche1=display.newImage(imagemenu.torchebat,1)
		battorche1.xScale=0.15
		battorche1.yScale=0.15
		battorche1.x=xmaxscreen-barver.xScale*barver.width*0.97
		battorche1.y=contentcentery+0.35*(contentcentery-yminscreen)
		battorche1:rotate(-5)
		torche1=display.newSprite(effetexplo.torche,effetexplo.torcheseq)
		torche1.xScale=1.5
		torche1.yScale=1.5
		torche1.x=battorche1.x-7
		torche1.y=battorche1.y-battorche1.height*battorche1.yScale*0.26-torche1.height*torche1.yScale*0.5
		torche1:setSequence("levelup")
		torche1:setFillColor(1,0.9,0.9)
		torche1:play()
		local function listenertorche(event)
			if torche1~=nil and groupmenu~=nil then
				groupmenu:insert(torche1)
				groupmenu:insert(battorche1)
			end
		end
		timer.performWithDelay( 100, listenertorche )
	end
	if infswipe.qmenu==2 then --and infswipe.qmenu1 then
		nbetoilett=0
		for i=1,4 do
			for j=1,4 do
				nbetoilett=nbetoilett+savegameresul[((j+(i-1)*4)-1)*4+3]
			end
		end
	end
	local function destructeur() --pas utiliser
		Runtime:removeEventListener( "key", onKeyEvent )
		-- if infswipe.qmenu==1 then
		-- 	if k~=4 and k~=8 and k~=12 then		
		-- 		boutontab[j].bouton[i].bouton[k].line=display.newLine(boutontab[j].bouton[i].gr,
		if boutonconfbis~=nil then
			groupmenu:remove(boutonconfbis)
			boutonconfbis:removeSelf()
			boutonconfbis=nil
			groupmenu:remove(confprixbis)
			confprixbis:removeSelf()
			confprixbis=nil
		end
		if inforace~=nil then
			inforace.groupe:remove(inforace.texte)
			inforace.texte:removeSelf()
			inforace.texte=nil	
			inforace.groupe:remove(inforace.fond)
			inforace.fond:removeSelf()
			inforace.fond=nil
			inforace.groupe:removeSelf()
			inforace.groupe=nil
			inforace=nil
		end
		if boutonconf1~=nil then
			groupmenu:remove(boutonconf1)
			boutonconf1:removeSelf()
			boutonconf1=nil
		end
		if confprix1~=nil then
			groupmenu:remove(confprix1)
			confprix1:removeSelf()
			confprix1=nil
		end
		if infswipe.qmenu~=3 then
			lefrictext:removeSelf()
			lefrictext=nil
		end

		if groupeslotspawn~=nil then
			for i=1,4 do
				groupeslotspawn:remove(slotspawnprix[i])
				slotspawnprix[i]:removeSelf()
				slotspawnprix[i]=nil
			end
			slotspawnprix=nil
			for i=1,4 do
				groupeslotspawn:remove(slotspawnbuste[i])
				slotspawnbuste[i]:removeSelf()
				slotspawnbuste[i]=nil
			end
			slotspawnbuste=nil
			for i=1,4 do
				groupeslotspawn:remove(slotspawn[i])
				slotspawn[i]:removeSelf()
				slotspawn[i]=nil
			end
			slotspawn=nil
			for i=1,4 do
				groupeslotspawn:remove(slotspawntext[i])
				slotspawntext[i]:removeSelf()
				slotspawntext[i]=nil
			end
			slotspawntext=nil

			groupmenu:remove(groupeslotspawn)
			groupeslotspawn:removeSelf()
			groupeslotspawn=nil
		end

		colorbouttoptxt=nil
		bpprec=nil
		groupmenu:remove(imageMenu)
		imageMenu:removeSelf()
		imageMenu=nil
		groupmenu:remove(barver)
		barver:removeSelf()
		barver=nil
		-- groupmenu:remove(bandeau)
		-- bandeau:removeSelf()
		-- bandeau=nil

		if tutoaffi~=0 then
			tutoaffim:remove(fleche)
			fleche:removeSelf()
			fleche=nil
			fleche1=nil
			tutoaffim:remove(texttuto)
			texttuto:removeSelf()
			texttuto=nil
			-- if tutoaffi>1 then
			-- 	tutoaffim:remove(fleche1)
			-- 	fleche1:removeSelf()
			-- 	fleche1=nil
			-- 	tutoaffim:remove(texttuto1)
			-- 	texttuto1:removeSelf()
			-- 	texttuto1=nil
			-- end
			tutoaffim:removeSelf()
			tutoaffim=nil
			tutoaffi=0
		end

		for i=1,nbgroupage do

			boutontab[i].texte:removeSelf()
			boutontab[i].texte=nil
			boutontab[i]:removeSelf()
			boutontab[i]=nil

		end

		titreText:removeSelf()
		titreText=nil

		mainText:removeSelf()
		mainText=nil

		boutonconf:removeSelf()
		boutonconf=nil
		if infswipe.qmenu==2 or  infswipe.qmenu==3 then
			boutonracegr:remove(boutonrace[1])
			boutonracegr:remove(boutonrace[2])
			boutonracegr:remove(boutonrace[3])
			boutonrace[1]:removeSelf()
			boutonrace[2]:removeSelf()
			boutonrace[3]:removeSelf()
			boutonrace[1]=nil
			boutonrace[2]=nil
			boutonrace[3]=nil
			if infswipe.qmenu1 then
				groupeetoilemanquante:remove(etoilemanquantetxt)
				etoilemanquantetxt:removeSelf()
				etoilemanquantetxt=nil
				groupeetoilemanquante:remove(etoilemanquantemonnaie)
				etoilemanquantemonnaie:removeSelf()
				etoilemanquantemonnaie=nil
				groupeetoilemanquante:removeSelf()
				groupeetoilemanquante=nil
			else
				boutonracegr:remove(boutonrace.hard)
				boutonrace.hard:removeSelf()
				boutonrace.hard=nil
				display.remove(boutonrace.wave)
				boutonrace.wave=nil
			end
		end
		-- boutonmenuprin:removeEventListener( "tap", boutonmenuprin)
		-- groupmenu:remove(boutonmenuprin)
		-- boutonmenuprin:removeSelf()
		-- boutonmenuprin=nil
		infswipe=nil
		if not goh then
			groupmenu:remove(torche1)
			groupmenu:remove(battorche1)
			print("remove torche")
			torche1:removeSelf()
			torche1=nil
			battorche1:removeSelf()
			battorche1=nil
		end
		boutonrace=nil
		groupmenu:removeSelf()
		groupmenu=nil
		confprix=nil
		confprixmonnaie=nil
	end
	local function retourmenu1()
		audio.play( son.uicl1)
		for i=1,#infswipe.bouton do
			boutontab[i].slide:cleanUp()
		end
		local coffretest=nil
		if infswipe.qmenu==1 then
			coffretest=true
		end
		destructeur()

		--groupmenu:removeSelf()
		local menuprinc = require ( "mainbis" )
		lemain(coffretest)
	end
	local function retourmenu()
		if functionToCall==nil then
			functionToCall=retourmenu1
		end
	end
	local function animationpayement(typede,prixdev)
		local boutonconfbis=display.newImage(imagemenu.bpconf,1)
		boutonconfbis.x=boutonconf.x
		boutonconfbis.y=boutonconf.y
		boutonconfbis.xScale=boutonconf.xScale
		boutonconfbis.yScale=boutonconf.yScale
		boutonconfbis.fill.effect = "filter.brightness"
		boutonconfbis.fill.effect.intensity = 0
		groupmenu:insert(boutonconfbis)

		local confprixbis=display.newEmbossedText(confprix.text,confprix.x,confprix.y,fonttype)
		confprixbis.size=confprixbis.size*fontsize
		confprixbis.xScale=confprix.xScale
		confprixbis.yScale=confprix.yScale
		confprixbis:setFillColor(0.5)
		confprixbis:setEmbossColor(colortextemb)
		groupmenu:insert(confprixbis)
		local xdeb
		local ydeb
		if typede then
			xdeb=lefrictext.x
			ydeb=lefrictext.y
		else
			xdeb=xpmulti.x
			ydeb=xpmulti.y
		end
		local animTuneUt=display.newEmbossedText(prixdev,xdeb+xminscreen,ydeb+boutontab[1].yScale*boutontab[1].height*0.5+boutontab[1].y,fonttype)
		animTuneUt.size=animTuneUt.size*fontsize
		if typede then
			animTuneUt:setFillColor(colortextdiam[1],colortextdiam[2],colortextdiam[3])
		else
			local function timerisnotvisible(event)
				if groupeslotspawn~=nil then
					groupeslotspawn.isVisible=false
				else
					timer.performWithDelay(5,timerisnotvisible)
				end
			end
			timer.performWithDelay(5,timerisnotvisible)
		end
		animTuneUt:setEmbossColor(colortextemb)
		groupmenu:insert(animTuneUt)
		local supanimtunedep=function(obj)
			if groupmenu~=nil then
				if animTuneUt~=nil then
					if groupeslotspawn~=nil then
						groupeslotspawn.isVisible=true
					end
					groupmenu:remove(animTuneUt)
					animTuneUt:removeSelf()
					animTuneUt=nil
					groupmenu:remove(boutonconfbis)
					boutonconfbis:removeSelf()
					boutonconfbis=nil
					groupmenu:remove(confprixbis)
					confprixbis:removeSelf()
					confprixbis=nil
				end
			else
				animTuneUt=nil
				boutonconfbis=nil
				confprixbis=nil
			end
		end
		transition.to(boutonconfbis.fill.effect,{ time=900, intensity=0.1, transition=easing.inBounce} )
		transition.to(boutonconfbis,{time=900,xScale=boutonconfbis.xScale*1.1,yScale=boutonconfbis.yScale*1.1,transition=easing.inBounce,onComplete=supanimtunedep})
		transition.to(animTuneUt,{time=700,x=boutonconf.x,y=boutonconf.y,transition=easing.inOutSine})
		transition.to(animTuneUt,{time=350,xScale=2,yScale=2,transition=easing.inSine})
		transition.to(animTuneUt,{delay=350,time=350,xScale=1,yScale=1,transition=easing.outSine})
	end
	local function achatdev()
		local prixdev
		local assezdetune=false
		if infswipe.bouton[bpprec.inf1].page[bpprec.inf2].bouton[bpprec.inf3].prix~=nil then
			prixdev=tonumber(confprix.text) --infswipe.bouton[bpprec.inf1].page[bpprec.inf2].bouton[bpprec.inf3].prix
			if infswipe.qmenu~=3 then
				local fricpos=fric1
				if fricpos<0 then
					fricpos=-fricpos
				end
				if fricpos>-0.1 then
					if fricpos<0.1 then
						fricpos=0
						print("0 ici?? fricpos"..fricpos)
					end
				end 
				if prixdev*7<=fricpos then
					local calcultest=mathabs(fric1)/7-savegame.monney
					if calcultest>1 or calcultest<-1 then
					--if fric1/7~=savegame.monney then
						fric1=0
						native.showAlert( "Met a 0 l'argent", "contacter arthafrance@gmail.com", { "OK" } )
						print("triche1")
					else
						assezdetune=true
						if fric1<0 then
							fric1=-fric1-prixdev*7
						else
							fric1=-(fric1-prixdev*7)
						end
						fric1=mathfloor(fric1)
						savegame.diplay=gettime()
						local fricpos=fric1
						if fricpos<0 then
							fricpos=-fricpos
						end
						savegame.content=(-fricpos/3-1)/savegame.display
						savegame.monney=fricpos/7
						--lefrictext.text=fricpos/7
						vartune(true)
						if true then
							local fricpos1=fric1
							if fricpos1<0 then
								fricpos1=-fricpos1
							end
							if fricpos1>-0.1 then
								if fricpos1<0.1 then
									fricpos1=0
									print("0")
								end
							end
							print("infiniteupgrade init")
							local infiniteupgrade=false
							if (bpprec.inf2==1 or bpprec.inf2==2 or bpprec.inf2==3) and (bpprec.inf3==4 or bpprec.inf3==8 or bpprec.inf3==12) then
								print("infiniteupgrade 1")
								local numeroboutonglob=(bpprec.inf1-1)*6*13+(bpprec.inf2-1)*13+bpprec.inf3
								local bpprecinf11=bpprec.inf1
								local bpprecinf21=bpprec.inf2
								local bpprecinf31=bpprec.inf3
								if infswipe.qmenu==1 then
									if bpprec.inf2>2 then
										bpprecinf11=bpprec.inf2-1
										bpprecinf21=1
									end
									--bpprecinf21=(bpprec.inf1-1)+bpprecinf21
									numeroboutonglob=(bpprecinf11-1)*6*13+(bpprecinf21-1)*13+bpprecinf31
								end
								print("savegamedev["..numeroboutonglob.."]="..savegamedev[numeroboutonglob])
								if savegamedev[numeroboutonglob]==1 then
									print("infiniteupgrade is true")
									infiniteupgrade=true
									if savegamedev21[(bpprec.inf2-1)*4+bpprec.inf3/4]==nil then
										savegamedev21[(bpprec.inf2-1)*4+bpprec.inf3/4]=0
									end
									savegamedev21[(bpprec.inf2-1)*4+bpprec.inf3/4]=savegamedev21[(bpprec.inf2-1)*4+bpprec.inf3/4]+1
									local loadsave = require("loadsave")
									loadsave.saveTable(savegamedev21, "undeuxtroissoleil2021.json" )
									infswipe.bouton[bpprec.inf1].page[bpprec.inf2].bouton[bpprec.inf3].textright="lvl "..savegamedev21[(bpprec.inf2-1)*4+bpprec.inf3/4]+1
									boutontab[bpprec.inf1].bouton[bpprec.inf2].bouton[bpprec.inf3].textright.text=infswipe.bouton[bpprec.inf1].page[bpprec.inf2].bouton[bpprec.inf3].textright
								else
									print("display new text")
									infswipe.bouton[bpprec.inf1].page[bpprec.inf2].bouton[bpprec.inf3].textright="lvl 1"
									boutontab[bpprec.inf1].bouton[bpprec.inf2].bouton[bpprec.inf3].textright=display.newEmbossedText("lvl 1",boutontab[bpprec.inf1].bouton[bpprec.inf2].bouton[bpprec.inf3].x+boutontab[bpprec.inf1].bouton[bpprec.inf2].bouton[bpprec.inf3].width*boutontab[bpprec.inf1].bouton[bpprec.inf2].bouton[bpprec.inf3].xScale*0.5+20,boutontab[bpprec.inf1].bouton[bpprec.inf2].bouton[bpprec.inf3].y,fonttype,20*fontsize)
									boutontab[bpprec.inf1].bouton[bpprec.inf2].bouton[bpprec.inf3].textright:setFillColor(0.45,0,0)--.2,0.2,0.2)
									boutontab[bpprec.inf1].bouton[bpprec.inf2].bouton[bpprec.inf3].textright:setEmbossColor(colortextemb)
									boutontab[bpprec.inf1].bouton[bpprec.inf2].gr:insert(boutontab[bpprec.inf1].bouton[bpprec.inf2].bouton[bpprec.inf3].textright)
								end
								print("infiniteupgrade 2")
							end
							if infswipe.qmenu~=3 and ((bpprec.inf2~=4 or (bpprec.inf2==4 and bpprec.inf3==12)) and infiniteupgrade==false) then --bpprec.inf1~=3 or (bpprec.inf1==3 and bpprec.inf3==12) then -- achat non securiser sur le multi------------------------------------------------------
								print("dans le if infiniteupgrade")
								local friccum=fricpos1/7+prixdev
								-- for i=1,3 do
								-- 	for j=1,4 do
								-- 		for k=1,12 do 
								-- friccum=friccum+prixdev
								for j=1,#infswipe.bouton do
									for i=1,#boutontab[j].fond do
										for k=1,#infswipe.bouton[j].page[i].bouton do
											if i~=#infswipe.bouton[j].page or k==12 then
												--if infswipe.bouton[j].page[i].bouton[k].condition~=nil then
												local j1=j
												local i1=i
												local k1=k
												if infswipe.qmenu==1 then
													if i>2 then
														j1=i-1
														i1=1
													end
													--i1=(j-1)+i1
												end
												if savegamedev[(j1-1)*6*13+(i1-1)*13+k1]==1 then
													if infswipe.bouton[j].page[i].bouton[k].prix~=nil then
														friccum=friccum+infswipe.bouton[j].page[i].bouton[k].prix
														print("friccum+"..infswipe.bouton[j].page[i].bouton[k].prix)
													end
												end
											end
										end
									end
								end
								-- 			if savegamedev[i]==1 then
								-- 			--print("demande d'ordre de deja fait")
								-- 			(inf1-1)*6*13+(inf2-1)*13+inf3
								-- 			if infswipe.bouton[bpprec.inf1].page[bpprec.inf2].bouton[bpprec.inf3].prix~=nil then
								-- 				friccum=friccum+infswipe.bouton[bpprec.inf1].page[bpprec.inf2].bouton[bpprec.inf3].prix
								-- 			end
								-- 		end
								-- 	end
								-- end
								print("argent cummulé = "..friccum.."normalement doit etre à "..savegame.yomec/5)
								if friccum~=savegame.yomec/5 then
									print("l'argent cumuler ne correspond pas")
									native.showAlert( "Erreur friccum~=savegame.yomec", "contacter arthafrance@gmail.com", { "OK" } )
								 	fric1=0

								end
							else
								savegame.yomec=savegame.yomec-prixdev*5
								print("devellopement de type general (debloque ou augmente leur level)")
							end
						end
						animationpayement(true,prixdev)
					end
					local loadsave = require("loadsave")
					loadsave.saveTable(savegame, "undeuxtroissoleil.json" )
				else
					funcaffinapp()
					if infswipe.qmenu==1 then
						confprix:setFillColor(0,0,0)
					else
						confprix:setFillColor(1,0,0)
					end
					local function confprixred1( event )
						if confprix~=nil then
							if infswipe.qmenu==1 then
								confprix:setFillColor(0.8,0,0)
							else
								confprix:setFillColor(1,1,1)
							end
						end
					end
					confprixred=timer.performWithDelay(1000, confprixred1 )
				end
			else
				if savegamemulti.xp-savegamemulti.xpu>=tonumber(confprix.text) then
					prixdev=tonumber(confprix.text)
					savegamemulti.xpu=savegamemulti.xpu+prixdev
					xpmulti.text=savegamemulti.xpu.."/"..savegamemulti.xp
					assezdetune=true
					animationpayement(false,prixdev)
				else
					confprix:setFillColor(1,0,0)
					local function confprixred1( event )
						if confprix~=nil then
							confprix:setFillColor(1,1,1)
						end
					end
					confprixred=timer.performWithDelay(1000, confprixred1 )
				end
			end
		else
			prixdev=-1
			assezdetune=true
		end

		if assezdetune==true then
			audio.play( son.eventcoin)
			local numeroboutonglob=(bpprec.inf1-1)*6*13+(bpprec.inf2-1)*13+bpprec.inf3

			local bpprecinf11=bpprec.inf1
			local bpprecinf21=bpprec.inf2
			local bpprecinf31=bpprec.inf3
			if infswipe.qmenu==1 then
				if bpprec.inf2>2 then
					bpprecinf11=bpprec.inf2-1
					bpprecinf21=1
				end
				--bpprecinf21=(bpprec.inf1-1)+bpprecinf21
				numeroboutonglob=(bpprecinf11-1)*6*13+(bpprecinf21-1)*13+bpprecinf31
			end
			local demandeLevelUp1=false
			if infswipe.qmenu~=3 then
				local infiniteupgrade=false
				print("infiniteupgrade init")
				--local numeroboutonglob=(bpprec.inf1-1)*6*13+(bpprec.inf2-1)*13+bpprec.inf3
				if (bpprec.inf2==1 or bpprec.inf2==2 or bpprec.inf2==3) and (bpprec.inf3==4 or bpprec.inf3==8 or bpprec.inf3==12) then
					print("infiniteupgrade 1")
					if savegamedev[numeroboutonglob]==1 then
						print("infiniteupgrade is true")
						infiniteupgrade=true
					end
					print("infiniteupgrade 2")
				end
				if savegamedev[numeroboutonglob]==1 and infiniteupgrade==false then
					print("demandeLevelUp1=true")
					demandeLevelUp1=true
				end
			end
			if demandeLevelUp1==true then -- signifie demande de level up.
				print("avant demande de level up")
				miseajourgeneaff(bpprec.inf1,bpprec.inf2,bpprec.inf3,infswipe,titreText,mainText,boutontab,true,boutonconf,infswipe.qmenu)
				print("apres demande de levelup")
				-- local valide
				-- local xpmanquant
				-- local levelgene
				-- local xpactuel
				-- local xpppourlevelup
				-- local numgene
				-- valide,xpmanquant,levelgene,xpactuel,xpppourlevelup,numgene=recoitinfogene(bpprec.inf1,bpprec.inf2,bpprec.inf3)
				-- if valide then
				-- 	savegamedev[numgene]=savegameall.generalxp[levelgene]+2
				-- end
				-- valide,xpmanquant,levelgene,xpactuel,xpppourlevelup=recoitinfogene(bpprec.inf1,bpprec.inf2,bpprec.inf3)
				-- if valide then
				-- 	if infswipe.bouton[bpprec.inf1].page[bpprec.inf2].bouton[bpprec.inf3].titreText~=nil then
				-- 		titreText.text=infswipe.bouton[bpprec.inf1].page[bpprec.inf2].bouton[bpprec.inf3].titreText
				-- 	end
				-- 	titreText.text=titreText.text.." lvl "..levelgene
				-- 	mainText.text="\n\n\n\n\nlvl "..levelgene.." xp "..xpactuel.."/"..xpppourlevelup.."\n\n\nBuy "..xpmanquant.." XP to\nget the general\nto level "..levelgene+1
				-- 	confprix.text=xpmanquant
				-- 	boutontab[bpprec.inf1].bouton[bpprec.inf2].bouton[bpprec.inf3].textright.text="lvl "..levelgene
				-- end
				-- local loadsave = require("loadsave")
				-- loadsave.saveTable(savegame, "undeuxtroissoleil.json" )
				-- loadsave.saveTable(savegamedev, "undeuxtroissoleilbis.json" )
			else
				print("pas demande de levelup l847")
				boutonconf.isVisible=false
				confprix.alpha=0
				if infswipe.qmenu==1 then 
					confprixmonnaie.alpha=0
				end
				boutontab[bpprec.inf1].bouton[bpprec.inf2].bouton[bpprec.inf3]:setFrame(5)
				--boutontab[bpprec.inf1].bouton[bpprec.inf2].bouton[bpprec.inf3]:setFillColor(1,1,0.2)
				local bpprecinf11=bpprec.inf1--1--3
				local bpprecinf21=bpprec.inf2--4--1
				local bpprecinf31=bpprec.inf3--5--5
				if infswipe.qmenu==1 then
					if bpprec.inf2>2 then
						bpprecinf11=bpprec.inf2-1
						bpprecinf21=1
					end
				end
				print("ordre")
				if infswipe.qmenu==3 then
					actionmenu.ordre(bpprecinf11,bpprecinf21,bpprecinf31,prixdev)
					if bpprec.inf1==3 then
						boutontab[bpprec.inf1].bouton[bpprec.inf2].bouton[bpprec.inf3]:setFrame(6)
						print("here\n\n\n\nhere")
						affbandeau(1)
						--affbandeauSolGet()
					end
					print("here\n\n\n\nhere1 "..bpprec.inf1)
				else
					actionmenu.ordre(bpprecinf11,bpprecinf21,bpprecinf31,prixdev)
				end
 				if infswipe.qmenu~=3 then
					for j=1,#infswipe.bouton do
						for i=1,#boutontab[j].fond do
							for k=1,#infswipe.bouton[j].page[i].bouton do
								if infswipe.bouton[j].page[i].bouton[k].condition~=nil then
									imbandeau.fill.effect.intensity=0
									local j1=j
									local i1=i
									local k1=k
									if infswipe.qmenu==1 then
										if i>2 then
											j1=i-1
											i1=1
										end
									end
									if 	savegamedev[infswipe.bouton[j].page[i].bouton[k].condition]==1 and savegamedev[(j1-1)*6*13+(i1-1)*13+k1]==0 then
										-- boutontab[j].bouton[i].bouton[k]:setFillColor(1,1,1)
										boutontab[j].bouton[i].bouton[k]:setFrame(3)
									end
								end
							end
						end
					end
				else
					if bpprec.inf1==4 then
						if bpprec.inf3~=3 and bpprec.inf3~=6 and bpprec.inf3~=9 then
							print("bpprec.inf3"..bpprec.inf3)
							boutontab[bpprec.inf1].bouton[bpprec.inf2].bouton[bpprec.inf3+1]:setFrame(3)
						end 
					end
				end
				if infswipe.qmenu==1 then 
					if bpprec.inf2==4 and (bpprec.inf3==3 or bpprec.inf3==11) then
						boutontab[bpprec.inf1].bouton[bpprec.inf2].bouton[8]:setFrame(3)
					end
					if bpprec.inf3~=4 and bpprec.inf3~=8 and bpprec.inf3~=12 then
						-- if i==1 then
						-- 	boutontab[j].bouton[i].bouton[k].line=display.newLine(boutontab[j].bouton[i].gr,boutontab[j].bouton[i].bouton[k].x,boutontab[j].bouton[i].bouton[k].y,boutontab[j].bouton[i].bouton[k].x,boutontab[j].bouton[i].bouton[k].y)
						-- else
							if boutontab[bpprec.inf1].bouton[bpprec.inf2].bouton[bpprec.inf3].frame==5 then
								local torche1test2=display.newSprite(effetexplo.torche1,effetexplo.torche1seq)
								if bpprec.inf2==4 and (bpprec.inf3==3 or bpprec.inf3==11) then
									torche1test2.x=(boutontab[bpprec.inf1].bouton[bpprec.inf2].bouton[bpprec.inf3].x)*0.5
									torche1test2.y=(boutontab[bpprec.inf1].bouton[bpprec.inf2].bouton[bpprec.inf3].y-110)*0.5
									if bpprec.inf3==3 then
										torche1test2:rotate(65)
									else
										torche1test2:rotate(-65)
									end
									if not goh then
										torche1test2.xScale=0.1
									else
										torche1test2.xScale=0.025
									end
									torche1test2.yScale=1/torche1test2.height*(120)
								else
									torche1test2.x=boutontab[bpprec.inf1].bouton[bpprec.inf2].bouton[bpprec.inf3].x
									if not goh then
										torche1test2.xScale=0.1
									else
										torche1test2.xScale=0.05
									end
									torche1test2.yScale=1/torche1test2.height*(44.999999627471) --boutontab[j].bouton[i].bouton[k+1].y-boutontab[j].bouton[i].bouton[k].y)
									local yscalebt=boutontab[bpprec.inf1].bouton[bpprec.inf2].bouton[bpprec.inf3].yScale
									if goh then
										yscalebt=yscalebt*0.8
									end
									torche1test2.y=boutontab[bpprec.inf1].bouton[bpprec.inf2].bouton[bpprec.inf3].y-0.5*torche1test2.height*torche1test2.yScale-boutontab[bpprec.inf1].bouton[bpprec.inf2].bouton[bpprec.inf3].height*yscalebt*0.5
									torche1test2.yScale=-torche1test2.yScale
								end
								torche1test2:setSequence("levelup")
								torche1test2:setFillColor(0)
								torche1test2:play()
								boutontab[bpprec.inf1].bouton[bpprec.inf2].bouton[bpprec.inf3].gr:insert(torche1test2)
							end
						--end
					end
					if bpprec.inf3~=1 and bpprec.inf3~=5 and bpprec.inf3~=9 and not (bpprec.inf1==3 and bpprec.inf3==12) then
						-- if i==1 then
						-- 	boutontab[j].bouton[i].bouton[k-1].line:append(boutontab[j].bouton[i].bouton[k].x,boutontab[j].bouton[i].bouton[k].y,boutontab[j].bouton[i].bouton[k-1].x,boutontab[j].bouton[i].bouton[k-1].y)
						-- 	if boutontab[j].bouton[i].bouton[k].frame==1 then
						-- 		boutontab[j].bouton[i].bouton[k-1].line.strokeWidth=1
						-- 		boutontab[j].bouton[i].bouton[k-1].line:setStrokeColor(0.1,0.1,0.1,0.4)
						-- 	elseif boutontab[j].bouton[i].bouton[k].frame==3 then
						-- 		boutontab[j].bouton[i].bouton[k-1].line.strokeWidth=2
						-- 		boutontab[j].bouton[i].bouton[k-1].line:setStrokeColor(0.1,0.1,0.1,0.8)
						-- 	else
						-- 		boutontab[j].bouton[i].bouton[k-1].line.strokeWidth=2
						-- 		boutontab[j].bouton[i].bouton[k-1].line:setStrokeColor(0.5,0.5,0)
						-- 	end
						-- else
							if boutontab[bpprec.inf1].bouton[bpprec.inf2].bouton[bpprec.inf3].frame==5 then
								local torche1test=display.newSprite(effetexplo.torche1,effetexplo.torche1seq)
								torche1test.x=boutontab[bpprec.inf1].bouton[bpprec.inf2].bouton[bpprec.inf3].x
								if not goh then
									torche1test.xScale=0.2
								else
									torche1test.xScale=0.05
								end
								local yscalebt=boutontab[bpprec.inf1].bouton[bpprec.inf2].bouton[bpprec.inf3-1].yScale
								if goh then
									yscalebt=yscalebt*0.8
								end
								torche1test.yScale=-1/torche1test.height*(boutontab[bpprec.inf1].bouton[bpprec.inf2].bouton[bpprec.inf3-1].y-(boutontab[bpprec.inf1].bouton[bpprec.inf2].bouton[bpprec.inf3].y+yscalebt*boutontab[bpprec.inf1].bouton[bpprec.inf2].bouton[bpprec.inf3-1].height))
								--torche1test.alpha=0.5
								print("yScale"..(boutontab[bpprec.inf1].bouton[bpprec.inf2].bouton[bpprec.inf3-1].y-(boutontab[bpprec.inf1].bouton[bpprec.inf2].bouton[bpprec.inf3].y+yscalebt*boutontab[bpprec.inf1].bouton[bpprec.inf2].bouton[bpprec.inf3-1].height)))
								torche1test.y=boutontab[bpprec.inf1].bouton[bpprec.inf2].bouton[bpprec.inf3].y-0.5*torche1test.height*torche1test.yScale+boutontab[bpprec.inf1].bouton[bpprec.inf2].bouton[bpprec.inf3].height*yscalebt*0.5
								torche1test.yScale=-torche1test.yScale
								torche1test:setSequence("levelup")
								torche1test:setFillColor(1,0.9,0.9)
								torche1test:play()
								boutontab[bpprec.inf1].bouton[bpprec.inf2].bouton[bpprec.inf3-1].gr:insert(torche1test)
								if bpprec.inf1==3 and bpprec.inf3==8 then
									local torche1test3=display.newSprite(effetexplo.torche1,effetexplo.torche1seq)
									torche1test3.x=(boutontab[bpprec.inf1].bouton[bpprec.inf2].bouton[bpprec.inf3].x-100)*0.5
									torche1test3.y=(boutontab[bpprec.inf1].bouton[bpprec.inf2].bouton[bpprec.inf3].y-110+70)*0.5
									torche1test3:rotate(65)
									if not goh then
										torche1test3.xScale=0.1
									else
										torche1test3.xScale=0.025
									end
									torche1test3.yScale=1/torche1test3.height*(120)
									torche1test3.yScale=-torche1test3.yScale
									torche1test3:setSequence("levelup")
									torche1test3:setFillColor(1,0.9,0.9)
									torche1test3:play()
									boutontab[bpprec.inf1].bouton[bpprec.inf2].bouton[bpprec.inf3-1].gr:insert(torche1test3)

									local torche1test4=display.newSprite(effetexplo.torche1,effetexplo.torche1seq)
									torche1test4.x=(boutontab[bpprec.inf1].bouton[bpprec.inf2].bouton[bpprec.inf3].x+100)*0.5
									torche1test4.y=(boutontab[bpprec.inf1].bouton[bpprec.inf2].bouton[bpprec.inf3].y-110+70)*0.5
									torche1test4:rotate(-65)
									if not goh then
										torche1test4.xScale=0.1
									else
										torche1test4.xScale=0.025
									end
									torche1test4.yScale=1/torche1test4.height*(120)
									torche1test4.yScale=-torche1test4.yScale
									torche1test4:setSequence("levelup")
									torche1test4:setFillColor(1,0.9,0.9)
									torche1test4:play()
									boutontab[bpprec.inf1].bouton[bpprec.inf2].bouton[bpprec.inf3-1].gr:insert(torche1test4)
								end
							end
						--end
	

						--boutontab[j].bouton[i].bouton[k-1].line.yScale=0.1
						--transition.to(boutontab[j].bouton[i].bouton[k-1].line,{time=1000,yScale=1})
					end
					if bpprec.inf2==4 and (bpprec.inf3~=4 and bpprec.inf3~=12) then
						print("mise a jour de l'experience des general")
						boutonconf.isVisible=true
						confprix.alpha=1
						confprixmonnaie.alpha=1
						miseajourgeneaff(bpprec.inf1,bpprec.inf2,bpprec.inf3,infswipe,titreText,mainText,boutontab,false,boutonconf,infswipe.qmenu)
						-- local xpmanquant
						-- local levelgene
						-- local xpactuel
						-- local xpppourlevelup
						-- local valide
						-- print("here")
						-- valide,xpmanquant,levelgene,xpactuel,xpppourlevelup=recoitinfogene(bpprec.inf1,bpprec.inf2,bpprec.inf3,false)
						-- confprix.text=xpmanquant
					end
					print("retourne au menu suite a une reinit des dev\n\n\n\n\n\n"..bpprec.inf1.." "..bpprec.inf2.." "..bpprec.inf3)
					if bpprec.inf2==4 and bpprec.inf1==1 and bpprec.inf3==4 then
						print("retourne au menu suite a une reinit des dev yo\n\n\n\n\n\n")
						retourmenu()
					end
					-- local torche1=display.newSprite(effetexplo.torche,effetexplo.torcheseq)
					-- torche1.x=boutontab[j].bouton[i].bouton[k].x
					-- torche1.xScale=0.2
					-- torche1.y=boutontab[j].bouton[i].bouton[k].y-boutontab[j].bouton[i].bouton[k].height*boutontab[j].bouton[i].bouton[k].yScale*0.5
					-- torche1:setSequence("levelup")
					-- torche1:play()
					-- boutontab[j].bouton[i].gr:insert(torche1)
				elseif infswipe.qmenu==3 and bpprec.inf1==4 then
					if bpprec.inf3~=3 and bpprec.inf3~=6 and bpprec.inf3~=9 then
						if boutontab[bpprec.inf1].bouton[bpprec.inf2].bouton[bpprec.inf3].frame==5 then
							local torche1test2=display.newSprite(effetexplo.torche1,effetexplo.torche1seq)
							torche1test2.x=boutontab[bpprec.inf1].bouton[bpprec.inf2].bouton[bpprec.inf3].x
							if not goh then
								torche1test2.xScale=0.1
							else
								torche1test2.xScale=0.025
							end
							torche1test2.yScale=1/torche1test2.height*(44.999999627471) --boutontab[j].bouton[i].bouton[k+1].y-boutontab[j].bouton[i].bouton[k].y)
							local yscalebt=boutontab[bpprec.inf1].bouton[bpprec.inf2].bouton[bpprec.inf3].yScale
							if goh then
								yscalebt=yscalebt*0.8
							end
							torche1test2.y=boutontab[bpprec.inf1].bouton[bpprec.inf2].bouton[bpprec.inf3].y-0.5*torche1test2.height*torche1test2.yScale-boutontab[bpprec.inf1].bouton[bpprec.inf2].bouton[bpprec.inf3].height*yscalebt*0.5
							torche1test2.yScale=-torche1test2.yScale
							torche1test2:setSequence("levelup")
							torche1test2:setFillColor(0)
							torche1test2:play()
							boutontab[bpprec.inf1].bouton[bpprec.inf2].bouton[bpprec.inf3].gr:insert(torche1test2)
						end
					end
					if bpprec.inf3~=1 and bpprec.inf3~=4 and bpprec.inf3~=7 then
						if boutontab[bpprec.inf1].bouton[bpprec.inf2].bouton[bpprec.inf3].frame==5 then
							local torche1test=display.newSprite(effetexplo.torche1,effetexplo.torche1seq)
							torche1test.x=boutontab[bpprec.inf1].bouton[bpprec.inf2].bouton[bpprec.inf3].x
							if not goh then
								torche1test.xScale=0.2
							else
								torche1test.xScale=0.05
							end
							local yscalebt=boutontab[bpprec.inf1].bouton[bpprec.inf2].bouton[bpprec.inf3-1].yScale
							if goh then
								yscalebt=yscalebt*0.8
							end
							torche1test.yScale=-1/torche1test.height*(boutontab[bpprec.inf1].bouton[bpprec.inf2].bouton[bpprec.inf3-1].y-(boutontab[bpprec.inf1].bouton[bpprec.inf2].bouton[bpprec.inf3].y+yscalebt*boutontab[bpprec.inf1].bouton[bpprec.inf2].bouton[bpprec.inf3-1].height))
							--torche1test.alpha=0.5
							
							torche1test.y=boutontab[bpprec.inf1].bouton[bpprec.inf2].bouton[bpprec.inf3].y-0.5*torche1test.height*torche1test.yScale+boutontab[bpprec.inf1].bouton[bpprec.inf2].bouton[bpprec.inf3].height*yscalebt*0.5
							torche1test.yScale=-torche1test.yScale
							torche1test:setSequence("levelup")
							torche1test:setFillColor(1,0.9,0.9)
							torche1test:play()
							boutontab[bpprec.inf1].bouton[bpprec.inf2].bouton[bpprec.inf3-1].gr:insert(torche1test)
						end
					end
				end
				if infswipe~=nil then
					if infswipe.qmenu==3 and bpprec.inf1==4 and bpprec.inf3>6 then
						retourmenu()
					end
				end
				if infswipe.qmenu==1 and bpprec.inf1==1 and (bpprec.inf2==1 or bpprec.inf2==2 or bpprec.inf2==3) and (bpprec.inf3==4 or bpprec.inf3==8 or bpprec.inf3==12) then
					boutonconf.isVisible=true
					confprix.alpha=1
					if infswipe.qmenu==1 then 
						confprixmonnaie.alpha=1
					end
				end
			end
		else
			audio.play( son.uicl3)
		end
	end
	function boutonconf:tap(event)
		if not inappaff then
			if infswipe.qmenu==2 then
				for i=1,#infswipe.bouton do
					boutontab[i].slide:cleanUp()
				end
				--chargementbis1.chargementbis()
				audio.play( son.uicl2)
				local bpprecinf2=bpprec.inf2
				if infswipe.qmenu1 then
					if bpprec.inf2==2 then
						bpprec.inf3=bpprec.inf3+4
						bpprecinf2=bpprecinf2-1
					end
					bpprecinf2=bpprecinf2+4
				end
				print("bpprecinf2 "..bpprecinf2)
				if boutonrace.hard~=nil then
					if boutonrace.hard.hard then
						bpprec.inf3=bpprec.inf3+30 -- met en mode hard
					end
				end
				if boutonrace.wave~=nil then
					if boutonrace.wave.hard then
						bpprec.inf3=bpprec.inf3+60 -- met en mode hard
					end
				end
				actionmenu.ordre(bpprec.inf1,bpprecinf2,bpprec.inf3,racechoix)
				--if infswipe.qmenu==2 then
					destructeur()
				--end
				--groupmenu:removeSelf()
				
			elseif infswipe.qmenu==1 then
				--print(bpprec.inf1)
				--print(bpprec.inf2)
				--print(bpprec.inf3)
				--print(infswipe.bouton[bpprec.inf1].page[bpprec.inf2].bouton[bpprec.inf3].prix)
				--print()
				if confprix.text=="Select" then
					local racech
					local niveaugenech
					local bpprecinf11=bpprec.inf1
					local bpprecinf21=bpprec.inf2
					local bpprecinf31=bpprec.inf3
					if infswipe.qmenu==1 then
						if bpprec.inf2>2 then
							bpprecinf11=bpprec.inf2-1
							bpprecinf21=1
						end
					end
					if bpprecinf31<=3 then
						racech=1
						niveaugenech=bpprecinf31
					elseif bpprecinf31>=5 and bpprecinf31<=8 then
						racech=0
						niveaugenech=bpprecinf31-4
					elseif bpprecinf31>=9 and bpprecinf31<=11 then
						racech=2
						niveaugenech=bpprecinf31-8
					end
					savegameall.generalch[racech+1]=niveaugenech
					print("niveaugenech "..niveaugenech)
					if niveaugenech==4 then
						for i=1,3 do
							savegameall.generalch[i]=niveaugenech
						end
					end
					print("niveaugenech "..niveaugenech.." racech "..racech)
					miseajourgeneaff(bpprec.inf1,bpprec.inf2,bpprec.inf3,infswipe,titreText,mainText,boutontab,false,boutonconf,infswipe.qmenu)
					audio.play( son.uicl2)
					savegamedev[racech+1+350]=savegameall.generalch[racech+1]
					if niveaugenech==4 then
						for i=1,3 do
							savegamedev[i+350]=savegameall.generalch[i]
						end
					end
					local loadsave = require("loadsave")
					loadsave.saveTable(savegamedev, "undeuxtroissoleilbis.json" )
				else
					achatdev()
				end
			else
				if bpprec.inf1==4 then
					achatdev()
				elseif bpprec.inf1==3 then
					achatdev()
				elseif bpprec.inf1==2 then
					if savegamemulti.save[bpprec.inf2][bpprec.inf3].exist then
						actionmenu.ordre(bpprec.inf1,bpprec.inf2,bpprec.inf3,nil)	
					else
						actionmenu.ordre(bpprec.inf1,bpprec.inf2,bpprec.inf3,"edit")
					end				
					destructeur()
				end
			end
		end
	end
	boutonconf:addEventListener( "tap", boutonconf)

	confprix=display.newEmbossedText(" ",boutonconf.x,boutonconf.y,fonttype,20*fontsize) --native.systemFont,20)
	confprix:setEmbossColor(colortextemb)
	if infswipe.qmenu==1 then
		confprix:setFillColor(0.8,0,0)
		confprixmonnaie=display.newImage(imbouton.monnaie,6)
		confprixmonnaie.xScale=0.13
		confprixmonnaie.yScale=confprixmonnaie.xScale
		confprixmonnaie.y=boutonconf.y
		confprixmonnaie.x=boutonconf.x+boutonconf.xScale*boutonconf.width*0.4-confprixmonnaie.xScale*confprixmonnaie.width*0.5
		confprixmonnaie.alpha=0
	end
	if infswipe.qmenu==2 or infswipe.qmenu==3 then --bouton de choix de race
		boutonrace={}
		boutonracegr=display.newGroup()
		boutonrace[1]=display.newImage(imagemenu.race,1) --"menudevnew/humain.png")
		boutonrace[2]=display.newImage(imagemenu.race,3) --"menudevnew/elfe.png")
		boutonrace[3]=display.newImage(imagemenu.race,2) --"menudevnew/geant.png")
		-- if goh then
		-- 	boutonrace[2].xScale=barver.xScale*barver.width/(boutonrace[2].width*3.5)
		-- else
		-- 	boutonrace[2].xScale=barver.xScale*barver.width/(boutonrace[2].width*3)
		-- end
		boutonrace[2].xScale=barver.xScale*barver.width/(boutonrace[2].width*4)
		boutonrace[2].yScale=boutonrace[2].xScale
		boutonrace[3].xScale=boutonrace[2].xScale
		boutonrace[3].yScale=boutonrace[2].xScale
		boutonrace[1].xScale=boutonrace[2].xScale
		boutonrace[1].yScale=boutonrace[2].xScale
		boutonrace[2].x=barver.x+boutonrace[2].xScale*boutonrace[2].width*1.1 -- barver.x+boutonrace[2].xScale*boutonrace[2].width*0.5 -- +0.25*barver.xScale*barver.width
		boutonrace[3].x=barver.x-boutonrace[2].xScale*boutonrace[2].width*1.1 --barver.x-boutonrace[2].xScale*boutonrace[2].width*0.5 -- -0.25*barver.xScale*barver.width
		boutonrace[2].y=boutonconf.y-boutonconf.yScale*boutonconf.height*0.5-boutonrace[2].yScale*boutonrace[2].height*0.55
		boutonrace[3].y=boutonrace[2].y
		boutonrace[1].x=barver.x
		boutonrace[1].y=boutonrace[2].y -- boutonrace[2].y-boutonrace[2].yScale*boutonrace[2].height*0.85
		racechoix=mathrandom(1,3)
		-- boutonrace[4]=display.newRect(boutonrace[1].x,boutonrace[1].y,boutonrace[1].xScale*boutonrace[1].width,boutonrace[1].yScale*boutonrace[1].height)
		-- boutonrace[4]:setFillColor(0,0,0,0)
		-- boutonrace[4].strokeWidth=3
		-- boutonrace[4]:setStrokeColor(1,0,0)
		-- boutonrace[4].race=1
		-- local randomrace
		--if boutonrace[4].race~=randomrace then
			-- boutonrace[4].race=randomrace
			-- boutonrace[4].x=boutonrace[randomrace].x
			-- boutonrace[4].y=boutonrace[randomrace].y
			-- boutonrace[4].width=boutonrace[randomrace].xScale*boutonrace[randomrace].width
			-- boutonrace[4].height=boutonrace[randomrace].yScale*boutonrace[randomrace].height
		--end
		--
		boutonrace[1].xScale1=boutonrace[1].xScale

		boutonrace[racechoix].fill.effect = "filter.sepia"
		boutonrace[racechoix].fill.effect.intensity=-2
		boutonrace[racechoix].xScale=boutonrace[1].xScale1*0.9
		boutonrace[racechoix].yScale=boutonrace[racechoix].xScale


		boutonracegr:insert(boutonrace[1])
		boutonracegr:insert(boutonrace[2])
		boutonracegr:insert(boutonrace[3])

		-- boutonracegr:insert(boutonrace[4])
		local function inforacefunction(i)
			if inforace==nil then
				inforace={}
				inforace.groupe=display.newGroup()
				inforace.fond=display.newRoundedRect(inforace.groupe,barver.x,imagedubandeau.y,barver.width*barver.xScale,100,2)
				inforace.fond:setFillColor(0)
				inforace.fond.alpha=0.8
				inforace.aff=nil
				inforace.texte=display.newEmbossedText("",inforace.fond.x,inforace.fond.y,inforace.fond.width*inforace.fond.xScale*0.95,inforace.fond.height*inforace.fond.yScale,fonttype,16*fontsize)
				if i>=4 then
					inforace.texte.text=texttraduction.bonusrace[7]..savegameall.gainhard[bpprec.inf2]..texttraduction.bonusrace[8]
				else
					local legeneral=savegameall.generalch[i]
					if legeneral==nil then
						legeneral=savegameall.general[i]
					end
					inforace.texte.text=texttraduction.bonusrace[(i-1)*2+1]..string.sub(image[retournenumgene(i-1,legeneral)].message,0,-3)..texttraduction.bonusrace[(i-1)*2+2]
				end
				inforace.texte:setFillColor(0.8,0.8,0.8)
				inforace.texte:setEmbossColor(colortextemb)
				inforace.groupe:insert(inforace.texte)
				inforace.rect=display.newRect(inforace.groupe,contentcenterx,contentcentery,actualcontentwidth,actualcontentheight)
				inforace.rect.alpha=0.01
				inforace.rect:setFillColor(0.5)
				inforace.display=true
				inforace.clic=true
				local function inforacetap( event )
					print("clique dessus")
					if inforace.display and not inforace.clic then
						local function inforaceclic1( event )
							if inforace~=nil then
								if inforace.display and not inforace.clic then
									inforace.groupe.alpha=0
									transition.from(inforace.groupe,{time=200,alpha=1})
									inforace.display=false
								end
							end
						end
						timer.performWithDelay(10,inforaceclic1)
					end
				end
				inforace.rect:addEventListener( "tap",inforacetap)
			end
			inforace.clic=true
			inforace.texte:setFillColor(0.8,0.8,0.8)
			local function inforaceclic( event )
				inforace.clic=false
				inforace.clic1=nil
			end
			if inforace.clic1~=nil then
				timer.cancel(inforace.clic1)
			end
			inforace.clic1=timer.performWithDelay(100,inforaceclic)
			if i>=4 then
				inforace.aff=i
				inforace.groupe.xScale=0.05
				inforace.groupe.yScale=inforace.groupe.xScale
				inforace.groupe.alpha=0
				if i==4 or i==5 then
					inforace.groupe.x=boutonrace.hard.x
					inforace.groupe.y=boutonrace.hard.y
				else
					inforace.groupe.x=boutonrace.wave.x
					inforace.groupe.y=boutonrace.wave.y
				end
				transition.to(inforace.groupe,{delay=50, time=200,xScale=1,yScale=1,alpha=1,x=0,y=0})
				inforace.display=true
			else
				if i~=racechoix or not inforace.display or inforace.aff~=i then
					inforace.aff=i
					inforace.groupe.xScale=0.05
					inforace.groupe.yScale=inforace.groupe.xScale
					inforace.groupe.alpha=0
					inforace.groupe.x=boutonrace[i].x
					inforace.groupe.y=boutonrace[i].y
					transition.to(inforace.groupe,{delay=50, time=200,xScale=1,yScale=1,alpha=1,x=0,y=0})
					inforace.display=true
				else
					inforace.groupe.xScale=1
					inforace.groupe.yScale=1
					inforace.groupe.alpha=1
					transition.from(inforace.groupe,{time=200,alpha=0.8})
					inforace.display=true
				end
			end
		end
		local function clicrace(i)
			local inforaceaff=nil
			if inforace~=nil then
				inforaceaff=inforace.aff
			end
			inforacefunction(i)
			
			-- if boutonrace[4].race~=i then
			-- 	boutonrace[4].race=i
			-- 	boutonrace[4].x=boutonrace[i].x
			-- 	boutonrace[4].y=boutonrace[i].y
			-- 	boutonrace[4].width=boutonrace[i].xScale*boutonrace[i].width
			-- 	boutonrace[4].height=boutonrace[i].yScale*boutonrace[i].height
			-- end
			
			if i~=racechoix or inforace.aff~=inforaceaff then
				print("i"..i)
				local legeneral=savegameall.generalch[i]
				if legeneral==nil then
					legeneral=savegameall.general[i]
				end
				inforace.texte.text=texttraduction.bonusrace[(i-1)*2+1]..string.sub(image[retournenumgene(i-1,legeneral)].message,0,-3)..texttraduction.bonusrace[(i-1)*2+2]
				transition.to(boutonrace[racechoix].fill.effect, { time=500, intensity=0 } )
				transition.to(boutonrace[racechoix],{delay=100, time=100,xScale=boutonrace[1].xScale1,yScale=boutonrace[1].xScale1})
				racechoix=i
			end
			boutonrace[i].fill.effect = "filter.sepia"
			boutonrace[i].fill.effect.intensity=-2
			transition.from(boutonrace[i].fill.effect, { time=500, intensity=0 } )
			boutonrace[i].xScale=boutonrace[1].xScale1
			boutonrace[i].yScale=boutonrace[1].xScale1
			transition.to(boutonrace[i],{delay=100, time=100,xScale=boutonrace[1].xScale1*0.9,yScale=boutonrace[1].xScale1*0.9})
			-- boutonrace[4].xScale=boutonrace[4].xScale1
			-- boutonrace[4].yScale=boutonrace[4].yScale1
			-- transition.from(boutonrace[4],{delay=100, time=100,xScale=boutonrace[4].xScale1*0.9,yScale=boutonrace[4].yScale1*0.9})
		end
		local function creelistener1(bouton)
			function bouton:tap(event)
				if not inappaff then
					audio.play( son.uicl1)
					clicrace(bouton.i)
				end
			end
			bouton:addEventListener( "tap", bouton)
		end
		for i=1,3 do --#infswipe.bouton do
			boutonrace[i].i=i
			creelistener1(boutonrace[i])
		end	
		boutonracegr.isVisible=false
		if infswipe.qmenu1 then 
			groupeetoilemanquante=display.newGroup()
			if isiphone then
				etoilemanquantetxt=display.newEmbossedText(groupeetoilemanquante," ",barver.x,boutonrace[2].y,barver.xScale*barver.width*0.8,0,fonttype,24*fontsize)	
			else
				etoilemanquantetxt=display.newEmbossedText(groupeetoilemanquante," ",barver.x,boutonrace[2].y,fonttype,24*fontsize)	
			end
			if goh then
				etoilemanquantetxt.size=17
			end
			etoilemanquantetxt:setFillColor(0.8,0.8,0)
			etoilemanquantetxt:setEmbossColor(colortextemb)
			etoilemanquantemonnaie=display.newImage(imbouton.monnaie,4)
			groupeetoilemanquante:insert(etoilemanquantemonnaie)
			etoilemanquantemonnaie.xScale=0.15
			etoilemanquantemonnaie.yScale=0.15
			if not goh then
				etoilemanquantemonnaie.x=etoilemanquantetxt.x+etoilemanquantemonnaie.width*etoilemanquantemonnaie.xScale*0.5+20
				etoilemanquantemonnaie.y=etoilemanquantetxt.y
			else
				etoilemanquantemonnaie.x=etoilemanquantetxt.x+etoilemanquantemonnaie.width*etoilemanquantemonnaie.xScale*0.5--20
				etoilemanquantemonnaie.y=etoilemanquantetxt.y-etoilemanquantetxt.height*0.25
			end
			groupeetoilemanquante.isVisible=false
		else
			boutonrace.hard=display.newImage(imagemenu.race,4)
		
			boutonrace.hard.xScale=boutonrace[1].yScale*boutonrace[1].width/boutonrace.hard.width*0.66
			boutonrace.hard.yScale=boutonrace.hard.xScale -- boutonrace.hard.xScale
			boutonrace.hard.xScale1=boutonrace.hard.xScale
			boutonrace.hard.yScale1=boutonrace.hard.yScale
			boutonrace.hard.x=barver.x+boutonrace.hard.xScale*boutonrace.hard.width*0.6
			boutonrace.hard.y=boutonrace[1].y-(boutonrace[1].yScale*boutonrace[1].height*0.5+boutonrace.hard.xScale*boutonrace.hard.width*0.5)
			boutonrace.hard.hard=false
			boutonracegr:insert(boutonrace.hard)
			boutonrace.hard.isVisible=false
			local function clichard(event)
				if boutonrace.hard.active then
					if not boutonrace.hard.hard then
						local inforaceaff=nil
						if inforace~=nil then
							inforaceaff=inforace.aff
						end
						inforacefunction(4)
						if inforace.aff~=inforaceaff then
							inforace.texte.text=texttraduction.bonusrace[7]..savegameall.gainhard[bpprec.inf2]..texttraduction.bonusrace[8]
						end
						boutonrace.hard.hard=true
						boutonrace.hard.fill.effect = "filter.contrast"

						boutonrace.hard.fill.effect.contrast = 3
						-- boutonrace.hard.fill.effect = "filter.colorPolynomial"

						-- boutonrace.hard.fill.effect.coefficients =
						-- {
						--     0, 0, 1, 1,  --red coefficients
						--     0, 0, 1, 1,  --green coefficients
						--     0, 0, 1, 1,  --blue coefficients
						--     0, 0, 1, 1   --alpha coefficients
						-- }

						-- boutonrace.hard.fill.effect = "filter.sepia"
						-- boutonrace.hard.fill.effect.intensity=-2
						transition.from(boutonrace.hard.fill.effect, { time=500, contrast=1}) --intensity=0 } )
						boutonrace.hard.xScale=boutonrace.hard.xScale1
						boutonrace.hard.yScale=boutonrace.hard.xScale1
						transition.to(boutonrace.hard,{delay=100, time=100,xScale=boutonrace.hard.xScale1*0.9,yScale=boutonrace.hard.xScale1*0.9})
						boutonconf:setFillColor(1,0.05,0.1)
						if not goh then
							boutonconf.fill.effect = "filter.exposure"
							print("hard 1432")
							--transition.to(boutonconf.fill.effect, { time=100, exposure=1.8})
							boutonconf.fill.effect.exposure = 1.8
						end
						letextbandeaubasd.text="1"
						if boutonrace.wave.hard then
							boutonrace.wave.hard=false
							transition.to(boutonrace.wave.fill.effect, { time=500, contrast=1}) -- intensity=0 } )
							transition.to(boutonrace.wave,{delay=100, time=100,xScale=boutonrace.wave.xScale1,yScale=boutonrace.wave.xScale1})
							--boutonconf:setFillColor(1,1,1)
							if not goh then
								boutonconf.fill.effect.exposure=0
							end
							--letextbandeaubasd.text=letextbandeaubasd.text1
							letextbandeaubasg.text=letextbandeaubasg.text1
						end
					else
						boutonrace.hard.hard=false
						transition.to(boutonrace.hard.fill.effect, { time=500, contrast=1}) -- intensity=0 } )
						transition.to(boutonrace.hard,{delay=100, time=100,xScale=boutonrace.hard.xScale1,yScale=boutonrace.hard.xScale1})
						boutonconf:setFillColor(1,1,1)
						if not goh then
							boutonconf.fill.effect.exposure=0
						end
						letextbandeaubasd.text=letextbandeaubasd.text1
					end
				else
					inforacefunction(5)
					if inforace.aff~=inforaceaff then
						inforace.texte.text=texttraduction.bonusrace[9]
					end
				end
			end
			local function creelistener1hard(bouton)
				function bouton:tap(event)
					if not inappaff then
						audio.play( son.uicl1)
						clichard()
					end
				end
				bouton:addEventListener( "tap", bouton)
			end
			creelistener1hard(boutonrace.hard)

			boutonrace.wave=display.newImage(imagemenu.boutonvague,1)
			boutonrace.wave.isVisible=false
			boutonrace.wave.xScale=(boutonrace.hard.xScale*boutonrace.hard.width)/boutonrace.wave.width
			boutonrace.wave.yScale=boutonrace.wave.xScale
			boutonrace.wave.xScale1=boutonrace.wave.xScale
			boutonrace.wave.yScale1=boutonrace.wave.yScale
			boutonrace.wave.x=barver.x-boutonrace.wave.xScale*boutonrace.wave.width*0.6
			boutonrace.wave.y=boutonrace.hard.y
			boutonrace.wave.hard=false
			boutonracegr:insert(boutonrace.wave)
			boutonrace.wave.isVisible=false
			local function clicwave(event)
				if boutonrace.wave.active then
					if not boutonrace.wave.hard then
						local inforaceaff=nil
						if inforace~=nil then
							inforaceaff=inforace.aff
						end
						inforacefunction(6)
						if inforace.aff~=inforaceaff then
							inforace.texte.text=texttraduction.bonusrace[10].."\n"..texttraduction.bonusrace[12]..texttraduction.wave[bpprec.inf3+4*(bpprec.inf2-1)]
						end
						if infswipe.bouton[bpprec.inf1].page[bpprec.inf2].bouton[bpprec.inf3].wave then
							inforace.texte:setFillColor(0.8,0.8,0.1)
						end
						boutonrace.wave.hard=true
						boutonrace.wave.fill.effect = "filter.contrast"

						boutonrace.wave.fill.effect.contrast = 3
						transition.from(boutonrace.wave.fill.effect, { time=500, contrast=1}) --intensity=0 } )
						boutonrace.wave.xScale=boutonrace.wave.xScale1
						boutonrace.wave.yScale=boutonrace.wave.xScale1
						transition.to(boutonrace.wave,{delay=100, time=100,xScale=boutonrace.wave.xScale1*0.9,yScale=boutonrace.wave.xScale1*0.9})
						boutonconf:setFillColor(0,0.05,1)
						if not goh then
							boutonconf.fill.effect = "filter.exposure"
							print("hard 1432")
							--transition.to(boutonconf.fill.effect, { time=100, exposure=1.8})
							boutonconf.fill.effect.exposure = 1.8
						end
						letextbandeaubasd.text="1"
						letextbandeaubasg.text="1"
						if boutonrace.hard.hard then
							boutonrace.hard.hard=false
							transition.to(boutonrace.hard.fill.effect, { time=500, contrast=1}) -- intensity=0 } )
							transition.to(boutonrace.hard,{delay=100, time=100,xScale=boutonrace.hard.xScale1,yScale=boutonrace.hard.xScale1})
							--boutonconf:setFillColor(1,1,1)
							if not goh then
								boutonconf.fill.effect.exposure=0
							end
							--letextbandeaubasd.text=letextbandeaubasd.text1
						end
					else
						boutonrace.wave.hard=false
						transition.to(boutonrace.wave.fill.effect, { time=500, contrast=1}) -- intensity=0 } )
						transition.to(boutonrace.wave,{delay=100, time=100,xScale=boutonrace.wave.xScale1,yScale=boutonrace.wave.xScale1})
						boutonconf:setFillColor(1,1,1)
						if not goh then
							boutonconf.fill.effect.exposure=0
						end
						letextbandeaubasd.text=letextbandeaubasd.text1
						letextbandeaubasg.text=letextbandeaubasg.text1
					end
				else
					inforacefunction(7)
					if inforace.aff~=inforaceaff then
						inforace.texte.text=texttraduction.bonusrace[10].."\n"..texttraduction.bonusrace[11].."\n"..texttraduction.bonusrace[12]..texttraduction.wave[bpprec.inf3+4*(bpprec.inf2-1)]
					end
				end
			end
			local function creelistener1wave(bouton)
				function bouton:tap(event)
					if not inappaff then
						audio.play( son.uicl1)
						clicwave()
					end
				end
				bouton:addEventListener( "tap", bouton)
			end
			creelistener1wave(boutonrace.wave)	
		end
	end
	local boutonmenuprin=display.newImage(imagemenu.bpmenuprin,1)
	local xscalevar=0.12
	if infswipe.qmenu==2 then
		xscalevar=0.16
	end
	boutonmenuprin.xScale=actualcontentwidth/boutonmenuprin.width*xscalevar
	if goh then
		boutonmenuprin.xScale=boutonmenuprin.xScale*0.7
	end
	boutonmenuprin.yScale=boutonmenuprin.xScale
	boutonmenuprin.x=xminscreen+boutonmenuprin.width*boutonmenuprin.xScale*0.5
	boutonmenuprin.y=ymaxscreen-boutonmenuprin.height*boutonmenuprin.yScale*0.5

	function boutonmenuprin:tap(event)
		if not inappaff then
			retourmenu()
		end
	end
	boutonmenuprin:addEventListener( "tap", boutonmenuprin)
	local function affbandeauAffNiveau() -- niveau a tester (onglet 1) et editer le niveau
		imbandeau=display.newGroup()
		imbandeau1=display.newImage(imagemenu.mini,bpprec.inf2) --infswipe.bouton[bpprec.inf1].page[bpprec.inf2].bouton[bpprec.inf3].imbandeau,1)
		imbandeau1.xScale=barver.xScale*barver.width/(imbandeau1.width)*0.5
		imbandeau1.yScale=imbandeau1.xScale*2
		imbandeau1.x=barver.x+imbandeau1.xScale*imbandeau1.width*0.5
		imbandeau1.y=yminscreen+actualcontentheight*0.1+imbandeau1.yScale*imbandeau1.height*0.5
		imbandeau:insert(imbandeau1)
		boutonracegr.isVisible=true
		imagedubandeau=display.newRect(0,0,1,1) --infswipe.bouton[bpprec.inf1].page[bpprec.inf2].bouton[bpprec.inf3].imbandeau,imagenb)
		imagedubandeau.y=imbandeau1.y
		imagedubandeau.x=barver.x
		imbandeau:insert(imagedubandeau)
		boutonconf.isVisible=true
		--if bpprec.inf1==2 then
		boutonconf.yScale=boutonconf.yScale*0.1
			boutonconf.xScale=boutonconf.xScale*0.1--5
		confprix.text="Play"
		confprix.alpha=1
		confprix.isVisible=true
		confprix.x=boutonconf.x
		--end
	end
	local function taponslotsave(event)
		print("sauvegarde à envoyer: "..event.target.i)
		boutontab[1].bouton[event.target.pagenum].bouton[event.target.bouton]:setFrame(6)
		affbandeau(1)
	end
	local function imbandeauxy(imbandeau)
		imbandeau.xScale=barver.xScale*barver.width/(imbandeau.width)*0.78
		imbandeau.yScale=imbandeau.xScale
		if not goh then
			imbandeau.x=barver.x
		else
			imbandeau.x=barver.x+barver.xScale*barver.width*0.05
		end
		imbandeau.y=yminscreen+actualcontentheight*0.14+imbandeau.yScale*imbandeau.height*0.5
		modifMainText(mainText,imbandeau,boutonconf)
		return imbandeau
	end
	local function affbandeauSoumettre(pagenum,bouton) -- choix du niveau a soumettre onglet 1
		imbandeau=display.newImage(imagemenu.mini,bpprec.inf2)
		imbandeau=imbandeauxy(imbandeau)
		groupeslotsave=display.newGroup()
		groupmenu:insert(groupeslotsave)
		for i=1,#infswipe.bouton[2].page[pagenum].bouton do
			local boutsoltsave=display.newImage(imagemenu.boutonmultispawn,1)
			boutsoltsave.x=barver.x
			boutsoltsave.xScale=barver.width*barver.xScale/boutsoltsave.width*0.78*0.9
			while boutsoltsave.xScale*boutsoltsave.height*1.1*#infswipe.bouton[2].page[pagenum].bouton>barver.y+barver.height*barver.yScale*0.5-(imbandeau.y+imbandeau.yScale*imbandeau.height*0.5) do
				boutsoltsave.xScale=boutsoltsave.xScale*0.9
			end
			boutsoltsave.yScale=boutsoltsave.xScale
			boutsoltsave.y=barver.y+barver.height*barver.yScale*0.5+boutsoltsave.yScale*boutsoltsave.height*0.5-(4-i)*boutsoltsave.yScale*boutsoltsave.height*1.1
			boutsoltsave.scale=boutsoltsave.xScale
			boutsoltsave.fill.effect = "filter.sepia"
			boutsoltsave.fill.effect.intensity=0
			groupeslotsave:insert(boutsoltsave)
			boutsoltsave.i=i
			boutsoltsave.pagenum=pagenum
			boutsoltsave.bouton=bouton
			boutsoltsave:addEventListener( "tap",taponslotsave)

			local boutsoltsavetext=display.newEmbossedText(infswipe.bouton[2].page[pagenum].bouton[i].titreText,boutsoltsave.x-boutsoltsave.xScale*boutsoltsave.width*0.5/3,boutsoltsave.y,fonttype,20*fontsize) --native.systemFont,20)
			boutsoltsavetext.xScale=textlong(boutsoltsavetext.text)
			boutsoltsavetext.alpha=0.8
			boutsoltsavetext.yScale=boutsoltsavetext.xScale
			boutsoltsavetext.scale=boutsoltsavetext.yScale
			boutsoltsavetext:setEmbossColor(colortextemb)
			groupeslotsave:insert(boutsoltsavetext)

		end
	end
	local function affbandeauAttente() --attente de niveau onglet 1 bouton 1 attendre 2h ou attendre adversaire
		imbandeau=display.newImage(imagemenu.mini,bpprec.inf2)
		imbandeau=imbandeauxy(imbandeau)
		-- imbandeau.xScale=barver.xScale*barver.width/(imbandeau.width)*0.78
		-- imbandeau.yScale=imbandeau.xScale
		-- imbandeau.x=barver.x
		-- imbandeau.y=yminscreen+actualcontentheight*0.14+imbandeau.yScale*imbandeau.height*0.5
		mainText.text="\n\n\n\n\n\n\n\n\n\n\n\n\nYou have to wait 10 minutes to play another level"
	end
	local function affsolinf(groupepagenum,pagenum,boutonnum)
		-- imbandeau=display.newImage(imagemenu.mini,bpprec.inf2)
		-- imbandeau.xScale=barver.xScale*barver.width/(imbandeau.width)*0.4 --*0.78
		-- imbandeau.yScale=imbandeau.xScale*2
		-- imbandeau.x=barver.x+barver.xScale*barver.width*0.25 -- 5-imbandeau.xScale*imbandeau.width*0.5
		-- imbandeau.y=yminscreen+actualcontentheight*0.14+imbandeau.yScale*imbandeau.height*0.5
		imbandeau=affbuste(infswipe.bouton[groupepagenum].page[pagenum].bouton[boutonnum].soldat,barver.x+barver.width*barver.xScale*0.25,0,barver.width*barver.xScale*0.22,barver.width*barver.xScale*0.22*1.5)
		imbandeau.y=yminscreen+actualcontentheight*0.14+imbandeau.yScale*imbandeau.height*0.5
	end
	local function affbandeauSolLock() --si soldat non deblocable manque xp et pas payer pour l'avoir
		
	end
	local function affbandeauSolUnlock() -- soldat achetable
		boutonconf.isVisible=true
		confprix.isVisible=true
		confprix.alpha=1
		confprix.text=infswipe.bouton[bpprec.inf1].page[bpprec.inf2].bouton[bpprec.inf3].prix
		print("le prix est de "..confprix.text)
	end
	
	local function slotspawntap(event)
		print("event.target.i "..event.target.i)
		local dejautilise=false
		for i=1,#savegamemulti.bouton[bpprec.inf2] do
			if savegamemulti.bouton[bpprec.inf2][i]==infswipe.bouton[bpprec.inf1].page[bpprec.inf2].bouton[bpprec.inf3].soldat then
				dejautilise=true
				slotspawntext[i]:setFillColor(1,0,0)
				slotspawnprix[i]:setFillColor(1,0,0)
				slotspawnbuste[i]:setFillColor(1,0,0)
				slotspawn[i]:setFillColor(1,0,0)
				slotspawntext[event.target.i]:setFillColor(1,0,0)
				slotspawnprix[event.target.i]:setFillColor(1,0,0)
				slotspawnbuste[event.target.i]:setFillColor(1,0,0)
				slotspawn[event.target.i]:setFillColor(1,0,0)
				local function timerdejauti(event)
					slotspawntext[event.source.i]:setFillColor(1,1,1)
					slotspawnprix[event.source.i]:setFillColor(0.4)
					slotspawnbuste[event.source.i]:setFillColor(1,1,1)
					slotspawn[event.source.i]:setFillColor(1,1,1)
					slotspawntext[event.source.i1]:setFillColor(1,1,1)
					slotspawnprix[event.source.i1]:setFillColor(0.4)
					slotspawnbuste[event.source.i1]:setFillColor(1,1,1)
					slotspawn[event.source.i1]:setFillColor(1,1,1)
				end
				local timerdejautilise=timer.performWithDelay(500,timerdejauti)
				timerdejautilise.i=i
				timerdejautilise.i1=event.target.i
			end
		end
		if not dejautilise then
			savegamemulti.bouton[bpprec.inf2][event.target.i]=infswipe.bouton[bpprec.inf1].page[bpprec.inf2].bouton[bpprec.inf3].soldat
			savegamemulti.bouton[bpprec.inf2][event.target.i+4]=infswipe.bouton[bpprec.inf1].page[bpprec.inf2].bouton[bpprec.inf3].point
			slotspawntext[event.target.i].text,slotspawntext[event.target.i].xScale=namesol(savegamemulti.bouton[bpprec.inf2][event.target.i],1) --image[savegamemulti.bouton[bpprec.inf2][event.target.i]].message:sub(1,image[savegamemulti.bouton[bpprec.inf2][event.target.i]].message:len()-2)
			slotspawntext[event.target.i].yScale=slotspawntext[event.target.i].xScale

			slotspawntext[event.target.i].scale=slotspawntext[event.target.i].xScale
			slotspawnprix[event.target.i].text=savegamemulti.bouton[bpprec.inf2][event.target.i+4]
			groupeslotspawn:remove(slotspawnbuste[event.target.i])
			slotspawnbuste[event.target.i]:removeSelf()
			slotspawnbuste[event.target.i]=affbuste(savegamemulti.bouton[bpprec.inf2][event.target.i],slotspawnbuste[event.target.i].x,slotspawnbuste[event.target.i].y,slotspawnbuste[event.target.i].width,slotspawnbuste[event.target.i].height)
			groupeslotspawn:insert(slotspawnbuste[event.target.i])
			transition.from(slotspawntext[event.target.i],{time=500,x=titreText.x,y=titreText.y} )
			transition.from(slotspawnbuste[event.target.i],{time=500,x=imbandeau.x,y=imbandeau.y,xScale=imbandeau.width/(slotspawnbuste[event.target.i].width*slotspawnbuste[event.target.i].xScale),yScale=imbandeau.height/(slotspawnbuste[event.target.i].height*slotspawnbuste[event.target.i].yScale)} )
		end
		tapboutonspawn(slotspawn[event.target.i],slotspawntext[event.target.i],slotspawnbuste[event.target.i],slotspawnprix[event.target.i])
		local loadsave = require("loadsave")
		loadsave.saveTable(savegamemulti, "undeuxtroissoleilmulti.json" )
	end
	local function affbandeauSolGet()
		if groupeslotspawn==nil then
			groupeslotspawn,slotspawn,slotspawntext,slotspawnbuste,slotspawnprix=affboutonspawn(barver.x,barver.y+barver.height*barver.yScale*0.5,barver.width*barver.xScale,bpprec.inf2,nil,barver.y+barver.height*barver.yScale*0.5-(imbandeau.y+imbandeau.yScale*imbandeau.height*0.5))
			for i=1,#slotspawn do
				slotspawn[i]:addEventListener( "tap",slotspawntap)
			end
			-- groupeslotspawn=display.newGroup()
			-- slotspawn={}
			-- slotspawntext={}
			-- for i=1,4 do
			-- 	slotspawn[i]=display.newImage(imagemenu.boutonmultispawn,1)
			-- 	slotspawn[i].x=barver.x
			-- 	slotspawn[i].xScale=(barver.width*barver.xScale)/slotspawn[i].width*0.78*0.9
			-- 	slotspawn[i].yScale=slotspawn[i].xScale
			-- 	slotspawn[i].y=barver.y+barver.height*barver.yScale*0.5-slotspawn[i].yScale*slotspawn[i].height*0.5-(4-i)*slotspawn[i].yScale*slotspawn[i].height*1.1
			-- 	groupeslotspawn:insert(slotspawn[i])
			-- 	slotspawn[i]:addEventListener( "tap",slotspawntap)
			-- 	slotspawn[i].i=i
			-- 	slotspawntext[i]=display.newEmbossedText("",slotspawn[i].x-slotspawn[i].xScale*slotspawn[i].width*0.5/3,slotspawn[i].y,fonttype,20) --native.systemFont,20)
			-- 	slotspawntext[i].text,slotspawntext[i].xScale=namesol(savegamemulti.bouton[bpprec.inf2][i])
			-- 	slotspawntext[i].yScale=slotspawntext[i].xScale
			-- 	slotspawntext[i]:setEmbossColor(colortextemb)
			-- 	groupeslotspawn:insert(slotspawntext[i])
			-- end
			groupmenu:insert(groupeslotspawn)
		else
			groupeslotspawn.isVisible=true
		end
	end
	local function affbandeauDevLock() --si soldat non deblocable manque xp et pas payer pour l'avoir
		imbandeau=display.newImage(imagemenu.mini,bpprec.inf2)
		imbandeau=imbandeauxy(imbandeau)
		-- imbandeau.xScale=barver.xScale*barver.width/(imbandeau.width)*0.78
		-- imbandeau.yScale=imbandeau.xScale
		-- imbandeau.x=barver.x
		-- imbandeau.y=yminscreen+actualcontentheight*0.14+imbandeau.yScale*imbandeau.height*0.5
	end
	local function affbandeauDevUnlock() -- soldat achetable
		imbandeau=display.newImage(imagemenu.mini,bpprec.inf2)
		imbandeau=imbandeauxy(imbandeau)
		-- imbandeau.xScale=barver.xScale*barver.width/(imbandeau.width)*0.78
		-- imbandeau.yScale=imbandeau.xScale
		-- imbandeau.x=barver.x
		-- imbandeau.y=yminscreen+actualcontentheight*0.14+imbandeau.yScale*imbandeau.height*0.5
	end
	local function affbandeauDevGet()
		imbandeau=display.newImage(imagemenu.mini,bpprec.inf2)
		imbandeau=imbandeauxy(imbandeau)
		-- imbandeau.xScale=barver.xScale*barver.width/(imbandeau.width)*0.78
		-- imbandeau.yScale=imbandeau.xScale
		-- imbandeau.x=barver.x
		-- imbandeau.y=yminscreen+actualcontentheight*0.14+imbandeau.yScale*imbandeau.height*0.5
	end
	local function affboutonconfeditplay()
		if savegamemulti.save[bpprec.inf2][bpprec.inf3].exist then
			boutonconf.xScale=boutonconf.xScale1*0.7
			boutonconf.yScale=boutonconf.yScale1
			boutonconf.x=boutonconf.x1-boutonconf.xScale/boutonconf.xScale1*boutonconf.width*1.3
			confprix.text="Play"
			confprix.alpha=1
			confprix.isVisible=true
			confprix.x=boutonconf.x
			
			if boutonconf1==nil then
				boutonconf1=display.newImage(imagemenu.bpconf,1) --"bpconf.png")
				groupmenu:insert(boutonconf1)
			end
			boutonconf1.x=boutonconf.x+boutonconf.xScale/boutonconf.xScale1*boutonconf.width*1.3*2
			boutonconf1.x1=boutonconf.x
			boutonconf1.xScale=boutonconf.xScale
			if goh then
				boutonconf1.yScale=boutonconf1.xScale
			else
				boutonconf1.yScale=boutonconf.yScale
			end
			boutonconf1.y=boutonconf.y
			boutonconf1.isVisible=true
			boutonconf1.fill.effect= "filter.exposure"
			boutonconf1:setFillColor(1,0.05,0.1)
			transition.to(boutonconf1.fill.effect, { time=500, exposure=1.8 } ) 

			if confprix1==nil then
				confprix1=display.newEmbossedText("Edit",boutonconf1.x,boutonconf1.y,fonttype,20*fontsize) --native.systemFont,20)
				confprix1:setEmbossColor(colortextemb)
				groupmenu:insert(confprix1)
			end
			confprix1.text="Edit"
			confprix1.x=boutonconf1.x
			confprix1.y=boutonconf1.y

			transition.from(boutonconf,{delay=100, time=100,xScale=boutonconf.xScale1*1.1*0.5,yScale=boutonconf.yScale1*1.1})
			transition.from(boutonconf1,{delay=100, time=100,xScale=boutonconf.xScale1*1.1*0.5,yScale=boutonconf.yScale1*1.1})
			function boutonconf1:tap(event)
				if not inappaff then
					actionmenu.ordre(bpprec.inf1,bpprec.inf2,bpprec.inf3,"edit")
					destructeur()
				end				
			end
			boutonconf1:addEventListener( "tap", boutonconf1)

			function titreText:tap(event)
				if not inappaff and confprix1~=nil then
					local destructeurchname
					local clicsurgrin=false
					local grouptext=display.newRect(contentcenterx,contentcentery,actualcontentwidth,actualcontentheight)
					local defaultField
					local function submittext(stringName)
						stringName=stringName:gsub('%p','')
						stringName=stringName:gsub('%z','')
						if string.len(stringName)<4 or string.len(stringName)>12  then
							defaultField.text=titreText.text
						else
							stringName=tostring(stringName)
							titreText.text=stringName
							infswipe.bouton[2].page[bpprec.inf2].bouton[bpprec.inf3].texttop=stringName
							boutontab[2].bouton[bpprec.inf2].bouton[bpprec.inf3].texttop.text=stringName
							savegamemulti.save[bpprec.inf2][bpprec.inf3].name=stringName
							local loadsave = require("loadsave")
							loadsave.saveTable(savegamemulti, "undeuxtroissoleilmulti.json" )
						end
						destructeurchname()
					end
					local function textListener( event )
						if ( event.phase == "began" ) then
						elseif ( event.phase == "ended" or event.phase == "submitted" ) then
							local stringName=event.target.text
							submittext(stringName)
							print( event.target.text )
						elseif ( event.phase == "editing" ) then
							clicsurgrin=true
							local function clicsurgrintimer(event)
								clicsurgrin=false
							end
							timer.performWithDelay(50,clicsurgrintimer)
						end
					end
					defaultField = native.newTextField(titreText.x,titreText.y,barver.width*barver.xScale,boutontab[1].yScale*boutontab[1].height)
					if not issimulator then
						defaultField:setTextColor(1,1,1)
					else
						defaultField:setTextColor(0,0,0)
					end
					if not issimulator then
						defaultField.hasBackground=false
					end
					defaultField.text=titreText.text
					defaultField.font=native.newFont(fonttype,18)
					defaultField:addEventListener( titreText.text, textListener )
					titreText.isVisible=false

					local boutonconf=display.newImage(imbouton.monnaie,1)
					boutonconf.xScale=defaultField.width*defaultField.xScale*0.25/boutonconf.width
					boutonconf.yScale=boutonconf.xScale
					boutonconf.x=defaultField.x-defaultField.width*defaultField.xScale*0.5+boutonconf.xScale*boutonconf.width*0.5
					boutonconf.y=defaultField.y+defaultField.height*defaultField.yScale*0.5+boutonconf.yScale*boutonconf.height*0.5
					function boutonconf:tap(event)
						submittext(defaultField.text)
					end
					boutonconf:addEventListener("tap",boutonconf)

					local boutonrefu=display.newImage(imbouton.monnaie,2)
					boutonrefu.xScale=boutonconf.xScale
					boutonrefu.yScale=boutonrefu.xScale
					boutonrefu.x=defaultField.x+defaultField.width*defaultField.xScale*0.5-boutonrefu.xScale*boutonrefu.width*0.5
					boutonrefu.y=defaultField.y+defaultField.height*defaultField.yScale*0.5+boutonrefu.yScale*boutonrefu.height*0.5
					function boutonrefu:tap(event)
						destructeurchname()
					end
					boutonrefu:addEventListener("tap",boutonrefu)


					--local grouptext=display.newRect(contentcenterx,contentcentery,actualcontentwidth,actualcontentheight)
					grouptext.alpha=0.5
					grouptext:setFillColor(0)
					function grouptext:tap(event)
						if clicsurgrin==false then
							destructeurchname()
						end
					end
					grouptext:addEventListener( "tap",grouptext)
					function destructeurchname()
						if grouptext~=nil then
							boutonconf:removeSelf()
							boutonconf=nil
							boutonrefu:removeSelf()
							boutonrefu=nil
							titreText.isVisible=true
							grouptext:removeSelf()
							grouptext=nil
							defaultField:removeSelf()
							defaultField=nil
						end
					end
				end				
			end
			titreText:addEventListener( "tap",titreText)
		else
			confprix.alpha=1
			confprix.isVisible=true
			confprix.x=boutonconf.x
			confprix.text="Edit"
		end
	end
    function affbandeau(typeaction)
    	if boutonconfbis~=nil then
    		groupmenu:remove(boutonconfbis)
    		boutonconfbis:removeSelf()
    		boutonconfbis=nil
    		groupmenu:remove(confprixbis)
			confprixbis:removeSelf()
			confprixbis=nil
    	end
		--print("affbandeau"..bpprec.inf1.." "..bpprec.inf2.." "..bpprec.inf3)
		if groupeslotspawn~=nil then
			groupeslotspawn.isVisible=false
		end
		if imbandeau~=nil then
			groupmenu:remove(imbandeau)
			imbandeau:removeSelf()
			imbandeau=nil
		end
		if groupeslotsave~=nil then
			groupmenu.remove(groupeslotsave)
			groupeslotsave:removeSelf()
			groupeslotsave=nil
		end
		boutonconf.isVisible=false
		if boutonconf1~=nil then
			boutonconf1.isVisible=false
		end
		if boutonracegr~=nil then
			boutonracegr.isVisible=false
		end
		titreText.text=" "
		mainText.text=infswipe.text
		confprix.text=" "
		if confprix1~=nil then
			confprix1.text=""
		end
		if infswipe.qmenu==1 then
			confprixmonnaie.alpha=0
		end
		if infswipe.qmenu==2 then
			boutonracegr.isVisible=false
			if infswipe.qmenu1 then
				groupeetoilemanquante.isVisible=false
			end
		end
		if bpprec.inf1>0 and typeaction>0 then
			--print("affbandeau1")
			if infswipe.imbandeau~=nil then --infswipe.bouton[bpprec.inf1].page[bpprec.inf2].bouton[bpprec.inf3].imbandeau~=nil then
				--print("affbandeau2")
				if infswipe.qmenu==2 then
					imbandeau=display.newGroup()
					local imagenb=1
					if infswipe.qmenu==2 and not infswipe.qmenu1 then
						if bpprec.inf2<=4 then
							imagenb=bpprec.inf3+(bpprec.inf2-1)*4
						end
					end
					if infswipe.qmenu==2 and infswipe.qmenu1 then
						imagenb=16
					end
					if infswipe.qmenu==2 and infswipe.qmenu1 then
						imagedubandeau=display.newEmbossedText(infswipe.bouton[bpprec.inf1].page[bpprec.inf2].bouton[bpprec.inf3].textbandeau,barver.x+15,0,barver.width*barver.xScale*0.9,barver.width*barver.xScale*0.9*0.5,fonttype,24*fontsize)
						if goh then
							imagedubandeau.size=imagedubandeau.size*0.7
						end
						imagedubandeau:setEmbossColor(colortextemb)
					else
						imagedubandeau=display.newImage(infswipe.imbandeau,imagenb) --infswipe.bouton[bpprec.inf1].page[bpprec.inf2].bouton[bpprec.inf3].imbandeau,imagenb)
						imagedubandeau=imbandeauxy(imagedubandeau)
						-- imagedubandeau.xScale=barver.xScale*barver.width/(imagedubandeau.width)*0.78 --*0.9 --*0.8
						-- imagedubandeau.yScale=imagedubandeau.xScale
						-- imagedubandeau.x=barver.x --xmaxscreen-imagedubandeau.xScale*imagedubandeau.width*0.5
					end
					imagedubandeau.y=yminscreen+boutontab[1].scaley*boutontab[1].height+imagedubandeau.height*imagedubandeau.yScale*0.5 --le +20 pour la taille du text
					imbandeau:insert(imagedubandeau)
					-- letextbandeau=display.newText("100 $",barver.x-barver.xScale*barver.width*0.5+30/2,imagedubandeau.y,native.systemFont,30)
					-- letextbandeau:rotate(90)
					-- letextbandeau:setFillColor(0.7,0.7,0)
					letextbandeaubasg=display.newText(" ",barver.x-barver.xScale*barver.width*0.3,imagedubandeau.y+imagedubandeau.height*imagedubandeau.yScale*0.5+15,fonttype,22.5*fontsize) --native.systemFont,30)
					if bpprec.inf3+(bpprec.inf2-1)*4<=16 and not infswipe.qmenu1 then
						letextbandeaubasg.text=leveldata[bpprec.inf3+(bpprec.inf2-1)*4].wave
						letextbandeaubasg.text1=letextbandeaubasg.text
						imgvague=display.newImage(imbouton.vaguesui,1)
						imgvague.x=letextbandeaubasg.x+25
						imgvague.y=letextbandeaubasg.y
						imgvague.xScale=barver.xScale*0.3
						imgvague.yScale=imgvague.xScale
						imbandeau:insert(imgvague)
					else
						letextbandeaubasg.text=""
					end
					letextbandeaubasg:setFillColor(0)
					letextbandeaubasd=display.newText(" ",barver.x+barver.xScale*barver.width*0.15,letextbandeaubasg.y,fonttype,22.5*fontsize) --native.systemFont,30)
					letextbandeaubasd:setFillColor(1,0,0)
					local bpprecinf2=bpprec.inf2
					local bpprecinf3=bpprec.inf3
					if infswipe.qmenu1 then
						if bpprec.inf2==2 then
							bpprecinf3=bpprecinf3+4
							bpprecinf2=bpprecinf2-1
						end
						bpprecinf2=bpprecinf2+4
					end
					letextbandeaubasd.text=leveldata[bpprecinf3+(bpprecinf2-1)*4].life
					letextbandeaubasd.text1=letextbandeaubasd.text
					imgvie=display.newImage(imbouton.batiment,15)
					imgvie.x=letextbandeaubasd.x+25
					imgvie.y=letextbandeaubasd.y
					if not goh then
						imgvie.xScale=barver.xScale*0.20
					else
						imgvie.xScale=barver.xScale*0.30
					end
					imgvie.yScale=imgvie.xScale
					imbandeau:insert(imgvie)
					imbandeau:insert(letextbandeaubasg)
					imbandeau:insert(letextbandeaubasd)
					
					--imbandeau:insert(letextbandeau)
				elseif infswipe.qmenu==1 then
					local numeroimage=1
					if bpprec.inf3==1 then
						numeroimage=1
					elseif bpprec.inf3==2 then
						numeroimage=4
					elseif bpprec.inf3==3 then
						numeroimage=7
					elseif bpprec.inf3==5 then
						numeroimage=3
					elseif bpprec.inf3==6 then
						numeroimage=6
					elseif bpprec.inf3==7 then
						numeroimage=9
					elseif bpprec.inf3==9 then
						numeroimage=2
					elseif bpprec.inf3==10 then
						numeroimage=5
					elseif bpprec.inf3==11 then
						numeroimage=8
					elseif bpprec.inf3==4 then
						numeroimage=10
					elseif bpprec.inf3==8 then
						numeroimage=12
					elseif bpprec.inf3==12 then
						numeroimage=11
					end
					print("bpprec.inf1 "..bpprec.inf1)
					imbandeau=display.newImage(infswipe.bouton[bpprec.inf1].page[bpprec.inf2].imbandeau,numeroimage) --infswipe.bouton[bpprec.inf1].page[bpprec.inf2].bouton[bpprec.inf3].imbandeau,1)
					imbandeau=imbandeauxy(imbandeau)
					-- imbandeau.xScale=barver.xScale*barver.width/(imbandeau.width)*0.78
					-- imbandeau.yScale=imbandeau.xScale
					-- imbandeau.x=barver.x
					-- imbandeau.y=yminscreen+actualcontentheight*0.14+imbandeau.yScale*imbandeau.height*0.5 -- +boutontab[1].scaley*boutontab[1].height+20+ imbandeau.height*imbandeau.yScale*0.5 --le +20 pour la taille du text
					-- imbandeau.fill.effect = "filter.emboss"
					-- imbandeau.fill.effect.intensity = 0.4
					imbandeau.fill.effect = "filter.sepia"
					imbandeau.fill.effect.intensity =0
					--imbandeau:setFillColor(0.5) -- ici imbandeau
				else
					boutonracegr.isVisible=false
					-- determiner img a aff pour multi. faire varier le truc en fonction de l'onglet
					if bpprec.inf1==1 then
						print("frame "..boutontab[bpprec.inf1].bouton[bpprec.inf2].bouton[bpprec.inf3].frame)
						if boutontab[bpprec.inf1].bouton[bpprec.inf2].bouton[bpprec.inf3].frame==2 then --si niveau dispo a tester
							affbandeauAffNiveau()
						elseif boutontab[bpprec.inf1].bouton[bpprec.inf2].bouton[bpprec.inf3].frame==4 then-- niveau a soumettre
							affbandeauSoumettre(bpprec.inf2,bpprec.inf3)
						else -- niveau en attente de reponse ou attendre deux h pour bp 1
							print("affattente")
							affbandeauAttente()
						end
					elseif bpprec.inf1==2 then -- niveau a editer (toujour la meme interface et meme que niveau a tester, il y a juste le bouton du bas qui change et le titre)
						affbandeauAffNiveau()
					elseif bpprec.inf1==3 then -- debloquage de soldat et mise dans les slots
						affsolinf(bpprec.inf1,bpprec.inf2,bpprec.inf3)
						if boutontab[bpprec.inf1].bouton[bpprec.inf2].bouton[bpprec.inf3].frame==2 then -- si manque d'xp
							affbandeauSolLock()
						elseif boutontab[bpprec.inf1].bouton[bpprec.inf2].bouton[bpprec.inf3].frame==4 then-- si pas acheter
							affbandeauSolUnlock()
						else -- disponible
							affbandeauSolGet()
						end
					else -- devellopement
						if boutontab[bpprec.inf1].bouton[bpprec.inf2].bouton[bpprec.inf3].frame==2 then-- si pas debloquable et ou manque xp
							affbandeauDevLock()
						elseif boutontab[bpprec.inf1].bouton[bpprec.inf2].bouton[bpprec.inf3].frame==4 then-- si pas acheter
							affbandeauDevUnlock()
						else -- disponible
							affbandeauDevGet()
						end
					end
					print("aff menu multi")
				end
				groupmenu:insert(imbandeau)
			end
			--if infswipe.bouton[bpprec.inf1].page[bpprec.inf2].bouton[bpprec.inf3].titreText~=nil then
			if infswipe.qmenu==1 then
				titreText.text=infswipe.bouton[bpprec.inf1].page[bpprec.inf2].bouton[bpprec.inf3].titreText
			elseif infswipe.qmenu==2 then
				if not infswipe.qmenu1 then
					titreText.text=infswipe.bouton[bpprec.inf1].page[bpprec.inf2].bouton[bpprec.inf3].mainText --titreText
				else
					titreText.text=infswipe.bouton[bpprec.inf1].page[bpprec.inf2].bouton[bpprec.inf3].texttop
				end
			else
				if bpprec.inf1==3 or bpprec.inf1==2 then
					titreText.text=infswipe.bouton[bpprec.inf1].page[bpprec.inf2].bouton[bpprec.inf3].titreText
					mainText.text=infswipe.bouton[bpprec.inf1].page[bpprec.inf2].bouton[bpprec.inf3].mainText
				elseif bpprec.inf1==1 then
					titreText.text=infswipe.bouton[bpprec.inf1].page[bpprec.inf2].bouton[bpprec.inf3].titreText
				else

					--mettre ici
					titreText.text="sdf"
					mainText.text="sgr\n<segt\n<segt\n<segt\n<segt\n<segt\n<segt\n<segt\n<segt\n<segt\n<segt\n<segt\n<segt"
					--mainText.y=imbandeau.y+imbandeau.height*imbandeau.yScale*0.5+15
				end
			end
			--end
			if infswipe.qmenu~=3 then
				local xpmanquant --cas ou on clique sur un general deja debloquer pour le levelup
				local pasderniergene
				if infswipe.bouton[bpprec.inf1].page[bpprec.inf2].bouton[bpprec.inf3].mainText~=nil then
					mainText.text=infswipe.bouton[bpprec.inf1].page[bpprec.inf2].bouton[bpprec.inf3].mainText
					if infswipe.qmenu==1 then
						local valide
						print("here")
						miseajourgeneaff(bpprec.inf1,bpprec.inf2,bpprec.inf3,infswipe,titreText,mainText,boutontab,false,boutonconf,infswipe.qmenu)
						valide,xpmanquant,pasderniergene=recoitinfogene(bpprec.inf1,bpprec.inf2,bpprec.inf3,infswipe.qmenu)

						-- local j=bpprec.inf1
						-- local i=bpprec.inf2
						-- local k=bpprec.inf3
						-- calcultest1=(j-1)*6*13+(i-1)*13+k
						-- if savegamedev[calcultest1]==1 then
						-- 	if j==3 and i==1 then
						-- 		local valide=false
						-- 		local raceswipe=0
						-- 		local niveaugene=0
						-- 		if k<=3 then
						-- 			valide=true
						-- 			raceswipe=1
						-- 			niveaugene=k
						-- 		elseif k>=5 and k<=7 then
						-- 			valide=true
						-- 			raceswipe=0
						-- 			niveaugene=k-4
						-- 			print("ici 123")
						-- 		elseif k>=9 and k<=11 then
						-- 			valide=true
						-- 			raceswipe=0
						-- 			niveaugene=k-8
						-- 			print("ici ou pas")
						-- 		end
						-- 		print("ici k="..k)
						-- 		if valide then
						-- 			local numgene=320+raceswipe*10+niveaugene
						-- 			print("le general à "..savegamedev[numgene].." d'experience")
						-- 			local testcpt=1
						-- 			local levelgene=0
						-- 			while testcpt<10 do
						-- 				print("testcpt "..testcpt)
						-- 				print("savegameall.generalxp[testcpt]"..savegameall.generalxp[testcpt])
						-- 				if savegamedev[numgene]<=savegameall.generalxp[testcpt] then
						-- 					levelgene=testcpt
						-- 					testcpt=11
						-- 				end
						-- 				testcpt=testcpt+1
						-- 			end
						-- 			xpmanquant=mathfloor(savegameall.generalxp[levelgene]*0.01)-mathfloor(savegamedev[numgene]*0.01)

						-- 			titreText.text=titreText.text.." lvl "..levelgene
						-- 			mainText.text="\n\n\n\n\nlvl "..levelgene.." xp "..xpactuel.."/"..xpppourlevelup.."\n\n\nBuy "..xpmanquant.." XP to\nget the general\nto level "..levelgene+1

						-- 		end
						-- 	end
						-- 	print("yowdfgsdfhtqdsthsgnhxvj")
						-- end
						-- if valide then
						-- 	titreText.text=titreText.text.." lvl "..levelgene
						-- 	mainText.text="\n\n\n\n\nlvl "..levelgene.." xp "..xpactuel.."/"..xpppourlevelup.."\n\n\nBuy "..xpmanquant.." XP to\nget the general\nto level "..levelgene+1
						-- end
					else
						if not infswipe.qmenu1 then
							mainText.text=""
						end
					end
					if imbandeau~=nil then
						if infswipe.qmenu==2 then
							if goh and infswipe.qmenu1 then
								mainText.y=imgvie.y-7
							else
								mainText.y=imbandeau.y+imbandeau.height*imbandeau.yScale*0.5 --boutonrace[1].y-boutonrace[1].height*boutonrace[1].yScale*0.5-15
							end
						else
							mainText.y=imbandeau.y+imbandeau.height*imbandeau.yScale*0.5 -- +15
						end
					elseif mainText.y~=titreText.y+20 then
						mainText.y=titreText.y+20
					end
				end
				local boutonclic=false
				if infswipe.bouton[bpprec.inf1].page[bpprec.inf2].bouton[bpprec.inf3].prix~=nil then
				
					if infswipe.qmenu==1 then
						if savegameall.bouton0[bpprec.inf1*80+bpprec.inf2*20+bpprec.inf3]==1 then
							boutonclic=true
						end
					else
						if infswipe.qmenu1 then
							if nbetoilett>=infswipe.bouton[bpprec.inf1].page[bpprec.inf2].bouton[bpprec.inf3].condition then
								boutonclic=true
							end
						else
							if savegameall.bouton1[bpprec.inf2*20+bpprec.inf3]==1 then
								boutonclic=true
								print("ici je mets le bouton actif")
							else -- corrige bug gagne niveau mais debloque pas le suivant sauf si on relance l'appli
								local i=bpprec.inf3+(bpprec.inf2-1)*4
								if savegameresul[(i-1)*4+4]~=nil then
									if savegameresul[(i-1)*4+4]~=0 then
										boutonclic=true
									end
								end
							end
						end
					end
					if boutonclic==true then
						local prixdev
						if infswipe.qmenu==2 then
							if (infswipe.qmenu1 and bpprec.inf3+(bpprec.inf2-1)*4~=3 ) or ((not infswipe.qmenu1 and (bpprec.inf3+(bpprec.inf2-1)*4<16) or goh)) then --or issimulator or iswindows then --and bpprec.inf3+(bpprec.inf2-1)*4~=5
								boutonconf.isVisible=true
								confprix.alpha=1
								print("bpprec.inf3+(bpprec.inf2-1)*4="..bpprec.inf3+(bpprec.inf2-1)*4)
							else
								print("Comingsoon")
								prixdev="Comingsoon"
								-- boutonconf.isVisible=true
								-- confprix.alpha=1
								if not goh then
									local groupfond=display.newGroup()
									local fondbidule=display.newRect(contentcenterx,contentcentery,actualcontentwidth,actualcontentheight)
									fondbidule:setFillColor(0,0,0,0.5)
									transition.from(fondbidule,{time=750,transition=easing.outCirc, alpha=0})
									local fenetreconf=display.newImage(imbouton.fenconf,1)
									fenetreconf.x=contentcenterx
									fenetreconf.y=contentcentery
									fenetreconf.xScale=1.5*apparence
									local fenconf=display.newGroup()
									groupfond:insert(fondbidule)
									groupfond:insert(fenconf)
									fenconf:insert(fenetreconf)
									transition.from(fenconf,{time=500,transition=easing.outCirc, x=xmaxscreen})
									local bouton
									fenconf.isVisible=true
									local boutonconf=display.newImage(imbouton.monnaie,1)
									boutonconf.xScale=0.2
									boutonconf.yScale=boutonconf.xScale
									fenconf:insert(boutonconf)
									fenetreconf.yScale=1
									boutonconf.isVisible=true
									boutonconf.x=contentcenterx+fenetreconf.xScale*fenetreconf.width*0.3-boutonconf.xScale*boutonconf.width*0.5
									boutonconf.y=contentcentery+fenetreconf.yScale*fenetreconf.height*0.5-boutonconf.yScale*boutonconf.height*0.5
									apropostext=display.newGroup()
									apropostext.x=contentcenterx
									apropostext.y=contentcentery
									apropostext.text=display.newEmbossedText(texttraduction.gohpub[1],0,-24*apparence,fenetreconf.xScale*fenetreconf.width*0.9,0,fonttype,24*apparence)--,,,fonttype, 24*apparence )
									apropostext.text:setEmbossColor(colortextemb)
									apropostext:insert(apropostext.text)
									apropostext.text2=display.newEmbossedText("",0,apropostext.text.y+apropostext.text.height*0.5+20*apparence,0,0,fonttype,20*apparence*fontsize)--,,,fonttype, 24*apparence )
									apropostext.text2:setEmbossColor(colortextemb)
									apropostext.text2:setFillColor(0,0,204/255)
									if isandroid then
										apropostext.text2.text="Google Play"
									else
										apropostext.text2.text="Apple Store"
									end
									apropostext:insert(apropostext.text2)
									local boutonrefu=display.newImage(imbouton.monnaie,2)
									boutonrefu.xScale=0.2
									boutonrefu.yScale=boutonrefu.xScale
									boutonrefu.x=contentcenterx-fenetreconf.xScale*fenetreconf.width*0.3+boutonconf.xScale*boutonconf.width*0.5
									boutonrefu.y=contentcentery+fenetreconf.yScale*fenetreconf.height*0.5-boutonconf.yScale*boutonconf.height*0.5
									fenconf:insert(boutonrefu)
									local function  removefenetre()
										display.remove(groupfond)
									end
									function groupfond:tap(event)
										removefenetre()
									end
									groupfond:addEventListener("tap",groupfond)
									local function tapsurtruc()
										if isandroid then
											system.openURL("https://play.google.com/store/apps/details?id=com.Artha.goh")
										else
											system.openURL("https://play.google.com/store/apps/details?id=com.Artha.goh")
										end
										--removefenetre()
									end
									function apropostext:tap(event)
										tapsurtruc()
									end
									apropostext:addEventListener("tap",apropostext)
									fenconf:insert(apropostext)
									function boutonconf:tap(event)
										tapsurtruc()
									end
									boutonconf:addEventListener("tap",boutonconf)

								end
							end
							-- if infswipe.bouton[bpprec.inf1].page[bpprec.inf2].bouton[bpprec.inf3].condition~=nil then
							-- 	if 	savegamedev[infswipe.bouton[bpprec.inf1].page[bpprec.inf2].bouton[bpprec.inf3].condition]==0 then
							-- 		autorisationtest=false
							-- 	end
							-- end
						else
							local calcultest1=(bpprec.inf1-1)*6*13+(bpprec.inf2-1)*13+bpprec.inf3
							print("calcultest1"..calcultest1)
							local autorisationtest=true
							if infswipe.bouton[bpprec.inf1].page[bpprec.inf2].bouton[bpprec.inf3].condition~=nil then
								if 	savegamedev[infswipe.bouton[bpprec.inf1].page[bpprec.inf2].bouton[bpprec.inf3].condition]==0 then
									autorisationtest=false
									if infswipe.qmenu==1 and bpprec.inf1==1 and bpprec.inf2==4 and bpprec.inf3==8 then
										if savegamedev[(3-1)*6*13+(1-1)*13+3]~=0 or savegamedev[(3-1)*6*13+(1-1)*13+11]~=0 then
											autorisationtest=true
										end
									end 
								end
							end
							local bpprecinf11=bpprec.inf1
							local bpprecinf21=bpprec.inf2
							local bpprecinf31=bpprec.inf3
							if infswipe.qmenu==1 then
								if bpprec.inf2>2 then
									bpprecinf11=bpprec.inf2-1
									bpprecinf21=1
								end
								calcultest1=(bpprecinf11-1)*6*13+(bpprecinf21-1)*13+bpprecinf31
							end
							print("\n\n\n\n\n"..savegamedev[calcultest1].."\n")
							if autorisationtest then
								print("yo")
							else
								print("pas yo")
							end
							if 	(savegamedev[calcultest1]==0 and autorisationtest) or xpmanquant~=nil or (savegamedev[calcultest1]==1 and autorisationtest and (bpprec.inf2==1 or bpprec.inf2==2 or bpprec.inf2==3) and (bpprec.inf3==4 or bpprec.inf3==8 or bpprec.inf3==12))  then
								boutonconf.isVisible=true
								audio.play( son.uicl1)
								confprix.alpha=1
								if infswipe.qmenu==1 then
									print("confprixmonnaie.alpha=1")
									confprixmonnaie.alpha=1
								end
							elseif pasderniergene==nil then
								print("pasderniergene=nil savegamedev[calcultest1]="..savegamedev[calcultest1])
								confprix.alpha=0.5
								audio.play( son.uicl3)
								if infswipe.qmenu==1 then
									confprixmonnaie.alpha=0.5
								end
							else
								confprix.alpha=0
								confprixmonnaie.alpha=0
							end
							if xpmanquant~=nil then
								prixdev=xpmanquant
							else
								prixdev=infswipe.bouton[bpprec.inf1].page[bpprec.inf2].bouton[bpprec.inf3].prix
								print("pas encore developpé !!! "..calcultest1.." \n\n\n")
								if calcultest1>=157 and calcultest1<=167 and calcultest1~=160 then
									boutonconfbis=display.newImage(imagemenu.bpconf,1)
									boutonconfbis.x=boutonconf.x
									boutonconfbis.y=boutonconf.y-boutonconf.height*boutonconf.yScale
									boutonconfbis.xScale=boutonconf.xScale*0.7
									if goh then
										boutonconfbis.yScale=boutonconfbis.xScale
									else
										boutonconfbis.yScale=boutonconf.yScale*0.7
									end
									boutonconfbis.fill.effect = "filter.brightness"
									boutonconfbis.fill.effect.intensity = 0
									groupmenu:insert(boutonconfbis)
									confprixbis=display.newEmbossedText("try",confprix.x,boutonconfbis.y,fonttype)--,(confprix.fontSize+0)*fontsize)
									confprixbis.size=confprixbis.size*fontsize
									confprixbis.xScale=confprix.xScale
									confprixbis.yScale=confprix.yScale
									confprixbis:setFillColor(0.5)
									confprixbis:setEmbossColor(colortextemb)
									groupmenu:insert(confprixbis)
									function boutonconfbis:tap( event )
										multi=0
										local actionmenu1= require("menucarte")
										local calcultest2=170
										if calcultest1==158 then
											calcultest2=175
										elseif calcultest1==159 then
											calcultest2=174
										elseif calcultest1==162 then
											calcultest2=171
										elseif calcultest1==163 then
											calcultest2=172
										elseif calcultest1==164 then
											calcultest2=179
										elseif calcultest1==166 then
											calcultest2=177
										elseif calcultest1==167 then
											calcultest2=178
										end
										actionmenu1.ordre(1,1,1,-calcultest2)
										destructeur()
									end
									boutonconfbis:addEventListener( "tap",boutonconfbis)
								end
							end
						end
						if infswipe.qmenu==1 then
							confprix:setFillColor(0.8,0,0)
						else
							confprix:setFillColor(1,1,1)
						end
						if prixdev~=nil then -- infswipe.bouton[bpprec.inf1].page[bpprec.inf2].bouton[bpprec.inf3].prix>=0 then
							confprix.text=prixdev
							print("confprix.text "..confprix.text)
							if confprix.text=="Select" then
								confprixmonnaie.alpha=0
							end
						else
							confprix.text="Play"
						end
					end
				end
				if infswipe.qmenu==2 then
					if infswipe.qmenu1 then 
						if boutonclic then
							boutonracegr.isVisible=true
							mainText.text=""
						else
							boutonracegr.isVisible=false
							local etoilemanquant=infswipe.bouton[bpprec.inf1].page[bpprec.inf2].bouton[bpprec.inf3].condition-nbetoilett
							etoilemanquantetxt.text="        "..etoilemanquant.."\nmore to unlock"
							groupeetoilemanquante.isVisible=true
						end
					else
						boutonracegr.isVisible=true
						if infswipe.bouton[bpprec.inf1].page[bpprec.inf2].bouton[bpprec.inf3].textbot==3 then
							boutonrace.hard.isVisible=true
							boutonrace.hard.active=true
							boutonrace.hard.alpha=1
							if boutonrace.hard.hard or boutonrace.wave.hard then
								letextbandeaubasd.text="1"
								boutonrace.hard.xScale=boutonrace.hard.xScale1*0.9
								boutonrace.hard.yScale=boutonrace.hard.yScale1*0.9
							end
						else
							boutonrace.hard.isVisible=true
							boutonrace.hard.alpha=0.5
							boutonrace.hard.active=false
							if boutonrace.hard.hard then 
								boutonrace.hard.hard=false
								boutonrace.hard.fill.effect.intensity=0 --, { time=500, intensity=0 } )
								boutonrace.hard.xScale=boutonrace.hard.xScale1--,{delay=100, time=100,xScale=boutonrace.hard.xScale1,yScale=boutonrace.hard.xScale1})
								boutonrace.hard.yScale=boutonrace.hard.yScale1
								boutonconf:setFillColor(1,1,1)
								if not goh then
									boutonconf.fill.effect.exposure=0
								end
								boutonrace.hard.fill.effect.contrast = 1
							end
						end
						if infswipe.bouton[bpprec.inf1].page[bpprec.inf2].bouton[bpprec.inf3].hard then
							boutonrace.wave.isVisible=true
							boutonrace.wave.active=true
							boutonrace.wave.alpha=1
							if boutonrace.wave.hard then
								letextbandeaubasd.text="1"
								boutonrace.wave.xScale=boutonrace.wave.xScale1*0.9
								boutonrace.wave.yScale=boutonrace.wave.yScale1*0.9
								letextbandeaubasg.text="1"
							end
						else
							boutonrace.wave.isVisible=true
							boutonrace.wave.alpha=0.5
							boutonrace.wave.active=false
							if boutonrace.wave.hard then 
								boutonrace.wave.hard=false
								boutonrace.wave.fill.effect.intensity=0 --, { time=500, intensity=0 } )
								boutonrace.wave.xScale=boutonrace.wave.xScale1--,{delay=100, time=100,xScale=boutonrace.hard.xScale1,yScale=boutonrace.hard.xScale1})
								boutonrace.wave.yScale=boutonrace.wave.yScale1
								boutonconf:setFillColor(1,1,1)
								if not goh then
									boutonconf.fill.effect.exposure=0
								end
								boutonrace.wave.fill.effect.contrast = 1
							end
						end
					end
				end
				if true then
					if infswipe.qmenu==1 then
						local calcultest1=(bpprec.inf1-1)*6*13+(bpprec.inf2-1)*13+bpprec.inf3
						local bpprecinf11=bpprec.inf1
						local bpprecinf21=bpprec.inf2
						local bpprecinf31=bpprec.inf3
						if infswipe.qmenu==1 then
							if bpprec.inf2>2 then
								bpprecinf11=bpprec.inf2-1
								bpprecinf21=1
							end
							calcultest1=(bpprecinf11-1)*6*13+(bpprecinf21-1)*13+bpprecinf31
						end
						if savegamedev[calcultest1]==1 then
							-- imbandeau.fill.effect = "filter.sepia"
							-- imbandeau.fill.effect.intensity=1
						else
							imbandeau.fill.effect = "filter.sepia"
							imbandeau.fill.effect.intensity=1
						end
					else
						-- local boutonclic=false
					 -- 	if savegameall.bouton1[bpprec.inf2*20+bpprec.inf3]==1 then
						-- 	boutonclic=true
						-- else -- corrige bug gagne niveau mais debloque pas le suivant sauf si on relance l'appli
						-- 	local i1=k+(bpprec.inf2-1)*4
						-- 	if savegameresul[(i1-1)*4+4]~=nil then
						-- 		if savegameresul[(i1-1)*4+4]~=0 then
						-- 			boutonclic=true
						-- 		end
						-- 	end
						-- end
						-- if not boutonclic then
						-- 	imbandeau.fill.effect = "filter.sepia"
						-- 	imbandeau.fill.effect.intensity=0.5
						-- end
					end
				end
			end
		end
	end
	local function testim12(testim1)
		function testim1:tap(event)
			if not inappaff then
			--audio.play( son.uicl2)
			--if savegameall.pageaffiche~=nil then
			--	print("savegameall.pageaffiche"..savegameall.pageaffiche.." inf2"..self.inf2)
			--end
			if savegameall.pageaffiche==self.inf2 and bpprec~=nil then
				
				if bpprec.inf1~=self.inf1 or self.inf2~=bpprec.inf2 or self.inf3~=bpprec.inf3 then
					print("yolo"..self.inf1.." "..self.inf2.." "..self.inf3)
					if self~=nil and boutontab~=nil then
						if boutontab[self.inf1]~=nil then
							if boutontab[self.inf1].bouton[self.inf2]~=nil then
								if boutontab[self.inf1].bouton[self.inf2].bouton[self.inf3]~=nil then
									audio.play( son.uicl1)
									--envoyer a une fonction permettant l'aff des infos sur la barre a coté
									-- if boutontab[self.inf1].bouton[self.inf2].bouton[self.inf3]~=nil then
										-- boutontab[self.inf1].bouton[self.inf2].bouton[self.inf3]:setFrame(2)
										print("boutontab[self.inf1="..self.inf1.."].bouton[self.inf2="..self.inf2.."].bouton[self.inf3="..self.inf3.."].frame"..boutontab[self.inf1].bouton[self.inf2].bouton[self.inf3].frame)

										if boutontab[self.inf1].bouton[self.inf2].bouton[self.inf3].frame%2~=0 then
											print("is even")
											boutontab[self.inf1].bouton[self.inf2].bouton[self.inf3]:setFrame(boutontab[self.inf1].bouton[self.inf2].bouton[self.inf3].frame+1)
										else
											print("is bodd")
										end
										if bpprec.inf1>=0 then
											-- boutontab[bpprec.inf1].bouton[bpprec.inf2].bouton[bpprec.inf3]:setFrame(1)
											if boutontab[bpprec.inf1].bouton[bpprec.inf2].bouton[bpprec.inf3].frame%2==0 then
												boutontab[bpprec.inf1].bouton[bpprec.inf2].bouton[bpprec.inf3]:setFrame(boutontab[bpprec.inf1].bouton[bpprec.inf2].bouton[bpprec.inf3].frame-1)
											end
										end
									-- end
									bpprec.inf1=self.inf1
									bpprec.inf2=self.inf2
									bpprec.inf3=self.inf3
									if infswipe.qmenu==1 then
										afficheanim(bpprec.inf1,bpprec.inf2,bpprec.inf3,barver.x)
									end
									affbandeau(1)
									boutontab[self.inf1].bouton[self.inf2].bouton[self.inf3].xScale=boutontab[self.inf1].bouton[self.inf2].bouton[self.inf3].xScale1
									boutontab[self.inf1].bouton[self.inf2].bouton[self.inf3].yScale=boutontab[self.inf1].bouton[self.inf2].bouton[self.inf3].yScale1
									transition.from(boutontab[self.inf1].bouton[self.inf2].bouton[self.inf3],{delay=100, time=100,xScale=boutontab[self.inf1].bouton[self.inf2].bouton[self.inf3].xScale1*0.9,yScale=boutontab[self.inf1].bouton[self.inf2].bouton[self.inf3].yScale1*0.9})
									if infswipe.qmenu==3 then
										if self.inf1==3 then
											boutontab[self.inf1].bouton[self.inf2].bouton[self.inf3].buste.xScale=boutontab[self.inf1].bouton[self.inf2].bouton[self.inf3].buste.xScale1
											boutontab[self.inf1].bouton[self.inf2].bouton[self.inf3].buste.yScale=boutontab[self.inf1].bouton[self.inf2].bouton[self.inf3].buste.yScale1
											transition.from(boutontab[self.inf1].bouton[self.inf2].bouton[self.inf3].buste,{delay=100, time=100,xScale=boutontab[self.inf1].bouton[self.inf2].bouton[self.inf3].buste.xScale1*0.9,yScale=boutontab[self.inf1].bouton[self.inf2].bouton[self.inf3].buste.yScale1*0.9})
										end
									end
									print("etape tuto1")
									if infswipe.qmenu==2 and not infswipe.qmenu1 and not savegame.tuto1 then
										print("etape tuto2")
										if fleche1==nil and not savegame.tuto1 then
											print("etape tuto3")
											fleche1=true
											tutoaffi=2
											boutontab[1].bouton[1].gr:remove(tutoaffim)
											-- boutonracegr:insert(tutoaffim)
											groupmenu:insert(tutoaffim)
											local letextetuto=" "
											if true then -- not savegame.tuto1 then
												-- tutoaffim:remove(fleche)
												fleche.xScale=-fleche.xScale*1.5
												fleche.yScale=fleche.xScale -- -fleche.yScale*1.5
												fleche:rotate(-20)
												-- fleche.alpha=0.8
												fleche.x=boutonconf.x-boutonconf.width*boutonconf.xScale*0.45-fleche.xScale*fleche.width*0.6 -- -boutonrace[2].xScale*boutonrace[2].width*0.5
												fleche.y=boutonconf.y-fleche.yScale*fleche.height*0.3-- -boutonrace[2].yScale*boutonrace[2].height*0.5
												letextetuto=texttraduction.comp[6] --"Choose your race\nand press play"
											end
											texttuto.text=letextetuto
											texttuto.x=fleche.x-fleche.xScale*fleche.width*0.6
											texttuto.y=fleche.y-fleche.yScale*fleche.height*0.3+10
											if fleche.xScale<0 then
												texttuto.x=texttuto.x+texttuto.width*0.4
											else
												texttuto.x=texttuto.x-texttuto.width*0.4
											end
											if fleche.yScale<0 then
												texttuto.y=texttuto.y+texttuto.height*0.3
											else
												texttuto.y=texttuto.y-texttuto.height*0.3
											end
											texttuto.xScale=1.1
											texttuto.yScale=texttuto.xScale
											transition.to(texttuto,{time=100,transition=easing.inCirc,xScale=1,yScale=1})
											-- fleche1=display.newImage(imbouton.fleche,1)
											-- tutoaffim:insert(fleche1)
											-- letextetuto=" "
											-- if true then -- not savegame.tuto1 then
											-- 	fleche1.xScale=0.7
											-- 	fleche1.yScale=0.5
											-- 	fleche1.x=boutonconf.x-fleche1.xScale*fleche1.width*0.5-boutonconf.xScale*boutonconf.width*0.4
											-- 	fleche1.y=boutonconf.y-fleche1.yScale*fleche1.height*0.5-boutonconf.yScale*boutonconf.height*0.4
											-- 	letextetuto="and launch the game"
											-- end
											-- texttuto1=display.newEmbossedText(tutoaffim,letextetuto,fleche1.x-fleche1.xScale*fleche1.width*0.5,fleche1.y-fleche1.yScale*fleche1.height*0.5,fonttype,24)

											-- --texttuto=display.newEmbossedText(tutoaffim,letextetuto,fleche.x-fleche.xScale*fleche.width*0.5,fleche.y-fleche.yScale*fleche.height*0.5,fonttype,24)
											-- if fleche1.xScale<0 then
											-- 	texttuto1.x=texttuto1.x+texttuto1.width*0.4
											-- else
											-- 	texttuto1.x=texttuto1.x-texttuto1.width*0.4
											-- end
											-- if fleche1.yScale<0 then
											-- 	texttuto1.y=texttuto1.y+texttuto1.height*0.3
											-- else
											-- 	texttuto1.y=texttuto1.y-texttuto1.height*0.3
											-- end
											-- texttuto1:setFillColor(0.2,0.2,0.2)
											-- texttuto1:setEmbossColor(colortextemb)
										end
									end							
								else
									print("error swipe 481                                             !")
								end
							else
								print("error swipe 484                                            !")
							end
						else
							print("error swipe 487                                             !")
						end
					else
						print("error swipe 490                                             !")
					end
				else
					boutontab[self.inf1].bouton[self.inf2].bouton[self.inf3].fill.effect = "filter.sepia"
					boutontab[self.inf1].bouton[self.inf2].bouton[self.inf3].fill.effect.intensity =-1
					transition.to( boutontab[self.inf1].bouton[self.inf2].bouton[self.inf3].fill.effect, { time=500, intensity=0 } ) 
					boutontab[self.inf1].bouton[self.inf2].bouton[self.inf3].xScale=boutontab[self.inf1].bouton[self.inf2].bouton[self.inf3].xScale1
					boutontab[self.inf1].bouton[self.inf2].bouton[self.inf3].yScale=boutontab[self.inf1].bouton[self.inf2].bouton[self.inf3].yScale1
					transition.from(boutontab[self.inf1].bouton[self.inf2].bouton[self.inf3],{delay=100, time=100,xScale=boutontab[self.inf1].bouton[self.inf2].bouton[self.inf3].xScale1*0.9,yScale=boutontab[self.inf1].bouton[self.inf2].bouton[self.inf3].yScale1*0.9})
					if infswipe.qmenu==3 then
						if self.inf1==3 then
							boutontab[self.inf1].bouton[self.inf2].bouton[self.inf3].buste.xScale=boutontab[self.inf1].bouton[self.inf2].bouton[self.inf3].buste.xScale1
							boutontab[self.inf1].bouton[self.inf2].bouton[self.inf3].buste.yScale=boutontab[self.inf1].bouton[self.inf2].bouton[self.inf3].buste.yScale1
							transition.from(boutontab[self.inf1].bouton[self.inf2].bouton[self.inf3].buste,{delay=100, time=100,xScale=boutontab[self.inf1].bouton[self.inf2].bouton[self.inf3].buste.xScale1*0.9,yScale=boutontab[self.inf1].bouton[self.inf2].bouton[self.inf3].buste.yScale1*0.9})
						end
					end
					if infswipe.qmenu==1 then
						afficheanim(bpprec.inf1,bpprec.inf2,bpprec.inf3,barver.x)
					end
				end
				boutonconf.xScale=boutonconf.xScale1
				boutonconf.yScale=boutonconf.yScale1
				boutonconf.x=boutonconf.x1
				confprix.x=boutonconf.x
				transition.from(boutonconf,{delay=100, time=100,xScale=boutonconf.xScale1*1.1,yScale=boutonconf.yScale1*1.1})
				if infswipe.qmenu==3 then
					if bpprec.inf1==2 then
						affboutonconfeditplay()
					elseif bpprec.inf1==4 then
						if boutontab[bpprec.inf1].bouton[bpprec.inf2].bouton[bpprec.inf3].frame==4 then
							boutonconf.isVisible=true
							confprix.text=infswipe.bouton[bpprec.inf1].page[bpprec.inf2].bouton[bpprec.inf3].prix
							confprix.isVisible=true
							confprix.alpha=1
						elseif boutontab[bpprec.inf1].bouton[bpprec.inf2].bouton[bpprec.inf3].frame==2 then
							confprix.text=infswipe.bouton[bpprec.inf1].page[bpprec.inf2].bouton[bpprec.inf3].prix
							confprix.alpha=0.5
						end
					end
				end
				print("boutonconf.fill.effect == filter.exposure ")
				local effecttrue=false
				if infswipe.qmenu==2 and not infswipe.qmenu1 then
					if boutonconf.fill.effect~=nil and boutonrace.hard.isVisible then
						if boutonconf.fill.effect.exposure~=nil and boutonrace.hard.hard then
							effecttrue=true
						end
					end
				end
				if effecttrue then
					print("true")
					--local function resetexposure()
						print("true2")
						boutonconf.fill.effect= "filter.exposure"
						boutonconf:setFillColor(1,0.05,0.1)
						print("hard 2496")
						transition.to(boutonconf.fill.effect, { time=500, exposure=1.8 } ) 
						--boutonconf.fill.effect.exposure=1.8
					--end
					-- boutonconf.fill.effect = "filter.sepia"
					-- boutonconf.fill.effect.intensity =-1
					--transition.to(boutonconf.fill.effect, { time=500, intensity=0,onComplete=resetexposure } ) 
				else
					print("False")
					boutonconf.fill.effect = "filter.sepia"
					boutonconf.fill.effect.intensity =-1
					transition.to(boutonconf.fill.effect, { time=500, intensity=0 } ) 
				end
			else
				print("clic sur bouton d'une autre page")
			end
		end
		end
		testim1:addEventListener( "tap", testim1)
	end
	local color = 
	{
	   highlight ={r=0,g=0,b=0},-- { r=0.8, g=0.9, b=1 },
	   shadow = { r=0, g=0, b=0 }
	}
	for j=1,#infswipe.bouton do
		boutontab[j].fond = infswipe.bouton[j].fond
		boutontab[j].bouton={}
		for i=1,#boutontab[j].fond do
			boutontab[j].bouton[i]={}
			boutontab[j].bouton[i].gr=display.newGroup()
			boutontab[j].bouton[i].bouton={}
			print("page "..i)
			for k=1,#infswipe.bouton[j].page[i].bouton do
				if infswipe.qmenu==1 then
					boutontab[j].bouton[i].bouton[k]=display.newSprite(imagemenu.bouton, sequenceData )
					if not goh then
						boutontab[j].bouton[i].bouton[k].xScale=0.11
						boutontab[j].bouton[i].bouton[k].yScale=0.11
					else
						if infswipe.qmenu1 then
							boutontab[j].bouton[i].bouton[k].xScale=0.15
						else
							boutontab[j].bouton[i].bouton[k].xScale=0.3
						end
						boutontab[j].bouton[i].bouton[k].yScale=boutontab[j].bouton[i].bouton[k].xScale
					end
				elseif infswipe.qmenu==2 then
					boutontab[j].bouton[i].bouton[k]=display.newSprite(imagemenu.boutoncarte,sequenceData1) -- sequenceData )
					if not goh then
						boutontab[j].bouton[i].bouton[k].xScale=0.15
						boutontab[j].bouton[i].bouton[k].yScale=0.15
					else
						boutontab[j].bouton[i].bouton[k].xScale=0.2
						boutontab[j].bouton[i].bouton[k].yScale=0.2
					end
				else -- choisi le type d'image du bouton
					if j==1 then
						boutontab[j].bouton[i].bouton[k]=display.newSprite(imagemenu.boutonmulti, sequenceData )
						boutontab[j].bouton[i].bouton[k].xScale=0.11
						boutontab[j].bouton[i].bouton[k].yScale=0.11
					elseif j==2 then
						boutontab[j].bouton[i].bouton[k]=display.newSprite(imagemenu.boutonmultisave, sequenceData )
						boutontab[j].bouton[i].bouton[k].xScale=0.11
						boutontab[j].bouton[i].bouton[k].yScale=0.11
					elseif j==3 then
						boutontab[j].bouton[i].bouton[k]=display.newSprite(imagemenu.boutonmultisol, sequenceData )
						boutontab[j].bouton[i].bouton[k].xScale=0.07
						boutontab[j].bouton[i].bouton[k].yScale=0.07
					else
						boutontab[j].bouton[i].bouton[k]=display.newSprite(imagemenu.bouton, sequenceData )
						if not goh then
							boutontab[j].bouton[i].bouton[k].xScale=0.11
							boutontab[j].bouton[i].bouton[k].yScale=0.11
						else
							boutontab[j].bouton[i].bouton[k].xScale=0.3
							boutontab[j].bouton[i].bouton[k].yScale=boutontab[j].bouton[i].bouton[k].xScale
						end
					end
				end
				boutontab[j].bouton[i].bouton[k].xScale1=boutontab[j].bouton[i].bouton[k].xScale
				boutontab[j].bouton[i].bouton[k].yScale1=boutontab[j].bouton[i].bouton[k].yScale
				boutontab[j].bouton[i].bouton[k]:setFrame(3)
				-- if(infswipe.qmenu==3 and j==4) then
				-- 	boutontab[j].bouton[i].bouton[k]:setFrame(5)
				-- end

				boutontab[j].bouton[i].bouton[k].gr=display.newGroup()
				boutontab[j].bouton[i].gr:insert(boutontab[j].bouton[i].bouton[k].gr)
				-- boutontab[j].bouton[i].bouton[k]:setFrame(1)
				if infswipe.bouton[j].page[i].bouton[k].posi==0 then
					boutontab[j].bouton[i].bouton[k].x=infswipe.bouton[j].page[i].bouton[k].x
					boutontab[j].bouton[i].bouton[k].y=infswipe.bouton[j].page[i].bouton[k].y
				else
					local fini1=false
					local depx8=-1
					local depy8=infswipe.bouton[j].page[i].bouton[k].posi-1
					--print("depdeb"..depy)
					while fini1==false do
						if depy8-4>=0 then
							depy8=depy8-4
							depx8=depx8+1
						else
							fini1=true
						end
					end
					--print("depy"..depy.."depx"..depx)
					boutontab[j].bouton[i].bouton[k].x=depx8*100
					boutontab[j].bouton[i].bouton[k].y=-100+depy8*70 -- -110+
					if infswipe.qmenu==2 then
						boutontab[j].bouton[i].bouton[k].x=boutontab[j].bouton[i].bouton[k].x+30
						boutontab[j].bouton[i].bouton[k].y=boutontab[j].bouton[i].bouton[k].y-25
						if depx8==0 then
							boutontab[j].bouton[i].bouton[k].x=boutontab[j].bouton[i].bouton[k].x+50
						end
					end

				end

				if infswipe.bouton[j].page[i].bouton[k].texttop~=nil then
					boutontab[j].bouton[i].bouton[k].texttop=display.newEmbossedText(infswipe.bouton[j].page[i].bouton[k].texttop,boutontab[j].bouton[i].bouton[k].x,boutontab[j].bouton[i].bouton[k].y-boutontab[j].bouton[i].bouton[k].height*boutontab[j].bouton[i].bouton[k].yScale*0.5-10,fonttype,20*fontsize)--native.systemFont,20)
					if infswipe.qmenu==2 then
						boutontab[j].bouton[i].bouton[k].texttop:setFillColor(0.9,0.9,0.9)--.2,0.2,0.2)
						--if not infswipe.qmenu1 and i==2 then
							--boutontab[j].bouton[i].bouton[k].texttop:setFillColor(0.2,0.4,0.7)
						--end
					else
						boutontab[j].bouton[i].bouton[k].texttop:setFillColor(0.2,0.2,0.2)
					end
					boutontab[j].bouton[i].bouton[k].texttop.alpha=0.7
					boutontab[j].bouton[i].bouton[k].texttop:setEmbossColor(colortextemb)
					-- boutontab[j].bouton[i].bouton[k].texttop:setFillColor(0.14,0.76,0.92)
					-- boutontab[j].bouton[i].bouton[k].texttop.alpha=0.8
					    
					-- boutontab[j].bouton[i].bouton[k].texttop:setEmbossColor( color )
				end
				if infswipe.bouton[j].page[i].bouton[k].textbot~=nil then
					if infswipe.qmenu==2 and (i<=4 and not infswipe.qmenu1) then
						if infswipe.bouton[j].page[i].bouton[k].textbot>0 then
							if infswipe.bouton[j].page[i].bouton[k].textbot==1 then
								boutontab[j].bouton[i].bouton[k].textbot=display.newImage(imbouton.monnaie,5)
							else
								local etoilepiece={}
								local etoilepieceombre={}
								boutontab[j].bouton[i].bouton[k].textbot=display.newGroup()
								for l=1,3 do
									if infswipe.bouton[j].page[i].bouton[k].textbot>=l then
										--print("i"..l)
										if goh then
											etoilepieceombre[l]=display.newImage(imbouton.monnaie,5)
											etoilepieceombre[l]:setFillColor(0)
											etoilepieceombre[l].alpha=0.4
										end
										etoilepiece[l]=display.newImage(imbouton.monnaie,5)
										if infswipe.bouton[j].page[i].bouton[k].textbot==2 then
											etoilepiece[l].x=200-l*130
											etoilepiece[l].y=-15
										else
											etoilepiece[l].x=260-l*130
											if l==2 then
												etoilepiece[l].y=-15
											else
												etoilepiece[l].y=-40
											end
										end
										if goh then
											etoilepieceombre[l].y=etoilepiece[l].y+7
											etoilepieceombre[l].x=etoilepiece[l].x+15
											-- etoilepieceombre[l].yScale=1.1
											-- etoilepieceombre[l].xScale=etoilepieceombre[l].yScale
											boutontab[j].bouton[i].bouton[k].textbot:insert(1,etoilepieceombre[l])	
										end
										boutontab[j].bouton[i].bouton[k].textbot:insert(etoilepiece[l])
									end
								end
							end
							boutontab[j].bouton[i].bouton[k].textbot.x=boutontab[j].bouton[i].bouton[k].x
							boutontab[j].bouton[i].bouton[k].textbot.y=boutontab[j].bouton[i].bouton[k].y+boutontab[j].bouton[i].bouton[k].height*boutontab[j].bouton[i].bouton[k].yScale*0.5+15
							boutontab[j].bouton[i].bouton[k].textbot.xScale=0.15
							boutontab[j].bouton[i].bouton[k].textbot.yScale=0.15
						end
					else
						boutontab[j].bouton[i].bouton[k].textbot=display.newEmbossedText(infswipe.bouton[j].page[i].bouton[k].textbot,boutontab[j].bouton[i].bouton[k].x,boutontab[j].bouton[i].bouton[k].y+boutontab[j].bouton[i].bouton[k].height*boutontab[j].bouton[i].bouton[k].yScale*0.5+10,fonttype,20*fontsize) --native.systemFont,20)
						boutontab[j].bouton[i].bouton[k].textbot:setFillColor(1,1,0)
						boutontab[j].bouton[i].bouton[k].textbot.alpha=0.8
						boutontab[j].bouton[i].bouton[k].textbot:setEmbossColor(colortextemb)
					end
				end
				if infswipe.bouton[j].page[i].bouton[k].textleft~=nil then
					boutontab[j].bouton[i].bouton[k].textleft=display.newText(infswipe.bouton[j].page[i].bouton[k].textleft,boutontab[j].bouton[i].bouton[k].x-boutontab[j].bouton[i].bouton[k].width*boutontab[j].bouton[i].bouton[k].xScale*0.5-20,boutontab[j].bouton[i].bouton[k].y,fonttype,20*fontsize) --native.systemFont,20)
					boutontab[j].bouton[i].bouton[k].textleft:setFillColor(0.1,0.1,0.3)
					boutontab[j].bouton[i].bouton[k].textleft.alpha=0.8
				end
				if (infswipe.qmenu==1 and (i==1 or i==2 or i==3) and (k==4 or k==8 or k==12)) then
					local numeroboutonglob=(j-1)*6*13+(i-1)*13+k
					local bpprecinf11=j
					local bpprecinf21=i
					local bpprecinf31=k
					if infswipe.qmenu==1 then
						if i>2 then
							bpprecinf11=i-1
							bpprecinf21=1
						end
						--bpprecinf21=(bpprec.inf1-1)+bpprecinf21
						numeroboutonglob=(bpprecinf11-1)*6*13+(bpprecinf21-1)*13+bpprecinf31
					end

					if savegamedev[numeroboutonglob]==1 then
						infswipe.bouton[j].page[i].bouton[k].textright="lvl 1"
					end
					if savegamedev21[(i-1)*4+k/4]~=nil then
						if savegamedev21[(i-1)*4+k/4]>0 then
							print("text right level")
							infswipe.bouton[j].page[i].bouton[k].textright="lvl "..savegamedev21[(i-1)*4+k/4]+1
						end
					end
				end
				if infswipe.bouton[j].page[i].bouton[k].textright~=nil then 
					if infswipe.qmenu==1 then
						boutontab[j].bouton[i].bouton[k].textright=display.newEmbossedText(infswipe.bouton[j].page[i].bouton[k].textright,boutontab[j].bouton[i].bouton[k].x+boutontab[j].bouton[i].bouton[k].width*boutontab[j].bouton[i].bouton[k].xScale*0.5+20,boutontab[j].bouton[i].bouton[k].y,fonttype,20*fontsize) --native.systemFont,20)
						--boutontab[j].bouton[i].bouton[k].textright:setFillColor(0.3,0.6,0.9)
						-- boutontab[j].bouton[i].bouton[k].textright.alpha=1
						-- boutontab[j].bouton[i].bouton[k].textright:setEmbossColor( color )
						boutontab[j].bouton[i].bouton[k].textright:setFillColor(0.45,0,0)--.2,0.2,0.2)
						boutontab[j].bouton[i].bouton[k].textright:setEmbossColor(colortextemb)
					else
						boutontab[j].bouton[i].bouton[k].textright=display.newText(infswipe.bouton[j].page[i].bouton[k].textright,boutontab[j].bouton[i].bouton[k].x+boutontab[j].bouton[i].bouton[k].width*boutontab[j].bouton[i].bouton[k].xScale*0.5+20,boutontab[j].bouton[i].bouton[k].y,fonttype,20*fontsize) --native.systemFont,20)
						boutontab[j].bouton[i].bouton[k].textright:setFillColor(0.1,0.1,0.3)
						boutontab[j].bouton[i].bouton[k].textright.alpha=0.8
					end
				end
				boutontab[j].bouton[i].bouton[k].inf1=j
				boutontab[j].bouton[i].bouton[k].inf2=i
				boutontab[j].bouton[i].bouton[k].inf3=k
				-- local function testim12(testim1)
				-- 	function testim1:tap(event)
				-- 		--audio.play( son.uicl2)
				-- 		print("yolo"..self.inf1.." "..self.inf2.." "..self.inf3)
				-- 		if self~=nil and boutontab~=nil then
				-- 			if boutontab[self.inf1]~=nil then
				-- 				if boutontab[self.inf1].bouton[self.inf2]~=nil then
				-- 					if boutontab[self.inf1].bouton[self.inf2].bouton[self.inf3]~=nil then
				-- 						--envoyer a une fonction permettant l'aff des infos sur la barre a coté
				-- 						-- if boutontab[self.inf1].bouton[self.inf2].bouton[self.inf3]~=nil then
				-- 							boutontab[self.inf1].bouton[self.inf2].bouton[self.inf3]:setFrame(2)
				-- 							if bpprec.inf1>=0 then
				-- 								boutontab[bpprec.inf1].bouton[bpprec.inf2].bouton[bpprec.inf3]:setFrame(1)
				-- 							end
				-- 						-- end
				-- 						bpprec.inf1=self.inf1
				-- 						bpprec.inf2=self.inf2
				-- 						bpprec.inf3=self.inf3
				-- 						affbandeau(1)
				-- 					else
				-- 						print("error swipe 481                                             !")
				-- 					end
				-- 				else
				-- 					print("error swipe 484                                            !")
				-- 				end
				-- 			else
				-- 				print("error swipe 487                                             !")
				-- 			end
				-- 		else
				-- 			print("error swipe 490                                             !")
				-- 		end
				-- 	end
				-- 	testim1:addEventListener( "tap", testim1)
				-- end
				testim12(boutontab[j].bouton[i].bouton[k])
				if infswipe.qmenu==1 then

					local calcultest1=(j-1)*6*13+(i-1)*13+k
					local j1=j
					local i1=i
					local k1=k
					if infswipe.qmenu==1 then
						if i>2 then
							j1=i-1
							i1=1
						end
						calcultest1=(j1-1)*6*13+(i1-1)*13+k1
					end
					print("test de bouton "..j.." "..i.." "..k.." j1"..j1.." "..i1.." "..k1)
					if savegamedev[calcultest1]==1 then
						boutontab[j].bouton[i].bouton[k]:setFrame(5)
						if j==1 and i==4 then
							local valide
							local xpmanquant
							local levelgene
							local xpactuel
							local xpppourlevelup
							local numgene
							local derniergene
							local prix
							valide,prix,derniergene,xpmanquant,levelgene,xpactuel,xpppourlevelup,numgene=recoitinfogene(j,i,k,infswipe.qmenu)
							if valide then
								boutontab[j].bouton[i].bouton[k].textright.text="lvl "..levelgene
							end
							-- local valide=false
							-- local raceswipe=0
							-- local niveaugene=0
							-- if k<=3 then
							-- 	valide=true
							-- 	raceswipe=1
							-- 	niveaugene=k
							-- elseif k>=5 and k<=7 then
							-- 	valide=true
							-- 	raceswipe=0
							-- 	niveaugene=k-4
							-- 	print("ici 123")
							-- elseif k>=9 and k<=11 then
							-- 	valide=true
							-- 	raceswipe=0
							-- 	niveaugene=k-8
							-- 	print("ici ou pas")
							-- end
							-- print("ici k="..k)
							-- if valide then
							-- 	local numgene=320+raceswipe*10+niveaugene
							-- 	print("le general à "..savegamedev[numgene].." d'experience")
							-- 	local testcpt=1
							-- 	local levelgene=0
							-- 	while testcpt<10 do
							-- 		print("testcpt "..testcpt)
							-- 		print("savegameall.generalxp[testcpt]"..savegameall.generalxp[testcpt])
							-- 		if savegamedev[numgene]<=savegameall.generalxp[testcpt] then
							-- 			levelgene=testcpt
							-- 			testcpt=11
							-- 		end
							-- 		testcpt=testcpt+1
							-- 	end
							-- 	boutontab[j].bouton[i].bouton[k].textright.text="lvl "..levelgene
							-- end
						end
						print("yowdfgsdfhtqdsthsgnhxvj")
						--boutontab[j].bouton[i].bouton[k]:setFillColor(1,1,0.2)
					else
						if infswipe.bouton[j].page[i].bouton[k].condition~=nil then
							if 	savegamedev[infswipe.bouton[j].page[i].bouton[k].condition]==0 then
								local setframe=true
								if i==4 and k==8 then
									if savegamedev[(3-1)*6*13+(1-1)*13+3]~=0 or savegamedev[(3-1)*6*13+(1-1)*13+11]~=0 then
										setframe=false
									end
								end
								if setframe then
									boutontab[j].bouton[i].bouton[k]:setFrame(1)
								end
								--boutontab[j].bouton[i].bouton[k]:setFillColor(0.5,1,1)
							end
						end
					end
				elseif infswipe.qmenu==2 then
					if infswipe.qmenu1 then --niveau bonus
						print("nbetoilett "..nbetoilett.."j "..j.."i "..i.."k "..k)
						if infswipe.bouton[j].page[i].bouton[k].condition~=nil then
							print("condition ".. infswipe.bouton[j].page[i].bouton[k].condition)
							if nbetoilett>=infswipe.bouton[j].page[i].bouton[k].condition then
								boutontab[j].bouton[i].bouton[k]:setFrame(3)
							else
								boutontab[j].bouton[i].bouton[k]:setFrame(1)
							end
						else

						end
					else
						local boutonclic=false
							print("le niveau est il unlocker "..i*20+k)
					 	if savegameall.bouton1[i*20+k]==1 then
					 		-- print("")
							boutonclic=true
							print("le niveau est unloker "..i*20+k)
						else -- corrige bug gagne niveau mais debloque pas le suivant sauf si on relance l'appli
							local i1=k+(i-1)*4
							if savegameresul[(i1-1)*4+4]~=nil then
								if savegameresul[(i1-1)*4+4]~=0 then
									print("le niveau est unloker1 "..i*20+k.." "..savegameresul[(i1-1)*4+4])
									boutonclic=true
								end
							end
						end
						if not boutonclic then
							boutontab[j].bouton[i].bouton[k]:setFrame(1)
						end
						if infswipe.bouton[j].page[i].bouton[k].hard==true then
							boutontab[j].bouton[i].bouton[k].hard=display.newSprite(effetexplo.fl1,effetexplo["fl1seq"])
							boutontab[j].bouton[i].bouton[k].hard:setFillColor(1,0.8,0.8)
							boutontab[j].bouton[i].bouton[k].hard.x=boutontab[j].bouton[i].bouton[k].x-- -boutontab[j].bouton[i].bouton[k].width*boutontab[j].bouton[i].bouton[k].xScale*0.5-20
							boutontab[j].bouton[i].bouton[k].hard.y=boutontab[j].bouton[i].bouton[k].y-boutontab[j].bouton[i].bouton[k].height*boutontab[j].bouton[i].bouton[k].yScale*0.5-13
							boutontab[j].bouton[i].bouton[k].hard.xScale=0.2
							boutontab[j].bouton[i].bouton[k].hard.yScale=boutontab[j].bouton[i].bouton[k].hard.xScale
							boutontab[j].bouton[i].bouton[k].hard:setSequence("levelup")
							boutontab[j].bouton[i].bouton[k].hard:play()
							boutontab[j].bouton[i].bouton[k].gr:insert(boutontab[j].bouton[i].bouton[k].hard)
						end

						if infswipe.bouton[j].page[i].bouton[k].wave==true then

							boutontab[j].bouton[i].bouton[k].wave=display.newImage(imagemenu.badgevague,1)
							boutontab[j].bouton[i].bouton[k].wave.xScale=0.135
							boutontab[j].bouton[i].bouton[k].wave.yScale=boutontab[j].bouton[i].bouton[k].wave.xScale
							boutontab[j].bouton[i].bouton[k].wave.y=boutontab[j].bouton[i].bouton[k].y-boutontab[j].bouton[i].bouton[k].height*boutontab[j].bouton[i].bouton[k].yScale*0.35+boutontab[j].bouton[i].bouton[k].wave.height*boutontab[j].bouton[i].bouton[k].wave.yScale*0.5
							boutontab[j].bouton[i].bouton[k].wave.x=boutontab[j].bouton[i].bouton[k].x-boutontab[j].bouton[i].bouton[k].wave.width*boutontab[j].bouton[i].bouton[k].wave.xScale*0.5

							boutontab[j].bouton[i].bouton[k].waveombre=display.newImage(imagemenu.badgevague,1)
							boutontab[j].bouton[i].bouton[k].waveombre.xScale=boutontab[j].bouton[i].bouton[k].wave.xScale
							boutontab[j].bouton[i].bouton[k].waveombre.yScale=boutontab[j].bouton[i].bouton[k].wave.xScale
							boutontab[j].bouton[i].bouton[k].waveombre.y=boutontab[j].bouton[i].bouton[k].wave.y+7*0.15*2
							boutontab[j].bouton[i].bouton[k].waveombre.x=boutontab[j].bouton[i].bouton[k].wave.x+15*0.15*2
							boutontab[j].bouton[i].bouton[k].waveombre:setFillColor(0)
							boutontab[j].bouton[i].bouton[k].waveombre.alpha=0.3
						end
						-- 	if infswipe.bouton[j].page[i].bouton[k].condition~=nil then
						-- 		if 	savegamedev[infswipe.bouton[j].page[i].bouton[k].condition]==0 then
						-- 			boutontab[j].bouton[i].bouton[k]:setFrame(1)
						-- 			--boutontab[j].bouton[i].bouton[k]:setFillColor(0.5,1,1)
						-- 		end
						-- 	end
					end
				else
					if j==1 then
						if k==1 then
							boutontab[j].bouton[i].bouton[k]:setFrame(1)
						elseif k==2 then
							boutontab[j].bouton[i].bouton[k]:setFrame(3)
						else
							boutontab[j].bouton[i].bouton[k]:setFrame(5)
						end
					elseif j==2 then
						if savegamemulti.save[i][k].exist then
							boutontab[j].bouton[i].bouton[k]:setFrame(3)
						else
							boutontab[j].bouton[i].bouton[k]:setFrame(1)
						end
					elseif j==3 then
						if savegamemulti.unit[i][k] then
							boutontab[j].bouton[i].bouton[k]:setFrame(5)
						else
							boutontab[j].bouton[i].bouton[k]:setFrame(3)
						end
					elseif j==4 then
						if savegamemulti.dev[k] then
							boutontab[j].bouton[i].bouton[k]:setFrame(5)
						else
							if k==1 or k==4 or k==7 or savegamemulti.dev[k-1] then
								boutontab[j].bouton[i].bouton[k]:setFrame(3)
							else
								boutontab[j].bouton[i].bouton[k]:setFrame(1)
							end
						end
					end
				end
				if infswipe.qmenu==1 then
					if k~=4 and k~=8 and k~=12 then
						-- if i==1 then
						-- 	boutontab[j].bouton[i].bouton[k].line=display.newLine(boutontab[j].bouton[i].gr,boutontab[j].bouton[i].bouton[k].x,boutontab[j].bouton[i].bouton[k].y,boutontab[j].bouton[i].bouton[k].x,boutontab[j].bouton[i].bouton[k].y)
						-- else
							if boutontab[j].bouton[i].bouton[k].frame==5 then
								local torche1test2=display.newSprite(effetexplo.torche1,effetexplo.torche1seq)
								print("rotation of all torch 0")
								if i==4 and (k==3 or k==11) then
									torche1test2.x=(boutontab[j].bouton[i].bouton[k].x)*0.5
									torche1test2.y=(boutontab[j].bouton[i].bouton[k].y-110)*0.5
									print("rotation of all torch 1")
									if k==3 then
										torche1test2:rotate(65)
									else
										torche1test2:rotate(-65)
									end
									if not goh then
										torche1test2.xScale=0.1
									else
										torche1test2.xScale=0.025
									end
									torche1test2.yScale=1/torche1test2.height*(120)
								else
									torche1test2.x=boutontab[j].bouton[i].bouton[k].x
									if not goh then
										torche1test2.xScale=0.1
									else
										torche1test2.xScale=0.025
									end
									torche1test2.yScale=1/torche1test2.height*(44.999999627471) --boutontab[j].bouton[i].bouton[k+1].y-boutontab[j].bouton[i].bouton[k].y)
									local yscalebt=boutontab[j].bouton[i].bouton[k].yScale
									if goh then
										yscalebt=yscalebt*0.8
									end
									torche1test2.y=boutontab[j].bouton[i].bouton[k].y-0.5*torche1test2.height*torche1test2.yScale-boutontab[j].bouton[i].bouton[k].height*yscalebt*0.5
									torche1test2.yScale=-torche1test2.yScale
								end
								torche1test2:setSequence("levelup")
								torche1test2:setFillColor(0)
								torche1test2:play()
								boutontab[j].bouton[i].bouton[k].gr:insert(torche1test2)
							end
						--end
					end
					if k~=1 and k~=5 and k~=9 and not (i==4 and k==12) then
						-- if i==1 then
						-- 	boutontab[j].bouton[i].bouton[k-1].line:append(boutontab[j].bouton[i].bouton[k].x,boutontab[j].bouton[i].bouton[k].y,boutontab[j].bouton[i].bouton[k-1].x,boutontab[j].bouton[i].bouton[k-1].y)
						-- 	if boutontab[j].bouton[i].bouton[k].frame==1 then
						-- 		boutontab[j].bouton[i].bouton[k-1].line.strokeWidth=1
						-- 		boutontab[j].bouton[i].bouton[k-1].line:setStrokeColor(0.1,0.1,0.1,0.4)
						-- 	elseif boutontab[j].bouton[i].bouton[k].frame==3 then
						-- 		boutontab[j].bouton[i].bouton[k-1].line.strokeWidth=2
						-- 		boutontab[j].bouton[i].bouton[k-1].line:setStrokeColor(0.1,0.1,0.1,0.8)
						-- 	else
						-- 		boutontab[j].bouton[i].bouton[k-1].line.strokeWidth=2
						-- 		boutontab[j].bouton[i].bouton[k-1].line:setStrokeColor(0.5,0.5,0)
						-- 	end
						-- else
							if boutontab[j].bouton[i].bouton[k].frame==5 then
								local torche1test=display.newSprite(effetexplo.torche1,effetexplo.torche1seq)
								torche1test.x=boutontab[j].bouton[i].bouton[k].x
								if not goh then
									torche1test.xScale=0.2
								else
									torche1test.xScale=0.05
								end
								local yscalebt=boutontab[j].bouton[i].bouton[k-1].yScale
								if goh then
									yscalebt=yscalebt*0.8
								end
								torche1test.yScale=-1/torche1test.height*(boutontab[j].bouton[i].bouton[k-1].y-(boutontab[j].bouton[i].bouton[k].y+yscalebt*boutontab[j].bouton[i].bouton[k-1].height))
								--torche1test.alpha=0.5
								print("yScale"..(boutontab[j].bouton[i].bouton[k-1].y-(boutontab[j].bouton[i].bouton[k].y+yscalebt*boutontab[j].bouton[i].bouton[k-1].height)))
								torche1test.y=boutontab[j].bouton[i].bouton[k].y-0.5*torche1test.height*torche1test.yScale+boutontab[j].bouton[i].bouton[k].height*yscalebt*0.5
								torche1test.yScale=-torche1test.yScale
								torche1test:setSequence("levelup")
								torche1test:setFillColor(1,0.9,0.9)
								torche1test:play()
								boutontab[j].bouton[i].bouton[k-1].gr:insert(torche1test)

								if i==4 and k==8 then
									local torche1test3=display.newSprite(effetexplo.torche1,effetexplo.torche1seq)
									torche1test3.x=(boutontab[j].bouton[i].bouton[3].x)*0.5
									torche1test3.y=(boutontab[j].bouton[i].bouton[3].y-110)*0.5
									torche1test3:rotate(65)
									if not goh then
										torche1test3.xScale=0.1
									else
										torche1test3.xScale=0.025
									end
									torche1test3.yScale=1/torche1test3.height*(120)
									torche1test3.yScale=-torche1test3.yScale
									torche1test3:setSequence("levelup")
									torche1test3:setFillColor(1,0.9,0.9)
									torche1test3:play()
									boutontab[j].bouton[i].bouton[k-1].gr:insert(torche1test3)

									local torche1test4=display.newSprite(effetexplo.torche1,effetexplo.torche1seq)
									torche1test4.x=(boutontab[j].bouton[i].bouton[k].x+100)*0.5
									torche1test4.y=(boutontab[j].bouton[i].bouton[k].y-110+70)*0.5
									torche1test4:rotate(-65)
									if not goh then
										torche1test4.xScale=0.1
									else
										torche1test4.xScale=0.025
									end
									torche1test4.yScale=1/torche1test4.height*(120)
									torche1test4.yScale=-torche1test4.yScale
									torche1test4:setSequence("levelup")
									torche1test4:setFillColor(1,0.9,0.9)
									torche1test4:play()
									boutontab[j].bouton[i].bouton[k-1].gr:insert(torche1test4)
								end
							end
						--end
	

						--boutontab[j].bouton[i].bouton[k-1].line.yScale=0.1
						--transition.to(boutontab[j].bouton[i].bouton[k-1].line,{time=1000,yScale=1})
					end
					-- local torche1=display.newSprite(effetexplo.torche,effetexplo.torcheseq)
					-- torche1.x=boutontab[j].bouton[i].bouton[k].x
					-- torche1.xScale=0.2
					-- torche1.y=boutontab[j].bouton[i].bouton[k].y-boutontab[j].bouton[i].bouton[k].height*boutontab[j].bouton[i].bouton[k].yScale*0.5
					-- torche1:setSequence("levelup")
					-- torche1:play()
					-- boutontab[j].bouton[i].gr:insert(torche1)
				end
				if infswipe.qmenu==3 and j==4 then
					if k~=3 and k~=6 and k~=9 then
						if boutontab[j].bouton[i].bouton[k].frame==5 then
							local torche1test2=display.newSprite(effetexplo.torche1,effetexplo.torche1seq)
								torche1test2.x=boutontab[j].bouton[i].bouton[k].x
								if not goh then
									torche1test2.xcale=0.1
								else
									torche1test2.xcale=0.025
								end
								torche1test2.yScale=1/torche1test2.height*(44.999999627471) --boutontab[j].bouton[i].bouton[k+1].y-boutontab[j].bouton[i].bouton[k].y)
								local yscalebt=boutontab[j].bouton[i].bouton[k].yScale
								if goh then
									yscalebt=yscalebt*0.8
								end
								torche1test2.y=boutontab[j].bouton[i].bouton[k].y-0.5*torche1test2.height*torche1test2.yScale-boutontab[j].bouton[i].bouton[k].height*yscalebt*0.5
								torche1test2.yScale=-torche1test2.yScale
							torche1test2:setSequence("levelup")
							torche1test2:setFillColor(0)
							torche1test2:play()
							boutontab[j].bouton[i].bouton[k].gr:insert(torche1test2)
						end
					end
					if k~=1 and k~=4 and k~=7 then
						if boutontab[j].bouton[i].bouton[k].frame==5 then
							local torche1test=display.newSprite(effetexplo.torche1,effetexplo.torche1seq)
							torche1test.x=boutontab[j].bouton[i].bouton[k].x
							if not goh then
								torche1test.xScale=0.2
							else
								torche1test.xScale=0.05
							end
							local yscalebt=boutontab[j].bouton[i].bouton[k-1].yScale
							if goh then
								yscalebt=yscalebt*0.8
							end
							torche1test.yScale=-1/torche1test.height*(boutontab[j].bouton[i].bouton[k-1].y-(boutontab[j].bouton[i].bouton[k].y+yscalebt*boutontab[j].bouton[i].bouton[k-1].height))
							--torche1test.alpha=0.5
							print("yScale"..(boutontab[j].bouton[i].bouton[k-1].y-(boutontab[j].bouton[i].bouton[k].y+yscalebt*boutontab[j].bouton[i].bouton[k-1].height)))
							torche1test.y=boutontab[j].bouton[i].bouton[k].y-0.5*torche1test.height*torche1test.yScale+boutontab[j].bouton[i].bouton[k].height*yscalebt*0.5
							torche1test.yScale=-torche1test.yScale
							torche1test:setSequence("levelup")
							torche1test:setFillColor(1,0.9,0.9)
							torche1test:play()
							boutontab[j].bouton[i].bouton[k-1].gr:insert(torche1test)

					
						end
					end
				end
				if infswipe.qmenu==3 and j==3 then
					boutontab[j].bouton[i].bouton[k].buste=affbuste(infswipe.bouton[j].page[i].bouton[k].soldat,boutontab[j].bouton[i].bouton[k].x,boutontab[j].bouton[i].bouton[k].y,boutontab[j].bouton[i].bouton[k].width*boutontab[j].bouton[i].bouton[k].xScale*0.95,boutontab[j].bouton[i].bouton[k].yScale*boutontab[j].bouton[i].bouton[k].height*0.95)
					boutontab[j].bouton[i].bouton[k].gr:insert(boutontab[j].bouton[i].bouton[k].buste)
					boutontab[j].bouton[i].bouton[k].buste.xScale1=boutontab[j].bouton[i].bouton[k].buste.xScale
					boutontab[j].bouton[i].bouton[k].buste.yScale1=boutontab[j].bouton[i].bouton[k].buste.yScale
					-- boutontab[j].bouton[i].bouton[k].buste=display.newImage(infswipe.bouton[j].page[i].bouton[k].buste,1)
					-- boutontab[j].bouton[i].bouton[k].buste.xScale=boutontab[j].bouton[i].bouton[k].width*boutontab[j].bouton[i].bouton[k].xScale*1/boutontab[j].bouton[i].bouton[k].buste.width
					-- boutontab[j].bouton[i].bouton[k].buste.yScale=boutontab[j].bouton[i].bouton[k].buste.xScale
					-- boutontab[j].bouton[i].bouton[k].buste.x=boutontab[j].bouton[i].bouton[k].x
					-- boutontab[j].bouton[i].bouton[k].buste.y=boutontab[j].bouton[i].bouton[k].y-boutontab[j].bouton[i].bouton[k].height*boutontab[j].bouton[i].bouton[k].yScale*0.5+boutontab[j].bouton[i].bouton[k].buste.yScale*boutontab[j].bouton[i].bouton[k].buste.height*0.5
					-- boutontab[j].bouton[i].bouton[k].gr:insert(boutontab[j].bouton[i].bouton[k].buste)
					-- local bustemask=graphics.newMask("Menuprincipal/circlemask.png") --imagemenu.carreblanc)
					-- boutontab[j].bouton[i].bouton[k].buste:setMask(bustemask)
					-- -- boutontab[j].bouton[i].bouton[k].buste.maskX=boutontab[j].bouton[i].bouton[k].x
					-- boutontab[j].bouton[i].bouton[k].buste.maskScaleX=boutontab[j].bouton[i].bouton[k].width*boutontab[j].bouton[i].bouton[k].xScale/(boutontab[j].bouton[i].bouton[k].buste.xScale*boutontab[j].bouton[i].bouton[k].buste.width)--3--boutontab[j].bouton[i].bouton[k].xScale*boutontab[j].bouton[i].bouton[k].width/16
					-- boutontab[j].bouton[i].bouton[k].buste.maskScaleY=boutontab[j].bouton[i].bouton[k].height*boutontab[j].bouton[i].bouton[k].yScale/(boutontab[j].bouton[i].bouton[k].buste.yScale*boutontab[j].bouton[i].bouton[k].buste.height) --0.2--3--boutontab[j].bouton[i].bouton[k].yScale*boutontab[j].bouton[i].bouton[k].height/16
					-- boutontab[j].bouton[i].bouton[k].buste.maskY=(-boutontab[j].bouton[i].bouton[k].buste.y+boutontab[j].bouton[i].bouton[k].y)/boutontab[j].bouton[i].bouton[k].buste.maskScaleY/boutontab[j].bouton[i].bouton[k].buste.yScale
					-- print("k= "..k.." maskY "..boutontab[j].bouton[i].bouton[k].buste.maskY.." maskScaleY "..boutontab[j].bouton[i].bouton[k].buste.maskScaleY.." yScale "..boutontab[j].bouton[i].bouton[k].buste.yScale)
				end
				boutontab[j].bouton[i].bouton[k].gr:insert(boutontab[j].bouton[i].bouton[k])
				if boutontab[j].bouton[i].bouton[k].texttop~=nil then
					boutontab[j].bouton[i].gr:insert(boutontab[j].bouton[i].bouton[k].texttop)
				end
				if boutontab[j].bouton[i].bouton[k].textbot~=nil then
					boutontab[j].bouton[i].gr:insert(boutontab[j].bouton[i].bouton[k].textbot)
				end
				if boutontab[j].bouton[i].bouton[k].textleft~=nil then
					boutontab[j].bouton[i].gr:insert(boutontab[j].bouton[i].bouton[k].textleft)
				end
				if boutontab[j].bouton[i].bouton[k].textright~=nil then
					boutontab[j].bouton[i].gr:insert(boutontab[j].bouton[i].bouton[k].textright)
				end
				if boutontab[j].bouton[i].bouton[k].wave~=nil then
					boutontab[j].bouton[i].bouton[k].gr:insert(boutontab[j].bouton[i].bouton[k].waveombre)
					boutontab[j].bouton[i].bouton[k].gr:insert(boutontab[j].bouton[i].bouton[k].wave)
				end
			end
		end
	end

	for i=1,#infswipe.bouton do
		local chniveaunewmenu=false
		if infswipe.qmenu==2 and infswipe.qmenu1==false then
			chniveaunewmenu=true
		end
		boutontab[i].slide = slideView.new(boutontab[i].bouton,boutontab[i].fond, nil,groupage,boutontab,i,#infswipe.bouton,tab,chniveaunewmenu)
		groupmenu:insert(boutontab[i].slide)
		if i>1 then
			boutontab[i].slide.isVisible=false
		end
	end

	groupmenu:insert(barver)
	-- groupmenu:insert(bandeau)
	groupmenu:insert(titreText)
	groupmenu:insert(mainText)
	if savegame.tuto4 or infswipe.qmenu~=1 then
		groupmenu:insert(boutonconf)
		groupmenu:insert(confprix)
	end
	if infswipe.qmenu==1 then
		if savegame.tuto4 then
			groupmenu:insert(confprixmonnaie)
		end
	end
	groupmenu:insert(boutonmenuprin)
	print("etape1 tuto1 "..infswipe.qmenu)
	if infswipe.qmenu1 then
		print("infswipe.qmenu1 true")
	end
	if savegame.tuto1 then
		print("savegame.tuto1 true")
	end
	if infswipe.qmenu==2 and not infswipe.qmenu1 and not savegame.tuto1 then
		print("etape2 tuto1")
		if true then --not savegame.tuto1 then
			tutoaffi=1
			tutoaffim=display.newGroup()
			boutontab[1].bouton[1].gr:insert(tutoaffim)
			fleche=display.newImage(imbouton.fleche,1)
				fleche.fill.effect = "filter.exposure"
				fleche.fill.effect.exposure =0
				transition.to(fleche.fill.effect, { delay=2000,time=5000, exposure=0.8,transition=easing.continuousLoop,iterations=0 } )
			tutoaffim:insert(fleche)
			local letextetuto=" "
			if true then -- not savegame.tuto1 then
				fleche.xScale=-fleche.xScale*0.4
				fleche.yScale=-fleche.yScale*0.4
				fleche.x=boutontab[1].bouton[1].bouton[1].x-fleche.xScale*fleche.width*0.5--+boutontab[1].bouton[1].bouton[1].xScale*boutontab[1].bouton[1].bouton[1].width*0.25
				fleche.y=boutontab[1].bouton[1].bouton[1].y-fleche.yScale*fleche.height*0.5--+boutontab[1].bouton[1].bouton[1].yScale*boutontab[1].bouton[1].bouton[1].height*0.25
				letextetuto=texttraduction.comp[7] --"Choose your level"
			end
			texttuto=display.newEmbossedText(tutoaffim,letextetuto,fleche.x-fleche.xScale*fleche.width*0.5,fleche.y-fleche.yScale*fleche.height*0.5,actualcontentwidth*0.3,0,fonttype,24*fontsize)
			if fleche.xScale<0 then
				texttuto.x=texttuto.x+texttuto.width*0.4
			else
				texttuto.x=texttuto.x-texttuto.width*0.4
			end
			if fleche.yScale<0 then
				texttuto.y=texttuto.y+texttuto.height*0.3
			else
				texttuto.y=texttuto.y-texttuto.height*0.3
			end
			texttuto:setFillColor(1,0.1,0.1)
			--texttuto:setFillColor(0.9,0.9,0.9)
			texttuto:setEmbossColor(colortextemb)
			texttuto.xScale=1.1
			texttuto.yScale=texttuto.xScale
			transition.to(texttuto,{time=100,transition=easing.inCirc,xScale=1,yScale=1})
		end
	end
	local groupfric,largeurfondtune,hauteurfondtune=afffric(infswipe.qmenu)
	groupfric.x=xminscreen
	groupfric.y=boutontab[1].yScale*boutontab[1].height*0.5+boutontab[1].y --50
	if goh then
		groupfric.y=boutontab[1].yScale*boutontab[1].height*0.75+boutontab[1].y
	end
	if tab~=nil then
		groupfric.y=yminscreen
	end
	if savegame.tuto4 or infswipe.qmenu~=1 then
		groupmenu:insert(groupfric)
	end
	if infswipe.qmenu==2 then -- and infswipe.qmenu1 then
		print("\n\n\n\n\n\n\n\n\nbetoilett "..nbetoilett)
		if goh then
			fondtuneswipe=display.newRect(0,0,400,200)
			fondtuneswipe.alpha=0.01
			fondtuneswipe:setFillColor(0.5)
		else
			fondtuneswipe=display.newImage(imagemenu.fondtune,1)
		end
		fondtuneswipe.xScale=largeurfondtune/fondtuneswipe.width
		fondtuneswipe.yScale=hauteurfondtune/fondtuneswipe.height
		if goh then
			fondtuneswipe.x=groupfric.x+largeurfondtune*1.5
			fondtuneswipe.y=groupfric.y+hauteurfondtune*0.5
		else
			fondtuneswipe.x=groupfric.x+largeurfondtune*0.5
			fondtuneswipe.y=groupfric.y+hauteurfondtune*1.5
		end
		groupmenu:insert(fondtuneswipe)
		nbetoile=display.newEmbossedText(nbetoilett,groupfric.x+largeurfondtune*0.6,groupfric.y+hauteurfondtune+16,fonttype, 24*fontsize )
		if goh then
			nbetoile.x=fondtuneswipe.x*1.1
			nbetoile.y=fondtuneswipe.y
		end
		nbetoile:setFillColor(0.8,0.8,0)
		nbetoile:setEmbossColor(colortextemb)
		groupmenu:insert(nbetoile)
		nbetoilelogo=display.newImage(imbouton.monnaie,4)
		if goh then
			nbetoilelogo.xScale=0.12
		else
			nbetoilelogo.xScale=0.2
		end
		nbetoilelogo.yScale=nbetoilelogo.xScale
		nbetoilelogo.y=nbetoile.y+2
		nbetoilelogo.x=nbetoile.x-10-nbetoilelogo.xScale*nbetoilelogo.width*0.5
		groupmenu:insert(nbetoilelogo)
	end
	-- local lefric=display.newImage(imagemenu.piececristalvide,1)
	-- lefric.xScale=0.3
	-- lefric.yScale=0.3
	-- lefric.x=xminscreen+35
	-- lefric.y=50
	-- groupmenu:insert(lefric)
	-- local fricpos=fric1
	-- if fricpos<0 then
	-- 	fricpos=-fricpos
	-- end
	-- if fricpos>-0.1 then
	-- 	if fricpos<0.1 then
	-- 		fricpos=0
	-- 		print("0")
	-- 	end
	-- end 
	-- lefrictext=display.newText( fricpos/7,xminscreen+70, 50,fonttype,12) -- native.systemFontBold, 12 )--actualcontentwidth/20, 300
	-- print("lefric afficher vaut:"..fricpos/7)
	-- lefrictext:setFillColor( 0.5, 0.5, 1)
	-- groupmenu:insert(lefrictext)

	if infswipe.qmenu==2 then
		groupmenu:insert(boutonracegr)
	end
	for i=1,nbgroupage do --#infswipe.bouton do
		groupmenu:insert(boutontab[i])
		groupmenu:insert(boutontab[i].texte)
	end
	if not savegame.tuto4 and infswipe.qmenu==1 then
		local tutocomplet=display.newGroup()
		groupmenu:insert(tutocomplet)
		local tutocarre=display.newRect(contentcenterx,contentcentery,xmaxscreen-xminscreen,ymaxscreen-yminscreen)
		tutocomplet:insert(tutocarre)
		tutocarre:setFillColor(0)
		tutocarre.alpha=0.5
		tutocomplet:insert(boutonconf)
		tutocomplet:insert(confprix)
		tutocomplet:insert(confprixmonnaie)
		tutocomplet:insert(groupfric)
		--local boutonrouge=display.newRoundedRect(tutocomplet,boutontab[1].bouton[1].bouton[5].x+contentcenterx-actualcontentwidth/3*0.5,boutontab[1].bouton[1].bouton[5].y+contentcentery+0.5*actualcontentheight*0.1,boutontab[1].bouton[1].bouton[5].width*boutontab[1].bouton[1].bouton[5].xScale*1.1,boutontab[1].bouton[1].bouton[5].height*boutontab[1].bouton[1].bouton[5].yScale*1.1,3)
		local boutonrouge=display.newRoundedRect(tutocomplet,boutontab[1].bouton[1].bouton[5].x+contentcenterx-actualcontentwidth/3*0.5,boutontab[1].bouton[1].bouton[5].y+contentcentery+0.5*actualcontentheight*0.1,boutontab[1].bouton[1].bouton[10].x-boutontab[1].bouton[1].bouton[1].x+boutontab[1].bouton[1].bouton[5].width*boutontab[1].bouton[1].bouton[5].xScale*1.1,boutontab[1].bouton[1].bouton[5].height*boutontab[1].bouton[1].bouton[5].yScale*1.1,3)
		boutonrouge.strokeWidth=3
		boutonrouge:setFillColor(1,1,1,0.05)
		boutonrouge:setStrokeColor(1,0,0)
		local textetuto=display.newEmbossedText(texttraduction.comp[8],contentcenterx,contentcentery,fonttype,20*fontsize) -- native.systemFontBold,sizetext)
		textetuto:setEmbossColor(colortextemb)
		textetuto:setFillColor(1)
		textetuto.xScale=1.1
		textetuto.yScale=textetuto.xScale
		transition.to(textetuto,{time=100,transition=easing.inCirc,xScale=1,yScale=1})
		local fleche=display.newImage(imbouton.fleche,1)
		effecttranstion(fleche)
		if goh then
			fleche.yScale=(boutonrouge.y-(textetuto.y+20))/fleche.height*0.8
		else
			fleche.yScale=mathabs(boutonrouge.y-textetuto.y)/fleche.height*0.8
		end
		fleche.xScale=-fleche.yScale
		fleche.x=boutonrouge.x-fleche.width*0.5*fleche.xScale
		if not goh then
			fleche.y=(boutonrouge.y-boutonrouge.height*boutonrouge.yScale+textetuto.y)*0.5
		else
			fleche.y=boutonrouge.y-boutonrouge.height*boutonrouge.yScale
		end
		tutocomplet:insert(fleche)
		local function taptutocarre(event)
			tutocomplet:remove(tutocarre)
			tutocarre:removeSelf()
			tutocarre=nil
			display.remove(textetuto)
			textetuto=nil
			tutocomplet:remove(fleche)
			fleche:removeSelf()
			fleche=nil
			tutocomplet:remove(boutonrouge)
			boutonrouge:removeSelf()
			boutonrouge=nil
			savegame.tuto4=true
			local loadsave = require("loadsave")
			loadsave.saveTable(savegame, "undeuxtroissoleil.json" )
			boutontab[1].bouton[1].bouton[1]:removeEventListener( "tap",taptutocarre)
			boutontab[1].bouton[1].bouton[5]:removeEventListener( "tap",taptutocarre)
			boutontab[1].bouton[1].bouton[9]:removeEventListener( "tap",taptutocarre)
			boutonmenuprin:removeEventListener( "tap",taptutocarre)
		end
		boutontab[1].bouton[1].bouton[1]:addEventListener( "tap",taptutocarre)
		boutontab[1].bouton[1].bouton[5]:addEventListener( "tap",taptutocarre)
		boutontab[1].bouton[1].bouton[9]:addEventListener( "tap",taptutocarre)
		boutonmenuprin:addEventListener( "tap",taptutocarre)
		-- function tutocarre:tap( event )
		-- 	tutocomplet:remove(tutocarre)
		-- 	tutocarre:removeSelf()
		-- 	tutocarre=nil
		-- 	tutocomplet:remove(textetuto)
		-- 	textetuto:removeSelf()
		-- 	textetuto=nil
		-- 	tutocomplet:remove(fleche)
		-- 	fleche:removeSelf()
		-- 	fleche=nil
		-- 	tutocomplet:remove(boutonrouge)
		-- 	boutonrouge:removeSelf()
		-- 	boutonrouge=nil
		-- 	savegame.tuto4=true
		-- 	local loadsave = require("loadsave")
		-- 	loadsave.saveTable(savegame, "undeuxtroissoleil.json" )
		-- end
		-- tutocarre:addEventListener( "tap",tutocarre)
	end
	if infswipe.qmenu==3 then
		local tutocomplet=display.newGroup()
		--groupmenu:insert(tutocomplet)
		local tutocarre=display.newRect(contentcenterx,contentcentery,xmaxscreen-xminscreen,ymaxscreen-yminscreen)
		tutocarre.alpha=0.3
		tutocarre:setFillColor(0)
		local betatext=display.newEmbossedText("Multiplayer is not available, please wait a few week",contentcenterx,contentcentery,(xminscreen-xminscreen)*0.5,80,fonttype,20*fontsize)
		tutocomplet:insert(tutocarre)
		tutocomplet:insert(betatext)
		local function taptutocarre(event)
			tutocomplet:remove(tutocarre)
			tutocarre:removeSelf()
			tutocarre=nil
			tutocomplet:remove(betatext)
			betatext:removeSelf()
			betatext=nil
			tutocomplet:removeSelf()
			tutocomplet=nil
		end
		tutocarre:addEventListener( "tap",taptutocarre)
	end
	function clicbandeau(i)
		local autorisation=false
		boutontab[i].fill.effect = "filter.sepia"
		boutontab[i].fill.effect.intensity =-1
		transition.to(boutontab[i].fill.effect, { time=500, intensity=0 } ) 
		boutontab[i].xScale=boutontab[i].scalex
		boutontab[i].yScale=boutontab[i].scaley
		--boutontab[i].y=boutontab[i].y1
		boutontab[i].y=boutontab[i].y1+boutontab[i].scaley*0.05*boutontab[i].height
		boutontab[i].texte.y=boutontab[i].y1
		transition.from(boutontab[i],{delay=100, time=100,xScale=boutontab[i].scalex*0.85,yScale=boutontab[i].scaley*0.85})
		-- boutontab[i].xScale=boutontab[i].xScale1
		-- boutontab[i].yScale=boutontab[i].yScale1
		-- transition.from(boutontab[i],{delay=100, time=100,xScale=boutontab[i].xScale1*0.9,yScale=boutontab[i].yScale1*0.9})
		if infswipe.bouton[1].bandeau~=nil then
			if boutontab[i].frame==1 then
				autorisation=true
			else
				
			end
		elseif not boutontab[i].slide.isVisible then
			autorisation=true
		end
		if autorisation==true then
			print("entrer dans le game")
			if bpprec.inf1>=0 then
				if boutontab[bpprec.inf1].bouton[bpprec.inf2].bouton[bpprec.inf3].frame%2==0 then
					print("numero de la frame pair !!")
					boutontab[bpprec.inf1].bouton[bpprec.inf2].bouton[bpprec.inf3]:setFrame(boutontab[bpprec.inf1].bouton[bpprec.inf2].bouton[bpprec.inf3].frame-1)
				else
					print("numero de la frame ompair !!")
				end
				--boutontab[bpprec.inf1].bouton[bpprec.inf2].bouton[bpprec.inf3]:setFrame(1)
				affbandeau(0)
				--supprimer aff sur bandeau
			end
			bpprec.inf1=-1
			print("changement 1"..i)
			boutontab[i]:setFrame(2)

			-- boutontab[i].xScale=boutontab[i].scalex
			-- boutontab[i].yScale=boutontab[i].scaley
			-- transition.from(boutontab[i],{delay=100, time=100,xScale=boutontab[i].scalex*0.85,yScale=boutontab[i].scaley*0.85})
			if infswipe.bouton[1].bandeau==nil then
				boutontab[i].slide.isVisible=true
			end
			boutontab[i].texte.size=boutontab[i].textet*1.2 --30
			-- boutontab[i].texte.y=boutontab[i].y1 -- +boutontab[i].scaley*0.1*boutontab[i].height
			transition.from(boutontab[i].texte,{delay=100, time=100,xScale=boutontab[i].texte.xScale*0.85,yScale=boutontab[i].texte.yScale*0.85})
			if colorbouttoptxt~=nil then
				boutontab[i].texte:setFillColor(colorbouttoptxt[i].red*1.2,colorbouttoptxt[i].green*1.2,colorbouttoptxt[i].blue*1.2)
			else
				boutontab[i].texte:setFillColor(0.8,0.8,0)
			end
			
			for j=1,nbgroupage do
				local autorisation1=false
				if infswipe.bouton[1].bandeau~=nil then
					if boutontab[j].xScale~=boutontab[j].scalex*0.9 then
						autorisation1=true
						print("autorisation1 est ok")
					end
				elseif boutontab[j].slide.isVisible then
					autorisation1=true
				end
				if  autorisation1 and i~=j then
					if infswipe.qmenu==3 then
						if i>=2 then
							xpmulti.text=savegamemulti.xpu.."/"..savegamemulti.xp
						else
							xpmulti.text="lvl : "..savegamemulti.xp
						end
					end
					print("changement 2")
					boutontab[j]:setFrame(1)
					if infswipe.bouton[1].bandeau==nil then
						boutontab[j].slide.isVisible=false
					else
						boutontab[1].slide:jumpToImage1(i)
						--savegameall.pageaffiche=i
						print("jumpto")
					end
					if boutontab[j].xScale~=boutontab[j].scalex*0.9 and boutontab[j].yScale~=boutontab[j].scaley*0.9 then
						transition.to(boutontab[j],{time=100,xScale=boutontab[j].scalex*0.9,yScale=boutontab[j].scaley*0.9,y=boutontab[j].y1+boutontab[j].scaley*0.1*boutontab[j].height})
						transition.to(boutontab[j].texte,{time=100,size=boutontab[j].textet,y=boutontab[j].y1+boutontab[j].scaley*0.1*boutontab[j].height})
					else
						boutontab[j].xScale=boutontab[j].scalex*0.9
						boutontab[j].yScale=boutontab[j].scaley*0.9
						boutontab[j].y=boutontab[j].y1+boutontab[j].scaley*0.1*boutontab[j].height
						boutontab[j].texte.size=boutontab[j].textet
						boutontab[j].texte.y=boutontab[j].y1+boutontab[j].scaley*0.1*boutontab[j].height
					end
					--transition.from(boutontab[j],{delay=100, time=100,xScale=boutontab[i].scalex*0.9*0.9,yScale=boutontab[i].scaley*0.9*0.9})
					 --25
					if colorbouttoptxt~=nil then
						boutontab[j].texte:setFillColor(colorbouttoptxt[j].red,colorbouttoptxt[j].green,colorbouttoptxt[j].blue)
					else
						boutontab[j].texte:setFillColor(1)
					end
					--boutontab[j].texte:setFillColor(1)
				end
			end
		end
	end
	local function creelistener(bouton)
		function bouton:tap(event)
			if not inappaff then
				audio.play( son.uicl1)
				clicbandeau(bouton.i)
			end
		end
		bouton:addEventListener( "tap", bouton)
	end
	for i=1,nbgroupage do --#infswipe.bouton do
		creelistener(boutontab[i])
	end
	if infswipe.qmenu==2 then
		if infswipe.qmenu1==false then
			local frame=1
			for i=1,4 do
				local i1=(i-1)*4
				if savegameresul[(i1-1)*4+4]~=nil then
					if savegameresul[(i1-1)*4+4]~=0 then
						frame=frame+1
						print("le niveau est unloker1 "..i1.." "..savegameresul[(i1-1)*4+4])
					end
				end
			end
			boutontab[1].slide:jumpToImage1(frame)
		else
			if nbetoilett>=infswipe.bouton[1].page[2].bouton[1].condition then
				boutontab[1].slide:jumpToImage1(2)
			end
		end
	end
	if true then
		local pressbouton=false
		function onKeyEvent( event )
		    -- If the "back" key was pressed on Android or Windows Phone, prevent it from backing out of the app
		    if ( event.keyName == "back" or event.keyName=="search" or event.keyName=="menu" ) then
		        local platformName = system.getInfo( "platformName" )
		        if isandroid or ( platformName == "WinPhone" ) then
		        	if not pressbouton then
		        		pressbouton=true
		        		local function timerbouton( event )
		        			pressbouton=false
						end
						timer.performWithDelay( 750, timerbouton )
		        		retourmenu()
		        	end
		            return true
		        end
		    end

		    -- IMPORTANT! Return false to indicate that this app is NOT overriding the received key
		    -- This lets the operating system execute its default handling of the key
		    return false
		end
		Runtime:addEventListener( "key", onKeyEvent )
	end

end