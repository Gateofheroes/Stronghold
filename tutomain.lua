local t={}
function inittutomain()
	local tutoaffi=0
	local tutoaffim
	local fleche
	local texttuto
	local tutocarre
	if savegame.tuto4==nil then -- correction
		if savegame.tuto2 then
			savegame.tuto4=true
		else
			savegame.tuto4=false
		end
	end
	local dejafait=false
	function tutoclicplaylud(tutocomplet,boutonplaylud,groupboutonplay,groupboutonlud,boutonPlay)
		if tutoaffi~=0 and not dejafait then
			dejafait=true
			if not savegame.tuto1 then
				if boutonplaylud.group==0 then

				else
					tutocomplet:remove(boutonplaylud)
					groupboutonplay:insert(boutonplaylud)
					boutonplaylud.group=0
				end
			end
			tutoaffim:remove(fleche)
			groupboutonlud:insert(fleche)
			if goh then
				fleche.yScale=-fleche.yScale
			end
			fleche.x=boutonPlay.x-fleche.xScale*fleche.width*0.5-boutonPlay.xScale*boutonPlay.width*0.4
			fleche.y=boutonPlay.y-fleche.yScale*fleche.height*0.5+boutonPlay.yScale*boutonPlay.height*0.4
			texttuto:removeSelf()
			texttuto=nil
			-- tutoaffim:remove(texttuto)
			-- groupboutonlud:insert(texttuto)
			if tutocarre~=nil then
				tutocomplet:remove(tutocarre)
				tutocarre:removeSelf()
				tutocarre=nil
			end
			if tutocomplet~=nil then
				grmain:remove(tutocomplet)
				tutocomplet:removeSelf()
				tutocomplet=nil
			end
		end
	end
	function tutoinitchangegroup(grmain,boutonPlay,boutonbonus,boutonDev,boutonmulti,chainemulti,grouplud)
		if savegame.tuto1 and not menulud then
			grmain:insert(boutonPlay)
		end
		if not menulud then
			grmain:insert(boutonbonus)
		end
		if savegame.tuto1 and not savegame.tuto4 then
		else
			grmain:insert(boutonDev)
		end
		if boutonmulti~=nil and not menulud then
			grmain:insert(boutonmulti)
			grmain:insert(chainemulti)
		end
		if menulud then
			grmain:insert(grouplud)
		end
	end
	function tutochoix()
		tutoaffi=0 -- 0 pas de tuto, 1 bp play, 2 dev, 3 niveau bonus, 4 parametre
		if not savegame.tuto1 then
			tutoaffi=1
			print("here a 1?")
		elseif not savegame.tuto4 then
			print("here a 2?")
			tutoaffi=2
		elseif not savegame.tuto2 then
			print("here a 3?")
			tutoaffi=1
		elseif not savegame.tuto2 or not savegame.tuto3 then
			print("here a 4?")
			tutoaffi=mathrandom(1,2)
		else
			print("here a 5?")
			tutoaffi=mathrandom(-50,4)
			if tutoaffi<0 then
				tutoaffi=0
			end
		end
		if tutoaffi==3 and menulud then
			tutoaffi=0
		end
		return tutoaffi
	end
	function removetuto(grmain,boutonPlay,groupboutonplay,boutonplaylud,boutonDev)
		if tutoaffim~=nil then
			print("remove tuto")
			--tutoaffim:remove(fleche)
			fleche:removeSelf()
			fleche=nil
			if texttuto~=nil then
				tutoaffim:remove(texttuto)
				texttuto:removeSelf()
				texttuto=nil
			end
			display.remove(tutoaffim)
			tutoaffim=nil
			if boutonplaylud~=nil then
				if boutonplaylud.group==0 then

				else
					--tutocomplet.remove(boutonplaylud)
					groupboutonplay:insert(boutonplaylud)
					boutonplaylud.group=0
				end
			end
			if tutocomplet~=nil then
				if not savegame.tuto1 then
					if not menulud then
						tutocomplet:remove(boutonPlay)
						grmain:insert(boutonPlay)
					elseif boutonplaylud~=nil and not dejafait then
						if boutonplaylud.group==0 then

						else
							tutocomplet.remove(boutonplaylud)
							groupboutonplay:insert(boutonplaylud)
							boutonplaylud.group=0
						end
						-- boutonplaylud
					end
				elseif boutonplaylud~=nil then
					if boutonplaylud.group==0 then

					else
						tutocomplet:remove(boutonDev)
						grmain:insert(boutonDev)
					end
				end
				print("tutoaffi "..tutoaffi)
				if boutonplaylud~=nil and tutoaffi==0 then
					if boutonplaylud.group==0 then

					else
						tutocomplet.remove(boutonplaylud)
						groupboutonplay:insert(boutonplaylud)
						boutonplaylud.group=0
					end
				end
				if not menulud then
					tutocomplet:remove(boutonPlay)
					grmain:insert(boutonPlay)
				end
				-- tutocomplet.remove(tutocarre)
				display.remove(tutocarre)
				-- tutocarre:removeSelf()
				tutocarre=nil
				print("remove tutocomplet l119")
				display.remove(tutocomplet)
				-- grmain:remove(tutocomplet)
				-- tutocomplet:removeSelf()
				tutocomplet=nil
			end
			if boutontutoskip~=nil then
				boutontutoskip:removeSelf()
				boutontutoskip=nil
			end
			if tutocarre~=nil then
				tutocarre:removeSelf()
				tutocarre=nil
			end
		end
		tutoaffi=0
		return tutoaffi
	end
	function tutocreategroup(grmain)
		print("tutoaffi "..tutoaffi)
		if tutoaffi~=0 then
			tutoaffim=display.newGroup()
			print("group cree")
			if not savegame.tuto1 then
				--tutocomplet:insert(tutoaffim)
			else
				grmain:insert(tutoaffim)
			end
		end
	end
	function afftutomain(grmain,boutonPlay,groupboutonplay,boutonplaylud,boutonDev,bpretmenu,bpreglage)
		if savegame.tuto1 then
			print("savegame.tuto1 true")
		else
			print("savegame.tuto1 false")
		end
		if not savegame.tuto1 or not savegame.tuto4 then
			print("tuto aide total")
			tutocomplet=display.newGroup()
			grmain:insert(tutocomplet)
			tutocarre=display.newRect(contentcenterx,contentcentery,xmaxscreen-xminscreen,ymaxscreen-yminscreen)
			tutocomplet:insert(tutocarre)
			tutocarre:setFillColor(0)
			tutocarre.alpha=0.5
			print("tuto1 complet\n\n\n\n\n\n")
			if not savegame.tuto1 then
				if not menulud then
					tutocomplet:insert(boutonPlay)
				else
					print("action sur boutonplaylud l166")
					if boutonplaylud.group~=1 then
						groupboutonplay:remove(boutonplaylud)
						tutocomplet:insert(boutonplaylud)
						boutonplaylud.group=1
					end
				end
			else
				tutocomplet:insert(boutonDev)
			end
			tutocomplet:insert(tutoaffim)
			boutontutoskip=display.newImage(imagemenu.bpmenuprin,2)
			boutontutoskip.xScale=actualcontentwidth/10*apparence/boutontutoskip.width
			boutontutoskip.yScale=boutontutoskip.xScale
			boutontutoskip.x=xmaxscreen-boutontutoskip.width*boutontutoskip.xScale*0.5
			boutontutoskip.y=ymaxscreen-boutontutoskip.height*boutontutoskip.yScale*0.5
			if goh then
				boutontutoskip.x=boutontutoskip.x-(actualcontentheight/10*3.5)
			end
			if bpretmenu~=nil then
				bpretmenu.isVisible=false
			end
			function boutontutoskip:tap(event)
				clicqqpartf()
				print("Vient de tutomain")
				removetuto(grmain,boutonPlay,groupboutonplay,boutonplaylud,boutonDev)
				savegame.tuto3=true
				savegame.tuto2=true
				savegame.tuto1=true
				savegame.tuto4=true
				local loadsave = require("loadsave")
				loadsave.saveTable(savegame, "undeuxtroissoleil.json" )	
			end
			boutontutoskip:addEventListener( "tap", boutontutoskip )
		else
			print("tuto1 incomplet\n\n\n\n\n\n"..tutoaffi)
		end
		print("tutoaffi "..tutoaffi)
		if tutoaffi~=0 then
			fleche=display.newImage(imbouton.fleche,1)
			fleche.alpha=1--0.8
			tutoaffim:insert(fleche)
			if tutocarre~=nil then
				fleche.fill.effect = "filter.exposure"
				fleche.fill.effect.exposure =0
				transition.to(fleche.fill.effect, { delay=2000,time=5000, exposure=0.8,transition=easing.continuousLoop,iterations=0 } )
			end
			local letextetuto=""
			if tutoaffi==1 then
				if menulud then
					print("here")
					fleche.yScale=fleche.yScale*0.7
					fleche.xScale=fleche.xScale*0.7
					fleche.x=boutonplaylud.x-fleche.xScale*fleche.width*0.5-boutonplaylud.xScale*boutonplaylud.width*0.4
					if not goh then
						fleche.yScale=-fleche.yScale
						fleche.y=boutonplaylud.y-fleche.yScale*fleche.height*0.5+boutonplaylud.yScale*boutonplaylud.height*0.4
					else
						fleche.y=boutonplaylud.y-fleche.yScale*fleche.height*0.5-boutonplaylud.yScale*boutonplaylud.height*0.4
					end
				else
					fleche.x=boutonPlay.x-fleche.xScale*fleche.width*0.5-boutonPlay.xScale*boutonPlay.width*0.4
					fleche.yScale=-fleche.yScale
					fleche.y=boutonPlay.y-fleche.yScale*fleche.height*0.5+boutonPlay.yScale*boutonPlay.height*0.4
				end
				letextetuto=texttraduction.comp[2] --"History"
			elseif tutoaffi==2 then
				fleche.xScale=-fleche.xScale
				fleche.x=boutonDev.x-fleche.xScale*fleche.width*0.5+boutonDev.xScale*boutonDev.width*0.4
				fleche.y=boutonDev.y-fleche.yScale*fleche.height*0.5-boutonDev.yScale*boutonDev.height*0.2
				letextetuto=texttraduction.comp[3] --"Upgrades:\nUnlock new buildings,\npower and general"
			elseif tutoaffi==3 then
				fleche.x=boutonbonus.x+fleche.xScale*fleche.width*0.5+boutonbonus.xScale*boutonbonus.width*0.4
				fleche.xScale=-fleche.xScale
				fleche.yScale=-fleche.yScale
				fleche.y=boutonbonus.y-fleche.yScale*fleche.height*0.5+boutonbonus.yScale*boutonbonus.height*0.4
				letextetuto=texttraduction.comp[4] --"Extra level"
			else
				fleche.x=bpreglage.x-fleche.xScale*fleche.width*0.5-bpreglage.xScale*bpreglage.width*0.4
				fleche.yScale=-fleche.yScale
				fleche.y=bpreglage.y-fleche.yScale*fleche.height*0.5+bpreglage.yScale*bpreglage.height*0.4
				letextetuto=texttraduction.comp[5] --"Setting:\nchoose the volume\nand desactive the\nbackground music"
			end
			if isiphone then
				local letextetutolen=string.len(letextetuto)*(24*0.5)+1
				print("letextetutolen "..letextetutolen)
				texttuto=display.newEmbossedText(tutoaffim,letextetuto,fleche.x-fleche.xScale*fleche.width*0.5,fleche.y-fleche.yScale*fleche.height*0.5,letextetutolen,0,fonttype,24*fontsize)
			else
				texttuto=display.newEmbossedText(tutoaffim,letextetuto,fleche.x-fleche.xScale*fleche.width*0.5,fleche.y-fleche.yScale*fleche.height*0.5,fonttype,24*fontsize)
			end
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
			if not savegame.tuto1 or not savegame.tuto4 then
				texttuto:setFillColor(0.9,0.9,0.9)
			else
				texttuto:setFillColor(0.5,0.5,0.5)
			end
			texttuto:setEmbossColor(colortextemb)
			function fleche:tap( event )
				if not inappaff then
					removetuto(grmain,boutonPlay,groupboutonplay,boutonplaylud,boutonDev)
				end
			end
			fleche:addEventListener( "tap",fleche)
			function texttuto:tap( event )
				if not inappaff then
					removetuto(grmain,boutonPlay,groupboutonplay,boutonplaylud,boutonDev)
				end
			end
			texttuto:addEventListener( "tap",texttuto)
			if not savegame.tuto1 or not savegame.tuto4 then
				texttuto.xScale=1.1
				texttuto.yScale=texttuto.xScale
				transition.to(texttuto,{time=100,transition=easing.inCirc,xScale=1,yScale=1})
			end
		end
	end
end
t.chargementmain=function()
end
return t