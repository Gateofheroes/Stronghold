local t={} -- assistance a mainbis et autre

-- local kernel    = {}
-- kernel.language = "glsl"
-- kernel.category = "filter"
-- kernel.name     = "blurpix"
-- kernel.graph    = 
-- {
--         nodes = {
--                 blur = { effect = "filter.blurGaussian", input1 = "paint1" },
--                 saturate   = { effect = "filter.saturate", input1 = "vertical" },
--         },
--         output = "saturate",
-- }
 
-- return kernel

function effecttranstion(object,proba)
	proba=proba or 5
	object.fill.effect = "filter.exposure"
	object.fill.effect.exposure =0
	local objecttransition=function(obj)
		print("fin transition")
		if obj~=nil then
			transition.to(obj,{delay=mathrandom(1,proba)*2000,time=3000,exposure=0.7,transition=easing.continuousLoop, onComplete=objecttransition } )
		end
	end
	objecttransition(object.fill.effect)
end
local function multivarxpaff(barxp,fondtune)
	percent=savegamemulti.exp/(savegamemulti.xp*2+10)*0.95
	if percent<0.02 then
		percent=0.02
	elseif percent>0.95 then
		percent=0.95
	end
	print("percent "..percent)
	--barxp.width=percent*fondtune.xScale*fondtune.width
	--barxp.x=fondtune.x-fondtune.xScale*fondtune.width*0.5+percent*fondtune.xScale*fondtune.width*0.5
	transition.to(barxp,{time=1000,transition=easing.inCirc,xScale=percent,x=fondtune.x-fondtune.xScale*fondtune.width*0.5+percent*fondtune.xScale*fondtune.width*0.5})
end
function mutlixp(gainxp)
	savegamemulti.exp=savegamemulti.exp+gainxp
	while savegamemulti.exp>=(savegamemulti.xp*2+10) do
		savegamemulti.xp=savegamemulti.ex+1
	end
