local t = {}--chargement de donnée pour les gentils et une partie pour les mechants+ une parties des images
function tapboutonspawn(slotspawn,slotspawntext,slotspawnbuste,slotspawnprix)
	slotspawntext.xScale=slotspawntext.scale*0.9
	slotspawntext.yScale=slotspawntext.scale*0.9
	slotspawnprix.xScale=slotspawnprix.scale*0.9
	slotspawnprix.yScale=slotspawnprix.scale*0.9
	slotspawn.xScale=slotspawn.xScale*0.9
	slotspawn.yScale=slotspawn.xScale
	slotspawn.fill.effect.intensity=1
	transition.to(slotspawn.fill.effect, { time=500, intensity=0 } )
	transition.to(slotspawn,{delay=100, time=100,xScale=slotspawn.scale,yScale=slotspawn.scale})
	transition.to(slotspawntext,{delay=100, time=100,xScale=slotspawntext.scale,yScale=slotspawntext.scale})
	transition.to(slotspawnprix,{delay=100, time=100,xScale=slotspawnprix.scale,yScale=slotspawnprix.scale})

	slotspawnbuste.xScale=slotspawnbuste.xScale*0.9
	slotspawnbuste.yScale=slotspawnbuste.xScale
	slotspawnbuste.fill.effect.intensity=1
	transition.to(slotspawnbuste.fill.effect, { time=500, intensity=0 } )
	transition.to(slotspawnbuste,{delay=100, time=100,xScale=slotspawnbuste.scale,yScale=slotspawnbuste.scale})

end
function textlong(text,scale)
	if scale==nil then
		scale=1
	end
	local sizescale=1
	local nblen=text:len()
	while nblen/scale>8 do
		sizescale=sizescale*0.9
		nblen=nblen-1
	end
	return sizescale
end
function namesol(numsol,scale)
	-- print("scale of text: "..scale)
	-- print("numso "..numsol)
	local nomsol=image[numsol].message
	nomsol=nomsol:sub(1,nomsol:len()-2)
	local sizescale=textlong(nomsol,scale)
	return nomsol,sizescale
end
function affbuste(numsol,x,y,width,height)
	local slotspawnbuste1=display.newRect(0,0,width,height)
	slotspawnbuste1.y=y
	slotspawnbuste1.x=x
	local paint = {
		type = "image",
		sheet = image[numsol].depgauche,
		frame = 1
	}
	slotspawnbuste1.fill = paint
	slotspawnbuste1.fill.scaleX=2 --slotspawn1[i].height*slotspawn1[i].yScale*1/slotspawnbuste1[i].width*0.9
	slotspawnbuste1.fill.scaleY=2
	slotspawnbuste1.fill.y=-0.2
	slotspawnbuste1.scale=slotspawnbuste1.xScale
	slotspawnbuste1.fill.effect = "filter.sepia"
	slotspawnbuste1.fill.effect.intensity=0
	--slotspawnbuste1[i].fill.yScale=slotspawnbuste1[i].fill.xScale
	return slotspawnbuste1
