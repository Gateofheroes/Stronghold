local t={}--chargement necessaire au lancement du menu principal
function unloadimagemain()
	if menulud then
		if goh then
			imagemenu.menu=nil
			imagemenu.setting=nil
			imagemenu.play=nil
			imagemenu.fond=nil
			imagemenu.campaign=nil
		else
		--imagemenu.menu=graphics.newImageSheet( "Menuprincipal/imagemenu1.jpg", { width=2560, height=1440, numFrames=1,sheetContentWidth=2560,sheetContentHeight=1440} )
			imagemenu.geant=nil
			imagemenu.elfe=nil
			imagemenu.parchemin=nil
			imagemenu.montagnes=nil
			imagemenu.menu=nil
			imagemenu.colline=nil
			imagemenu.boutonlud=nil
			imagemenu.chainelud=nil
			imagemenu.quitterlud=nil
		end
	else
		imagemenu.menu=nil
	end
	imagemenu.savebt=nil
	imagemenu.BoutonPlay=nil
	--imagemenu.chaine=nil
	imagemenu.BoutonDev1=nil
	imagemenu.quitter=nil
end
function loadorreloadimagemain()
	if menulud then
		if goh then
			imagemenu.inAppPopup=graphics.newImageSheet( "goh/boutonmenu/inAppPopup.jpg", { width=1515, height=1080, numFrames=1,sheetContentWidth=1515,sheetContentHeight=1080} )
			imagemenu.pourflou=graphics.newImageSheet( "goh/Menuprincipal/baseflou.png", { width=2048, height=1151, numFrames=1,sheetContentWidth=2048,sheetContentHeight=1151} )
			imagemenu.menu=graphics.newImageSheet( "goh/Menuprincipal/base.png", { width=2048, height=1151, numFrames=1,sheetContentWidth=2048,sheetContentHeight=1151} )
			imagemenu.setting=graphics.newImageSheet( "goh/Menuprincipal/setting.png", { width=121, height=115, numFrames=6,sheetContentWidth=363,sheetContentHeight=230} )
			imagemenu.play=graphics.newImageSheet( "goh/Menuprincipal/play.png", { width=172, height=181, numFrames=4,sheetContentWidth=688,sheetContentHeight=181} )
			imagemenu.fond=graphics.newImageSheet( "goh/Menuprincipal/fond.png", { width=1289, height=758, numFrames=1,sheetContentWidth=1289,sheetContentHeight=758} )
			imagemenu.campaign=graphics.newImageSheet( "goh/Menuprincipal/campaign.png", { width=860, height=199, numFrames=4,sheetContentWidth=860,sheetContentHeight=796} )
		else
			--imagemenu.menu=graphics.newImageSheet( "Menuprincipal/imagemenu1.jpg", { width=2560, height=1440, numFrames=1,sheetContentWidth=2560,sheetContentHeight=1440} )
			imagemenu.geant=graphics.newImageSheet( "Menuprincipal/geant.png", { width=857, height=1332, numFrames=1,sheetContentWidth=857,sheetContentHeight=1332} )
			imagemenu.elfe=graphics.newImageSheet( "Menuprincipal/elf.png", { width=945, height=1440, numFrames=1,sheetContentWidth=945,sheetContentHeight=1440} )
			imagemenu.parchemin=graphics.newImageSheet( "Menuprincipal/parchemin.png", { width=2152, height=523, numFrames=1,sheetContentWidth=2152,sheetContentHeight=523} )
			imagemenu.montagnes=graphics.newImageSheet( "Menuprincipal/montagnes.png", { width=2560, height=1218, numFrames=1,sheetContentWidth=2560,sheetContentHeight=1218} )
			imagemenu.menu=graphics.newImageSheet( "Menuprincipal/sky.jpg", { width=2560, height=1440, numFrames=1,sheetContentWidth=2560,sheetContentHeight=1440} )
			imagemenu.pourflou=graphics.newImageSheet( "Menuprincipal/pourflou.jpg", { width=2560, height=1440, numFrames=1,sheetContentWidth=2560,sheetContentHeight=1440} )
			imagemenu.colline=graphics.newImageSheet( "Menuprincipal/colline.png", { width=2560, height=754, numFrames=1,sheetContentWidth=2560,sheetContentHeight=754} )
			imagemenu.boutonlud=graphics.newImageSheet( "Menuprincipal/boutonlud.png", { width=690, height=170, numFrames=12,sheetContentWidth=690,sheetContentHeight=2040} )
			imagemenu.chainelud=graphics.newImageSheet( "Menuprincipal/chaine.png", { width=100, height=1449, numFrames=1,sheetContentWidth=100,sheetContentHeight=1449} )
			imagemenu.quitterlud=graphics.newImageSheet( "Menuprincipal/panneau_quitter.png", { width=950, height=709, numFrames=1,sheetContentWidth=950,sheetContentHeight=709} )
		end
	else
		imagemenu.menu=graphics.newImageSheet( "Menuprincipal/imageMenu.jpg", { width=2560, height=1440, numFrames=1,sheetContentWidth=2560,sheetContentHeight=1440} )
		imagemenu.BoutonPlay=graphics.newImageSheet( "Menuprincipal/BoutonPlay.png", { width=501, height=196, numFrames=6,sheetContentWidth=1002,sheetContentHeight=597 } )
		imagemenu.quitter=graphics.newImageSheet("Menuprincipal/bpquitter.png",{width=238,height=238,numFrames=2})
	end
	if not goh then
		imagemenu.savebt=graphics.newImageSheet( "bouton/save.png", { width=339, height=280, numFrames=2,sheetContentWidth=678,sheetContentHeight=280 } )
		imagemenu.chaine=graphics.newImageSheet( "Menuprincipal/chaines.png", { width=393, height=120, numFrames=1,sheetContentWidth=393,sheetContentHeight=120 } )
		imagemenu.BoutonDev1=graphics.newImageSheet( "Menuprincipal/BoutonDev1.png", { width=570, height=550, numFrames=2 ,sheetContentWidth=570,sheetContentHeight=1100 } )
		imagemenu.fondtune=graphics.newImageSheet("Menuprincipal/fondtune.png",{width=400,height=200,numFrames=1,sheetContentWidth=400,sheetContentHeight=200})
	else
		imagemenu.savebt=graphics.newImageSheet( "goh/bouton/save.png", { width=154, height=159, numFrames=2,sheetContentWidth=154,sheetContentHeight=318 } )
		imagemenu.chaine=graphics.newImageSheet( "goh/Menuprincipal/chaines.png", { width=393, height=120, numFrames=1,sheetContentWidth=393,sheetContentHeight=120 } )

		imagemenu.fondtune=graphics.newImageSheet("goh/Menuprincipal/fondtune.png",{width=400,height=200,numFrames=1,sheetContentWidth=400,sheetContentHeight=200})
	end
