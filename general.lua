local t = {}--gestion du general
--
t.general = function ()
	local compteuropt=0
	--print("123")
	local function testautorisation(self)
		local autorise=1
		if self.y+30<mayminuspos2+30 or self.y+30>maypos2-30 or self.x<maxminuspos2+30 or self.x>maxpos2-30 then
			autorise=2
		end
		if autorise==1 then
			if modezombie or modepanique then
				autorise=0
				if autorise==0 then
					local i=1
					while i<=obstaclenb do
					--for i=1,obstaclenb,1 do--wandrille le 11 correspond au nb de point de collision (obstacle)------------------------------------------------------------------------------------------------------------
						if 3000>((self.x-obstacle[i].x)*(self.x-obstacle[i].x)+(self.y+30-obstacle[i].y)*(self.y+30-obstacle[i].y))then
							autorise=1
							i=obstaclenb+1
						end
						i=i+1
					end
				end
				if autorise==0 then
					local i=1
					while i<=obstacle1nb do
					--for i=1,obstacle1nb,1 do--wandrille le 1 correspond au nb de point de collison(obstacle1)----------------------------------------------------------------------------------------------------------------
						if 20000>((self.x-obstacle1[i].x)*(self.x-obstacle1[i].x)+(self.y+30-obstacle1[i].y)*(self.y+30-obstacle1[i].y))then
							autorise=1
							i=obstacle1nb+1
						end
						i=i+1
					end
				end
				if autorise==0 then
					if obstacle0nb>=1 then
						local i=1
						while i<=obstacle0nb do
							local rayon=500
							if obstacle0[i].rayon~=nil then
								rayon=obstacle0[i].rayon
							end
							if rayon>((self.x-obstacle0[i].x)*(self.x-obstacle0[i].x)+(self.y+30-obstacle0[i].y)*(self.y+30-obstacle0[i].y))then
								autorise=1
								i=obstacle0nb+1
							end
							i=i+1
						end
					end
				end
			else
				local i=2
				if not goh then
					while i<=cheminnb+1 do
					--for i=1, cheminnb+1,1 do
						local rayonauto=2000
						if chemin[i].rayon~=nil then 
							rayonauto=chemin[i].rayon
						end
						if rayonauto>((self.x-chemin[i].x)*(self.x-chemin[i].x)+(self.y-chemin[i].y)*(self.y-chemin[i].y))then
							autorise=0
						end
						i=i+1
					end
				else
					while i<=cheminnb+1 do
						local coef=1
						if chemin[i].mechant~=nil and not modepanique then
							if chemin[i].mechant>1 or goh then
								coef=chemin[i].mechant*chemin[i].mechant
							end
						end
						if 400*coef*cheminlargeur>((self.x-chemin[i].x)*(self.x-chemin[i].x)+(self.y-chemin[i].y)*(self.y-chemin[i].y))then
							autorise=0
						end
						i=i+1
					end
				end
			end
		end
		if autorise==2 then
			autorise=1
		end
		if autorise==0 then
			local i=1
			while i<=nbbatiment do
			--for i=1,nbbatiment do//for remplacer par while
				if ibatiment[i]~=nil then
					if ibatiment[i].x1~=nil and ibatiment[i].y1~=nil and self.x~=nil and self.y~=nil then
						if 1500>(self.x-ibatiment[i].x1)*(self.x-ibatiment[i].x1)+(self.y-ibatiment[i].y1)*(self.y-ibatiment[i].y1) then
							autorise=1
							i=nbbatiment+1
						end
					end
				end
				i=i+1
			end
		end
		return autorise
	end
	if true then
		local function drapeautap()--clic sur le drapeau de localisation du general
			if  fenaff==false and  clicpause==0 then
				if clicconstruire==0 then
					if pv1clicactiver==1 then
						Runtime:removeEventListener( "tap",clicpv1)
						group[2048]:remove(pv1affinter)
						pv1affinter:removeSelf()
						pv1affinter=nil
						pv1clicactiver=0
						pvaction.isVisible=false
					end
					if pv2clicactiver==1 then
						Runtime:removeEventListener( "tap",clicpv2)
						pv2clicactiver=0
						pvaction.isVisible=false
					end
					--priortié face au pouvoir 3 n'est pas faite!

					drapeaugeneclic=1
					local function drapeaugeneclic1( event )
						drapeaugeneclic=0
					end
					drapeaugeneclic1=timer.performWithDelay( 50, drapeaugeneclic1 )
					if boutondev==1 then
						local batiment = require( "batiment" )
						batiment.supbouton()
					end
					--print(321)
				
					genepoint.x=drapeau1.x
					genepoint.y=drapeau1.y
					print("distancegene nouveau drap "..mathsqrt(((genepoint.x-isoldat[genenum].x1)^2+(genepoint.y-isoldat[genenum].y1)^2)))
					if isoldat[genenum].vivant then
						if mathsqrt(((genepoint.x-isoldat[genenum].x1)^2+(genepoint.y-isoldat[genenum].y1)^2))>60 then
							if isoldat[genenum].encombat==1 then
								isoldat[genenum].vivant=false
								isoldat[genenum].endeplacement=1
							end
						end
					end
					-- local k=1
					-- while k<=nbsoldat do
					-- 	if isoldat[k].gene==1 then
					-- 		if isoldat[k].encombat==1 then
					-- 			isoldat[k].vivant=false
					-- 			isoldat[k].endeplacement=1
					-- 		end
					-- 		k=nbsoldat+1
					-- 	end
					-- 	k=k+1
					-- end
					if genedrap~=nil then
						group[genedrap.group]:remove(genedrap)
						genedrap:removeSelf()
						genedrap=nil
						genetap=0
					else
						--print("bug genedrap")
					end
				end
			end
			if genedrap~=nil then
				group[genedrap.group]:remove(genedrap)
				genedrap:removeSelf()
				genedrap=nil
				genetap=0
			end
		end
		generalenmov=false
		local var,xori,yori,self
		local self1={}
		local selfori={}
		function generalmove(event,self)--test de function
			--print("dans la fonction")
			if genetap==0 then
				if "began" ==event.phase and not fenaff and not generalenmov then
					print("began")
					var=0
					self1.x=self.x
					self1.y=self.y
					selfori.x=self.x
					selfori.y=self.y
					--display.currentStage:setFocus(event.target)
					--display.getCurrentStage():setFocus(event.target)
					--event.target.isFocus = true
					--self=event.target
					clicsurqqcfunc()
					geneclic=1
					local function geneclic1( event )
						geneclic=0
					end
					if(enconst==1)then--corrige le probleme uniquement quand on clique pas en meme temps sur pouvoir et valider
						removenbat()
					end
					geneclic1=timer.performWithDelay( 50,geneclic1 )
					if fenaff==false and  clicpause==0 and pv1clic==0 and pv2clic==0 and pv3clic==0 and clicconstruire==0 and clicinfanterie==0 and clicarcher==0 and clicpouvoir1==0 and clicpouvoir2==0 and clicpouvoir3==0 and pv2clicactiver==0 and pv1clicactiver==0 and boutondev==0 and drapeausolclic==0 then 
						generalenmov=true
						var=0
						self1.x=self.x
						self1.y=self.y
						-- xori=self1.x
						-- yori=self1.y
					end
					if genedrap~=nil then
						group[genedrap.group]:remove(genedrap)
						genedrap:removeSelf()
						genedrap=nil
						genetap=0
					end
				elseif "moved" ==event.phase and not fenaff and generalenmov then
					print("move "..event.x)
					var=var+(event.x-event.xStart)^2+(event.x-event.yStart)^2
					if var>=500 and genedrap==nil then
						hideConstrucButton()
						genedrap=display.newGroup()
						genedrap.group=2048
						group[genedrap.group]:insert(genedrap)
						drapeau1=display.newImage(imbouton.batiment,9) --imbouton.drapeau,1)
						--drapeau1=display.newImage("choniveau/niv1.png", genepoint.x,genepoint.y,true)
						drapeau1.x=self1.x --event.x/taille-self.x
						drapeau1.y=self1.y --event.y/taille-self.y
						drapeau1.xScale=0.15
						drapeau1.yScale=0.15
						genedrap:insert(drapeau1)
						--geneconfirm.num=event.target.num
						genedrapold=display.newImage(imbouton.batiment,9) -- imbouton.drapeau,1)--display.newImage("choniveau/niv1.png", genepoint.x,genepoint.y,true)
						genedrapold.x=genepoint.x
						genedrapold.y=genepoint.y
						genedrapold.xScale=0.15*apparence
						genedrapold.yScale=0.15*apparence
						genedrapold.alpha=0.5
						genedrap:insert(genedrapold)
					end
					if genedrap~=nil then
						self1.x =selfori.x+(event.x-event.xStart)/taille -- - self1.x --event.xStart
						self1.y =selfori.y+(event.y-event.yStart)/taille -- - self1.y --event.yStart
						local autorise=testautorisation(self1)
						if autorise==0 then
							drapeau1.x=self1.x
							drapeau1.y=self1.y
						else
							compteuropt=compteuropt+1
							if compteuropt>2 then
								compteuropt=0
								local xdirec=1
								if drapeau1.x>self1.x then
									xdirec=-1
								end
								local ydirec=1
								if drapeau1.x>self1.y then
									ydirec=-1
								end
								local distancemin=(self1.x-drapeau1.x)*(self1.x-drapeau1.x)+(self1.y-drapeau1.y)*(self1.y-drapeau1.y)
								if distancemin>1000 then --1000
									local limitex1carre=drapeau1.x+30*(-xdirec)
									local limitex2carre=self1.x+30*(xdirec)
									local limitey1carre=drapeau1.y+30*(-ydirec)
									local limitey2carre=self1.y+30*(ydirec)
									local ancienxvalide=drapeau1.x
									local ancienyvalide=drapeau1.y
									local testposbat={}
									testposbat.x=drapeau1.x
									testposbat.y=drapeau1.y
									local i=limitex1carre
									local varrandx=mathfloor(mathabs(limitex1carre-limitex2carre)*0.1)
									if varrandx<1 then
										varrandx=1
									end
									local varrandy=mathfloor(mathabs(limitey1carre-limitey2carre)*0.1)
									if varrandy<1 then
										varrandy=1
									end
									while i*xdirec<limitex2carre*(xdirec) do
										testposbat.x=i
										local j=limitey1carre
										while j*ydirec<limitey2carre*(ydirec) do
											testposbat.y=j
											local autorise1=testautorisation(testposbat)
											if autorise1==0 then
												local distancemintest=(self1.x-testposbat.x)*(self1.x-testposbat.x)+(self1.y-testposbat.y)*(self1.y-testposbat.y)
												if distancemin>distancemintest then
													distancemin=distancemintest
													ancienxvalide=testposbat.x
													ancienyvalide=testposbat.y
												end
											end
											j=j+varrandy*ydirec
										end
										i=i+varrandx*(xdirec)
									end
									drapeau1.x=ancienxvalide
									drapeau1.y=ancienyvalide
								end
							end
						end
					end
				elseif generalenmov then
					generalenmov=false
					--event.target.isFocus=false
					--display.getCurrentStage:setFocus(nil)
					if genedrap~=nil then --if var>500 then
						drapeautap()
					-- else
					-- 	if genedrap~=nil then
					-- 		group[genedrap.group]:remove(genedrap)
					-- 		genedrap:removeSelf()
					-- 		genedrap=nil
					-- 	end
					end
				end
			else
				print("genetap"..genetap)
				if genedrap~=nil then
				group[genedrap.group]:remove(genedrap)
				genedrap:removeSelf()
				genedrap=nil
				genetap=0
			end
			end
		end
	end
	function genetaptest(event)

		--function geneb:tap(event)--gestion de clic sur le general permettant de choisir la position du general
		clicsurqqcfunc()
		print("clic sur gene")
		if fenaff==false then
			geneclic=1
			local function geneclic1( event )
				geneclic=0
			end
			if(enconst==1)then--corrige le probleme uniquement quand on clique pas en meme temps sur pouvoir et valider
				removenbat()
			end
			geneclic1=timer.performWithDelay( 50,geneclic1 )
			--print("dans 1")
			if fenaff==false and  clicpause==0 and pv1clic==0 and pv2clic==0 and pv3clic==0 and clicconstruire==0 and clicinfanterie==0 and clicarcher==0 and clicpouvoir1==0 and clicpouvoir2==0 and clicpouvoir3==0 and pv2clicactiver==0 and pv1clicactiver==0 and boutondev==0 and drapeausolclic==0 then 
				--print("dans 2")
				if genetap==0 then
					local function genetap1( event )
						genetap=1
					end
					genetap1=timer.performWithDelay( 50,genetap1 )
					--print("yolooo")
					genedrap=display.newGroup()
					genedrap.group=2048
					group[genedrap.group]:insert(genedrap)
					drapeau1=display.newImage(imbouton.batiment,9) --imbouton.drapeau,1)
					--drapeau1=display.newImage("choniveau/niv1.png", genepoint.x,genepoint.y,true)
					drapeau1.x=genepoint.x
					drapeau1.y=genepoint.y
					if genepoint.x==nil then
						genepoint.x=isoldat[genenum].x or isoldat[genenum].x1 or 0 
					end
					if genepoint.y==nil then
						genepoint.y=isoldat[genenum].y or isoldat[genenum].x1 or 0
					end
					drapeau=display.newRect(genepoint.x, genepoint.y, 45, 45 )
					drapeau.alpha=0.01
					drapeau.xScale=1/taille*apparence--pour que sur un tel ca soit plus facile de le deplacer.
					drapeau.yScale=1/taille*apparence
					drapeau1.xScale=0.15
					drapeau1.yScale=0.15
					genedrap:insert(drapeau1)
					genedrap:insert(drapeau)
					geneconfirm=display.newImage(imbouton.batiment,11) -- imbouton.valider,1)--display.newImage("bouton/valider.png",genepoint.x,genepoint.y)
					geneconfirm.x=genepoint.x
					geneconfirm.y=genepoint.y
					geneconfirm.xScale=0.1*apparence
					geneconfirm.yScale=0.1*apparence
					geneconfirm.isVisible=false
					geneconfirm.num=event.target.num
					genedrap:insert(geneconfirm)
					genedrapold=display.newImage(imbouton.batiment,9) -- imbouton.drapeau,1)--display.newImage("choniveau/niv1.png", genepoint.x,genepoint.y,true)
					genedrapold.x=genepoint.x
					genedrapold.y=genepoint.y
					genedrapold.xScale=0.15*apparence
					genedrapold.yScale=0.15*apparence
					genedrapold.alpha=0.5
					genedrap:insert(genedrapold)
					local function drapeautap()--clic sur le drapeau de localisation du general
						if  fenaff==false and  clicpause==0 and geneconfirm.isVisible==true and geneclic==0 then
							if clicconstruire==0 then
								if pv1clicactiver==1 then
									Runtime:removeEventListener( "tap",clicpv1)
									group[2048]:remove(pv1affinter)
									pv1affinter:removeSelf()
									pv1affinter=nil
									pv1clicactiver=0
									pvaction.isVisible=false
								end
								if pv2clicactiver==1 then
									Runtime:removeEventListener( "tap",clicpv2)
									pv2clicactiver=0
									pvaction.isVisible=false
								end
								--priortié face au pouvoir 3 n'est pas faite!

								drapeaugeneclic=1
								local function drapeaugeneclic1( event )
									drapeaugeneclic=0
								end
								drapeaugeneclic1=timer.performWithDelay( 50, drapeaugeneclic1 )
								if boutondev==1 then
									local batiment = require( "batiment" )
									batiment.supbouton()
								end
								--print(321)
							
								genepoint.x=drapeau1.x
								genepoint.y=drapeau1.y
								--print("distancegene nouveau drap "..mathsqrt(((genepoint.x-isoldat[genenum].x1)^2+(genepoint.y-isoldat[genenum].y1)^2)))
								if isoldat[genenum].vivant then
									genepoint.x=genepoint.x or isoldat[genenum].x1
									genepoint.y=genepoint.y or isoldat[genenum].y1
									if mathsqrt(((genepoint.x-isoldat[genenum].x1)^2+(genepoint.y-isoldat[genenum].y1)^2))>60 then
										if isoldat[genenum].encombat==1 then
											isoldat[genenum].vivant=false
											isoldat[genenum].endeplacement=1
										end
									end
								end
								-- local k=1
								-- while k<=nbsoldat do
								-- 	if isoldat[k].gene==1 then
								-- 		if isoldat[k].encombat==1 then
								-- 			isoldat[k].vivant=false
								-- 			isoldat[k].endeplacement=1
								-- 		end
								-- 		k=nbsoldat+1
								-- 	end
								-- 	k=k+1
								-- end
								if genedrap~=nil then
								group[genedrap.group]:remove(genedrap)
								genedrap:removeSelf()
								genedrap=nil
								genetap=0
								else
									--print("bug genedrap")
								end
							end
						end
					end
					function drapeau:touch( event )--deplacement du drapeau
						--print("1")
						print("drapeau touch")
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

						if "began" == phase then
							retinf.nbaction=retinf.nbaction+1
							-- Very first "began" event
							if ( not self.isFocus ) then
								-- Subsequent touch events will target button even if they are outside the contentBoundss of button
								display.getCurrentStage():setFocus( self )
								self.isFocus = true
								--miko collect values for panning

								self.myX = event.x/taille-self.x-- event.x/(taille^0.55)-self.x------------------------------------a modifier ici ou plus bas
								self.myY = event.y/taille-self.y----------------probleme du a taille qui vaut 1 par defaut alors qu'il devrait valoir (?)
								geneconfirm.isVisible=false
								--Collision detection
						
								previousTouches = {}
								self.previousTouches = previousTouches
								self.numPreviousTouches = 0
							elseif ( not self.distance ) then
								local dx,dy
					 
								-- initialize to distance between two touches
								
							end
					 
							if not previousTouches[event.id] then
								self.numPreviousTouches = self.numPreviousTouches + 1
							end
							previousTouches[event.id] = event
								var=0
								xori=self.x
							yori=self.y
						elseif self.isFocus then
							if "moved" == phase then
								if ( self.distance ) then
									local dx,dy			
								else
									--self.myx coordonnée de depart
									var=var+(self.x-xori)^2+(self.y-yori)^2
									self.x = event.x/taille - self.myX
									self.y = event.y/taille - self.myY
									--drapeau1.x=self.x
									--drapeau1.y=self.y
									local autorise=testautorisation(self)
									-- local autorise=1
									-- 	for i=1, cheminnb+1,1 do
									-- 		if 2000>((self.x-chemin[i].x)^2+(self.y-chemin[i].y)^2)then
									-- 			autorise=0
									-- 		end
									-- 	end
										--self.x, self.y = x, y
									if autorise==0 then
										drapeau1.x=self.x
										--if drapeau1.y~=self.y then
											drapeau1.y=self.y
											--group[drapeau1.pos]:remove( drapeau1 )
											--drapeau1.pos=mathfloor(drapeau1.y)+1024
											--group[drapeau1.pos]:insert( drapeau1 )
										--end
									else
										compteuropt=compteuropt+1
										if compteuropt>2 then
											--print("compteur==30")
											compteuropt=0
											local xdirec=1
											if drapeau1.x>self.x then
												xdirec=-1
											end
											local ydirec=1
											if drapeau1.x>self.y then
												ydirec=-1
											end
											local distancemin=(self.x-drapeau1.x)*(self.x-drapeau1.x)+(self.y-drapeau1.y)*(self.y-drapeau1.y)
											if distancemin>1000 then --1000
												local limitex1carre=drapeau1.x+30*(-xdirec)
												local limitex2carre=self.x+30*(xdirec)
												local limitey1carre=drapeau1.y+30*(-ydirec)
												local limitey2carre=self.y+30*(ydirec)
												local ancienxvalide=drapeau1.x
												local ancienyvalide=drapeau1.y
												local testposbat={}
												testposbat.x=drapeau1.x
												testposbat.y=drapeau1.y
												local i=limitex1carre
												local varrandx=mathfloor(mathabs(limitex1carre-limitex2carre)*0.1)
												if varrandx<10 then
													varrandx=10
												end
												local varrandy=mathfloor(mathabs(limitey1carre-limitey2carre)*0.1)
												if varrandy<10 then
													varrandy=10
												end
												while i*xdirec<limitex2carre*(xdirec) do
													testposbat.x=i
													local j=limitey1carre
													while j*ydirec<limitey2carre*(ydirec) do
														testposbat.y=j
														local autorise1=testautorisation(testposbat)
														if autorise1==0 then
															local distancemintest=(self.x-testposbat.x)*(self.x-testposbat.x)+(self.y-testposbat.y)*(self.y-testposbat.y)
															if distancemin>distancemintest then
																distancemin=distancemintest
																ancienxvalide=testposbat.x
																ancienyvalide=testposbat.y
																--print("trouver meilleur position "..distancemin)
																--print("x"..ancienxvalide.." y "..ancienyvalide)
															end
														end
														j=j+varrandy*ydirec
													end
													i=i+varrandx*(xdirec)
													--print("i="..i)
												end
												drapeau1.x=ancienxvalide
												drapeau1.y=ancienyvalide
											end
										end
									end
									-- local ptx=1--point ou on a la dist min
									-- local pty=1
									-- local distxmin=(self.x-chemin[1].x)^2
									-- local distymin=(self.y-chemin[1].y)^2
									-- local disttt=(self.x-chemin[1].x)^2+(self.y-chemin[1].y)^2
									-- local pttt=1
									-- local calc=nil
								end

								if not previousTouches[event.id] then
									self.numPreviousTouches = self.numPreviousTouches + 1
								end
								previousTouches[event.id] = event
							elseif "ended" == phase or "cancelled" == phase then
								if previousTouches[event.id] then
									self.numPreviousTouches = self.numPreviousTouches - 1
									previousTouches[event.id] = nil
								end

								if ( #previousTouches > 0 ) then
									-- must be at least 2 touches remaining to pinch/zoom
									self.distance = nil
								else
									-- previousTouches is empty so no more fingers are touching the screen
									-- Allow touch events to be sent normally to the objects they "hit"
									display.getCurrentStage():setFocus( nil )
									self.isFocus = false
									self.distance = nil
									self.xScaleOriginal = nil
									self.yScaleOriginal = nil
					 
									-- reset array
									self.previousTouches = nil
									self.numPreviousTouches = nil
								end
								self.x=drapeau1.x
								self.y=drapeau1.y
								geneconfirm.x=drapeau1.x
								geneconfirm.y=drapeau1.y
								geneconfirm.isVisible=true
								--if var<80 then
									drapeautap()
								--end
							end
						end

						return result
					end
					drapeau:addEventListener( "touch", drapeau )
					function drapeau:tap(event)
						clicsurqqcfunc()
						drapeautap()
					end
					drapeau:addEventListener("tap",drapeau)
				elseif genedrap~=nil then --ne fonctionne pas
					group[genedrap.group]:remove(genedrap)
					genedrap:removeSelf()
					genedrap=nil
					genetap=0
				end
			end
		end
	end
	-- if contreaihaut==0 or contreai==1 then --and contreaihaut==1) then
	-- 	--geneb:addEventListener( "tap", geneb )
	-- 	print("contreaihaut 1")
	-- else
	-- 	print("contreaihaut 0")
	-- end
end
return(t)