end
function affboutonspawn(x,y,scale,carte,orientation,surface)
	local groupeslotspawn1=display.newGroup()
	local slotspawn1={}
	local slotspawntext1={}
	local slotspawnbuste1={}
	local slotspawnprix1={}
	local scaleloc
	carte=carte or 1
	for i=1,4 do
		slotspawn1[i]=display.newImage(imagemenu.boutonmultispawn,1)
		if scaleloc==nil then
			scaleloc=scale/slotspawn1[i].width*0.78*0.9
			if orientation then

			else
				while scaleloc*slotspawn1[i].height*1.1*4>surface do
					scaleloc=scaleloc*0.9
				end
			end
		end
		slotspawn1[i].xScale=scaleloc
		slotspawn1[i].yScale=slotspawn1[i].xScale
		if orientation then
			slotspawn1[i].x=x+slotspawn1[i].xScale*slotspawn1[i].width*0.5
			slotspawn1[i].y=y+slotspawn1[i].yScale*slotspawn1[i].height*0.5+(i-1)*slotspawn1[i].yScale*slotspawn1[i].height*1.1
		else
			slotspawn1[i].x=x
			slotspawn1[i].y=y-slotspawn1[i].yScale*slotspawn1[i].height*0.5-(4-i)*slotspawn1[i].yScale*slotspawn1[i].height*1.1
		end
		groupeslotspawn1:insert(slotspawn1[i])
		slotspawn1[i].i=i
		slotspawnprix1[i]=display.newEmbossedText(savegamemulti.bouton[carte][i+4],slotspawn1[i].x-slotspawn1[i].xScale*slotspawn1[i].width*0.5/3,slotspawn1[i].y,fonttype,40*fontsize) --native.systemFont,20)
		slotspawnprix1[i]:setFillColor(0.4)
		slotspawnprix1[i]:setEmbossColor(colortextemb)
		slotspawnprix1[i].scale=slotspawnprix1[i].xScale
		groupeslotspawn1:insert(slotspawnprix1[i])

		slotspawntext1[i]=display.newEmbossedText("",slotspawn1[i].x-slotspawn1[i].xScale*slotspawn1[i].width*0.5/3,slotspawn1[i].y,fonttype,20*fontsize) --native.systemFont,20)
		slotspawntext1[i].text,slotspawntext1[i].xScale=namesol(savegamemulti.bouton[carte][i],slotspawn1[i].xScale*slotspawn1[i].width*0.5/3/20)
		slotspawntext1[i].alpha=0.8
		slotspawntext1[i].yScale=slotspawntext1[i].xScale
		slotspawntext1[i].scale=slotspawntext1[i].yScale
		slotspawn1[i].scale=slotspawn1[i].xScale
		slotspawn1[i].fill.effect = "filter.sepia"
		slotspawn1[i].fill.effect.intensity=0
		slotspawntext1[i]:setEmbossColor(colortextemb)
		groupeslotspawn1:insert(slotspawntext1[i])

		slotspawnbuste1[i]=affbuste(savegamemulti.bouton[carte][i],slotspawn1[i].x,slotspawn1[i].y,slotspawn1[i].height*slotspawn1[i].yScale*0.75,slotspawn1[i].height*slotspawn1[i].yScale*0.8)
		groupeslotspawn1:insert(slotspawnbuste1[i])  

		-- slotspawnbuste1[i]=display.newRect(0,0,slotspawn1[i].height*slotspawn1[i].yScale*0.75,slotspawn1[i].height*slotspawn1[i].yScale*0.8)
		slotspawnbuste1[i].y=slotspawn1[i].y-slotspawn1[i].height*slotspawn1[i].yScale*0.5*0.85+slotspawnbuste1[i].yScale*slotspawnbuste1[i].height*0.5
		slotspawnbuste1[i].x=slotspawn1[i].x+slotspawn1[i].xScale*slotspawn1[i].width*0.5-slotspawnbuste1[i].xScale*slotspawnbuste1[i].width*0.5*1.25

		print("aff slot")
		-- local paint = {
		-- 	type = "image",
		-- 	sheet = image[savegamemulti.bouton[carte][i]].depgauche,
		-- 	frame = 1
		-- }
		-- slotspawnbuste1[i].fill = paint
		-- slotspawnbuste1[i].fill.scaleX=2 --slotspawn1[i].height*slotspawn1[i].yScale*1/slotspawnbuste1[i].width*0.9
		-- slotspawnbuste1[i].fill.scaleY=2
		-- slotspawnbuste1[i].fill.y=-0.2
		-- --slotspawnbuste1[i].fill.yScale=slotspawnbuste1[i].fill.xScale
		-- groupeslotspawn1:insert(slotspawnbuste1[i])  
		-- slotspawnbuste1[i]=display.newImage(image[savegamemulti.bouton[carte][i]].depgauche,1)
		-- slotspawnbuste1[i].xScale=slotspawn1[i].height*slotspawn1[i].yScale*1/slotspawnbuste1[i].width*0.9
		-- slotspawnbuste1[i].yScale=slotspawnbuste1[i].xScale
		-- slotspawnbuste1[i].x=slotspawn1[i].x+slotspawn1[i].xScale*slotspawn1[i].width*0.5*0.95-slotspawnbuste1[i].xScale*slotspawnbuste1[i].width*0.5
		-- slotspawnbuste1[i].y=slotspawn1[i].y-slotspawn1[i].height*slotspawn1[i].yScale*0.5*0.9+slotspawnbuste1[i].yScale*slotspawnbuste1[i].height*0.5
		-- groupeslotspawn1:insert(slotspawnbuste1[i])
		-- local bustemask=graphics.newMask("Menuprincipal/circlemask.png") --imagemenu.carreblanc)
		-- slotspawnbuste1[i]:setMask(bustemask)
		-- slotspawnbuste1[i].maskScaleX=1/(slotspawn1[i].height*slotspawn1[i].yScale*0.9)*(slotspawnbuste1[i].xScale*slotspawnbuste1[i].width)--3--boutontab[j].bouton[i].bouton[k].xScale*boutontab[j].bouton[i].bouton[k].width/16
		-- slotspawnbuste1[i].maskScaleY=1/(slotspawn1[i].height*slotspawn1[i].yScale*0.9)*(slotspawnbuste1[i].yScale*slotspawnbuste1[i].height) --0.2--3--boutontab[j].bouton[i].bouton[k].yScale*boutontab[j].bouton[i].bouton[k].height/16
		-- slotspawnbuste1[i].maskY=(-slotspawnbuste1[i].y+slotspawn1[i].y)--/slotspawnbuste1[i].maskScaleY
		-- --			print("k= "..k.." maskY "..boutontab[j].bouton[i].bouton[k].buste.maskY.." maskScaleY "..boutontab[j].bouton[i].bouton[k].buste.maskScaleY.." yScale "..boutontab[j].bouton[i].bouton[k].buste.yScale)
	end
	return groupeslotspawn1,slotspawn1,slotspawntext1,slotspawnbuste1,slotspawnprix1
