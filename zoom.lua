local t = {}--gestion du zoom et du deplacement de carte(carte de choix de niveau et carte de niveau)
--fonction qu'on declare, etudier facon de la declarer, obj trouver les void, fonction inutile
t.zoom = function (objet)--0 pour menu des niveaux, 1 pour la carte du jeu

	system.activate( "multitouch" )
	--system.activate("physics")
	--background.xScale=2
	--background.yScale=2

	-- local xminscreen=xminscreen
	-- local yminscreen=yminscreen
	-- local xmaxscreen=xmaxscreen--actualcontentwidth+(xminscreen)
	-- local ymaxscreen=actualcontentheight+(yminscreen)
	local maxpos1, maypos1, maxminuspos1, mayminuspos1 --,maxminuspos2,mayminuspos2
	 maxpos2=2048*0.3
	 maypos2=1024*0.3
	if multi~=0 then
		maxpos2=1024*0.3
		maypos2=1024*0.3
	end
	maxpos1=-xminscreen+maxpos2--1800*0.3--variable depenant de la taille de l'image
	maypos1=-yminscreen+maypos2
	maxminuspos2=-2048*0.3-- -2040*0.3
	mayminuspos2=-1024*0.3
	if multi~=0 then

		maxminuspos2=-1024*0.3
		mayminuspos2=-1024*0.3
	end
	if contreai==1 then
		mayminuspos2=(-2048-1024)*0.3
	end
	maxminuspos1=xmaxscreen+maxminuspos2--contentcenterx*2+maxminuspos2--actualcontentwidth+maxminuspos2
	mayminuspos1=ymaxscreen+mayminuspos2--contentcentery*2+mayminuspos2--actualcontentheight+mayminuspos2
	local maxpos, maypos, maxminuspos, mayminuspos = maxpos1, maypos1, maxminuspos1, mayminuspos1
	local zoom=0.6
	if multi~=0 then
		local largeur = mathabs(maxpos2)*2/actualcontentwidth --1920/1080 dimension de l'image du menu
		local hauteur = mathabs(maypos2)*2/actualcontentheight
		if (largeur > hauteur) then
			zoom = hauteur
		else
			zoom = largeur
		end
		--print("zoom"..zoom)
		zoom=mathfloor(zoom*10)*0.1-0.05
	end
	if multi==0 then
		local largeur=actualcontentwidth/(mathabs(maxpos2)*2) --1920/1080 dimension de l'image du menu
		local hauteur=actualcontentheight/(mathabs(maypos2)*2)
		--largeur=actualcontentwidth/(4096*0.3)
		--hauteur=actualcontentheight/(2048*0.3)
		if hauteur>largeur then
			zoom=hauteur
		else
			zoom=largeur
		end
		-- zoom=mathfloor(zoom*100+2)*0.01

		zoom=zoom*1.001
	end
	local ZOOMMIN=zoom --0.6 -- zoom

	if multi~=0 then
	--	ZOOMMIN=1
	end
	local apparencezoom=1
	if tailleecran<4 then
		apparencezoom=1.3
	elseif tailleecran>=5 and tailleecran<6 then
		apparencezoom=0.9
	elseif tailleecran>=6 and tailleecran<8 then
		apparencezoom=0.7
	else
		apparencezoom=0.5
	end
	print("apparencezoom "..apparencezoom)
	local ZOOMMAX=2.6*apparencezoom
	if ZOOMMAX<=ZOOMMIN then
		ZOOMMAX=ZOOMMIN+0.1
	end
	--print("apparence "..apparence)
	background.x=0--100--0 pourquoi pas 0
	background.y=0--200--0
	local scaleold=1
	local xstart=nil
	local ystart=nil
	local vitessex=0
	local vitessey=0
	local vitessez=0
	local duredep=system.getTimer()
	--local clic=nil--clic à 0 si c'et un clic et si c'est un mouvement c'est un 1
	local dist=0
	local orix=0
	local oriy=0
	local numclic=0--nombre de clic sur le background
	local clicx
	local clicy
	--hugo---------------------------------------------------------------------------------------
	local dure=25--dure entre chaque deplacement de la carte
	local ampli=100 --10--8--amplification de la vitesse
	local inertiecst=0.92--0.90--0.80--reduction de la vitesse a chaque deplacement
	--hugo--------------------------------------------------------------------------------------

	function test( event )

	end

	inertieyb=timer.performWithDelay( 50000, test )
	inertiexb=timer.performWithDelay( 50000, test )
					

	local function calculateDelta( previousTouches, event )
		local id,touch = next( previousTouches )
		if event.id == id then
			id,touch = next( previousTouches, id )
			assert( id ~= event.id )
		end
 
		local dx = touch.x - event.x--local 
		local dy = touch.y - event.y--local
		return dx, dy
	end
	 
	-- create a table listener object for the bkgd image
