local t={}--menu de choix de niveau
t.multimenu = function ()--action donne des informations sur les elements deja charger donc plus a charger
local clicsurqqcmulti=0
maxtunemulti=850

grmain=display.newGroup()
local imageMenu=display.newImage(imagemenu.multimenu,1)--display.newImage("Menuprincipal/imageMenu.png", actualcontentwidth/2,actualcontentheight/2,true)
imageMenu.x=contentcenterx--actualcontentwidth/2
imageMenu.y=contentcentery

local boutonmulti=display.newImage(imagemenu.BoutonMulti,1)
boutonmulti.x=contentcenterx*8/5
boutonmulti.y=contentcentery --actualcontentheight/2
local boutonmulti1=display.newImage(imagemenu.BoutonMulti,1)
boutonmulti1.x=contentcenterx*8/5
boutonmulti1.y=4*actualcontentheight/5
if savemulti[1].nb==0 then
	boutonmulti1.isVisible=false
end
local boutonmultimap2=display.newImage(imagemenu.BoutonMulti,1)
boutonmultimap2.x=contentcenterx*2/5
boutonmultimap2.y=contentcentery --actualcontentheight/2
local boutonmulti1map2=display.newImage(imagemenu.BoutonMulti,1)
boutonmulti1map2.x=contentcenterx*2/5
boutonmulti1map2.y=4*actualcontentheight/5
if savemulti[2].nb==0 then
	boutonmulti1map2.isVisible=false
end
local fricfond=display.newImage(imagemenu.multifricfond,1)
fricfond.x=contentcenterx
fricfond.y=contentcentery
local fricfelche=display.newImage(imagemenu.multifricfleche,1)
fricfelche.x=fricfond.x
fricfelche.y=fricfond.y-25
local fricfelchehaut=display.newImage(imagemenu.multifricfleche,1)
fricfelchehaut.yScale=-1
fricfelchehaut.x=fricfond.x
fricfelchehaut.y=fricfond.y+25
local fricmulti=display.newText("a",fricfond.x,fricfond.y, native.systemFontBold, 16*fontsize )
fricmulti:setFillColor( 0.3, 0.3, 0 )
fricmulti.valeur=500
fricmulti.text=fricmulti.valeur
local menuprin=display.newImage(imagemenu.bpmenuprin,1)-- display.newImage( "choniveau/menuprin.png",actualcontentwidth-100,50,true )
menuprin.xScale=0.4*apparence
menuprin.yScale=menuprin.xScale
menuprin.x=xmaxscreen-200*menuprin.xScale*0.5
menuprin.y=yminscreen+200*menuprin.xScale*0.5

grmain:insert(imageMenu)
grmain:insert(boutonmulti)
grmain:insert(boutonmulti1)
grmain:insert(boutonmultimap2)
grmain:insert(boutonmulti1map2)
grmain:insert(fricfond)
grmain:insert(fricfelche)
grmain:insert(fricfelchehaut)
grmain:insert(fricmulti)
grmain:insert(menuprin)

local largeur = 1920/actualcontentwidth--1920/1080 dimension de l'image du menu
	local hauteur = 1080/actualcontentheight
	local zoom = 0
	if (largeur > hauteur) then
		zoom = hauteur
	else
		zoom = largeur
	end
