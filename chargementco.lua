local t={}--chargement necessaire au lancement du menu principal
function lechargementco(action)
-- premiere coroutine de chargement de ficghier
	--print(coroutine.running())
	-- imagemenu.chalengefond=graphics.newImageSheet("chalenge/fond.png",{width=100,height=50,numFrames=1})
	-- imagemenu.chalengebouton=graphics.newImageSheet("chalenge/chalenge.png",{width=100,height=50,numFrames=1})
	imagemenu.arriereplan=graphics.newImageSheet("menudevnew/arriereplan.jpg",{width=960,height=540,numFrames=1,sheetContentWidth=960,sheetContentHeight=540})
	-- imagemenu.bandeau=graphics.newImageSheet("menudevnew/bandeau.png",{width=1000,height=120,numFrames=1,sheetContentWidth=1000,sheetContentHeight=120})
	imagemenu.barver=graphics.newImageSheet("menudevnew/barver.jpg",{width=320,height=540,numFrames=1,sheetContentWidth=320,sheetContentHeight=540})
	imagemenu.bouton=graphics.newImageSheet("menudevnew/bouton.png",{width=500,height=250,numFrames=6,sheetContentWidth=1000,sheetContentHeight=750})
	imagemenu.boutoncarte=graphics.newImageSheet("menudevnew/boutoncarte.png",{width=269,height=456,numFrames=4,sheetContentWidth=538,sheetContentHeight=912})
	--coroutine.yield()
	--imagemenu.bouton1=graphics.newImageSheet("menudevnew/bouton1.png",{width=500,height=250,numFrames=2,sheetContentWidth=500,sheetContentHeight=500})
	imagemenu.bpconf=graphics.newImageSheet("menudevnew/bpconf.png",{width=50,height=10,numFrames=1,sheetContentWidth=50,sheetContentHeight=10})
	-- imagemenu.elfe=graphics.newImageSheet("menudevnew/elfe.png",{width=125,height=75,numFrames=1,sheetContentWidth=125,sheetContentHeight=75})
	-- imagemenu.geant=graphics.newImageSheet("menudevnew/geant.png",{width=125,height=75,numFrames=1,sheetContentWidth=125,sheetContentHeight=75})
	-- imagemenu.humain=graphics.newImageSheet("menudevnew/humain.png",{width=250,height=40,numFrames=1,sheetContentWidth=250,sheetContentHeight=40})
	imagemenu.race=graphics.newImageSheet("menudevnew/choixraces.png",{width=600,height=600,numFrames=4,sheetContentWidth=1200,sheetContentHeight=1200}) --,sheetContentWidth=250,sheetContentHeight=40})
	imagemenu.imbandeau=graphics.newImageSheet("menudevnew/imbandeau.png",{width=50,height=25,numFrames=1,sheetContentWidth=50,sheetContentHeight=25})
	imagemenu.onglet=graphics.newImageSheet("menudevnew/onglet.png",{width=497,height=195,numFrames=2,sheetContentWidth=497,sheetContentHeight=390})
	imagemenu.bpmenuprin=graphics.newImageSheet("choniveau/menuprin.png", { width=838, height=682, numFrames=2,sheetContentWidth=1676,sheetContentHeight=682 } )
	imagemenu.torchebat=graphics.newImageSheet("menudevnew/torche.png", { width=216, height=948, numFrames=1,sheetContentWidth=216,sheetContentHeight=948 } )
	if imbouton==nil then
		imbouton={}
	end
	
	imbouton.vaguesui=graphics.newImageSheet("bouton/vaguesui.png",{width=126,height=126,numFrames=1})
	--imbouton.vie=graphics.newImageSheet("bouton/vaguesui.png",{width=126,height=126,numFrames=1})





	effetexplo={}
	effetexplo.torche=graphics.newImageSheet("effets/torche.png",{width=45,height=149,numFrames=20,sheetContentWidth=225,sheetContentHeight=596})
	effetexplo.torcheseq={
    	name="levelup",
    	frames={20,19,18,17,16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1},--frames= {1,4,5,3}, -- frame indexes of animation, in image sheet
    	time=1000,
    	loopCount=0,        -- Optional. Default is 0.
	}
	effetexplo.torche1=graphics.newImageSheet("effets/torche1.png",{width=45,height=70,numFrames=5})
	effetexplo.torche1seq={
    	name="levelup",
    	frames={1,2,3,4,5},--frames= {1,4,5,3}, -- frame indexes of animation, in image sheet
    	time=300,
    	loopCount=0,        -- Optional. Default is 0.
	}
	effetexplo.fl1=graphics.newImageSheet("effets/fl1.png",{width=256,height=256,numFrames=20,sheetContentWidth=1280,sheetContentHeight=1024})
	effetexplo.fl1seq={
		name="levelup",
		frames={1,2,3,4,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20},--frames= {1,4,5,3}, -- frame indexes of animation, in image sheet
		time=1200,
		loopCount=0,        -- Optional. Default is 0.
	}
	 effetexplo.fl=graphics.newImageSheet("effets/fl.png",{width=220,height=240,numFrames=4,sheetContentWidth=880,sheetContentHeight=240})
	effetexplo.flseq={
		name="levelup",
		frames={1,2,3,4,3,2},--frames= {1,4,5,3}, -- frame indexes of animation, in image sheet
		time=1000,
		loopCount=0,        -- Optional. Default is 0.
	}
	print("fini du chargementco")
end
t.chargementco= function()
print("on ici chargementco")
local a=1
end
return t