end
function funcaffinapp()
	if inappactif and not noinapp then
		if inapppeutaff and not inappaff then
			if isandroid or isiphone then
				initinapp()
			end
			inappaff=true
			local clicsurgrin=false
			local recfond=display.newRect(contentcenterx,contentcentery,actualcontentwidth*1.1,actualcontentheight*1.1)
			recfond:setFillColor(0)
			recfond.alpha=0.5
			transition.from(recfond,{time=500,alpha=0})
			local groupeinapp=display.newGroup()
			groupeinapp.x=contentcenterx
			groupeinapp.y=contentcentery
			local fondinapp=display.newImage(imbouton.fenconf,1)
			fondinapp.xScale=actualcontentwidth*0.9/fondinapp.width
			fondinapp.yScale=actualcontentheight*0.5/fondinapp.height
			groupeinapp:insert(fondinapp)
			local inappbt={}
			local inaptext={}
			local inaptextmonaie={}
			local function creatlistener(boutoninapp,i,prixrapporter)
				function boutoninapp:tap(event)
					if isandroid or isiphone then
						local resultat=inapp(i,prixrapporter)
					else
						if issimulator or iswindows then
							if fric1<0 then
								fric1=-fric1+prixrapporter*7
							else
								fric1=-(fric1+prixrapporter*7)
							end
							fric1=mathfloor(fric1)
							savegame.diplay=gettime()
							local fricpos=fric1
							if fricpos<0 then
								fricpos=-fricpos
							end
							savegame.content=(-fricpos/3-1)/savegame.display
							savegame.monney=fricpos/7
							savegame.yomec=savegame.yomec+prixrapporter*5
							local loadsave = require("loadsave")
							loadsave.saveTable(savegame, "undeuxtroissoleil.json" )
						end
						destructeurinapp()
					end
				end
				boutoninapp:addEventListener("tap",boutoninapp)
			end
			for i=1,4 do
				local prixrapporter
				if i==1 then
					prixrapporter=500
				elseif i==2 then
					prixrapporter=2000
				elseif i==3 then
					prixrapporter=8000
				else
					prixrapporter=45000
				end
				-- local prixrapporter=2000*i*i
				inappbt[i]=display.newImage(imbouton.inapp,i)
				groupeinapp:insert(inappbt[i])
				inappbt[i].yScale=fondinapp.yScale*fondinapp.height*0.7/inappbt[i].height
				inappbt[i].xScale=inappbt[i].yScale
				inappbt[i].x=fondinapp.xScale*fondinapp.width*0.9*0.25*(i-2.5)
				inappbt[i].y=-inappbt[i].yScale*inappbt[i].height*0.14
				creatlistener(inappbt[i],i,prixrapporter)
				inaptext[i]=display.newEmbossedText(prixrapporter,inappbt[i].x,inappbt[i].yScale*inappbt[i].height*0.5,fonttype, 24*fontsize )--actualcontentwidth/20, 300
				inaptext[i]:setFillColor(0.2,0.2,0.2)
				inaptext[i]:setEmbossColor(colortextemb)
				creatlistener(inaptext[i],i,prixrapporter)
				groupeinapp:insert(inaptext[i])
				inaptextmonaie[i]=display.newImage(imbouton.monnaie,6)
				inaptextmonaie[i].xScale=inaptext[i].height/inaptextmonaie[i].height
				inaptextmonaie[i].yScale=inaptextmonaie[i].xScale
				inaptextmonaie[i].x=inaptext[i].x+40
				inaptextmonaie[i].y=inaptext[i].y
				creatlistener(inaptextmonaie[i],i,prixrapporter)
				groupeinapp:insert(inaptextmonaie[i])
			end
			transition.from(groupeinapp,{time=500,transition=easing.outCirc, x=xmaxscreen+fondinapp.width*fondinapp.xScale*0.5})
			local destructeurinappfait=false
			function destructeurinapp()
				if not destructeurinappfait then
					destructeurinappfait=true
					groupeinapp:removeEventListener( "tap",groupeinapp)
					recfond:removeEventListener( "tap",recfond)
					local fricpos=fric1
					if fricpos<0 then
						fricpos=-fricpos
					end
					if fricpos>-0.1 then
						if fricpos<0.1 then
							fricpos=0
							print("0")
						end
					end
					if lefrictext~=nil then 
						lefrictext.text=(fricpos/7)
					end
					clicsurgrin=nil
					local completedispinapp=function(obj)
						recfond:removeSelf()
						recfond=nil
						groupeinapp:remove(fondinapp)
						fondinapp:removeSelf()
						fondinapp=nil
						for i=1,4 do
							groupeinapp:remove(inappbt[i])
							inappbt[i]:removeSelf()
							inappbt[i]=nil
							groupeinapp:remove(inaptext[i])
							inaptext[i]:removeSelf()
							inaptext[i]=nil
							groupeinapp:remove(inaptextmonaie[i])
							inaptextmonaie[i]:removeSelf()
							inaptextmonaie[i]=nil
						end
						inaptextmonaie=nil
						inaptext=nil
						inappbt=nil
						inappaff=false
					end
					transition.to(groupeinapp,{time=500,transition=easing.inCirc, y=yminscreen-fondinapp.height*fondinapp.yScale*0.5, onComplete=completedispinapp,onCancel=completedispinapp})
					transition.to(recfond,{time=500,alpha=0})
					-- inaptext=nil
					-- inappbt=nil

					-- local function inappafftimer(event)
					-- 	inappaff=false
					-- end
					-- timer.performWithDelay(50,inappafftimer)
				end
			end
			function groupeinapp:tap(event)
				clicsurgrin=true
				local function clicsurgrintimer(event)
					clicsurgrin=false
				end
				timer.performWithDelay(50,clicsurgrintimer)
			end
			groupeinapp:addEventListener("tap",groupeinapp)
			function recfond:tap(event)
				if clicsurgrin then
					print("clic sur le groupe")
				else
					destructeurinapp()
					print("ho year baby")
				end
			end
			recfond:addEventListener("tap",recfond)
		end
	end
