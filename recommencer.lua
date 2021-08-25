local t={}
if not functionload then
function initaffrecommencer()--init de l'affichage du bouton recommencer
	print("init recommencer")
	bprecommencer=display.newImage(imbouton.menupause,3) -- imbouton.recommencer,1)
	bprecommencer.xScale=3/5*apparence
	if goh then
		bprecommencer.xScale=bprecommencer.xScale/4.3
	end
	bprecommencer.yScale=bprecommencer.xScale
	bprecommencer.x=xmaxscreen-50*3/5*apparence--actualcontentwidth-50*3/5*apparence--actualcontentwidth-70
	bprecommencer.y=yminscreen+2.5*50*3/5*apparence +2*5*apparence--15+30*2*apparence--actualcontentheight
	bprecommencer.x1=bprecommencer.x
	bprecommencer.y1=bprecommencer.y
	bprecommencer.isVisible=false
	recommencerclic=false
	grpause:insert(bprecommencer)

	local function bprecommencer1( event )
		if bprecommencer.y1==bprecommencer.y and ennemipasse>0 then
			numtapb=0
			bprecommencer.fill.effect = "filter.sepia"
			bprecommencer.fill.effect.intensity=-2
			transition.to(bprecommencer.fill.effect, { time=500, intensity=0 } ) 
			audio.play( son.uicl2)
			clicsurqqcfunc()
			supactionencours()
			menuprinclic=true
			--menu de conf
			affmenuconf(1)
			print("clic sur bp recommencer")
		end
	end
	bprecommencer:addEventListener( "tap", bprecommencer1 )
	--bpmenuprin
end
local affelement=function(obj)
	bprecommencer.x=bprecommencer.x1
	bprecommencer.y=bprecommencer.y1
	bprecommencer.isVisible=true
end
function affrecommencer()--on demande l'affichage du bouton recommencer
	bprecommencer.x=bprecommencer.x1
	bprecommencer.y=bprecommencer.y1
	bprecommencer.alpha=1
	transition.from(bprecommencer,{time=200, y=bpplay.y, x=bpplay.x,onComplete=affelement,onCancel=affelement,tag="element"})
	bprecommencer.isVisible=true
	-- local function bprecommencer1( event )
	-- 	clicsurqqcfunc()
	-- 	supactionencours()
	-- 	menuprinclic=true
	-- 	--menu de conf
	-- 	affmenuconf(1)
	-- 	print("clic sur bp recommencer")
	-- end
	-- bprecommencer:addEventListener( "tap", bprecommencer1 )
end
local cacherelement=function(obj)
	bprecommencer.isVisible=false
	print("element detruit")
end
function enleverrecommencer()--on demande d'enlever le bouton recommencer
	Runtime:removeEventListener( "tap",bprecommencer1)
	transition.to(bprecommencer,{time=200,alpha=0, y=bpplay.y, x=bpplay.x,onComplete=cacherelement,onCancel=cacherelement,tag="element"})
	--bprecommencer.isVisible=false
	if recommencerclic then
		cacherfenetre()
		--dans remove mettre le destructeur de fenettre
	end
end
--[[
activer un listner sur runtime. Prend la variable remmplie et l'ajoute au tableau et envoie a cette variable l'info comme quoi ca ete pris en compte
pour les timers il y a moins de pb car peu probable que plein de timer se lance en meme temps.

]]
end
t.recommencer= function()
local a=1
end
return t