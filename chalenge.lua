local t={}--menu de choix de niveau
t.chalenge = function ()--action donne des informations sur les elements deja charger donc plus a charger
	-- grmain=display.newGroup()
	-- local imageMenu=display.newImage(imagemenu.multimenu,1)--display.newImage("Menuprincipal/imageMenu.png", actualcontentwidth/2,actualcontentheight/2,true)
	-- imageMenu.x=contentcenterx--actualcontentwidth/2
	-- imageMenu.y=contentcentery
	-- grmain:insert(imageMenu)
	-- local largeur = 1920/actualcontentwidth--1920/1080 dimension de l'image du menu
	-- local hauteur = 1080/actualcontentheight
	-- local zoom = 0
	-- if (largeur > hauteur) then
	-- 	zoom = hauteur
	-- else
	-- 	zoom = largeur
	-- end
	-- imageMenu.xScale = imageMenu.xScale*((1/zoom)+0.01)--zoom de l'image pour qu'elle occupe entierement l'ecran
	-- imageMenu.yScale = imageMenu.yScale*((1/zoom)+0.01)
	-- local chalengeim={}
	-- local ligne=0
	-- local colonne=1
	-- local xmin=xminscreen
	-- local ymin=yminscreen
	-- for i=1,nbchalenge do
	-- 	chalengeim[i]=display.newImage(imagemenu.chalengefond,1)
	-- 	chalengeim[i].xScale=apparence-0.2
	-- 	chalengeim[i].yScale=apparence-0.2
	-- 	ligne=ligne+1
	-- 	if ligne>=5 then
	-- 		ligne=1
	-- 		colonne=colonne+1
	-- 	end
	-- 	chalengeim[i].x=chalengeim[i].xScale*120*ligne+xmin
	-- 	chalengeim[i].y=chalengeim[i].xScale*70*colonne+ymin
	-- end

end
return(t)