local t = {}--chargement de donnée pour les gentils et une partie pour les mechants+ une parties des images
function loadchniveaubonus()
	if donneecharger[34]==0 then
		if not goh then
			imagemenu.mode1=graphics.newImageSheet("menudevnew/mode1.jpg",{width=1280,height=972,numFrames=1,sheetContentWidth=1280,sheetContentHeight=972})
			imagemenu.mode2=graphics.newImageSheet("menudevnew/mode2.jpg",{width=1280,height=972,numFrames=1,sheetContentWidth=1280,sheetContentHeight=972})
		else
			imagemenu.mode1=graphics.newImageSheet("goh/menudevnew/mode1.png",{width=1403,height=1019,numFrames=1,sheetContentWidth=1403,sheetContentHeight=1019})
			imagemenu.mode2=graphics.newImageSheet("goh/menudevnew/mode2.png",{width=1408,height=1014,numFrames=1,sheetContentWidth=1408,sheetContentHeight=1014})
		end
		-- 	imagemenu.theme1=graphics.newImageSheet("menudevnew/theme1.jpg",{width=1280,height=972,numFrames=1,sheetContentWidth=1280,sheetContentHeight=972})
		-- 	imagemenu.theme2=graphics.newImageSheet("menudevnew/theme2.jpg",{width=1280,height=972,numFrames=1,sheetContentWidth=1280,sheetContentHeight=972})
		-- 	imagemenu.theme3=graphics.newImageSheet("menudevnew/theme3.jpg",{width=1280,height=972,numFrames=1,sheetContentWidth=1280,sheetContentHeight=972})
		-- 	imagemenu.theme4=graphics.newImageSheet("menudevnew/theme4.jpg",{width=1280,height=972,numFrames=1,sheetContentWidth=1280,sheetContentHeight=972})
		if donneecharger[33]==0 then
			if not goh then
				imagemenu.mini=graphics.newImageSheet("menudevnew/minimap.png",{width=106,height=54,numFrames=16})  --/imagedev.png",{width=304,height=247,numFrames=1})
			else
				imagemenu.mini=graphics.newImageSheet("goh/menudevnew/minimap.png",{width=434,height=260,numFrames=16,sheetContentWidth=1736,sheetContentHeight=1040})
			end
		end
		-- 	--imagemenu.milv2=graphics.newImageSheet("menudevnew/test2.png",{width=106,height=54,numFrames=1}) --=graphics.newImageSheet("menudevnew/imagedev1.png",{width=600,height=247,numFrames=1})
		-- 	--imagemenu.milv3=graphics.newImageSheet("menudevnew/test3.png",{width=424,height=216,numFrames=1})
		-- 	--imagemenu.milv3=graphics.newImageSheet("menudevnew/imagedev2.png",{width=304,height=500,numFrames=1})
		donneecharger[34]=1 
	end
end
t.chniveaubonus1 = function ()
print("savegame niveau 1 etoile "..savegameresul[4])
loadchniveaubonus()
menuactuel=2
local infswipe={}
infswipe.menu=imagemenu.arriereplan -- "imageMenu.png"
infswipe.qmenu=2 --signifie que c'est un menu de carte
infswipe.qmenu1=true
infswipe.text=texttraduction.menuinf[2]
infswipe.bouton={}
infswipe.bouton[1]={}
infswipe.bouton[1].text="group1"
infswipe.bouton[1].bandeau=1 --1 pour evoluer de page en page en cliquant sur le bandeau et le reste dont nil pour navigation sur group de page
infswipe.bouton[1].textp={}
infswipe.bouton[1].textp[1]=texttraduction.chniveaubonus[1] --"Mode"

infswipe.bouton[1].textp[2]=texttraduction.chniveaubonus[2] --"Theme"
colorbouttoptxt={}
colorbouttoptxt[1]={red=1,green=1,blue=1}
colorbouttoptxt[2]={red=0.9,green=0.9,blue=0.9}
infswipe.bouton[1].textpt={}
infswipe.bouton[1].textpt[1]=1.4
infswipe.bouton[1].textpt[2]=1.4

