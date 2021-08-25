local t = {}--gestion des mines
function multicreation()
	if multi==1 or ( aiactive==1 and contreaihaut==1) then
		bpaccnorm()
	-- multigroup=display.newGroup()
	-- grpartie:insert(multigroup)
	--multibouton={}
	local zoombouton=apparence
	if zoombouton>=1.1 then
		zoombouton=zoombouton-0.1
	end
	ordrespawn={}
	if contreai==1 then
		local cpt=1
		local cpt1=1
		for i=1,100 do
			ordrespawn[i]={}
			ordrespawn[i].typeso=cpt1
			ordrespawn[i].entreselec=1
			ordrespawn[i].timer=cpt
			cpt=cpt+1
			cpt1=cpt1+1
			if cpt>10 then
				cpt=0.5
			end
			if cpt1>4 then
				cpt1=1
			end
		end
	end

	multiboutonclic=0 -- si on clique sur le bouton
	--local t = os.date( '*t' )
	premiersoldattime=0
	premiersoldat=0
	vaguenchargement=0
	numerotimer=nil
	numerotimer1=nil
	numerotimerai=nil
	vagueencours=1
	vagueinf.text=vagueencours
	multigroup,multibouton,multiboutontext,multiboutonbuste,multiboutonprix=affboutonspawn(xminscreen,yminscreen,150*zoombouton,mapmultisave,true)
	grpartie:insert(multigroup)
	multibouton.scale=multibouton[1].xScale
	for i=1,#multibouton do
		multibouton[i].typeso={}
		multibouton[i].typeso.nb=1
		multibouton[i].typeso[1]=savegamemulti.bouton[mapmultisave][i]
		multibouton[i].point=savegamemulti.bouton[mapmultisave][i+#multibouton]
	end
	-- multibouton[1]=display.newImage(immulti.bouton,1)
	-- multibouton[1].xScale=zoombouton
	-- multibouton[1].yScale=multibouton[1].xScale
	-- multibouton[1].x=xminscreen+multibouton[1].xScale*100*0.5+3
	-- multibouton[1].y=multibouton[1].yScale*50*0.5+3
	-- multibouton[1].typeso={}
	-- multibouton[1].typeso.nb=2
	-- multibouton[1].typeso[1]=210
	-- multibouton[1].typeso[2]=211
	-- multibouton[1].alpha=0.8
	-- multibouton.scale=multibouton[1].xScale
	-- multigroup:insert(multibouton[1])

	-- multibouton[2]=display.newImage(immulti.bouton,2)
	-- multibouton[2].xScale=multibouton[1].xScale
	-- multibouton[2].yScale=multibouton[1].xScale
	-- multibouton[2].x=multibouton[1].x --xminscreen+multibouton[1].xScale*100*0.5+3
	-- multibouton[2].y=3*multibouton[1].y
	-- multibouton[2].typeso={}
	-- multibouton[2].typeso.nb=5
	-- multibouton[2].typeso[1]=200
	-- multibouton[2].typeso[2]=202
	-- multibouton[2].typeso[3]=206
	-- multibouton[2].typeso[4]=214
	-- multibouton[2].typeso[5]=213
	-- multibouton[2].alpha=0.8
	-- multigroup:insert(multibouton[2])

	-- multibouton[3]=display.newImage(immulti.bouton,3)
	-- multibouton[3].xScale=multibouton[1].xScale
	-- multibouton[3].yScale=multibouton[1].xScale
	-- multibouton[3].x=multibouton[1].x--xminscreen+multibouton[1].xScale*100*0.5+3
	-- multibouton[3].y=5*multibouton[1].y
	-- multibouton[3].typeso={}
	-- multibouton[3].typeso.nb=8
	-- multibouton[3].typeso[1]=260
	-- multibouton[3].typeso[2]=261
	-- multibouton[3].typeso[3]=262
	-- multibouton[3].typeso[4]=263
	-- multibouton[3].typeso[5]=264
	-- multibouton[3].typeso[6]=265
	-- multibouton[3].typeso[7]=266
	-- multibouton[3].typeso[8]=267
	-- multibouton[3].alpha=0.8
	-- multigroup:insert(multibouton[3])

	-- multibouton[4]=display.newImage(immulti.bouton,4)
	-- multibouton[4].xScale=multibouton[1].xScale
	-- multibouton[4].yScale=multibouton[1].xScale
	-- multibouton[4].x=multibouton[1].x--xminscreen+multibouton[1].xScale*100*0.5+3
	-- multibouton[4].y=7*multibouton[1].y
	-- multibouton[4].typeso={}
	-- multibouton[4].typeso.nb=1
	-- multibouton[4].typeso[1]=204
	-- multibouton[4].alpha=0.8
	-- multigroup:insert(multibouton[4])
		multibouton[5]=display.newGroup()
		multibouton[5].bouton=display.newImage(imagemenu.boutonmultispawn,3)
		multibouton[5].bouton.xScale=lancervague1.xScale*lancervague1.width/multibouton[5].bouton.width
		multibouton[5].bouton.yScale=multibouton[5].bouton.xScale
		multibouton[5]:insert(multibouton[5].bouton)
		multibouton[5].text=display.newEmbossedText("Finish",0,0,fonttype,16*fontsize)
		multibouton[5].text:setEmbossColor(colortextemb)
		multibouton[5].text:setFillColor(0)
		multibouton[5]:insert(multibouton[5].text)
		multibouton[5].x=lancervague1.x
		multibouton[5].y=lancervague1.y
		multibouton[5].isVisible=false
		multigroup:insert(multibouton[5])
		
		multibouton[8]=display.newImage(imbouton.fondtunevie,1)
		multibouton[8].x=xminscreen+multibouton[1].xScale*multibouton[1].width+6+multibouton[8].xScale*multibouton[8].width*0.5--3*multibouton[1].x+3
		multibouton[8].yScale=0.9
		multibouton[8].y=25*multibouton[8].yScale
		multibouton[8].alpha=0.6
		multigroup:insert(multibouton[8])
		print("mapmultisave"..mapmultisave)
		print("numsavegame"..numsavegame)
		timermulti=savegameall.multidata[mapmultisave][numsavegame].timer --15
		timermulti1=0
		timermultitt=timermulti
		timerai=0
		multibouton[6]=display.newEmbossedText( "1m30", multibouton[8].x, 10,fonttype, 20*fontsize )
		multibouton[6]:setEmbossColor(colortextemb)
		multibouton[6]:setFillColor( 0.6, 0, 0 )
		multigroup:insert(multibouton[6])

		pointmulti=savegameall.multidata[mapmultisave][numsavegame].point --5
		pointmultiai=savegameall.multidata[mapmultisave][numsavegame].point --5
		multibouton[7]=display.newEmbossedText( "5 p", multibouton[8].x, 30,fonttype, 20*fontsize )
		multibouton[7]:setEmbossColor(colortextemb)
		multibouton[7]:setFillColor( 0.8, 0.8, 0 )
		multigroup:insert(multibouton[7])

		timervague=savegameall.multidata[mapmultisave][numsavegame].timervague --5
		timervague1=0
		timervaguett=timervague
		timervaguettt=0
		

		
		function multibouton1(event)
			findelapartie=true
			multibouton[5].isVisible=false
			if jeupause.etat==0 then 
				appuipause()
			end
			affmenuconf(4)
		end
		multibouton[5]:addEventListener("tap",multibouton1)

		entreselec=1 --entre selectionné
		vagsui.xScale=vagsui.scale*2
		vagsui.yScale=vagsui.xScale
		if contreai==1 then
			vagsuib[1].xScale=vagsui.xScale
			vagsuib[1].yScale=vagsui.xScale
		end
	end
	if contreai==1 and true then
		local aicoptspawn=1
		local function contraispawn(event)
			if removetotal==false then
				if removepartiel1==false then
					if premiersoldat==1 then
						timerai=timerai+0.5
						--print("timerai "..timerai)
						if timerai==ordrespawn[aicoptspawn].timer then
							if ordrespawn[aicoptspawn].typeso<=pointmultiai then
								local num=findnbsoldat(1)
								-- local varlib=0
								-- local num=nil
								-- local k=1
								-- while k<=nbsoldat do--permet de ralouer les numero
								-- 	if isoldat[k].remp==1 then
								-- 		varlib=1
								-- 		num=k
								-- 		k=nbsoldat+1
								-- 		--print("numero trouver")
								-- 	end
								-- 	k=k+1
								-- end
								-- if varlib==0 then
								-- 	nbsoldat=nbsoldat+1
								-- 	num=nbsoldat
								-- end
								local typeso=multibouton[ordrespawn[aicoptspawn].typeso].typeso[mathrandom(multibouton[ordrespawn[aicoptspawn].typeso].typeso.nb)]
								pointmultiai=pointmultiai-ordrespawn[aicoptspawn].typeso
								local hello=soldat1.new(num,typeso,0)
								hello:debut(num,ordrespawn[aicoptspawn].entreselec)
							else
								print("ai invalide: elle triche")
							end
							aicoptspawn=aicoptspawn+1
							--print("ordrespawn[aicoptspawn].timer "..ordrespawn[aicoptspawn].timer)
						end
					end
					contraispawn1=timer.performWithDelay( 500*vitessejeuin, contraispawn )
					local bla=timerpause(1,contraispawn1,numerotimerai)
				end
			end
		end
		contraispawn2=timer.performWithDelay( 500*vitessejeuin, contraispawn )
		numerotimerai=timerpause(1,contraispawn2,numerotimerai)
	end
	local function vaguefini( )--vague fini en temps ou en fric
		print("vaguenchargement "..vaguenchargement)
		if vaguenchargement==0 then
			local numerotimer=nil
			local timerdedebut=system.getTimer()
			timervaguettt=timervaguett+timermulti
			timervague=timervaguettt
			vaguenchargement=1
			timermulti=0
			local texttimermin=0
			local texttimersec=timervague
			if texttimersec>=60 then
				texttimermin=texttimermin+1
				texttimersec=texttimersec-60
				multibouton[6].text=texttimermin.."m"..texttimersec
			else
				multibouton[6].text=texttimersec.."s"
			end
			timermulti=timermultitt
			timervague1=0
			if contreai==0 then
				if nbvague==vagueencours then
					print("perdu")
					audio.play(son.eventperdu)
					findelapartie=true
					appuipause()
					affmenuconf(2)
				end
			end
			print("lancement du timer pour la vague suivante")
			local function chargementvague( event )--gestion du chargment des trois pouvoirs
				if removetotal==false and findelapartie==false then
					if removepartiel1==false then
						if timervague>0 then
							timervague1=timervague1+0.5
							timervague=timervaguettt-mathfloor(timervague1)
							local texttimermin=0
							local texttimersec=timervague
							if texttimersec>=60 then
								texttimermin=texttimermin+1
								texttimersec=texttimersec-60
								multibouton[6].text=texttimermin.."m"..texttimersec
							else
								multibouton[6].text=texttimersec.."s"
							end
							chargementvague1=timer.performWithDelay( 500*vitessejeuin, chargementvague )
							local bla=timerpause(1,chargementvague1,numerotimer)
						elseif multivaguemax>=vagueencours then
							print("lancement vague suivante "..vagueencours.." / "..multivaguemax)
							timerai=0
							--print("timerai remis a 0")
							vagueencours=vagueencours+1
							retinf.ordrespawn=retinf.ordrespawn..[[,"vagueencours":"]]..vagueencours..[["]]
							vagueinf.text=vagueencours
							vaguenchargement=0
							--premiersoldat=0 
							pointmulti=5*vagueencours
							pointmultiai=pointmulti
							timermulti=timermultitt

							multibouton[7].text=pointmulti.." p"
							local texttimermin=0
							local texttimersec=timermulti
							if texttimersec>=60 then
								texttimermin=texttimermin+1
								texttimersec=texttimersec-60
								multibouton[6].text=texttimermin.."m"..texttimersec
							else
								multibouton[6].text=texttimersec.."s"
							end
							premiersoldattime=system.getTimer()


							for i=1,#multiboutontext do
								multibouton[i].isVisible=true
								multiboutontext[i].isVisible=true
								multiboutonbuste[i].isVisible=true
								multiboutonprix[i].isVisible=true
							end
						end
					end
				end	
			end
			chargementvague2=timer.performWithDelay( 500*vitessejeuin, chargementvague )
			numerotimer=timerpause(1,chargementvague2,numerotimer)
		end
	end
	local function clicbouton(numero)
		clicsurqqcfunc()
		pv3clic=1
		local function tempclic1(event)
			pv3clic=0
		end
		timer.performWithDelay( 50,tempclic1)
		
		-- multibouton[numero].fill.effect = "filter.sepia"
		 multibouton[numero].fill.effect.intensity=-2
		 transition.to(multibouton[numero].fill.effect, { time=500, intensity=0 } ) 
		if multiboutonclic==0 and jeupause.etat==0 then
			multiboutonclic=1
			local function tempclic(event)
				multiboutonclic=0
			end
			timer.performWithDelay( 50,tempclic)
			tapboutonspawn(multibouton[numero],multiboutontext[numero],multiboutonbuste[numero],multiboutonprix[numero])
			--multibouton[numero].xScale=multibouton.scale
			--multibouton[numero].yScale=multibouton.scale
			--transition.from(multibouton[numero],{time=500,transition=easing.outBack,xScale=multibouton.scale*0.8,yScale=multibouton.scale*0.8})
			if premiersoldat==0 then
				bpaccnorm()
				premiersoldat=1
				print("\n\n\n\n Remise")
				timerai=0
				if debutpartie==0 then
					debutpartie=gettime()
				end
				--local t = os.date( '*t' )
				premiersoldattime=system.getTimer() --os.time( t )
				--print("premiersoldattime"..premiersoldattime)
				--function timertempsrest(event)
				local function chargementvaguea( event )
					print("timer vaguea event vaguenchargement:"..vaguenchargement)
					if jeupause.etat==0 and vaguenchargement==0 then
						if timermulti>0 and pointmulti>0 then
							timermulti1=timermulti1+0.5
							timermulti=timermultitt-mathfloor(timermulti1)
							local texttimermin=0
							local texttimersec=timermulti
							if texttimersec>=60 then
								texttimermin=texttimermin+1
								texttimersec=texttimersec-60
								multibouton[6].text=texttimermin.."m"..texttimersec
							else
								multibouton[6].text=texttimersec.."s"
							end
						else
							print("vague fini new")
							vaguefini( )
							pointmulti=0
							multibouton[7].text=pointmulti.." p"
							timermulti1=0
							
							for i=1,#multiboutontext do
								multibouton[i].isVisible=false
								multiboutontext[i].isVisible=false
								multiboutonbuste[i].isVisible=false
								multiboutonprix[i].isVisible=false
							end
							-- multibouton[4].isVisible=false
							-- multibouton[3].isVisible=false
							-- multibouton[2].isVisible=false
							-- multibouton[1].isVisible=false
						end
					end
					if removepartiel1==false then
						chargementvaguea1=timer.performWithDelay( 500*vitessejeuin, chargementvaguea )
						local bla=timerpause(1,chargementvaguea1,numerotimer1)
						--Runtime:removeEventListener( "enterFrame",timertempsrest)
					end
				end
				chargementvaguea2=timer.performWithDelay( 500*vitessejeuin, chargementvaguea )
				numerotimer1=timerpause(1,chargementvaguea2,numerotimer1)
			--	Runtime:addEventListener("enterFrame",timertempsrest)
			end
			local num=findnbsoldat(1)
			-- local varlib=0
			-- local num=nil
			-- local k=1
			-- while k<=nbsoldat do--permet de ralouer les numero
			-- 	if isoldat[k].remp==1 then
			-- 		varlib=1
			-- 		num=k
			-- 		k=nbsoldat+1
			-- 		--print("numero trouver")
			-- 	end
			-- 	k=k+1
			-- end
			-- if varlib==0 then
			-- 	nbsoldat=nbsoldat+1
			-- 	num=nbsoldat
			-- end
			local typeso=multibouton[numero].typeso[1] --mathrandom(multibouton[numero].typeso.nb)]
			local polespawn=nil
			if contreai==1 then
				 polespawn=614.4
			end
			local hello=soldat1.new(num,typeso,0, polespawn)
			hello:debut(num,entreselec)
			pointmulti=pointmulti-multibouton[numero].point
			multibouton[7].text=pointmulti.." p"
			for i=1,4 do
				if pointmulti<multibouton[i].point then
					multibouton[i].isVisible=false
					multiboutontext[i].isVisible=false
					multiboutonbuste[i].isVisible=false
					multiboutonprix[i].isVisible=false
				end
			end
			-- if pointmulti<4 then
			-- 	multibouton[4].isVisible=false
			-- 	if pointmulti<3 then
			-- 		multibouton[3].isVisible=false
			-- 		if pointmulti<2 then
			-- 			multibouton[2].isVisible=false
			-- 			if pointmulti<1 then
			-- 				multibouton[1].isVisible=false
			-- 			end
			-- 		end
			-- 	end
			-- end
			
			retinf.ordrespawn=retinf.ordrespawn..[[,"typeso":"]]..typeso..[[","entreselec":"]]..entreselec..[[","time":"]]..timermulti1..[["]]
			-- if contreai==1 then
			-- 	nbsoldat=nbsoldat+1
			-- 	num=nbsoldat
			-- 	local hello=soldat1.new(num,typeso,0,614.4)
			-- 	hello:debut(num,entreselec)
			-- end
			--local hello=soldat1.new(num,typeso,0)
			savemultitemp.nb=savemultitemp.nb+1
			savemultitemp.typeso[savemultitemp.nb]=typeso
			--local t1 = os.date( '*t' )
			savemultitemp.time[savemultitemp.nb]=mathfloor((system.getTimer()-premiersoldattime)*0.01)

			print("savemulti.time[savemulti.nb]"..savemultitemp.time[savemultitemp.nb].."premiersoldattime"..premiersoldattime)
			--hello:debut(num)
		end
	end 


	function multibouton1(event)
		clicbouton(1)
	end
	multibouton[1]:addEventListener("tap",multibouton1)

	function multibouton2(event)
		clicbouton(2)
	end
	multibouton[2]:addEventListener("tap",multibouton2)

	function multibouton3(event)
		clicbouton(3)
	end
	multibouton[3]:addEventListener("tap",multibouton3)

	function multibouton4(event)
		clicbouton(4)
	end
	multibouton[4]:addEventListener("tap",multibouton4)

	function vagsuilist(event)
		if fenaff==false and pv1clic==0 and pv2clic==0 and pv3clic==0 then			
			local entreselec1
			if contreai==1 then
				if event.target.compteur*0.5==math.floor(event.target.compteur*0.5) then
					entreselec1=event.target.compteur*0.5+1
				else
					entreselec1=(event.target.compteur-1)*0.5+1
				end
				for i=1,2 do
				--if entreselec1~=entreselec then
					if entreselec==1 then
						vagsui.xScale=vagsui.scale*i
						vagsui.yScale=vagsui.xScale
						--transition
						vagsuib[1].xScale=vagsui.scale*i
						vagsuib[1].yScale=vagsuib[1].xScale
						transition.from(vagsui,{time=500,transition=easing.outBack,xScale=vagsui.scale,yScale=vagsui.scale})
						transition.from(vagsuib[1],{time=500,transition=easing.outBack,xScale=vagsui.scale,yScale=vagsui.scale})
						--if vagsui.fill==nil then
							vagsui.fill.effect = "filter.sepia"
							vagsui.fill.effect.intensity=-2
						--end
						transition.to(vagsui.fill.effect, { time=500, intensity=0 } ) 
						--if vagsuib[1].fill==nil then
							vagsuib[1].fill.effect = "filter.sepia"
							vagsuib[1].fill.effect.intensity=-2
						--end
						transition.to(vagsuib[1].fill.effect, { time=500, intensity=0 } ) 
					else
						vagsuib[(entreselec-1)*2].xScale=vagsui.scale*i
						vagsuib[(entreselec-1)*2].yScale=vagsuib[(entreselec-1)*2].xScale
						-- transition
						vagsuib[(entreselec-1)*2+1].xScale=vagsui.scale*i
						vagsuib[(entreselec-1)*2+1].yScale=vagsuib[(entreselec-1)*2+1].xScale
						-- transition
						transition.from(vagsuib[(entreselec-1)*2],{time=500,transition=easing.outBack,xScale=vagsui.scale,yScale=vagsui.scale})
						transition.from(vagsuib[(entreselec-1)*2+1],{time=500,transition=easing.outBack,xScale=vagsui.scale,yScale=vagsui.scale})
						--if vagsuib[(entreselec-1)*2].fill==nil then
							vagsuib[(entreselec-1)*2].fill.effect = "filter.sepia"
							vagsuib[(entreselec-1)*2].fill.effect.intensity=-2
						--end
						transition.to(vagsuib[(entreselec-1)*2].fill.effect, { time=500, intensity=0 } ) 
						--if vagsuib[(entreselec-1)*2+1].fill==nil then
							vagsuib[(entreselec-1)*2+1].fill.effect = "filter.sepia"
							vagsuib[(entreselec-1)*2+1].fill.effect.intensity=-2
						--end
						transition.to(vagsuib[(entreselec-1)*2+1].fill.effect, { time=500, intensity=0 } ) 
					end
					entreselec=entreselec1
				end
				-- pas fini du tout!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
			else
				entreselec1=event.target.compteur+1
				for i=1,2 do
				--if entreselec1~=entreselec then
					if entreselec==1 then
						vagsui.xScale=vagsui.scale*i
						vagsui.yScale=vagsui.xScale
						transition.from(vagsui,{time=500,transition=easing.outBack,xScale=vagsui.scale,yScale=vagsui.scale})
						--if vagsui.fill==nil then
							vagsui.fill.effect = "filter.sepia"
							vagsui.fill.effect.intensity=-2
						--end
						transition.to(vagsui.fill.effect, { time=500, intensity=0 } ) 
					else
						vagsuib[entreselec-1].xScale=vagsui.scale*i
						vagsuib[entreselec-1].yScale=vagsuib[entreselec-1].xScale
						transition.from(vagsuib[entreselec-1],{time=500,transition=easing.outBack,xScale=vagsui.scale,yScale=vagsui.scale})
						--if vagsuib[entreselec-1].fill==nil then
							vagsuib[entreselec-1].fill.effect = "filter.sepia"
							vagsuib[entreselec-1].fill.effect.intensity=-2
						--end
						transition.to(vagsuib[entreselec-1].fill.effect, { time=500, intensity=0 } ) 
					end
					entreselec=entreselec1
				end
			end
		end
	end
	vagsui:addEventListener( "tap", vagsuilist )--lancement de l'ecoute sur le bouton play
	vagsuig.alpha=0.85
	if vagsuib~=nil then
		for i=1,#vagsuib do
			vagsuib[i]:addEventListener( "tap", vagsuilist )
		end
	end
