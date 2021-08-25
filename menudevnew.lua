local t = {}--chargement de donnée pour les gentils et une partie pour les mechants+ une parties des images
t.menudevnew1 = function ()
	if donneecharger[32]==0 then
		if issimulator then
			local memUsed = (collectgarbage("count")) / 1000
			local texUsed = system.getInfo( "textureMemoryUsed" ) / 1000000
			--print("\n---------MEMORY USAGE INFORMATION chargement1 avant---------")
			--print("System Memory Used:", string.format("%.03f", memUsed), "Mb")
			print("Texture Memory Used avant menudevnew: ", string.format("%.03f", texUsed), "Mb")
		end
		-- local chargement = require ( "chargement")
		-- 	chargementevo()
		-- 	chargementevo()
		-- 	chargementevo()
		if imagemenu.page1==nil then
			if not goh then
				imagemenu.page1=graphics.newImageSheet("menudevnew/page1.jpg",{width=640,height=470,numFrames=1,sheetContentWidth=640,sheetContentHeight=470})
			else
				imagemenu.page1=graphics.newImageSheet("goh/menudevnew/page1.png",{width=1378,height=961,numFrames=1,sheetContentWidth=1378,sheetContentHeight=961})
			end
		end
		if not goh then
			imagemenu.arriereplan1=graphics.newImageSheet("menudevnew/arriereplan1.jpg",{width=640,height=470,numFrames=1,sheetContentWidth=640,sheetContentHeight=470})
		else
			imagemenu.arriereplan1=graphics.newImageSheet("goh/menudevnew/arriereplan1.jpg",{width=640,height=470,numFrames=1,sheetContentWidth=640,sheetContentHeight=470})
		end
		-- imagemenu.page2=graphics.newImageSheet("menudevnew/page2a.png",{width=640,height=470,numFrames=1})
		-- imagemenu.page3=graphics.newImageSheet("menudevnew/page3a.png",{width=640,height=470,numFrames=1})
		-- imagemenu.page4=graphics.newImageSheet("menudevnew/page4a.png",{width=640,height=470,numFrames=1})
		-- imagemenu.page11=graphics.newImageSheet("menudevnew/page11a.png",{width=640,height=470,numFrames=1})
		-- imagemenu.page12=graphics.newImageSheet("menudevnew/page12a.png",{width=640,height=470,numFrames=1})
		-- imagemenu.page13=graphics.newImageSheet("menudevnew/page13a.png",{width=640,height=470,numFrames=1})
		-- imagemenu.page14=graphics.newImageSheet("menudevnew/page14a.png",{width=640,height=470,numFrames=1})
		-- imagemenu.page1=graphics.newImageSheet("menudevnew/page1.png",{width=960,height=540,numFrames=1})
		-- imagemenu.page2=graphics.newImageSheet("menudevnew/page2.png",{width=960,height=540,numFrames=1})
		-- imagemenu.page3=graphics.newImageSheet("menudevnew/page3.png",{width=960,height=540,numFrames=1})
		-- imagemenu.page4=graphics.newImageSheet("menudevnew/page4.png",{width=960,height=540,numFrames=1})
		-- imagemenu.page11=graphics.newImageSheet("menudevnew/page11.png",{width=960,height=540,numFrames=1})
		-- imagemenu.page12=graphics.newImageSheet("menudevnew/page12.png",{width=960,height=540,numFrames=1})
		-- imagemenu.page13=graphics.newImageSheet("menudevnew/page13.png",{width=960,height=540,numFrames=1})
		-- imagemenu.page14=graphics.newImageSheet("menudevnew/page14.png",{width=960,height=540,numFrames=1})
		if not goh then
			imagemenu.devpouvoir=graphics.newImageSheet("menudevnew/devpouvoir.jpg",{width=760,height=440,numFrames=12,sheetContentWidth=2280,sheetContentHeight=1760})
			imagemenu.devbatdist=graphics.newImageSheet("menudevnew/devbatdist.jpg",{width=380,height=200,numFrames=12,sheetContentWidth=1140,sheetContentHeight=802})
			imagemenu.devbatcont=graphics.newImageSheet("menudevnew/devbatcont.jpg",{width=674,height=390,numFrames=12,sheetContentWidth=2022,sheetContentHeight=1561})
			imagemenu.devgene=graphics.newImageSheet("menudevnew/devgene.jpg",{width=760,height=440,numFrames=12,sheetContentWidth=2280,sheetContentHeight=1760})
		else
			imagemenu.devpouvoir=graphics.newImageSheet("goh/menudevnew/devpouvoir.png",{width=636,height=458,numFrames=12,sheetContentWidth=1908,sheetContentHeight=1832})
			imagemenu.devbatdist=graphics.newImageSheet("goh/menudevnew/devbatdist.png",{width=636,height=458,numFrames=12,sheetContentWidth=1908,sheetContentHeight=1832})
			imagemenu.devbatcont=graphics.newImageSheet("goh/menudevnew/devbatcont.png",{width=636,height=458,numFrames=12,sheetContentWidth=1908,sheetContentHeight=1832})
			imagemenu.devgene=graphics.newImageSheet("goh/menudevnew/devgene.png",{width=620,height=442,numFrames=12,sheetContentWidth=1860,sheetContentHeight=1768})
		end
		donneecharger[32]=1
		if issimulator then
			local memUsed = (collectgarbage("count")) / 1000
			local texUsed = system.getInfo( "textureMemoryUsed" ) / 1000000
			--print("\n---------MEMORY USAGE INFORMATION chargement1 avant---------")
			--print("System Memory Used:", string.format("%.03f", memUsed), "Mb")
			print("Texture Memory Used apres menudevnew: ", string.format("%.03f", texUsed), "Mb")
		end
	end
	menuactuel=0
	local infswipe={}
	infswipe.menu=imagemenu.arriereplan1 --imagemenu.menu --"imageMenu.png"
	infswipe.qmenu=1 --signifie que c'est un menu de devellopement
	infswipe.text=texttraduction.menuinf[3]
	infswipe.bouton={}
	infswipe.bouton[1]={}
	infswipe.bouton[1].bandeau=1 --1 pour evoluer de page en page en cliquant sur le bandeau et le reste dont nil pour navigation sur group de page
	infswipe.bouton[1].text=texttraduction.menudevnewdist[1] --"Towers"
	infswipe.bouton[1].textpt={} --0.8
	infswipe.bouton[1].textpt[1]=0.8
	infswipe.bouton[1].textpt[2]=0.8
	infswipe.bouton[1].textpt[3]=0.8
	infswipe.bouton[1].textpt[4]=0.8
	--infswipe.bouton[1].bandeau=1 --1 pour evoluer de page en page en cliquant sur le bandeau et le reste dont nil pour navigation sur group de page
	infswipe.bouton[1].textp={}
	infswipe.bouton[1].textp[1]=texttraduction.menudevnewdist[1]
	infswipe.bouton[1].textp[2]=texttraduction.menudevnewcont[37]
	infswipe.bouton[1].textp[3]=texttraduction.menudevnewspell[1]
	infswipe.bouton[1].textp[4]=texttraduction.menudevnewheroes[1]
	-- infswipe.bouton[1].textp[3]="page3"
	-- infswipe.bouton[1].textp[4]="page4"
	infswipe.bouton[1].fond = {	imagemenu.page1,imagemenu.page1,imagemenu.page1,imagemenu.page1} --,imagemenu.page3,imagemenu.page4}
	infswipe.bouton[1].page={}
	infswipe.imbandeau=true
	for i=1,#infswipe.bouton[1].fond do
		infswipe.bouton[1].page[i]={}
		if i==1 then
			infswipe.bouton[1].page[i].imbandeau=imagemenu.devbatdist
		elseif i==2 then
			infswipe.bouton[1].page[i].imbandeau=imagemenu.devbatcont
		end
		infswipe.bouton[1].page[i].bouton={}
		-- for j=1,5 do
		-- 	infswipe.bouton[1].page[i].bouton[j]={}
		-- 	infswipe.bouton[1].page[i].bouton[j].posi=0
		-- 	infswipe.bouton[1].page[i].bouton[j].imbandeau=imagemenu.imbandeau --"imbandeau.png"
		-- 	infswipe.bouton[1].page[i].bouton[j].texttop="top"
		-- 	infswipe.bouton[1].page[i].bouton[j].textbot="bot"
		-- 	infswipe.bouton[1].page[i].bouton[j].textleft="left"
		-- 	infswipe.bouton[1].page[i].bouton[j].textright="right"
		-- 	infswipe.bouton[1].page[i].bouton[j].titreText="Dev "..i.." "..j
		-- 	infswipe.bouton[1].page[i].bouton[j].mainText="Bla bla du "..i.." "..j
		-- 	if j==1 then
		-- 		infswipe.bouton[1].page[i].bouton[j].prix=-1
		-- 	else
		-- 		infswipe.bouton[1].page[i].bouton[j].prix=100*i
		-- 	end
		-- 	infswipe.bouton[1].page[i].bouton[j].posi=j
		-- 	--infswipe.bouton[1].page[i].bouton[j].x=100
		-- 	--infswipe.bouton[1].page[i].bouton[j].y=100
		-- end
	end
	infswipe.bouton[1].page[1].bouton[1]={}
	infswipe.bouton[1].page[1].bouton[1].posi=4
	infswipe.bouton[1].page[1].bouton[1].imbandeau=imagemenu.imbandeau --"imbandeau.png"
	infswipe.bouton[1].page[1].bouton[1].texttop=texttraduction.batiment[15] --texttraduction.menudevnewdist[2] --"Catapult"
	infswipe.bouton[1].page[1].bouton[1].prix=100
	--infswipe.bouton[1].page[1].bouton[1].textright=infswipe.bouton[1].page[1].bouton[1].prix
	infswipe.bouton[1].page[1].bouton[1].titreText=texttraduction.batiment[15].." " --texttraduction.menudevnewdist[3] --"Catapult "
	infswipe.bouton[1].page[1].bouton[1].mainText=texttraduction.batiment[15]..texttraduction.complement[2]..texttraduction.complement[8]..texttraduction.complement[5]..texttraduction.complement[7]..texttraduction.complement[4]..texttraduction.complement[8]..texttraduction.complement[6]..": 100"..texttraduction.complement[12] --texttraduction.menudevnewdist[4] --"\n\n\n\n\n\nUnlock catapult\nAttack: medium\nFire rate: weak\nRange: medium\nCost: 100\nArea damage"

	infswipe.bouton[1].page[1].bouton[2]={}
	infswipe.bouton[1].page[1].bouton[2].posi=3
	infswipe.bouton[1].page[1].bouton[2].imbandeau=imagemenu.imbandeau --"imbandeau.png"
	infswipe.bouton[1].page[1].bouton[2].texttop=texttraduction.batiment[16] --texttraduction.menudevnewdist[5] --"Onager"
	infswipe.bouton[1].page[1].bouton[2].prix=200
	--infswipe.bouton[1].page[1].bouton[2].textright=infswipe.bouton[1].page[1].bouton[2].prix
	infswipe.bouton[1].page[1].bouton[2].titreText=texttraduction.batiment[16].." " --texttraduction.menudevnewdist[6] --"Onager "
	infswipe.bouton[1].page[1].bouton[2].mainText=texttraduction.batiment[16]..texttraduction.complement[2]..texttraduction.complement[9]..texttraduction.complement[5]..texttraduction.complement[7]..texttraduction.complement[4]..texttraduction.complement[8]..texttraduction.complement[6]..": 200"..texttraduction.complement[12] --texttraduction.menudevnewdist[7] --"\n\n\n\n\n\nUnlock onager\nAttack: high\nFire rate: weak\nRange: medium\nCost: 200\nArea damage"
	infswipe.bouton[1].page[1].bouton[2].condition=(1-1)*6*13+(1-1)*13+1

	infswipe.bouton[1].page[1].bouton[3]={}
	infswipe.bouton[1].page[1].bouton[3].posi=2
	infswipe.bouton[1].page[1].bouton[3].imbandeau=imagemenu.imbandeau --"imbandeau.png"
	infswipe.bouton[1].page[1].bouton[3].texttop=texttraduction.batiment[17] --texttraduction.menudevnewdist[8] --"Trebuchet"
	infswipe.bouton[1].page[1].bouton[3].prix=300
	--infswipe.bouton[1].page[1].bouton[3].textright=infswipe.bouton[1].page[1].bouton[3].prix
	infswipe.bouton[1].page[1].bouton[3].titreText=texttraduction.batiment[17].." " --texttraduction.menudevnewdist[9] --"Trebuchet "
	infswipe.bouton[1].page[1].bouton[3].mainText=texttraduction.batiment[17]..texttraduction.complement[2]..texttraduction.complement[8]..texttraduction.complement[5]..texttraduction.complement[7]..texttraduction.complement[4]..texttraduction.complement[9]..texttraduction.complement[6]..": 300"..texttraduction.complement[12] --texttraduction.menudevnewdist[10] --"\n\n\n\n\n\nUnlock trebuchet\nAttack: high\nFire rate: weak\nRange: high\nCost: 300\nArea damage"
	infswipe.bouton[1].page[1].bouton[3].condition=(1-1)*6*13+(1-1)*13+2

	infswipe.bouton[1].page[1].bouton[4]={}
	infswipe.bouton[1].page[1].bouton[4].posi=1
	infswipe.bouton[1].page[1].bouton[4].imbandeau=imagemenu.imbandeau --"imbandeau.png"
	infswipe.bouton[1].page[1].bouton[4].texttop=texttraduction.menudevnewdist[11] --"Fast reload"
	infswipe.bouton[1].page[1].bouton[4].prix=700
	--infswipe.bouton[1].page[1].bouton[4].textright=infswipe.bouton[1].page[1].bouton[4].prix
	infswipe.bouton[1].page[1].bouton[4].titreText=texttraduction.menudevnewdist[11] --"Fast reload "
	infswipe.bouton[1].page[1].bouton[4].mainText=texttraduction.menudevnewdist[13] --"Fire rate increase"
	infswipe.bouton[1].page[1].bouton[4].condition=(1-1)*6*13+(1-1)*13+3

	infswipe.bouton[1].page[1].bouton[5]={}
	infswipe.bouton[1].page[1].bouton[5].posi=8
	infswipe.bouton[1].page[1].bouton[5].imbandeau=imagemenu.imbandeau --"imbandeau.png"
	infswipe.bouton[1].page[1].bouton[5].texttop=texttraduction.batiment[12] --texttraduction.menudevnewdist[14] --"Crossbow"
	infswipe.bouton[1].page[1].bouton[5].prix=100
	--infswipe.bouton[1].page[1].bouton[5].textright=infswipe.bouton[1].page[1].bouton[5].prix
	infswipe.bouton[1].page[1].bouton[5].titreText=texttraduction.batiment[12].." " --texttraduction.menudevnewdist[15] --"Crossbow "
	infswipe.bouton[1].page[1].bouton[5].mainText=texttraduction.batiment[12]..texttraduction.complement[2]..texttraduction.complement[7]..texttraduction.complement[5]..texttraduction.complement[8]..texttraduction.complement[4]..texttraduction.complement[8]..texttraduction.complement[6]..": 100"..texttraduction.complement[13].." x2" --texttraduction.menudevnewdist[16] --"\n\n\n\n\n\nUnlock crossbow\nAttack: low\nFire rate: medium\nRange: medium\nCost: 100\nArrow x2"

	infswipe.bouton[1].page[1].bouton[6]={}
	infswipe.bouton[1].page[1].bouton[6].posi=7
	infswipe.bouton[1].page[1].bouton[6].imbandeau=imagemenu.imbandeau --"imbandeau.png"
	infswipe.bouton[1].page[1].bouton[6].texttop=texttraduction.batiment[13] --texttraduction.menudevnewdist[17] --"Heavy tower"
	infswipe.bouton[1].page[1].bouton[6].prix=200
	--infswipe.bouton[1].page[1].bouton[6].textright=infswipe.bouton[1].page[1].bouton[6].prix
	infswipe.bouton[1].page[1].bouton[6].titreText=texttraduction.batiment[13].." " --texttraduction.menudevnewdist[18] --"Heavy tower "
	infswipe.bouton[1].page[1].bouton[6].mainText=texttraduction.batiment[13]..texttraduction.complement[2]..texttraduction.complement[7]..texttraduction.complement[5]..texttraduction.complement[9]..texttraduction.complement[4]..texttraduction.complement[9]..texttraduction.complement[6]..": 200"..texttraduction.complement[13].." x2" --texttraduction.menudevnewdist[19] --"\n\n\n\n\n\nHeavy tower\nAttack: low\nFire rate: fast\nRange: large\nCost: 200\nArrow x2"
	infswipe.bouton[1].page[1].bouton[6].condition=(1-1)*6*13+(1-1)*13+5

	infswipe.bouton[1].page[1].bouton[7]={}
	infswipe.bouton[1].page[1].bouton[7].posi=6
	infswipe.bouton[1].page[1].bouton[7].imbandeau=imagemenu.imbandeau --"imbandeau.png"
	infswipe.bouton[1].page[1].bouton[7].texttop=texttraduction.batiment[14] --texttraduction.menudevnewdist[20] --"Ballista"
	infswipe.bouton[1].page[1].bouton[7].prix=300
	--infswipe.bouton[1].page[1].bouton[7].textright=infswipe.bouton[1].page[1].bouton[7].prix
	infswipe.bouton[1].page[1].bouton[7].titreText=texttraduction.batiment[14].." " --texttraduction.menudevnewdist[21] --"Ballista "
	infswipe.bouton[1].page[1].bouton[7].mainText=texttraduction.batiment[14]..texttraduction.complement[2]..texttraduction.complement[8]..texttraduction.complement[5]..texttraduction.complement[9]..texttraduction.complement[4]..texttraduction.complement[9]..texttraduction.complement[6]..": 300"..texttraduction.complement[13].." x3" --texttraduction.menudevnewdist[22] --"\n\n\n\n\n\nUnlock ballista\nAttack: medium\nFire rate: fast\nRange: large\nCost: 300\nArrow x3"
	infswipe.bouton[1].page[1].bouton[7].condition=(1-1)*6*13+(1-1)*13+6

	infswipe.bouton[1].page[1].bouton[8]={}
	infswipe.bouton[1].page[1].bouton[8].posi=5
	infswipe.bouton[1].page[1].bouton[8].imbandeau=imagemenu.imbandeau --"imbandeau.png"
	infswipe.bouton[1].page[1].bouton[8].texttop=texttraduction.menudevnewdist[23] --"Longbow"
	infswipe.bouton[1].page[1].bouton[8].prix=700
	--infswipe.bouton[1].page[1].bouton[8].textright=infswipe.bouton[1].page[1].bouton[8].prix
	infswipe.bouton[1].page[1].bouton[8].titreText=texttraduction.menudevnewdist[24] --"Longbow "
	infswipe.bouton[1].page[1].bouton[8].mainText=texttraduction.menudevnewdist[25] --"Range high"
	infswipe.bouton[1].page[1].bouton[8].condition=(1-1)*6*13+(1-1)*13+7

	infswipe.bouton[1].page[1].bouton[9]={}
	infswipe.bouton[1].page[1].bouton[9].posi=12
	infswipe.bouton[1].page[1].bouton[9].imbandeau=imagemenu.imbandeau --"imbandeau.png"
	infswipe.bouton[1].page[1].bouton[9].texttop=texttraduction.batiment[18] --texttraduction.menudevnewdist[26] --"Hot water"
	infswipe.bouton[1].page[1].bouton[9].prix=100
	--infswipe.bouton[1].page[1].bouton[9].textright=infswipe.bouton[1].page[1].bouton[9].prix
	infswipe.bouton[1].page[1].bouton[9].titreText=texttraduction.batiment[18].." " --texttraduction.menudevnewdist[27] --"Hot water "
	infswipe.bouton[1].page[1].bouton[9].mainText=texttraduction.batiment[18]..texttraduction.complement[2]..texttraduction.complement[7]..texttraduction.complement[5]..texttraduction.complement[7]..texttraduction.complement[4]..texttraduction.complement[7]..texttraduction.complement[6]..": 100" --texttraduction.menudevnewdist[28] --"\n\n\n\n\nUnlock hot water\nAttack: low\nFire rate: weak\nRange: weak\nCost: 100"

	infswipe.bouton[1].page[1].bouton[10]={}
	infswipe.bouton[1].page[1].bouton[10].posi=11
	infswipe.bouton[1].page[1].bouton[10].imbandeau=imagemenu.imbandeau --"imbandeau.png"
	infswipe.bouton[1].page[1].bouton[10].texttop=texttraduction.batiment[19] --texttraduction.menudevnewdist[29] --"Lava"
	infswipe.bouton[1].page[1].bouton[10].prix=200
	--infswipe.bouton[1].page[1].bouton[10].textright=infswipe.bouton[1].page[1].bouton[10].prix
	infswipe.bouton[1].page[1].bouton[10].titreText=texttraduction.batiment[19].." " --texttraduction.menudevnewdist[30] --"Lava "
	infswipe.bouton[1].page[1].bouton[10].mainText=texttraduction.batiment[19]..texttraduction.complement[2]..texttraduction.complement[8]..texttraduction.complement[5]..texttraduction.complement[7]..texttraduction.complement[4]..texttraduction.complement[7]..texttraduction.complement[6]..": 200" --texttraduction.menudevnewdist[31] --"\n\n\n\n\nUnlock lava\nAttack: medium\nFire rate: weak\nRange: weak\nCost: 200"
	infswipe.bouton[1].page[1].bouton[10].condition=(1-1)*6*13+(1-1)*13+9

	infswipe.bouton[1].page[1].bouton[11]={}
	infswipe.bouton[1].page[1].bouton[11].posi=10
	infswipe.bouton[1].page[1].bouton[11].imbandeau=imagemenu.imbandeau --"imbandeau.png"
	infswipe.bouton[1].page[1].bouton[11].texttop=texttraduction.batiment[20] --texttraduction.menudevnewdist[32] --"Acid"
	infswipe.bouton[1].page[1].bouton[11].prix=300
	--infswipe.bouton[1].page[1].bouton[11].textright=infswipe.bouton[1].page[1].bouton[11].prix
	infswipe.bouton[1].page[1].bouton[11].titreText=texttraduction.batiment[20].." " --texttraduction.menudevnewdist[33] --"Acid "
	infswipe.bouton[1].page[1].bouton[11].mainText=texttraduction.batiment[20]..texttraduction.complement[2]..texttraduction.complement[9]..texttraduction.complement[5]..texttraduction.complement[7]..texttraduction.complement[4]..texttraduction.complement[7]..texttraduction.complement[6]..": 500" --texttraduction.menudevnewdist[34] --"\n\n\n\n\nUnlock acid\nAttack: high\nFire rate: weak\nRange: weak\nCost: 500"
	infswipe.bouton[1].page[1].bouton[11].condition=(1-1)*6*13+(1-1)*13+10

	infswipe.bouton[1].page[1].bouton[12]={}
	infswipe.bouton[1].page[1].bouton[12].posi=9
	infswipe.bouton[1].page[1].bouton[12].imbandeau=imagemenu.imbandeau --"imbandeau.png"
	infswipe.bouton[1].page[1].bouton[12].texttop=texttraduction.menudevnewdist[35] --"Wide pots"
	infswipe.bouton[1].page[1].bouton[12].prix=700
	--infswipe.bouton[1].page[1].bouton[12].textright=infswipe.bouton[1].page[1].bouton[12].prix
	infswipe.bouton[1].page[1].bouton[12].titreText=texttraduction.menudevnewdist[36] --"Wide pots "
	infswipe.bouton[1].page[1].bouton[12].mainText=texttraduction.menudevnewdist[37] --"Attack increased"
	infswipe.bouton[1].page[1].bouton[12].condition=(1-1)*6*13+(1-1)*13+11

	infswipe.bouton[1].page[2].bouton[1]={}
	infswipe.bouton[1].page[2].bouton[1].posi=4
	infswipe.bouton[1].page[2].bouton[1].imbandeau=imagemenu.imbandeau --"imbandeau.png"
	infswipe.bouton[1].page[2].bouton[1].texttop=texttraduction.soldat[18] --texttraduction.menudevnewcont[1] --"Squire"
	infswipe.bouton[1].page[2].bouton[1].prix=100
	--infswipe.bouton[1].page[2].bouton[1].textright=infswipe.bouton[1].page[2].bouton[1].prix
	infswipe.bouton[1].page[2].bouton[1].titreText=texttraduction.soldat[18].." " --texttraduction.menudevnewcont[2] --"Squire "
	infswipe.bouton[1].page[2].bouton[1].mainText=texttraduction.complement[1]..texttraduction.batiment[8].."\n1 "..texttraduction.soldat[18]..texttraduction.complement[2]..texttraduction.complement[8]..texttraduction.complement[3]..texttraduction.complement[7]..texttraduction.complement[6]..": 100"..texttraduction.complement[10]  --texttraduction.menudevnewcont[3] --"\n\n\n\n\n\nUnlock farm\n1 squire\nAttack: medium\nHP: weak\nCost: 100\nCharge bonus"

	infswipe.bouton[1].page[2].bouton[2]={}
	infswipe.bouton[1].page[2].bouton[2].posi=3
	infswipe.bouton[1].page[2].bouton[2].imbandeau=imagemenu.imbandeau --"imbandeau.png"
	infswipe.bouton[1].page[2].bouton[2].texttop=texttraduction.soldat[19] --texttraduction.menudevnewcont[4] --"Knight"
	infswipe.bouton[1].page[2].bouton[2].prix=200
	--infswipe.bouton[1].page[2].bouton[2].textright=infswipe.bouton[1].page[2].bouton[2].prix
	infswipe.bouton[1].page[2].bouton[2].titreText=texttraduction.soldat[19].." " --texttraduction.menudevnewcont[5] --"Knight "
	infswipe.bouton[1].page[2].bouton[2].mainText=texttraduction.complement[1]..texttraduction.batiment[9].."\n2 "..texttraduction.soldat[19]..texttraduction.complement[2]..texttraduction.complement[8]..texttraduction.complement[3]..texttraduction.complement[8]..texttraduction.complement[6]..": 200"..texttraduction.complement[10] --texttraduction.menudevnewcont[6] --"\n\n\n\n\n\nUnlock stable\n2 knights\nAttack: medium\nHP: medium\nCost: 200\nCharge bonus"
	infswipe.bouton[1].page[2].bouton[2].condition=(1-1)*6*13+(2-1)*13+1

	infswipe.bouton[1].page[2].bouton[3]={}
	infswipe.bouton[1].page[2].bouton[3].posi=2
	infswipe.bouton[1].page[2].bouton[3].imbandeau=imagemenu.imbandeau --"imbandeau.png"
	infswipe.bouton[1].page[2].bouton[3].texttop=texttraduction.soldat[20] --texttraduction.menudevnewcont[7] --"Paladin"
	infswipe.bouton[1].page[2].bouton[3].prix=300
	--infswipe.bouton[1].page[2].bouton[3].textright=infswipe.bouton[1].page[2].bouton[3].prix
	infswipe.bouton[1].page[2].bouton[3].titreText=texttraduction.soldat[20].." " --texttraduction.menudevnewcont[8] --"Paladin "
	infswipe.bouton[1].page[2].bouton[3].mainText=texttraduction.complement[1]..texttraduction.batiment[10].."\n2 "..texttraduction.soldat[20]..texttraduction.complement[2]..texttraduction.complement[9]..texttraduction.complement[3]..texttraduction.complement[9]..texttraduction.complement[6]..": 200"..texttraduction.complement[10] --texttraduction.menudevnewcont[9] --"\n\n\n\n\n\nUnlock paladin\n2 paladins\nAttack: high\nHP: high\nCost: 200\nCharge bonus"
	infswipe.bouton[1].page[2].bouton[3].condition=(1-1)*6*13+(2-1)*13+2

	infswipe.bouton[1].page[2].bouton[4]={}
	infswipe.bouton[1].page[2].bouton[4].posi=1
	infswipe.bouton[1].page[2].bouton[4].imbandeau=imagemenu.imbandeau --"imbandeau.png"
	infswipe.bouton[1].page[2].bouton[4].texttop=texttraduction.menudevnewcont[10] --"Stallion"
	infswipe.bouton[1].page[2].bouton[4].prix=700
	--infswipe.bouton[1].page[2].bouton[4].textright=infswipe.bouton[1].page[2].bouton[4].prix
	infswipe.bouton[1].page[2].bouton[4].titreText=texttraduction.menudevnewcont[11] --"Stallion "
	infswipe.bouton[1].page[2].bouton[4].mainText=texttraduction.menudevnewcont[12] --"\nIncrease charge\n bonus damage"
	infswipe.bouton[1].page[2].bouton[4].condition=(1-1)*6*13+(2-1)*13+3

	infswipe.bouton[1].page[2].bouton[5]={}
	infswipe.bouton[1].page[2].bouton[5].posi=8
	infswipe.bouton[1].page[2].bouton[5].imbandeau=imagemenu.imbandeau --"imbandeau.png"
	infswipe.bouton[1].page[2].bouton[5].texttop=texttraduction.soldat[12] --texttraduction.menudevnewcont[13] --"Militiaman"
	infswipe.bouton[1].page[2].bouton[5].prix=100
	--infswipe.bouton[1].page[2].bouton[5].textright=infswipe.bouton[1].page[2].bouton[5].prix
	infswipe.bouton[1].page[2].bouton[5].titreText=texttraduction.soldat[12].." " --texttraduction.menudevnewcont[14] --"Militiaman "
	infswipe.bouton[1].page[2].bouton[5].mainText=texttraduction.complement[1]..texttraduction.batiment[2].."\n3 "..texttraduction.soldat[12]..texttraduction.complement[2]..texttraduction.complement[7]..texttraduction.complement[3]..texttraduction.complement[7]..texttraduction.complement[6]..": 100" --texttraduction.menudevnewcont[15] --"\n\n\n\n\nUnlock fort\n3 Militiamans\nAttack: weak\nHP: weak\nCost: 100"

	infswipe.bouton[1].page[2].bouton[6]={}
	infswipe.bouton[1].page[2].bouton[6].posi=7
	infswipe.bouton[1].page[2].bouton[6].imbandeau=imagemenu.imbandeau --"imbandeau.png"
	infswipe.bouton[1].page[2].bouton[6].texttop=texttraduction.soldat[13] --texttraduction.menudevnewcont[16] --"Swordsman"
	infswipe.bouton[1].page[2].bouton[6].prix=200
	--infswipe.bouton[1].page[2].bouton[6].textright=infswipe.bouton[1].page[2].bouton[6].prix
	infswipe.bouton[1].page[2].bouton[6].titreText=texttraduction.soldat[13].." "  --texttraduction.menudevnewcont[17] --"Swordsman "
	infswipe.bouton[1].page[2].bouton[6].mainText=texttraduction.complement[1]..texttraduction.batiment[3].."\n3 "..texttraduction.soldat[13]..texttraduction.complement[2]..texttraduction.complement[7]..texttraduction.complement[3]..texttraduction.complement[8]..texttraduction.complement[6]..": 200" --texttraduction.menudevnewcont[18] --"\n\n\n\n\nUnlock fortress\n3 swordsmans\nAttack: weak\nHP: medium\nCost: 200"
	infswipe.bouton[1].page[2].bouton[6].condition=(1-1)*6*13+(2-1)*13+5

	infswipe.bouton[1].page[2].bouton[7]={}
	infswipe.bouton[1].page[2].bouton[7].posi=6
	infswipe.bouton[1].page[2].bouton[7].imbandeau=imagemenu.imbandeau --"imbandeau.png"
	infswipe.bouton[1].page[2].bouton[7].texttop=texttraduction.soldat[14] --texttraduction.menudevnewcont[19]--"Champion"
	infswipe.bouton[1].page[2].bouton[7].prix=300
	--infswipe.bouton[1].page[2].bouton[7].textright=infswipe.bouton[1].page[2].bouton[7].prix
	infswipe.bouton[1].page[2].bouton[7].titreText=texttraduction.soldat[14].." " --texttraduction.menudevnewcont[20] --"Champion "
	infswipe.bouton[1].page[2].bouton[7].mainText=texttraduction.complement[1]..texttraduction.batiment[4].."\n4 "..texttraduction.soldat[14]..texttraduction.complement[2]..texttraduction.complement[8]..texttraduction.complement[3]..texttraduction.complement[9]..texttraduction.complement[6]..": 300" --texttraduction.menudevnewcont[21] --"\n\n\n\n\nUnlock castle\n3 champions\nAttack: medium\nHP: high\nCost: 300"
	infswipe.bouton[1].page[2].bouton[7].condition=(1-1)*6*13+(2-1)*13+6

	infswipe.bouton[1].page[2].bouton[8]={}
	infswipe.bouton[1].page[2].bouton[8].posi=5
	infswipe.bouton[1].page[2].bouton[8].imbandeau=imagemenu.imbandeau --"imbandeau.png"
	infswipe.bouton[1].page[2].bouton[8].texttop=texttraduction.menudevnewcont[22] --"Training"
	infswipe.bouton[1].page[2].bouton[8].prix=700
	--infswipe.bouton[1].page[2].bouton[8].textright=infswipe.bouton[1].page[2].bouton[8].prix
	infswipe.bouton[1].page[2].bouton[8].titreText=texttraduction.menudevnewcont[23] --"Training "
	infswipe.bouton[1].page[2].bouton[8].mainText=texttraduction.menudevnewcont[24] --"\nRespawn time\nreduced" --Attaque +5xLevel"
	infswipe.bouton[1].page[2].bouton[8].condition=(1-1)*6*13+(2-1)*13+7

	infswipe.bouton[1].page[2].bouton[9]={}
	infswipe.bouton[1].page[2].bouton[9].posi=12
	infswipe.bouton[1].page[2].bouton[9].imbandeau=imagemenu.imbandeau --"imbandeau.png"
	infswipe.bouton[1].page[2].bouton[9].texttop=texttraduction.soldat[15] --texttraduction.menudevnewcont[25] --"Butcher"
	infswipe.bouton[1].page[2].bouton[9].prix=100
	--infswipe.bouton[1].page[2].bouton[9].textright=infswipe.bouton[1].page[2].bouton[9].prix
	infswipe.bouton[1].page[2].bouton[9].titreText=texttraduction.soldat[15].." " --texttraduction.menudevnewcont[26] --"Butcher "
	infswipe.bouton[1].page[2].bouton[9].mainText=texttraduction.complement[1]..texttraduction.batiment[5].."\n1 "..texttraduction.soldat[15]..texttraduction.complement[2]..texttraduction.complement[8]..texttraduction.complement[3]..texttraduction.complement[8]..texttraduction.complement[6]..": 100"..texttraduction.complement[11] --texttraduction.menudevnewcont[27] --"\n\n\n\n\n\nUnlock cave\n1 butcher\nAttack: medium\nHP: medium\nCost: 100\nAttack several\n enemies"

	infswipe.bouton[1].page[2].bouton[10]={}
	infswipe.bouton[1].page[2].bouton[10].posi=11
	infswipe.bouton[1].page[2].bouton[10].imbandeau=imagemenu.imbandeau --"imbandeau.png"
	infswipe.bouton[1].page[2].bouton[10].texttop=texttraduction.soldat[16] --texttraduction.menudevnewcont[28] --"Ogre"
	infswipe.bouton[1].page[2].bouton[10].prix=200
	--infswipe.bouton[1].page[2].bouton[10].textright=infswipe.bouton[1].page[2].bouton[10].prix
	infswipe.bouton[1].page[2].bouton[10].titreText=texttraduction.soldat[16].." " --texttraduction.menudevnewcont[29] --"Ogre "
	infswipe.bouton[1].page[2].bouton[10].mainText=texttraduction.complement[1]..texttraduction.batiment[6].."\n1 "..texttraduction.soldat[16]..texttraduction.complement[2]..texttraduction.complement[9]..texttraduction.complement[3]..texttraduction.complement[9]..texttraduction.complement[6]..": 200"..texttraduction.complement[11] --texttraduction.menudevnewcont[30] --"\n\n\n\n\n\nUnlock cavern\n1 orgre\nAttack: high\nHP: high\nCost: 200\nAttack several\n enemies"
	infswipe.bouton[1].page[2].bouton[10].condition=(1-1)*6*13+(2-1)*13+9

	infswipe.bouton[1].page[2].bouton[11]={}
	infswipe.bouton[1].page[2].bouton[11].posi=10
	infswipe.bouton[1].page[2].bouton[11].imbandeau=imagemenu.imbandeau --"imbandeau.png"
	infswipe.bouton[1].page[2].bouton[11].texttop=texttraduction.soldat[17] --texttraduction.menudevnewcont[31] --"Skinner"
	infswipe.bouton[1].page[2].bouton[11].prix=300
	--infswipe.bouton[1].page[2].bouton[11].textright=infswipe.bouton[1].page[2].bouton[11].prix
	infswipe.bouton[1].page[2].bouton[11].titreText=texttraduction.soldat[17].." " --texttraduction.menudevnewcont[32] --"Skinner "
	infswipe.bouton[1].page[2].bouton[11].mainText=texttraduction.complement[1]..texttraduction.batiment[7].."\n2 "..texttraduction.soldat[17]..texttraduction.complement[2]..texttraduction.complement[9]..texttraduction.complement[3]..texttraduction.complement[9]..texttraduction.complement[6]..": 500"..texttraduction.complement[11] --texttraduction.menudevnewcont[33]--"\n\n\n\n\n\nUnlock antrum\n2 skinners\nAttack: high\nHP: high\nCost: 500\nAttack several\n enemies"
	infswipe.bouton[1].page[2].bouton[11].condition=(1-1)*6*13+(2-1)*13+10

	infswipe.bouton[1].page[2].bouton[12]={}
	infswipe.bouton[1].page[2].bouton[12].posi=9
	infswipe.bouton[1].page[2].bouton[12].imbandeau=imagemenu.imbandeau --"imbandeau.png"
	infswipe.bouton[1].page[2].bouton[12].texttop=texttraduction.menudevnewcont[34] --"Plate armor"
	infswipe.bouton[1].page[2].bouton[12].prix=700
	--infswipe.bouton[1].page[2].bouton[12].textright=infswipe.bouton[1].page[2].bouton[12].prix
	infswipe.bouton[1].page[2].bouton[12].titreText=texttraduction.menudevnewcont[35] --"Plate armor "
	infswipe.bouton[1].page[2].bouton[12].mainText=texttraduction.menudevnewcont[36] --"\nIncrease giants\n health"
	infswipe.bouton[1].page[2].bouton[12].condition=(1-1)*6*13+(2-1)*13+11

			--infswipe.bouton[1].page[i].bouton[j].x=100
			--infswipe.bouton[1].page[i].bouton[j].y=100
	-- infswipe.bouton[1].page[2].bouton[2]={}
	-- infswipe.bouton[1].page[2].bouton[2].imbandeau=imagemenu.bouton --"bouton.png"
	-- infswipe.bouton[1].page[2].bouton[2].titreText="Dev <sdg"
	-- infswipe.bouton[1].page[2].bouton[2].mainText="Bla bla du sdgf"
	-- infswipe.bouton[1].page[2].bouton[2].posi=1
	-- infswipe.bouton[1].page[2].bouton[2].x=300
	-- infswipe.bouton[1].page[2].bouton[2].y=-100
	infswipe.bouton[1].page[3].imbandeau=imagemenu.devpouvoir

	infswipe.bouton[1].page[3].bouton[1]={}
	infswipe.bouton[1].page[3].bouton[1].posi=4
	infswipe.bouton[1].page[3].bouton[1].imbandeau=imagemenu.imbandeau --"imbandeau.png"
	infswipe.bouton[1].page[3].bouton[1].texttop=texttraduction.menudevnewspell[2] --"Weapon"
	infswipe.bouton[1].page[3].bouton[1].prix=100
	--infswipe.bouton[1].page[3].bouton[1].textright=infswipe.bouton[1].page[3].bouton[1].prix
	infswipe.bouton[1].page[3].bouton[1].titreText=texttraduction.menudevnewspell[3] --"Titanium weapon"
	infswipe.bouton[1].page[3].bouton[1].mainText=texttraduction.menudevnewspell[4] --"\nIncrease\nreinforcement attack"

	infswipe.bouton[1].page[3].bouton[2]={}
	infswipe.bouton[1].page[3].bouton[2].posi=3
	infswipe.bouton[1].page[3].bouton[2].imbandeau=imagemenu.imbandeau --"imbandeau.png"
	infswipe.bouton[1].page[3].bouton[2].texttop=texttraduction.menudevnewspell[5] --"Health"
	infswipe.bouton[1].page[3].bouton[2].prix=200
	--infswipe.bouton[1].page[3].bouton[2].textright=infswipe.bouton[1].page[3].bouton[2].prix
	infswipe.bouton[1].page[3].bouton[2].titreText=texttraduction.menudevnewspell[6] --"Health boost"
	infswipe.bouton[1].page[3].bouton[2].mainText=texttraduction.menudevnewspell[7] --"\nReiforcement have\nmore life"

	infswipe.bouton[1].page[3].bouton[3]={}
	infswipe.bouton[1].page[3].bouton[3].posi=2
	infswipe.bouton[1].page[3].bouton[3].imbandeau=imagemenu.imbandeau --"imbandeau.png"
	infswipe.bouton[1].page[3].bouton[3].texttop=texttraduction.menudevnewspell[8] --"Quick"
	infswipe.bouton[1].page[3].bouton[3].prix=400
	--infswipe.bouton[1].page[3].bouton[3].textright=infswipe.bouton[1].page[3].bouton[3].prix
	infswipe.bouton[1].page[3].bouton[3].titreText=texttraduction.menudevnewspell[9] --"Quick summon"
	infswipe.bouton[1].page[3].bouton[3].mainText=texttraduction.menudevnewspell[10] --"\nShorter spell\n recharge time"

	infswipe.bouton[1].page[3].bouton[4]={}
	infswipe.bouton[1].page[3].bouton[4].posi=1
	infswipe.bouton[1].page[3].bouton[4].imbandeau=imagemenu.imbandeau --"imbandeau.png"
	infswipe.bouton[1].page[3].bouton[4].texttop=texttraduction.menudevnewspell[11] --"Army"
	infswipe.bouton[1].page[3].bouton[4].prix=800
	--infswipe.bouton[1].page[3].bouton[4].textright=infswipe.bouton[1].page[3].bouton[4].prix
	infswipe.bouton[1].page[3].bouton[4].titreText=texttraduction.menudevnewspell[12] --"Undead army"
	infswipe.bouton[1].page[3].bouton[4].mainText=texttraduction.menudevnewspell[13] --"Summon 3 units"

	infswipe.bouton[1].page[3].bouton[5]={}
	infswipe.bouton[1].page[3].bouton[5].posi=8
	infswipe.bouton[1].page[3].bouton[5].imbandeau=imagemenu.imbandeau --"imbandeau.png"
	infswipe.bouton[1].page[3].bouton[5].texttop=texttraduction.menudevnewspell[14] --"Projectile"
	infswipe.bouton[1].page[3].bouton[5].prix=100
	--infswipe.bouton[1].page[3].bouton[5].textright=infswipe.bouton[1].page[3].bouton[5].prix
	infswipe.bouton[1].page[3].bouton[5].titreText=texttraduction.menudevnewspell[15] --"Unlock projectile"
	infswipe.bouton[1].page[3].bouton[5].mainText=texttraduction.menudevnewspell[16] --"Unlock a new spell"

	infswipe.bouton[1].page[3].bouton[6]={}
	infswipe.bouton[1].page[3].bouton[6].posi=7
	infswipe.bouton[1].page[3].bouton[6].imbandeau=imagemenu.imbandeau --"imbandeau.png"
	infswipe.bouton[1].page[3].bouton[6].texttop=texttraduction.menudevnewspell[17] --"Strength"
	infswipe.bouton[1].page[3].bouton[6].prix=200
	--infswipe.bouton[1].page[3].bouton[6].textright=infswipe.bouton[1].page[3].bouton[6].prix
	infswipe.bouton[1].page[3].bouton[6].titreText=texttraduction.menudevnewspell[18] --"Strength attack"
	infswipe.bouton[1].page[3].bouton[6].mainText=texttraduction.menudevnewspell[19] --"Attack increased"
	infswipe.bouton[1].page[3].bouton[6].condition=(2-1)*6*13+(1-1)*13+5

	infswipe.bouton[1].page[3].bouton[7]={}
	infswipe.bouton[1].page[3].bouton[7].posi=6
	infswipe.bouton[1].page[3].bouton[7].imbandeau=imagemenu.imbandeau --"imbandeau.png"
	infswipe.bouton[1].page[3].bouton[7].texttop=texttraduction.menudevnewspell[20] --"Quick"
	infswipe.bouton[1].page[3].bouton[7].prix=400
	--infswipe.bouton[1].page[3].bouton[7].textright=infswipe.bouton[1].page[3].bouton[7].prix
	infswipe.bouton[1].page[3].bouton[7].titreText=texttraduction.menudevnewspell[21] --"Quick summon"
	infswipe.bouton[1].page[3].bouton[7].mainText=texttraduction.menudevnewspell[22] --"\nShorter spell\n recharge time"
	infswipe.bouton[1].page[3].bouton[7].condition=(2-1)*6*13+(1-1)*13+5

	infswipe.bouton[1].page[3].bouton[8]={}
	infswipe.bouton[1].page[3].bouton[8].posi=5
	infswipe.bouton[1].page[3].bouton[8].imbandeau=imagemenu.imbandeau --"imbandeau.png"
	infswipe.bouton[1].page[3].bouton[8].texttop=texttraduction.menudevnewspell[23] --"Black sky" --nb pro pour race 0,1 et 2 enleve 50% du pouvoir si reste du pv>50%
	infswipe.bouton[1].page[3].bouton[8].prix=800
	--infswipe.bouton[1].page[3].bouton[8].textright=infswipe.bouton[1].page[3].bouton[8].prix
	infswipe.bouton[1].page[3].bouton[8].titreText=texttraduction.menudevnewspell[24] --"Black sky"
	infswipe.bouton[1].page[3].bouton[8].mainText=texttraduction.menudevnewspell[25] --"Attack increased"
	infswipe.bouton[1].page[3].bouton[8].condition=(2-1)*6*13+(1-1)*13+5

	infswipe.bouton[1].page[3].bouton[9]={}
	infswipe.bouton[1].page[3].bouton[9].posi=12
	infswipe.bouton[1].page[3].bouton[9].imbandeau=imagemenu.imbandeau --"imbandeau.png"
	infswipe.bouton[1].page[3].bouton[9].texttop=texttraduction.menudevnewspell[26] --"Furry" --nb pro pour race 0,1 et 2 enleve 50% du pouvoir si reste du pv>50%
	infswipe.bouton[1].page[3].bouton[9].prix=200
	--infswipe.bouton[1].page[3].bouton[9].textright=infswipe.bouton[1].page[3].bouton[9].prix
	infswipe.bouton[1].page[3].bouton[9].titreText=texttraduction.menudevnewspell[27] --"Unlock Furry"
	infswipe.bouton[1].page[3].bouton[9].mainText=texttraduction.menudevnewspell[28] --"\n\nAll tower and units\n are stronger for\n a short time"
	infswipe.bouton[1].page[3].bouton[9].condition=(2-1)*6*13+(1-1)*13+5

	infswipe.bouton[1].page[3].bouton[10]={}
	infswipe.bouton[1].page[3].bouton[10].posi=11
	infswipe.bouton[1].page[3].bouton[10].imbandeau=imagemenu.imbandeau --"imbandeau.png"
	infswipe.bouton[1].page[3].bouton[10].texttop=texttraduction.menudevnewspell[29] --"Adrenaline" --nb pro pour race 0,1 et 2 enleve 50% du pouvoir si reste du pv>50%
	infswipe.bouton[1].page[3].bouton[10].prix=400
	--infswipe.bouton[1].page[3].bouton[10].textright=infswipe.bouton[1].page[3].bouton[10].prix
	infswipe.bouton[1].page[3].bouton[10].titreText=texttraduction.menudevnewspell[30] --"Adrenaline"
	infswipe.bouton[1].page[3].bouton[10].mainText=texttraduction.menudevnewspell[31] --"\nIncrease spell\n strength"
	infswipe.bouton[1].page[3].bouton[10].condition=(2-1)*6*13+(1-1)*13+9

	infswipe.bouton[1].page[3].bouton[11]={}
	infswipe.bouton[1].page[3].bouton[11].posi=10
	infswipe.bouton[1].page[3].bouton[11].imbandeau=imagemenu.imbandeau --"imbandeau.png"
	infswipe.bouton[1].page[3].bouton[11].texttop=texttraduction.menudevnewspell[32] --"Ragnarok" --nb pro pour race 0,1 et 2 enleve 50% du pouvoir si reste du pv>50%
	infswipe.bouton[1].page[3].bouton[11].prix=800
	--infswipe.bouton[1].page[3].bouton[11].textright=infswipe.bouton[1].page[3].bouton[11].prix
	infswipe.bouton[1].page[3].bouton[11].titreText=texttraduction.menudevnewspell[33] --"Ragnarok"
	infswipe.bouton[1].page[3].bouton[11].mainText=texttraduction.menudevnewspell[34] --"\nIncrease spell\nstrength"
	infswipe.bouton[1].page[3].bouton[11].condition=(2-1)*6*13+(1-1)*13+9

	infswipe.bouton[1].page[3].bouton[12]={}
	infswipe.bouton[1].page[3].bouton[12].posi=9
	infswipe.bouton[1].page[3].bouton[12].imbandeau=imagemenu.imbandeau --"imbandeau.png"
	infswipe.bouton[1].page[3].bouton[12].texttop=texttraduction.menudevnewspell[35] --"Quick" --nb pro pour race 0,1 et 2 enleve 50% du pouvoir si reste du pv>50%
	infswipe.bouton[1].page[3].bouton[12].prix=1200
	--infswipe.bouton[1].page[3].bouton[12].textright=infswipe.bouton[1].page[3].bouton[12].prix
	infswipe.bouton[1].page[3].bouton[12].titreText=texttraduction.menudevnewspell[36] --"Quick summon"
	infswipe.bouton[1].page[3].bouton[12].mainText=texttraduction.menudevnewspell[37] --"\nShorter spell\n recharge time"
	infswipe.bouton[1].page[3].bouton[12].condition=(2-1)*6*13+(1-1)*13+9
	-- infswipe.bouton[1].page[3].bouton[1].condition=(1-1)*6*13+(2-1)*13+9

	infswipe.bouton[1].page[4].imbandeau=imagemenu.devgene
	infswipe.bouton[1].page[4].bouton[1]={}
	infswipe.bouton[1].page[4].bouton[1].posi=4
	infswipe.bouton[1].page[4].bouton[1].imbandeau=imagemenu.imbandeau --"imbandeau.png"
	infswipe.bouton[1].page[4].bouton[1].texttop=texttraduction.soldat[4] --texttraduction.menudevnewheroes[2] --"Elf leader"
	infswipe.bouton[1].page[4].bouton[1].prix=0
	infswipe.bouton[1].page[4].bouton[1].textright=""
	infswipe.bouton[1].page[4].bouton[1].titreText=texttraduction.soldat[4].." " --"Elf leader "
	infswipe.bouton[1].page[4].bouton[1].mainText=texttraduction.menudevnewheroes[4] --"unlock elf leader"

	infswipe.bouton[1].page[4].bouton[2]={}
	infswipe.bouton[1].page[4].bouton[2].posi=3
	infswipe.bouton[1].page[4].bouton[2].imbandeau=imagemenu.imbandeau --"imbandeau.png"
	infswipe.bouton[1].page[4].bouton[2].texttop=texttraduction.soldat[6] --texttraduction.menudevnewheroes[5] --"Sharpshooter"
	infswipe.bouton[1].page[4].bouton[2].prix=1000
	infswipe.bouton[1].page[4].bouton[2].textright=""
	infswipe.bouton[1].page[4].bouton[2].titreText=texttraduction.soldat[6].." "--texttraduction.menudevnewheroes[6] --"Sharpshooter "
	infswipe.bouton[1].page[4].bouton[2].mainText=texttraduction.complement[1]..texttraduction.soldat[6]..texttraduction.complement[3]..texttraduction.complement[7]..texttraduction.complement[2]..texttraduction.complement[9]..texttraduction.complement[13].." x1"	--texttraduction.menudevnewheroes[7] --"\n\n\n\nUnlock Sharpshooter\n\nHP weak\nAttack: high\nArrow 1x"
	infswipe.bouton[1].page[4].bouton[2].condition=(3-1)*6*13+(1-1)*13+1

	infswipe.bouton[1].page[4].bouton[3]={}
	infswipe.bouton[1].page[4].bouton[3].posi=2
	infswipe.bouton[1].page[4].bouton[3].imbandeau=imagemenu.imbandeau --"imbandeau.png"
	infswipe.bouton[1].page[4].bouton[3].texttop=texttraduction.soldat[5] --texttraduction.menudevnewheroes[8] --"Necromancer"
	infswipe.bouton[1].page[4].bouton[3].prix=7500 --300
	infswipe.bouton[1].page[4].bouton[3].textright=""
	infswipe.bouton[1].page[4].bouton[3].titreText=texttraduction.soldat[5].." " --texttraduction.menudevnewheroes[9] --"Necromancer "
	infswipe.bouton[1].page[4].bouton[3].mainText=texttraduction.menudevnewheroes[10] --"\n\n\nUnlock\n Necromancer\n\nRessurect corpse"
	infswipe.bouton[1].page[4].bouton[3].condition=(3-1)*6*13+(1-1)*13+2

	infswipe.bouton[1].page[4].bouton[4]={}
	infswipe.bouton[1].page[4].bouton[4].posi=1
	infswipe.bouton[1].page[4].bouton[4].imbandeau=imagemenu.imbandeau --"imbandeau.png"
	infswipe.bouton[1].page[4].bouton[4].texttop=texttraduction.menudevnewheroes[11] --"Reinit"
	infswipe.bouton[1].page[4].bouton[4].prix=0
	infswipe.bouton[1].page[4].bouton[4].titreText=texttraduction.menudevnewheroes[12] --"Reinit "
	infswipe.bouton[1].page[4].bouton[4].mainText=texttraduction.menudevnewheroes[13] --"\n\n\nreinitialisation\nof all building\nand power\ndevelopment"
	--infswipe.bouton[1].page[4].bouton[4].condition=(1-1)*6*13+(1-1)*13+3

	infswipe.bouton[1].page[4].bouton[5]={}
	infswipe.bouton[1].page[4].bouton[5].posi=8
	infswipe.bouton[1].page[4].bouton[5].imbandeau=imagemenu.imbandeau --"imbandeau.png"
	infswipe.bouton[1].page[4].bouton[5].texttop=texttraduction.soldat[1] --texttraduction.menudevnewheroes[14] --"Spartan"
	infswipe.bouton[1].page[4].bouton[5].prix=0
	infswipe.bouton[1].page[4].bouton[5].textright=""
	infswipe.bouton[1].page[4].bouton[5].titreText=texttraduction.soldat[1].." " --texttraduction.menudevnewheroes[15] --"Spartan "
	infswipe.bouton[1].page[4].bouton[5].mainText=texttraduction.menudevnewheroes[16] --"Unlock the Spartan"

	infswipe.bouton[1].page[4].bouton[6]={}
	infswipe.bouton[1].page[4].bouton[6].posi=7
	infswipe.bouton[1].page[4].bouton[6].imbandeau=imagemenu.imbandeau --"imbandeau.png"
	infswipe.bouton[1].page[4].bouton[6].texttop=texttraduction.soldat[2] --texttraduction.menudevnewheroes[17] --"Kingsguard"
	infswipe.bouton[1].page[4].bouton[6].prix=1000
	infswipe.bouton[1].page[4].bouton[6].textright=""
	infswipe.bouton[1].page[4].bouton[6].titreText=texttraduction.soldat[2] --texttraduction.menudevnewheroes[18] --"Kingsguard"
	infswipe.bouton[1].page[4].bouton[6].mainText=texttraduction.complement[1]..texttraduction.soldat[2]..texttraduction.complement[3]..texttraduction.complement[9]..texttraduction.complement[2]..texttraduction.complement[8] --texttraduction.menudevnewheroes[19] --"\n\n\nUnlock Kingsguard\n\nAttack: medium\nHP high"
	infswipe.bouton[1].page[4].bouton[6].condition=(3-1)*6*13+(1-1)*13+5

	infswipe.bouton[1].page[4].bouton[7]={}
	infswipe.bouton[1].page[4].bouton[7].posi=6
	infswipe.bouton[1].page[4].bouton[7].imbandeau=imagemenu.imbandeau --"imbandeau.png"
	infswipe.bouton[1].page[4].bouton[7].texttop=texttraduction.soldat[3] --texttraduction.menudevnewheroes[20] --"Warpriest"
	infswipe.bouton[1].page[4].bouton[7].prix=7500
	infswipe.bouton[1].page[4].bouton[7].textright=""
	infswipe.bouton[1].page[4].bouton[7].titreText=texttraduction.soldat[3].." " --texttraduction.menudevnewheroes[21] --"Warpriest "
	infswipe.bouton[1].page[4].bouton[7].mainText=texttraduction.menudevnewheroes[22] --"\n\nUnlock Warpriest\n\nCharm ennemies"
	infswipe.bouton[1].page[4].bouton[7].condition=(3-1)*6*13+(1-1)*13+6

	infswipe.bouton[1].page[4].bouton[8]={}
	infswipe.bouton[1].page[4].bouton[8].posi=5
	infswipe.bouton[1].page[4].bouton[8].imbandeau=imagemenu.imbandeau --"imbandeau.png"
	infswipe.bouton[1].page[4].bouton[8].texttop=texttraduction.soldat[10] --texttraduction.menudevnewheroes[23] --"??"
	infswipe.bouton[1].page[4].bouton[8].prix=5000
	infswipe.bouton[1].page[4].bouton[8].textright=""
	infswipe.bouton[1].page[4].bouton[8].titreText=texttraduction.soldat[10].." " --texttraduction.menudevnewheroes[24] --"?? "
	infswipe.bouton[1].page[4].bouton[8].mainText=texttraduction.menudevnewheroes[25] --"Coming soon"
	infswipe.bouton[1].page[4].bouton[8].condition=(3-1)*6*13+(1-1)*13+7 -- nomrlament 

	infswipe.bouton[1].page[4].bouton[9]={}
	infswipe.bouton[1].page[4].bouton[9].posi=12
	infswipe.bouton[1].page[4].bouton[9].imbandeau=imagemenu.imbandeau --"imbandeau.png"
	infswipe.bouton[1].page[4].bouton[9].texttop=texttraduction.soldat[7] --texttraduction.menudevnewheroes[26] --"Gladiator"
	infswipe.bouton[1].page[4].bouton[9].prix=0
	infswipe.bouton[1].page[4].bouton[9].textright=""
	infswipe.bouton[1].page[4].bouton[9].titreText=texttraduction.soldat[7].." " --texttraduction.menudevnewheroes[27] --"Gladiator "
	infswipe.bouton[1].page[4].bouton[9].mainText=texttraduction.menudevnewheroes[28] --"Unlock Gladiator"

	infswipe.bouton[1].page[4].bouton[10]={}
	infswipe.bouton[1].page[4].bouton[10].posi=11
	infswipe.bouton[1].page[4].bouton[10].imbandeau=imagemenu.imbandeau --"imbandeau.png"
	infswipe.bouton[1].page[4].bouton[10].texttop=texttraduction.soldat[8] --texttraduction.menudevnewheroes[29] --"Scorpio"
	infswipe.bouton[1].page[4].bouton[10].prix=1000
	infswipe.bouton[1].page[4].bouton[10].textright=""
	infswipe.bouton[1].page[4].bouton[10].titreText=texttraduction.soldat[8].." " --texttraduction.menudevnewheroes[30] --"Scorpio "
	infswipe.bouton[1].page[4].bouton[10].mainText=texttraduction.complement[1]..texttraduction.soldat[8]..texttraduction.complement[3]..texttraduction.complement[9]..texttraduction.complement[2]..texttraduction.complement[8]..texttraduction.complement[11] --texttraduction.menudevnewheroes[31] --"\n\n\n\n\nUnlock Scorpio\n\nHP: medium\n Attack: weak\nAttack several\n enemies"
	infswipe.bouton[1].page[4].bouton[10].condition=(3-1)*6*13+(1-1)*13+9

	infswipe.bouton[1].page[4].bouton[11]={}
	infswipe.bouton[1].page[4].bouton[11].posi=10
	infswipe.bouton[1].page[4].bouton[11].imbandeau=imagemenu.imbandeau --"imbandeau.png"
	infswipe.bouton[1].page[4].bouton[11].texttop=texttraduction.soldat[9] --texttraduction.menudevnewheroes[32] --"Divine Hammer"
	infswipe.bouton[1].page[4].bouton[11].prix=7500
	infswipe.bouton[1].page[4].bouton[11].textright=""
	infswipe.bouton[1].page[4].bouton[11].titreText=texttraduction.soldat[9].." "  --texttraduction.menudevnewheroes[33] --"Divine Hammer "
	infswipe.bouton[1].page[4].bouton[11].mainText=texttraduction.menudevnewheroes[34] --"\n\n\n\nUnlock\nDivine Hammer\n\nHammer cause\n an earthquake"
	infswipe.bouton[1].page[4].bouton[11].condition=(3-1)*6*13+(1-1)*13+10

	infswipe.bouton[1].page[4].bouton[12]={}
	infswipe.bouton[1].page[4].bouton[12].posi=9
	infswipe.bouton[1].page[4].bouton[12].imbandeau=imagemenu.imbandeau --"imbandeau.png"
	infswipe.bouton[1].page[4].bouton[12].texttop=texttraduction.menudevnewheroes[35] --"XP"
	infswipe.bouton[1].page[4].bouton[12].prix=400
	--infswipe.bouton[1].page[4].bouton[12].textright=infswipe.bouton[1].page[4].bouton[12].prix
	infswipe.bouton[1].page[4].bouton[12].titreText=texttraduction.menudevnewheroes[36] --"Unit XP "
	infswipe.bouton[1].page[4].bouton[12].mainText=texttraduction.menudevnewheroes[37] --"All unit have XP"
	if false then
		-- infswipe.bouton[2]={}
		-- infswipe.bouton[2].text=texttraduction.menudevnewspell[1] --"Spells"
		-- infswipe.bouton[2].fond = {	imagemenu.page1} --,imagemenu.page13,imagemenu.page12,imagemenu.page13,imagemenu.page14}
		-- infswipe.bouton[2].page={}
		-- for i=1,#infswipe.bouton[2].fond do
		-- 	infswipe.bouton[2].page[i]={}
		-- 	infswipe.bouton[2].page[i].bouton={}
		-- 	infswipe.bouton[2].page[i].imbandeau=imagemenu.devpouvoir
		-- 	-- for j=1,13 do
		-- 	-- 	infswipe.bouton[2].page[i].bouton[j]={}
		-- 	-- 	infswipe.bouton[2].page[i].bouton[j].posi=j-1 -- de 1 à 12 permet de dire l'emplacement du bouton
		-- 	-- 	infswipe.bouton[2].page[i].bouton[j].x=0
		-- 	-- 	infswipe.bouton[2].page[i].bouton[j].y=0
		-- 	-- end
		-- end
		-- infswipe.bouton[2].page[1].bouton[1]={}
		-- infswipe.bouton[2].page[1].bouton[1].posi=4
		-- infswipe.bouton[2].page[1].bouton[1].imbandeau=imagemenu.imbandeau --"imbandeau.png"
		-- infswipe.bouton[2].page[1].bouton[1].texttop=texttraduction.menudevnewspell[2] --"Weapon"
		-- infswipe.bouton[2].page[1].bouton[1].prix=100
		-- --infswipe.bouton[2].page[1].bouton[1].textright=infswipe.bouton[2].page[1].bouton[1].prix
		-- infswipe.bouton[2].page[1].bouton[1].titreText=texttraduction.menudevnewspell[3] --"Titanium weapon"
		-- infswipe.bouton[2].page[1].bouton[1].mainText=texttraduction.menudevnewspell[4] --"\nIncrease\nreinforcement attack"

		-- infswipe.bouton[2].page[1].bouton[2]={}
		-- infswipe.bouton[2].page[1].bouton[2].posi=3
		-- infswipe.bouton[2].page[1].bouton[2].imbandeau=imagemenu.imbandeau --"imbandeau.png"
		-- infswipe.bouton[2].page[1].bouton[2].texttop=texttraduction.menudevnewspell[5] --"Health"
		-- infswipe.bouton[2].page[1].bouton[2].prix=200
		-- --infswipe.bouton[2].page[1].bouton[2].textright=infswipe.bouton[2].page[1].bouton[2].prix
		-- infswipe.bouton[2].page[1].bouton[2].titreText=texttraduction.menudevnewspell[6] --"Health boost"
		-- infswipe.bouton[2].page[1].bouton[2].mainText=texttraduction.menudevnewspell[7] --"\nReiforcement have\nmore life"

		-- infswipe.bouton[2].page[1].bouton[3]={}
		-- infswipe.bouton[2].page[1].bouton[3].posi=2
		-- infswipe.bouton[2].page[1].bouton[3].imbandeau=imagemenu.imbandeau --"imbandeau.png"
		-- infswipe.bouton[2].page[1].bouton[3].texttop=texttraduction.menudevnewspell[8] --"Quick"
		-- infswipe.bouton[2].page[1].bouton[3].prix=400
		-- --infswipe.bouton[2].page[1].bouton[3].textright=infswipe.bouton[2].page[1].bouton[3].prix
		-- infswipe.bouton[2].page[1].bouton[3].titreText=texttraduction.menudevnewspell[9] --"Quick summon"
		-- infswipe.bouton[2].page[1].bouton[3].mainText=texttraduction.menudevnewspell[10] --"\nShorter spell\n recharge time"

		-- infswipe.bouton[2].page[1].bouton[4]={}
		-- infswipe.bouton[2].page[1].bouton[4].posi=1
		-- infswipe.bouton[2].page[1].bouton[4].imbandeau=imagemenu.imbandeau --"imbandeau.png"
		-- infswipe.bouton[2].page[1].bouton[4].texttop=texttraduction.menudevnewspell[11] --"Army"
		-- infswipe.bouton[2].page[1].bouton[4].prix=800
		-- --infswipe.bouton[2].page[1].bouton[4].textright=infswipe.bouton[2].page[1].bouton[4].prix
		-- infswipe.bouton[2].page[1].bouton[4].titreText=texttraduction.menudevnewspell[12] --"Undead army"
		-- infswipe.bouton[2].page[1].bouton[4].mainText=texttraduction.menudevnewspell[13] --"Summon 3 units"

		-- infswipe.bouton[2].page[1].bouton[5]={}
		-- infswipe.bouton[2].page[1].bouton[5].posi=8
		-- infswipe.bouton[2].page[1].bouton[5].imbandeau=imagemenu.imbandeau --"imbandeau.png"
		-- infswipe.bouton[2].page[1].bouton[5].texttop=texttraduction.menudevnewspell[14] --"Projectile"
		-- infswipe.bouton[2].page[1].bouton[5].prix=100
		-- --infswipe.bouton[2].page[1].bouton[5].textright=infswipe.bouton[2].page[1].bouton[5].prix
		-- infswipe.bouton[2].page[1].bouton[5].titreText=texttraduction.menudevnewspell[15] --"Unlock projectile"
		-- infswipe.bouton[2].page[1].bouton[5].mainText=texttraduction.menudevnewspell[16] --"Unlock a new spell"

		-- infswipe.bouton[2].page[1].bouton[6]={}
		-- infswipe.bouton[2].page[1].bouton[6].posi=7
		-- infswipe.bouton[2].page[1].bouton[6].imbandeau=imagemenu.imbandeau --"imbandeau.png"
		-- infswipe.bouton[2].page[1].bouton[6].texttop=texttraduction.menudevnewspell[17] --"Strength"
		-- infswipe.bouton[2].page[1].bouton[6].prix=200
		-- --infswipe.bouton[2].page[1].bouton[6].textright=infswipe.bouton[2].page[1].bouton[6].prix
		-- infswipe.bouton[2].page[1].bouton[6].titreText=texttraduction.menudevnewspell[18] --"Strength attack"
		-- infswipe.bouton[2].page[1].bouton[6].mainText=texttraduction.menudevnewspell[19] --"Attack increased"
		-- infswipe.bouton[2].page[1].bouton[6].condition=(2-1)*6*13+(1-1)*13+5

		-- infswipe.bouton[2].page[1].bouton[7]={}
		-- infswipe.bouton[2].page[1].bouton[7].posi=6
		-- infswipe.bouton[2].page[1].bouton[7].imbandeau=imagemenu.imbandeau --"imbandeau.png"
		-- infswipe.bouton[2].page[1].bouton[7].texttop=texttraduction.menudevnewspell[20] --"Quick"
		-- infswipe.bouton[2].page[1].bouton[7].prix=400
		-- --infswipe.bouton[2].page[1].bouton[7].textright=infswipe.bouton[2].page[1].bouton[7].prix
		-- infswipe.bouton[2].page[1].bouton[7].titreText=texttraduction.menudevnewspell[21] --"Quick summon"
		-- infswipe.bouton[2].page[1].bouton[7].mainText=texttraduction.menudevnewspell[22] --"\nShorter spell\n recharge time"
		-- infswipe.bouton[2].page[1].bouton[7].condition=(2-1)*6*13+(1-1)*13+5

		-- infswipe.bouton[2].page[1].bouton[8]={}
		-- infswipe.bouton[2].page[1].bouton[8].posi=5
		-- infswipe.bouton[2].page[1].bouton[8].imbandeau=imagemenu.imbandeau --"imbandeau.png"
		-- infswipe.bouton[2].page[1].bouton[8].texttop=texttraduction.menudevnewspell[23] --"Black sky" --nb pro pour race 0,1 et 2 enleve 50% du pouvoir si reste du pv>50%
		-- infswipe.bouton[2].page[1].bouton[8].prix=800
		-- --infswipe.bouton[2].page[1].bouton[8].textright=infswipe.bouton[2].page[1].bouton[8].prix
		-- infswipe.bouton[2].page[1].bouton[8].titreText=texttraduction.menudevnewspell[24] --"Black sky"
		-- infswipe.bouton[2].page[1].bouton[8].mainText=texttraduction.menudevnewspell[25] --"Attack increased"
		-- infswipe.bouton[2].page[1].bouton[8].condition=(2-1)*6*13+(1-1)*13+5

		-- infswipe.bouton[2].page[1].bouton[9]={}
		-- infswipe.bouton[2].page[1].bouton[9].posi=12
		-- infswipe.bouton[2].page[1].bouton[9].imbandeau=imagemenu.imbandeau --"imbandeau.png"
		-- infswipe.bouton[2].page[1].bouton[9].texttop=texttraduction.menudevnewspell[26] --"Furry" --nb pro pour race 0,1 et 2 enleve 50% du pouvoir si reste du pv>50%
		-- infswipe.bouton[2].page[1].bouton[9].prix=200
		-- --infswipe.bouton[2].page[1].bouton[9].textright=infswipe.bouton[2].page[1].bouton[9].prix
		-- infswipe.bouton[2].page[1].bouton[9].titreText=texttraduction.menudevnewspell[27] --"Unlock Furry"
		-- infswipe.bouton[2].page[1].bouton[9].mainText=texttraduction.menudevnewspell[28] --"\n\nAll tower and units\n are stronger for\n a short time"
		-- infswipe.bouton[2].page[1].bouton[9].condition=(2-1)*6*13+(1-1)*13+5

		-- infswipe.bouton[2].page[1].bouton[10]={}
		-- infswipe.bouton[2].page[1].bouton[10].posi=11
		-- infswipe.bouton[2].page[1].bouton[10].imbandeau=imagemenu.imbandeau --"imbandeau.png"
		-- infswipe.bouton[2].page[1].bouton[10].texttop=texttraduction.menudevnewspell[29] --"Adrenaline" --nb pro pour race 0,1 et 2 enleve 50% du pouvoir si reste du pv>50%
		-- infswipe.bouton[2].page[1].bouton[10].prix=400
		-- --infswipe.bouton[2].page[1].bouton[10].textright=infswipe.bouton[2].page[1].bouton[10].prix
		-- infswipe.bouton[2].page[1].bouton[10].titreText=texttraduction.menudevnewspell[30] --"Adrenaline"
		-- infswipe.bouton[2].page[1].bouton[10].mainText=texttraduction.menudevnewspell[31] --"\nIncrease spell\n strength"
		-- infswipe.bouton[2].page[1].bouton[10].condition=(2-1)*6*13+(1-1)*13+9

		-- infswipe.bouton[2].page[1].bouton[11]={}
		-- infswipe.bouton[2].page[1].bouton[11].posi=10
		-- infswipe.bouton[2].page[1].bouton[11].imbandeau=imagemenu.imbandeau --"imbandeau.png"
		-- infswipe.bouton[2].page[1].bouton[11].texttop=texttraduction.menudevnewspell[32] --"Ragnarok" --nb pro pour race 0,1 et 2 enleve 50% du pouvoir si reste du pv>50%
		-- infswipe.bouton[2].page[1].bouton[11].prix=800
		-- --infswipe.bouton[2].page[1].bouton[11].textright=infswipe.bouton[2].page[1].bouton[11].prix
		-- infswipe.bouton[2].page[1].bouton[11].titreText=texttraduction.menudevnewspell[33] --"Ragnarok"
		-- infswipe.bouton[2].page[1].bouton[11].mainText=texttraduction.menudevnewspell[34] --"\nIncrease spell\nstrength"
		-- infswipe.bouton[2].page[1].bouton[11].condition=(2-1)*6*13+(1-1)*13+9

		-- infswipe.bouton[2].page[1].bouton[12]={}
		-- infswipe.bouton[2].page[1].bouton[12].posi=9
		-- infswipe.bouton[2].page[1].bouton[12].imbandeau=imagemenu.imbandeau --"imbandeau.png"
		-- infswipe.bouton[2].page[1].bouton[12].texttop=texttraduction.menudevnewspell[35] --"Quick" --nb pro pour race 0,1 et 2 enleve 50% du pouvoir si reste du pv>50%
		-- infswipe.bouton[2].page[1].bouton[12].prix=1200
		-- --infswipe.bouton[2].page[1].bouton[12].textright=infswipe.bouton[2].page[1].bouton[12].prix
		-- infswipe.bouton[2].page[1].bouton[12].titreText=texttraduction.menudevnewspell[36] --"Quick summon"
		-- infswipe.bouton[2].page[1].bouton[12].mainText=texttraduction.menudevnewspell[37] --"\nShorter spell\n recharge time"
		-- infswipe.bouton[2].page[1].bouton[12].condition=(2-1)*6*13+(1-1)*13+9
		-- -- infswipe.bouton[2].page[1].bouton[1].condition=(1-1)*6*13+(2-1)*13+9


		-- infswipe.bouton[3]={}
		-- infswipe.bouton[3].text=texttraduction.menudevnewheroes[1] --"Heroes"
		-- infswipe.bouton[3].fond = {	imagemenu.page1} --,imagemenu.page1,imagemenu.page12,imagemenu.page13,imagemenu.page4}
		-- infswipe.bouton[3].page={}
		-- for i=1,#infswipe.bouton[3].fond do
		-- 	infswipe.bouton[3].page[i]={}
		-- 	infswipe.bouton[3].page[i].bouton={}
		-- 	infswipe.bouton[3].page[i].bouton[1]={}
		-- 	infswipe.bouton[3].page[i].bouton[1].posi=0
		-- 	infswipe.bouton[3].page[i].bouton[1].x=100
		-- 	infswipe.bouton[3].page[i].bouton[1].y=100
		-- 	infswipe.bouton[3].page[i].imbandeau=imagemenu.devgene
		-- end
		-- -- infswipe.bouton[3].page[1].bouton[1]={}
		-- -- infswipe.bouton[3].page[1].bouton[1].posi=7
		-- -- infswipe.bouton[3].page[1].bouton[1].imbandeau=imagemenu.imbandeau --"imbandeau.png"
		-- -- infswipe.bouton[3].page[1].bouton[1].texttop="Elfe2" --nb pro pour race 0,1 et 2 enleve 50% du pouvoir si reste du pv>50%
		-- -- infswipe.bouton[3].page[1].bouton[1].prix=1200
		-- -- infswipe.bouton[3].page[1].bouton[1].textright=infswipe.bouton[3].page[1].bouton[1].prix
		-- -- infswipe.bouton[3].page[1].bouton[1].titreText="Gene Elfe2"
		-- -- infswipe.bouton[3].page[1].bouton[1].mainText="Unlock gene Elfe2"

		-- -- infswipe.bouton[3].page[1].bouton[2]={}
		-- -- infswipe.bouton[3].page[1].bouton[2].posi=2
		-- -- infswipe.bouton[3].page[1].bouton[2].imbandeau=imagemenu.imbandeau --"imbandeau.png"
		-- -- infswipe.bouton[3].page[1].bouton[2].texttop="Humain2" --nb pro pour race 0,1 et 2 enleve 50% du pouvoir si reste du pv>50%
		-- -- infswipe.bouton[3].page[1].bouton[2].prix=1200
		-- -- infswipe.bouton[3].page[1].bouton[2].textright=infswipe.bouton[3].page[1].bouton[2].prix
		-- -- infswipe.bouton[3].page[1].bouton[2].titreText="Gene Humain2"
		-- -- infswipe.bouton[3].page[1].bouton[2].mainText="Unlock gene Humain2"

		-- -- infswipe.bouton[3].page[2].bouton[2]={}
		-- -- infswipe.bouton[3].page[2].bouton[2].posi=2
		-- -- infswipe.bouton[3].page[2].bouton[2].prix=0
		-- -- infswipe.bouton[3].page[2].bouton[2].texttop="Reinit dev"
		-- -- infswipe.bouton[3].page[2].bouton[2].titreText="Init fric"
		-- -- infswipe.bouton[3].page[2].bouton[2].mainText="Reset all devellopement"

		-- infswipe.bouton[3].page[1].bouton[1]={}
		-- infswipe.bouton[3].page[1].bouton[1].posi=4
		-- infswipe.bouton[3].page[1].bouton[1].imbandeau=imagemenu.imbandeau --"imbandeau.png"
		-- infswipe.bouton[3].page[1].bouton[1].texttop=texttraduction.menudevnewheroes[2] --"Elf leader"
		-- infswipe.bouton[3].page[1].bouton[1].prix=0
		-- infswipe.bouton[3].page[1].bouton[1].textright=""
		-- infswipe.bouton[3].page[1].bouton[1].titreText=texttraduction.menudevnewheroes[3] --"Elf leader "
		-- infswipe.bouton[3].page[1].bouton[1].mainText=texttraduction.menudevnewheroes[4] --"unlock elf leader"

		-- infswipe.bouton[3].page[1].bouton[2]={}
		-- infswipe.bouton[3].page[1].bouton[2].posi=3
		-- infswipe.bouton[3].page[1].bouton[2].imbandeau=imagemenu.imbandeau --"imbandeau.png"
		-- infswipe.bouton[3].page[1].bouton[2].texttop=texttraduction.menudevnewheroes[5] --"Sharpshooter"
		-- infswipe.bouton[3].page[1].bouton[2].prix=1000
		-- infswipe.bouton[3].page[1].bouton[2].textright=""
		-- infswipe.bouton[3].page[1].bouton[2].titreText=texttraduction.menudevnewheroes[6] --"Sharpshooter "
		-- infswipe.bouton[3].page[1].bouton[2].mainText=texttraduction.menudevnewheroes[7] --"\n\n\n\nUnlock Sharpshooter\n\nHP weak\nAttack: high\nArrow 1x"
		-- infswipe.bouton[3].page[1].bouton[2].condition=(3-1)*6*13+(1-1)*13+1

		-- infswipe.bouton[3].page[1].bouton[3]={}
		-- infswipe.bouton[3].page[1].bouton[3].posi=2
		-- infswipe.bouton[3].page[1].bouton[3].imbandeau=imagemenu.imbandeau --"imbandeau.png"
		-- infswipe.bouton[3].page[1].bouton[3].texttop=texttraduction.menudevnewheroes[8] --"Necromancer"
		-- infswipe.bouton[3].page[1].bouton[3].prix=2000 --300
		-- infswipe.bouton[3].page[1].bouton[3].textright=""
		-- infswipe.bouton[3].page[1].bouton[3].titreText=texttraduction.menudevnewheroes[9] --"Necromancer "
		-- infswipe.bouton[3].page[1].bouton[3].mainText=texttraduction.menudevnewheroes[10] --"\n\n\nUnlock\n Necromancer\n\nRessurect corpse"
		-- infswipe.bouton[3].page[1].bouton[3].condition=(3-1)*6*13+(1-1)*13+2

		-- infswipe.bouton[3].page[1].bouton[4]={}
		-- infswipe.bouton[3].page[1].bouton[4].posi=1
		-- infswipe.bouton[3].page[1].bouton[4].imbandeau=imagemenu.imbandeau --"imbandeau.png"
		-- infswipe.bouton[3].page[1].bouton[4].texttop=texttraduction.menudevnewheroes[11] --"Reinit"
		-- infswipe.bouton[3].page[1].bouton[4].prix=0
		-- infswipe.bouton[3].page[1].bouton[4].titreText=texttraduction.menudevnewheroes[12] --"Reinit "
		-- infswipe.bouton[3].page[1].bouton[4].mainText=texttraduction.menudevnewheroes[13] --"\n\n\nreinitialisation\nof all building\nand power\ndevelopment"
		-- --infswipe.bouton[3].page[1].bouton[4].condition=(1-1)*6*13+(1-1)*13+3

		-- infswipe.bouton[3].page[1].bouton[5]={}
		-- infswipe.bouton[3].page[1].bouton[5].posi=8
		-- infswipe.bouton[3].page[1].bouton[5].imbandeau=imagemenu.imbandeau --"imbandeau.png"
		-- infswipe.bouton[3].page[1].bouton[5].texttop=texttraduction.menudevnewheroes[14] --"Spartan"
		-- infswipe.bouton[3].page[1].bouton[5].prix=0
		-- infswipe.bouton[3].page[1].bouton[5].textright=""
		-- infswipe.bouton[3].page[1].bouton[5].titreText=texttraduction.menudevnewheroes[15] --"Spartan "
		-- infswipe.bouton[3].page[1].bouton[5].mainText=texttraduction.menudevnewheroes[16] --"Unlock the Spartan"

		-- infswipe.bouton[3].page[1].bouton[6]={}
		-- infswipe.bouton[3].page[1].bouton[6].posi=7
		-- infswipe.bouton[3].page[1].bouton[6].imbandeau=imagemenu.imbandeau --"imbandeau.png"
		-- infswipe.bouton[3].page[1].bouton[6].texttop=texttraduction.menudevnewheroes[17] --"Kingsguard"
		-- infswipe.bouton[3].page[1].bouton[6].prix=1000
		-- infswipe.bouton[3].page[1].bouton[6].textright=""
		-- infswipe.bouton[3].page[1].bouton[6].titreText=texttraduction.menudevnewheroes[18] --"Kingsguard"
		-- infswipe.bouton[3].page[1].bouton[6].mainText=texttraduction.menudevnewheroes[19] --"\n\n\nUnlock Kingsguard\n\nAttack: medium\nHP high"
		-- infswipe.bouton[3].page[1].bouton[6].condition=(3-1)*6*13+(1-1)*13+5

		-- infswipe.bouton[3].page[1].bouton[7]={}
		-- infswipe.bouton[3].page[1].bouton[7].posi=6
		-- infswipe.bouton[3].page[1].bouton[7].imbandeau=imagemenu.imbandeau --"imbandeau.png"
		-- infswipe.bouton[3].page[1].bouton[7].texttop=texttraduction.menudevnewheroes[20] --"Warpriest"
		-- infswipe.bouton[3].page[1].bouton[7].prix=2000
		-- infswipe.bouton[3].page[1].bouton[7].textright=""
		-- infswipe.bouton[3].page[1].bouton[7].titreText=texttraduction.menudevnewheroes[21] --"Warpriest "
		-- infswipe.bouton[3].page[1].bouton[7].mainText=texttraduction.menudevnewheroes[22] --"\n\nUnlock Warpriest\n\nCharm ennemies"
		-- infswipe.bouton[3].page[1].bouton[7].condition=(3-1)*6*13+(1-1)*13+6

		-- infswipe.bouton[3].page[1].bouton[8]={}
		-- infswipe.bouton[3].page[1].bouton[8].posi=5
		-- infswipe.bouton[3].page[1].bouton[8].imbandeau=imagemenu.imbandeau --"imbandeau.png"
		-- infswipe.bouton[3].page[1].bouton[8].texttop=texttraduction.menudevnewheroes[23] --"??"
		-- infswipe.bouton[3].page[1].bouton[8].prix=3000
		-- infswipe.bouton[3].page[1].bouton[8].textright=""
		-- infswipe.bouton[3].page[1].bouton[8].titreText=texttraduction.menudevnewheroes[24] --"?? "
		-- infswipe.bouton[3].page[1].bouton[8].mainText=texttraduction.menudevnewheroes[25] --"Coming soon"
		-- infswipe.bouton[3].page[1].bouton[8].condition=(3-1)*6*13+(1-1)*13+7

		-- infswipe.bouton[3].page[1].bouton[9]={}
		-- infswipe.bouton[3].page[1].bouton[9].posi=12
		-- infswipe.bouton[3].page[1].bouton[9].imbandeau=imagemenu.imbandeau --"imbandeau.png"
		-- infswipe.bouton[3].page[1].bouton[9].texttop=texttraduction.menudevnewheroes[26] --"Gladiator"
		-- infswipe.bouton[3].page[1].bouton[9].prix=0
		-- infswipe.bouton[3].page[1].bouton[9].textright=""
		-- infswipe.bouton[3].page[1].bouton[9].titreText=texttraduction.menudevnewheroes[27] --"Gladiator "
		-- infswipe.bouton[3].page[1].bouton[9].mainText=texttraduction.menudevnewheroes[28] --"Unlock Gladiator"

		-- infswipe.bouton[3].page[1].bouton[10]={}
		-- infswipe.bouton[3].page[1].bouton[10].posi=11
		-- infswipe.bouton[3].page[1].bouton[10].imbandeau=imagemenu.imbandeau --"imbandeau.png"
		-- infswipe.bouton[3].page[1].bouton[10].texttop=texttraduction.menudevnewheroes[29] --"Scorpio"
		-- infswipe.bouton[3].page[1].bouton[10].prix=1000
		-- infswipe.bouton[3].page[1].bouton[10].textright=""
		-- infswipe.bouton[3].page[1].bouton[10].titreText=texttraduction.menudevnewheroes[30] --"Scorpio "
		-- infswipe.bouton[3].page[1].bouton[10].mainText=texttraduction.menudevnewheroes[31] --"\n\n\n\n\nUnlock Scorpio\n\nHP: medium\n Attack: weak\nAttack several\n enemies"
		-- infswipe.bouton[3].page[1].bouton[10].condition=(3-1)*6*13+(1-1)*13+9

		-- infswipe.bouton[3].page[1].bouton[11]={}
		-- infswipe.bouton[3].page[1].bouton[11].posi=10
		-- infswipe.bouton[3].page[1].bouton[11].imbandeau=imagemenu.imbandeau --"imbandeau.png"
		-- infswipe.bouton[3].page[1].bouton[11].texttop=texttraduction.menudevnewheroes[32] --"Divine Hammer"
		-- infswipe.bouton[3].page[1].bouton[11].prix=1500
		-- infswipe.bouton[3].page[1].bouton[11].textright=""
		-- infswipe.bouton[3].page[1].bouton[11].titreText=texttraduction.menudevnewheroes[33] --"Divine Hammer "
		-- infswipe.bouton[3].page[1].bouton[11].mainText=texttraduction.menudevnewheroes[34] --"\n\n\n\nUnlock\nDivine Hammer\n\nHammer cause\n an earthquake"
		-- infswipe.bouton[3].page[1].bouton[11].condition=(3-1)*6*13+(1-1)*13+10

		-- infswipe.bouton[3].page[1].bouton[12]={}
		-- infswipe.bouton[3].page[1].bouton[12].posi=9
		-- infswipe.bouton[3].page[1].bouton[12].imbandeau=imagemenu.imbandeau --"imbandeau.png"
		-- infswipe.bouton[3].page[1].bouton[12].texttop=texttraduction.menudevnewheroes[35] --"XP"
		-- infswipe.bouton[3].page[1].bouton[12].prix=400
		-- --infswipe.bouton[3].page[1].bouton[12].textright=infswipe.bouton[3].page[1].bouton[12].prix
		-- infswipe.bouton[3].page[1].bouton[12].titreText=texttraduction.menudevnewheroes[36] --"Unit XP "
		-- infswipe.bouton[3].page[1].bouton[12].mainText=texttraduction.menudevnewheroes[37] --"All unit have XP"

	end
	-- infswipe.bouton[3].page[2].bouton[1]={}
	-- infswipe.bouton[3].page[2].bouton[1].posi=0
	-- infswipe.bouton[3].page[2].bouton[1].x=300
	-- infswipe.bouton[3].page[2].bouton[1].y=-100
	local slideView = require("swipe1")
	slideViewlaunch(infswipe)
end
return t