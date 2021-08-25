
local t={}--menu principal du jeu
if changelogmenulud then
	print("changelogmenulud")
	savegame.tuto1=false
	changelogmenulud=false
end
if false and issimulator then
	savegame.tuto3=false
	savegame.tuto2=false
	savegame.tuto1=false
	savegame.tuto4=false
	savegame.bonuspaid=false
elseif false and issimulator then
	savegame.tuto3=true
	savegame.tuto2=true
	savegame.tuto1=true
	savegame.tuto4=true
end
local blurscale=0.25
if display.imageSuffix=="@6x" then
	blurscale=0.1
elseif display.imageSuffix=="@8x" then
	blurscale=0.05
end
local function playunplaychange250(playunplaychange)
	playunplaychange=false
	local etape1faite=false
	local function playunplaychange250ms(event)
		if etape1faite then
			playunplaychange=true
		else
			etape1faite=true
		end
	end
	timer.performWithDelay(250,playunplaychange250ms)
	local cptplayunplaychange250ms10fps=0
	local function playunplaychange250ms10fps(event)
		if cptplayunplaychange250ms10fps<5 then
			cptplayunplaychange250ms10fps=cptplayunplaychange250ms10fps+1
		else
			if etape1faite then
				playunplaychange=true
			else
				etape1faite=true
			end
		end
	end
	Runtime:addEventListener( "enterFrame", playunplaychange250ms10fps )
end
print("\n\n\n\n\nblurscale "..blurscale)
local function setblur(obj,unset)
	print("setblur 52")
	unset=unset or false
	local blurSize=200*blurscale
	if unset then
		blurSize=0
	end
	if obj~=nil then
		if obj.fill~=nil then
			print("objet flou")
			obj.fill.effect.horizontal.blurSize = blurSize
			obj.fill.effect.vertical.blurSize = blurSize
		end
	end
end
local function setblurall(unset,menuludimg,playunplay,finmenu)
	print("setblurall 65")
	unset=unset or false
	if (unset and not playunplay) or (not unset and playunplay) then
		-- if goh then
		-- 	setblur(imagemenuprin,unset)
		-- else
		if not finmenu then
			if unset then
				menuludimg.pourflou.isVisible=false
			else
				menuludimg.pourflou.isVisible=true
			end
			setblur(menuludimg.pourflou,unset)
			-- setblur(menuludimg.montagnes,unset)
			-- setblur(menuludimg.colline,unset)
			-- setblur(menuludimg.geantimg,unset)
			-- setblur(menuludimg.elfimg,unset)
			-- setblur(menuludimg.parchemin,unset)
		end
	end
end
local function transitionblur(obj,value,finmenu,playunplay)
	print("transitionblur 85")
	if not finmenu then
		local actuel=obj.fill.effect.horizontal.blurSize
		local timeactuel=system.getTimer()
		local cpt=3
		local cpt1=1
		local function blurtransistion( event )
			if cpt>=2 then
				cpt=0
				cpt1=-cpt1
				local timeactuel1=system.getTimer()-timeactuel
				if timeactuel1<500 and obj~=nil and ((value==0 and not playunplay) or (value~=0 and playunplay)) and not finmenu then
					if obj.fill~=nil then
						--if cpt1>0 then
							obj.fill.effect.horizontal.blurSize =actuel*(1-timeactuel1/1000)+value*timeactuel1/1000
						--else
							obj.fill.effect.vertical.blurSize =actuel*(1-timeactuel1/1000)+ value*timeactuel1/1000
						--end
					end
				else
					Runtime:removeEventListener("enterFrame",blurtransistion)
				end
			end
			cpt=cpt+1
		    --print ( tostring(event.time/1000) .. " seconds since app started." )
		end 
		Runtime:addEventListener( "enterFrame", blurtransistion )
		transition.to(obj.fill.effect.horizontal,{delay=500,time=500,blurSize=value,tag="menuludtag"} )
		transition.to(obj.fill.effect.vertical,{delay=500,time=500,blurSize=value,tag="menuludtag"} )
		if value==0 then
			transition.to(obj,{delay=500,time=500,alpha=0.01,tag="menuludtag"} )
		else
			transition.to(obj,{time=600,alpha=1,tag="menuludtag"} )
		end
	end
end
local function transitionblurall(value,playunplay,finmenu,menuludimg)
	print("transtionblurall 121")
	value=value or 0
	value=value*blurscale
	if ((value==0 and not playunplay) or (value~=0 and playunplay)) and not finmenu then
		-- if goh then
		-- 	transitionblur(imagemenuprin,value)
		-- else
			menuludimg.pourflou.isVisible=true
			transitionblur(menuludimg.pourflou,value,finmenu,playunplay)
			-- transitionblur(menuludimg.montagnes,value)
			-- transitionblur(menuludimg.colline,value)
			-- transitionblur(menuludimg.geantimg,value)
			-- transitionblur(menuludimg.elfimg,value)
			-- transitionblur(menuludimg.parchemin,value)
		--end
	end