end
function lechargementmain(action)
	loadorreloadimagemain()
	

	--imagemenu.multimenu=graphics.newImageSheet( "multi/menumulti.jpg", { width=1920, height=1080, numFrames=1 } )
	--imagemenu.multifricfond=graphics.newImageSheet( "multi/fondfric.png", { width=100, height=50, numFrames=1 } )
	--imagemenu.multifricfleche=graphics.newImageSheet( "multi/fricfleche.png", { width=50, height=25, numFrames=1 } )
	--imagemenu.BoutonMulti=graphics.newImageSheet( "multi/multi.png", { width=100, height=50, numFrames=1 } )

	
	--imagemenu.BoutonDev=graphics.newImageSheet( "Menuprincipal/BoutonDev.png", { width=600, height=340, numFrames=1 } )
	
	--
	--imagemenu.carteniveau=graphics.newImageSheet( "choniveau/carteniveau.png", { width=2048, height=1024, numFrames=1 } )
	-- imagemenu.niv1=graphics.newImageSheet( "choniveau/niv1.png", { width=400, height=400, numFrames=1 } )
	-- imagemenu.niv2=graphics.newImageSheet( "choniveau/niv2.png", { width=400, height=400, numFrames=1 } )
	-- imagemenu.bphumain=graphics.newImageSheet( "choniveau/bphumain.png", { width=400, height=400, numFrames=1 } )
	-- imagemenu.bpelfe=graphics.newImageSheet(  "choniveau/bpelfe.png", { width=400, height=400, numFrames=1 } )
	-- imagemenu.bpgeant=graphics.newImageSheet( "choniveau/bpgeant.png", { width=400, height=400, numFrames=1 } )
	-- imagemenu.piececristalvide=graphics.newImageSheet("bouton/piececristalvide.png",{width=100,height=100,numFrames=1})
	
	-- imagemenu.chalengefond=graphics.newImageSheet("chalenge/fond.png",{width=100,height=50,numFrames=1})
	-- imagemenu.chalengebouton=graphics.newImageSheet("chalenge/chalenge.png",{width=100,height=50,numFrames=1})

	-- imagemenu.arriereplan=graphics.newImageSheet("menudevnew/arriereplan.jpg",{width=960,height=540,numFrames=1,sheetContentWidth=960,sheetContentHeight=540})
	-- imagemenu.bandeau=graphics.newImageSheet("menudevnew/bandeau.jpg",{width=500,height=50,numFrames=1,sheetContentWidth=500,sheetContentHeight=50})
	-- imagemenu.barver=graphics.newImageSheet("menudevnew/barver.jpg",{width=320,height=540,numFrames=1,sheetContentWidth=320,sheetContentHeight=540})
	-- imagemenu.bouton=graphics.newImageSheet("menudevnew/bouton.png",{width=500,height=250,numFrames=6,sheetContentWidth=1000,sheetContentHeight=750})
	-- imagemenu.bouton1=graphics.newImageSheet("menudevnew/bouton1.png",{width=500,height=250,numFrames=2,sheetContentWidth=500,sheetContentHeight=500})
	-- imagemenu.bpconf=graphics.newImageSheet("menudevnew/bpconf.png",{width=50,height=10,numFrames=1,sheetContentWidth=50,sheetContentHeight=10})
	-- imagemenu.elfe=graphics.newImageSheet("menudevnew/elfe.png",{width=125,height=75,numFrames=1,sheetContentWidth=125,sheetContentHeight=75})
	-- imagemenu.geant=graphics.newImageSheet("menudevnew/geant.png",{width=125,height=75,numFrames=1,sheetContentWidth=125,sheetContentHeight=75})
	-- imagemenu.humain=graphics.newImageSheet("menudevnew/humain.png",{width=250,height=40,numFrames=1,sheetContentWidth=250,sheetContentHeight=40})
	-- imagemenu.imbandeau=graphics.newImageSheet("menudevnew/imbandeau.png",{width=50,height=25,numFrames=1,sheetContentWidth=50,sheetContentHeight=25})
	-- imagemenu.artha=graphics.newImageSheet( "choniveau/ARTHA_Entertainment.png", { width=782, height=400, numFrames=1 } )
	-- imagemenu.artha1=graphics.newImageSheet( "choniveau/ARTHA_Entertainment1.png", { width=782, height=400, numFrames=1 } )
	-- imagemenu.bchargementvide=graphics.newImageSheet( "choniveau/bchargementvide.png", { width=120, height=30, numFrames=1 } )
	-- imagemenu.bchargementplein=graphics.newImageSheet( "choniveau/bchargementplein.png", { width=120, height=30, numFrames=1 } )
	-- imagemenu.bchargementdeb=graphics.newImageSheet( "choniveau/bchargementdeb.png", { width=120, height=30, numFrames=1 } )
	-- imagemenu.blackscreen=graphics.newImageSheet( "choniveau/noir.png", { width=10, height=10, numFrames=1 } )
	--imchargmentmain:removeSelf()

	-- son.combatacid = audio.loadSound( "son/Combat/Acid_liquid.mp3" )
	-- son.combatarc={} 
	-- son.combatarc[1]= audio.loadSound( "son/Combat/Arc_tir2.mp3" )
	-- son.combatarc[2]= audio.loadSound( "son/Combat/Arc_tir3.mp3" )
	-- son.combatarc[3]= audio.loadSound( "son/Combat/Arc_tir4.mp3" )

	-- son.combatarmtran = audio.loadSound( "son/Combat/Arme_tranche.mp3" )
	-- son.combatboss = audio.loadSound( "son/Combat/Boss_scream.mp3" )
	-- son.combatcanon = audio.loadSound( "son/Combat/Canon_tir.mp3" )
	-- son.combatcriti={} 
	-- son.combatcriti[1]= audio.loadSound( "son/Combat/Coup_critique.mp3" )
	-- son.combatcriti[2]= audio.loadSound( "son/Combat/Coup_critique1.mp3" )
	-- son.combatcriti[3]= audio.loadSound( "son/Combat/Coup_critique2.mp3" )
	-- son.combatcriti[4]= audio.loadSound( "son/Combat/Coup_critique3.mp3" )
	-- son.combatsword={}
	-- son.combatsword[1] = audio.loadSound( "son/Combat/Sword_attack1.mp3" )
	-- son.combatsword[2] = audio.loadSound( "son/Combat/Sword_attack2.mp3" )
	-- son.combatsword[3] = audio.loadSound( "son/Combat/Sword_attack3.mp3" )
	-- son.combatsword[4] = audio.loadSound( "son/Combat/Sword_attack4.mp3" )

	-- son.eventboss = audio.loadSound( "son/Events/Boss_warning.mp3" )
	-- son.eventinf = audio.loadSound( "son/Events/Construction_chateau.mp3" )
	-- son.eventarc = audio.loadSound( "son/Events/Construction_tours_archers.mp3" )
	-- son.eventven = audio.loadSound( "son/Events/Vendre_batiment.mp3" )
	-- son.eventperdu =audio.loadStream( "son/Events/Death_bell.mp3" )
	-- son.eventbell =audio.loadStream( "son/Events/Sortie_map.mp3" )
	-- son.eventcoin =audio.loadStream( "son/Events/gold_coin.mp3" )
	-- son.eventmineb = audio.loadSound( "son/Events/mine_break.mp3" )
	-- son.eventwin = audio.loadSound( "son/Events/Win_sound.mp3" )
	if not goh then
		son.uicl1 = audio.loadSound( "son/UI/Click1.mp3" )
		son.uicl2 = audio.loadSound( "son/UI/Click2.mp3" )
		son.uicl3 = audio.loadSound( "son/UI/Click3.mp3" )
		son.uip1 = audio.loadSound( "son/UI/Page1.mp3" )
		son.uip2 = audio.loadSound( "son/UI/Page2.mp3" )
	else
		son.uicl1 = audio.loadSound( "goh/son/UI/Click1.mp3" )
		son.uicl2 = audio.loadSound( "goh/son/UI/Click2.mp3" )
		son.uicl3 = audio.loadSound( "goh/son/UI/Click3.mp3" )
		son.uip1 = audio.loadSound( "goh/son/UI/Page1.mp3" )
		son.uip2 = audio.loadSound( "goh/son/UI/Page2.mp3" )
	end
	if imbouton==nil then
		imbouton={}
	end
	if not goh then
		imbouton.fenconf=graphics.newImageSheet("boutonmenu/fenetre.png",{width=240,height=150,numFrames=1,sheetContentWidth=240,sheetContentHeight=150}) --,{width=1920,height=1020, {width=240,height=150,numFrames=1}) --{width=1920,height=1080,numFrames=1})
		imbouton.batiment=graphics.newImageSheet("bouton/batiment.png",{width=154,height=154,numFrames=21,sheetContentWidth=616,sheetContentHeight=924})
		imbouton.menupause=graphics.newImageSheet("bouton/boutonpause.png",{width=54,height=54,numFrames=12})
		imbouton.fleche=graphics.newImageSheet("tuto/fleche.png", { width=100, height=100, numFrames=1,sheetContentWidth=100,sheetContentHeight=100 } )
		imbouton.inapp=graphics.newImageSheet("bouton/inapp.png", { width=545, height=538, numFrames=4,sheetContentWidth=1090,sheetContentHeight=1076 } )
		imbouton.monnaie=graphics.newImageSheet("bouton/monnaie.png", { width=200, height=200, numFrames=8,sheetContentWidth=800,sheetContentHeight=400 } )
		impro={}
		impro.projectiles=graphics.newImageSheet( "batiment/projectiles/projectiles.png", { width=194, height=62, numFrames=7,sheetContentWidth =194,sheetContentHeight =434} )
		impro.projectiles1=graphics.newImageSheet( "batiment/projectiles/projectiles1.png", { width=194, height=62, numFrames=7,sheetContentWidth =194,sheetContentHeight =434})
		imbouton.interdit=graphics.newImageSheet("bouton/interdit.png",{width=100,height=100,numFrames=1})
	else
		imbouton.fenconf=graphics.newImageSheet("goh/boutonmenu/fenetre.png",{width=240,height=150,numFrames=1,sheetContentWidth=240,sheetContentHeight=150}) --,{width=1920,height=1020, {width=240,height=150,numFrames=1}) --{width=1920,height=1080,numFrames=1})
		imbouton.batiment=graphics.newImageSheet("goh/bouton/batiment.png",{width=289,height=316,numFrames=21,sheetContentWidth=1445,sheetContentHeight=1580})
		imbouton.menupause=graphics.newImageSheet("goh/bouton/boutonpause.png",{width=232,height=229,numFrames=12,sheetContentWidth=928,sheetContentHeight=687})
		imbouton.fleche=graphics.newImageSheet("goh/tuto/fleche.png", { width=100, height=100, numFrames=1,sheetContentWidth=100,sheetContentHeight=100 } )
		imbouton.inapp=graphics.newImageSheet("goh/bouton/inapp.png", { width=216, height=182, numFrames=4,sheetContentWidth=432,sheetContentHeight=364 } )
		imbouton.monnaie=graphics.newImageSheet("goh/bouton/monnaie.png", { width=216, height=206, numFrames=6,sheetContentWidth=648,sheetContentHeight=412 } )
		impro={}
		impro.projectiles=graphics.newImageSheet( "goh/batiment/projectiles/projectiles.png", { width=248, height=123, numFrames=7,sheetContentWidth=248,sheetContentHeight=861 } )
		impro.projectiles1=graphics.newImageSheet( "goh/batiment/projectiles/projectiles1.png", { width=184, height=105, numFrames=7,sheetContentWidth =184,sheetContentHeight =735})
		imbouton.interdit=graphics.newImageSheet("goh/bouton/interdit.png",{width=138,height=140,numFrames=1,sheetContentWidth=138,sheetContentHeight=140})
		
	end
	
	--imbouton.son=graphics.newImageSheet("bouton/son.png",{width=50,height=50,numFrames=2})
	-- imbouton.vaguesui=graphics.newImageSheet("bouton/vaguesui.png",{width=126,height=126,numFrames=1})
	-- imbouton.vie=graphics.newImageSheet("bouton/vaguesui.png",{width=126,height=126,numFrames=1})
	colortextemb=
	{
	   highlight ={r=0,g=0,b=0},-- { r=0.8, g=0.9, b=1 },à;
	   shadow = { r=0.4, g=0.4, b=0.6 }
	}
		colortextemb1=--version clair du contour
	{
	   highlight ={r=1,g=1,b=1},-- { r=0.8, g=0.9, b=1 },à;
	   shadow = { r=0.6, g=0.6, b=0.4 }
	}
	colortextemb2=--version clair du contour fin
	{
	   highlight ={r=0.8,g=0.8,b=0.8},-- { r=0.8, g=0.9, b=1 },à;
	   shadow = { r=0, g=0, b=0 }
	}
	colortextfill={ 0.9, 0.9, 0 } --0.14,0.76,0.92}
	colortextdiam={0.8,0.2,0.2}
	

	--local chargementaffichage = require ( "chargementaff")
	--chargementsup()
	if true or savegame.tuto1 then--pour supprimer le niveau0
		if savegame.tuto1 then
			print("tuto1 true")
		else
			print("tuto1 false")
		end
		if savegame.tuto2 then
			print("tuto1 true")
		else
			print("tuto1 false")
		end
		if savegame.tuto3 then
			print("tuto1 true")
		else
			print("tuto1 false")
		end
		local mainbis1=require("mainbis")
		lemain()
	else
		local intro=require("intro")
		intro.new()

		-- local function lancertutoteube( event )
		-- 	if donneecharger[31] then
		-- 		multi=0
		-- 		local actionmenu1= require("menucarte")
		-- 		if goh then
		-- 			actionmenu1.ordre(3,1,17,3)
		-- 		else
		-- 			actionmenu1.ordre(3,1,16,3)
		-- 		end
		-- 	else	
		-- 		local whatever=timer.performWithDelay( 30, lancertutoteube )
		-- 	end
		-- end
		-- local whatever=timer.performWithDelay( 3000, lancertutoteube )
	end
end
t.chargementmain= function()
local a=1
end
return t