infswipe.bouton[1].fond = {imagemenu.mode1,imagemenu.mode2}
infswipe.bouton[1].page={}
infswipe.imbandeau=imagemenu.mini
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
		-- if i<=4 then
		-- 	infswipe.bouton[1].page[i].bouton[j].imbandeau=imagemenu.mini --imagemenu.imbandeau --"imbandeau.png"
		-- else
		-- 	infswipe.bouton[1].page[i].bouton[j].imbandeau=imagemenu.imbandeau
		-- end
		-- if j+(i-1)*4<=16 then
		-- 	infswipe.bouton[1].page[i].bouton[j].texttop="Level "..j+(i-1)*4
		-- 	infswipe.bouton[1].page[i].bouton[j].textbot=savegameresul[((j+(i-1)*4)-1)*4+3]
		-- end
		--else
			--infswipe.bouton[1].page[i].bouton[j].texttop="Niv inf"
			if j+(i-1)*4==1 then
				--infswipe.bouton[1].page[i].bouton[j].posi=2
				infswipe.bouton[1].page[i].bouton[j].texttop=texttraduction.chniveaubonus[3] --"Infinite"
				infswipe.bouton[1].page[i].bouton[j].condition=8
				infswipe.bouton[1].page[i].bouton[j].textbandeau=texttraduction.chniveaubonus[4]--"Defend yourself as long as you can"
			elseif j+(i-1)*4==2 then
				--infswipe.bouton[1].page[i].bouton[j].posi=3
				infswipe.bouton[1].page[i].bouton[j].texttop=texttraduction.chniveaubonus[5] --"Skeletton"
				infswipe.bouton[1].page[i].bouton[j].textmain=texttraduction.chniveaubonus[6] --"Skeletton"
				if savegame.lvlsquelette>1 then
					infswipe.bouton[1].page[i].bouton[j].textbot="Lvl"..savegame.lvlsquelette
				end
				-- infswipe.bouton[1].page[i].bouton[j].textright="AI defend"
				-- infswipe.bouton[1].page[i].bouton[j].textbot="u defend "
				infswipe.bouton[1].page[i].bouton[j].condition=12
				infswipe.bouton[1].page[i].bouton[j].textbandeau=texttraduction.chniveaubonus[7] --"Face huge waves of skelettons"
			elseif j+(i-1)*4==3 then
				--infswipe.bouton[1].page[i].bouton[j].posi=6
				infswipe.bouton[1].page[i].bouton[j].texttop=texttraduction.chniveaubonus[8] --"Attaque"
				--infswipe.bouton[1].page[i].bouton[j].textright=texttraduction.chniveaubonus[9] --"AI defend"
				--infswipe.bouton[1].page[i].bouton[j].textbot=texttraduction.chniveaubonus[10] --"U att"
				infswipe.bouton[1].page[i].bouton[j].condition=15
				infswipe.bouton[1].page[i].bouton[j].textbandeau=texttraduction.chniveaubonus[11] --"Your turn to attack the enemy!"
			elseif j+(i-1)*4==4 then
				--infswipe.bouton[1].page[i].bouton[j].posi=7
				--infswipe.bouton[1].page[i].bouton[j].posi=4
				infswipe.bouton[1].page[i].bouton[j].texttop=texttraduction.chniveaubonus[12] --"Zombie"
				if savegame.lvlzombie>1 then
					infswipe.bouton[1].page[i].bouton[j].textbot="Lvl"..savegame.lvlzombie
				end
				-- infswipe.bouton[1].page[i].bouton[j].textright="Mode zombie"
				-- infswipe.bouton[1].page[i].bouton[j].textbot="1DeadZombie=4MiniZombie"
				infswipe.bouton[1].page[i].bouton[j].condition=20
				infswipe.bouton[1].page[i].bouton[j].textbandeau=texttraduction.chniveaubonus[13] --"Can you resist against these zombies?"
			elseif j+(i-1)*4==5 then
				infswipe.bouton[1].page[i].bouton[j].texttop=texttraduction.chniveaubonus[14] --"1 vs 1"
				--infswipe.bouton[1].page[i].bouton[j].textright=texttraduction.chniveaubonus[15] --"U&AI Defend"
				--infswipe.bouton[1].page[i].bouton[j].textbot=texttraduction.chniveaubonus[16] --"U&AI att"
				infswipe.bouton[1].page[i].bouton[j].condition=25
				infswipe.bouton[1].page[i].bouton[j].textbandeau=texttraduction.chniveaubonus[17] --"Play at the same time as the computer"
			elseif  j+(i-1)*4==6 then
				--infswipe.bouton[1].page[i].bouton[j].posi=8
				infswipe.bouton[1].page[i].bouton[j].texttop=texttraduction.chniveaubonus[18] --"Panic"
				--infswipe.bouton[1].page[i].bouton[j].textright="Mode Panique"
				if savegame.lvlpanique>1 then
					infswipe.bouton[1].page[i].bouton[j].textbot="Lvl"..savegame.lvlpanique
				end
				infswipe.bouton[1].page[i].bouton[j].condition=31
				infswipe.bouton[1].page[i].bouton[j].textbandeau=texttraduction.chniveaubonus[19] --"The peasants are scared try not to be overwhelmed"
			elseif j+(i-1)*4==7 then
				--infswipe.bouton[1].page[i].bouton[j].posi=9
				infswipe.bouton[1].page[i].bouton[j].texttop=texttraduction.chniveaubonus[20] --"MegaXP"
				--infswipe.bouton[1].page[i].bouton[j].textbot=texttraduction.chniveaubonus[21] --"4*XP for soldier"
				infswipe.bouton[1].page[i].bouton[j].condition=36
				infswipe.bouton[1].page[i].bouton[j].textbandeau=texttraduction.chniveaubonus[22] --"Your soldiers gain experience 4 times faster"
				--savegamedev[168]
			else
				--infswipe.bouton[1].page[i].bouton[j].posi=10
				infswipe.bouton[1].page[i].bouton[j].texttop=texttraduction.chniveaubonus[23] --"Million"
				--infswipe.bouton[1].page[i].bouton[j].textbot=texttraduction.chniveaubonus[24] --"You begin with a million"
				infswipe.bouton[1].page[i].bouton[j].condition=40
				infswipe.bouton[1].page[i].bouton[j].textbandeau=texttraduction.chniveaubonus[25] --"Reign as a king with one million coins"
			end
		--end
		infswipe.bouton[1].page[i].bouton[j].titreText=texttraduction.chniveaubonus[26]..j+(i-1)*4 --"Level "
		infswipe.bouton[1].page[i].bouton[j].mainText=texttraduction.chniveaubonus[27]..infswipe.bouton[1].page[i].bouton[j].condition --"\nNeeds:"
		infswipe.bouton[1].page[i].bouton[j].prix=-1 --100*i
		if issimulator or iswindows then
			infswipe.bouton[1].page[i].bouton[j].condition=0
		end
		--infswipe.bouton[1].page[i].bouton[j].textbandeau="wesh ma guele"
	end