end
function lemain(coffreouvert,aprespartie)--1 pour image deja charger, true pour partie fini qui entraine un retour vers le menu principal
	loadadsnewlife()
	menuactuel=0 -- 0 mainbis, 1 chniveau, 2 chniveaubonus, 3 menudevnew, 4 multi, 5 niveau
	desactivecoroutine=false

	findelapartie=true--indique si une partie est ouverte
	--centre de l'ecran = contentcenterx
	--probleme comment appelle ton le main?
	--chose faite probleme d'anim d'attaque en continue
	--preso qui font exactement la meme trajectoire probleme fin de combat
	--declencheur par un clique pour la premiere vague
	grmain=display.newGroup()
	local typeaff=0 -- type d'affichage sur la fenetre 0, pour rien d'afficher
	local clicqqpart=false
	function clicqqpartf()
		clicqqpart=true
		local function timerclicqq(event)
			clicqqpart=false
		end
		timer.performWithDelay( 50, timerclicqq )
	end
	local imagemenuprin=display.newImage(imagemenu.menu,1)--display.newImage("Menuprincipal/imagemenuprin.png", actualcontentwidth/2,actualcontentheight/2,true)
	imagemenuprin.x=contentcenterx--actualcontentwidth/2
	imagemenuprin.y=contentcentery--actualcontentheight/2
	local sequenceDataboutondev =
		{
		    name="walking",
		    frames= {1,2},
		    time=100,
		    loopCount=1,
		}
	local sequenceDataboutondev1 =
		{
		    name="walking",
		    frames= {3,4},
		    time=100,
		    loopCount=1,
		}
	local sequenceDataboutonmulti =
		{
		    name="walking",
		    frames= {5,6},
		    time=100,
		    loopCount = 1,
		}

	local nbetoilett=0
	for i=1,4 do
		for j=1,4 do
			nbetoilett=nbetoilett+savegameresul[((j+(i-1)*4)-1)*4+3]
		end
	end

	-- local tutoaffi
	-- local tutoaffim
	-- local fleche
	-- local texttuto
	local tutomain=require("tutomain")
	inittutomain()

	local boutonPlay
	local boutonDev
	local boutonbonus
	local boutonplaylud
	local bpreglage
	local clicbouton=true
	local finmenu=false
	local function clicboutonfunc()
		clicbouton=false
		local function clicboutontimer(event)
			clicbouton=true
		end
		timer.performWithDelay(100,clicboutontimer)
	end
	local menuludimg={}
	if not menulud then
		boutonPlay=display.newSprite(imagemenu.BoutonPlay,sequenceDataboutondev1)
		effecttranstion(boutonPlay)
		boutonPlay:setFrame(1)
		boutonPlay.y=248/4

		boutonbonus=display.newSprite(imagemenu.BoutonPlay,sequenceDataboutondev)
		effecttranstion(boutonbonus)
		boutonbonus:setFrame(1)
		boutonbonus.y=248/4
	else
		grouplud=display.newGroup()
		groupboutonplay=display.newGroup()
		grouplud:insert(groupboutonplay)
		groupchainelud=display.newGroup()
		groupboutonplay:insert(groupchainelud)
		if not goh then
			boutonplaylud=display.newSprite(imagemenu.boutonlud,{frames={3,4},time=100,loopCount=1})
		else
			boutonplayludblack=display.newImage(imagemenu.play,1)
			boutonplayludblack:setFillColor(0)
			boutonplayludblack.alpha=0.3
			-- boutonplayludblack.x=2
			-- boutonplayludblack.y=2
			boutonplaylud=display.newSprite(imagemenu.play,{frames={2,1},time=100,loopCount=1})
		end
		boutonplaylud.group=0 -- pour groupboutonplay
		print("insert boutonplaylud in groupboutonplay l103")
		if goh then
			groupboutonplay:insert(boutonplayludblack)
		end
		groupboutonplay:insert(boutonplaylud)
		effecttranstion(boutonplaylud,1)
		boutonplaylud:setFrame(1)
		if not goh then
			boutonplaylud.xScale=actualcontentwidth/2.5/boutonplaylud.width
			boutonplaylud.yScale=boutonplaylud.xScale
			boutonplaylud.x=contentcenterx
			boutonplaylud.y=yminscreen
			boutonplaylud.anchorY=0
		else
			boutonplaylud.xScale=actualcontentwidth/8.9/boutonplaylud.width
			boutonplaylud.yScale=boutonplaylud.xScale
			-- boutonplaylud.x=contentcenterx
			-- boutonplaylud.y=contentcentery
		end
		groupboutonlud=display.newGroup()
		grouplud:insert(groupboutonlud)
		groupboutonlud.x=contentcenterx
		groupboutonlud.y=yminscreen-actualcontentheight
		groupboutonlud.y1=groupboutonlud.y
		groupboutonlud.isVisible=false
		if not goh then
			chainedlud=display.newImage(imagemenu.chainelud,1)
			chainedlud.yScale=actualcontentheight/chainedlud.height
			chainedlud.xScale=chainedlud.yScale
			chainedlud.y=contentcentery
			groupboutonlud:insert(chainedlud)
			chaineglud=display.newImage(imagemenu.chainelud,1)
			chaineglud.yScale=actualcontentheight/chainedlud.height
			chaineglud.xScale=chainedlud.yScale
			chaineglud.y=contentcentery
			groupboutonlud:insert(chaineglud)
		else
			fondgoh=display.newImage(imagemenu.fond,1)
			fondgoh.y=contentcentery
			fondgoh.yScale=actualcontentheight*3/4/fondgoh.height
			fondgoh.xScale=actualcontentwidth*3/4/fondgoh.width
			if fondgoh.xScale>fondgoh.yScale then
				fondgoh.xScale=fondgoh.yScale
			else
				fondgoh.yScale=fondgoh.xScale
			end
			groupboutonlud:insert(fondgoh)
			function fondgoh:tap( event )
				clicqqpartf()
			end
			fondgoh:addEventListener( "tap", fondgoh )
		end
		if goh then
			boutonPlay=display.newSprite(imagemenu.campaign,{frames={1,2},time=100,loupCount=1})
			boutonPlay.xScale=fondgoh.xScale
			boutonPlay.yScale=fondgoh.yScale
			boutonPlay.y=contentcentery-boutonPlay.height*boutonPlay.yScale*0.7
			groupboutonlud:insert(boutonPlay)
			boutonbonus=display.newSprite(imagemenu.campaign,{frames={3,4},time=100,loopCount=1})
			boutonbonus.xScale=boutonPlay.xScale
			boutonbonus.yScale=boutonPlay.yScale
			boutonbonus.y=contentcentery+boutonPlay.height*boutonPlay.yScale*0.7
			groupboutonlud:insert(boutonbonus)
		else
			boutonPlay=display.newSprite(imagemenu.boutonlud,{frames={5,6},time=100,loopCount=1})
			boutonPlay.xScale=boutonplaylud.yScale
			boutonPlay.yScale=boutonPlay.xScale
			boutonPlay.y=yminscreen+boutonPlay.height*0.5*boutonPlay.xScale

			chainedlud.x=boutonPlay.x+2/3*boutonPlay.width*boutonPlay.xScale*0.5
			chaineglud.x=boutonPlay.x-2/3*boutonPlay.width*boutonPlay.xScale*0.5

			groupboutonlud:insert(boutonPlay)
			boutonbonus=display.newSprite(imagemenu.boutonlud,{frames={7,8},time=100,loopCount=1})
			boutonbonus.y=yminscreen+boutonPlay.height*1.5*boutonPlay.xScale
			boutonbonus.xScale=boutonPlay.xScale
			boutonbonus.yScale=boutonPlay.yScale
			groupboutonlud:insert(boutonbonus)
			bpreglage=display.newSprite(imagemenu.boutonlud,{frames={11,12},time=100,loopCount=1})
			bpreglage:setFrame(2)
			bpreglage.xScale=boutonPlay.xScale
			bpreglage.yScale=bpreglage.xScale
			groupboutonlud:insert(bpreglage)
			boutonunplay=display.newSprite(imagemenu.boutonlud,{frames={1,2},time=100,loopCount=1})
			boutonunplay.xScale=boutonPlay.xScale
			boutonunplay.yScale=boutonPlay.yScale
			groupboutonlud:insert(boutonunplay)
			if false and ( nbetoilett>18 or issimulator) then
				boutonmulti=display.newSprite(imagemenu.boutonlud,{frames={9,10},time=100,loopCount=1})
				boutonmulti.xScale=boutonPlay.xScale
				boutonmulti.yScale=boutonPlay.yScale
				boutonmulti.y=yminscreen+boutonPlay.height*2.5*boutonPlay.xScale
				bpreglage.y=yminscreen+boutonPlay.height*3.5*boutonPlay.xScale
				boutonunplay.y=yminscreen+boutonPlay.height*4.5*boutonPlay.xScale
				groupboutonlud:insert(boutonmulti)
			else
				bpreglage.y=yminscreen+boutonPlay.height*2.5*boutonPlay.xScale
				boutonunplay.y=yminscreen+boutonPlay.height*3.5*boutonPlay.xScale
			end
			boutonplaychained=display.newImage(imagemenu.chainelud,1)
			boutonplaychained.x=boutonplaylud.x+2/3*boutonplaylud.width*boutonplaylud.xScale*0.5
			boutonplaychained.xScale=chainedlud.xScale
			boutonplaychained.yScale=boutonplaychained.xScale
			boutonplaychained.y=boutonplaylud.y+boutonplaylud.height*boutonplaylud.yScale*1.2-boutonplaychained.height*boutonplaychained.yScale*0.5
			groupchainelud:insert(boutonplaychained)

			boutonplaychaineg=display.newImage(imagemenu.chainelud,1)
			boutonplaychaineg.x=boutonplaylud.x-2/3*boutonplaylud.width*boutonplaylud.xScale*0.5
			boutonplaychaineg.y=boutonplaychained.y
			boutonplaychaineg.xScale=chainedlud.xScale
			boutonplaychaineg.yScale=boutonplaychaineg.xScale
			groupchainelud:insert(boutonplaychaineg)
			groupboutonplay.y1=yminscreen-(-boutonplaychaineg.y+yminscreen)
		end
		
		local playunplay=false -- pour menu pas afficher and true pour menu boutonPlay affiché
		local playunplaychange=true -- true pour peut changer false pour attendre 250ms
		
		local ludplay=function(obj)
			setblurall(nil,menuludimg,playunplay,finmenu)
			--groupboutonplay.isVisible=false
		end
		function boutonplaylud:tap( event )
			clicqqpartf()
			if typeaff==0 and not playunplay and playunplaychange and clicbouton and not finmenu then
				clicboutonfunc()
				playunplay=true
				playunplaychange250(playunplaychange)
				boutonplaylud:setFrame(2)
				if not goh then
					boutonunplay:setFrame(1)
					bpreglage:setFrame(1)
				end
				transition.pause("animlud")
				transition.cancel("menuludtag")
				transition.to(groupboutonplay,{y=groupboutonplay.y1,time=1000,transition=easing.outCirc,tag="menuludtag"})
				transition.to(groupboutonplay,{delay=100,y=groupboutonplay.y1,time=100,onComplete=ludplay,tag="menuludtag"})
				groupboutonlud.isVisible=true
				transition.to(groupboutonlud,{y=0,time=1000,tag="menuludtag",transition=easing.outCirc})
				transitionblurall(200,playunplay,finmenu,menuludimg)
				print("tutoaffi".. tutoaffi)
				if tutoaffi==1 then
					if savegame.tuto3 or savegame.tuto2 or savegame.tuto1 or savegame.tuto4 then
						savegame.tuto1=true
						local loadsave = require("loadsave")
						loadsave.saveTable(savegame, "undeuxtroissoleil.json" )
						removetuto(grmain,boutonPlay,groupboutonplay,boutonplaylud,boutonDev)
					else
						tutoclicplaylud(tutocomplet,boutonplaylud,groupboutonplay,groupboutonlud,boutonPlay)
					end
					-- tutocomplet:remove(boutonplaylud)
					-- groupboutonplay:insert(boutonplaylud)
					-- tutoaffim:remove(fleche)
					-- groupboutonlud:insert(fleche)
					-- fleche.x=boutonPlay.x-fleche.xScale*fleche.width*0.5-boutonPlay.xScale*boutonPlay.width*0.4
					-- fleche.y=boutonPlay.y-fleche.yScale*fleche.height*0.5+boutonPlay.yScale*boutonPlay.height*0.4
					-- tutoaffim:remove(texttuto)
					-- groupboutonlud:insert(texttuto)

					-- tutocomplet:remove(tutocarre)
					-- tutocarre:removeSelf()
					-- tutocarre=nil
					-- grmain:remove(tutocomplet)
					-- tutocomplet:removeSelf()
					-- tutocomplet=nil
				else
					removetuto(grmain,boutonPlay,groupboutonplay,boutonplaylud,boutonDev)
				end
			end
		end
		boutonplaylud:addEventListener( "tap", boutonplaylud )
		local ludunplay=function(obj)
			setblurall(true,menuludimg,playunplay,finmenu)
			--groupboutonlud.isVisible=false
			transition.resume("animlud")
		end
		local function unplay()
			if playunplay and playunplaychange and not finmenu then
				playunplaychange250(playunplaychange)
				playunplay=false
				if boutonplaylud~=nil then
					boutonplaylud:setFrame(1)
				end
				groupboutonplay.isVisible=true
				transition.cancel("menuludtag")
				transition.to(groupboutonplay,{y=0,time=1000,tag="menuludtag",transition=easing.inCirc})
				transition.to(groupboutonlud,{y=groupboutonlud.y1,time=1000,transition=easing.outQuart,tag="menuludtag"})
				transition.to(groupboutonlud,{y=groupboutonlud.y1,delay=1000,time=1000,onComplete=ludunplay,tag="menuludtag"})
				transitionblurall(0,playunplay,finmenu,menuludimg)
			end
		end
		if not goh then
			function boutonunplay:tap( event )
				clicqqpartf()
				if typeaff==0 then
					if boutonplaylud~=nil then
						boutonplaylud:setFrame(1)
						if not goh then
							boutonunplay:setFrame(2)
						end
					end
					unplay()
				end
			end
			boutonunplay:addEventListener( "tap", boutonunplay )
		end
		-- imagemenu.boutonlud
		-- imagemenu.chainelud
		function imagemenuprin:tap(event)
			if not finmenu then
				local function timer10ms(event)
					if not clicqqpart then
						unplay()
					end
				end
				timer.performWithDelay( 10, timer10ms )
			end
		end
		imagemenuprin:addEventListener("tap",imagemenuprin)
	end
	if not goh then
		boutonDev=display.newSprite(imagemenu.BoutonDev1,sequenceDataboutondev)
		boutonDev.xScale=0.75
		boutonDev.yScale=boutonDev.xScale
	else
		boutonDev=display.newSprite(imagemenu.play,{frames={3,4},time=100,loopCount=1})
		boutonDev.yScale=actualcontentheight/5/boutonDev.height
		boutonDev.xScale=boutonDev.yScale
	end 
	effecttranstion(boutonDev)
	if coffreouvert==nil then
		boutonDev:setFrame(1)
	else
		boutonDev:setFrame(2)
		local function timercoffre(event)
			if not finmenu then
				if boutonDev~=nil then 
					boutonDev:setFrame(1)
				end
			end
		end
		timer.performWithDelay(400,timercoffre)
	end

	
	if false and (nbetoilett>18 or issimulator) then
		if not menulud then
			boutonmulti=display.newSprite(imagemenu.BoutonPlay,sequenceDataboutonmulti)
			effecttranstion(boutonmulti)
			boutonmulti:setFrame(1)
			boutonmulti.y=boutonPlay.y
			chainemulti=display.newImage(imagemenu.chaine,1)
		end
	end

	local tips=display.newEmbossedText(savegameall.tips[mathrandom(1,#savegameall.tips)],contentcenterx,ymaxscreen-10,fonttype, 15*fontsize )--actualcontentwidth/20, 300
	tips:setFillColor(0.5,0.5,0.5)
	tips:setEmbossColor(colortextemb)

	grmain:insert(imagemenuprin)
	if menulud then
		if goh then
			menuludimg.pourflou=display.newImage(imagemenu.pourflou,1)
			menuludimg.pourflou.isVisible=false
			menuludimg.pourflou.alpha=0
			grmain:insert(menuludimg.pourflou)
			menuludimg.pourflou.fill.effect="filter.blurGaussian"
			menuludimg.pourflou.fill.effect.horizontal.sigma = 140
			menuludimg.pourflou.fill.effect.vertical.sigma = 140
			menuludimg.pourflou.fill.effect.horizontal.blurSize = 0
			menuludimg.pourflou.fill.effect.vertical.blurSize = 0
			-- -- imagemenuprin.fill.effect = "filter.pixelate"
			-- -- imagemenuprin.fill.effect.numPixels = 10
			-- imagemenuprin.fill.effect="filter.blurGaussian"
			-- imagemenuprin.fill.effect.horizontal.sigma = 140
			-- imagemenuprin.fill.effect.vertical.sigma = 140
			-- imagemenuprin.fill.effect.horizontal.blurSize = 0
			-- imagemenuprin.fill.effect.vertical.blurSize = 0
		else
			menuludimg.montagnes=display.newImage(imagemenu.montagnes,1)
			grmain:insert(menuludimg.montagnes)
			menuludimg.montagnes.anchorY=1
			menuludimg.montagnes.y=ymaxscreen
			menuludimg.montagnes.x=contentcenterx
			-- menuludimg.montagnes.fill.effect = "filter.blurGaussian"
			-- menuludimg.montagnes.fill.effect.horizontal.sigma = 140
			-- menuludimg.montagnes.fill.effect.vertical.sigma = 140
			-- menuludimg.montagnes.fill.effect.horizontal.blurSize = 0
			-- menuludimg.montagnes.fill.effect.vertical.blurSize = 0
			menuludimg.colline=display.newImage(imagemenu.colline,1)
			grmain:insert(menuludimg.colline)
			menuludimg.colline.anchorY=1
			menuludimg.colline.y=ymaxscreen
			menuludimg.colline.x=contentcenterx
			-- menuludimg.colline.fill.effect = "filter.blurGaussian"
			-- menuludimg.colline.fill.effect.horizontal.sigma = 140
			-- menuludimg.colline.fill.effect.vertical.sigma = 140
			-- menuludimg.colline.fill.effect.horizontal.blurSize = 0
			-- menuludimg.colline.fill.effect.vertical.blurSize = 0
			menuludimg.geantimg=display.newImage(imagemenu.geant,1)
			grmain:insert(menuludimg.geantimg)
			menuludimg.geantimg.anchorX=1
			menuludimg.geantimg.anchorY=1
			menuludimg.geantimg.x=xmaxscreen
			menuludimg.geantimg.y=ymaxscreen
			-- menuludimg.geantimg.fill.effect = "filter.blurGaussian"
			-- menuludimg.geantimg.fill.effect.horizontal.sigma =140
			-- menuludimg.geantimg.fill.effect.vertical.sigma =140
			-- menuludimg.geantimg.fill.effect.horizontal.blurSize = 0
			-- menuludimg.geantimg.fill.effect.vertical.blurSize = 0
			menuludimg.elfimg=display.newImage(imagemenu.elfe,1)
			grmain:insert(menuludimg.elfimg)
			menuludimg.elfimg.anchorX=0
			menuludimg.elfimg.anchorY=1
			menuludimg.elfimg.x=xminscreen
			menuludimg.elfimg.y=ymaxscreen
			-- menuludimg.elfimg.fill.effect = "filter.blurGaussian"
			-- menuludimg.elfimg.fill.effect.horizontal.sigma = 140
			-- menuludimg.elfimg.fill.effect.vertical.sigma = 140
			-- menuludimg.elfimg.fill.effect.horizontal.blurSize = 0
			-- menuludimg.elfimg.fill.effect.vertical.blurSize = 0
			menuludimg.parchemin=display.newImage(imagemenu.parchemin,1)
			grmain:insert(menuludimg.parchemin)
			menuludimg.parchemin.anchorY=1
			menuludimg.parchemin.x=contentcenterx
			menuludimg.parchemin.y=ymaxscreen
			-- menuludimg.parchemin.fill.effect="filter.blurGaussian"
			-- menuludimg.parchemin.fill.effect.horizontal.sigma = 140
			-- menuludimg.parchemin.fill.effect.vertical.sigma = 140
			-- menuludimg.parchemin.fill.effect.horizontal.blurSize = 0
			-- menuludimg.parchemin.fill.effect.vertical.blurSize = 0
			-- menuludimg.colline.fill.effect.horizontal.blurSize = 20
			-- menuludimg.colline.fill.effect.horizontal.sigma = 140
			-- menuludimg.colline.fill.effect.vertical.blurSize = 20
			-- menuludimg.colline.fill.effect.vertical.sigma = 140
			menuludimg.pourflou=display.newImage(imagemenu.pourflou,1)
			menuludimg.pourflou.isVisible=false
			menuludimg.pourflou.alpha=0
			grmain:insert(menuludimg.pourflou)
			menuludimg.pourflou.fill.effect="filter.blurGaussian"
			menuludimg.pourflou.fill.effect.horizontal.sigma = 140
			menuludimg.pourflou.fill.effect.vertical.sigma = 140
			menuludimg.pourflou.fill.effect.horizontal.blurSize = 0
			menuludimg.pourflou.fill.effect.vertical.blurSize = 0
		end
	end
	local grpro=maincreategroupfleche(grmain)
	grmain:insert(tips)
	tutoinitchangegroup(grmain,boutonPlay,boutonbonus,boutonDev,boutonmulti,chainemulti,grouplud)
	
	print("debut savoir si tuto")
	tutoaffi=tutochoix()
	print("fin tutoaffi "..tutoaffi)
	local largeur=imagemenuprin.width/actualcontentwidth--1920/1080 dimension de l'image du menu
	local hauteur=imagemenuprin.height/actualcontentheight
	local zoom
	if (largeur>hauteur) then
		zoom=hauteur
	else
		zoom=largeur
	end

	imagemenuprin.xScale=imagemenuprin.xScale*((1/zoom)+0.01)--zoom de l'image pour qu'elle occupe entierement l'ecran
	imagemenuprin.yScale=imagemenuprin.yScale*((1/zoom)+0.01)
	if not menulud then
		boutonPlay.xScale=boutonPlay.xScale*((1/zoom)+0.01)*1.1
		boutonPlay.yScale=boutonPlay.yScale*((1/zoom)+0.01)*1.1
		boutonPlay.x=xmaxscreen-boutonPlay.xScale*boutonPlay.width*0.5-50 --contentcenterx*8/5
		boutonPlay.y=yminscreen+boutonPlay.yScale*boutonPlay.height*0.5

		boutonbonus.xScale=boutonbonus.xScale*((1/zoom)+0.01)*1.1
		boutonbonus.yScale=boutonbonus.yScale*((1/zoom)+0.01)*1.1
		boutonbonus.y=boutonPlay.y
	end
	if not goh then
		boutonDev.xScale= boutonDev.xScale*((1/zoom)+0.01)
		boutonDev.yScale= boutonDev.yScale*((1/zoom)+0.01)
	end
	boutonDev.x=xminscreen+boutonDev.width*boutonDev.xScale*0.5
	boutonDev.y=-boutonDev.height*boutonDev.yScale*0.5+ymaxscreen
	if menulud then
		if goh then
			imagemenuprin.x=contentcenterx+imagemenuprin.xScale*imagemenuprin.width*0.02
			print("nouvelles coordonnées "..imagemenuprin.x.." anciennes "..contentcenterx)
			if (contentcenterx-actualcontentwidth*0.5)<(imagemenuprin.x-imagemenuprin.xScale*imagemenuprin.width*0.5) then
				imagemenuprin.x=contentcenterx-actualcontentwidth*0.5+imagemenuprin.xScale*imagemenuprin.width*0.5
				print("bord depasse "..imagemenuprin.x)
			end
			menuludimg.pourflou.xScale=imagemenuprin.xScale
			menuludimg.pourflou.yScale=imagemenuprin.yScale
			menuludimg.pourflou.x=imagemenuprin.x
			menuludimg.pourflou.y=imagemenuprin.y
			boutonplaylud.x=imagemenuprin.x-imagemenuprin.xScale*imagemenuprin.width*0.02
			boutonplaylud.y=imagemenuprin.y+imagemenuprin.yScale*imagemenuprin.height*0.18+boutonplaylud.height*boutonplaylud.yScale*0.5
			boutonplayludblack.xScale=boutonplaylud.xScale
			boutonplayludblack.yScale=boutonplaylud.yScale
			boutonplayludblack.x=boutonplaylud.x+6
			boutonplayludblack.y=boutonplaylud.y+4
		else
			local scale=imagemenuprin.xScale
			if (menuludimg.geantimg.height*scale>actualcontentheight) then
				scale=actualcontentheight/menuludimg.geantimg.height
			end
			menuludimg.pourflou.xScale=imagemenuprin.xScale
			menuludimg.pourflou.yScale=imagemenuprin.yScale
			menuludimg.pourflou.x=imagemenuprin.x
			menuludimg.pourflou.y=imagemenuprin.y
			local xmove=menuludimg.geantimg.width*scale*0.05
			menuludimg.elfimg.xScale=scale -- *1.05
			menuludimg.elfimg.yScale=scale -- *1.05
			menuludimg.geantimg.xScale=scale -- *0.95
			menuludimg.geantimg.yScale=scale -- *0.95
			menuludimg.geantimg.x=menuludimg.geantimg.x+xmove*2
			-- menuludimg.geantimg.y=menuludimg.geantimg.y+xmove
			menuludimg.parchemin.xScale=scale
			menuludimg.parchemin.yScale=scale
			menuludimg.parchemin.y=ymaxscreen+menuludimg.parchemin.height*scale*0.35
			transition.to(menuludimg.parchemin,{time=3000,y=ymaxscreen,transition=easing.outQuad, tag="animlud"})

			menuludimg.elfimg.x=menuludimg.elfimg.x-xmove*2
			transition.to(menuludimg.elfimg,{delay=500,time=2000,x=xminscreen,transition=easing.outQuad, tag="animlud"})
			transition.to(menuludimg.geantimg,{delay=500,time=2000,x=xmaxscreen,transition=easing.outQuad, tag="animlud"})

			-- transition.to(menuludimg.parchemin,{delay=500,time=50000,x=contentcenterx+xmove*0.1,y=ymaxscreen+xmove*0.1,xScale=scale*1.01,yScale=scale*1.01,transition=easing.continuousLoop,tag="animlud"})
			-- transition.to(menuludimg.parchemin,{delay=50500,time=50000,x=contentcenterx+xmove*0.1,y=ymaxscreen+xmove*0.1,xScale=scale*1.01,yScale=scale*1.01,transition=easing.continuousLoop,tag="animlud"})
			-- transition.to(menuludimg.geantimg,{delay=500,time=50000,x=xmaxscreen,y=ymaxscreen,xScale=scale*1.05,yScale=scale*1.05,transition=easing.continuousLoop,tag="animlud"})
			-- transition.to(menuludimg.elfimg,{delay=500,time=50000,x=xminscreen-xmove,y=ymaxscreen-xmove,xScale=scale*0.95,yScale=scale*0.95,transition=easing.continuousLoop,tag="animlud"})
			-- transition.to(menuludimg.geantimg,{delay=50500,time=50000,x=xmaxscreen,y=ymaxscreen,xScale=scale*1.05,yScale=scale*1.05,transition=easing.continuousLoop,tag="animlud"})
			-- transition.to(menuludimg.elfimg,{delay=50500,time=50000,x=xminscreen-xmove,y=ymaxscreen-xmove,xScale=scale*0.95,yScale=scale*0.95,transition=easing.continuousLoop,tag="animlud"})
			menuludimg.montagnes.xScale=scale
			menuludimg.montagnes.yScale=scale
			menuludimg.montagnes.y=menuludimg.montagnes.y+menuludimg.montagnes.height*scale*0.05
			transition.to(menuludimg.montagnes,{delay=500,time=6000,y=ymaxscreen,transition=easing.outQuad, tag="animlud"})
			menuludimg.colline.xScale=scale
			menuludimg.colline.yScale=scale

			-- transition.to(menuludimg.colline,{delay=500,time=50000,y=ymaxscreen-xmove*0.12,transition=easing.continuousLoop,tag="animlud"})
			-- transition.to(menuludimg.montagnes,{delay=500,time=50000,y=ymaxscreen-xmove*0.1,transition=easing.continuousLoop,tag="animlud"})
			-- transition.to(menuludimg.colline,{delay=500,time=50000,y=ymaxscreen-xmove*0.12,transition=easing.continuousLoop,tag="animlud"})
			-- transition.to(menuludimg.montagnes,{delay=500,time=50000,y=ymaxscreen-xmove*0.1,transition=easing.continuousLoop,tag="animlud"})
		end	
	end
	local lefricgroupe=afffric()
	lefricgroupe.x=xminscreen
	lefricgroupe.y=yminscreen
	grmain:insert(lefricgroupe)
	if not menulud then
		boutonbonus.x=boutonbonus.xScale*boutonbonus.width*0.5+12*5 --contentcenterx*8/5
		if boutonmulti~=nil then
			boutonmulti.xScale=boutonPlay.xScale*0.85
			boutonmulti.yScale=boutonPlay.yScale*0.85
			boutonmulti.y=boutonPlay.y+boutonmulti.height*boutonmulti.yScale*0.25
			boutonmulti.x=boutonbonus.x+(boutonPlay.x-boutonbonus.x)*0.5
			boutonmulti.isVisible=true
			chainemulti.x=boutonmulti.x
			chainemulti.y=yminscreen+(chainemulti.y-yminscreen)*0.5
			chainemulti.xScale=(boutonmulti.xScale*boutonmulti.width)/chainemulti.width
			chainemulti.yScale=chainemulti.xScale
		end
	end

	savegameall.pageaffiche=1 --page actuellement afficher dans les menu a page mis dans savegameall a cause d'un probleme de variable global
	
	print("savegameall.pageaffiche mis a 1")
	time250ms=false -- empeche des clic rapide ppour naviguer d'un menu a un autre
	local function timertime250ms(event)
		time250ms=true
	end
	timer.performWithDelay(250,timertime250ms)
	local clicsurqqc=false
	if not menulud then
		mainenvoyerfleche()
	end
	local versiongame=display.newText((saveret.appVersionString..display.imageSuffix),xminscreen+10,ymaxscreen-5,fonttype,5) --native.systemFontBold,20)
	versiongame:setFillColor(0.5)
	grmain:insert(versiongame)
	local sequenceData =
	{
	    name="walking",
	    frames= {7,8},
	    time=100,
	    loopCount = 1,
	}
	local bpreglageson
	if not goh then
		bpreglageson=display.newSprite(imbouton.menupause,sequenceData)
		bpreglageson.x=xmaxscreen-50*3/5
		bpreglageson.y=yminscreen+0.5*50
		bpreglageson.xScale=3/5
		bpreglageson.yScale=3/5
	else
		bpreglageson=display.newSprite(imagemenu.setting,{frames={1,2},time=100,loopCount=1})
		bpreglageson.yScale=actualcontentheight/10/bpreglageson.height
		bpreglageson.xScale=bpreglageson.yScale
		bpreglageson.y=ymaxscreen-bpreglageson.yScale*bpreglageson.height*0.75
		bpreglageson.x=xmaxscreen-bpreglageson.xScale*bpreglageson.width*1.75
	end
	bpreglageson.son=true
	local reglageclic=false
	grmain:insert(bpreglageson)

	if savegame.sound==true then
		local volumesound=0.5
		if savegame.soundvol~=nil then
			volumesound=savegame.soundvol
		else
			savegame.soundvol=volumesound
		end
		local volumesoundfond=volumesound
		if savegame.soundvolfond~=nil then
			volumesoundfond=savegame.soundvolfond
		else
			savegame.soundvolfond=volumesoundfond
		end
		audio.setVolume(volumesound)
		audio.setVolume(volumesoundfond,{channel=1})
	else
		audio.setVolume(0)
		bpreglageson.son=false
		bpreglageson:setFrame(2)
	end
	function bpreglageson:tap( event )
		clicqqpartf()
		coroutinemiregime=true
		if typeaff==0 and not inappaff then
			audio.play( son.uicl2)
			if  bpreglageson.son then
				bpreglageson.son=false
				bpreglageson:setFrame(2)
				audio.setVolume(0)
				savegame.sound=false
			else
				bpreglageson.son=true
				bpreglageson:setFrame(1)
				local volumesound=0.5
				if savegame.soundvol~=nil then
					volumesound=savegame.soundvol
				else
					savegame.soundvol=volumesound
				end
				local volumesoundfond=volumesound
				if savegame.soundvolfond~=nil then
					volumesoundfond=savegame.soundvolfond
				else
					savegame.soundvolfond=volumesoundfond
				end
				audio.setVolume(volumesound)
				audio.setVolume(volumesoundfond,{channel=1})
				savegame.sound=true
			end
		else
			audio.play( son.uicl3)
		end
		print("clic sur bp reglage")
	end
	bpreglageson:addEventListener( "tap", bpreglageson )

	tutocreategroup(grmain)
	local recfondaffmenu=display.newRect(contentcenterx,contentcentery,actualcontentwidth*1.1,actualcontentheight*1.1)
	recfondaffmenu:setFillColor(0)
	recfondaffmenu.isVisible=false
	recfondaffmenu.alpha=0 --.5
	grmain:insert(recfondaffmenu)
	local fenetreconf=display.newImage(imbouton.fenconf,1)
	fenetreconf.x=contentcenterx
	fenetreconf.y=contentcentery
	fenetreconf.xScale=1.5*apparence
	local fenconf=display.newGroup()
	fenconf:insert(fenetreconf)
	grmain:insert(fenconf)
	local bouton
	fenconf.isVisible=false
	local boutonconf=display.newImage(imbouton.monnaie,1)
	boutonconf.xScale=0.2
	boutonconf.yScale=boutonconf.xScale
	fenconf:insert(boutonconf)
	local boutonrefu=display.newImage(imbouton.monnaie,2)
	boutonrefu.xScale=0.2
	boutonrefu.yScale=boutonrefu.xScale
	fenconf:insert(boutonrefu)
	boutonrefu.isVisible=false
	local clicsurrecfondaffmenu=false
	function fenconf:tap(event)
		clicqqpartf()
		clicsurrecfondaffmenu=true
		local function clicsurgrintimer(event)
			clicsurrecfondaffmenu=false
		end
		timer.performWithDelay(50,clicsurgrintimer)
	end
	fenconf:addEventListener("tap",fenconf)
	local completedisp10=function(obj)
		recfondaffmenu.isVisible=false
		print("remise")
		fenconf.isVisible=false
		fenconf.x=0
		fenconf.y=0
		if bpreglagesonaff~=nil then
			fenconf:remove(slider)
			slider:removeSelf()
			slider=nil
			fenconf:remove(leslider)
			leslider:removeSelf()
			leslider=nil
			fenconf:remove(bpreglagesonaff)
			bpreglagesonaff:removeSelf()
			bpreglagesonaff=nil
			fenconf:remove(bpreglagesonaffbis)
			bpreglagesonaffbis:removeSelf()
			bpreglagesonaffbis=nil
			fenconf:remove(bpsaveload)
			bpsaveload:removeSelf()
			bpsaveload=nil
			fenconf:remove(musiquehigh)
			musiquehigh:removeSelf()
			musiquehigh=nil
			fenconf:remove(boutonconfmusique)
			boutonconfmusique:removeSelf()
			boutonconfmusique=nil
			display.remove(sfxhigh)
			sfxhigh=nil
			display.remove(boutonconfsfx)
			boutonconfsfx=nil
			local loadsave = require("loadsave")
			loadsave.saveTable(savegame, "undeuxtroissoleil.json" )
			fenconf:remove(bpreinit)
			bpreinit:removeSelf()
			bpreinit=nil
			fenconf:remove(bpquiter)
			bpquiter:removeSelf()
			bpquiter=nil
		end
		if boutonhome~=nil then
			fenconf:remove(boutonhome)
			boutonhome:removeSelf()
			boutonhome=nil
		end
		if apropostext~=nil then
			display.remove(apropostext)
			-- fenconf:remove(apropostext)
			-- apropostext:removeSelf()
			apropostext=nil
		end
		if savegameidtext1~=nil then
			fenconf:remove(savegameidtext1)
			savegameidtext1:removeSelf()
			savegameidtext1=nil
			fenconf:remove(savegameidtext2)
			savegameidtext2:removeSelf()
			savegameidtext2=nil
			fenconf:remove(savegameidtext)
			savegameidtext:removeSelf()
			savegameidtext=nil
			fenconf:remove(savegameidtext3)
			savegameidtext3:removeSelf()
			savegameidtext3=nil
			fenconf:remove(savegameidtext4)
			savegameidtext4:removeSelf()
			savegameidtext4=nil
		end
		if reinittext~=nil then
			fenconf:remove(reinittext)
			reinittext:removeSelf()
			reinittext=nil
		end
	end
	local cantclic=true
	local function clicsurbp1(bpclic)
		clicqqpartf() 
		coroutinemiregime=true
		if clicsurqqc==false and cantclic and time250ms and not inappaff and clicbouton and not finmenu then
			clicboutonfunc()
			if typeaff==0 then
				clicsurqqc=true
				audio.play( son.uicl2, { channel=2})
				if bpclic==0 then
					boutonPlay:setFrame(2)
					cantclic=false
				elseif bpclic==1 then
					cantclic=false
					boutonbonus:setFrame(2)
				elseif bpclic==2 then
					cantclic=false
					boutonDev:setFrame(2)
				elseif bpclic==3 then
					if boutonmulti~=nil then
						cantclic=false
						boutonmulti:setFrame(2)
					end
				end
				if bpclic==0 or bpclic==1 then
					multi=0
				end
				Runtime:removeEventListener( "key", onKeyEvent )

				local function listener(event)
					if not menulud then
						grmain:remove(grpro)
						grpro:removeSelf()
						grpro=nil
						if tutoaffi~=0 then
							print("vient de mainbis")
							tutoaffim=removetuto(grmain,boutonPlay,groupboutonplay,boutonplaylud,boutonDev)
						end
						grmain:remove(boutonPlay)
						boutonPlay:removeSelf()
						boutonPlay=nil
						grmain:remove(boutonbonus)
						boutonbonus:removeSelf()
						boutonbonus=nil
						grmain:remove(boutonDev)
						boutonDev:removeSelf()
						boutonDev=nil
						if boutonmulti~=nil then
							grmain:remove(boutonmulti)
							boutonmulti:removeSelf()
							boutonmulti=nil
							grmain:remove(chainemulti)
							chainemulti:removeSelf()
							chainemulti=nil
						end
					else
						if goh then
							fondgoh:removeSelf()
							fondgoh=nil
						else
							menuludimg.parchemin:removeSelf()
							menuludimg.parchemin=nil
							menuludimg.elfimg:removeSelf()
							menuludimg.elfimg=nil
							menuludimg.geantimg:removeSelf()
							menuludimg.geantimg=nil
							menuludimg.colline:removeSelf()
							menuludimg.colline=nil
							menuludimg.montagnes:removeSelf()
							menuludimg.montagnes=nil
							boutonplaychaineg:removeSelf()
							boutonplaychaineg=nil
							boutonplaychained:removeSelf()
							boutonplaychained=nil
							boutonunplay:removeSelf()
							boutonunplay=nil
							chaineglud:removeSelf()
							chaineglud=nil
							chainedlud:removeSelf()
							chainedlud=nil
						end
						imagemenuprin:removeSelf()
						imagemenuprin=nil
						if boutonmulti~=nil then
							boutonmulti:removeSelf()
							boutonmulti=nil
						end
						bpreglage:removeSelf()
						bpreglage=nil
						boutonbonus:removeSelf()
						boutonbonus=nil
						boutonPlay:removeSelf()
						boutonPlay=nil
						groupboutonlud:removeSelf()
						groupboutonlud=nil
						print("remove boutonplaylud mainbis l926")
						display.remove(boutonplaylud)
						-- boutonplaylud:removeSelf()
						boutonplaylud=nil
						if goh then
							display.remove(boutonplayludblack)
							boutonplayludblack=nil
						end
						groupchainelud:removeSelf()
						groupchainelud=nil
						groupboutonplay:removeSelf()
						groupboutonplay=nil
						grouplud:removeSelf()
						grouplud=nil
					end
					print("vient de mainbis 2")
					tutoaffim=removetuto(grmain,boutonPlay,groupboutonplay,boutonplaylud,boutonDev)
					grmain:removeSelf()
					grmain=nil
					if bpclic==0 then
						if not goh then
							loadsbonus()
						end
						finmenu=true
						transition.cancel("menuludtag")
						transition.cancel("menuprintran")
						local lancerNiveau1=require("chniveaunew")
						lancerNiveau1.chniveaunew1()
					elseif bpclic==1 then
						finmenu=true
						transition.cancel("menuludtag")
						transition.cancel("menuprintran")
						if not savegame.bonuspaid and goh and (not iswindows or issimulator) then
							local groupinapp2=display.newGroup()
							local fond=display.newImage(imagemenu.pourflou,1)
							fond.fill.effect="filter.blurGaussian"
							local blurscale=0.25
							if display.imageSuffix=="@6x" then
								blurscale=0.1
							elseif display.imageSuffix=="@8x" then
								blurscale=0.05
							end
							fond.fill.effect.horizontal.blurSize =200*blurscale
							fond.fill.effect.vertical.blurSize = 200*blurscale
							fond.fill.effect.horizontal.sigma = 140
							fond.fill.effect.vertical.sigma = 140
							groupinapp2:insert(fond)
							fond.x=contentcenterx
							fond.y=contentcentery
							fond.xScale=actualcontentwidth/fond.width*1.1
							fond.yScale=actualcontentheight/fond.height*1.1
							local imageinapp=display.newImage(imagemenu.inAppPopup,1)
							groupinapp2:insert(imageinapp)
							imageinapp.x=contentcenterx
							imageinapp.y=contentcentery
							imageinapp.xScale=actualcontentwidth*0.9/imageinapp.width
							imageinapp.yScale=actualcontentheight/imageinapp.height
							if imageinapp.xScale>imageinapp.yScale then
								imageinapp.xScale=imageinapp.yScale
							else
								imageinapp.yScale=imageinapp.xScale
							end
							if imageinapp.xScale*imageinapp.width>=actualcontentwidth*0.8 then
								imageinapp.x=contentcenterx-((imageinapp.xScale*imageinapp.width-actualcontentwidth*0.8)*0.5)
							end
							local boutonquitter=display.newImage(imbouton.interdit,1)
							groupinapp2:insert(boutonquitter)
							boutonquitter.xScale=actualcontentwidth*0.1/boutonquitter.width
							boutonquitter.yScale=actualcontentheight*0.1/boutonquitter.height
							if boutonquitter.xScale>boutonquitter.yScale then
								boutonquitter.yScale=boutonquitter.xScale
							else
								boutonquitter.xScale=boutonquitter.yScale
							end
							boutonquitter.x=xmaxscreen-boutonquitter.xScale*boutonquitter.width*0.5
							boutonquitter.y=yminscreen+boutonquitter.yScale*boutonquitter.height*0.5
							local function launchchniveaubonus()
								groupinapp2:removeSelf()
								groupinapp2=nil
								local lancerNiveau1=require("chniveaubonus")
								lancerNiveau1.chniveaubonus1()		
							end
							function boutonquitter:tap(event)
								if clicbouton then
									boutonquitter:removeEventListener("tap")
									imageinapp:removeEventListener("tap",imageinapp)
									clicboutonfunc()
									launchchniveaubonus()
								end
							end
							boutonquitter:addEventListener("tap")
							if isandroid or isiphone then
								initinapp()
							end
							function imageinapp:tap()
								if clicbouton then
									boutonquitter:removeEventListener("tap")
									imageinapp:removeEventListener("tap",imageinapp)
									clicboutonfunc()
									if isandroid or isiphone then
										inapp(-1,-1)
									end
									launchchniveaubonus()
								end
							end
							imageinapp:addEventListener("tap",imageinapp)
							loadsbonus()
						else
							local lancerNiveau1=require("chniveaubonus")
							lancerNiveau1.chniveaubonus1()	
						end
					elseif bpclic==2 then
						transition.cancel("menuludtag")
						transition.cancel("menuprintran")
						finmenu=true
						local menudev1=require("menudevnew")
						menudev1.menudevnew1()
					elseif bpclic==3 then
						transition.cancel("menuludtag")
						transition.cancel("menuprintran")
						local chagementnece=false
						fullcouritine=true
						local function timerchargementbis(event)
							if chargementdesfichier[1]==1 then
								if chagementnece then
									chagementnece=nil
									chargementsup()
								end
								finmenu=true
								local multimenu1=require("menumulti")
								multimenu1.menumulti()
							else
								timer.performWithDelay(50,timerchargementbis)
								if chagementnece==false then
									chagementnece=true
									local chargementaffichage = require ( "chargementaff")
									chargementaffichage.chargementaff(2)
								end
							end
						end
						timer.performWithDelay(10,timerchargementbis)
					elseif bpclic==-1 then
						local function timerchargementbis(event)
							lemainpremier()
						end
						timer.performWithDelay(50,timerchargementbis)
					end
					completedisp10()
				end
				timer.performWithDelay( 100, listener )
			else
				audio.play( son.uicl3)
			end
		end
	end
	local function clicsurbp(bpclic)--0 pour play, 1 bonus,2 dev, 3 multi
		if functionToCall==nil then
			functionToCall=clicsurbp1
			functionToCallArg=bpclic
		end
	end
	if boutonmulti~=nil then
		function boutonmulti:tap(event)
			clicsurbp(3)
		end
		boutonmulti:addEventListener( "tap", boutonmulti )--lancement de l'ecoute sur le bouton play
	end
	function boutonPlay:tap(event)
		clicsurbp(0)
	end
	boutonPlay:addEventListener( "tap", boutonPlay )--lancement de l'ecoute sur le bouton play
	function boutonbonus:tap(event)
		clicsurbp(1)
	end
	boutonbonus:addEventListener( "tap", boutonbonus )--lancement de l'ecoute sur le bouton play
	local function boutondevtap()
		clicsurbp(2)
	end
	function boutonDev:tap(event)
		clicqqpartf()
		boutondevtap()
	end
	boutonDev:addEventListener( "tap", boutonDev )--lancement de l'ecoute sur le bouton play]]
	local function savegameclic(letexte,origine)
		if string.len(letexte.text)==10 and letexte.text~="0123456789" then
			local id=tonumber(letexte.text)
			if id then
				local serveur=require("serveur")
				demandedesauvegarde(id,letexte)
				print("valeur saisie "..id)
				local cpttimer=0
				local function timerwait(event)
					if letexte==nil then
						typeaff=0
						clicsurbp(-1)
					else if letexte.fini then
							typeaff=0
							clicsurbp(-1)
						else
							cpttimer=cpttimer+1
							if cpttimer<200 then
								timer.performWithDelay( 100,timerwait)
							end
						end
					end
				end
				timer.performWithDelay( 100,timerwait)
			end
		end
	end
	local function boutonconftap()
		audio.play( son.uicl1)
		if typeaff==2 or typeaff==3 or typeaff==4 or typeaff==5 or typeaff==6 or typeaff==7 then
			transition.to(fenconf,{time=500,transition=easing.inCirc, y=-actualcontentheight, onComplete=completedisp10,onCancel=completedisp10,tag="menuprintran"})
			transition.to(recfondaffmenu,{time=500,alpha=0,tag="menuprintran"})
			local function inapppeutafftimer(event)
				inapppeutaff=true
			end
			timer.performWithDelay(100,inapppeutafftimer)
			if typeaff==4 then
				local iOSAppId="1097170681"
				if goh then
					iOSAppId="1222462994"
				end
				local options=
				{
					iOSAppId=iOSAppId,
					supportedAndroidStores={"google","amazon"}
				}
				native.showPopup("appStore",options)
				savegame.rate=savegame.rate+4
				local loadsave=require("loadsave")
				loadsave.saveTable(savegame,"undeuxtroissoleil.json")
			end
			if typeaff==6 then
				savegameclic(savegameidtext3)
			end
			if typeaff==7 then
				typeaff=0
				if fric1<0 then
					fric1=savegame.yomec/5*7
				else
					fric1=-savegame.yomec/5*7
				end
				fric1=mathfloor(fric1)
				savegame.diplay=gettime()
				local fricpos=fric1
				if fricpos<0 then
					fricpos=-fricpos
				end
				savegame.content=(-fricpos/3-1)/savegame.display
				savegame.monney=fricpos/7
				for i=1,319 do
					if i<157 or i>167 then
						savegamedev[i]=0 --1 devellopement fait
					end
				end
				newinitbonus(true)
				boutondevtap()
			end
			typeaff=0
		elseif typeaff==1 then
			native.requestExit()
			print("quitez le jeu")
		end
	end
	function recfondaffmenu:tap(event)
		if clicsurrecfondaffmenu then
			print("clic sur le groupe")
		else
			if typeaff==2 or typeaff==3 or typeaff==7 or typeaff==6 then
				transition.to(fenconf,{time=500,transition=easing.inCirc, y=-actualcontentheight, onComplete=completedisp10,onCancel=completedisp10,tag="menuprintran"})
				transition.to(recfondaffmenu,{time=500,alpha=0,tag="menuprintran"})
				local function inapppeutafftimer(event)
					inapppeutaff=true
					typeaff=0
				end
				timer.performWithDelay(100,inapppeutafftimer)
			elseif typeaff==1 then				
				transition.to(fenconf,{time=500,transition=easing.inCirc, y=-actualcontentheight, onComplete=completedisp10,onCancel=completedisp10,tag="menuprintran"})
				transition.to(recfondaffmenu,{time=500,alpha=0,tag="menuprintran"})
				local function inapppeutafftimer(event)
					inapppeutaff=true
					typeaff=0
				end
				timer.performWithDelay(100,inapppeutafftimer)
			elseif typeaff==5 then
				boutonconftap()
			end
			print("ho year baby")
		end
	end
	recfondaffmenu:addEventListener("tap",recfondaffmenu)
	
	function boutonconf:tap( event )
		boutonconftap()
	end
	boutonconf:addEventListener( "tap", boutonconf )
	function boutonrefu:tap( event )
		audio.play( son.uicl1)
		if typeaff==1 or typeaff==4 or typeaff==7 then
			typeaff=0
			transition.to(fenconf,{time=500,transition=easing.inCirc, y=-actualcontentheight, onComplete=completedisp10,onCancel=completedisp10,tag="menuprintran"})
			transition.to(recfondaffmenu,{time=500,alpha=0,tag="menuprintran"})
			local function inapppeutafftimer(event)
				inapppeutaff=true
			end
			timer.performWithDelay(100,inapppeutafftimer)
			if typeaff==4 then
				savegame.rate=savegame.rate+1
				local loadsave=require("loadsave")
				loadsave.saveTable(savegame, "undeuxtroissoleil.json" )
			end
		end
	end
	boutonrefu:addEventListener( "tap", boutonrefu )
	--if affmenu==nil then
	affmenu=nil
	function affmenu(infodeswipe)
		if infodeswipe ~=nil then
			typeaff=infodeswipe
		end
		transition.cancel("menuprintran")
		completedisp10()
		inapppeutaff=false
		audio.play( son.uicl2)
		if typeaff==2 then
			fenetreconf.yScale=1
			if bpreglagesonaff==nil then
				boutonrefu.isVisible=false
				boutonconf.x=contentcenterx+fenetreconf.xScale*fenetreconf.width*0.5-boutonconf.xScale*boutonconf.width*0.5
				boutonconf.y=contentcentery+fenetreconf.yScale*fenetreconf.height*0.5-boutonconf.yScale*boutonconf.height*0.5
				local cybleFile
				if not goh then
					cybleFile="Menuprincipal/slider1.png"
				else
					cybleFile="goh/Menuprincipal/slider1.png"
				end
				local sliderSheet=graphics.newImageSheet(cybleFile,{width=111,height=100,numFrames=2,sheetContentWidth=222,sheetContentHeight=100})
				slider=display.newImage(sliderSheet,1)
				slider.x=contentcenterx
				slider.y=contentcentery
				slider.xScale=(fenconf.xScale*fenconf.width/3)/slider.width
				slider.yScale=(fenconf.yScale*fenconf.height/6)/slider.height 
				fenconf:insert(slider)
				leslider=display.newImage(sliderSheet,2)
				leslider.yScale=slider.yScale
				leslider.xScale=slider.yScale
				leslider.x=contentcenterx
				leslider.y=contentcentery
				fenconf:insert(leslider)
				leslider.xmin=slider.x-slider.xScale*slider.width*0.5
				leslider.xmax=leslider.xmin+slider.xScale*slider.width
				local function changestatuson(binaire)
					if binaire then
						bpreglagesonaff:setFrame(1)
						bpreglagesonaffbis:setFrame(1)
						bpreglageson.son=true
						bpreglageson:setFrame(1)
						audio.setVolume(savegame.soundvol)
						savegame.sound=true
					else
						bpreglagesonaff:setFrame(2)
						bpreglagesonaffbis:setFrame(2)
						bpreglageson.son=false
						bpreglageson:setFrame(2)
						savegame.soundvol=0.5
						audio.setVolume(0)
						savegame.sound=false
					end
				end
				local function sliderpos(positionslider)
					leslider.x=leslider.xmin+slider.xScale*slider.width*positionslider*0.01
					slider.value=positionslider
				end
				local numberlocal=savegame.soundvol*100
				if savegame.sound==false then
					numberlocal=0
				end
				sliderpos(numberlocal)
				function leslider:touch( event )
					if ( event.phase == "began" ) then
							-- Set touch focus
							display.getCurrentStage():setFocus( self )
							self.isFocus = true
							leslider.x1=leslider.x
						elseif ( self.isFocus ) then
						if ( event.phase == "moved" ) then
							print( "Moved phase of touch event detected." )
							local poscalc=leslider.x1+(-event.xStart+event.x)*fenconf.xScale
							if poscalc<=leslider.xmin then
								changestatuson(false)
							else
								changestatuson(true)
							end
							if poscalc<leslider.xmin then
								poscalc=leslider.xmin
							elseif poscalc>leslider.xmax then
								poscalc=leslider.xmax
							end
							leslider.x=poscalc
							slider.value=(leslider.x-leslider.xmin)/(leslider.xmax-leslider.xmin)*100
							savegame.soundvol=slider.value*0.01
							audio.setVolume(savegame.soundvol)
						elseif ( event.phase == "ended" or event.phase == "cancelled" ) then
							display.getCurrentStage():setFocus( nil )
							self.isFocus = nil
						end
					end
					return true
				end 
				leslider:addEventListener( "touch",leslider)
				bpreglagesonaff=display.newSprite(imbouton.menupause,sequenceData)
				if savegame.soundvol==0 or savegame.sound==false then
					bpreglagesonaff:setFrame(2)
				else
					bpreglagesonaff:setFrame(1)
				end
				if goh then
					bpreglagesonaff.xScale=0.23
				else
					bpreglagesonaff.xScale=1
				end
				bpreglagesonaff.yScale=bpreglagesonaff.xScale
				bpreglagesonaff.x=contentcenterx
				bpreglagesonaff.y=contentcentery-fenetreconf.yScale*fenetreconf.height*0.5+bpreglagesonaff.yScale*bpreglagesonaff.height*0.5
				fenconf:insert(bpreglagesonaff)
				function bpreglagesonaff:tap( event )
					audio.play( son.uicl1)
					if slider.value~=0 then
						sliderpos(0)
						bpreglagesonaff:setFrame(2)
						savegame.soundvol=0.5
						bpreglagesonaff:setFrame(2)
						bpreglagesonaffbis:setFrame(2)
				    	bpreglageson.son=false
						bpreglageson:setFrame(2)
						audio.setVolume(0)
						savegame.sound=false
					else
						sliderpos(50)
						bpreglagesonaff:setFrame(1)
						savegame.soundvol=0.5
						bpreglagesonaff:setFrame(1)
						bpreglagesonaffbis:setFrame(1)
				    	bpreglageson.son=true
						bpreglageson:setFrame(1)
						local volumesoundfond=savegame.soundvol
						if savegame.soundvolfond~=nil then
							volumesoundfond=savegame.soundvolfond
						else
							savegame.soundvolfond=volumesoundfond
						end
						audio.setVolume(volumesoundfond,{channel=1})
						audio.setVolume(savegame.soundvol)
						savegame.sound=true
					end
					print("qqc la")
				end
				bpreglagesonaff:addEventListener( "tap",bpreglagesonaff)
				musiquehigh=display.newText(texttraduction.comp[1],contentcenterx-fenetreconf.xScale*fenetreconf.width*0.5+17/2*12*apparence,contentcentery+fenetreconf.yScale*fenetreconf.height*0.3,fonttype, 12*apparence*fontsize )
				musiquehigh:setFillColor(0)
				fenconf:insert(musiquehigh)
				boutonconfmusique=display.newSprite(imbouton.monnaie,{frames={2,1},time=100,loopCount=1})
				boutonconfmusique.xScale=0.13
				boutonconfmusique.yScale=boutonconfmusique.xScale
				boutonconfmusique.y=musiquehigh.y
				boutonconfmusique.x=musiquehigh.x+musiquehigh.width*0.5+boutonconfmusique.width*boutonconfmusique.xScale*0.5 --17/2*12*apparence
				local volumesoundfond=savegame.soundvol
				if savegame.soundvolfond~=nil then
					volumesoundfond=savegame.soundvolfond
				else
					savegame.soundvolfond=volumesoundfond
				end 
				if savegame.soundvolfond==0 then
					boutonconfmusique:setFrame(1)
				else
					boutonconfmusique:setFrame(2)
				end
				fenconf:insert(boutonconfmusique)
				function boutonconfmusique:tap( event )
					audio.play( son.uicl1)
					if savegame.soundvolfond==0 then
						boutonconfmusique:setFrame(2)
						savegame.soundvolfond=savegame.soundvol
						audio.setVolume(savegame.soundvolfond,{channel=1})
						audio.stop(1)
						audio.play(son.backgroundMusic,{ channel=1, loops=-1})
					else
						boutonconfmusique:setFrame(1)
						savegame.soundvolfond=0
						audio.setVolume(savegame.soundvolfond,{channel=1})
					end
					local loadsave=require("loadsave")
					loadsave.saveTable(savegame, "undeuxtroissoleil.json" )
				end
				boutonconfmusique:addEventListener( "tap",boutonconfmusique)

				sfxhigh=display.newText("SFX",boutonconfmusique.x+boutonconfmusique.width*boutonconfmusique.xScale+36,contentcentery+fenetreconf.yScale*fenetreconf.height*0.3,fonttype, 12*apparence*fontsize )
				sfxhigh:setFillColor(0)
				fenconf:insert(sfxhigh)
				boutonconfsfx=display.newSprite(imbouton.monnaie,{frames={2,1},time=100,loopCount=1})
				boutonconfsfx.xScale=0.13
				boutonconfsfx.yScale=boutonconfsfx.xScale
				boutonconfsfx.y=sfxhigh.y
				boutonconfsfx.x=sfxhigh.x+sfxhigh.width*0.5+boutonconfsfx.width*boutonconfsfx.xScale*0.5 --17/2*12*apparence
				local volumesoundfond=savegame.soundvol
				if savegame.sfx~=nil then
					savegame.sfx=1
				end 
				if savegame.sfx==0 then
					boutonconfsfx:setFrame(1)
				else
					boutonconfsfx:setFrame(2)
				end
				fenconf:insert(boutonconfsfx)
				function boutonconfsfx:tap( event )
					audio.play( son.uicl1)
					if savegame.sfx==0 then
						boutonconfsfx:setFrame(2)
						savegame.sfx=1
						for i=2,32 do
							audio.setVolume(1,{channel=i})
						end
					else
						boutonconfsfx:setFrame(1)
						savegame.sfx=0
						for i=2,32 do
							audio.setVolume(0,{channel=i})
						end
					end
					local loadsave=require("loadsave")
					loadsave.saveTable(savegame, "undeuxtroissoleil.json" )
				end
				boutonconfsfx:addEventListener( "tap",boutonconfsfx)

				bpreinit=display.newImage(imbouton.menupause,3)
				if goh then
					bpreinit.xScale=0.16
				else
					bpreinit.xScale=0.7
				end
				bpreinit.yScale=bpreinit.xScale
				bpreinit.x=contentcenterx-fenetreconf.xScale*fenetreconf.width*0.5+bpreinit.xScale*bpreinit.width*0.5
				bpreinit.y=contentcentery-fenetreconf.yScale*fenetreconf.height*0.5+bpreinit.yScale*bpreinit.height*0.5
				fenconf:insert(bpreinit)
				function bpreinit:tap( event )
					typeaff=7
					affmenu()	
				end
				bpreinit:addEventListener( "tap",bpreinit)
				bpquiter=display.newImage(imbouton.monnaie,2)
				bpquiter.xScale=0.2
				bpquiter.yScale=bpquiter.xScale
				bpquiter.x=contentcenterx-fenetreconf.xScale*fenetreconf.width*0.5+bpquiter.xScale*bpquiter.width*0.5
				bpquiter.y=boutonconf.y
				fenconf:insert(bpquiter)
				function bpquiter:tap( event )
					boutonconftap()
				end
				bpquiter:addEventListener( "tap",bpquiter)
				bpreglagesonaffbis=display.newSprite(imbouton.menupause,sequenceData)
				if savegame.soundvol==0 or savegame.sound==false then
					bpreglagesonaffbis:setFrame(2)
				else
					bpreglagesonaffbis:setFrame(1)
				end
				if goh then
					bpreglagesonaffbis.xScale=0.13
				else
					bpreglagesonaffbis.xScale=0.55
				end
				bpreglagesonaffbis.yScale=bpreglagesonaffbis.xScale
				bpreglagesonaffbis.x=slider.x-slider.width*slider.xScale*0.5-bpreglagesonaffbis.xScale*bpreglagesonaffbis.width*0.5
				bpreglagesonaffbis.y=slider.y
				fenconf:insert(bpreglagesonaffbis)
				bpreglagesonaffbis:addEventListener( "tap",bpreglagesonaff)

				bpsaveload=display.newImage(imagemenu.savebt,1)
				bpsaveload.xScale=fenetreconf.xScale*fenetreconf.width/7/bpsaveload.width
				bpsaveload.yScale=bpsaveload.xScale
				bpsaveload.x=contentcenterx+fenetreconf.xScale*fenetreconf.width*0.5-bpsaveload.xScale*bpsaveload.width*0.5
				bpsaveload.y=contentcentery-fenetreconf.yScale*fenetreconf.height*0.5+bpsaveload.yScale*bpsaveload.height*0.5
				fenconf:insert(bpsaveload)
				function bpsaveload:tap( event )
					typeaff=6
					affmenu()
				end
				bpsaveload:addEventListener( "tap",bpsaveload)
			end
		elseif typeaff==1 then
			fenetreconf.yScale=1
			boutonconf.x=contentcenterx+fenetreconf.xScale*fenetreconf.width*0.3-boutonconf.xScale*boutonconf.width*0.5
			boutonconf.y=contentcentery+fenetreconf.yScale*fenetreconf.height*0.5-boutonconf.yScale*boutonconf.height*0.5
			boutonrefu.isVisible=true
			boutonrefu.x=contentcenterx-fenetreconf.xScale*fenetreconf.width*0.3+boutonrefu.xScale*boutonrefu.width*0.5
			boutonrefu.y=contentcentery+fenetreconf.yScale*fenetreconf.height*0.5-boutonrefu.yScale*boutonrefu.height*0.5
			if boutonhome==nil then
				boutonhome=display.newImage(imbouton.menupause,4)
				if goh then
					boutonhome.xScale=0.28
				else
					boutonhome.xScale=1.2
				end
				boutonhome.yScale=boutonhome.xScale
				boutonhome.x=contentcenterx
				boutonhome.y=contentcentery-fenetreconf.yScale*fenetreconf.height*0.5+boutonhome.yScale*boutonhome.height*0.5
				fenconf:insert(boutonhome)
				function boutonhome:tap( event )
					native.requestExit()
				end
				boutonhome:addEventListener( "tap", boutonhome )
			end
		elseif typeaff==3 then -- 3
			fenetreconf.yScale=2
			boutonrefu.isVisible=false
			fenetreconf.isVisible=false
			boutonconf.x=contentcenterx+fenetreconf.xScale*fenetreconf.width*0.5-boutonconf.xScale*boutonconf.width
			--print("boutonconf.x "..boutonconf.x.." bpreglage.x "..bpreglage.x)
			if boutonconf.x>bpreglage.x- bpreglage.width*bpreglage.xScale*0.5-boutonconf.xScale*boutonconf.width*0.5 then
				--print("action!!!")
				boutonconf.x=bpreglage.x- bpreglage.width*bpreglage.xScale*0.5-boutonconf.xScale*boutonconf.width*0.5
			end
			boutonconf.y=contentcentery+fenetreconf.yScale*fenetreconf.height*0.5-boutonconf.yScale*boutonconf.height*0.5
			if apropostext==nil then
				local optionembosstext={
					text="Artha France                           Stronghold\nRémi du Chalard\nArnaud Benoit du Rey\nAntoine Tourneux\nLudwig Demuth\nWandrille du Chalard\nLouis Arbaretier\nFrancois de Mareschal\nHilaire Bouyé\nTristan Duhesme\nHugo Policella\nEmmanuel de Monteynard\nFlorence du Chalard",
					x=contentcenterx+12*apparence,
					y=contentcentery,
					font=fonttype,
					fontSize=actualcontentheight/(13+3),
					align="center",
					width=actualcontentwidth*0.8,
					height=0
				}
				if goh then
					optionembosstext.text="Gate Of Heroes created by\n\nArtha France\nRémi du Chalard\nArnaud Benoit du Rey\nAntoine Tourneux\nLudwig Demuth\nWandrille du Chalard\n\nGraphic design by\nLimpidfrog"
				end
				apropostext=display.newEmbossedText(optionembosstext)
				apropostext:setEmbossColor(colortextemb)
				fenconf:insert(apropostext)
			end
			transition.to(recfondaffmenu,{time=500,alpha=0.8})
		elseif typeaff==4 then
			fenetreconf.yScale=1
			boutonconf.x=contentcenterx+fenetreconf.xScale*fenetreconf.width*0.3-boutonconf.xScale*boutonconf.width*0.5
			boutonconf.y=contentcentery+fenetreconf.yScale*fenetreconf.height*0.5-boutonconf.yScale*boutonconf.height*0.5
			boutonrefu.isVisible=true
			boutonrefu.x=contentcenterx-fenetreconf.xScale*fenetreconf.width*0.3+boutonrefu.xScale*boutonrefu.width*0.5
			boutonrefu.y=contentcentery+fenetreconf.yScale*fenetreconf.height*0.5-boutonrefu.yScale*boutonrefu.height*0.5
			if ratetext==nil then
				apropostext=display.newEmbossedText(texttraduction.rate[1],contentcenterx,contentcentery-24*apparence,fenetreconf.xScale*fenetreconf.width*0.6,0,fonttype,24*apparence*fontsize)--,,,fonttype, 24*apparence )
				apropostext:setEmbossColor(colortextemb)
				fenconf:insert(apropostext)
			end
			transition.to(recfondaffmenu,{time=500,alpha=0.8})
			--demande de noter le jeu
		elseif typeaff==5 then --5
			fenetreconf.yScale=1
			boutonconf.isVisible=true
			boutonconf.x=contentcenterx+fenetreconf.xScale*fenetreconf.width*0.3-boutonconf.xScale*boutonconf.width*0.5
			boutonconf.y=contentcentery+fenetreconf.yScale*fenetreconf.height*0.5-boutonconf.yScale*boutonconf.height*0.5
			boutonrefu.isVisible=false
			if ratetext==nil then
				if not goh then
					apropostext=display.newGroup()
					apropostext.x=contentcenterx
					apropostext.y=contentcentery
					apropostext.text=display.newEmbossedText(texttraduction.changelog[1],0,-24*apparence,fenetreconf.xScale*fenetreconf.width*0.9,0,fonttype,24*apparence)--,,,fonttype, 24*apparence )
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
					function apropostext:tap(event)
						if isandroid then
							system.openURL("https://play.google.com/store/apps/details?id=com.Artha.goh")
						else
							system.openURL("https://play.google.com/store/apps/details?id=com.Artha.goh")
						end
					end
					apropostext:addEventListener("tap",apropostext)
					fenconf:insert(apropostext)
				else
					apropostext=display.newEmbossedText(texttraduction.changelog[1],contentcenterx,contentcentery-24*apparence,fenetreconf.xScale*fenetreconf.width*0.6,0,fonttype,24*apparence*fontsize)--,,,fonttype, 24*apparence )
					apropostext:setEmbossColor(colortextemb)
					fenconf:insert(apropostext)
				end
			end
			transition.to(recfondaffmenu,{time=500,alpha=0.8})
		elseif typeaff==6 then
			savegameidtext1=display.newEmbossedText("You can share your save game only once to one device",contentcenterx,contentcentery-44*apparence,fenetreconf.xScale*fenetreconf.width*0.6,0,fonttype,16*apparence*fontsize)
			savegameidtext1:setEmbossColor(colortextemb)
			savegameidtext1:setFillColor(0.5)
			fenconf:insert(savegameidtext1)
			savegameidtext=display.newImage(imagemenu.savebt,1)
			savegameidtext.x=contentcenterx
			savegameidtext.y=contentcentery-20*apparence
			savegameidtext.yScale=24*apparence/savegameidtext.height
			if goh then
				savegameidtext.yScale=savegameidtext.yScale*1.8
			end
			savegameidtext.xScale=savegameidtext.yScale --fenetreconf.xScale*fenetreconf.width*0.25/savegameidtext.width
			fenconf:insert(savegameidtext)
			function savegameidtext:tap( event )
				if savegame.share==1 then
					savegameidtext1.text="You have already share you id. Wait next update of the app"
					savegameidtext.isVisible=false
				else
					print("savegame share first time")
					savegameidtext1.text="Your save id:"
					fenconf:remove(savegameidtext)
					savegameidtext:removeSelf()
					savegameidtext=nil
					savegameidtext=display.newEmbossedText("",contentcenterx,contentcentery-20*apparence,fonttype,24*apparence*fontsize)
					savegameidtext:setEmbossColor(colortextemb)
					fenconf:insert(savegameidtext)
					local serveur=require("serveur")
					envoiedelasauvegarde(savegameidtext)
				end
			end
			savegameidtext:addEventListener( "tap",savegameidtext)

			local function textListener( event )
				if ( event.phase == "began" ) then
					event.target.text=""
				elseif ( event.phase == "ended" or event.phase == "submitted" ) then

					if string.len(event.target.text)==10 and event.target.text~="0123456789" then
						savegameclic(event.target,true)
					else
						event.target.text="10 digit is require "..string.len(event.target.text)
					end
				elseif ( event.phase == "editing" ) then
				end
			end
			savegameidtext3 = native.newTextField( 0, 0, 180, 30)
			if not issimulator then
				savegameidtext3:setTextColor(1,1,1)
				savegameidtext3.hasBackground=false
			else
				savegameidtext3:setTextColor(0,0,0)
			end
			savegameidtext3.inputType="number"
			savegameidtext3.text="0123456789"
			savegameidtext3.font=native.newFont(fonttype,18)
			savegameidtext3:addEventListener( "userInput", textListener )
			savegameidtext3.x=contentcenterx
			savegameidtext3.y=contentcentery+fenetreconf.yScale*fenetreconf.height*0.5-savegameidtext3.yScale*savegameidtext3.height*0.5*1.2
			fenconf:insert(savegameidtext3)

			savegameidtext4=display.newRect( 0, 0, 180, 30)
			savegameidtext4.x=savegameidtext3.x
			savegameidtext4.y=savegameidtext3.y
			savegameidtext4.strokeWidth=2
			savegameidtext4:setStrokeColor(0.8,0.8,0.8,0.8)
			savegameidtext4:setFillColor(1,0.2)
			fenconf:insert(savegameidtext4)

			savegameidtext2=display.newEmbossedText("Enter the number of the savegame to load:",contentcenterx,savegameidtext3.y-savegameidtext3.yScale*savegameidtext3.height*0.5*1.2-16*apparence,fenetreconf.xScale*fenetreconf.width*0.6,0,fonttype,16*apparence*fontsize)
			savegameidtext2:setEmbossColor(colortextemb)
			savegameidtext2:setFillColor(0.5)
			fenconf:insert(savegameidtext2)
		else --7
			reinittext=display.newEmbossedText("Do you want to cancel all your upgrade?",contentcenterx,contentcentery-44*apparence,fenetreconf.xScale*fenetreconf.width*0.6,0,fonttype,16*apparence*fontsize)
			reinittext:setEmbossColor(colortextemb)
			fenconf:insert(reinittext)
			boutonconf.x=contentcenterx+fenetreconf.xScale*fenetreconf.width*0.3-boutonconf.xScale*boutonconf.width*0.5
			boutonconf.y=contentcentery+fenetreconf.yScale*fenetreconf.height*0.5-boutonconf.yScale*boutonconf.height*0.5
			boutonrefu.isVisible=true
			boutonrefu.x=contentcenterx-fenetreconf.xScale*fenetreconf.width*0.3+boutonrefu.xScale*boutonrefu.width*0.5
			boutonrefu.y=contentcentery+fenetreconf.yScale*fenetreconf.height*0.5-boutonrefu.yScale*boutonrefu.height*0.5
		end
		if typeaff~=3 then
			fenetreconf.isVisible=true
			transition.to(recfondaffmenu,{time=500,alpha=0.5})
		end
		fenconf.isVisible=true
		fenconf.x=0
		fenconf.y=0
		transition.from(fenconf,{time=500,transition=easing.outCirc, x=xmaxscreen+fenetreconf.width*fenetreconf.xScale*0.5})
		recfondaffmenu.isVisible=true

	end
	-- si on clique a coter de la fenetre quite l'aff (clic sur background mais pas sur fenconf)

	local sequenceDataquitter =
	{
	    name="walking",
	    frames= {1,2},
	    time=100,
	    loopCount = 1,
	}
	local bpretmenu
	if not menulud then
		bpretmenu=display.newSprite(imagemenu.quitter,sequenceDataquitter)
		bpretmenu:setFrame(1)
	elseif not goh then
		bpretmenu=display.newImage(imagemenu.quitterlud,1)
	end
	local platformName = system.getInfo( "platformName" )
	if (isandroid or ( platformName == "WinPhone" ) or platformName=="Win" or issimultor) and not goh then
		bpretmenu.xScale=actualcontentwidth/6/bpretmenu.width -- 0.3
		bpretmenu.yScale=bpretmenu.xScale
		bpretmenu.x=xmaxscreen-bpretmenu.xScale*bpretmenu.width*0.5
		bpretmenu.y=ymaxscreen-bpretmenu.height*bpretmenu.yScale*0.5
		grmain:insert(bpretmenu)
		function bpretmenu:tap( event )
			clicqqpartf()
			if not inappaff then
				clicsurrecfondaffmenu=true
				local function clicsurgrintimer(event)
					clicsurrecfondaffmenu=false
				end
				timer.performWithDelay(50,clicsurgrintimer)
				typeaff=1
				if not menulud then
					bpretmenu:setFrame(2)
					local function eventtimerquitter(event)
						bpretmenu:setFrame(1)
					end
					timer.performWithDelay(1000,eventtimerquitter)
				end
				affmenu()
			end
		end
		bpretmenu:addEventListener( "tap", bpretmenu )
	elseif not goh then
		bpretmenu.isVisible=false
	end

	local bpapropos
	if not goh then
		bpapropos=display.newImage(imbouton.menupause,12)
		bpapropos.x=xmaxscreen-50*3/5
		if not menulud then
			bpapropos.y=yminscreen+2*50
		else
			bpapropos.y=yminscreen+6.2/5*50
		end
		bpapropos.xScale=3/5
		bpapropos.yScale=3/5
	else
		bpapropos=display.newSprite(imagemenu.setting,{frames={3,4},time=100,loopCount=1})
		bpapropos:setFrame(1)
		bpapropos.yScale=bpreglageson.yScale --actualcontentheight/10/bpapropos.height
		bpapropos.xScale=bpapropos.yScale
		bpapropos.y=bpreglageson.y --ymaxscreen-bpapropos.yScale*bpapropos.height*0.75
		bpapropos.x=xmaxscreen-bpapropos.xScale*bpapropos.width*0.75
	end
	grmain:insert(bpapropos)
	function bpapropos:tap(event)
		clicqqpartf()
		if not inappaff then
			clicsurrecfondaffmenu=true
			local function clicsurgrintimer(event)
				clicsurrecfondaffmenu=false
			end
			timer.performWithDelay(50,clicsurgrintimer)
			typeaff=3
			affmenu()
			if goh then
				bpapropos:setFrame(2)
				local function remisebp(event)
					if grmain~=nil then
						if bpapropos~=nil then
							bpapropos:setFrame(1)
						end
					end
				end
				timer.performWithDelay(1000,remisebp)
			end
		end
	end
	bpapropos:addEventListener("tap",bpapropos)

	if not menulud then
		bpreglage=display.newImage(imbouton.menupause,5)
		bpreglage.x=xmaxscreen-50*3/5
		bpreglage.y=yminscreen+6.2/5*50
		bpreglage.xScale=3/5
		bpreglage.yScale=3/5
		grmain:insert(bpreglage)
	elseif goh then
		bpreglage=display.newSprite(imagemenu.setting,{frames={5,6},time=100,loopCount=1})
		bpreglage:setFrame(1)
		bpreglage.xScale=bpapropos.xScale
		bpreglage.yScale=bpreglage.xScale
		bpreglage.y=bpapropos.y
		bpreglage.x=xmaxscreen-bpapropos.xScale*bpapropos.width*2.75
		grmain:insert(bpreglage)
	end
	function bpreglage:tap( event )
		if not inappaff and typeaff==0 then
			clicsurrecfondaffmenu=true
			local function clicsurgrintimer(event)
				clicsurrecfondaffmenu=false
			end
			timer.performWithDelay(50,clicsurgrintimer)
			typeaff=2
			if menulud and not goh then
				print("here bug?")
				bpreglage:setFrame(2)
			end
			if goh then
				bpreglage:setFrame(2)
				local function remisebp(event)
					if grmain~=nil then
						if bpreglage~=nil then
							bpreglage:setFrame(1)
						end
					end
				end
				timer.performWithDelay(1000,remisebp)
			end
			affmenu()
		end
	end
	bpreglage:addEventListener( "tap", bpreglage )
	local function collectgarbagelaunch()
		collectgarbage("collect")
		if issimulator then
			print("collectgarbage mainbis apres"..collectgarbage("count"))
			local memUsed = (collectgarbage("count")) / 1000
			local texUsed = system.getInfo( "textureMemoryUsed" ) / 1000000
			print("\n---------MEMORY USAGE INFORMATION removepartiel apres---------")
			print("System Memory Used:", string.format("%.03f", memUsed), "Mb")
			print("Texture Memory Used:", string.format("%.03f", texUsed), "Mb")
			print("------------------------------------------\n")
		end
	end
	timer.performWithDelay( 200,collectgarbagelaunch)
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
						if typeaff==1 then
			   				return false
			  		 	else
		        			typeaff=1
							affmenu()
						end
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
	afftutomain(grmain,boutonPlay,groupboutonplay,boutonplaylud,boutonDev,bpretmenu,bpreglage)
	if savegame.rate~=nil and tutoaffi==0 and aprespartie~=nil then
		if savegame.rate>=0 then
			local nbetoilett=0
			for i=1,4 do
				for j=1,4 do
					nbetoilett=nbetoilett+savegameresul[((j+(i-1)*4)-1)*4+3]
				end
			end
			if nbetoilett>10+savegame.rate*4 then
				while nbetoilett>10+savegame.rate*4 do
					savegame.rate=savegame.rate+1
				end
				local loadsave=require("loadsave")
				loadsave.saveTable(savegame,"undeuxtroissoleil.json")
				typeaff=4
				affmenu()
			end
		end
	end
	if changelog and typeaff==0 then
		changelog=false
		typeaff=5
		affmenu()
	end
	if not menulud then
		transition.from(boutonPlay,{time=250,transition=easing.outQuad, y=yminscreen-boutonPlay.yScale*boutonPlay.height*0.5})
		transition.from(boutonbonus,{time=250,transition=easing.outQuad, y=yminscreen-boutonbonus.yScale*boutonbonus.height*0.5})
		if boutonmulti~=nil then
			transition.from(boutonmulti,{time=350,transition=easing.outQuad, y=yminscreen-boutonmulti.yScale*boutonmulti.height*0.5})
			transition.from(chainemulti,{time=350,transition=easing.outQuad, y=yminscreen-chainemulti.yScale*chainemulti.height*0.5})
		end
	end
	if 300*7<=mathabs(fric1) then
		boutonDev.fill.effect = "filter.exposure"
		boutonDev.fill.effect.exposure =0
		local obj=boutonDev.fill.effect
		for i=0,8 do
			transition.to(obj,{delay=2200*i,time=2000,exposure=2,transition=easing.continuousLoop, onComplete=objecttransition } )
		end
	end

	end
	t.mainbis= function()
	local a=1
end
return t