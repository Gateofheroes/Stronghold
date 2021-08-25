local t = {}--gestion de l'annimation de developement ou de construction ou de destruction
if not functionload then
function fricanim(nouveau,x1,y1)
	if  fpschoisicycle==0 then --fpschoisi<2 then
	-- if nouveau~=2 then
		-- fuildite du jeu
		local oranim
		if nouveau<=2 then
			oranim=display.newImage(imbouton.monnaie,3)
		elseif nouveau==10 then
			oranim=display.newImage(imbouton.batiment,15)
		else
			oranim=display.newText("-1",0,0,fonttype,60*fontsize) -- native.systemFontBold,60 )
			oranim:setFillColor(1,0,0)
		end
		if nouveau<=2 then
			oranim.x2=(-background.x+actualcontentwidth-125)/taille
			oranim.y2=(-background.y+yminscreen+10)/taille
			oranim.x1=x1
			oranim.y1=y1
		else
			oranim.x2=passe.x
			oranim.y2=passe.y
			oranim.y1=y1*taille+background.y
			oranim.x1=x1*taille+background.x
		end
		if nouveau<2 then
			oranim.x=oranim.x2
			oranim.y=oranim.y2
		else
			oranim.x=oranim.x1
			oranim.y=oranim.y1
			oranim.x1=oranim.x2
			oranim.y1=oranim.y2
		end
		if nouveau==10 then
			oranim.x=x1
			oranim.y=y1
			oranim.x1=passe.x
			oranim.y1=passe.y
		end
		oranim.xScale=0.25
		oranim.yScale=oranim.xScale
		
		local creadisppiece=function(obj)
			display.remove(obj)
			-- if obj.nouveau<=2 then
			-- 	background:remove(obj)
			-- else
			-- 	grpartie:insert(obj)
			-- end
			-- obj:removeSelf()
			obj=nil
		end
		transition.to(oranim,{time=500,transition=easing.outBack, y=oranim.y1, x=oranim.x1})
		transition.to(oranim,{time=100,transition=easing.outBack, yScale=0.05,xScale=0.05,onComplete=creadisppiece,onCancel=creadisppiece,delay=400})
		oranim.nouveau=nouveau
		if nouveau<=2 then
			background:insert(oranim)
		else
			grpartie:insert(oranim)
		end
	end

end
function detruirebat(numero)--destruction du batiment
	if ibatiment[numero].pv3==true then
		group[ibatiment[numero].bandepv3gr]:remove(ibatiment[numero].bandepv3)
		ibatiment[numero].bandepv3:removeSelf()
		ibatiment[numero].pv3=false
	end
	if affinfotab.num==numero and affinfotab.type==1 and affinfogr.isVisible then
		affinfogr.isVisible=false
	end
	--print("remove bat".."numero : "..numero)
	if ibatiment[numero].type1==2 then
		if ibatiment[numero].type2==1 or ibatiment[numero].type2==0 or goh then
			display.remove(ibatiment[numero].bras)
			--group[ibatiment[numero].bras.numgroup]:remove(ibatiment[numero].bras)
			--group[mathfloor(ibatiment[numero].y)+12+1024]:remove(ibatiment[numero].bras)
			--ibatiment[numero].bras:removeSelf()
			-- if ibatiment[numero].type2==0 then
			-- 	group[mathfloor(ibatiment[numero].y)+11+1024]:remove(ibatiment[numero].archer)
			-- 	ibatiment[numero].archer:removeSelf()
			-- end
		end
		if ibatiment[numero].type2==2 then
			if ibatiment[numero].pique~=nil then
				for i=1,#ibatiment[numero].pique do
					group[ibatiment[numero].pique[i].groupe]:remove(ibatiment[numero].pique[i])
					ibatiment[numero].pique[i]:removeSelf()
					ibatiment[numero].pique[i]=nil
				end
				ibatiment[numero].pique=nil
			end
		end
	elseif ibatiment[numero].type1==1 then
		group[ibatiment[numero].drap.pos]:remove(ibatiment[numero].drap)
		ibatiment[numero].drap:removeSelf()
	end

	if ibatiment[numero].type1~=3 then
		ibatiment[numero]:removeEventListener( "tap", ibatiment )
		if not goh then
			group[1]:remove( occupe[numero] )
			occupe[numero]:removeSelf()
			group[1]:remove(ombrebat[numero])
			ombrebat[numero]:removeSelf()
		end
		group[ibatiment[numero].group]:remove(ibatiment[numero])
		--group[mathfloor(ibatiment[numero].y)+10+1024]:remove(ibatiment[numero])
		ibatiment[numero]:removeSelf()
		--ibatiment[numero].isVisible=false
		if ibatiment[numero].niveau==1 then
			group[ibatiment[numero].group]:remove(ibatiment[numero].batniv1)
			--group[mathfloor(ibatiment[numero].y)+1024+10]:remove(ibatiment[numero].batniv1)
			ibatiment[numero].batniv1:removeSelf()
		end
	else
		isoldat[ibatiment[numero].numsol].vivant=false
		ibatiment[numero].niveau=1
		initia(numero)
		miseajourvalevol(numero)
		finmiseajourevol(numero,3)
		ibatiment[numero]:setFrame(1)
		ibatiment[numero].sup=0
		ibatiment[numero].endev=0
		ibatiment[numero].chargement1.cpt=0
		ibatiment[numero].chargement1.alpha=0
		ibatiment[numero].chargement.alpha=0
		ibatiment[numero].chargement1.height=ibatiment[numero].chargement1.cpt
	end

