
-- function errorHandler( event )
-- 	print("une erreur ma guele")
--     sendErrorDetails( event.errorMessage, event.stackTrace )
--     print("fin de l'erreur ma guele")
-- end 
-- Runtime:addEventListener( "unhandledError", errorHandler )
-- --Runtime:hideErrorAlerts()



 -- <<<< Lua error here

--local backgroundMusic = audio.loadStream( "son/TITAN.mp3" )--un peu pirate des caraibes
-- Play the background music on channel 1, loop infinitely, and fade in over 5 seconds 
-- function testtruc(x1,x2,x3)
-- 	local resul=-6690.75982*x3+840.253213*x3^2+-32.2872838*x3^3+-1307.09264*x2+792.32653*x2*x3+-124.595253*x2*x3^2+5.13612572*x2*x3^3+-315.784947*x2^2+76.3664936*x2^2*x3+-3.16668512*x2^2*x3^2+-12.7160446*x2^3+0.034701348*x2^3*x3+1.43627913*x1+-0.373679001*x1*x3+0.0165848923*x1*x3^2+7.43036663e-05*x1*x3^3+-0.388583436*x1*x2+0.0885490833*x1*x2*x3+-0.00237472312*x1*x2*x3^2+-0.0137276102*x1*x2^2+-0.00289841991*x1*x2^2*x3+0.00187359115*x1*x2^3+4.0576581e-05*x1^2+1.01070979e-05*x1^2*x3+-6.44137555e-07*x1^2*x3^2+-9.04539825e-06*x1^2*x2+-7.5110007e-07*x1^2*x2*x3+1.32762434e-06*x1^2*x2^2+-1.89678795e-09*x1^3+-1.62437006e-10*x1^3*x3+3.14966314e-10*x1^3*x2+19008.027*1+0.365440489*x2^4
-- 	--local resul=-6733.07473*x3+788.321584*x3^2+-27.7770798*x3^3+-1654.51142*x2+1005.65664*x2*x3+-118.25444*x2*x3^2+3.02873277*x2*x3^3+-407.978836*x2^2+24.2688603*x2^2*x3+2.9503463*x2^2*x3^2+24.275324*x2^3+-4.57081106*x2^3*x3+1.34175828*x1+-0.297288363*x1*x3+0.00697188795*x1*x3^2+0.000406418828*x1*x3^3+-0.389120551*x1*x2+0.0846319845*x1*x2*x3+-0.00205974011*x1*x2*x3^2+-0.0145725436*x1*x2^2+-0.00270033369*x1*x2^2*x3+0.0017511523*x1*x2^3+3.5445728e-05*x1^2+1.01017731e-05*x1^2*x3+-6.95475978e-07*x1^2*x3^2+-6.42967004e-06*x1^2*x2+-6.83231291e-07*x1^2*x2*x3+1.09008303e-06*x1^2*x2^2+-1.91550057e-09*x1^3+-1.66909731e-10*x1^3*x3+3.15577851e-10*x1^3*x2+19539.7399*1+1.03300992*x2^4
-- 	print(resul)
-- end
-- testtruc(350,5,1)
-- testtruc(6270,5,1)--29,
-- testtruc(2210,5,1)--30,
-- testtruc(1950,5,1)--31,
-- testtruc(3670,4,1)--7490,
-- testtruc(2540,4,1)--7491,
-- testtruc(1780,4,1)--7492,
-- testtruc(1860,5,2)--79,
-- testtruc(1840,5,2)--82,
-- testtruc(1820,5,2)--83,

-- display.setDefault('minTextureFilter', 'nearest') -- ne fait pas d'arrondi sur les pixels
-- display.setDefault('magTextureFilter', 'nearest') -- rend deguelasse
display.setDefault( "preloadTextures", false) 
display.setDefault( "isImageSheetSampledInsideFrame", true)

gohForStronghold=true
goh=true
premium=true -- false si pas goh
menulud=true
modedev=false
pubvie=true
applifull=false -- niveau bonus unlock
noinapp=false -- remove all in app

if not goh then
	premium=false
end
if premium then
	pubvie=false
	--applifull=true --besoin d'etoile pour debloquer les niveaux