end
function changeName()
	if inappactif then
		if inapppeutaff and not inappaff then
			inappaff=true
			local recfond=display.newRect(contentcenterx,contentcentery,actualcontentwidth*1.1,actualcontentheight*1.1)
			recfond:setFillColor(0)
			recfond.alpha=0.5
			transition.from(recfond,{time=500,alpha=0})
			local groupeinapp=display.newGroup()
			groupeinapp.x=contentcenterx
			groupeinapp.y=contentcentery
			local fondinapp=display.newImage(imbouton.fenconf,1)
			fondinapp.xScale=actualcontentwidth*0.9/fondinapp.width
			fondinapp.yScale=actualcontentheight*0.5/fondinapp.height
			groupeinapp:insert(fondinapp)
			transition.from(groupeinapp,{time=500,transition=easing.outCirc, x=xmaxscreen+fondinapp.width*fondinapp.xScale*0.5})

			textinfo=display.newEmbossedText("Change your name!",0,-fondinapp.yScale*fondinapp.height*0.25-10,fonttype,22*fontsize)--savegamemulti.id,0,17,fonttype,30)
			textinfo:setEmbossColor(colortextemb)
			groupeinapp:insert(textinfo)
			textinfo1=display.newEmbossedText("(4-12 letters)",0,-fondinapp.yScale*fondinapp.height*0.25+10,fonttype,12*fontsize)--savegamemulti.id,0,17,fonttype,30)
			textinfo1:setFillColor(0.5,0.5,0.5)
			--textinfo1:setEmbossColor(colortextemb)
			groupeinapp:insert(textinfo1)

			local clicsurgrin=false
			local destructeurinappfait=false
			local  destructeurchname
			local function textListener( event )

				if ( event.phase == "began" ) then
					-- User begins editing "defaultField"

				elseif ( event.phase == "ended" or event.phase == "submitted" ) then
					-- Output resulting text from "defaultField"
					local stringName=event.target.text:gsub('%p','')
					stringName=stringName:gsub('%z','')
					if string.len(stringName)<5 or string.len(stringName)>12  then
						event.target.text=idmulti.text
					else
						savegamemulti.id=stringName
						idmulti.text=stringName
					end
					destructeurchname()
					print( event.target.text )

				elseif ( event.phase == "editing" ) then
					clicsurgrin=true
					local function clicsurgrintimer(event)
						clicsurgrin=false
					end
					timer.performWithDelay(50,clicsurgrintimer)
				end
			end

			-- Create text field
			local defaultField = native.newTextField( 0, 0, 180, 30)
			if not issimulator then
				defaultField:setTextColor(1,1,1)
			else
				defaultField:setTextColor(0,0,0)
			end
			defaultField.hasBackground=false
			defaultField.text=savegamemulti.id
			defaultField.font=native.newFont(fonttype,18*fontsize)
			defaultField:addEventListener( "userInput", textListener )
			groupeinapp:insert(defaultField)
			

			local boutonconf=display.newImage(imbouton.monnaie,1)
			boutonconf.xScale=0.2
			boutonconf.yScale=boutonconf.xScale
			boutonconf.x=fondinapp.xScale*fondinapp.width*0.4-boutonconf.xScale*boutonconf.width*0.5
			boutonconf.y=fondinapp.yScale*fondinapp.height*0.4-boutonconf.yScale*boutonconf.height*0.5
			groupeinapp:insert(boutonconf)
			function boutonconf:tap(event)
				local stringName=defaultField.text:gsub('%p','')
				stringName=stringName:gsub('%z','')
				if string.len(stringName)>4 and string.len(stringName)<13  then
					savegamemulti.id=stringName
					idmulti.text=stringName
					destructeurchname()
				else
					defaultField.text=idmulti.text
				end

			end
			boutonconf:addEventListener("tap",boutonconf)

			local boutonrefu=display.newImage(imbouton.monnaie,2)
			boutonrefu.xScale=0.2
			boutonrefu.yScale=boutonrefu.xScale
			boutonrefu.x=-fondinapp.xScale*fondinapp.width*0.4+boutonrefu.xScale*boutonrefu.width*0.5
			boutonrefu.y=fondinapp.yScale*fondinapp.height*0.4-boutonrefu.yScale*boutonrefu.height*0.5
			groupeinapp:insert(boutonrefu)
			function boutonrefu:tap(event)
				destructeurchname()
			end
			boutonrefu:addEventListener("tap",boutonrefu)

			function destructeurchname()
				if not destructeurinappfait then
					destructeurinappfait=true
					groupeinapp:removeEventListener( "tap",groupeinapp)
					boutonconf:removeEventListener( "tap",boutonconf)
					boutonrefu:removeEventListener( "tap",boutonrefu)
					recfond:removeEventListener( "tap",recfond)
					defaultField:removeEventListener( "userInput", textListener )
					clicsurgrin=nil
					local completedispinapp=function(obj)
						groupeinapp:remove(textinfo1)
						textinfo1:removeSelf()
						textinfo1=nil
						groupeinapp:remove(textinfo)
						textinfo:removeSelf()
						textinfo=nil
						groupeinapp:remove(boutonconf)
						boutonconf:removeSelf()
						boutonconf=nil
						groupeinapp:remove(boutonrefu)
						boutonrefu:removeSelf()
						boutonrefu=nil
						groupeinapp:remove(defaultField)
						defaultField:removeSelf()
						defaultField=nil
						recfond:removeSelf()
						recfond=nil
						groupeinapp:remove(fondinapp)
						fondinapp:removeSelf()
						fondinapp=nil						
						inappaff=false
					end
					transition.to(groupeinapp,{time=500,transition=easing.inCirc, y=yminscreen-fondinapp.height*fondinapp.yScale*0.5, onComplete=completedispinapp,onCancel=completedispinapp})
					transition.to(recfond,{time=500,alpha=0})
				end
			end
			

			function groupeinapp:tap(event)
				clicsurgrin=true
				local function clicsurgrintimer(event)
					clicsurgrin=false
				end
				timer.performWithDelay(50,clicsurgrintimer)
			end
			groupeinapp:addEventListener("tap",groupeinapp)
			function recfond:tap(event)
				if clicsurgrin then
					print("clic sur le groupe")
				else
					destructeurchname()
					print("ho year baby")
				end
			end
			recfond:addEventListener("tap",recfond)
		end
	end
