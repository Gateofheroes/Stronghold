local t = {}--chargement de donnée pour les gentils et une partie pour les mechants+ une parties des images
t.chniveaunew1 = function ()
--print("\n\n\n\n\n\n\n\n\n\n\ntestinfosdfsdf="..testinfosdfsdf)
print("savegame niveau 1 etoile "..savegameresul[4])
if donneecharger[33]==0 then
	if issimulator then
		local memUsed = (collectgarbage("count")) / 1000
		local texUsed = system.getInfo( "textureMemoryUsed" ) / 1000000
		--print("\n---------MEMORY USAGE INFORMATION chargement1 avant---------")
		--print("System Memory Used:", string.format("%.03f", memUsed), "Mb")
		print("Texture Memory Used avant chniveaunew: ", string.format("%.03f", texUsed), "Mb")
	end
	if goh then
		imagemenu.theme1=graphics.newImageSheet("goh/menudevnew/theme1.png",{width=1410,height=1020,numFrames=1,sheetContentWidth=1410,sheetContentHeight=1020})
		imagemenu.theme2=graphics.newImageSheet("goh/menudevnew/theme2.png",{width=1410,height=1020,numFrames=1,sheetContentWidth=1410,sheetContentHeight=1020})
		imagemenu.theme3=graphics.newImageSheet("goh/menudevnew/theme3.png",{width=1410,height=1020,numFrames=1,sheetContentWidth=1410,sheetContentHeight=1020})
		imagemenu.theme4=graphics.newImageSheet("goh/menudevnew/theme4.png",{width=1410,height=1020,numFrames=1,sheetContentWidth=1410,sheetContentHeight=1020})
		imagemenu.theme1bg=graphics.newImageSheet("goh/menudevnew/theme1bg.png",{width=205,height=115,numFrames=1,sheetContentWidth=205,sheetContentHeight=115})
		imagemenu.theme2bg=graphics.newImageSheet("goh/menudevnew/theme2bg.png",{width=205,height=115,numFrames=1,sheetContentWidth=205,sheetContentHeight=115})
		imagemenu.theme3bg=graphics.newImageSheet("goh/menudevnew/theme3bg.png",{width=205,height=115,numFrames=1,sheetContentWidth=205,sheetContentHeight=115})
		imagemenu.theme4bg=graphics.newImageSheet("goh/menudevnew/theme4bg.png",{width=205,height=115,numFrames=1,sheetContentWidth=205,sheetContentHeight=115})
		imagemenu.boutonvague=graphics.newImageSheet("goh/menudevnew/modevague.png",{width=210,height=210,numFrames=1,sheetContentWidth=210,sheetContentHeight=210})
		imagemenu.badgevague=graphics.newImageSheet("goh/menudevnew/badgevague.png",{width=210,height=280,numFrames=1,sheetContentWidth=210,sheetContentHeight=280})
	else
		imagemenu.theme1=graphics.newImageSheet("menudevnew/theme1.jpg",{width=1280,height=972,numFrames=1,sheetContentWidth=1280,sheetContentHeight=972})
		imagemenu.theme2=graphics.newImageSheet("menudevnew/theme2.jpg",{width=1280,height=972,numFrames=1,sheetContentWidth=1280,sheetContentHeight=972})
		imagemenu.theme3=graphics.newImageSheet("menudevnew/theme3.jpg",{width=1280,height=972,numFrames=1,sheetContentWidth=1280,sheetContentHeight=972})
		imagemenu.theme4=graphics.newImageSheet("menudevnew/theme4.jpg",{width=1280,height=972,numFrames=1,sheetContentWidth=1280,sheetContentHeight=972})
		imagemenu.boutonvague=graphics.newImageSheet("menudevnew/modevague.png",{width=210,height=210,numFrames=1,sheetContentWidth=210,sheetContentHeight=210})
		imagemenu.badgevague=graphics.newImageSheet("menudevnew/badgevague.png",{width=210,height=280,numFrames=1,sheetContentWidth=210,sheetContentHeight=280})
	end
	if donneecharger[34]==0 then
		if not goh then
			imagemenu.mini=graphics.newImageSheet("menudevnew/minimap.png",{width=106,height=54,numFrames=16})  --/imagedev.png",{width=304,height=247,numFrames=1})
		else
			imagemenu.mini=graphics.newImageSheet("goh/menudevnew/minimap.png",{width=434,height=260,numFrames=16,sheetContentWidth=1736,sheetContentHeight=1040})
		end
	end
	--imagemenu.milv2=graphics.newImageSheet("menudevnew/test2.png",{width=106,height=54,numFrames=1}) --=graphics.newImageSheet("menudevnew/imagedev1.png",{width=600,height=247,numFrames=1})
	--imagemenu.milv3=graphics.newImageSheet("menudevnew/test3.png",{width=424,height=216,numFrames=1})
	--imagemenu.milv3=graphics.newImageSheet("menudevnew/imagedev2.png",{width=304,height=500,numFrames=1})
	donneecharger[33]=1 
	if issimulator then
		local memUsed = (collectgarbage("count")) / 1000
		local texUsed = system.getInfo( "textureMemoryUsed" ) / 1000000
		--print("\n---------MEMORY USAGE INFORMATION chargement1 avant---------")
		--print("System Memory Used:", string.format("%.03f", memUsed), "Mb")
		print("Texture Memory Used apres chniveaunew: ", string.format("%.03f", texUsed), "Mb")
	end