end
function loadimagemenumulti()
	if donneecharger[32]==0 then
		if issimulator then
			local memUsed = (collectgarbage("count")) / 1000
			local texUsed = system.getInfo( "textureMemoryUsed" ) / 1000000
			print("Texture Memory Used avant menudevnew: ", string.format("%.03f", texUsed), "Mb")
		end
		if not goh then
			if imagemenu.page1==nil then
				imagemenu.page1=graphics.newImageSheet("menudevnew/page1.jpg",{width=640,height=470,numFrames=1,sheetContentWidth=640,sheetContentHeight=470})
			end
			imagemenu.arriereplan1=graphics.newImageSheet("menudevnew/arriereplan1.jpg",{width=640,height=470,numFrames=1,sheetContentWidth=640,sheetContentHeight=470})
			imagemenu.devpouvoir=graphics.newImageSheet("menudevnew/devpouvoir.jpg",{width=760,height=440,numFrames=12,sheetContentWidth=2280,sheetContentHeight=1760})
			imagemenu.devbatdist=graphics.newImageSheet("menudevnew/devbatdist.jpg",{width=380,height=200,numFrames=12,sheetContentWidth=1140,sheetContentHeight=802})
			imagemenu.devbatcont=graphics.newImageSheet("menudevnew/devbatcont.jpg",{width=674,height=390,numFrames=12,sheetContentWidth=2022,sheetContentHeight=1561})
			imagemenu.devgene=graphics.newImageSheet("menudevnew/devgene.jpg",{width=760,height=440,numFrames=12,sheetContentWidth=2280,sheetContentHeight=1760})
		else
			if imagemenu.page1==nil then
				imagemenu.page1=graphics.newImageSheet("goh/menudevnew/page1.png",{width=1378,height=961,numFrames=1,sheetContentWidth=1378,sheetContentHeight=961})
			end
			imagemenu.arriereplan1=graphics.newImageSheet("goh/menudevnew/arriereplan1.jpg",{width=640,height=470,numFrames=1,sheetContentWidth=640,sheetContentHeight=470})
			imagemenu.devpouvoir=graphics.newImageSheet("goh/menudevnew/devpouvoir.png",{width=636,height=458,numFrames=12,sheetContentWidth=1908,sheetContentHeight=1832})
			imagemenu.devbatdist=graphics.newImageSheet("goh/menudevnew/devbatdist.png",{width=636,height=458,numFrames=12,sheetContentWidth=1908,sheetContentHeight=1832})
			imagemenu.devbatcont=graphics.newImageSheet("goh/menudevnew/devbatcont.png",{width=636,height=458,numFrames=12,sheetContentWidth=1908,sheetContentHeight=1832})
			imagemenu.devgene=graphics.newImageSheet("goh/menudevnew/devgene.png",{width=620,height=442,numFrames=12,sheetContentWidth=1860,sheetContentHeight=1768})
		end
		donneecharger[32]=1
		if issimulator then
			local memUsed = (collectgarbage("count")) / 1000
			local texUsed = system.getInfo( "textureMemoryUsed" ) / 1000000
			print("Texture Memory Used apres menudevnew: ", string.format("%.03f", texUsed), "Mb")
		end
	end
	if donneecharger[35]==0 then
		if not goh then
			imagemenu.boutonmulti=graphics.newImageSheet("menudevnew/boutonmulti.png",{width=504,height=504,numFrames=6,sheetContentWidth=1008,sheetContentHeight=1512})
			imagemenu.boutonmultisol=graphics.newImageSheet("menudevnew/boutonmultisol.png",{width=604,height=604,numFrames=6,sheetContentWidth=1208,sheetContentHeight=1812})
			imagemenu.boutonmultisave=graphics.newImageSheet("menudevnew/boutonmultisave.png",{width=504,height=504,numFrames=4,sheetContentWidth=1008,sheetContentHeight=1008})
			imagemenu.boutonmultispawn=graphics.newImageSheet("menudevnew/boutonspawn.png",{width=990,height=392,numFrames=3,sheetContentWidth=990,sheetContentHeight=1176})
		else
			imagemenu.boutonmulti=graphics.newImageSheet("goh/menudevnew/boutonmulti.png",{width=504,height=504,numFrames=6,sheetContentWidth=1008,sheetContentHeight=1512})
			imagemenu.boutonmultisol=graphics.newImageSheet("goh/menudevnew/boutonmultisol.png",{width=604,height=604,numFrames=6,sheetContentWidth=1208,sheetContentHeight=1812})
			imagemenu.boutonmultisave=graphics.newImageSheet("goh/menudevnew/boutonmultisave.png",{width=504,height=504,numFrames=4,sheetContentWidth=1008,sheetContentHeight=1008})
			imagemenu.boutonmultispawn=graphics.newImageSheet("goh/menudevnew/boutonspawn.png",{width=990,height=392,numFrames=3,sheetContentWidth=990,sheetContentHeight=1176})
		end
		--imagemenu.carreblanc=graphics.newImageSheet("Menuprincipal/carreblanc.png", { width=100, height=100, numFrames=1,sheetContentWidth=100,sheetContentHeight=100 } )
		donneecharger[35]=1
		if issimulator then
			local memUsed = (collectgarbage("count")) / 1000
			local texUsed = system.getInfo( "textureMemoryUsed" ) / 1000000
			print("Texture Memory Used apres menudevnew: ", string.format("%.03f", texUsed), "Mb")
		end
	end
	if donneecharger[34]==0 then
		if imagemenu.mini==nil then
			imagemenu.mini=graphics.newImageSheet("menudevnew/minimap.png",{width=106,height=54,numFrames=16})  --/imagedev.png",{width=304,height=247,numFrames=1})
		end
	end