end
print( _G._VERSION )
fonttype="olondon.ttf"
fontsize=1
if goh then
	fonttype="gohfont.ttf"
	fontsize=0.8
end
mathabs=math.abs
mathfloor=math.floor
local t = os.date( '*t' ) 
local laclock=os.time(t)
print("laclock"..laclock)
math.randomseed(laclock-mathfloor(laclock*0.01)*100)
mathrandom=math.random
mathsqrt=math.sqrt
actualcontentwidth=display.actualContentWidth
actualcontentheight=display.actualContentHeight
contentcenterx=display.contentCenterX
contentcentery=display.contentCenterY
xminscreen=contentcenterx-0.5*actualcontentwidth
yminscreen=contentcentery-0.5*actualcontentheight
xmaxscreen=0.5*actualcontentwidth+contentcenterx--actualcontentwidth+(xminscreen)
ymaxscreen=actualcontentheight+(yminscreen)
--petit chargement--
issimulator=false
print("scale reel "..(display.pixelWidth/display.actualContentWidth))
print("scale reel en y "..(display.pixelHeight / display.actualContentHeight))
print('Content: ' .. display.actualContentWidth .. ' x ' .. display.actualContentHeight)
print('Content r: ' .. display.pixelWidth .. ' x ' .. display.pixelHeight)

--print("imageSuffix "..display.imageSuffix)
iswindows=false
if system.getInfo( "platformName" )=="Win" then
	iswindows=true
end
-- issimulator=false
if system.getInfo( "environment" )=="simulator" then
	issimulator=true-- a remettre
	print("issimulator")
end
isiphone=false
if system.getInfo("platformName")=="iPhone OS" then
	isiphone=true
end
isandroid=false
if system.getInfo("platformName")=="Android" then
	isandroid=true
end
isamazon=false
if system.getInfo("targetAppStore") == "amazon" then
	isamazon=true
end

analyticsactif=false
if isandroid then
	if (system.getInfo("androidApiLevel")>=18) then
  		analyticsactif=true
  	end
end
analyticsactif=false

functionload=false

inappactif=true -- defaut true
if iswindows and not issimulator then
	inappactif=false
end
local cachedPrint = print
function print(...)
	if issimulator then
		cachedPrint( unpack( arg ) )
	end
end
collectgarbage("collect")
if issimulator then
	print("collectgarbage main apres"..collectgarbage("count"))
	local memUsed = (collectgarbage("count")) / 1000
	local texUsed = system.getInfo( "textureMemoryUsed" ) / 1000000
	print("\n---------MEMORY USAGE INFORMATION removepartiel apres---------")
	print("System Memory Used:", string.format("%.03f", memUsed), "Mb")
	print("Texture Memory Used:", string.format("%.03f", texUsed), "Mb")
	print("------------------------------------------\n")
	print("maxTextureSize "..system.getInfo("maxTextureSize"))
end
variableasup=0 -- a suprimer
-- test
local adstest=require("adsfile")
adstest.adsfile()
--loadadsnewlife()
-- fin test
local function timerlancermainpremier2( event )
	--print("imageSuffix "..display.imageSuffix)
	if display.imageSuffix==nil then
		print("no suffix is set /!")
		display.imageSuffix="@4x"
	end
	print("imageSuffix "..display.imageSuffix)
	imagemenu={}--image de chargement(visible que sur les appareil de faible performance)
	--imagemenu.chargement=graphics.newImageSheet( "choniveau/chargement.png", { width=300, height=300, numFrames=1 } )
	if not goh then
		imagemenu.artha=graphics.newImageSheet( "choniveau/ARTHA_Entertainment.jpg", { width=800, height=341, numFrames=1 } )
	else
		imagemenu.artha=graphics.newImageSheet( "goh/choniveau/ARTHA_Entertainment.jpg", { width=800, height=341, numFrames=1 } )
	end
	--imagemenu.artha1=graphics.newImageSheet( "choniveau/ARTHA_Entertainment1.png", { width=782, height=400, numFrames=1 } )
	-- imagemenu.bchargementvide=graphics.newImageSheet( "choniveau/bchargementvide.png", { width=120, height=30, numFrames=1 } )
	-- imagemenu.bchargementplein=graphics.newImageSheet( "choniveau/bchargementplein.png", { width=120, height=30, numFrames=1 } )
	-- imagemenu.bchargementdeb=graphics.newImageSheet( "choniveau/bchargementdeb.png", { width=120, height=30, numFrames=1 } )
	if not goh then
		imagemenu.engrenages=graphics.newImageSheet("choniveau/engrenages.jpg",{width=696,height=606,numFrames=1,sheetContentWidth=696,sheetContentHeight=606})
	else
		imagemenu.engrenages=graphics.newImageSheet("goh/choniveau/engrenages.png",{width=163,height=188,numFrames=1,sheetContentWidth=163,sheetContentHeight=188})
	end
	-- imagemenu.blackscreen=graphics.newImageSheet( "choniveau/noir.png", { width=10, height=10, numFrames=1 } )
	local function timerlancermainpremier1( event )
		local chargementaffichage = require ( "chargementaff")
		chargementaffichage.chargementaff(2)
		local function timerlancermainpremier( event )
			local mainfirst1=require("mainfirst")
			lemainpremier()--ouverture du menu principal
		end
		timer.performWithDelay( 50, timerlancermainpremier )--50 ms
	end
	timer.performWithDelay( 50, timerlancermainpremier1 )
	
