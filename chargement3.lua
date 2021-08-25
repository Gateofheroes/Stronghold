local t = {}--chagement des images de batiments
t.chargement3 = function ()
if issimulator then
	local memUsed = (collectgarbage("count")) / 1000
	local texUsed = system.getInfo( "textureMemoryUsed" ) / 1000000
	print("\n---------MEMORY USAGE INFORMATION chargement3 avant---------")
	print("System Memory Used:", string.format("%.03f", memUsed), "Mb")
	print("Texture Memory Used:", string.format("%.03f", texUsed), "Mb")
	print("------------------------------------------\n")
end
-- local lancerNiveau1 = require ( "niveau1" )
	imgbat={}
	imgbat.contact=graphics.newImageSheet( "batiment/contact.png", { width=525, height=514, numFrames=9,sheetContentWidth=1575,sheetContentHeight=1542 } )
	imgbat.distance=graphics.newImageSheet( "batiment/distance.png", { width=525, height=516, numFrames=9,sheetContentWidth=1575,sheetContentHeight=1548 } )
	coroutine.yield()
	imgbat.mine=graphics.newImageSheet( "batiment/mine.png", { width=532, height=337, numFrames=9,sheetContentWidth=1596,sheetContentHeight=1011 } )
	imgbat.minefric=graphics.newImageSheet( "batiment/anfric.png", { width=300, height=250, numFrames=5,sheetContentWidth=300,sheetContentHeight=1250 } )
	coroutine.yield()
	imgbat.inf=graphics.newImageSheet( "batiment/infanterie1.png", { width=525, height=510, numFrames=1,sheetContentWidth=525,sheetContentHeight=510 })
	imgbat.arc=graphics.newImageSheet( "batiment/archers1.png", { width=525, height=510, numFrames=1,sheetContentWidth=525,sheetContentHeight=510 }  )
	--imgbat.archer=graphics.newImageSheet( "batiment/haut_tour/archer.png", { width=135, height=125, numFrames=5 }  )
	--imgbat.archerim=graphics.newImageSheet( "batiment/haut_tour/archerim.png", { width=135, height=125, numFrames=1})
	--imgbat.bras=graphics.newImageSheet( "batiment/haut_tour/bras.png", { width=116, height=89, numFrames=3 }  )

	--imgbat.liquide1=graphics.newImageSheet("batiment/attliquide/liquide1.png",{width=458,height=601,numFrames=7,sheetContentWidth=1374,sheetContentHeight=1803})
	--imgbat.liquidecercle1=graphics.newImageSheet("batiment/attliquide/liquidecercle1.png",{width=250,height=200,numFrames=1,sheetContentWidth=250,sheetContentHeight=200})
	--imgbat.liquide2=graphics.newImageSheet("batiment/attliquide/liquide2.png",{width=525,height=510,numFrames=7,sheetContentWidth=1575,sheetContentHeight=1530})
	--imgbat.liquidecercle2=graphics.newImageSheet("batiment/attliquide/liquidecercle2.png",{width=250,height=200,numFrames=1,sheetContentWidth=250,sheetContentHeight=200})
	imgbat.liquide2=graphics.newImageSheet("batiment/attliquide/liquide2.png",{width=276,height=293,numFrames=4,sheetContentWidth=552,sheetContentHeight=586})
	imgbat.liquide1=graphics.newImageSheet("batiment/attliquide/liquide1.png",{width=137,height=176,numFrames=4,sheetContentWidth=274,sheetContentHeight=352})
	imgbat.liquide3=graphics.newImageSheet("batiment/attliquide/liquide3.png",{width=565,height=600,numFrames=7,sheetContentWidth=1695,sheetContentHeight=1800})
	coroutine.yield()
	--imgbat.liquidecercle3=graphics.newImageSheet("batiment/attliquide/liquidecercle2.png",{width=250,height=200,numFrames=1,sheetContentWidth=250,sheetContentHeight=200})
	--imgbat.liquidecercle=graphics.newImageSheet("batiment/attliquide/liquidecercle.png",{width=250,height=200,numFrames=1,sheetContentWidth=250,sheetContentHeight=200})
	--imgbat.liquidecerclean=graphics.newImageSheet("batiment/attliquide/liquidecerclean.png",{width=486,height=355,numFrames=3,sheetContentWidth=486,sheetContentHeight=1065})
	--imgbat.liquidecerclean1=graphics.newImageSheet("batiment/attliquide/liquidecerclean1.png",{width=486,height=355,numFrames=3,sheetContentWidth=486,sheetContentHeight=1065})
	imgbat.pique1=graphics.newImageSheet("batiment/attliquide/pique1.png",{width=200,height=200,numFrames=3,sheetContentWidth=600,sheetContentHeight=200})
	imgbat.pique2=graphics.newImageSheet("batiment/attliquide/pique2.png",{width=200,height=200,numFrames=3,sheetContentWidth=600,sheetContentHeight=200})
	imgbat.pique3=graphics.newImageSheet("batiment/attliquide/pique3.png",{width=200,height=160,numFrames=5,sheetContentWidth=200,sheetContentHeight=800})
	--imgbat.liquidecerclean=graphics.newImageSheet("batiment/attliquide/liquidecerclean.png",{width=250,height=200,numFrames=3,sheetContentWidth=250,sheetContentHeight=600})
	imgbat.brascata=graphics.newImageSheet("batiment/haut_tour/brascata.png",{width=116,height=120,numFrames=15,sheetContentWidth=348,sheetContentHeight=600})

	imgbat.levelup=graphics.newImageSheet("AnimVF/levelup.png",{width=66,height=128,numFrames=14})

	imgbat.levelupseq={
    	name="levelup",
    	frames={1,1,2,2,3,3,4,4,5,5,6,6,7,7,8,9,10,11,12,13,14,12,13,14},--frames= {1,4,5,3}, -- frame indexes of animation, in image sheet
    	time = 800,
    	loopCount = 1,        -- Optional. Default is 0.
	}
	effetexplo.ff=graphics.newImageSheet("effets/ff.png",{width=80,height=256,numFrames=4})
	effetexplo.ffseq={
    	name="levelup",
    	frames={1,2,3,4},--frames= {1,4,5,3}, -- frame indexes of animation, in image sheet
    	time=1000,
    	loopCount=0,        -- Optional. Default is 0.
    }

	effetexplo.braszero=graphics.newImageSheet("effets/braszero.png",{width=160,height=235,numFrames=4})
	effetexplo.braszeroseq={
		name="levelup",
		frames={1,2,3,4,3,2},--frames= {1,4,5,3}, -- frame indexes of animation, in image sheet
		time=1000,
		loopCount=0,        -- Optional. Default is 0.
	}
	effetexplo.apparition=graphics.newImageSheet("effets/apparition.png",{width=66,height=256,numFrames=7})
	effetexplo.apparitionseq={
		name="levelup",
		frames={1,2,3,4,5,6,7},--frames= {1,4,5,3}, -- frame indexes of animation, in image sheet
		time=750,
		loopCount=0,        -- Optional. Default is 0.
	}
	effetexplo.regenevie=graphics.newImageSheet("effets/genevie.png",{width=37,height=37,numFrames=3})
	effetexplo.explosion=graphics.newImageSheet("effets/kamikaze.png",{width=256,height=256,numFrames=6,sheetContentWidth=1536,sheetContentHeight=256})
	effetexplo.explosionseq={
		name="levelup",
		frames={1,2,3,4,5,6},--frames= {1,4,5,3}, -- frame indexes of animation, in image sheet
		time=500,
		loopCount=0,        -- Optional. Default is 0.
	}
	coroutine.yield()
	son.combatacid = audio.loadSound( "son/Combat/Acid_liquid.mp3" )
	son.combatpique= audio.loadSound( "son/Combat/pic_tower.mp3" )
	son.combatarc={} 
	son.combatarc[1]= audio.loadSound( "son/Combat/Arc_tir2.mp3" )
	son.combatarc[2]= audio.loadSound( "son/Combat/Arc_tir3.mp3" )
	son.combatarc[3]= audio.loadSound( "son/Combat/Arc_tir4.mp3" )
	son.combatarmtran = audio.loadSound( "son/Combat/Arme_tranche.mp3" )
	son.combatboss = audio.loadSound( "son/Combat/Boss_scream.mp3" )
	son.combatcanon = audio.loadSound( "son/Combat/Canon_tir.mp3" )
	son.combatcriti={} 
	son.combatcriti[1]= audio.loadSound( "son/Combat/Coup_critique.mp3" )
	son.combatcriti[2]= audio.loadSound( "son/Combat/Coup_critique1.mp3" )
	son.combatcriti[3]= audio.loadSound( "son/Combat/Coup_critique2.mp3" )
	son.combatcriti[4]= audio.loadSound( "son/Combat/Coup_critique3.mp3" )
	son.combatsword={}
	son.combatsword[1] = audio.loadSound( "son/Combat/Sword_attack1.mp3" )
	son.combatsword[2] = audio.loadSound( "son/Combat/Sword_attack2.mp3" )
	son.combatsword[3] = audio.loadSound( "son/Combat/Sword_attack3.mp3" )
	son.combatsword[4] = audio.loadSound( "son/Combat/Sword_attack4.mp3" )

	son.eventboss = audio.loadSound( "son/Events/Boss_warning.mp3" )
	son.eventinf = audio.loadSound( "son/Events/Construction_chateau.mp3" )
	son.eventarc = audio.loadSound( "son/Events/Construction_tours_archers.mp3" )
	son.eventven = audio.loadSound( "son/Events/Vendre_batiment.mp3" )
	son.eventperdu =audio.loadStream( "son/Events/Death_bell.mp3" )
	son.eventbell =audio.loadStream( "son/Events/Sortie_map.mp3" )
	son.eventcoin =audio.loadStream( "son/Events/gold_coin.mp3" )
	son.eventmineb = audio.loadSound( "son/Events/mine_break.mp3" )
	son.eventwin = audio.loadSound( "son/Events/Win_sound.mp3" )

	objetdec={}
	objetdec[1]=graphics.newImageSheet("carte/animg/objet.png",{width=100,height=100,numFrames=40,sheetContentWidth=1000,sheetContentHeight=400})
	--imgchargement3:removeSelf()
	--imgchargement:rotate(90)
	-- bplein.x=contentcenterx--60*0.75
	-- bplein.xScale=1
	-- donneecharger[31]=1
	if issimulator then
		local memUsed = (collectgarbage("count")) / 1000
		local texUsed = system.getInfo( "textureMemoryUsed" ) / 1000000
		print("\n---------MEMORY USAGE INFORMATION chargement3 apres---------")
		print("System Memory Used:", string.format("%.03f", memUsed), "Mb")
		print("Texture Memory Used:", string.format("%.03f", texUsed), "Mb")
		print("------------------------------------------\n")
	end
	-- local chargementaffichage = require ( "chargementaff")
	-- chargementevo()
	-- local function timerlancerniv4( event )
	-- 	print("chargementdesfichier="..chargementdesfichier.." chargement3")
	-- 	if chargementdesfichier==5 then
	-- 		-- local lancerNiveau1 = require ( "niveau1" )
	-- 		-- lancerNiveau1.niveau1(0)
	-- 	end
	-- 	-- lancerNiveau1.niveau1(0)
	-- end
	-- timerlancernivqua=timer.performWithDelay( 50, timerlancerniv4 )
	-- chargementdesfichier=chargementdesfichier+1
	chargementdesfichier[5]=1
end
return (t)