function zoomdrag(self,event,previousTouches,numTotalTouches,mode)
	if numTotalTouches<=2 then
			if ( self.distance ) then
				local dx,dy
				if mode==0 then
					if previousTouches and ( numTotalTouches ) >= 2 then
						dx,dy = calculateDelta( previousTouches, event )
					end
				elseif mode==1 or mode==2 or mode==3 then
					dx=10
					dy=10
				end
				if ( dx and dy )or mode==2 or mode==3 then
					--print("dx et dy")
					local newDistance = mathsqrt( dx*dx + dy*dy )
					local scale = newDistance / self.distance
					--print( "newDistance(" ..newDistance .. ") / distance(" .. self.distance .. ") = scale("..  scale ..")" )
					if ( scale > 0 ) or mode==2 or mode==3 then
						--print("scale>0")
						--local taille=nil
						if mode==2 then
							taille=ZOOMMIN -- +0.05 -- +0.1
						elseif mode==3 then
							taille=ZOOMMAX-0.05
						else
							taille=self.xScaleOriginal*scale--10/distance=scale--taille=xscor*10/distance--ZOOMMIN+0.1=xscor*10/distance--distance=xscor*10/(ZOOMMIN+0.1)
						end
						--print("taille: "..taille)
						if(taille>= ZOOMMIN and taille<=ZOOMMAX)then
							--print("bien")
							local pointcentrex=(-self.x+event.x)/self.xScale
							local pointcentrey=(-self.y+event.y)/self.yScale
							maxpos=xminscreen+maxpos2*taille--maxpos1*taille
							maypos=yminscreen+maypos2*taille--maypos1*taille
							maxminuspos=xmaxscreen+maxminuspos2*taille
							mayminuspos=ymaxscreen+mayminuspos2*taille
							self.xScale = taille--self.xScaleOriginal * scale
							self.yScale =taille-- self.yScaleOriginal * scale
							local pointcentrex1=(-self.x+event.x)/self.xScale
							local pointcentrey1=(-self.y+event.y)/self.yScale
							--if pointcentrey1
							self.x=self.x+pointcentrex1-pointcentrex
							self.y=self.y+pointcentrey1-pointcentrey
							if(self.x>maxpos)then
								self.x=maxpos
							end
							if(self.y>maypos)then
								self.y=maypos
							end
							if(self.x<maxminuspos)then
								self.x=maxminuspos
							end
							if(self.y<mayminuspos)then
								self.y=mayminuspos
							end
						end
						if(taille<ZOOMMIN)then
							taille=ZOOMMIN
						end
						if(taille>ZOOMMAX)then
							taille=ZOOMMAX
						end
					end
				end
			else
				--print(event.x.." "..self.myX)
				dist=dist+(self.x-orix)*(self.x-orix)+(self.y-oriy)*(self.y-oriy)
				local duredep1=system.getTimer()
				local posx=self.x
				local posy=self.y
				self.x = event.x - self.myX
				self.y = event.y - self.myY

				--text10 = display.newText( self.x, 210, 30, native.systemFontBold, 12 )
				--numtapba=0
				if (self.x > maxpos) then
					self.x = maxpos
					self.myX=event.x-self.x
				elseif (self.x < maxminuspos) then
					self.x = maxminuspos
					self.myX=event.x-self.x
				end
				if (self.y > maypos) then
					self.y = maypos
					self.myY=event.y-self.y
				elseif (self.y < mayminuspos) then
					self.y = mayminuspos
					self.myY=event.y-self.y
				end
				--pointcentrex=(-self.x+actualcontentwidth/2)/taille
				--pointcentrey=(-self.y+actualcontentheight/2)/taille
				vitessex=vitessex*9*0.1+(self.x-posx)*0.1
				vitessey=vitessey*9*0.1+(self.y-posy)*0.1
				local calc=duredep1-duredep
				if calc>10 then
					vitessex=vitessex*1/(calc^(1/5))
					vitessey=vitessey*1/(calc^(1/5))
				end
				duredep=duredep1
			end
		end