end
timer.performWithDelay( 10, timerlancermainpremier2 ) --50
local debugMode = true
if not issimulator then
	debugMode=false
end
local originalPrint = print
print = function( ... )
    if debugMode then
        originalPrint( unpack( arg ) ) 
    end
end

--print(mytable[2]["$oid"])
-- lproc = require("plugin.luaproc")
-- lproc.setnumworkers(2)
-- lproc.newproc(function()
-- 	testinfosdfsdf="0"
-- 	local testr=require("test")
-- 	testr:test()
-- end)


--calcul sur l'utilisation des batiments
	-- local tab=[[21 32078 9.16 101
	-- 42 16226 52.7 202
	-- 41 28326 27.98 201
	-- 63 937 -17.73 303
	-- 22 5044 25.5 102
	-- 43 6439 165.17 203
	-- 48 1175 114 213
	-- 23 1555 71.9 103
	-- 62 4761 -8.25 302
	-- 47 2451 53.64 212
	-- 61 2365 0 301
	-- 34 952 1742 124
	-- 52 2047 32.26 222
	-- 44 4482 360 204
	-- 29 378 63.94 114
	-- 24 1612 281.78 104
	-- 32 878 -35.37 122
	-- 27 556 19.42 112
	-- 64 1117 -120.699 304
	-- 49 363 65.04 214
	-- 53 1166 304.72 223
	-- 28 163 556.56 113
	-- 33 383 211.48 123
	-- 54 319 -406.09 224]]
	-- function split(str, pat)
	--    local t = {}  -- NOTE: use {n = 0} in Lua-5.0
	--    local fpat = "(.-)" .. pat
	--    local last_end = 1
	--    local s, e, cap = str:find(fpat, 1)
	--    while s do
	--       if s ~= 1 or cap ~= "" then
	-- 	 table.insert(t,cap)
	--       end
	--       last_end = e+1
	--       s, e, cap = str:find(fpat, last_end)
	--    end
	--    if last_end <= #str then
	--       cap = str:sub(last_end)
	--       table.insert(t, cap)
	--    end
	--    return t
	-- end
	-- local tableau={}
	-- tableau=split(tab,"\n")
	-- local tableau1={}
	-- for i,v in ipairs(tableau) do
	-- 	--print("i "..i.." v "..v)
	-- 	local tableau2=split(tableau[i]," ")
	-- 	tableau1[i]={} -- tableau2[#tableau2]]={}
	-- 	for i1,v1 in ipairs(tableau2) do
	-- 		--if i1~=#tableau2 then
	-- 			--print("i1 "..i1.." v1 "..v1)
	-- 			tableau1[i][i1]=v1
	-- 		--end
	-- 	end
	-- end
	-- local tabbat={}
	-- local indice={}
	-- local indice2
	-- local indice3
	-- local someindice=0
	-- local function getindice(val,someindice1,niveauindice)
	-- 	indice0=0
	-- 	while tonumber(val)>=someindice1+(indice0+1)*niveauindice do
	-- 		indice0=indice0+1
	-- 	end
	-- 	--print("someindice1 avant "..someindice1)
	-- 	someindice1=someindice1+indice0*niveauindice
	-- 	--print("indice0 "..indice0.." "..niveauindice.." someindice "..someindice1.." val "..val)
	-- 	return indice0,someindice1
	-- end
	-- for i,v in ipairs(tableau1) do
	-- 	someindice=0
	-- 	for j=1,3 do
	-- 		indice[j],someindice=getindice(v[4],someindice,10^(3-j))
	-- 		if j==1 then
	-- 			if tabbat[indice[j]]==nil then
	-- 				tabbat[indice[j]]={}
	-- 			end
	-- 		elseif j==2 then
	-- 			if tabbat[indice[j-1]][indice[j]]==nil then
	-- 				tabbat[indice[j-1]][indice[j]]={}
	-- 			end
	-- 		else
	-- 			if tabbat[indice[j-2]][indice[j-1]][indice[j]]==nil then
	-- 				tabbat[indice[j-2]][indice[j-1]][indice[j]]={}
	-- 			end
	-- 		end
	-- 	end
	-- 	tabbat[indice[1]][indice[2]][indice[3]].att=tonumber(v[3])
	-- 	tabbat[indice[1]][indice[2]][indice[3]].nb=tonumber(v[2])
	-- 	tabbat[indice[1]][indice[2]][indice[3]].indice=tonumber(v[4])
	-- 	--print("i1 "..indice[1].." i2 "..indice[2].." i3 "..indice[3])
	-- end
	-- --print("tabbat "..tabbat[1][0][1].indice)
	-- local nbcum
	-- for i=1,3 do
	-- 	for i1=0,2 do
	-- 		nbcum=0
	-- 		for i2=4,1,-1 do
	-- 			if tabbat[i][i1]~=nil then
	-- 				if tabbat[i][i1][i2]~=nil then
	-- 					if tabbat[i][i1][i2].att~=nil then
	-- 						nbcum=nbcum+tabbat[i][i1][i2].nb
	-- 						tabbat[i][i1][i2].nbcum=nbcum
	-- 					end
	-- 				end
	-- 			end
	-- 		end
	-- 	end
	-- end
	-- for i=1,2 do
	-- 	tabbat[i][0][1].nbcum=tabbat[i][0][1].nbcum+tabbat[i][1][2].nbcum+tabbat[i][2][2].nbcum
	-- end
	-- print("i pour premier chiffre 1 pour contact 2 tir, 3 mine.\nDeuxieme chiffre 0 pour base donc infanterie ou archer, 1 pour boulet ou cavalerie, 2 pour pique ou geant,\ndernier chiffre niveau du bat\n\n nb correspond au nombre de bat en fin de partie\nnbc nombre de batiment etant passé par ce niveau\n att attaque du batiment\n\n")
	-- for i2=1,4 do
	-- 	print("")
	-- 	for i=1,3 do
	-- 		for i1=0,2 do
	-- 			if tabbat[i][i1]~=nil then
	-- 				if tabbat[i][i1][i2]~=nil then
	-- 					if tabbat[i][i1][i2].att~=nil then
	-- 						print("i "..tabbat[i][i1][i2].indice.." nb "..tabbat[i][i1][i2].nb.." nbc "..tabbat[i][i1][i2].nbcum.." att "..tabbat[i][i1][i2].att)
	-- 					end
	-- 				end
	-- 			end
	-- 		end
	-- 	end
	-- end
-- print("fin de calcul")
-- local function timerlancermainpremier20( event )
-- 	local memoryused=system.getInfo( "textureMemoryUsed" ) / 1000000
-- 	local options =
-- 	{
-- 	    --array of tables representing each frame (required)
-- 	    frames =
-- 	    {
-- 	        -- FRAME 1:
-- 	        {
-- 	            --all parameters below are required for each frame
-- 	            x = 2,
-- 	            y = 70,
-- 	            width = 50,
-- 	            height = 50
-- 	        },

-- 	        -- FRAME 2:
-- 	        {
-- 	            x = 2,
-- 	            y = 242,
-- 	            width = 50,
-- 	            height = 52
-- 	        },

-- 	        -- FRAME 3 and so on...
-- 	    },

-- 	    --optional parameters; used for scaled content support
-- 	    sheetContentWidth = 1024,
-- 	    sheetContentHeight = 1024
-- 	}
-- 	if issimulator then
-- 		local memUsed = (collectgarbage("count")) / 1000
-- 		local texUsed = system.getInfo( "textureMemoryUsed" ) / 1000000
-- 		print("\n---------MEMORY USAGE INFORMATION chargement1 avant---------")
-- 		print("System Memory Used:", string.format("%.03f", memUsed), "Mb")
-- 		print("Texture Memory Used:", string.format("%.03f", texUsed-memoryused), "Mb")
-- 		memoryused=texUsed
-- 		print("------------------------------------------\n")
-- 	end
-- 	local imagesheetsave={}
-- 	-- for i=1,10 do
-- 	-- 	local options={}
-- 	-- 	options.sheetContentWidth=1024
-- 	-- 	options.sheetContentHeight=2048
-- 	-- 	options.frames={}
-- 	-- 	for i=1,5 do
-- 	-- 		local tableau={}
-- 	-- 		tableau.x=0
-- 	-- 		tableau.y=390*(i-1)
-- 	-- 		tableau.width=415
-- 	-- 		tableau.height=390
-- 	-- 		table.insert(options.frames,tableau)
-- 	-- 	end
-- 	-- 	imagesheetsave[i*2]=graphics.newImageSheet("cav1.png",options) --{width=512,height=512,numFrames=4,sourceX=256,sourceY=1024,sourceWidth=512,sourceHeight=2048,sheetContentWidth=1024,sheetContentHeight=2048})
-- 	-- 	options.sheetContentWidth=1024
-- 	-- 	options.sheetContentHeight=2048
-- 	-- 	options.frames={}
-- 	-- 	for i=1,3 do
-- 	-- 		local tableau={}
-- 	-- 		tableau.x=415
-- 	-- 		tableau.y=390*(i-1)
-- 	-- 		tableau.width=425
-- 	-- 		tableau.height=390
-- 	-- 		table.insert(options.frames,tableau)
-- 	-- 	end
-- 	-- 	imagesheetsave[i*2+1]=graphics.newImageSheet("cav1.png",options) --{width=512,height=512,numFrames=4,sourceX=768,sourceY=1024,sourceWidth=512,sourceHeight=2048,sheetContentWidth=1024,sheetContentHeight=2048})
-- 	-- end
-- 	if issimulator then
-- 		local memUsed = (collectgarbage("count")) / 1000
-- 		local texUsed = system.getInfo( "textureMemoryUsed" ) / 1000000
-- 		print("\n---------MEMORY USAGE INFORMATION chargement1 avant--------- 2fichiers 2 sprites")
-- 		print("System Memory Used:", string.format("%.03f", memUsed), "Mb")
-- 		print("Texture Memory Used:", string.format("%.03f", texUsed-memoryused), "Mb")
-- 		memoryused=texUsed
-- 		print("------------------------------------------\n")
-- 	end
-- 	local imagesheet1=graphics.newImageSheet("cav1.png",{width=417,height=390,numFrames=8,sheetContentWidth=834,sheetContentHeight=1900})
-- 	if issimulator then
-- 		local memUsed = (collectgarbage("count")) / 1000
-- 		local texUsed = system.getInfo( "textureMemoryUsed" ) / 1000000
-- 		print("\n---------MEMORY USAGE INFORMATION chargement1 avant--------- 1 fichier")
-- 		print("System Memory Used:", string.format("%.03f", memUsed), "Mb")
-- 		print("Texture Memory Used:", string.format("%.03f", texUsed-memoryused), "Mb")
-- 		memoryused=texUsed
-- 		print("------------------------------------------\n")
-- 	end
-- 	local depgauche=graphics.newImageSheet( "AnimVF/gentil/Cavalerie/cavalier1/cav1mvmg.png", { width=425, height=390, numFrames=3,sheetContentWidth=425,sheetContentHeight=1170 } )
-- 	local attgauche=graphics.newImageSheet( "AnimVF/gentil/Cavalerie/cavalier1/cav1atg.png", { width=415, height=390, numFrames=5,sheetContentWidth=415,sheetContentHeight=1950 } )
-- 	if issimulator then
-- 		local memUsed = (collectgarbage("count")) / 1000
-- 		local texUsed = system.getInfo( "textureMemoryUsed" ) / 1000000
-- 		print("\n---------MEMORY USAGE INFORMATION chargement1 avant--------- 2 fichiers")
-- 		print("System Memory Used:", string.format("%.03f", memUsed), "Mb")
-- 		print("Texture Memory Used:", string.format("%.03f", texUsed-memoryused), "Mb")
-- 		memoryused=texUsed
-- 		print("------------------------------------------\n")
-- 	end
-- 	local carreblanc={}
-- 	for i=0,4 do
-- 		carreblanc[i]=graphics.newImageSheet("10"..i..".png",{width=130,height=130,numFrames=1,sheetContentWidth=130,sheetContentHeight=130})
-- 		if issimulator then
-- 			local memUsed = (collectgarbage("count")) / 1000
-- 			local texUsed = system.getInfo( "textureMemoryUsed" ) / 1000000
-- 			print("\n---------MEMORY USAGE INFORMATION chargement1 avant--------- "..i)
-- 			print("System Memory Used:", string.format("%.03f", memUsed), "Mb")
-- 			print("Texture Memory Used:", string.format("%.03f", texUsed-memoryused), "Mb")
-- 			memoryused=texUsed
-- 			print("------------------------------------------\n")
-- 		end
-- 	end
-- 	carreblanc[5]=graphics.newImageSheet("500.png",{width=100,height=100,numFrames=25,sheetContentWidth=500,sheetContentHeight=500})
-- 	if issimulator then
-- 		local memUsed = (collectgarbage("count")) / 1000
-- 		local texUsed = system.getInfo( "textureMemoryUsed" ) / 1000000
-- 		print("\n---------MEMORY USAGE INFORMATION chargement1 avant--------- "..5)
-- 		print("System Memory Used:", string.format("%.03f", memUsed), "Mb")
-- 		print("Texture Memory Used:", string.format("%.03f", texUsed-memoryused), "Mb")
-- 		memoryused=texUsed
-- 		print("------------------------------------------\n")
-- 	end
-- 	carreblanc[6]=graphics.newImageSheet("200.png",{width=100,height=100,numFrames=4,sheetContentWidth=200,sheetContentHeight=200})
-- 	if issimulator then
-- 		local memUsed = (collectgarbage("count")) / 1000
-- 		local texUsed = system.getInfo( "textureMemoryUsed" ) / 1000000
-- 		print("\n---------MEMORY USAGE INFORMATION chargement1 avant--------- "..6)
-- 		print("System Memory Used:", string.format("%.03f", memUsed), "Mb")
-- 		print("Texture Memory Used:", string.format("%.03f", texUsed-memoryused), "Mb")
-- 		memoryused=texUsed
-- 		print("------------------------------------------\n")
-- 	end
-- end
-- timer.performWithDelay( 1000000, timerlancermainpremier20 )
--for i=1,4 do
	-- local image2=display.newImage(image1,4)
	-- image2.x=contentcenterx+100
	-- image2.y=contentcentery
	-- image2.xScale=0.2
	-- image2.yScale=0.2
	-- local image2mov=display.newImage(image1mov,1)
	-- image2mov:setFillColor(0,1,0)
	-- image2mov.x=contentcenterx
	-- image2mov.y=contentcentery
	-- image2mov.xScale=0.2
	-- image2mov.yScale=0.2

	--image2.xScale=10