end
t.menumulti = function ()
	loadimagemenumulti()
	menuactuel=4
	local infswipe={}
	infswipe.menu=imagemenu.arriereplan1 --imagemenu.menu --"imageMenu.png"
	infswipe.qmenu=3 --signifie que c'est un menu de devellopement
	infswipe.text=texttraduction.menuinf[4]
	infswipe.bouton={}
	infswipe.bouton[1]={}
	--infswipe.bouton[1].bandeau=1 --1 pour evoluer de page en page en cliquant sur le bandeau et le reste dont nil pour navigation sur group de page
	infswipe.bouton[1].text=texttraduction.multi[1] --"Towers"
	infswipe.bouton[1].textpt=0.8
	infswipe.bouton[1].fond ={} --,imagemenu.page1,imagemenu.page1} --,imagemenu.page3,imagemenu.page4}
	for i=1,savegamemulti.map do
		table.insert(infswipe.bouton[1].fond,imagemenu.page1)
	end
	infswipe.bouton[1].page={}

	infswipe.bouton[2]={}
	--infswipe.bouton[1].bandeau=1 --1 pour evoluer de page en page en cliquant sur le bandeau et le reste dont nil pour navigation sur group de page
	infswipe.bouton[2].text=texttraduction.multi[2] --"Towers"
	infswipe.bouton[2].textpt=0.8
	infswipe.bouton[2].fond = {} --,imagemenu.page1,imagemenu.page1,imagemenu.page1} --,imagemenu.page3,imagemenu.page4}
	for i=1,savegamemulti.map do
		table.insert(infswipe.bouton[2].fond,imagemenu.page1)
	end
	infswipe.bouton[2].page={}

	infswipe.bouton[3]={}
	infswipe.bouton[3].text=texttraduction.multi[3] --"Towers"
	infswipe.bouton[3].textpt=0.8
	infswipe.bouton[3].fond = {} --,imagemenu.page3,imagemenu.page4}
	for i=1,savegamemulti.map do
		table.insert(infswipe.bouton[3].fond,imagemenu.page1)
	end
	infswipe.bouton[3].page={}

	infswipe.bouton[4]={}
	infswipe.bouton[4].text=texttraduction.multi[4] --"Towers"
	infswipe.bouton[4].textpt=0.8
	infswipe.bouton[4].fond = {imagemenu.page1} --,imagemenu.page3,imagemenu.page4}
	infswipe.bouton[4].page={}
	infswipe.imbandeau=true
	for i=1,4 do
		for j=1,#infswipe.bouton[i].fond do
			infswipe.bouton[i].page[j]={}
			infswipe.bouton[i].page[j].bouton={}
			infswipe.bouton[i].page[j].bouton[1]={}
			infswipe.bouton[i].page[j].bouton[1].posi=4
			infswipe.bouton[i].page[j].bouton[1].imbandeau=imagemenu.imbandeau --"imbandeau.png"
			infswipe.bouton[i].page[j].bouton[1].texttop=texttraduction.menudevnewdist[2] --"Catapult"
			infswipe.bouton[i].page[j].bouton[1].prix=100
			--infswipe.bouton[1].page[1].bouton[1].textright=infswipe.bouton[1].page[1].bouton[1].prix
			infswipe.bouton[i].page[j].bouton[1].titreText=texttraduction.menudevnewdist[3] --"Catapult "
			infswipe.bouton[i].page[j].bouton[1].mainText=texttraduction.menudevnewdist[4] --"\n\n\n\n\n\nUnlock catapult\nAttack: medium\nFire rate: weak\nRange: medium\nCost: 100\nArea damage"
		end
	end

