local t = {}--gestion de l'affichage du menu de chargement
t.chargementaff = function (nombre)
	-- local consigne=nombre
	-- local etapeactuel=1
	groupgroupchargement=display.newGroup()
	blackscreen=display.newRect(contentcenterx,contentcentery,actualcontentwidth,actualcontentheight)
	blackscreen:setFillColor(0)
	-- blackscreen=display.newImage(imagemenu.blackscreen,1)
	-- blackscreen.xScale=(actualcontentwidth*0.1)+0.1
	-- blackscreen.yScale=(actualcontentheight*0.1)+0.1
	-- blackscreen.x=contentcenterx
	-- blackscreen.y=contentcentery
	groupgroupchargement:insert(blackscreen)
	-- groupchargement={}
	-- for i=1,4 do
	-- 	groupchargement[i]=display.newGroup()
	-- 	groupgroupchargement:insert(groupchargement[i])
	-- end

	artha=display.newImage(imagemenu.artha,1)
	local largeur=artha.width/actualcontentwidth--1920/1080 dimension de l'image du menu
	local hauteur=artha.height/actualcontentheight
	local zoom=0
	if (largeur<hauteur) then
		zoom=hauteur
	else
		zoom=largeur
	end
	artha.xScale=(1/zoom)-0.01
	artha.yScale=artha.xScale
	artha.x=contentcenterx
	artha.y=yminscreen+artha.xScale*artha.height*0.5 --contentcentery
	groupgroupchargement:insert(artha)
	engrenages=display.newImage(imagemenu.engrenages, 1)
	engrenages.yScale=(actualcontentheight-artha.height*artha.yScale)/engrenages.height -- engrenages.xScale
	engrenages.xScale=engrenages.yScale -- 0.2
	engrenages.x=contentcenterx -- xmaxscreen-engrenages.width*engrenages.xScale*0.5
	engrenages.y=ymaxscreen-engrenages.height*engrenages.yScale*0.5
	if not goh then
		transition.from(engrenages,{time=2000,delay=250,xScale=0.15,yScale=0.15})
	else
		transition.from(engrenages,{time=2000,delay=250,xScale=engrenages.xScale*0.7,yScale=engrenages.xScale*0.7})
	end
	groupgroupchargement:insert(engrenages)

	-- bvide=display.newImage(imagemenu.bchargementvide,1)
	-- bvide.y=actualcontentheight*0.85
	-- bvide.x=contentcenterx
	-- groupchargement[2]:insert(bvide)
	-- bplein=display.newImage(imagemenu.bchargementplein,1)
	-- bplein.y=actualcontentheight*0.85
	-- --bplein.x=contentcenterx-60*0.75
	-- bplein.x=contentcenterx-60*(1-(etapeactuel/consigne))
	-- bplein.xScale=mathfloor(etapeactuel/consigne*10)/10
	-- groupchargement[3]:insert(bplein)
	-- bdeb=display.newImage(imagemenu.bchargementdeb,1)
	-- bdeb.x=bvide.x--15
	-- bdeb.y=bvide.y--10
	-- groupchargement[4]:insert(bdeb)
	if not functionload then
		-- function chargementevo()--demande de remplir un peu plus la bare de chargement
		-- 	print("rentre dans chargementevo\n\n\n\n\n\n\n")
		-- 	-- etapeactuel=etapeactuel+1
		-- 	-- bplein.xScale=mathfloor(etapeactuel/consigne*10)/10
		-- 	-- bplein.x=contentcenterx-60*(1-(etapeactuel/consigne))
		-- end
		-- function chargementartha()--demande de changement du logo de l'entreprise(permet de comparer les deux logos)
		-- 	print("rentre dans chargementartha\n\n\n\n\n\n")
		-- 	-- groupchargement[1]:remove(artha)
		-- 	-- local lex=artha.x
		-- 	-- local ley=artha.y
		-- 	-- local lexscale=artha.xScale
		-- 	-- local leyscale=artha.yScale
		-- 	-- artha:removeSelf()
		-- 	-- artha=nil
		-- 	-- artha=display.newImage(imagemenu.artha1,1)
		-- 	-- artha.x=lex
		-- 	-- artha.y=ley
		-- 	-- artha.xScale=lexscale
		-- 	-- artha.yScale=leyscale
		-- 	-- groupchargement[1]:insert(artha)
		-- end
		function chargementsup()--supression de l'affichage du chargmeent
			if groupgroupchargement~=nil then
				display.remove(blackscreen)
				-- groupgroupchargement:remove(blackscreen)
				-- blackscreen:removeSelf()
				blackscreen=nil
				display.remove(artha)
				-- groupgroupchargement:remove(artha)
				-- artha:removeSelf()
				artha=nil
				display.remove(engrenages)
				-- groupgroupchargement:remove(engrenages)
				-- engrenages:removeSelf()
				engrenages=nil
				-- groupchargement[2]:remove(bvide)
				-- bvide:removeSelf()
				-- bvide=nil
				-- groupchargement[3]:remove(bplein)
				-- bplein:removeSelf()
				-- bplein=nil
				-- groupchargement[4]:remove(bdeb)
				-- bdeb:removeSelf()
				-- bdeb=nil
				-- for i=1,4 do
				-- 	groupgroupchargement:remove(groupchargement[i])
				-- 	groupchargement[i]:removeSelf()
				-- 	groupchargement[i]=nil
				-- end
				-- groupgroupchargement:removeSelf()
				-- groupgroupchargement=nil
			end
		end
	end
end
return(t)