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
	imgbat.contact=graphics.newImageSheet( "goh/batiment/contact.png", { width=218, height=266, numFrames=9,sheetContentWidth=654,sheetContentHeight=798 } )
	imgbat.distance=graphics.newImageSheet( "goh/batiment/distance.png", { width=262, height=316, numFrames=9,sheetContentWidth=786,sheetContentHeight=948 } )
	coroutine.yield()
	imgbat.mine=graphics.newImageSheet( "goh/batiment/mine.png", { width=433, height=355, numFrames=9,sheetContentWidth=1299,sheetContentHeight=1065 } )
	imgbat.minefric=graphics.newImageSheet( "goh/batiment/anfric.png", { width=516, height=354, numFrames=5,sheetContentWidth=1032,sheetContentHeight=1062 } )
	coroutine.yield()
	imgbat.inf=graphics.newImageSheet( "goh/batiment/infanterie1.png", { width=196, height=137, numFrames=1,sheetContentWidth=196,sheetContentHeight=137 })
	imgbat.arc=graphics.newImageSheet( "goh/batiment/archers1.png", { width=97, height=140, numFrames=1,sheetContentWidth=97,sheetContentHeight=140 }  )
	--imgbat.archer=graphics.newImageSheet( "batiment/haut_tour/archer.png", { width=135, height=125, numFrames=5 }  )
	--imgbat.archerim=graphics.newImageSheet( "batiment/haut_tour/archerim.png", { width=135, height=125, numFrames=1})
	--imgbat.bras=graphics.newImageSheet( "batiment/haut_tour/bras.png", { width=116, height=89, numFrames=3 }  )

	--imgbat.liquide1=graphics.newImageSheet("batiment/attliquide/liquide1.png",{width=458,height=601,numFrames=7,sheetContentWidth=1374,sheetContentHeight=1803})
	--imgbat.liquidecercle1=graphics.newImageSheet("batiment/attliquide/liquidecercle1.png",{width=250,height=200,numFrames=1,sheetContentWidth=250,sheetContentHeight=200})
	--imgbat.liquide2=graphics.newImageSheet("batiment/attliquide/liquide2.png",{width=525,height=510,numFrames=7,sheetContentWidth=1575,sheetContentHeight=1530})
	--imgbat.liquidecercle2=graphics.newImageSheet("batiment/attliquide/liquidecercle2.png",{width=250,height=200,numFrames=1,sheetContentWidth=250,sheetContentHeight=200})
	-- imgbat.liquide1=graphics.newImageSheet("goh/batiment/attliquide/liquide1.png",{width=85,height=92,numFrames=4,sheetContentWidth=340,sheetContentHeight=92})
	-- imgbat.liquide2=graphics.newImageSheet("goh/batiment/attliquide/liquide2.png",{width=118,height=196,numFrames=4,sheetContentWidth=472,sheetContentHeight=196})
	-- imgbat.liquide3=graphics.newImageSheet("goh/batiment/attliquide/liquide3.png",{width=106,height=105,numFrames=4,sheetContentWidth=424,sheetContentHeight=105})
	coroutine.yield()
	--imgbat.liquidecercle3=graphics.newImageSheet("batiment/attliquide/liquidecercle2.png",{width=250,height=200,numFrames=1,sheetContentWidth=250,sheetContentHeight=200})
	--imgbat.liquidecercle=graphics.newImageSheet("batiment/attliquide/liquidecercle.png",{width=250,height=200,numFrames=1,sheetContentWidth=250,sheetContentHeight=200})
	--imgbat.liquidecerclean=graphics.newImageSheet("batiment/attliquide/liquidecerclean.png",{width=486,height=355,numFrames=3,sheetContentWidth=486,sheetContentHeight=1065})
	--imgbat.liquidecerclean1=graphics.newImageSheet("batiment/attliquide/liquidecerclean1.png",{width=486,height=355,numFrames=3,sheetContentWidth=486,sheetContentHeight=1065})
	imgbat.pique1=graphics.newImageSheet("goh/batiment/attliquide/pique1.png",{width=116,height=120,numFrames=12,sheetContentWidth=464,sheetContentHeight=360})
	imgbat.pique2=graphics.newImageSheet("goh/batiment/attliquide/pique2.png",{width=316,height=142,numFrames=12,sheetContentWidth=948,sheetContentHeight=568})
	imgbat.pique3=graphics.newImageSheet("goh/batiment/attliquide/pique3.png",{width=216,height=123,numFrames=11,sheetContentWidth=648,sheetContentHeight=492})
	--imgbat.liquidecerclean=graphics.newImageSheet("batiment/attliquide/liquidecerclean.png",{width=250,height=200,numFrames=3,sheetContentWidth=250,sheetContentHeight=600})
	imgbat.tiranim={}
	imgbat.tiranim[0]={} -- type 2 ][niveau]
	imgbat.tiranim[0][1]={}
	imgbat.tiranim[0][1].sheet=graphics.newImageSheet("goh/batiment/haut_tour/archer2.png",{width=174,height=196,numFrames=6,sheetContentWidth=522,sheetContentHeight=392})
	imgbat.tiranim[0][1].property={}
	imgbat.tiranim[0][1].property.seq={
    	name="levelup",
    	frames={1,2,3,4,5,6,1},--frames= {1,4,5,3}, -- frame indexes of animation, in image sheet
    	time = 800,
    	loopCount = 1,        -- Optional. Default is 0.
	}
	imgbat.tiranim[0][1].property.scale=0.18
	imgbat.tiranim[0][2]={}
	imgbat.tiranim[0][2].sheet=graphics.newImageSheet("goh/batiment/haut_tour/archer3.png",{width=150,height=142,numFrames=6,sheetContentWidth=450,sheetContentHeight=284})
	imgbat.tiranim[0][2].property={}
	imgbat.tiranim[0][2].property.seq={
    	name="levelup",
    	frames={1,2,3,4,5,6,1},--frames= {1,4,5,3}, -- frame indexes of animation, in image sheet
    	time = 800,
    	loopCount = 1,        -- Optional. Default is 0.
	}
	imgbat.tiranim[0][2].property.scale=0.24
	imgbat.tiranim[0][3]={}
	imgbat.tiranim[0][3].sheet=graphics.newImageSheet("goh/batiment/haut_tour/baliste1.png",{width=173,height=253,numFrames=5,sheetContentWidth=865,sheetContentHeight=253})
	imgbat.tiranim[0][3].property={}
	imgbat.tiranim[0][3].property.seq={
    	name="levelup",
    	frames={1,2,3,4,5,1},--frames= {1,4,5,3}, -- frame indexes of animation, in image sheet
    	time = 800,
    	loopCount = 1,        -- Optional. Default is 0.
	}
	imgbat.tiranim[0][3].property.scale=0.21
	imgbat.tiranim[0][4]={}
	imgbat.tiranim[0][4].sheet=graphics.newImageSheet("goh/batiment/haut_tour/baliste2.png",{width=163,height=185,numFrames=4,sheetContentWidth=163,sheetContentHeight=740})
	imgbat.tiranim[0][4].property={}
	imgbat.tiranim[0][4].property.seq={
    	name="levelup",
    	frames={1,2,3,4,1},--frames= {1,4,5,3}, -- frame indexes of animation, in image sheet
    	time = 800,
    	loopCount = 1,        -- Optional. Default is 0.
	}
	imgbat.tiranim[0][4].property.scale=0.35
	imgbat.tiranim[0][4].property.anchorX=0.6

	imgbat.tiranim[1]={}
	imgbat.tiranim[1][2]={}
	imgbat.tiranim[1][2].sheet=graphics.newImageSheet("goh/batiment/haut_tour/catapult.png",{width=96,height=92,numFrames=4,sheetContentWidth=96,sheetContentHeight=368})
	imgbat.tiranim[1][2].property={}
	imgbat.tiranim[1][2].property.seq={
    	name="levelup",
    	frames={1,2,3,4,4},--frames= {1,4,5,3}, -- frame indexes of animation, in image sheet
    	time = 800,
    	loopCount = 1,        -- Optional. Default is 0.
	}
	imgbat.tiranim[1][2].property.anchorX=0.21
	imgbat.tiranim[1][2].property.anchorY=0.2
	imgbat.tiranim[1][2].property.scale=0.35
	imgbat.tiranim[1][3]={}
	imgbat.tiranim[1][3].sheet=graphics.newImageSheet("goh/batiment/haut_tour/cannon1.png",{width=89,height=88,numFrames=5,sheetContentWidth=178,sheetContentHeight=264})
	imgbat.tiranim[1][3].property={}
	imgbat.tiranim[1][3].property.seq={
    	name="levelup",
    	frames={5,3,2,1,1,1,1,2,3,4,4,4},--frames= {1,4,5,3}, -- frame indexes of animation, in image sheet
    	time = 800,
    	loopCount = 1,        -- Optional. Default is 0.
	}
	imgbat.tiranim[1][3].property.anchorX=0.32
	imgbat.tiranim[1][3].property.anchorY=0.32
	imgbat.tiranim[1][3].property.scale=0.4
	imgbat.tiranim[1][4]={}
	imgbat.tiranim[1][4].sheet=graphics.newImageSheet("goh/batiment/haut_tour/cannon2.png",{width=140,height=92,numFrames=5,sheetContentWidth=140,sheetContentHeight=460})
	imgbat.tiranim[1][4].property={}
	imgbat.tiranim[1][4].property.seq={
    	name="levelup",
    	frames={4,5,1,2,3,3},--frames= {1,4,5,3}, -- frame indexes of animation, in image sheet
    	time = 800,
    	loopCount = 1,        -- Optional. Default is 0.
	}
	imgbat.tiranim[1][4].property.anchorX=0.4
	imgbat.tiranim[1][4].property.anchorY=0.25
	imgbat.tiranim[1][4].property.scale=0.4

	imgbat.tiranim[2]={}
	imgbat.tiranim[2][2]={}
	imgbat.tiranim[2][2].sheet=graphics.newImageSheet("goh/batiment/attliquide/liquide1.png",{width=85,height=92,numFrames=4,sheetContentWidth=340,sheetContentHeight=92})
	imgbat.tiranim[2][2].property={}
	imgbat.tiranim[2][2].property.scale=0.5
	imgbat.tiranim[2][3]={}
	imgbat.tiranim[2][3].sheet=graphics.newImageSheet("goh/batiment/attliquide/liquide2.png",{width=118,height=196,numFrames=4,sheetContentWidth=472,sheetContentHeight=196})
	imgbat.tiranim[2][3].property={}
	imgbat.tiranim[2][3].property.scale=0.5
	imgbat.tiranim[2][4]={}
	imgbat.tiranim[2][4].sheet=graphics.newImageSheet("goh/batiment/attliquide/liquide3.png",{width=108,height=135,numFrames=4,sheetContentWidth=108,sheetContentHeight=540}) --graphics.newImageSheet("goh/batiment/attliquide/liquide3.png",{width=106,height=105,numFrames=4,sheetContentWidth=424,sheetContentHeight=105})
	imgbat.tiranim[2][4].property={}
	imgbat.tiranim[2][4].property.scale=0.5

	imgbat.levelup=graphics.newImageSheet("goh/AnimVF/levelup.png",{width=66,height=128,numFrames=14})

	imgbat.levelupseq={
    	name="levelup",
    	frames={1,1,2,2,3,3,4,4,5,5,6,6,7,7,8,9,10,11,12,13,14,12,13,14},--frames= {1,4,5,3}, -- frame indexes of animation, in image sheet
    	time = 800,
    	loopCount = 1,        -- Optional. Default is 0.
	}
	-- effetexplo.ff=graphics.newImageSheet("effets/ff.png",{width=80,height=256,numFrames=4})
	-- effetexplo.ffseq={
 --    	name="levelup",
 --    	frames={1,2,3,4},--frames= {1,4,5,3}, -- frame indexes of animation, in image sheet
 --    	time=1000,
 --    	loopCount=0,        -- Optional. Default is 0.
 --    }
	effetexplo.apparition=graphics.newImageSheet("goh/effets/apparition.png",{width=66,height=256,numFrames=7})
	effetexplo.apparitionseq={
		name="levelup",
		frames={1,2,3,4,5,6,7},--frames= {1,4,5,3}, -- frame indexes of animation, in image sheet
		time=750,
		loopCount=0,        -- Optional. Default is 0.
	}
	effetexplo.regenevie=graphics.newImageSheet("goh/effets/genevie.png",{width=37,height=37,numFrames=3})
	effetexplo.explosion=graphics.newImageSheet("goh/effets/kamikaze.png",{width=256,height=256,numFrames=6,sheetContentWidth=1536,sheetContentHeight=256})
	effetexplo.explosionseq={
		name="levelup",
		frames={1,2,3,4,5,6},--frames= {1,4,5,3}, -- frame indexes of animation, in image sheet
		time=500,
		loopCount=0,        -- Optional. Default is 0.
	}
	coroutine.yield()
	son.combatacid = audio.loadSound( "goh/son/Combat/Acid_liquid.mp3" )
	son.combatpique= audio.loadSound( "goh/son/Combat/pic_tower.mp3" )
	son.combatarc={} 
	son.combatarc[1]= audio.loadSound( "goh/son/Combat/Arc_tir2.mp3" )
	son.combatarc[2]= audio.loadSound( "goh/son/Combat/Arc_tir3.mp3" )
	son.combatarc[3]= audio.loadSound( "goh/son/Combat/Arc_tir4.mp3" )
	son.combatarmtran = audio.loadSound( "goh/son/Combat/Arme_tranche.mp3" )
	son.combatboss = audio.loadSound( "goh/son/Combat/Boss_scream.mp3" )
	son.combatcanon = audio.loadSound( "goh/son/Combat/Canon_tir.mp3" )
	son.combatcriti={} 
	son.combatcriti[1]= audio.loadSound( "goh/son/Combat/Coup_critique.mp3" )
	son.combatcriti[2]= audio.loadSound( "goh/son/Combat/Coup_critique1.mp3" )
	son.combatcriti[3]= audio.loadSound( "goh/son/Combat/Coup_critique2.mp3" )
	son.combatcriti[4]= audio.loadSound( "goh/son/Combat/Coup_critique3.mp3" )
	son.combatsword={}
	son.combatsword[1] = audio.loadSound( "goh/son/Combat/Sword_attack1.mp3" )
	son.combatsword[2] = audio.loadSound( "goh/son/Combat/Sword_attack2.mp3" )
	son.combatsword[3] = audio.loadSound( "goh/son/Combat/Sword_attack3.mp3" )
	son.combatsword[4] = audio.loadSound( "goh/son/Combat/Sword_attack4.mp3" )

	son.eventboss = audio.loadSound( "goh/son/Events/Boss_warning.mp3" )
	son.eventinf = audio.loadSound( "goh/son/Events/Construction_chateau.mp3" )
	son.eventarc = audio.loadSound( "goh/son/Events/Construction_tours_archers.mp3" )
	son.eventven = audio.loadSound( "goh/son/Events/Vendre_batiment.mp3" )
	son.eventperdu =audio.loadStream( "goh/son/Events/Death_bell.mp3" )
	son.eventbell =audio.loadStream( "goh/son/Events/Sortie_map.mp3" )
	son.eventcoin =audio.loadStream( "goh/son/Events/gold_coin.mp3" )
	son.eventmineb = audio.loadSound( "goh/son/Events/mine_break.mp3" )
	son.eventwin = audio.loadSound( "goh/son/Events/Win_sound.mp3" )

	objetdec={}
	objetdec[1]=graphics.newImageSheet("goh/carte/animg/props1.png",{width=251,height=176,numFrames=17,sheetContentWidth=1255,sheetContentHeight=704})
	objetdec[2]=graphics.newImageSheet("goh/carte/animg/props2.png",{width=368,height=285,numFrames=6,sheetContentWidth=1104,sheetContentHeight=570})
	objetdec[3]=graphics.newImageSheet("goh/carte/animg/props3.png",{width=305,height=339,numFrames=12,sheetContentWidth=1220,sheetContentHeight=1017})
	objetdec[4]=graphics.newImageSheet("goh/carte/animg/props4.png",{width=513,height=541,numFrames=4,sheetContentWidth=1026,sheetContentHeight=1082})
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