-- groupe 1
	-- page 1
	infswipe.bouton[1].page[1].bouton[1].posi=3

	infswipe.bouton[1].page[1].bouton[2]={}
	infswipe.bouton[1].page[1].bouton[2].posi=10
	infswipe.bouton[1].page[1].bouton[2].imbandeau=imagemenu.imbandeau --"imbandeau.png"


	-- page 2
	if infswipe.bouton[1].page[2]~=nil then
		infswipe.bouton[1].page[2].bouton[1].posi=2

		infswipe.bouton[1].page[2].bouton[2]={}
		infswipe.bouton[1].page[2].bouton[2].posi=7
		infswipe.bouton[1].page[2].bouton[2].imbandeau=imagemenu.imbandeau --"imbandeau.png"

		infswipe.bouton[1].page[2].bouton[3]={}
		infswipe.bouton[1].page[2].bouton[3].posi=11
		infswipe.bouton[1].page[2].bouton[3].imbandeau=imagemenu.imbandeau --"imbandeau.png"

	-- page 3
	if infswipe.bouton[1].page[3]~=nil then
		infswipe.bouton[1].page[3].bouton[1].posi=3

		infswipe.bouton[1].page[3].bouton[2]={}
		infswipe.bouton[1].page[3].bouton[2].posi=6
		infswipe.bouton[1].page[3].bouton[2].imbandeau=imagemenu.imbandeau --"imbandeau.png"

		infswipe.bouton[1].page[3].bouton[3]={}
		infswipe.bouton[1].page[3].bouton[3].posi=11
		infswipe.bouton[1].page[3].bouton[3].imbandeau=imagemenu.imbandeau --"imbandeau.png"

	-- page 4
	if infswipe.bouton[1].page[4]~=nil then
		infswipe.bouton[1].page[4].bouton[1].posi=2

		infswipe.bouton[1].page[4].bouton[2]={}
		infswipe.bouton[1].page[4].bouton[2].posi=7
		infswipe.bouton[1].page[4].bouton[2].imbandeau=imagemenu.imbandeau --"imbandeau.png"

		infswipe.bouton[1].page[4].bouton[3]={}
		infswipe.bouton[1].page[4].bouton[3].posi=10
		infswipe.bouton[1].page[4].bouton[3].imbandeau=imagemenu.imbandeau --"imbandeau.png"
	end
	end
	end