end
local batiment = require( "batiment" )
function constructionanim(nbatimentcopie,nouveau,vitessedanim,vientaidaide)--gestion de l'anim et de ce que ca implique, vitesse  de l'animation
	local nbatiment
	if nouveau==1 then
		nbatiment={}
		nbatiment.x=nbatimentcopie.x
		nbatiment.y=nbatimentcopie.y
		nbatiment.xScale=nbatimentcopie.xScale
		nbatiment.yScale=nbatimentcopie.yScale
		nbatiment.num=nbatimentcopie.num
		nbatiment.endev=nbatimentcopie.endev
		nbatiment.type1=nbatimentcopie.type1
		nbatiment.width=nbatimentcopie.width
		nbatiment.height=nbatimentcopie.height
	else
		nbatiment=nbatimentcopie
	end
	-- if coroutine.running()~=nil then
	-- 	print("coroutine constructionanim: "..coroutine.running())
	-- else
	-- 	print("coroutine constructionanim: nil")
	-- end
	if vitessedanim==nil then
		if nouveau==2 then
			vitessedanim=0.9
		else
			vitessedanim=1.5
		end
	end
	--print("nouveau batiment:"..nouveau)
	print("nouvelle anim")
	if aidevbat==0 then
		batiment.supbouton()
	elseif nbatiment.num~=nil and boutondev1~=nil then
		if nbatiment.num==boutondev1.num then
			batiment.supbouton()
		end
	end
	--if nbatiment.endev==0 then
	nbatiment.endev=1
	local numero
	if nbatiment.num==nil then
		numero=0
		for i=1,nbbatiment,1 do
			if ibatiment[i]~=nil then
				if ibatiment[i].sup1==1 and ibatiment[i].niveau~=0 and ibatiment[i].numlibre then
					numero=i
				end
			end
		end
		--local numbatiment=nil
		if numero==0 then
			nbbatiment=nbbatiment+1
			numero=nbbatiment
		end
	else
		numero=nbatiment.num
	end
	print("batiment numero "..numero)
	local sequenceData =
	{
		name="echafau",
		frames= {1,1,2,2,3,3,4,4,5,5,5,5,5,5,5,4,3,2,1},
		time = 3000*vitessejeuin*vitessedanim,
		loopCount = 1
	}
	local sheet1=imageecha
	local instance1=display.newSprite( sheet1, sequenceData )
	instance1.x=nbatiment.x
	instance1.y=nbatiment.y+5
	if goh then
		-- print("instance1.width"..instance1.width)
		-- instance1.xScale = nbatiment.width*nbatiment.xScale/instance1.width
		-- instance1.yScale = nbatiment.height*nbatiment.yScale/instance1.height
		-- if instance1.yScale>instance1.xScale then
		-- 	instance1.xScale=instance1.yScale
		-- else
		-- 	instance1.yScale=instance1.xScale
		-- end
		instance1.xScale=0.2
		instance1.yScale=instance1.xScale
	else
		instance1.xScale=nbatiment.xScale
		instance1.yScale=nbatiment.yScale
	end
	if true then
		local type2=0
		local type1=1
		local niveau=1
		if nouveau~=1 then
			type2=nbatiment.type2
			type1=ibatiment[numero].type1
			niveau=ibatiment[numero].niveau
		else
			type1=nbatiment.type1
		end
		local xoffset=batimentinit[type1][type2][niveau].xecha
		local yoffset=batimentinit[type1][type2][niveau].yecha
		print("echafaudage\ntype2 "..type2.." type1 "..type1.." niveau "..niveau)
		if nouveau==2 then
			local niveau1=niveau-1
			if niveau1==0 then
				niveau1=1
			end
			xoffset=xoffset+batimentinit[type1][type2][niveau1].x-batimentinit[type1][type2][niveau].x
			yoffset=yoffset+batimentinit[type1][type2][niveau1].y-batimentinit[type1][type2][niveau].y
			print("echafaudage destruction\n "..batimentinit[type1][type2][niveau].x.." "..batimentinit[type1][type2][niveau].y)
		end
		instance1.x=instance1.x+xoffset
		instance1.y=instance1.y+yoffset
		instance1.xScale=instance1.xScale*batimentinit[type1][type2][niveau].scaleecha
		instance1.yScale=instance1.xScale
	end

	instance1.pause1=0
	if(nouveau==1)then
		if(nbatiment.type1==2)then
			sheetbat = imgbat.distance
			--batiment2=display.newImage(imagebat[2][0][1],1)--imagebat[2][0][1]--display.newImage("batiment/4_archer/archers1.png",0,0)
			--print("ca c'est fait")
		else
			sheetbat = imgbat.contact
			--batiment2=display.newImage(imagebat[1][0][1],1)--display.newImage("batiment/1_infanterie/infanterie1.png",0,0)
			--print("enfin")
		end
		sequenceData = {
			name = "batname",
			start = 1,
			count = 9,
		}
		
		--local pole=ibatiment[numero].pole
		ibatiment[numero]=display.newSprite( sheetbat, sequenceData )
		ibatiment[numero]:setSequence( "batname" )
		ibatiment[numero].numbataff=1
		ibatiment[numero]:setFrame(ibatiment[numero].numbataff)
		ibatiment[numero].x1=nbatiment.x
		ibatiment[numero].y1=nbatiment.y+5
		ibatiment[numero].x=ibatiment[numero].x1+batimentinit[nbatiment.type1][0][1].x
		ibatiment[numero].y=ibatiment[numero].y1+batimentinit[nbatiment.type1][0][1].y
		ibatiment[numero].type1=nbatiment.type1
		ibatiment[numero].xScale=nbatiment.xScale --instance1.xScale
		ibatiment[numero].yScale=ibatiment[numero].xScale
		--	print("xScale1")
		ibatiment[numero].isVisible=false
		
		if nbatiment.pole==nil then
			ibatiment[numero].pole=0
		else
			ibatiment[numero].pole=nbatiment.pole
		end
		--	print("batiment pole "..ibatiment[numero].pole)
		if(nbatiment.type1==2)then
			ibatiment[numero].batniv1=display.newImage(imgbat.arc,1)
		else
			ibatiment[numero].batniv1=display.newImage(imgbat.inf,1)
		end
		ibatiment[numero].batniv1.xScale=nbatiment.xScale
		ibatiment[numero].batniv1.yScale=nbatiment.yScale
		--	print("xScale2")
		ibatiment[numero].batniv1.x=nbatiment.x+batimentinit[nbatiment.type1][0][1].x
		ibatiment[numero].batniv1.y=nbatiment.y+batimentinit[nbatiment.type1][0][1].y
		ibatiment[numero].batniv1.isVisible=false
		if decoration~=nil then
			for i=1,#decoration do
				if decorationaff[i]~=nil then
					print("teste la decoration "..decorationaff[i].x.." "..nbatiment.x.." "..((nbatiment.x-decorationaff[i].x)^2+(nbatiment.y-decorationaff[i].y)^2))
					if 25000>((nbatiment.x-decorationaff[i].x)^2+(nbatiment.y-decorationaff[i].y)^2) then
						print("decoration a supprimer")
						group[decorationaff[i].group]:remove(decorationaff[i])
						decorationaff[i]:removeSelf()
						decorationaff[i]=nil
					end
				end
			end
		end
		removenbat(true)
		-- group[2048]:remove(nbatiment)
		-- nbatiment:removeSelf()
		-- nbatiment=nil
		-- enconst=0
		if vientaidaide==nil then
			print("remove bouton1\n\n\n\n\n\n\n")
			removenbatbt()
		else

		end
		nbatiment=nil
		if tuto==2 then
			if tutoaction==2 or tutoaction==1 or tuto==0 then
				actionfaite(2)
			end
		end
		initia(numero)
	else
		if goh and ibatiment[numero].niveau==2 and ibatiment[numero].type1~=3 and nouveau~=2 then
			print("\n\nici 0 sdfgsdfg")
			if ibatiment[numero].type1==1 then
				print("ici 1")
				ibatiment[numero].xScale=ibatiment[numero].xScale*1.5 -- modif pour tout les batiments de contact sauf le premier
			else
				print("ici 2")
				ibatiment[numero].xScale=ibatiment[numero].xScale*0.8 -- modif de tous les bat de tir
			end
			ibatiment[numero].yScale=ibatiment[numero].xScale
		end
		-- instance1.y=instance1.y+ibatiment[numero].ybase*0.5
	end
	if ibatiment[numero].type1==1 then
		if jeupause.etat==0 then
			audio.play( son.eventinf,{channel=9})
		end
	else
		if jeupause.etat==0 then
			audio.play( son.eventarc,{channel=8})
		end
	end
	if not goh then
		instance1.group=mathfloor(instance1.y)+1024+13
	else
		instance1.group=mathfloor(ibatiment[numero].y1+ibatiment[numero].height*0.5*ibatiment[numero].yScale)+1024+5 --mathfloor(instance1.y+instance1.height*instance1.yScale*0.5)+1024+1 -- +13
	end
	group[instance1.group]:insert(instance1)
	instance1:play()
	instance1.oldframe=nil

	-- ici
	if ibatiment[numero].pole==0 then
		fricanim(nouveau,instance1.x,instance1.y)
	end
	local function instance( event )--listener sur le rafraichissement de l'affichage
		if jeupause.etat==1 then--technique numero 3 de mise en pause(plus de probleme avec les processeurs mtk et probleme de deferencement)
			if instance1.pause1==0 then
				instance1.pause1=1
				instance1:pause()
			end
		else
			if instance1.pause1==1 then
				instance1.pause1=0
				instance1:play()
			end
			if removepartiel1==true then
				instance1.timeScale=1--10
			-- else
			-- 	instance1.timeScale=instance1.timeScale*vitessejeu
			end
			--animation faite à %
			if (instance1.frame>=12 or removepartiel1==true) and instance1.oldframe~=12 and instance1.oldframe~=19 then
				instance1.oldframe=12
				if nouveau==1 or goh then
					if nouveau==1 then
						ibatiment[numero].batniv1.isVisible=true
					end
					if goh then
						print("calcul du group\n")
						if nouveau~=1 then
							group[ibatiment[numero].group]:remove(ibatiment[numero]) 
						end
						ibatiment[numero].group=mathfloor(ibatiment[numero].y1+ibatiment[numero].ybase)+1024
						-- local test=display.newCircle(ibatiment[numero].x1,ibatiment[numero].y1,3)
						-- test:setFillColor(1,0,0)
						-- group[2047]:insert(test)
						-- local test1=display.newCircle(ibatiment[numero].x1,ibatiment[numero].group-1024,3)
						-- test1:setFillColor(0,0,1)
						-- group[2047]:insert(test1)
					else
						ibatiment[numero].group=mathfloor(ibatiment[numero].y1)+1024+10
					end
					if nouveau==1 then
						group[ibatiment[numero].group]:insert(ibatiment[numero].batniv1) --1020 ibatiment[numero].y -19.577110290527 offset 16.259440727532
						--group[mathfloor(ibatiment[numero].y)+1024+10]:insert(ibatiment[numero].batniv1)
						ibatiment[numero].isVisible=true
						ibatiment[numero].alpha=0.01
					end
					group[ibatiment[numero].group]:insert(ibatiment[numero]) 
					--group[mathfloor(ibatiment[numero].y)+1024+10]:insert(ibatiment[numero]) 
					if nouveau==1 then	
						local theme=1
						if niveauch>4 then
							if niveauch>8 then
								if niveauch>12 then
									if niveauch>20 then
										theme=1
									else
										theme=4
									end
								else
									theme=3
								end
							else
								theme=2
							end
						end
						if ibatiment[numero].type1==1 then
							theme=theme+4
						end
						if not goh then
							occupe[numero]=display.newImage(imbouton.zoneoccupe,theme)--display.newImage("bouton/zoneoccupe.png",absc,ordo+20)
							occupe[numero].x=instance1.x
							occupe[numero].y=instance1.y+30
							occupe[numero].xScale=instance1.xScale+0.02
							occupe[numero].yScale=instance1.yScale+0.02
							ombrebat[numero]=display.newImage(imbouton.ombrebat,1)
							-- ombrebat[numero]=display.newImage(imbouton.ombrebat1,3-ibatiment[numero].type1)
							-- ombrebat[numero].xScale=0.6
							-- ombrebat[numero].yScale=ombrebat[numero].xScale*1.3
							-- ombrebat[numero].x=occupe[numero].x+ombrebat[numero].xScale*ombrebat[numero].width*0.08
							-- ombrebat[numero].y=occupe[numero].y-ombrebat[numero].yScale*ombrebat[numero].height*0.2

							ombrebat[numero].yScale=4.2
							ombrebat[numero].xScale=4
							ombrebat[numero].x=instance1.x+ombrebat[numero].xScale*ombrebat[numero].width*0.15
							ombrebat[numero].y=instance1.y+30-ombrebat[numero].yScale*ombrebat[numero].height*0.2
							ombrebat[numero]:rotate(15)
							ombrebat[numero].alpha=0.5 --0.85 --0.5
							-- if ibatiment[numero].type1==1 then
							-- 	occupe[numero].xScale=occupe[numero].xScale*1.1
							-- 	occupe[numero].yScale=occupe[numero].yScale*1.1
							-- end
							-- print("xScale3")
							group[1]:insert(occupe[numero])
							group[1]:insert(ombrebat[numero])
						end
						miseajourvalevol(numero)	
						--initia(numero)
					end
				end
				if nouveau==0 then
					if ibatiment[numero].niveau==2 or ibatiment[numero].niveau==1 then
						if ibatiment[numero].type1~=3 then
							group[ibatiment[numero].group]:remove(ibatiment[numero].batniv1)
							--group[mathfloor(ibatiment[numero].y)+1024+10]:remove(ibatiment[numero].batniv1)
							ibatiment[numero].batniv1:removeSelf()
						end
					end
					ibatiment[numero].alpha=1
					local numimg =nil
					if ibatiment[numero].type1~=3 then
						if goh and ibatiment[numero].type1==2 and ibatiment[numero].niveau~=1 then
							-- gohtrouverbras(numero)
						end
						if ibatiment[numero].type2==0 then
							numimg=ibatiment[numero].niveau
							--print("num img"..numimg)
							if ibatiment[numero].type1==2 and ibatiment[numero].niveau==4 and not goh then 
								ibatiment[numero].bras:rotate(-ibatiment[numero].bras.angle)
								ibatiment[numero].bras.angle=0
								ibatiment[numero].bras:setSequence("bali")
								print("test result")
							end
						elseif ibatiment[numero].type2==1 then
							if ibatiment[numero].type1==1 then
								numimg=3+3+ibatiment[numero].niveau
							else
								numimg=3+ibatiment[numero].niveau
								if not goh then
									if ibatiment[numero].niveau==2 then
										-- group[mathfloor(ibatiment[numero].y)+11+1024]:remove(ibatiment[numero].archer)
										--group[mathfloor(ibatiment[numero].y)+12+1024]:remove(ibatiment[numero].bras)
										-- ibatiment[numero].archer:removeSelf()
										--Runtime:removeEventListener( "enterFrame",animtirbatbras)
										--ibatiment[numero].bras:removeSelf()
										ibatiment[numero].bras:rotate(-ibatiment[numero].bras.angle)
										ibatiment[numero].bras.angle=0
										ibatiment[numero].bras:setSequence("cata1")
									elseif ibatiment[numero].niveau==3 then 
										ibatiment[numero].bras:setSequence("cata2")
									elseif ibatiment[numero].niveau==4 then 
										ibatiment[numero].bras:setSequence("cata3")
									end
								end
							end
						elseif ibatiment[numero].type2==2 then
							if ibatiment[numero].type1==1 then
								numimg=3+ibatiment[numero].niveau
							else
								numimg=3+3+ibatiment[numero].niveau
								if ibatiment[numero].niveau==2 and not goh then
									--group[mathfloor(ibatiment[numero].y)+11+1024]:remove(ibatiment[numero].archer)
									group[ibatiment[numero].bras.numgroup]:remove(ibatiment[numero].bras)
									--group[mathfloor(ibatiment[numero].y)+12+1024]:remove(ibatiment[numero].bras)
									--ibatiment[numero].archer:removeSelf()
									ibatiment[numero].bras:removeSelf()
								end
							end
						end
					else
						numimg=1+ibatiment[numero].niveau*2
					end
					if goh then
						if ibatiment[numero].niveau==2 and ibatiment[numero].type1<3 then
							local mask
							if ibatiment[numero].type1==1 then
								if ibatiment[numero].type2==0 then
									mask = graphics.newMask( "goh/batiment/infmask.png" )
								elseif ibatiment[numero].type2==1 then
									mask = graphics.newMask( "goh/batiment/geamask.png" )
								else
									mask = graphics.newMask( "goh/batiment/cavmask.png" )
								end
							elseif ibatiment[numero].type1==2 then
								mask = graphics.newMask( "goh/batiment/tirmask.png" )
							else
								mask = graphics.newMask( "goh/batiment/minmask.png" )
							end
							ibatiment[numero]:setMask(mask)
						end
					end
					ibatiment[numero]:setFrame( numimg-1 )
					ibatiment[numero].x=ibatiment[numero].x1+batimentinit[nbatiment.type1][nbatiment.type2][nbatiment.niveau].x
					ibatiment[numero].y=ibatiment[numero].y1+batimentinit[nbatiment.type1][nbatiment.type2][nbatiment.niveau].y
	   				miseajourvalevol(numero)
	   				if ibatiment[numero].type1~=3 then
						if goh and ibatiment[numero].type1==2 and ibatiment[numero].niveau~=1 then
							gohtrouverbras(numero)
						end			
					end
				elseif nouveau==2 then
					detruirebat(numero)
				end
			--animation fini
			elseif (instance1.frame>=18 or removepartiel1==true) and instance1.oldframe~=19   then
				instance1.oldframe=19
				Runtime:removeEventListener( "enterFrame",instance)
					if nouveau==0 then 
						finmiseajourevol(numero,1)
						if ibatiment[numero].type1==3 and ibatiment[numero].niveau==2 then
							attaquebatiment(numero)
							isoldat[ibatiment[numero].numsol].vivant=true
						end
					elseif nouveau==1 then
						finmiseajourevol(numero,3)
						attbatiment1=require("attbatiment")
						--print("attbatiment")
						attaquebatiment(numero)
					end
					if nouveau~=2 then
						if ibatiment[numero].type1==1 then
							if ibatiment[numero].type2==1 and ibatiment[numero].niveau==2 then
								if not goh then
									occupe[numero].xScale=1.1*occupe[numero].xScale
									occupe[numero].yScale=occupe[numero].xScale
									ombrebat[numero].yScale=4.2*1.1
									ombrebat[numero].xScale=4*1.1
								end
							elseif ibatiment[numero].type2==2 and ibatiment[numero].niveau==2 then
								if not goh then
									occupe[numero].xScale=0.9*occupe[numero].xScale
									occupe[numero].yScale=occupe[numero].xScale
									ombrebat[numero].yScale=4.2*0.9
									ombrebat[numero].xScale=4*0.9
								end
							elseif ibatiment[numero].type2==2 and ibatiment[numero].niveau==4 then
								ibatiment[numero].xScale=ibatiment[numero].xScale*1.07
								ibatiment[numero].yScale=ibatiment[numero].yScale*1.1
								if not goh then
									occupe[numero].xScale=1.1*occupe[numero].xScale
									occupe[numero].yScale=occupe[numero].xScale
									ombrebat[numero].yScale=4.2*1.1
									ombrebat[numero].xScale=4*1.1
								end
							elseif ibatiment[numero].type2==0 and ibatiment[numero].niveau==4 then
								ibatiment[numero].xScale=ibatiment[numero].xScale*1.1
								ibatiment[numero].yScale=ibatiment[numero].yScale*1.1
							end
						end
						if ibatiment[numero].type1==2 and ibatiment[numero].sup1==0 then
							--local batiment1 = require( "batiment" )
							--print("nbatiment")
							--print(nbatiment.num)
							
							ibatiment[numero].sup=0
							--cbatiment[nbatiment.num]:att(nbatiment.num,nbatiment.instance1)--test
						end
						if nouveau~=2 then
							ibatiment[numero].endev=0
						end
					end
					group[instance1.group]:remove(instance1)
					instance1:removeSelf()
        			instance1 = nil
        		--end
			end
		end
	end
	Runtime:addEventListener("enterFrame",instance)
--end
end
end
t.constructanim = function()
t=true
end
return t