imageMenu.xScale = imageMenu.xScale*((1/zoom)+0.01)--zoom de l'image pour qu'elle occupe entierement l'ecran
imageMenu.yScale = imageMenu.yScale*((1/zoom)+0.01)
local function lancerlevelmult(typemulti)
	--defautValeurPartie()
	-- modeinfini=false
	-- dureepartie=1 --coefficient de duree de la partie, plus le nb est grand plus la partie dura longtemps (divise les gains par mort et mine par dureepartie)
	-- dureepartie1=1
	-- accelererenn=1
	multi=typemulti
	-- local chargementaffichage = require ( "chargementaff")
	-- if donneecharger[31]==0 then
	-- 	chargementaffichage.chargementaff(6)
	-- elseif donneecharger[31]==1 then
	-- 	chargementaffichage.chargementaff(1)
	-- end
	grmain:removeSelf()
	-- local function timerlancerniv1( event )
	-- 	race=0
	-- 	local chargement = require ( "chargement")
	-- 	if donneecharger[31]==0 then
	-- 		chargement.chargement()
	-- 	elseif donneecharger[31]==1 then
	-- 		--local chargementaffichage = require ( "chargementaff")
	-- 		-- chargementevo()
	-- 		-- chargementevo()
	-- 		-- chargementevo()
	-- 		local lancerNiveau1 = require ( "niveau1" )
	-- 		lancerNiveau1.niveau1(0)
	-- 	end
	-- end
	-- timerlancerniv=timer.performWithDelay( 50, timerlancerniv1 )
	local menucarte = require ( "menucarte" )
	menucarte.ordre(0,1,niveauch,1,typemulti)
	multivaguemax=0
end
function boutonmulti:tap(event)
	if clicsurqqcmulti==0 then
		clicsurqqcmulti=1
		multi=1
		niveauch=21
		mapmultisave=1
		fricmulticreation=fricmulti.valeur
		lancerlevelmult(1)
	end
end
boutonmulti:addEventListener( "tap", boutonmulti )--lancement de l'ecoute sur le bouton play

function boutonmulti1:tap(event)
	if clicsurqqcmulti==0 then
		clicsurqqcmulti=1
		multi=2
		niveauch=21
		mapmultisave=1
		lancerlevelmult(2)
	end
end
boutonmulti1:addEventListener( "tap", boutonmulti1 )--lancement de l'ecoute sur le bouton play

function boutonmultimap2:tap(event)
	if clicsurqqcmulti==0 then
		clicsurqqcmulti=1
		multi=1
		niveauch=22
		mapmultisave=2
		fricmulticreation=fricmulti.valeur
		lancerlevelmult(1)
	end
end
boutonmultimap2:addEventListener( "tap", boutonmultimap2 )--lancement de l'ecoute sur le bouton play

function boutonmulti1map2:tap(event)
	if clicsurqqcmulti==0 then
		clicsurqqcmulti=1
		multi=2
		niveauch=22
		mapmultisave=2
		lancerlevelmult(2)
	end
end
boutonmulti1map2:addEventListener( "tap", boutonmulti1map2 )--lancement de l'ecoute sur le bouton play

local function varfic(actiontype)
	if clicsurqqcmulti==0 then
		clicsurqqcmulti=1
		local function clicsurqqcmultitimer1(event)
			clicsurqqcmulti=0
		end
		localclicsurqqcmultitimer=timer.performWithDelay( 100,clicsurqqcmultitimer1)
		if actiontype==1 then
			if fricmulti.valeur+100>=maxtunemulti then
				fricmulti.valeur=maxtunemulti
			else
				fricmulti.valeur=fricmulti.valeur+100
			end
		elseif actiontype==0 then
			if fricmulti.valeur-100<=100 then
				fricmulti.valeur=100
			else
				fricmulti.valeur=fricmulti.valeur-100
			end
		end
		fricmulti.text=fricmulti.valeur
	end
end
function fricfelchehaut:tap(event)

	varfic(0)
end
fricfelchehaut:addEventListener( "tap", fricfelchehaut )--lancement de l'ecoute sur le bouton play
function fricfelche:tap(event)
	varfic(1)
end
fricfelche:addEventListener( "tap", fricfelche )--lancement de l'ecoute sur le bouton play

function menuprin:tap(event)--demande de retour sur le menu principal
		local menuprinc = require ( "mainbis" )
		grmain:removeSelf()
		lemain()
end
menuprin:addEventListener( "tap", menuprin )
end
return(t)