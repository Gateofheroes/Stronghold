local t={}
if not functionload then
function initaffreglage()--initialisation du bouton reglage
	local sequenceData =
	{
	    name="walking",
	    frames= {7,8},
	    time=100,
	    loopCount = 1,   -- Optional ; default is 0 (loop indefinitely)
	  --  loopDirection = "bounce"    -- Optional ; values include "forward" or "bounce"
	}
		local sequenceData1 =
	{
	    name="walking",
	    frames= {9,10},
	    time=100,
	    loopCount = 1,   -- Optional ; default is 0 (loop indefinitely)
	  --  loopDirection = "bounce"    -- Optional ; values include "forward" or "bounce"
	}
	bpreglage=display.newSprite(imbouton.menupause,sequenceData) -- imbouton.son,sequenceData)
	bpreglage.xScale=3/5*apparence
	if goh then
		bpreglage.xScale=bpreglage.xScale/4.3
	end
	bpreglage.yScale=bpreglage.xScale
	bpreglage.x=xmaxscreen-50*3/5*apparence--actualcontentwidth-50*3/5*apparence--actualcontentwidth-70
	bpreglage.y=yminscreen+3.5*50*3/5*apparence +3*5*apparence--15+3*30*apparence --105--actualcontentheight
	bpreglage.x1=bpreglage.x
	bpreglage.y1=bpreglage.y
	bpreglage.isVisible=false
	bpreglage.son=true
	reglageclic=false
	

	if savegame.sound==true then
		--audio.play( son.uicl2)
		local volumesound=0.5
		if savegame.soundvol~=nil then
			volumesound=savegame.soundvol
		else
			savegame.soundvol=volumesound
		end
		local volumesoundfond=savegame.soundvol
		if savegame.soundvolfond~=nil then
			volumesoundfond=savegame.soundvolfond
		else
			savegame.soundvolfond=volumesoundfond
		end
		audio.setVolume(volumesoundfond,{channel=1})
		audio.setVolume(volumesound)
	else
		audio.setVolume(0)
		bpreglage.son=false
		bpreglage:setFrame(2)
	end
	--bpmenuprin
	local function bpreglage1( event )
		if bpreglage.y1==bpreglage.y then
		numtapb=0
		audio.play( son.uicl1)
		clicsurqqcfunc()
		supactionencours()
		menuprinclic=true
		if  bpreglage.son then
			bpreglage.son=false
			bpreglage:setFrame(2)
			audio.setVolume(0)
			savegame.sound=false
		else
			bpreglage.son=true
			bpreglage:setFrame(1)
			local volumesound=0.5
			if savegame.soundvol~=nil then
				volumesound=savegame.soundvol
			else
				savegame.soundvol=volumesound
			end
			local volumesoundfond=savegame.soundvol
			if savegame.soundvolfond~=nil then
				volumesoundfond=savegame.soundvolfond
			else
				savegame.soundvolfond=volumesoundfond
			end
			audio.setVolume(volumesoundfond,{channel=1})
			audio.setVolume(volumesound)
			savegame.sound=true
		end
	end
		--menu de conf
		print("clic sur bp reglage")
	end
	bpreglage:addEventListener( "tap", bpreglage1 )

	bpacc=display.newSprite(imbouton.menupause,sequenceData1) -- imbouton.vitesse,sequenceData)
	bpacc.xScale=3/5*apparence
	if goh then
		bpacc.xScale=bpacc.xScale/4.3
	end
	bpacc.yScale=bpacc.xScale
	bpacc.x=xmaxscreen-50*3/5*apparence--actualcontentwidth-50*3/5*apparence--actualcontentwidth-70
	bpacc.y=yminscreen+4.5*50*3/5*apparence +4*5*apparence--15+3*30*apparence --105--actualcontentheight
	bpacc.x1=bpacc.x
	bpacc.y1=bpacc.y
	bpacc.isVisible=false
	bpacc.active=true
	bpacc:setFrame(2)
	grpause:insert(bpacc)
	grpause:insert(bpreglage)

	bpaccmini=display.newSprite(imbouton.menupause,sequenceData1) -- imbouton.vitesse,sequenceData)
	bpaccmini.xScale=3/5*apparence*0.45
	if goh then
		bpaccmini.xScale=bpaccmini.xScale/4.3
	end
	bpaccmini.yScale=bpaccmini.xScale
	bpaccmini.x=xmaxscreen-50*1/5*apparence--actualcontentwidth-50*3/5*apparence--actualcontentwidth-70
	bpaccmini.y=yminscreen+1.5*50*1/5*apparence +5*apparence--15+3*30*apparence --105--actualcontentheight
	bpaccmini.isVisible=false
	bpaccmini:setFrame(2)
	grpartie:insert(bpaccmini)

	function bpaccnorm()
		bpacc:setFrame(1)
		bpaccmini.isVisible=false
		bpacc.active=false
		if multi==0 then
			vitessejeu=1 --accelere le jeu
			vitessejeuin=1/vitessejeu --valeur de l'acceleration inversé (pour opt pour timer)
		else
			vitessejeu=1.1
			vitessejeuin=1/vitessejeu
		end
		if retinf.dureetempacc~=0 then
			if retinfdureetemppause~=0 then
			local temppause=(gettime()-retinfdureetemppause)
				retinf.dureetempacc=retinf.dureetempacc+temppause
			end
			retinf.dureeacc=retinf.dureeacc+(gettime()-retinf.dureetempacc)
			--print("ajout de temp de duree accelere"..(os.clock()-retinf.dureetempacc))
			retinf.dureetempacc=0
		end
	end
	local function bpacc1( event )
		if bpacc.y1==bpacc.y and ennemipasse>0 then
			numtapb=0
			audio.play( son.uicl1)
			clicsurqqcfunc()
			supactionencours()
			menuprinclic=true
			if bpacc.active then
				bpaccnorm()
			else
				retinf.nbacc=retinf.nbacc+1
				retinf.dureetempacc=gettime()
				--print("retinf.dureetempacc"..retinf.dureetempacc)
				bpacc:setFrame(2)
				bpaccmini.isVisible=true
				bpacc.active=true
				if multi==0 then
					vitessejeu=4 --2 --accelere le jeu
					if issimulator then
						vitessejeu=4
					end
					vitessejeuin=1/vitessejeu --valeur de l'acceleration inversé (pour opt pour timer)
				else
					vitessejeu=4.4 --2 --accelere le jeu
					if issimulator then
						vitessejeu=4.4
					end
					vitessejeuin=1/vitessejeu --valeur de l'acceleration inversé (pour opt pour timer)
				end

				if decoranim~=nil then
					for i=1,#decoranim do
						--decoranim[i].timeScale=decoranim[i].timeScale*vitessejeu
					end
				end
				if obstacleim~=nil then
					for i=1,#obstacleim do
						if obstacleim[i].anim~=nil then
							--obstacleim[i].anim.time=obstacleim[i].anim.time*vitessejeuin
						end
					end
				end
			end
			if fenaff==false and findelapartie==false then
				appuipause()
			end
			print("clic sur bp acc")
		end
	end
	bpacc:addEventListener( "tap", bpacc1 )
