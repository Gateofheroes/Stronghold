local t={}--gestion du bouton retour au menu principal
if not functionload then
local bpmenuprin=nil
print("preinit")
function initaffmenuprinjeu()--initialisation du bouton retour au menu principal
	bpmenuprin=display.newImage(imbouton.menupause,4) -- imbouton.retourmenuprin,1)
	bpmenuprin.xScale=3/5*apparence
	if goh then
		bpmenuprin.xScale=3/5*apparence/4.3
	else
		bpmenuprin.xScale=3.5/5*apparence
	end
	bpmenuprin.x=xmaxscreen-50*3/5*apparence--actualcontentwidth-50*3/5*apparence--actualcontentwidth-70
	bpmenuprin.y=yminscreen+1.5*50*3/5*apparence +5*apparence--15+30*apparence--45--actualcontentheight
	bpmenuprin.x1=bpmenuprin.x
	bpmenuprin.y1=bpmenuprin.y
	bpmenuprin.yScale=bpmenuprin.xScale
	bpmenuprin.isVisible=false
	menuprinclic=false
	grpause:insert(bpmenuprin)
	local function bpmenuprin1( event )
		if bpmenuprin.y1==bpmenuprin.y and ennemipasse>0 then
			numtapb=0
			audio.play( son.uicl1)
			clicsurqqcfunc()
			supactionencours()
			menuprinclic=true
			--menu de conf
			affmenuconf(0)
			bpmenuprin.fill.effect = "filter.sepia"
			bpmenuprin.fill.effect.intensity=-2
			transition.to(bpmenuprin.fill.effect, { time=500, intensity=0 } )
			print("clic sur bp retourmenuprin")
		end
	end
	bpmenuprin:addEventListener( "tap", bpmenuprin1 )
	--bpmenuprin
end
local cacherelement=function(obj)
	bpmenuprin.isVisible=false
	print("element detruit")
end
local affelement=function(obj)
	bpmenuprin.x=bpmenuprin.x1
	bpmenuprin.y=bpmenuprin.y1
	bpmenuprin.isVisible=true
end
function affmenuprin()--affichage du bouton retour au menu principal
	bpmenuprin.x=bpmenuprin.x1
	bpmenuprin.y=bpmenuprin.y1
	bpmenuprin.alpha=1
	transition.from(bpmenuprin,{time=200, y=bpplay.y, x=bpplay.x,onComplete=affelement,onCancel=affelement,tag="element"})
	bpmenuprin.isVisible=true
	-- local function bpmenuprin1( event )
	-- 	clicsurqqcfunc()
	-- 	supactionencours()
	-- 	menuprinclic=true
	-- 	--menu de conf
	-- 	affmenuconf(0)
	-- 	print("clic sur bp retourmenuprin")
	-- end
	-- bpmenuprin:addEventListener( "tap", bpmenuprin1 )
end
function enlevermenuprin()--on enleve de l'affichage le bouton retour au menu principal
	Runtime:removeEventListener( "tap",bpmenuprin1)
	transition.to(bpmenuprin,{time=200, y=bpplay.y,alpha=0, x=bpplay.x,onComplete=cacherelement,onCancel=cacherelement,tag="element"})
	--bpmenuprin.isVisible=false
	if menuprinclic then
		cacherfenetre()
		--dans remove mettre le destructeur de fenettre
	end
end
end
t.retourmenuprin= function()
local a=1
end
return t