--end
-- local mt = getmetatable(_G)
-- if mt == nil then
--   mt = {}
--   setmetatable(_G, mt)
-- end

-- __STRICT = true
-- mt.__declared = {}

-- mt.__newindex = function (t, n, v)
--   if __STRICT and not mt.__declared[n] then
--     local w = debug.getinfo(2, "S").what
--     if w ~= "main" and w ~= "C" then
--     	print("assign to undeclared variable "..n.." "..w)
--       --error("assign to undeclared variable '"..n.."'", 2)
--     end
--     mt.__declared[n] = true
--   end
--   rawset(t, n, v)
-- end
  
-- mt.__index = function (t, n)
--   if not mt.__declared[n] and debug.getinfo(2, "S").what ~= "C" then
--   	local w = debug.getinfo(2, "S").what --
--   	print("variable "..n.." is not declared "..w)
--     --error("variable '"..n.."' is not declared", 2)
--   end
--   return rawget(t, n)
-- end

-- function global(...)
--    for _, v in ipairs{...} do mt.__declared[v] = true end
-- end

-- affiche les variables a des momment peuvent etre tres interessant. A un moment t (exemple fin de partie), mettre un warning pas un message d'erreur


-- local fondimg=graphics.newImageSheet("affiche.png",{width=2560,height=1440,numFrames=1})
-- local fond=display.newImage(fondimg,1)
-- fond.x=contentcenterx
-- fond.y=contentcentery
-- local largeur=fond.width/actualcontentwidth--1920/1080 dimension de l'image du menu
-- local hauteur=fond.height/actualcontentheight
-- local zoom
-- if (largeur>hauteur) then
-- 	zoom=hauteur
-- else
-- 	zoom=largeur
-- end
-- fond.xScale=1/zoom
-- fond.yScale=1/zoom
-- 	local grpro=display.newGroup()
-- projectiles=graphics.newImageSheet( "batiment/projectiles/projectiles.png", { width=194, height=62, numFrames=7,sheetContentWidth =194,sheetContentHeight =434} )
-- projectiles1=graphics.newImageSheet( "batiment/projectiles/projectiles1.png", { width=194, height=62, numFrames=7,sheetContentWidth =194,sheetContentHeight =434})
-- local flechearrive=0
-- local nbflecheaenvoyer=mathrandom(3,30)
-- local creadisp
-- local creadisp1
-- local function envoyerpacketfleche(type)
-- 		for i=1,nbflecheaenvoyer do
-- 			local portance=mathfloor(8,20)*0.1--1.2
-- 			if type~=1 then
-- 				portance=1
-- 			end
-- 			local monte=mathfloor(5,20)*0.1
-- 			local typepro
-- 			if type~=1 then
-- 				typepro=mathrandom(5,6)
-- 			else
-- 				typepro=mathrandom(1,2)
-- 			end
-- 			local instance2=display.newImage(projectiles,typepro)
			