end
local affelement=function(obj)
	bpreglage.x=bpreglage.x1
	bpreglage.y=bpreglage.y1
	bpreglage.isVisible=true
	bpacc.x=bpacc.x1
	bpacc.y=bpacc.y1
	if debutpartie~=0 then
		bpacc.isVisible=true
	end
	affpause()
end
function affreglage()--affichage du bouton reglage
	bpreglage.x=bpreglage.x1
	bpreglage.y=bpreglage.y1
	bpreglage.alpha=1
	transition.from(bpreglage,{time=200, y=bpplay.y, x=bpplay.x,onComplete=affelement,onCancel=affelement,tag="element"})
	bpreglage.isVisible=true
	bpacc.x=bpacc.x1
	bpacc.y=bpacc.y1
	bpacc.alpha=1
	transition.from(bpacc,{time=200, y=bpplay.y, x=bpplay.x,tag="element"})
	if debutpartie~=0 then
		bpacc.isVisible=true
	end
	-- local function bpreglage1( event )
	-- 	clicsurqqcfunc()
	-- 	supactionencours()
	-- 	menuprinclic=true
	-- 	--menu de conf
	-- 	print("clic sur bp reglage")
	-- end
	-- bpreglage:addEventListener( "tap", bpreglage1 )
end
local cacherelement=function(obj)
	bpreglage.isVisible=false
	bpacc.isVisible=false
	affplay()
	print("element detruit")
end
function enleverreglage()--enleve le bouton reglage
	Runtime:removeEventListener( "tap",bpreglage1)
	transition.to(bpreglage,{time=200,alpha=0, y=bpplay.y, x=bpplay.x,onComplete=cacherelement,onCancel=cacherelement,tag="element"})
	--bpreglage.isVisible=false
	if reglageclic then
		cacherfenetre()
		--dans remove mettre le destructeur de fenettre
	end
	Runtime:removeEventListener( "tap",bpacc1)
	transition.to(bpacc,{time=200,alpha=0, y=bpplay.y, x=bpplay.x,tag="element"})
	--bpacc.isVisible=false
end
end
t.reglage= function()
local a=1
end
return t