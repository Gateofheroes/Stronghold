local t={}
local imageintro={}
local imageintroaff={}
local imageaff
local groupintro
local backgroundblack
local timerdata
local imageboutonintro
function destructeurintro()
	for i=1,#imageintroaff do
		display.remove(imageintroaff[i])
		imageintroaff[i]=nil
	end
	imageintroaff=nil
	display.remove(imageboutonintro)
	imageboutonintro=nil
	for i=1,5 do
		imageintro[i]=nil
	end
	imageintro=nil
	display.remove(backgroundblack)
	backgroundblack=nil
	display.remove(groupintro)
	groupintro=nil
end
function updateimage()
	imageaff=imageaff+1
	local imageintroafftemp=imageintroaff[imageaff-1]
	transition.to(imageintroafftemp,{time=500,x=contentcenterx-actualcontentwidth,transition=easing.inQuad})
	--display.remove(imageintroaff)
	--imageintroaff:removeSelf()
	local i=imageaff/2
	local j=1
	if i~=mathfloor(i) then
		j=2
		i=i-0.5
	end
	print("i "..i.." j "..j)
	if i<4 then
		imageintroaff[imageaff]=display.newImage(imageintro[i],j)
		imageintroaff[imageaff].x=contentcenterx
		imageintroaff[imageaff].y=imageintroafftemp.y
		imageintroaff[imageaff].xScale=imageintroafftemp.xScale
		imageintroaff[imageaff].yScale=imageintroafftemp.yScale
		groupintro:insert(imageintroaff[imageaff])
		transition.from(imageintroaff[imageaff],{time=750,x=imageintroaff[imageaff].x+actualcontentwidth,transition=easing.outQuad})
		nextslideintro()
	else
		destructeurintro()
		local function lancertutoteube( event )
			if donneecharger[31] then
				multi=0
				local actionmenu1= require("menucarte")
				if goh then
					actionmenu1.ordre(3,1,17,3)
				else
					actionmenu1.ordre(3,1,16,3)
				end
			else	
				local whatever=timer.performWithDelay( 30, lancertutoteube )
			end
		end
		local whatever=timer.performWithDelay( 1, lancertutoteube )
	end
end
function nextslideintro()
	local function timerintro(event)
		updateimage()
	end
	timerdata=timer.performWithDelay(10000,timerintro) 

end
t.new=function()
	if goh then
		imageintro[1]=graphics.newImageSheet("goh/intro/intro1.png",{width=960,height=510,numFrames=2,sheetContentWidth=960,sheetContentHeight=1020})
		imageintro[2]=graphics.newImageSheet("goh/intro/intro2.png",{width=960,height=510,numFrames=2,sheetContentWidth=960,sheetContentHeight=1020})
		imageintro[3]=graphics.newImageSheet("goh/intro/intro3.png",{width=960,height=510,numFrames=2,sheetContentWidth=960,sheetContentHeight=1020})
		imageintro[4]=graphics.newImageSheet("goh/intro/fleche.png",{width=114,height=180,numFrames=1,sheetContentWidth=114,sheetContentHeight=180})
		imageintro[5]=graphics.newImageSheet("goh/intro/imgflou.png",{width=955,height=541,numFrames=1,sheetContentWidth=955,sheetContentHeight=541})
	else
		imageintro[1]=graphics.newImageSheet("intro/intro1.png",{width=960,height=510,numFrames=2,sheetContentWidth=960,sheetContentHeight=1020})
		imageintro[2]=graphics.newImageSheet("intro/intro2.png",{width=960,height=510,numFrames=2,sheetContentWidth=960,sheetContentHeight=1020})
		imageintro[3]=graphics.newImageSheet("intro/intro3.png",{width=960,height=510,numFrames=2,sheetContentWidth=960,sheetContentHeight=1020})
		imageintro[4]=graphics.newImageSheet("intro/fleche.png",{width=114,height=180,numFrames=1,sheetContentWidth=114,sheetContentHeight=180})
		imageintro[5]=graphics.newImageSheet("intro/imgflou.png",{width=955,height=541,numFrames=1,sheetContentWidth=955,sheetContentHeight=541})
	end
	groupintro=display.newGroup()
	backgroundblack=display.newImage(imageintro[5],1)
	backgroundblack.x=contentcenterx
	backgroundblack.y=contentcentery
	backgroundblack.xScale=actualcontentwidth/backgroundblack.width
	backgroundblack.yScale=actualcontentheight/backgroundblack.height
	groupintro:insert(backgroundblack)
	imageaff=2
	imageintroaff[imageaff]=display.newImage(imageintro[1],1)
	groupintro:insert(imageintroaff[imageaff])
	imageintroaff[imageaff].x=contentcenterx
	imageintroaff[imageaff].y=contentcentery
	imageintroaff[imageaff].xScale=0.75*actualcontentwidth/imageintroaff[imageaff].width
	imageintroaff[imageaff].yScale=imageintroaff[imageaff].xScale

	imageboutonintro=display.newImage(imageintro[4],1)
	imageboutonintro.xScale=actualcontentwidth/10/imageboutonintro.width
	imageboutonintro.yScale=imageboutonintro.xScale
	imageboutonintro.x=xmaxscreen-imageboutonintro.xScale*imageboutonintro.width*0.6
	imageboutonintro.y=ymaxscreen-imageboutonintro.yScale*imageboutonintro.height*0.6
	groupintro:insert(imageboutonintro)

	imageboutonintro.fill.effect = "filter.exposure"
	imageboutonintro.fill.effect.exposure =0
	local obj=imageboutonintro.fill.effect
	for i=0,8 do
		transition.to(obj,{delay=4500*i,time=3000,exposure=1.8,transition=easing.continuousLoop} )
	end
	function imageboutonintro:tap(event)
		timer.cancel(timerdata)
		updateimage()
	end
	imageboutonintro:addEventListener("tap",imageboutonintro)
	nextslideintro()
end

return t