end
function multisave()
	if savemultitemp~=nil then
		savemultitemp=nil
	end
	savemultitemp={}
	savemultitemp.nb=0
	savemultitemp.fricdebut=argentdep --fricmulticreation
	savemultitemp.typeso={}
	savemultitemp.time={}
	print("deb save")
	premiersoldat=0
	for i=1,#multiboutontext do
		multibouton[i].isVisible=true
		multiboutontext[i].isVisible=true
		multiboutonbuste[i].isVisible=true
		multiboutonprix[i].isVisible=true
	end
	-- multibouton[1].isVisible=true
	-- multibouton[2].isVisible=true
	-- multibouton[3].isVisible=true
	-- multibouton[4].isVisible=true
	timermulti=timermultitt
	pointmulti=5
	multibouton[7].text=pointmulti.." p"
	local texttimermin=0
	local texttimersec=timermulti
	if texttimersec>=60 then
		texttimermin=texttimermin+1
		texttimersec=texttimersec-60
		multibouton[6].text=texttimermin.."m"..texttimersec
	else
		multibouton[6].text=texttimersec.."s"
	end
	premiersoldat=0
	if multi==1 or multi==2 then
		local function listenergagner3(event)
			--print("deb test gagner")
			if jeupause.timerlibre[numtimergagner]==1 then
				jeupause.timerlibre[numtimergagner]=2
			end
			if findelapartie==false and removepartiel1==false then
				--print("test gagner")
				if premiersoldat==1 then
					local gagner=0
					local nb=1
					while nb<=nbsoldat do
						if isoldat[nb].orientation==1 and isoldat[nb].vivant==true then
							gagner=1
							nb=nbsoldat
						end
						nb=nb+1
					end
					if gagner==0 then
						--timer.cancel(listenergagner)
						print("test reussi")
						multibouton[5].isVisible=true
						if (pointmulti<=0 or timermulti<=0) and multivaguemax<vagueencours then
							findelapartie=true
							appuipause()
							affmenuconf(4)
						end
					else
						multibouton[5].isVisible=false
						print("relancer test gagné")
						print("multivaguemax "..multivaguemax)
					end
				end
				listenergagner4=timer.performWithDelay(750,listenergagner3)
				local blavla=timerpause(1,listenergagner4,numtimergagner)
			end
		end
		listenergagner4=timer.performWithDelay(750,listenergagner3)
		numtimergagner=timerpause(1,listenergagner4,nil)
	end