-- groupe 2
	-- page 1
	infswipe.bouton[2].page[1].bouton[1].posi=2

	infswipe.bouton[2].page[1].bouton[2]={}
	infswipe.bouton[2].page[1].bouton[2].posi=10
	infswipe.bouton[2].page[1].bouton[2].imbandeau=imagemenu.imbandeau --"imbandeau.png"

	-- page 2
	if infswipe.bouton[2].page[2]~=nil then
		infswipe.bouton[2].page[2].bouton[1].posi=2

		infswipe.bouton[2].page[2].bouton[2]={}
		infswipe.bouton[2].page[2].bouton[2].posi=6
		infswipe.bouton[2].page[2].bouton[2].imbandeau=imagemenu.imbandeau --"imbandeau.png"

		infswipe.bouton[2].page[2].bouton[3]={}
		infswipe.bouton[2].page[2].bouton[3].posi=10
		infswipe.bouton[2].page[2].bouton[3].imbandeau=imagemenu.imbandeau --"imbandeau.png"

	-- page 3
	if infswipe.bouton[2].page[3]~=nil then
		infswipe.bouton[2].page[3].bouton[1].posi=0
		infswipe.bouton[2].page[3].bouton[1].x=-80
		infswipe.bouton[2].page[3].bouton[1].y=-50

		infswipe.bouton[2].page[3].bouton[2]={}
		infswipe.bouton[2].page[3].bouton[2].posi=0
		infswipe.bouton[2].page[3].bouton[2].x=-80
		infswipe.bouton[2].page[3].bouton[2].y=60
		infswipe.bouton[2].page[3].bouton[2].imbandeau=imagemenu.imbandeau --"imbandeau.png"

		infswipe.bouton[2].page[3].bouton[3]={}
		infswipe.bouton[2].page[3].bouton[3].posi=0
		infswipe.bouton[2].page[3].bouton[3].x=80
		infswipe.bouton[2].page[3].bouton[3].y=-50
		infswipe.bouton[2].page[3].bouton[3].imbandeau=imagemenu.imbandeau --"imbandeau.png"

		infswipe.bouton[2].page[3].bouton[4]={}
		infswipe.bouton[2].page[3].bouton[4].posi=0
		infswipe.bouton[2].page[3].bouton[4].x=80
		infswipe.bouton[2].page[3].bouton[4].y=60
		infswipe.bouton[2].page[3].bouton[4].imbandeau=imagemenu.imbandeau --"imbandeau.png"

	-- page 4
	if infswipe.bouton[2].page[4]~=nil then
		infswipe.bouton[2].page[4].bouton[1].posi=0
		infswipe.bouton[2].page[4].bouton[1].x=-80
		infswipe.bouton[2].page[4].bouton[1].y=-50

		infswipe.bouton[2].page[4].bouton[2]={}
		infswipe.bouton[2].page[4].bouton[2].posi=0
		infswipe.bouton[2].page[4].bouton[2].x=-80
		infswipe.bouton[2].page[4].bouton[2].y=60
		infswipe.bouton[2].page[4].bouton[2].imbandeau=imagemenu.imbandeau --"imbandeau.png"

		infswipe.bouton[2].page[4].bouton[3]={}
		infswipe.bouton[2].page[4].bouton[3].posi=0
		infswipe.bouton[2].page[4].bouton[3].x=80
		infswipe.bouton[2].page[4].bouton[3].y=-50
		infswipe.bouton[2].page[4].bouton[3].imbandeau=imagemenu.imbandeau --"imbandeau.png"

		infswipe.bouton[2].page[4].bouton[4]={}
		infswipe.bouton[2].page[4].bouton[4].posi=0
		infswipe.bouton[2].page[4].bouton[4].x=80
		infswipe.bouton[2].page[4].bouton[4].y=60
		infswipe.bouton[2].page[4].bouton[4].imbandeau=imagemenu.imbandeau --"imbandeau.png"
	end
	end
	end
	print("wesh maggle")
	for i=1,#infswipe.bouton[2].page do
		print("wesh maggle1")
		for j=1,#infswipe.bouton[2].page[i].bouton do
			print("i "..i.." j "..j)
			if savegamemulti~=nil then
				print("Dif de nil2")
			else
				print("= nil2")
			end
			if savegamemulti.save~=nil then
				print("Dif de nil1")
			else
				print("= nil1")
			end
			if savegamemulti.save[i]~=nil then
				print("Dif de nil0")
			else
				print("= nil0")
			end
			if savegamemulti.save[i][j]~=nil then
				print("Dif de nil")
			else
				print("= nil")
			end
			print("savegamemulti.save[i][j].nb"..savegamemulti.save[i][j].nb) 
			print("savegamemulti.save[i][j].name "..savegamemulti.save[i][j].name)
			infswipe.bouton[2].page[i].bouton[j].texttop=savegamemulti.save[i][j].name
			infswipe.bouton[2].page[i].bouton[j].titreText=savegamemulti.save[i][j].name
			infswipe.bouton[2].page[i].bouton[j].mainText="\n\n\n\n"..savegameall.multidata[i][j].fric.." $\n"..(savegameall.multidata[i][j].vaguemax+1).." Waves\n"..savegameall.multidata[i][j].point.." p"
			if savegamemulti.save[i][j].exist then
				infswipe.bouton[2].page[i].bouton[j].mainText=infswipe.bouton[2].page[i].bouton[j].mainText.."\n"..savegamemulti.save[i][j].nb.." Units"
			end
		end
	end