end
--function background:tap(event)
	--print("tap sur background")
--end
--background:addEventListener( "tap", background )

background.myX=0
background.myY=0
local eventbis={}
if objet==0 then
	background.distance=15--min 6 zoom max, zoom min 23-----------------hugo-------------
	eventbis.x=100
	eventbis.y=200
	ZOOMMAX=2
elseif objet==1 then
	background.distance=23--0
	eventbis.x=-10000
	eventbis.y=10000
	--ZOOMMAX=4
elseif objet==2 then
	background.distance=0 --23
	eventbis.x=0 --1000000 -- -10000
	eventbis.y=0 --1000000 -- 10000
end----------------------------------------------------------------------hugo------------------------

--eventbis.x=100
--eventbis.y=200
background.xScaleOriginal=background.xScale
background.yScaleOriginal=background.yScale

local function doubleclic(xclic,yclic)
	--print("double clic")
	--print("taille"..taille.."ZOOMMAX"..ZOOMMAX.."ZOOMMIN"..ZOOMMIN)
	background.xScaleOriginal=background.xScale
	background.yScaleOriginal=background.yScale
	--background.myX=0
	--background.myY=0
	background.distance=10
	eventbis.x=xclic--actualcontentwidth/2
	eventbis.y=yclic--actualcontentheight/2
	background.myX =0-- eventbis.x-background.x
	background.myY =0-- eventbis.y-background.y
	if (taille-ZOOMMIN)>=((ZOOMMAX-ZOOMMIN)*0.5) then
		eventbis.x=contentcenterx--actualcontentwidth/2
		eventbis.y=contentcentery--actualcontentheight/2
		zoomdrag(background,eventbis,nil,2,2)
	else
		eventbis.x=xclic--actualcontentwidth/2
		eventbis.y=yclic--actualcontentheight/2
		zoomdrag(background,eventbis,nil,2,3)
	end
	--print("action")
	--zoomdrag(background,eventbis,nil,2,1)