end

function multilaunch()
	vagueinf.text="0".."/"..savegamemulti.save[mapmultisave][numsavegame].nb --savemulti[mapmultisave].nb
	local function lancervaguedebut()
		local completedisplancervague1=function(obj)
			lancervague1.isVisible=false
			if lancervague1chaine~=nil then
				lancervague1chaine.isVisible=false
			end
		end
		lancervague1.isVisible1=false
		transition.to(lancervague1,{time=500,transition=easing.outQuad, y=yminscreen-lancervague1.yScale*lancervague1.height*0.5,onComplete=completedisplancervague1,onCancel=completedisplancervague1})
		--lancervague1.isVisible=false
		if lancervague1chaine~=nil then
			transition.to(lancervague1chaine,{time=500,transition=easing.outQuad, y=yminscreen-lancervague1chaine.yScale*lancervague1chaine.height*0.5})
		end
		vagsuig.isVisible=false
		local compteur=1
		premiersoldat=0
		premiersoldattime=system.getTimer()
		vagueinf.text="0"..savegamemulti.save[mapmultisave][numsavegame].nb --savemulti[mapmultisave].nb
		local function tempclic(event)
			jeupause.timerlibre[timersave]=2
			local num=findnbsoldat(1)
			-- local varlib=0
			-- local num=nil
			-- local k=1
			-- while k<=nbsoldat do--permet de ralouer les numero
			-- 	if isoldat[k].remp==1 then
			-- 		varlib=1
			-- 		num=k
			-- 		k=nbsoldat+1
			-- 		print("numero trouver")
			-- 	end
			-- 	k=k+1
			-- end
			-- if varlib==0 then
			-- 	nbsoldat=nbsoldat+1
			-- 	num=nbsoldat
			-- end
			local hello=soldat1.new(num,savegamemulti.save[mapmultisave][numsavegame].typeso[compteur],0)--savemulti[mapmultisave].typeso[compteur],0)
			hello:debut(num)
			vagueinf.text=compteur.."/"..savegamemulti.save[mapmultisave][numsavegame].nb
			if compteur<savegamemulti.save[mapmultisave][numsavegame].nb then
				compteur=compteur+1
				tempclic1=timer.performWithDelay(savegamemulti.save[mapmultisave][numsavegame].time[compteur]*100-(system.getTimer()-premiersoldattime),tempclic) --savemulti[mapmultisave].
				local blabla=timerpause(1,tempclic1,timersave)		
			else
				local function listenergagner(event)
					--print("deb test gagner")
					if jeupause.timerlibre[numtimergagner]==1 then
						jeupause.timerlibre[numtimergagner]=2
					end
					if findelapartie==false and removepartiel1==false then
						--print("test gagner")
						local gagner=0
						local nb=1
						while nb<=nbsoldat do
							if isoldat[nb].orientation==1 and isoldat[nb].vivant==true then
								gagner=1
								nb=nbsoldat
							end
							nb=nb+1
						end
						if gagner==0 then
							--timer.cancel(listenergagner)
							print("test reussi")
							findelapartie=true
							appuipause()
							affmenuconf(3)
						else
							print("relancer test gagné")
							listenergagner1=timer.performWithDelay(750,listenergagner)
							timerpause(1,listenergagner1,numtimergagner)
						end
					end
				end
				listenergagner1=timer.performWithDelay(750,listenergagner)
				numtimergagner=timerpause(1,listenergagner1,nil)
			end
		end
		tempclic1=timer.performWithDelay(savegamemulti.save[mapmultisave][numsavegame].time[compteur]*100,tempclic)		
		timersave=timerpause(1,tempclic1,nil)
	end
	function lancervague11(event)
		lancervaguedebut()	
	end
	lancervague1:addEventListener("tap",lancervague11)
	function vagsuig:tap(event)
		lancervaguedebut()	
	end
	vagsuig:addEventListener( "tap", vagsuig )
end
t.multi = function ()
	
end
return (t)