-- 			instance2.y=mathrandom(yminscreen,ymaxscreen)+instance2.yScale*instance2.height
-- 			local nbvitesse=0
-- 			if mathrandom(0,1)==1 then
-- 				nbvitesse=mathrandom(5,30)
-- 			else
-- 				if type~=1 then
-- 					nbvitesse=mathrandom(15,60)
-- 				end
-- 				nbvitesse=mathrandom(20,80)
-- 			end
-- 			instance2.xScale=nbvitesse*0.01
-- 			nbvitesse=0.3/(nbvitesse/80)
-- 			instance2.yScale=instance2.xScale
-- 			local xobj=xmaxscreen
-- 			if type==1 then
-- 				instance2.x=xminscreen-instance2.xScale*instance2.width
-- 			else
-- 				xobj=xminscreen-instance2.xScale*instance2.width-35
-- 				instance2.x=xmaxscreen+instance2.xScale*instance2.width
-- 			end
-- 			local ybase=instance2.y
-- 			local delaybase=mathrandom(1,10000)
-- 			grpro:insert(instance2)
-- 			local rotateobj1=0
-- 			local rotateobj2
-- 			if type==1 then
-- 				instance2:rotate(-monte*45)
-- 				rotateobj2=monte*45
-- 			else
-- 				rotateobj1=360
-- 				rotateobj2=720
-- 				--instance2:rotate(90+monte*45)
-- 			end
-- 			local bonusy=0
-- 			local bonusx=0
-- 			if nbvitesse>0.4 and type1~=1 then 
-- 				bonusx=35
-- 				bonusy=-10
-- 			end
-- 			transition.to(instance2,{delay=delaybase,time=(2000+2000*portance)*nbvitesse+bonusx*10,x=xobj+bonusx} ) 
-- 			transition.to(instance2,{delay=delaybase,time=nbvitesse*2000, rotation=rotateobj1})
-- 			transition.to(instance2,{delay=delaybase,time=nbvitesse*2000,transition=easing.outQuad,y=instance2.y-monte*200} ) 
-- 			transition.to(instance2,{delay=nbvitesse*2000+delaybase,time=nbvitesse*2000*portance+bonusx*10,transition=easing.inSine,y=ybase+bonusy} ) 
-- 			transition.to(instance2,{delay=nbvitesse*2000+delaybase,time=nbvitesse*2000*portance, rotation=rotateobj2})
-- 			transition.to(instance2,{delay=nbvitesse*2000+delaybase+nbvitesse*2000*portance,time=2000,alpha=0,onComplete=creadisp,onStart=creadisp1})
-- 		end
-- end
-- creadisp=function(obj)
-- 	-- if grmain~=nil then
-- 	-- 	grmain:remove(obj)
-- 	-- end
-- 		obj:removeSelf()
-- 		obj=nil
-- end
-- creadisp1=function(obj)
-- 		flechearrive=flechearrive+1
-- 		if flechearrive>=nbflecheaenvoyer then
-- 			flechearrive=0
-- 			local typepro=mathrandom(1,2)				
-- 			if typepro==2 then
-- 				nbflecheaenvoyer=mathrandom(5,20)
-- 			else
-- 				nbflecheaenvoyer=mathrandom(6,60)
-- 			end
-- 			envoyerpacketfleche(typepro)
-- 		end
-- end
-- if true then
-- 	local function timer1func(event)
-- 		envoyerpacketfleche(1)
-- 	end

