local t = {}--mode tuto
t.tuto = function ()
	-- grtuto=display.newGroup()
	-- grpartie:insert(grtuto)
	function chargementtuto()
		--if imbouton.fleche==nil then
		--	imbouton.fleche=graphics.newImageSheet("tuto/fleche.png", { width=100, height=100, numFrames=1 } )
		--end
		fleche=display.newImage(imbouton.fleche,1)
		fleche.fill.effect = "filter.exposure"
		fleche.fill.effect.exposure =0
		transition.to(fleche.fill.effect, {delay=4000, time=3000, exposure=0.8,transition=easing.continuousLoop,iterations=0 } )
		grpartie:insert(fleche)
		fleche.group=0
		fleche.type=true -- true pour img de fleche
		fleche.isVisible=false
		texttuto=display.newEmbossedText({text="",x=contentcenterx,y=affinfotab.fond.y-affinfotab.fond.height*affinfotab.fond.yScale*0.5-22,width=actualcontentwidth*0.8,height=0,font=fonttype,fontSize=20,align="center"} )
		texttuto:setFillColor(0.6,0.12,0.12)
		texttuto:setEmbossColor(colortextemb)
		grpartie:insert(texttuto)
		texttuto.isVisible=false
		flecheentrecre=0
		boutontutoskip=display.newImage(imagemenu.bpmenuprin,2)
		boutontutoskip.xScale=actualcontentwidth/10*apparence/boutontutoskip.width
		boutontutoskip.yScale=boutontutoskip.xScale
		boutontutoskip.x=xminscreen+boutontutoskip.width*boutontutoskip.xScale*0.5
		boutontutoskip.y=ymaxscreen-boutontutoskip.height*boutontutoskip.yScale*0.5
		if niveauch==3 then
			boutontutoskip.x=xminscreen+boutontutoskip.width*boutontutoskip.xScale*0.5
			boutontutoskip.y=yminscreen+boutontutoskip.height*boutontutoskip.yScale*0.5
		end
		function boutontutoskip:tap(event)
			tuto=1
			if jeupause.etat==1 then
				tuto=1
				print(" jeupause.etat 418 "..jeupause.etat)
				appuipause()
				print(" jeupause.etat 420 "..jeupause.etat)
			end
			fleche.isVisible=false
			texttuto.isVisible=false
			boutontutoskip.isVisible=false
			if flecheentrecre==1 then
				flecheentrecre=2
				background:remove(flecheentre)
				flecheentre:removeSelf()
				flecheentre=nil
				background:remove(flecheentretx)
				flecheentretx:removeSelf()
				flecheentretx=nil
			end
			if flecheentrecre~=nil then
				flecheacccre=nil
			end
			if flecheacc~=nil then
				background:remove(flecheacc)
				flecheacc:removeSelf()
				flecheacc=nil
				background:remove(flecheacctx)
				flecheacctx:removeSelf()
				flecheacctx=nil
			end
			if lancervague1.isVisible1==true then
				lancervague1.isVisible=true
				lancervague1.y=contentcentery-actualcontentheight/2.1+lancervague1.yScale*lancervague1.height*0.5
				if lancervague1chaine~=nil then
					lancervague1chaine.isVisible=true
				end
			end
			savegame.tuto3=true
			savegame.tuto2=true
			savegame.tuto1=true
			savegame.tuto4=true
			tutoaction=-1
			tutoactionfaite=1
			print("vagueencours="..vagueencours)
			local loadsave = require("loadsave")
			loadsave.saveTable(savegame, "undeuxtroissoleil.json" )
		end
		boutontutoskip:addEventListener( "tap", boutontutoskip )
	end
	function lancementtuto(numero) -- numero du tuto
		print("etape tuto "..numero)
		tuto=2
		tutoaction=numero
		tutoactionfaite=0 -- 0 pour pas encore faite et 1 faite
		fleche.isVisible=true
		texttuto.isVisible=true
		-- if jeupause.etat==1 then
		-- 	tuto=1
		-- 	appuipause()
		-- 	tuto=2
		-- end
		if numero==0 then
			if flecheentrecre==0 then
				flecheentrecre=1
				flecheentre=display.newImage(imbouton.fleche,1)
				effecttranstion(flecheentre)
				background:insert(flecheentre)
				flecheentre.x=vagsui.x+flecheentre.width*flecheentre.xScale*0.8 -- (-background.x+xminscreen)/taille -- +flecheentre.width*flecheentre.xScale
				flecheentre.y=vagsui.y --(-background.y+contentcentery)/taille
				flecheentre.xScale=-1
				flecheentre:rotate(45)
				flecheentre:setFillColor(1,0,0)
				flecheentretx=display.newEmbossedText(texttraduction.tuto[1],flecheentre.x+32*5,flecheentre.y+16+flecheentre.yScale*flecheentre.height*0.25,fonttype, 32 )
				flecheentretx:setFillColor(0.5,0.1,0.1)
				flecheentretx:setEmbossColor(colortextemb)
				background:insert(flecheentretx)
			end
			print("ici maggle")
			-- fleche=display.newImage(imbouton.fleche,1)
			-- grpartie:insert(fleche)
			if fleche.group==1 then
				background:remove(fleche)
				fleche.group=0 -- 0 pour grpartie,2048 pour group
				grpartie:insert(fleche)
			end
			if not fleche.type then
				grpartie:remove(fleche)
				fleche:removeSelf()
				fleche=display.newImage(imbouton.fleche,1)
				fleche.fill.effect = "filter.exposure"
				fleche.fill.effect.exposure =0
				transition.to(fleche.fill.effect, {time=5000, exposure=0.8,transition=easing.continuousLoop,iterations=0 } )
				grpartie:insert(fleche)
				fleche.group=0
				fleche.xScale=1.2
				fleche.yScale=1.2
				fleche.type=true
				print("remplace fleche")
			end
			if jeupause.etat==0 then
				tuto=1
				appuipause()
				tuto=2
			end
			fleche.xScale=1.2
			fleche.yScale=1.2
			fleche.x=construire.x-construire.xScale*construire.width*0.4-fleche.width*0.5*fleche.xScale
			fleche.y=construire.y-construire.yScale*construire.height*0.4-fleche.height*0.5*fleche.yScale
			transition.from(fleche,{time=200,transition=easing.inCirc, x=fleche.x+fleche.width*0.1*fleche.xScale,y=fleche.y+fleche.height*0.1*fleche.yScale,xScale=fleche.xScale*0.9,yScale=fleche.yScale*0.9})
			texttuto.text=texttraduction.tuto[2] --"Click to build a tower"
			texttuto.xScale=1.1
			texttuto.yScale=texttuto.xScale
			transition.to(texttuto,{time=100,transition=easing.inCirc,xScale=1,yScale=1})
			texttuto.y=yminscreen+actualcontentheight*0.25  --affinfotab.fond.y-affinfotab.fond.height*affinfotab.fond.yScale*0.5-22
		elseif numero==1 then
			if flecheentrecre==1 then
				flecheentrecre=2
				background:remove(flecheentre)
				flecheentre:removeSelf()
				flecheentre=nil
				background:remove(flecheentretx)
				flecheentretx:removeSelf()
				flecheentretx=nil
			end
			if fleche.group==1 then
				background:remove(fleche)
				fleche.group=0 -- 0 pour grpartie,2048 pour group
				grpartie:insert(fleche)
			end
			local batinf=false
			local batarch=false
			if nbbatiment>=1 then
				for i=1,nbbatiment do
					if ibatiment[i].type1==1 then
						batinf=true
					elseif ibatiment[i].type1==2 then
						batarch=true
					end
				end
			end
			local xenv,yenv
			if not batinf then
				xenv=construireinf.x1
				yenv=construireinf.y1
				texttuto.text=texttraduction.tuto[3] --"Build an infantery tower"
			else
				xenv=construirearch.x1
				yenv=construirearch.y1
				texttuto.text=texttraduction.tuto[4] --"Build an archer tower"
			end
			fleche.x=xenv-fleche.width*0.6*fleche.xScale
			fleche.y=yenv-fleche.height*0.6*fleche.yScale
			transition.from(fleche,{time=200,transition=easing.inCirc, x=fleche.x+fleche.width*0.1*fleche.xScale,y=fleche.y+fleche.height*0.1*fleche.yScale,xScale=fleche.xScale*0.9,yScale=fleche.yScale*0.9})
			-- texttuto.y=affinfotab.fond.y-affinfotab.fond.height*affinfotab.fond.yScale*0.5-22
			texttuto.xScale=1.1
			texttuto.yScale=texttuto.xScale
			transition.to(texttuto,{time=100,transition=easing.inCirc,xScale=1,yScale=1})
			texttuto.y=yminscreen+actualcontentheight*0.25
		elseif numero==2 then
			if flecheentrecre==1 then
				flecheentrecre=2
				background:remove(flecheentre)
				flecheentre:removeSelf()
				flecheentre=nil
				background:remove(flecheentretx)
				flecheentretx:removeSelf()
				flecheentretx=nil
			end
			if fleche.group==0 then
				grpartie:remove(fleche)
				fleche.group=1 -- 0 pour grpartie,2048 pour group
				background:insert(fleche)
			end
			
			if fleche.type then
				background:remove(fleche)
				fleche:removeSelf()
				fleche=display.newImage(imbouton.swipe,1)
				fleche.fill.effect = "filter.exposure"
				fleche.fill.effect.exposure =0
				transition.to(fleche.fill.effect, {time=5000, exposure=0.8,transition=easing.continuousLoop,iterations=0 } )
				background:insert(fleche)
				fleche.group=1
				fleche.type=false
			end
			fleche.xScale=0.5
			fleche.yScale=0.5
			fleche.x=nbatiment.x+fleche.width*fleche.xScale*0.5 --+nbatiment.width*nbatiment.xScale*0.5
			fleche.y=nbatiment.y+fleche.height*fleche.yScale*0.5-- +nbatiment.height*nbatiment.yScale*0.5
			transition.from(fleche,{time=500,transition=easing.inCirc, x=nbatiment.x,y=nbatiment.y+fleche.height*fleche.yScale*0.25,xScale=fleche.xScale*0.8,yScale=fleche.yScale*0.8})
			-- fleche.x=nbatiment.x-fleche.width*0.6*fleche.xScale
			-- fleche.y=nbatiment.y-fleche.height*0.6*fleche.yScale
			texttuto.text=texttraduction.tuto[5] --"Place your tower\neverywhere on grass"
			texttuto.xScale=1.1
			texttuto.yScale=texttuto.xScale
			transition.to(texttuto,{time=100,transition=easing.inCirc,xScale=1,yScale=1})
			texttuto.y=yminscreen+actualcontentheight*0.25
			-- texttuto.y=affinfotab.fond.y-affinfotab.fond.height*affinfotab.fond.yScale*0.5-44
		elseif numero==3 then
			local batinf=false
			local batarch=false
			for i=1,nbbatiment do
				if ibatiment[i].type1==1 then
					batinf=true
				elseif ibatiment[i].type1==2 then
					batarch=true
				end
			end
			tuto=1
			print(" jeupause.etat 136 "..jeupause.etat)
			if jeupause.etat==1 then
				appuipause()
			end
			print(" jeupause.etat 138 "..jeupause.etat)
			fleche.isVisible=false
			texttuto.isVisible=false
			if not batinf then
				local function timer1func(event)
					print(" jeupause.etat 143 "..jeupause.etat)
					appuipause()
					print(" jeupause.etat 145 "..jeupause.etat)
					lancementtuto(0)
				end
				timer.performWithDelay(750,timer1func)
			elseif  not batarch then
				local function timer1func(event)
					print(" jeupause.etat 151 "..jeupause.etat)
					if jeupause.etat==0 then
						appuipause()
					end
					print(" jeupause.etat 153 "..jeupause.etat)
					lancementtuto(0)
				end
				timer.performWithDelay(750,timer1func)
			else
				lancervague1.isVisible=true
				lancervague1.y=contentcentery-actualcontentheight/2.1+lancervague1.yScale*lancervague1.height*0.5
				--lancervague1.isVisible1=true
				if lancervague1chaine~=nil then
					lancervague1chaine.isVisible=true
				end
				fleche.isVisible=true
				texttuto.isVisible=true
				if fleche.group==1 then
					tuto=2
					background:remove(fleche)
					fleche.group=0 -- 0 pour grpartie,2048 pour group
					grpartie:insert(fleche)
				end
				if not fleche.type then
					grpartie:remove(fleche)
					fleche:removeSelf()
					fleche=display.newImage(imbouton.fleche,1)
					fleche.fill.effect = "filter.exposure"
					fleche.fill.effect.exposure =0
					transition.to(fleche.fill.effect, {time=5000, exposure=0.8,transition=easing.continuousLoop,iterations=0 } )
					grpartie:insert(fleche)
					fleche.group=0
					fleche.xScale=1.2
					fleche.yScale=1.2
					fleche.type=true
					print("remplace fleche")
				end
				fleche.yScale=-fleche.yScale
				fleche.x=lancervague1.x-fleche.width*0.6*fleche.xScale
				fleche.y=lancervague1.y-fleche.height*0.6*fleche.yScale
				transition.from(fleche,{time=200,transition=easing.inCirc, x=fleche.x+fleche.width*0.1*fleche.xScale,y=fleche.y+fleche.height*0.1*fleche.yScale,xScale=fleche.xScale*0.9,yScale=fleche.yScale*0.9})
				texttuto.text=texttraduction.tuto[6] --"Launch the first wave of ennemy"
				grpartie:remove(texttuto)
				grpartie:insert(texttuto)
				texttuto.xScale=1.1
				texttuto.yScale=texttuto.xScale
				transition.to(texttuto,{time=100,transition=easing.inCirc,xScale=1,yScale=1})
				texttuto.y=fleche.y+20-fleche.height*fleche.yScale*0.5 --yminscreen+actualcontentheight*0.25
				if lancervague1.isVisible1==false then
					actionfaite()
					lancervague1.isVisible=false
					if lancervague1chaine~=nil then
						lancervague1chaine.isVisible=false
					end
				end
				--affinfotab.fond.y-affinfotab.fond.height*affinfotab.fond.yScale*0.5-22
				-- texttuto.y=affinfotab.fond.y-affinfotab.fond.height*affinfotab.fond.yScale*0.5-22
				-- fleche.isVisible=false
				-- tuto=1
				-- appuipause()
			end
		--elseif numero==4 then
		elseif numero==4 then
			print("numero 4")
			tuto=1
			fleche.isVisible=false
			texttuto.isVisible=false
			recfondpause.isVisible=true
			-- local imgsheetbat=graphics.newImageSheet( "tuto/bat.jpg", { width=1150, height=567, numFrames=1,sheetContentWidth=1150,sheetContentHeight=576  } )
			-- imginf=display.newImage(imgsheetbat,1)
			-- imginf.xScale=actualcontentwidth/imginf.width*0.8
			-- imginf.yScale=imginf.xScale
			-- imginf.x=contentcenterx
			-- imginf.y=contentcentery
			-- local function suppressiontutobat(origine)
			-- 	if imginf~=nil then
			-- 		imginf:removeSelf()
			-- 		imginf=nil
			-- 		recfondpause.isVisible=false
			-- 		imgsheetbat=nil
			-- 		if not origine then
			-- 			appuipause()
			-- 			lancementtuto(9)
			-- 		else
			-- 			local function timer1func1(event)
			-- 				appuipause()
			-- 				lancementtuto(9)
			-- 			end
			-- 			timer.performWithDelay(500,timer1func1)
			-- 		end
			-- 	end
			-- end
			-- local function timer1func(event)
			-- 	suppressiontutobat(false)
			-- end
			-- timer.performWithDelay(5000,timer1func)
			-- local function recfondpausetap(event)
			-- 	suppressiontutobat(true)
			-- 	recfondpause:removeEventListener( "tap",recfondpausetap)
			-- end
			-- recfondpause:addEventListener("tap",recfondpausetap)
		elseif numero==5 then
			if jeupause.etat~=1 then
				tuto=1
				print(" jeupause.etat 223 "..jeupause.etat)
				appuipause()
				print(" jeupause.etat 225 "..jeupause.etat)
				tuto=2
			end
			fleche.xScale=1.2
			fleche.yScale=1.2
			if fleche.group==0 then
				grpartie:remove(fleche)
				fleche.group=1 -- 0 pour grpartie,2048 pour group
				background:insert(fleche)
			end
			fleche.x=ibatiment[1].x1-fleche.width*0.6*fleche.xScale
			fleche.y=ibatiment[1].y1-fleche.height*0.6*fleche.yScale
			transition.from(fleche,{time=200,transition=easing.inCirc, x=fleche.x+fleche.width*0.1*fleche.xScale,y=fleche.y+fleche.height*0.1*fleche.yScale,xScale=fleche.xScale*0.9,yScale=fleche.yScale*0.9})
			texttuto.text=texttraduction.tuto[7] --"Rebuild the gold mine"
			texttuto.xScale=1.1
			texttuto.yScale=texttuto.xScale
			transition.to(texttuto,{time=100,transition=easing.inCirc,xScale=1,yScale=1})
		elseif numero==6 then
			tuto=1
			print(" jeupause.etat 240 "..jeupause.etat)
			if jeupause.etat==1 then
				appuipause()
			end
			print(" jeupause.etat 242 "..jeupause.etat)
			fleche.isVisible=false
			lancervague1.isVisible=true
			lancervague1.y=contentcentery-actualcontentheight/2.1+lancervague1.yScale*lancervague1.height*0.5
			--lancervague1.isVisible1=true
			if lancervague1chaine~=nil then
				lancervague1chaine.isVisible=true
			end
			fleche.isVisible=true
			texttuto.isVisible=true
			if fleche.group==1 then
				tuto=2
				background:remove(fleche)
				fleche.group=0 -- 0 pour grpartie,2048 pour group
				grpartie:insert(fleche)
			end
			fleche.yScale=-fleche.yScale
			fleche.x=lancervague1.x-fleche.width*0.6*fleche.xScale
			fleche.y=lancervague1.y-fleche.height*0.6*fleche.yScale
			transition.from(fleche,{time=200,transition=easing.inCirc, x=fleche.x+fleche.width*0.1*fleche.xScale,y=fleche.y+fleche.height*0.1*fleche.yScale,xScale=fleche.xScale*0.9,yScale=fleche.yScale*0.9})
			texttuto.text=texttraduction.tuto[8] --"Launch the first wave of ennemy"
			texttuto.xScale=1.1
			texttuto.yScale=texttuto.xScale
			transition.to(texttuto,{time=100,transition=easing.inCirc,xScale=1,yScale=1})
			if lancervague1.isVisible1==false then
				actionfaite()
				lancervague1.isVisible=false
				if lancervague1chaine~=nil then
					lancervague1chaine.isVisible=false
				end
			end
		elseif numero==7 then
			tuto=2
			fleche.isVisible=false
			texttuto.isVisible=false
			local function timer1func(event)
				-- tuto=2
				if tuto==2 then
					fleche.isVisible=true
					texttuto.isVisible=true
					ibatiment[1].chargement1.cpt=40
					ibatiment[1].argentcum=50
					if fleche.group==0 then
						grpartie:remove(fleche)
						fleche.group=1 -- 0 pour grpartie,2048 pour group
						background:insert(fleche)
					end
					fleche.yScale=-fleche.yScale
					fleche.x=ibatiment[1].x1-fleche.width*0.6*fleche.xScale
					fleche.y=ibatiment[1].y1-fleche.height*0.6*fleche.yScale
					transition.from(fleche,{time=200,transition=easing.inCirc, x=fleche.x+fleche.width*0.1*fleche.xScale,y=fleche.y+fleche.height*0.1*fleche.yScale,xScale=fleche.xScale*0.9,yScale=fleche.yScale*0.9})
					texttuto.text=texttraduction.tuto[9] --"Recolt gold"
					texttuto.xScale=1.1
					texttuto.yScale=texttuto.xScale
					transition.to(texttuto,{time=100,transition=easing.inCirc,xScale=1,yScale=1})
				end
			end
			timer.performWithDelay(3000,timer1func)
		elseif numero==8 then
			tuto=1
			if jeupause.etat==1 then
				tuto=1
				print(" jeupause.etat 281 "..jeupause.etat)
				appuipause()
				print(" jeupause.etat 283 "..jeupause.etat)
			end
			fleche.isVisible=false
			texttuto.isVisible=false
			boutontutoskip.isVisible=false
			savegame.tuto2=true
			local loadsave = require("loadsave")
			loadsave.saveTable(savegame, "undeuxtroissoleil.json" )
		elseif numero==9 then
			print("argent "..argent)
			if -300>=argent then
				fleche.isVisible=true
				texttuto.isVisible=true
				if fleche.group==0 then
					grpartie:remove(fleche)
					fleche.group=1 -- 0 pour grpartie,2048 pour group
					background:insert(fleche)
				end
				fleche.yScale=-fleche.yScale
				fleche.x=ibatiment[2].x1-fleche.width*0.6*fleche.xScale
				fleche.y=ibatiment[2].y1-fleche.height*0.6*fleche.yScale
				transition.from(fleche,{time=200,transition=easing.inCirc, x=fleche.x+fleche.width*0.1*fleche.xScale,y=fleche.y+fleche.height*0.1*fleche.yScale,xScale=fleche.xScale*0.9,yScale=fleche.yScale*0.9})
				texttuto.text=texttraduction.tuto[10] --"Upgrade your tower"
				texttuto.xScale=1.1
				texttuto.yScale=texttuto.xScale
				transition.to(texttuto,{time=100,transition=easing.inCirc,xScale=1,yScale=1})
				texttuto.y=yminscreen+actualcontentheight*0.25
				if jeupause.etat~=1 then
					print(" jeupause.etat 305 "..jeupause.etat)
					tuto=1
					appuipause()
					print(" jeupause.etat 307 "..jeupause.etat)
					tuto=2
				end
				-- tuto=1
				-- if jeupause.etat==1 then
				-- 	tuto=1
				-- 	appuipause()
				-- 	tuto=2
				-- end
				--texttuto.y=affinfotab.fond.y-affinfotab.fond.height*affinfotab.fond.yScale*0.5-22
			else
				tutoactionfaite=1
				lancementtuto(10)
			end
		elseif numero==10 then
			tuto=1
			print(" jeupause.etat 319 "..jeupause.etat)
			if jeupause.etat==1 then
				appuipause()
			end
			print(" jeupause.etat 321 "..jeupause.etat)
			fleche.isVisible=false
			texttuto.isVisible=false
			boutontutoskip.isVisible=false
			savegame.tuto1=true
			local loadsave = require("loadsave")
			loadsave.saveTable(savegame, "undeuxtroissoleil.json" )
		elseif numero==11 then
			tuto=2
			if jeupause.etat==1 then
				tuto=1
				print(" jeupause.etat 331 "..jeupause.etat)
				appuipause()
				print(" jeupause.etat 333 "..jeupause.etat)
				tuto=2
			end

			if flecheacccre==nil then
				flecheacccre=1
				flecheacc=display.newImage(imbouton.fleche,1)
				background:insert(flecheacc)
				flecheacc.x=vagsuib[2].x-flecheacc.width*0.5*flecheacc.xScale -- +flecheentre.width*flecheentre.xScale
				flecheacc.y=vagsuib[2].y+flecheacc.height*0.5*flecheacc.yScale
				flecheacc.yScale=-1
				--flecheacc:rotate(45)
				flecheacc:setFillColor(1,0,0)
				flecheacc.alpha=0.8
				flecheacctx=display.newEmbossedText(texttraduction.tuto[11],flecheacc.x+32*5,flecheacc.y-16-flecheacc.yScale*flecheacc.height*0.25,fonttype, 32 )
				flecheacctx:setFillColor(0.5,0.1,0.1)
				flecheacctx:setEmbossColor(colortextemb)
				background:insert(flecheacctx)
			end

			fleche.xScale=1.1
			fleche.yScale=fleche.xScale
			--appuipause()
			fleche.isVisible=false
			-- lancervague1.isVisible=true
			-- if lancervague1chaine~=nil then
			-- 	lancervague1chaine.isVisible=true
			-- end
			fleche.isVisible=true
			texttuto.isVisible=true
			if fleche.group==1 then
				tuto=2
				background:remove(fleche)
				fleche.group=0 -- 0 pour grpartie,2048 pour group
				grpartie:insert(fleche)
			end
			fleche.yScale=-fleche.yScale
			fleche.xScale=fleche.yScale
			fleche.x=lancervague1.x-fleche.width*0.6*fleche.xScale
			fleche.y=lancervague1.y-fleche.height*0.6*fleche.yScale
			transition.from(fleche,{time=200,transition=easing.inCirc, x=fleche.x+fleche.width*0.1*fleche.xScale,y=fleche.y+fleche.height*0.1*fleche.yScale,xScale=fleche.xScale*0.9,yScale=fleche.yScale*0.9})
			texttuto.xScale=1.1
			texttuto.yScale=texttuto.xScale
			transition.to(texttuto,{time=100,transition=easing.inCirc,xScale=1,yScale=1})
			texttuto.text=texttraduction.tuto[12] --"Launch the first wave of ennemy"
			if lancervague1.isVisible1==false then
				actionfaite()
				lancervague1.isVisible=false
				if lancervague1chaine~=nil then
					lancervague1chaine.isVisible=false
				end
			end
		elseif numero==12 then
			print("tuto 12")
			tuto=1
			if jeupause.etat~=1 then
				tuto=1
				print(" jeupause.etat 376 "..jeupause.etat)
				appuipause()
				print(" jeupause.etat 378 "..jeupause.etat)
				tuto=2
			end
			tuto=2
			fleche.isVisible=true
			texttuto.isVisible=true
			if fleche.group==1 then
				tuto=2
				background:remove(fleche)
				fleche.group=0 -- 0 pour grpartie,2048 pour group
				grpartie:insert(fleche)
			end
			fleche.yScale=-fleche.yScale
			fleche.xScale=-1
			fleche.x=pouvoir1.x-fleche.width*0.6*fleche.xScale
			fleche.y=pouvoir1.y-fleche.height*0.6*fleche.yScale
			transition.from(fleche,{time=200,transition=easing.inCirc, x=fleche.x+fleche.width*0.1*fleche.xScale,y=fleche.y+fleche.height*0.1*fleche.yScale,xScale=fleche.xScale*0.9,yScale=fleche.yScale*0.9})
			while pv1ch.pv1cpt<tchpv1 do
				pv1ch.height=pv1ch.height-200*pouvoir1.xScale/tchpv1--tchpv1 est le temps de chargement du pouvoir 1 en sec
				pv1ch.pv1cpt=pv1ch.pv1cpt+0.25
			end
			pv1cl.isVisible=true
			texttuto.text=texttraduction.tuto[13] --"Use your special power"
			texttuto.xScale=1.1
			texttuto.yScale=texttuto.xScale
			transition.to(texttuto,{time=100,transition=easing.inCirc,xScale=1,yScale=1})
		elseif numero==13 then
			tuto=2
			fleche.isVisible=true
			texttuto.isVisible=true
			if fleche.group==0 then
				grpartie:remove(fleche)
				fleche.group=1 -- 0 pour grpartie,2048 pour group
				background:insert(fleche)
			end
			fleche.yScale=-fleche.yScale
			fleche.xScale=-fleche.xScale
			fleche.x=chemin[42].x-fleche.width*0.6*fleche.xScale
			fleche.y=chemin[42].y-fleche.height*0.6*fleche.yScale
			transition.from(fleche,{time=200,transition=easing.inCirc, x=fleche.x+fleche.width*0.1*fleche.xScale,y=fleche.y+fleche.height*0.1*fleche.yScale,xScale=fleche.xScale*0.9,yScale=fleche.yScale*0.9})
			texttuto.text=texttraduction.tuto[14] --"Place the power on the road"
			texttuto.xScale=1.1
			texttuto.yScale=texttuto.xScale
			transition.to(texttuto,{time=100,transition=easing.inCirc,xScale=1,yScale=1})
		elseif numero==14 then
			tuto=1
			if jeupause.etat==1 then
				tuto=1
				print(" jeupause.etat 418 "..jeupause.etat)
				appuipause()
				print(" jeupause.etat 420 "..jeupause.etat)
			end
			--appuipause()
			fleche.isVisible=false
			texttuto.isVisible=false
			boutontutoskip.isVisible=false
			savegame.tuto3=true
			local loadsave = require("loadsave")
			loadsave.saveTable(savegame, "undeuxtroissoleil.json" )
		elseif numero==15 then

		end
	end
	function actionfaite(valeur)
		tutoactionfaite=1
		if valeur==nil then
			if tutoaction==0 then
				lancementtuto(1)
			elseif tutoaction==3 then
				fleche.isVisible=false
				texttuto.isVisible=false
				local function tutoaction11faite(event)
					if boutontutoskip.isVisible then
						lancementtuto(9)
					else
						lancementtuto(10)
					end
				end
				timer.performWithDelay(6000*vitessejeuin,tutoaction11faite) 
			elseif tutoaction==5 then
				lancementtuto(6)
			elseif tutoaction==6 then
				lancementtuto(7)
			elseif	tutoaction==7 then
				lancementtuto(8)
			elseif tutoaction==9 then
				lancementtuto(10)
			elseif tutoaction==11 then
				flecheacccre=nil
				background:remove(flecheacc)
				flecheacc:removeSelf()
				flecheacc=nil
				background:remove(flecheacctx)
				flecheacctx:removeSelf()
				flecheacctx=nil
				print("lancementtuto 12")
				fleche.isVisible=false
				texttuto.isVisible=false
				local function tutoaction11faite(event)
					lancementtuto(12)
				end
				timer.performWithDelay(500,tutoaction11faite) 
			elseif tutoaction==12 then
				lancementtuto(13)
			elseif tutoaction==13 then
				lancementtuto(14)
			end
		elseif valeur==1 then
			if tutoaction==0 or tutoaction==1 then
				lancementtuto(2)
				-- nouv bat aff
			end
		elseif valeur==2 then
			lancementtuto(3)
		end
	end
	function actiondefaite()
		tutoactionfaite=0
		if  tutoaction==1 then
			lancementtuto(0)
		elseif tutoaction==2 then
			lancementtuto(0)
		elseif tutoaction==13 then
			lancementtuto(12)
		end
	end
end
return(t)