end
function afffric(ismultiTemp)
	local ismulti=false
	if ismultiTemp~=nil then
		if ismultiTemp==3 then
			ismulti=true
		end
	end
	inappaff=false
	inapppeutaff=true
	local coefaff=1
	local groupeafffric=display.newGroup()
	local fondtune
	if goh then
		fondtune=display.newRect(0,0,400,200)
		fondtune.alpha=0.01
		fondtune:setFillColor(0.5)
	else
		fondtune=display.newImage(imagemenu.fondtune,1)
	end
	fondtune.xScale=0.2*coefaff
	fondtune.yScale=0.175*coefaff
	fondtune.x=fondtune.xScale*fondtune.width*0.5
	fondtune.y=fondtune.yScale*fondtune.height*0.5
	if not ismulti then
		function fondtune:tap(event)
			funcaffinapp()
		end
		fondtune:addEventListener("tap",fondtune)
	else
		function fondtune:tap(event)
			changeName()
		end
		fondtune:addEventListener("tap",fondtune)
	end

	groupeafffric:insert(fondtune)
	if not ismulti then
		local lefric=display.newImage(imbouton.monnaie,6)
		effecttranstion(lefric)
		if goh then
			lefric.xScale=0.18
		else
			lefric.xScale=0.15
		end
		lefric.yScale=lefric.xScale
		lefric.x=lefric.xScale*lefric.width*0.5+5 --    35 --xminscreen+35
		lefric.y=17 -- yminscreen+20
		groupeafffric:insert(lefric)
		local fricpos=fric1
		if fricpos<0 then
			fricpos=-fricpos
		end
		if fricpos>-0.1 then
			if fricpos<0.1 then
				fricpos=0
				print("0")
			end
		end 
		print("on est ici")
		lefrictext=display.newEmbossedText( mathabs(fricpos/7) ,lefric.x+35,17,fonttype,30*fontsize) --xminscreen+70, yminscreen+20,fonttype,12) -- native.systemFontBold, 12 )--actualcontentwidth/20, 300
		lefrictext:setFillColor(colortextdiam[1],colortextdiam[2],colortextdiam[3]) --(1,0.5,0.5)
		lefrictext:setEmbossColor(colortextemb)
		if fricpos/7>=1000 then
			lefrictext.xScale=0.7
		else
			lefrictext.xScale=0.9
		end
		lefrictext.yScale=lefrictext.xScale
		groupeafffric:insert(lefrictext)
	else
		local barxp=display.newRect(fondtune.x,fondtune.y,1,1)--,5)
		barxp:setFillColor(1,0.8,0)
		barxp.stroke={0.8,0.4,0}
		barxp.strokeWidth=1.5
		barxp.alpha=0.5
		barxp.y=fondtune.y
		barxp.width=fondtune.xScale*fondtune.width
		barxp.x=fondtune.x-fondtune.xScale*fondtune.width*0.5
		barxp.xScale=0.01

		fondtune.yScale=fondtune.yScale*1.5
		fondtune.y=fondtune.yScale*fondtune.height*0.5

		barxp.height=fondtune.height*fondtune.yScale*1.1
		local lemask=graphics.newMask("Menuprincipal/fondtunemask.png") --imagemenu.carreblanc)
		local groupmask=display.newGroup()
		groupmask:setMask(lemask)
		groupmask.maskScaleX=fondtune.xScale
		groupmask.maskScaleY=fondtune.yScale
		groupmask.maskX=fondtune.x
		groupmask.maskY=fondtune.y
		multivarxpaff(barxp,fondtune)
		groupeafffric:insert(groupmask)
		groupmask:insert(barxp) 


		local optiontext={
			text=savegamemulti.id,
			x=fondtune.x+5,
			y=15,--fondtune.y,
			font=fonttype,
			fontSize=30*fontsize,
			align = "left",
			width=fondtune.width*fondtune.xScale,
			height=fondtune.height*fondtune.yScale*0.6
		}
		idmulti=display.newEmbossedText(optiontext)--savegamemulti.id,0,17,fonttype,30)
		idmulti:setEmbossColor(colortextemb)
		groupeafffric:insert(idmulti)
		local optiontext1={
			text="lvl : "..savegamemulti.xp,
			x=fondtune.x+5,
			y=fondtune.y+10,--+fondtune.height*fondtune.yScale*0.25,
			font=fonttype,
			fontSize=20*fontsize,
			align = "left",
			width=fondtune.width*fondtune.xScale,
			height=fondtune.height*fondtune.yScale*0.4
		}
		xpmulti=display.newEmbossedText(optiontext1)--savegamemulti.id,0,17,fonttype,30)
		xpmulti:setEmbossColor(colortextemb)
		groupeafffric:insert(xpmulti)
	end
	return groupeafffric,(fondtune.xScale*fondtune.width),(fondtune.yScale*fondtune.height)