-- groupe 3
	for i=1,savegamemulti.map do
		for j=1,12 do
			if j~=1 then
				infswipe.bouton[3].page[i].bouton[j]={}
			end
			infswipe.bouton[3].page[i].bouton[j].posi=j
			infswipe.bouton[3].page[i].bouton[j].imbandeau=nil --imagemenu.imbandeau --"imbandeau.png"
			infswipe.bouton[3].page[i].bouton[j].soldat=200+j
			infswipe.bouton[3].page[i].bouton[j].texttop=image[infswipe.bouton[3].page[i].bouton[j].soldat].message:sub(1,image[infswipe.bouton[3].page[i].bouton[j].soldat].message:len()-2)
			infswipe.bouton[3].page[i].bouton[j].prix=100
			infswipe.bouton[3].page[i].bouton[j].point=mathfloor((image[infswipe.bouton[3].page[i].bouton[j].soldat].puissance)^0.5)
			--infswipe.bouton[3].page[i].bouton[j].buste=image[infswipe.bouton[3].page[i].bouton[j].soldat].depgauche-- a suprimer
			print("infswipe.bouton[3].page[i].bouton[j].point"..infswipe.bouton[3].page[i].bouton[j].point)
			infswipe.bouton[3].page[i].bouton[j].titreText=infswipe.bouton[3].page[i].bouton[j].texttop
			infswipe.bouton[3].page[i].bouton[j].mainText="\n\n\n\nHP:"..image[infswipe.bouton[3].page[i].bouton[j].soldat].vie.."\n".."Att:"..image[infswipe.bouton[3].page[i].bouton[j].soldat].attaque.."\nCost:"..infswipe.bouton[3].page[i].bouton[j].point

		end
	end
-- groupe 4
	local i=1--,savegamemulti.map do
		for k=0,2 do
			for j=1,3 do
				if(j+(k*3))~=1 then
					infswipe.bouton[4].page[i].bouton[j+k*3]={}
				end
					infswipe.bouton[4].page[i].bouton[j+k*3].posi=0
					infswipe.bouton[4].page[i].bouton[j+k*3].x=5+(k-1)*100
					infswipe.bouton[4].page[i].bouton[j+k*3].y=-70+((4-j)-1)*70
					infswipe.bouton[4].page[i].bouton[j+k*3].imbandeau=imagemenu.imbandeau --"imbandeau.png"
					infswipe.bouton[4].page[i].bouton[j+k*3].texttop=texttraduction.multi[7+j+k*3]
					infswipe.bouton[4].page[i].bouton[j+k*3].prix=100
					infswipe.bouton[4].page[i].bouton[j+k*3].titreText=texttraduction.menudevnewdist[3] --"Catapult "
					infswipe.bouton[4].page[i].bouton[j+k*3].mainText=texttraduction.menudevnewdist[4]
					
				--end
			end
		end
	--end
	local slideView = require("swipe1")
	slideViewlaunch(infswipe)
end
return t