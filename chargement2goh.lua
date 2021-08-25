local t = {}--chagement des image de projectile
	--	local lancerNiveau1 = require ( "niveau1" )
t.chargement2 = function ()
if issimulator then
	local memUsed = (collectgarbage("count")) / 1000
	local texUsed = system.getInfo( "textureMemoryUsed" ) / 1000000
	print("\n---------MEMORY USAGE INFORMATION chargement2 avant---------")
	print("System Memory Used:", string.format("%.03f", memUsed), "Mb")
	print("Texture Memory Used:", string.format("%.03f", texUsed), "Mb")
	print("------------------------------------------\n")
end
--print(coroutine.running())
	--impro={}
	impro.trainee=graphics.newImageSheet("goh/batiment/projectiles/trainee.png",{width=194,height=62,numFrames=1,sheetContentWidth=194,sheetContentHeight=62})
	impro.flechepluie=graphics.newImageSheet( "goh/batiment/projectiles/flechepluie.png", { width=17, height=35, numFrames=3,sheetContentWidth=17,sheetContentHeight=105 } )
	coroutine.yield()
	impro.meteorite=graphics.newImageSheet( "goh/batiment/projectiles/meteorite.png", { width=53, height=127, numFrames=2,sheetContentWidth=106,sheetContentHeight=127 } )
	-- impro.foudre=graphics.newImageSheet( "batiment/projectiles/foudre.png", { width=50, height=50, numFrames=2,sheetContentWidth=50,sheetContentHeight=100 } )
	coroutine.yield()
	-- impro.projectiles=graphics.newImageSheet( "batiment/projectiles/projectiles.png", { width=194, height=62, numFrames=7 } )
	-- impro.projectiles1=graphics.newImageSheet( "batiment/projectiles/projectiles1.png", { width=194, height=62, numFrames=7})
	impro.poussiere=graphics.newImageSheet("goh/AnimVF/ondechoc.png",{width=512,height=352,numFrames=1,sheetContentWidth=512,sheetContentHeight=352}) --graphics.newImageSheet("AnimVF/ombresld.png",{width=20,height=8,numFrames=1,sheetContentWidth=20,sheetContentHeight=8})
	impro.explosion=graphics.newImageSheet("goh/AnimVF/explosion.png",{width=253,height=303,numFrames=16,sheetContentWidth=1012,sheetContentHeight=1212})
	impro.explosionseq={
		name="explosion",
    	frames={1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16},--frames= {1,4,5,3}, -- frame indexes of animation, in image sheet
    	time = 500,
    	loopCount = 1,        -- Optional. Default is 0.
	}
	impro.explosionseq1={ -- pour test en attendant d'avoir de vrai anim
		name="explosion",
    	frames={7,8,7,8,7,8,7},--frames= {1,4,5,3}, -- frame indexes of animation, in image sheet
    	time = 500,
    	loopCount = 0,        -- Optional. Default is 0.
	}
	--	imgbat.ondechoc=graphics.newImageSheet("AnimVF/ondechoc.png",{width=512,height=410,numFrames=14})
	impro.liquide={}
	--impro.liquide.bat1=graphics.newImageSheet( "goh/batiment/projectiles/projectiles.png", { width=248, height=123, numFrames=7,sheetContentWidth=248,sheetContentHeight=861 } )
	--impro.liquide.bat1sol=graphics.newImageSheet("AnimVF/ombresld.png",{width=20,height=8,numFrames=1,sheetContentWidth=20,sheetContentHeight=8})
	coroutine.yield()
	immulti={}
	--immulti.bouton=graphics.newImageSheet("multi/type.jpg",{width=100,height=50,numFrames=4})-- 18/10/2016
	-- immulti.bouton2=graphics.newImageSheet("multi/type2.png",{width=100,height=50,numFrames=1})
	-- immulti.bouton3=graphics.newImageSheet("multi/type3.png",{width=100,height=50,numFrames=1})
	-- immulti.bouton4=graphics.newImageSheet("multi/type4.png",{width=100,height=50,numFrames=1})
	coroutine.yield()
	imageecha=graphics.newImageSheet( "goh/batiment/echafaudage1.png", { width=358, height=500, numFrames=5,sheetContentWidth=1074,sheetContentHeight=1000 } )

	imaanim={}
	local indiceimaanim=1
	imaanim[indiceimaanim]={}
	imaanim[indiceimaanim].sheet=graphics.newImageSheet( "goh/carte/animg/oiseau.png", { width=65, height=71, numFrames=4 } )
	imaanim[indiceimaanim].nom="oiseau"
	imaanim[indiceimaanim].scale=0.5
	imaanim[indiceimaanim].seq={ name="liq",frames= {1,2,3,4},time = 1000} 
	imaanim[indiceimaanim].vitesse=1 -- vitesse inversé 1/vitesse
	imaanim[indiceimaanim].cadence=15000
	imaanim[indiceimaanim].alpha=1
	imaanim[indiceimaanim].carte={true,true,true,true,true,true,true,true,false,false,false,false,false,false,false,false}

	indiceimaanim=indiceimaanim+1
	imaanim[indiceimaanim]={}
	imaanim[indiceimaanim].sheet=graphics.newImageSheet( "goh/carte/animg/corbeau.png", { width=48, height=46, numFrames=4 } )
	imaanim[indiceimaanim].nom="corbeau"
	imaanim[indiceimaanim].scale=0.5
	imaanim[indiceimaanim].seq={ name="liq",frames= {1,2,3,4},time = 1000} 
	imaanim[indiceimaanim].vitesse=1 -- vitesse inversé 1/vitesse
	imaanim[indiceimaanim].cadence=15000
	imaanim[indiceimaanim].alpha=1
	imaanim[indiceimaanim].carte={false,false,false,false,false,false,false,false,false,false,false,false,true,true,true,true}

	indiceimaanim=indiceimaanim+1
	imaanim[indiceimaanim]={}
	imaanim[indiceimaanim].sheet=graphics.newImageSheet( "goh/carte/animg/vautour.png", { width=45, height=49, numFrames=4 } )
	imaanim[indiceimaanim].nom="vautour"
	imaanim[indiceimaanim].scale=0.9
	imaanim[indiceimaanim].seq={ name="liq",frames= {1,2,3,4},time = 1000} 
	imaanim[indiceimaanim].vitesse=1 -- vitesse inversé 1/vitesse
	imaanim[indiceimaanim].cadence=15000
	imaanim[indiceimaanim].alpha=1
	imaanim[indiceimaanim].carte={false,false,false,false,false,false,false,false,true,true,true,true,false,false,false,false}



	--bplein.x=contentcenterx-60*0.2
	--bplein.xScale=0.8
	-- local chargementaffichage = require ( "chargementaff")
	-- chargementevo()
	--imgchargement:rotate(90)
	--imgchargement2:removeSelf()
	--imgchargement3=display.newImage("choniveau/chargementter.png",actualcontentwidth/2,actualcontentheight/2,true)
	-- local function timerlancerniv4( event )
	-- 	print("chargementdesfichier="..chargementdesfichier.." chargement2")
	-- 	if chargementdesfichier==5 then
	-- 		-- local lancerNiveau1 = require ( "niveau1" )
	-- 		-- lancerNiveau1.niveau1(0)
	-- 	end
	-- 	-- local chargement3 = require ( "chargement3")
	-- 	-- chargement3.chargement3()
	-- end
	-- timerlancernivqua=timer.performWithDelay( 50, timerlancerniv4 )
	-- chargementdesfichier=chargementdesfichier+1
	chargementdesfichier[4]=1
end
return(t)