local t = {}--3eme partie des cahrgmeent(image de boutons)
t.chargement1 = function ()
if issimulator then
	local memUsed = (collectgarbage("count")) / 1000
	local texUsed = system.getInfo( "textureMemoryUsed" ) / 1000000
	print("\n---------MEMORY USAGE INFORMATION chargement1 avant---------")
	print("System Memory Used:", string.format("%.03f", memUsed), "Mb")
	print("Texture Memory Used:", string.format("%.03f", texUsed), "Mb")
	print("------------------------------------------\n")
end
	
	imbouton.swipe=graphics.newImageSheet("goh/tuto/swipe1.png", {width=200, height=188, numFrames=1,sheetContentWidth=200,sheetContentHeight=188 } )
	imbouton.cercle=graphics.newImageSheet("goh/bouton/cercle.png",{width=409,height=418,numFrames=1,sheetContentWidth=409,sheetContentHeight=418})
	imbouton.ads=graphics.newImageSheet("goh/bouton/ads.png",{width=300,height=300,numFrames=1,sheetContentWidth=300,sheetContentHeight=300})
	coroutine.yield()
	imbouton.pouvoir=graphics.newImageSheet("goh/bouton/pouvoir.png",{width=209,height=216,numFrames=11,sheetContentWidth=627,sheetContentHeight=864})
	--imbouton.pouvoir3bande=graphics.newImageSheet("goh/bouton/bandepv3.png",{width=84,height=150,numFrames=1,sheetContentWidth=84,sheetContentHeight=150})
	coroutine.yield()
	-- imbouton.zoneoccupe=graphics.newImageSheet("bouton/zoneoccupe.png",{width=448,height=204,numFrames=8,sheetContentWidth=1792,sheetContentHeight=408}) --1})
	imbouton.fondtunevie=graphics.newImageSheet("goh/bouton/fondtunevie.png",{width=50,height=50,numFrames=1,sheetContentWidth=50,sheetContentHeight=50})
	imbouton.affinfofond=graphics.newImageSheet("goh/bouton/affinfofond.png",{width=372,height=187,numFrames=1,sheetContentWidth=372,sheetContentHeight=187}) --{width=400,height=100,numFrames=1})
	imbouton.ombresld=graphics.newImageSheet("goh/AnimVF/ombresld3.png",{width=60,height=37,numFrames=1,sheetContentWidth=60,sheetContentHeight=37})
	imbouton.ombrefl=graphics.newImageSheet("goh/AnimVF/ombrefl.png",{width=30,height=10,numFrames=1,sheetContentWidth=30,sheetContentHeight=10})
	imbouton.ombrebou=graphics.newImageSheet("goh/AnimVF/ombrebou.png",{width=20,height=20,numFrames=1,sheetContentWidth=20,sheetContentHeight=20})
	imbouton.ombrebat=graphics.newImageSheet("goh/AnimVF/ombrebat.png",{width=20,height=20,numFrames=1,sheetContentWidth=20,sheetContentHeight=20})
	imbouton.vague1=graphics.newImageSheet("goh/bouton/vague1.png",{width=541,height=192,numFrames=1,sheetContentWidth=541,sheetContentHeight=192})
	coroutine.yield()
	imbouton.pierretombale=graphics.newImageSheet("goh/AnimVF/pierretombale.png",{width=82,height=123,numFrames=1,sheetContentWidth=82,sheetContentHeight=123}) --{width=177,height=238,numFrames=1})
	imbouton.pierretombalegene=graphics.newImageSheet("goh/AnimVF/tombegene.png",{width=185,height=199,numFrames=1,sheetContentWidth=185,sheetContentHeight=199})
	imbouton.gagne=graphics.newImageSheet("goh/boutonmenu/gagne.png",{width=1855,height=1020,numFrames=2,sheetContentWidth=1855,sheetContentHeight=2048})
	chargementdesfichier[3]=1
end
return (t)