end
if goh then
	infswipe.bouton[1].page[1].bouton[1].posi=0 --12 24 36 48
	infswipe.bouton[1].page[1].bouton[1].x=-78
	infswipe.bouton[1].page[1].bouton[1].y=-78
	infswipe.bouton[1].page[1].bouton[1].condition=10 -- 8
	infswipe.bouton[1].page[1].bouton[2].posi=0
	infswipe.bouton[1].page[1].bouton[2].x=-37
	infswipe.bouton[1].page[1].bouton[2].y=52
	infswipe.bouton[1].page[1].bouton[2].condition=20 --12
	infswipe.bouton[1].page[1].bouton[3].posi=0
	infswipe.bouton[1].page[1].bouton[3].x=28
	infswipe.bouton[1].page[1].bouton[3].y=-78
	infswipe.bouton[1].page[1].bouton[3].condition=30 --15
	infswipe.bouton[1].page[1].bouton[4].posi=0
	infswipe.bouton[1].page[1].bouton[4].x=85
	infswipe.bouton[1].page[1].bouton[4].y=20
	infswipe.bouton[1].page[1].bouton[4].condition=40 --20

	infswipe.bouton[1].page[2].bouton[1].posi=0
	infswipe.bouton[1].page[2].bouton[1].x=-78
	infswipe.bouton[1].page[2].bouton[1].y=-78
	infswipe.bouton[1].page[2].bouton[1].condition=42 --25
	infswipe.bouton[1].page[2].bouton[2].posi=0
	infswipe.bouton[1].page[2].bouton[2].x=-37
	infswipe.bouton[1].page[2].bouton[2].y=52
	infswipe.bouton[1].page[2].bouton[2].condition=43 --31
	infswipe.bouton[1].page[2].bouton[3].posi=0
	infswipe.bouton[1].page[2].bouton[3].x=28
	infswipe.bouton[1].page[2].bouton[3].y=-78
	infswipe.bouton[1].page[2].bouton[3].condition=44 -- 36
	infswipe.bouton[1].page[2].bouton[4].posi=0
	infswipe.bouton[1].page[2].bouton[4].x=89
	infswipe.bouton[1].page[2].bouton[4].y=17
	infswipe.bouton[1].page[2].bouton[4].condition=46 -- 40
end
if goh then
	for i=1,2 do
		for j=1,4 do
			if savegame.bonuspaid or issimulator then
				infswipe.bouton[1].page[i].bouton[j].condition=0
			end
			if iswindows then
				infswipe.bouton[1].page[i].bouton[j].condition=mathfloor(infswipe.bouton[1].page[i].bouton[j].condition*0.5)
			end
			-- infswipe.bouton[1].page[i].bouton[j].mainText=""
			infswipe.bouton[1].page[i].bouton[j].mainText=texttraduction.chniveaubonus[27]..infswipe.bouton[1].page[i].bouton[j].condition
		end
	end
end

local slideView = require("swipe1")
slideViewlaunch(infswipe)

end
return t