end
local function handleLowMemory( event )
	print( "Memory warning received!" )
	--collectgarbage("collect")
	if issimulator then
		local memUsed = (collectgarbage("count")) / 1000
		local texUsed = system.getInfo( "textureMemoryUsed" ) / 1000000
		--print("\n---------MEMORY USAGE INFORMATION chargement1 avant---------")
		--print("System Memory Used:", string.format("%.03f", memUsed), "Mb")
		print("Texture Memory Used avant liberation memoire: ", string.format("%.03f", texUsed), "Mb")
	end
	for index,value in ipairs(donneecharger) do
		if value==1 then
			if(index<30 or index>=32)  then --and index~=niveauch then
				if index<30 then
					_G["map"..index.."sheet".."hg"]=nil
					_G["map"..index.."sheet".."hd"]=nil
					_G["map"..index.."sheet".."bg"]=nil
					_G["map"..index.."sheet".."bd"]=nil
					_G["map"..index.."sheet".."o1"]=nil
					_G["map"..index.."sheet".."o2"]=nil
					_G["map"..index.."sheet".."o3"]=nil
					_G["map"..index.."sheet".."o4"]=nil
					_G["map"..index.."sheet".."o5"]=nil
					_G["map"..index.."sheet".."o6"]=nil
					_G["map"..index.."sheet".."o7"]=nil
					_G["map"..index.."sheet".."o8"]=nil
					_G["map"..index.."sheet".."o9"]=nil
					_G["map"..index.."sheet".."o10"]=nil
					_G["map"..index.."sheet".."o11"]=nil
					_G["map"..index.."sheet".."o12"]=nil
					_G["map"..index.."sheet".."obd"]=nil
					_G["map"..index.."sheet".."obd1"]=nil
					_G["map"..index.."sheet".."obd2"]=nil
					_G["map"..index.."sheet".."obg1"]=nil
					_G["map"..index.."sheet".."obg2"]=nil
					_G["map"..index.."sheet".."mid"]=nil
				elseif index==32 and menuactuel~=3 then
					imagemenu.page1=nil
					imagemenu.arriereplan1=nil
					imagemenu.devpouvoir=nil
					imagemenu.devbatdist=nil
					imagemenu.devbatcont=nil
					imagemenu.devgene=nil
				elseif index==33 and menuactuel~=1 and menuactuel~=2 then
					imagemenu.theme1=nil
					imagemenu.theme2=nil
					imagemenu.theme3=nil
					imagemenu.theme4=nil
					imagemenu.mini=nil
				elseif index==34 and menuactuel~=2 and menuactuel~=3 then
					imagemenu.mode1=nil
					imagemenu.mode2=nil
				elseif index==35 and menuactuel~=4 then
					-- imagemenu.boutonmulti=nil
					-- imagemenu.boutonmultisol=nil
					-- imagemenu.boutonmultisave=nil
					-- imagemenu.boutonmultispawn=nil
				end
				donneecharger[index]=0
				--local hg=display.newImage(map1sheethg,1)
			end
		end
	end
	if menuactuel~=1 then
		unloadimagemain()
		-- imagemenu.menu=nil
		-- imagemenu.BoutonPlay=nil
		-- imagemenu.chaine=nil
		-- imagemenu.BoutonDev1=nil
		-- imagemenu.quitter=nil
		-- imagemenu.fondtune=nil
		loadorreloadimagemain()
	end
	collectgarbage("collect")
	if issimulator then
		local memUsed = (collectgarbage("count")) / 1000
		local texUsed = system.getInfo( "textureMemoryUsed" ) / 1000000
		--print("\n---------MEMORY USAGE INFORMATION chargement1 avant---------")
		--print("System Memory Used:", string.format("%.03f", memUsed), "Mb")
		print("Texture Memory Used apres liberation memoire: ", string.format("%.03f", texUsed), "Mb")
	end
