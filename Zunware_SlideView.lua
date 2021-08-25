module(..., package.seeall)


local minimumDragTolerance = 60 

local screenW, screenH = display.contentWidth, display.contentHeight
local viewableScreenW, viewableScreenH = actualcontentwidth*2/3, display.viewableContentHeight --display.viewableContentWidth
local screenOffsetW, screenOffsetH = display.contentWidth -  display.viewableContentWidth, display.contentHeight - display.viewableContentHeight
local pad =screenW/19 --20
local top = screenH*0.1
local bottom = 0
local left=xminscreen -- -actualcontentwidth/2.1+contentcenterx -- -screenW/2.7
-- if actualcontentwidth== --si ipad alors left mettre /2 et on /2.1
local posxslide,posxslidem,posxslidep
local mouvaubonendroit=false --si on deplace avec le doigt l'image (permet de ne pas deplcer quand le doigt et sur la bordure)
savegameall.pageaffiche=1
function new(grpage,imageSet, slideBackground,groupage,boutontab,groupenb,nbgroupe,tab,chniveaumenu)
	local slider = display.newGroup()
	slider.images = {}
	slider.imgNum = nil

	-- Create Images with provided imageset
	local pagegr={}
	for i=1, #imageSet do
		local p = display.newImage(imageSet[i],1)
		local h = viewableScreenH-(top+bottom)
		if tab~=nil then
			h=viewableScreenH
		end

		-- Resize images:
		-- if p.width > viewableScreenW or p.height > h then
		-- 	if (p.width)/viewableScreenW > p.height/h then 
		-- 		p.xScale = viewableScreenW/(p.width) -- +left)
		-- 		p.yScale = viewableScreenW/(p.width) --+left)
		-- 			-- print("image trop large"..p.xScale.." "..p.width.." "..p.xScale*p.width.." "..viewableScreenW.." "..actualcontentwidth*2/3)
		-- 	else
		-- 		p.xScale = h/p.height
		-- 		p.yScale = h/p.height
		-- 	end		 
		-- end
		p.xScale = viewableScreenW/(p.width)
		p.yScale = h/p.height*0.95
		if (p.xScale-p.yScale)/p.xScale>0.1 then
			p.xScale=p.yScale*1.1
			print("ratio trop elever donc correction2 file zunware_slideView")
		elseif (p.xScale-p.yScale)/p.xScale<-0.1 then
			p.yScale=p.xScale*1.1
			print("ratio trop elever donc correction1 file zunware_slideView")
		end
		pagegr[i]=display.newGroup()
		if goh then
			if chniveaumenu then
				print("i"..i)
				local p1=display.newImage(fondbgchniveaunew[i],1)
				p1.xScale=((p.width*0.5*p.xScale+xminscreen)-(-p.width*.5*p.xScale+left-pad))/p1.width
				p1.yScale=actualcontentheight/p1.height
				pagegr[i]:insert(p1)
			end
		end
		pagegr[i]:insert(p)
		
		-- if groupage then
		-- 	if #imageSet~=1 then
		-- 		local autrepage=display.newImage(imbouton.swipe,1)
				
		-- 		autrepage.xScale=0.2
		-- 		autrepage.yScale=autrepage.xScale
		-- 		autrepage.alpha=0.5
		-- 		autrepage.y=p.yScale*p.height*0.5-autrepage.yScale*autrepage.height*0.7
		-- 		if i==1 then
		-- 			autrepage.xScale=-autrepage.xScale
		-- 			autrepage.x=p.xScale*p.width*0.5+autrepage.xScale*autrepage.width*0.7
		-- 		else
		-- 			autrepage.x=-p.xScale*p.width*0.5+autrepage.xScale*autrepage.width*0.7
		-- 		end
		-- 		-- if i==1 then
		-- 		-- 	autrepage:rotate(-53)
		-- 		-- 	autrepage.x=p.xScale*p.width*0.5-autrepage.xScale*autrepage.width*0.7
		-- 		-- else
		-- 		-- 	autrepage.x=-p.xScale*p.width*0.5+autrepage.xScale*autrepage.width*0.7
		-- 		-- 	autrepage.xScale=-autrepage.xScale
		-- 		-- 	autrepage:rotate(53)
		-- 		-- end
		-- 		pagegr[i]:insert(autrepage)
		-- 	end
		-- end
		pagegr[i]:insert(grpage[i].gr)
		-- Add to group:
		slider:insert(pagegr[i])

		-- Place all images except first offscreen:
		if posxslide==nil then 
			posxslide=p.width*0.5*p.xScale+xminscreen --+left
			posxslidem=-p.width*.5*p.xScale+left-pad
			posxslidep=p.width*1.5*p.xScale+left+pad
		end
		if (i > 1) then
			pagegr[i].x =posxslidep --p.width*1.5*p.xScale+left+pad -- screenW*2.5 + pad +left -- all images offscreen except the first one
		else 
			pagegr[i].x =posxslide --p.width*0.5*p.xScale+left-- screenW*.5--+left
		end
		-- Center height:
		pagegr[i].y =contentcentery+0.5*screenH*0.1 --p.yScale*p.height*0.5+screenH*0.1*1.05 --0 -- h*.5
		if tab~=nil then
			pagegr[i].y =contentcentery
		end
		slider.images[i] =pagegr[i]
	end -- Create Images

	-- Default the starting image to the first:
	slider.imgNum = 1
	savegameall.pageaffiche=slider.imgNum
	print("savegameall.pageaffiche mis a 1")
	-- Default position at center of screen:
	slider.x = 0 -- +left
	slider.y =yminscreen -- contentcentery+screenH*0.1*0.5 -- top + display.screenOriginY


	function slider:touch(event)
		if not inappaff then
		local phase = event.phase
		--if event.x<=(actualcontentwidth/6+contentcenterx) then
		if (phase == "began") then
			desactivecoroutine=true
			savegameall.pageaffiche=self.imgNum
			print("savegameall.pageaffiche"..savegameall.pageaffiche)
			if event.x<=(actualcontentwidth/6+contentcenterx) then
				mouvaubonendroit=true
				-- Set foucs so this image registers the touch event until touch has ended.
				display.getCurrentStage():setFocus(self.images[self.imgNum])
				self.images[self.imgNum].isFocus = true
				-- Record the coords of start event
				self.startPos = event.x
				self.prevPos = event.x
			else
				mouvaubonendroit=false
			end
		elseif self.images[self.imgNum].isFocus and mouvaubonendroit then
			
			if (phase == "moved") then
				if self.tween then transition.cancel(self.tween) end
				-- Calculate the difference in movement since touch started
				local delta = event.x - self.prevPos
				self.prevPos = event.x
				-- Move the image by drag amount
				self.images[self.imgNum].x = self.images[self.imgNum].x + delta

				-- Move Previous Image by delta
				if( self.images[self.imgNum-1]) then
					self.images[self.imgNum-1].x = self.images[self.imgNum-1].x + delta
				end

				-- Move next image by delta:
				if (self.images[self.imgNum+1]) then
					self.images[self.imgNum+1].x = self.images[self.imgNum+1].x + delta
				end

			elseif (phase == "ended" or phase == "cancelled") then
				desactivecoroutine=false
				local dragDistance = event.x - self.startPos
				
				-- Determine if enough drag was done, then change Image
				if dragDistance<-minimumDragTolerance then
					if  self.imgNum<#self.images then
						self:nextImage()
					else
						if groupage and groupenb<nbgroupe then
							clicbandeau(groupenb+1)
						end
						self:cancelMove()
					end
				elseif dragDistance > minimumDragTolerance then
					if self.imgNum > 1 then
						self:prevImage()
					else
						if groupage and groupenb>1 then
							clicbandeau(groupenb-1)
						end
						self:cancelMove()
					end
				else
					self:cancelMove()
				end


				if (phase == "cancelled") then
					desactivecoroutine=false
					self:cancelMove()
				end
				-- Restore nil focus.
				display.getCurrentStage():setFocus(nil)
				self.images[self.imgNum].isFocus = false
			end
		end
		end
		return true
	end -- End touch()
	function slider:setSlideNumber()
	print("TODO: setSlideNumber")
	end

	function slider:cancelTween()
		if self.prevTween then
			transition.cancel(self.prevTween)
		end
		self.prevTween = self.tween
	end

	function slider:nextImage()
		desactivecoroutine=false
		audio.play( son.uip2)
		-- Move current image
		self.tween  = transition.to( self.images[self.imgNum], {
				time=400,
				x=posxslidem, --(screenW * 0.5 + pad) * -1,
				transition=easing.outExpo
			})

		-- Move next image
		self.tween = transition.to( self.images[self.imgNum+1], {
				time = 400,
				x =posxslide, -- screenW * 0.5,
				transition=easing.outExpo
			})
		if groupage==false then
			boutontab[self.imgNum].xScale=boutontab[self.imgNum].scalex*0.9
			boutontab[self.imgNum].yScale=boutontab[self.imgNum].scaley*0.9
			boutontab[self.imgNum].y=boutontab[self.imgNum].y1+boutontab[self.imgNum].scaley*0.1*boutontab[self.imgNum].height
			boutontab[self.imgNum].texte.y=boutontab[self.imgNum].y1+boutontab[self.imgNum].scaley*0.1*boutontab[self.imgNum].height
			 -- boutontab[self.imgNum].y=
			boutontab[self.imgNum].texte.size=boutontab[self.imgNum].textet --25
			boutontab[self.imgNum]:setFrame(1)
			if colorbouttoptxt~=nil then
				boutontab[self.imgNum].texte:setFillColor(colorbouttoptxt[self.imgNum].red,colorbouttoptxt[self.imgNum].green,colorbouttoptxt[self.imgNum].blue)
			else
				boutontab[self.imgNum].texte:setFillColor(1)
			end
		end
		-- Update Slider
		self.imgNum = self.imgNum + 1
		savegameall.pageaffiche=self.imgNum
		print("savegameall.pageaffiche"..savegameall.pageaffiche)
		self:initImage(self.imgNum)
		if groupage==false then
			boutontab[self.imgNum].xScale=boutontab[self.imgNum].scalex
			boutontab[self.imgNum].yScale=boutontab[self.imgNum].scaley
			boutontab[self.imgNum].y=boutontab[self.imgNum].y1+boutontab[self.imgNum].scaley*0.05*boutontab[self.imgNum].height
			boutontab[self.imgNum].texte.y=boutontab[self.imgNum].y1
			boutontab[self.imgNum].texte.size=boutontab[self.imgNum].textet*1.2 --30
			boutontab[self.imgNum]:setFrame(2)
			if colorbouttoptxt~=nil then
				boutontab[self.imgNum].texte:setFillColor(colorbouttoptxt[self.imgNum].red*1.2,colorbouttoptxt[self.imgNum].green*1.2,colorbouttoptxt[self.imgNum].blue*1.2)
			else
				boutontab[self.imgNum].texte:setFillColor(0.8,0.8,0)
			end
			--boutontab[self.imgNum].texte:setFillColor(0.8,0.8,0)
		end
			
	end

	function slider:prevImage()
		desactivecoroutine=false
		audio.play( son.uip1)
		-- Move current Image
		self.tween = transition.to(
			self.images[self.imgNum],
			{
				time=400,
				x =posxslidep, -- screenW * 2 + pad,
				transition = easing.outExpo
			}
		)

		-- Move previous Image
		self.tween = transition.to(
			self.images[self.imgNum-1], 
			{
				time=400,
				x =posxslide, -- screenW * 0.5,
				transition = easing.outExpo
			}
		)
		if groupage==false then
			boutontab[self.imgNum].xScale=boutontab[self.imgNum].scalex*0.9
			boutontab[self.imgNum].yScale=boutontab[self.imgNum].scaley*0.9
			boutontab[self.imgNum].y=boutontab[self.imgNum].y1+boutontab[self.imgNum].scaley*0.1*boutontab[self.imgNum].height
			boutontab[self.imgNum].texte.size=boutontab[self.imgNum].textet --25
			boutontab[self.imgNum].texte.y=boutontab[self.imgNum].y1+boutontab[self.imgNum].scaley*0.1*boutontab[self.imgNum].height
			boutontab[self.imgNum]:setFrame(1)
			if colorbouttoptxt~=nil then
				boutontab[self.imgNum].texte:setFillColor(colorbouttoptxt[self.imgNum].red,colorbouttoptxt[self.imgNum].green,colorbouttoptxt[self.imgNum].blue)
			else
				boutontab[self.imgNum].texte:setFillColor(1)
			end
		end
		-- Update slider
		self.imgNum = self.imgNum -1
		savegameall.pageaffiche=self.imgNum
		print("savegameall.pageaffiche"..savegameall.pageaffiche)
		self:initImage(self.imgNum)
		if groupage==false then
			boutontab[self.imgNum].xScale=boutontab[self.imgNum].scalex
			boutontab[self.imgNum].yScale=boutontab[self.imgNum].scaley
			boutontab[self.imgNum].y=boutontab[self.imgNum].y1+boutontab[self.imgNum].scaley*0.05*boutontab[self.imgNum].height
			boutontab[self.imgNum].texte.size=boutontab[self.imgNum].textet*1.2
			boutontab[self.imgNum].texte.y=boutontab[self.imgNum].y1
			boutontab[self.imgNum]:setFrame(2)
			if colorbouttoptxt~=nil then
				boutontab[self.imgNum].texte:setFillColor(colorbouttoptxt[self.imgNum].red*1.2,colorbouttoptxt[self.imgNum].green*1.2,colorbouttoptxt[self.imgNum].blue*1.2)
			else
				boutontab[self.imgNum].texte:setFillColor(0.8,0.8,0)
			end
		end
	end

	function slider:cancelMove()
		desactivecoroutine=false
		-- Current Image
		tween = transition.to (
			self.images[self.imgNum],
			{
				time = 400,
				x =posxslide, -- screenW * 0.5,
				transition = easing.outExpo
			}
		)

		-- Previous Image:
		tween = transition.to(
			self.images[self.imgNum-1], 
			{
				time = 400,
				x =posxslidem, -- (screenW * 0.5 + pad) * -1,
				transition = easing.outExpo
			}
		)

		-- Next Image:
		tween = transition.to(
			self.images[self.imgNum+1], 
			{
				time = 400,
				x =posxslidep, -- (screenW * 2 + pad),
				transition = easing.outExpo
			}
		)
	end

	function slider:initImage(num)
		desactivecoroutine=false
		if(num < #self.images) then
			self.images[num+1].x =posxslidep -- screenW * 2 + pad
		end

		if(num > 1) then
			self.images[num-1].x =posxslidem -- (screenW * 0.5 + pad) * -1
		end
	end

	function slider:jumpToImage(num)
		desactivecoroutine=false
		audio.play( son.uip1)
		local i 
		for i = 1, #self.images do
			if i < num then
				self.images[i].x =posxslidem -- -screenW * 0.5;
			elseif i > num then
				self.images[i].x =posxslidep -- screenW * 2 + pad
			else
				self.images[i].x =posxslide -- screenW * 0.5  -- - pad
			end
		end
		self.imgNum = num
		savegameall.pageaffiche=self.imgNum
		print("savegameall.pageaffiche"..savegameall.pageaffiche)
		self:initImage(self.imgNum)
	end
	 function slider:jumpToImage1(num)
	 	desactivecoroutine=false
	 	self:jumpToImage(num)
	 end
	function slider:cleanUp()
		desactivecoroutine=false
		self:removeEventListener("touch", self)
		slider:removeSelf()
		slider=nil
	end

	slider:addEventListener("touch", slider)
	return slider

end