end
function background:touch( event )
	local result = true
	 
	local phase = event.phase
 
	local previousTouches = self.previousTouches
 
	local numTotalTouches = 1
	if ( previousTouches ) then
		-- add in total from previousTouches, subtract one if event is already in the array
		numTotalTouches = numTotalTouches + self.numPreviousTouches
		if previousTouches[event.id] then
			numTotalTouches = numTotalTouches - 1
		end
	end
 
	if "began" == phase and (not generalenmov or not generalenmov1) and (not solenmov or not solenmov1) then
		retinf.nbaction=retinf.nbaction+1
		-- print("retinf.nbaction "..retinf.nbaction)
		--print("began")
		--clic=0
		if solenmov and not solenmov1 then
			display.getCurrentStage():setFocus( nil )
			removesoldrap()
			--self.isFocus = false
			--if solenmov then
				--local event1=event
				--event1.phase="ended"
				--soldatdeplacer(event1,self)
			--end
			solenmov=false
		end
		if generalenmov and not generalenmov1 then
			display.getCurrentStage():setFocus( nil )
			if genedrap~=nil then
				group[genedrap.group]:remove(genedrap)
				genedrap:removeSelf()
				genedrap=nil
				genetap=0
			end
			generalenmov=false
		end

		-- pouvoir focus
		dist=0
		orix=self.x
		oriy=self.y
		transition.cancel(maptrans)
		--timer.cancel(inertieyb)
		--timer.cancel(inertiexb)
		if ( not self.isFocus ) then
			-- Subsequent touch events will target button even if they are outside the contentBounds of button
			display.getCurrentStage():setFocus( self )
			self.isFocus = true
			self.myX = event.x-self.x
			self.myY = event.y-self.y
 			xstart=event.x
 			ystart=event.y
			previousTouches = {}
			self.previousTouches = previousTouches
			self.numPreviousTouches = 0
		elseif ( not self.distance ) then
			local dx,dy
 
			if previousTouches and ( numTotalTouches ) >= 2 then
				dx,dy = calculateDelta( previousTouches, event )
			end
 
			-- initialize to distance between two touches
			if ( dx and dy ) then
				local d = mathsqrt( dx*dx + dy*dy )
				if ( d > 0 ) then
					self.distance = d
					self.xScaleOriginal = self.xScale
					self.yScaleOriginal = self.yScale
				end
			end
		end
 
		if not previousTouches[event.id] then
			self.numPreviousTouches = self.numPreviousTouches + 1
		end
		previousTouches[event.id] = event
 
	elseif self.isFocus then
		if "moved" == phase then
			zoomdrag(self,event,previousTouches,numTotalTouches,0)
			if not previousTouches[event.id] then
				self.numPreviousTouches = self.numPreviousTouches + 1
			end
			previousTouches[event.id] = event
 
		elseif "ended" == phase or "cancelled" == phase then
		--print("dist"..dist)
		if dist<1 then --80 then--clic sur la carte
			numclic=numclic+1
			if numclic==1 then
				clicx=event.x
				clicy=event.y
				local function clicsimple( event )
					numclic=0
				end
				clicsimple=timer.performWithDelay( 300, clicsimple )
			else

				numclic=0
				--print("distance:"..((event.x-clicx)^2+(event.y-clicy)^2))
				if 500>((event.x-clicx)^2+(event.y-clicy)^2) then--calibrer les valeurs
					local agir=true
					 if findelapartie==false then --a finir
					 	if clicsurqqc==true then
					 		agir=false
					 	end
					 end
					-- 	local positionx	= event.x/taille - self.myX
					-- 	local positiony = event.y/taille - self.myY
					-- 	local cercle=display.newCircle(positionx,positiony,5)
					-- 	background:insert(cercle)
					-- 	for i=1,nbbatiment do
					-- 		print("distbat"..((ibatiment[i].x-positionx)^2+(ibatiment[i].y-positiony)^2))
					-- 		if 1000<((ibatiment[i].x-positionx)^2+(ibatiment[i].y-positiony)^2) then
					-- 			agir=1
					-- 		end
					-- 	end 
					-- end
					if agir==true then
						doubleclic(event.x,event.y)
					end
				end
			end
			-- end
		end
			local objx=self.x+ampli*vitessex
			local objy=self.y+ampli*vitessey
			local pourcent=0
			if objx>maxpos then
				local distance=maxpos-self.x
				pourcent=distance/(mathabs(ampli*vitessex))
				objx=maxpos
			elseif objx < maxminuspos then
				local distance=self.x-maxminuspos
				pourcent=distance/(mathabs(ampli*vitessex))
				objx=maxminuspos
			end
			if (objy > maypos) then
				local distance=maypos-self.y
				pourcent=distance/(mathabs(ampli*vitessey))
				objy=maypos
			elseif (objy < mayminuspos) then
				local distance=self.y-mayminuspos
				pourcent=distance/(mathabs(ampli*vitessey))
				objy=mayminuspos
			end 
			local latranstition
			--print("pourcent: "..pourcent.." vitessex:"..vitessex.." vitessey:"..vitessey)
			if pourcent==0 then
				latranstition=easing.outCirc
			elseif pourcent<25 then
				latranstition=easing.outCubic
			elseif pourcent<50 then 
				latranstition=easing.outQuad
			elseif pourcent<100 then
				latranstition=easing.outSine
			else
				latranstition=easing.linear
			end
			local letime=10*(vitessex*vitessex+vitessey*vitessey)
			if letime<500 then
				letime=500
			end
			maptrans=transition.to( self, { x=objx, y=objy, time=letime ,transition=latranstition } ) --a mettre en place pour gain dde fluidité
			vitessey=0
			vitessex=0
			-- local function veriftest(event)
			-- 	if (self.y > maypos) then
			-- 		transition.cancel(maptrans)
			-- 		self.y = maypos
			-- 	elseif (self.y < mayminuspos) then
			-- 		self.y = mayminuspos
			-- 		transition.cancel(maptrans)
			-- 	end
			-- 		if (self.x > maxpos) then
			-- 		self.x = maxpos
			-- 		transition.cancel(maptrans)
			-- 	elseif (self.x < maxminuspos) then
			-- 		self.x = maxminuspos
			-- 		transition.cancel(maptrans)
			-- 	end
			-- end
			-- --maptrans:addEventListener()
			-- Runtime:addEventListener("enterFrame",veriftest)
			-- local dure1=system.getTimer()-duredep
			-- function inertiey( event )
			-- 	vitessey=vitessey*(inertiecst-0.04+0.04/apparence)----0.5
			-- 	self.y=self.y+ampli*vitessey
			-- 	if (self.y > maypos) then
			-- 		self.y = maypos
			-- 		--vitessex=0
			-- 		vitessey=0
			-- 		--self.myY=event.y-self.y
			-- 	elseif (self.y < mayminuspos) then
			-- 		self.y = mayminuspos
			-- 		--vitessex=0
			-- 		vitessey=0
			-- 		--self.myY=event.y-self.y
			-- 	end
			-- 	if vitessey>0.1 or vitessey<-0.1 then--0.3
			-- 		inertieyb=timer.performWithDelay( dure, inertiey )
			-- 	end
			-- end
			-- if dure1<10 then 
			-- 	inertiey1=timer.performWithDelay( dure, inertiey )
			-- end

			-- function inertiex( event )
			-- 	vitessex=vitessex*(inertiecst-0.04+0.04/apparence)---0.5
			-- 	self.x=self.x+ampli*vitessex
			-- 	if (self.x > maxpos) then
			-- 		self.x = maxpos
			-- 		vitessex=0
			-- 		--vitessey=0
			-- 		--self.myX=event.x-self.x
			-- 	elseif (self.x < maxminuspos) then
			-- 		self.x = maxminuspos
			-- 		vitessex=0
			-- 	end
			-- 	if vitessex>0.1 or vitessex<-0.1 then
			-- 		inertiexb=timer.performWithDelay( dure, inertiex )
			-- 		--print("1")
			-- 	end
			-- end
			-- if dure1<10 then
			-- 	inertiex1=timer.performWithDelay( dure, inertiex )
			-- end
			
			if previousTouches[event.id] then
				self.numPreviousTouches = self.numPreviousTouches - 1
				previousTouches[event.id] = nil
			end
 
			if ( #previousTouches > 0 ) then
				-- must be at least 2 touches remaining to pinch/zoom
				self.distance = nil
			else
				display.getCurrentStage():setFocus( nil )
 
				self.isFocus = false
				self.distance = nil
				self.xScaleOriginal = nil
				self.yScaleOriginal = nil
 
				-- reset array
				self.previousTouches = nil
				self.numPreviousTouches = nil
				--[[local index = table.indexOf( self.dots, e.target )  -- get index of dot to be removed       ZOOM sur le centre part3
            	table.remove( self.dots, index )  -- remove dot from list
            	e.target:removeSelf()  -- remove tracking dot from the screen
            	-- store the new centre of all touch points
            	self.prevCentre = calcAvgCentre( self.dots )]]
			end
		end
	end
 
	return result
end
background:addEventListener( "touch", background )
-- Determine if running on Corona Simulator
--

zoomdrag(background,eventbis,1,2,1)
background.distance=nil

zoomdrag(background,eventbis,1,1,1)
if niveauch==2 then
	eventbis.x=-10000
	eventbis.y=-10000
elseif niveauch==3 or niveauch==11 or (niveauch==15 and goh) then
	eventbis.x=-10000
elseif niveauch==17 or niveauch==14 or (niveauch==16 and not goh) then
	local function doubledoubleclic(event)
		doubleclic(-300,-300)
		doubleclic(-300,-300)
		--eventbis.x=-10000
	end
	local whatever=timer.performWithDelay( 30, doubledoubleclic)
	eventbis.x=-10000
else --convient niveau 1
	eventbis.x=10000
end
eventbis.x=eventbis.x+10
eventbis.y=eventbis.y+10
zoomdrag(background,eventbis,1,1,1)
eventbis.x=eventbis.x-10
eventbis.y=eventbis.y-10
zoomdrag(background,eventbis,1,1,1)
if multi~=0 then
	-- eventbis.x=100

	-- eventbis.y=1000
	-- print("decale la carte")
	-- for i=0,200 do
	-- 	zoomdrag(background,eventbis,1,1,1)
	-- end
	--print("in")
	
	doubleclic(300,300)
	doubleclic(300,300)
	taille=ZOOMMIN
	maxpos=xminscreen+maxpos2*taille--maxpos1*taille
	maypos=yminscreen+maypos2*taille--maypos1*taille
	maxminuspos=xmaxscreen+maxminuspos2*taille
	mayminuspos=ymaxscreen+mayminuspos2*taille
	background.xScale = taille--self.xScaleOriginal * scale
	background.yScale =taille-- self.yScaleOriginal * scale
	background.y= maypos
	background.x=(maxminuspos+maxpos)*0.5
end
local isSimulator = "simulator" == system.getInfo("environment")

end
local function keyaction(x,y)
	local eventbis={}
	eventbis.x=background.x+x
	eventbis.y=background.y+y
	zoomdrag(background,eventbis,1,1,1)
end
local keypress={}
for i=1,4 do
	keypress[i]=false
end
local keypressdowntt=false
local cptkeypress=0
local function bougefleche(event)
	local x=0
	local y=0
	local keypressdown=false
	if keypress[1] then
		y=7
		keypressdown=true
	end
	if keypress[2] then
		y=y-7
		keypressdown=true
	end
	if keypress[3] then
		x=7
		keypressdown=true
	end
	if keypress[4] then
		x=x-7
		keypressdown=true
	end
	if keypressdown then
		cptkeypress=cptkeypress+1
		keyaction(x*(1+cptkeypress*0.2),y*(1+cptkeypress*0.2))
		keypressdowntt=true
		timer.performWithDelay( 50,bougefleche)
	else
		cptkeypress=0
		keypressdowntt=false
	end
end

function onKeyEvent( event )
	if background~=nil then
	if ( event.keyName == "up") then
		if ( event.phase == "down" ) then
			keypress[1]=true
			if not keypressdowntt then
				bougefleche()
			end
		else
			keypress[1]=false
		end	
		return true
	elseif ( event.keyName == "down") then
		if ( event.phase == "down" ) then
			keypress[2]=true
			if not keypressdowntt then
				bougefleche()
			end
		else
			keypress[2]=false
		end
		return true
	elseif ( event.keyName == "left") then
		if ( event.phase == "down" ) then
			keypress[3]=true
			if not keypressdowntt then
				bougefleche()
			end
		else
			keypress[3]=false
		end
		return true
	elseif ( event.keyName == "right") then
		if ( event.phase == "down" ) then
			keypress[4]=true
			if not keypressdowntt then
				bougefleche()
			end
		else
			keypress[4]=false	
		end
		return true
	end
	end
    -- IMPORTANT! Return false to indicate that this app is NOT overriding the received key
    -- This lets the operating system execute its default handling of the key
    return false
end
Runtime:addEventListener( "key", onKeyEvent )
return(t)