end
Runtime:addEventListener( "memoryWarning", handleLowMemory )
local grpro
function maincreategroupfleche(grmain)
	grpro=display.newGroup()
	grmain:insert(grpro)
	return grpro
end
function mainenvoyerfleche(grpro)
	local flechearrive=0
	local nbflecheaenvoyer=mathrandom(3,30)
	local creadisp
	local creadisp1
	local function envoyerpacketfleche(type)
		if clicsurqqc==false then
			for i=1,nbflecheaenvoyer do
				local portance=mathfloor(8,20)*0.1--1.2
				if type~=1 then
					portance=1
				end
				local monte=mathfloor(5,20)*0.1
				local typepro
				if type~=1 then
					typepro=mathrandom(5,6)
				else
					typepro=mathrandom(1,2)
				end
				local instance2=display.newImage(impro.projectiles,typepro)
				
				instance2.y=mathrandom(yminscreen,ymaxscreen)+instance2.yScale*instance2.height
				local nbvitesse=0
				if mathrandom(0,1)==1 then
					nbvitesse=mathrandom(5,30)
				else
					if type~=1 then
						nbvitesse=mathrandom(15,60)
					end
					nbvitesse=mathrandom(20,80)
				end
				instance2.xScale=nbvitesse*0.01
				nbvitesse=0.3/(nbvitesse/80)
				instance2.yScale=instance2.xScale
				local xobj=xmaxscreen
				if type==1 then
					instance2.x=xminscreen-instance2.xScale*instance2.width
				else
					xobj=xminscreen-instance2.xScale*instance2.width-35
					instance2.x=xmaxscreen+instance2.xScale*instance2.width
				end
				local ybase=instance2.y
				local delaybase=mathrandom(1,10000)
				grpro:insert(instance2)
				local rotateobj1=0
				local rotateobj2
				if type==1 then
					instance2:rotate(-monte*45)
					rotateobj2=monte*45
				else
					rotateobj1=360
					rotateobj2=720
					--instance2:rotate(90+monte*45)
				end
				local bonusy=0
				local bonusx=0
				if nbvitesse>0.4 and type1~=1 then 
					bonusx=35
					bonusy=-10
				end
				transition.to(instance2,{delay=delaybase,time=(2000+2000*portance)*nbvitesse+bonusx*10,x=xobj+bonusx} ) 
				transition.to(instance2,{delay=delaybase,time=nbvitesse*2000, rotation=rotateobj1})
				transition.to(instance2,{delay=delaybase,time=nbvitesse*2000,transition=easing.outQuad,y=instance2.y-monte*200} ) 
				transition.to(instance2,{delay=nbvitesse*2000+delaybase,time=nbvitesse*2000*portance+bonusx*10,transition=easing.inSine,y=ybase+bonusy} ) 
				transition.to(instance2,{delay=nbvitesse*2000+delaybase,time=nbvitesse*2000*portance, rotation=rotateobj2})
				transition.to(instance2,{delay=nbvitesse*2000+delaybase+nbvitesse*2000*portance,time=2000,alpha=0,onComplete=creadisp,onStart=creadisp1})
			end
		end
	end
	creadisp=function(obj)
		if clicsurqqc==false then
			obj:removeSelf()
			obj=nil
		end
	end
	creadisp1=function(obj)
		if clicsurqqc==false then
			flechearrive=flechearrive+1
			if flechearrive>=nbflecheaenvoyer then
				flechearrive=0
				local typepro=mathrandom(1,2)				
				if typepro==2 then
					nbflecheaenvoyer=mathrandom(5,20)
				else
					nbflecheaenvoyer=mathrandom(6,60)
				end
				envoyerpacketfleche(typepro)
			end
		else
			flechearrive=0
		end
	end
	if true then
		local function timer1func(event)
			envoyerpacketfleche(1)
		end

		timer.performWithDelay(1000,timer1func)
	end
end
t.mainter= function()
	local a=1
end
return t