end
menuactuel=1
local infswipe={}
infswipe.menu=imagemenu.arriereplan -- "imageMenu.png"
infswipe.qmenu=2 --signifie que c'est un menu de carte
infswipe.qmenu1=false
infswipe.text=texttraduction.menuinf[1]
infswipe.bouton={}
infswipe.bouton[1]={}
infswipe.bouton[1].text="group1"
infswipe.bouton[1].bandeau=1 --1 pour evoluer de page en page en cliquant sur le bandeau et le reste dont nil pour navigation sur group de page
infswipe.bouton[1].textp={}
infswipe.bouton[1].textp[1]=texttraduction.chniveaunew[1] --"Grass"

infswipe.bouton[1].textp[2]=texttraduction.chniveaunew[2] --"Snow"
infswipe.bouton[1].textp[3]=texttraduction.chniveaunew[3] --"Sand"
infswipe.bouton[1].textp[4]=texttraduction.chniveaunew[4] --"Ash"
--infswipe.bouton[1].textp[5]="Bonus"
colorbouttoptxt={}
colorbouttoptxt[1]={red=0.1,green=0.5,blue=0.1}
colorbouttoptxt[2]={red=0.8,green=0.8,blue=0.8}
colorbouttoptxt[3]={red=0.8,green=0.8,blue=0}
colorbouttoptxt[4]={red=0.66,green=0.11,blue=0}
--colorbouttoptxt[5]={red=1,green=1,blue=1}
infswipe.bouton[1].textpt={}
infswipe.bouton[1].textpt[1]=1.3
infswipe.bouton[1].textpt[2]=1.3
infswipe.bouton[1].textpt[3]=1.3
infswipe.bouton[1].textpt[4]=1.3
infswipe.imbandeau=imagemenu.mini