-- 	timer.performWithDelay(1000,timer1func)
-- end

-- test format ecran
-- local screens = {
--     -- {'iPhone 3 ',  320,  480},
--     -- {'iPhone 4 ',  640,  960},
--     -- {'iPhone 5 ',  640,  1136},
--     -- {'iPhone 6 ',  750,  1334},
--     -- {'iPhone 6+', 1080, 1920},
--     -- {'iPad Mini', 768,  1024},
--     -- {'iPad Air ',  1536, 2048},
--     {'iPad 3 ',  2048, 2732},

--     -- {'medium 1 ', 400, 854},
--     -- {'medium 2 ', 480, 800},
--     -- {'medium 3 ', 480, 854},
--     -- {'medium 4 ', 600, 800},

--     -- {'high 1   ', 540, 960},
--     -- {'high 2   ', 600, 1024},
--     -- {'high 3   ', 800, 1024},

--     {'xhigh 1  ', 720, 1280},
--     -- {'xhigh 2  ', 768, 1280},
--     -- {'xhigh 3  ', 768, 1366},
--     -- {'xhigh 4  ', 800, 1280},

--     {'xxhigh 1 ', 1200, 1920},
--     -- {'xxhigh 2 ', 1600, 2560}
-- }

-- local modes = {1, 1.5, 2, 2.5, 3, 4, 5, 6, 7, 8}

-- local contentW, contentH = 320, 480

-- for i = 1, #screens do
--     local s = screens[i]
--     local name, w, h = unpack(s)
--     local _w, _h, _m = w, h, 1
--     for i = 1, #modes do
--         local m = modes[i]
--         local lw, lh = w / m, h / m
--         if lw < contentW or lh < contentH then
--             break
--         else
--             _w, _h, _m = lw, lh, m
--         end
--     end
--     if _m < 2 then
--         local scale = math.max(contentW / w, contentH / h)
--         _w, _h = w * scale, h * scale
--     end

--     print(name, 'screen: ', w .. ' x ' .. h, 'aspect:', h / w)
--     print('', '',  'content:', math.floor(_w) .. ' x ' .. math.floor(_h), 'scale:', s[2] / _w)

--     print("scale reel "..(w/_h))
-- 	print("scale reel en y "..(h / _h))
-- 	print('Content: ' .. _w.. ' x ' .. _h)
-- 	print('Content r: ' .. w .. ' x ' .. h)
--     print('')
-- end