infswipe.bouton[1].fond = {imagemenu.theme1,imagemenu.theme2,imagemenu.theme3,imagemenu.theme4}
fondbgchniveaunew={imagemenu.theme1bg,imagemenu.theme2bg,imagemenu.theme3bg,imagemenu.theme4bg}
infswipe.bouton[1].page={}
for i=1,#infswipe.bouton[1].fond do
	infswipe.bouton[1].page[i]={}
	infswipe.bouton[1].page[i].bouton={}
	local jmax=4
	-- if i==#infswipe.bouton[1].fond then
	-- 	jmax=8
	-- end
	for j=1,jmax do
		infswipe.bouton[1].page[i].bouton[j]={}
		infswipe.bouton[1].page[i].bouton[j].posi=2*j
		if i<=4 then
			--infswipe.bouton[1].page[i].bouton[j].imbandeau=imagemenu.mini --imagemenu.imbandeau --"imbandeau.png"
		else
			--infswipe.bouton[1].page[i].bouton[j].imbandeau=imagemenu.imbandeau
		end
		--if j+(i-1)*4<=16 then
			infswipe.bouton[1].page[i].bouton[j].texttop=texttraduction.chniveaunew[5]..j+(i-1)*4 -- Level
			infswipe.bouton[1].page[i].bouton[j].textbot=savegameresul[((j+(i-1)*4)-1)*4+3]
		
		--else
			--infswipe.bouton[1].page[i].bouton[j].texttop="Niv inf"
			-- if j+(i-1)*4==17 then
			-- 	infswipe.bouton[1].page[i].bouton[j].posi=2
			-- 	infswipe.bouton[1].page[i].bouton[j].texttop="Niv inf"
			-- 	infswipe.bouton[1].page[i].bouton[j].textright="u defend"
			-- 	infswipe.bouton[1].page[i].bouton[j].textbot="AI attaque"
			-- elseif j+(i-1)*4==18 then
			-- 	infswipe.bouton[1].page[i].bouton[j].posi=3
			-- 	infswipe.bouton[1].page[i].bouton[j].texttop="Niv inf 2"
			-- 	infswipe.bouton[1].page[i].bouton[j].textright="AI defend"
			-- 	infswipe.bouton[1].page[i].bouton[j].textbot="u defend "
			-- elseif j+(i-1)*4==19 then
			-- 	infswipe.bouton[1].page[i].bouton[j].posi=6
			-- 	infswipe.bouton[1].page[i].bouton[j].texttop="Niv att"
			-- 	infswipe.bouton[1].page[i].bouton[j].textright="ai defend"
			-- 	infswipe.bouton[1].page[i].bouton[j].textbot="u Attaque"
			-- elseif j+(i-1)*4==20 then
			-- 	infswipe.bouton[1].page[i].bouton[j].posi=7
			-- 	infswipe.bouton[1].page[i].bouton[j].texttop="1 vs 1"
			-- 	infswipe.bouton[1].page[i].bouton[j].textright="u&ai Defend"
			-- 	infswipe.bouton[1].page[i].bouton[j].textbot="u&ai Attaque"
			-- elseif j+(i-1)*4==21 then
			-- 	infswipe.bouton[1].page[i].bouton[j].posi=4
			-- 	infswipe.bouton[1].page[i].bouton[j].texttop="Zombie"
			-- 	infswipe.bouton[1].page[i].bouton[j].textright="Mode zombie"
			-- 	infswipe.bouton[1].page[i].bouton[j].textbot="1DeadZombie=4MiniZombie"
			-- elseif  j+(i-1)*4==22 then
			-- 	infswipe.bouton[1].page[i].bouton[j].posi=8
			-- 	infswipe.bouton[1].page[i].bouton[j].texttop="Panique"
			-- 	infswipe.bouton[1].page[i].bouton[j].textright="Mode Panique"
			-- 	infswipe.bouton[1].page[i].bouton[j].textbot="Villager loses their mind"
			-- elseif j+(i-1)*4==23 then
			-- 	infswipe.bouton[1].page[i].bouton[j].posi=9
			-- 	infswipe.bouton[1].page[i].bouton[j].texttop="MegaXP"
			-- 	infswipe.bouton[1].page[i].bouton[j].textright="Mega XP"
			-- 	infswipe.bouton[1].page[i].bouton[j].textbot="4*XP for soldier"
			-- else
			-- 	infswipe.bouton[1].page[i].bouton[j].posi=10
			-- 	infswipe.bouton[1].page[i].bouton[j].texttop="Million"
			-- 	infswipe.bouton[1].page[i].bouton[j].textright="1 Million"
			-- 	infswipe.bouton[1].page[i].bouton[j].textbot="You begin with a million"
			-- end
		--end
		infswipe.bouton[1].page[i].bouton[j].titreText=texttraduction.chniveaunew[5]..j+(i-1)*4
		infswipe.bouton[1].page[i].bouton[j].mainText=savegameall.mapname[j+(i-1)*4] --"du groupe n°"..i
		infswipe.bouton[1].page[i].bouton[j].prix=-1 --100*i
		if savegame["lvlhard"..(j+(i-1)*4)]==true then
			infswipe.bouton[1].page[i].bouton[j].hard=true
		else
			infswipe.bouton[1].page[i].bouton[j].hard=false
		end
		if savegame["lvlwave"..(j+(i-1)*4)]==true then
			infswipe.bouton[1].page[i].bouton[j].wave=true
		else
			infswipe.bouton[1].page[i].bouton[j].wave=false
		end
		if infswipe.bouton[1].page[i].bouton[j].wave==true then
			if savegame21==nil then
				savegame21={}
			end
			if savegame21[(j+(i-1)*4)]==nil then
				savegame21[(j+(i-1)*4)]=0
			end
			infswipe.bouton[1].page[i].bouton[j].textright="Lvl"..(1+savegame21[(j+(i-1)*4)])
		end
	end
end
if goh then
	infswipe.bouton[1].page[1].bouton[1].posi=0
	infswipe.bouton[1].page[1].bouton[1].x=-40
	infswipe.bouton[1].page[1].bouton[1].y=-30
	infswipe.bouton[1].page[1].bouton[4].posi=0
	infswipe.bouton[1].page[1].bouton[4].x=-82
	infswipe.bouton[1].page[1].bouton[4].y=74
	infswipe.bouton[1].page[1].bouton[2].posi=0
	infswipe.bouton[1].page[1].bouton[2].x=70
	infswipe.bouton[1].page[1].bouton[2].y=-70
	infswipe.bouton[1].page[1].bouton[3].posi=0
	infswipe.bouton[1].page[1].bouton[3].x=127
	infswipe.bouton[1].page[1].bouton[3].y=13

	infswipe.bouton[1].page[2].bouton[1].posi=0
	infswipe.bouton[1].page[2].bouton[1].x=-78
	infswipe.bouton[1].page[2].bouton[1].y=-65
	infswipe.bouton[1].page[2].bouton[4].posi=0
	infswipe.bouton[1].page[2].bouton[4].x=-75
	infswipe.bouton[1].page[2].bouton[4].y=92
	infswipe.bouton[1].page[2].bouton[2].posi=0
	infswipe.bouton[1].page[2].bouton[2].x=45
	infswipe.bouton[1].page[2].bouton[2].y=-7
	infswipe.bouton[1].page[2].bouton[3].posi=0
	infswipe.bouton[1].page[2].bouton[3].x=57
	infswipe.bouton[1].page[2].bouton[3].y=85

	infswipe.bouton[1].page[3].bouton[2].posi=0
	infswipe.bouton[1].page[3].bouton[2].x=-65
	infswipe.bouton[1].page[3].bouton[2].y=-65
	infswipe.bouton[1].page[3].bouton[1].posi=0
	infswipe.bouton[1].page[3].bouton[1].x=-57
	infswipe.bouton[1].page[3].bouton[1].y=92
	infswipe.bouton[1].page[3].bouton[3].posi=0
	infswipe.bouton[1].page[3].bouton[3].x=48
	infswipe.bouton[1].page[3].bouton[3].y=-25
	infswipe.bouton[1].page[3].bouton[4].posi=0
	infswipe.bouton[1].page[3].bouton[4].x=27
	infswipe.bouton[1].page[3].bouton[4].y=79

	infswipe.bouton[1].page[4].bouton[2].posi=0
	infswipe.bouton[1].page[4].bouton[2].x=-70
	infswipe.bouton[1].page[4].bouton[2].y=-80
	infswipe.bouton[1].page[4].bouton[1].posi=0
	infswipe.bouton[1].page[4].bouton[1].x=-53
	infswipe.bouton[1].page[4].bouton[1].y=41
	infswipe.bouton[1].page[4].bouton[3].posi=0
	infswipe.bouton[1].page[4].bouton[3].x=27
	infswipe.bouton[1].page[4].bouton[3].y=-80
	infswipe.bouton[1].page[4].bouton[4].posi=0
	infswipe.bouton[1].page[4].bouton[4].x=100
	infswipe.bouton[1].page[4].bouton[4].y=20
end

local slideView = require("swipe1")
slideViewlaunch(infswipe)

end
return t