local t = {}--gestion des mines
if not functionload then
function minecreation()
	local batimentbis1=require("batimentbis")
	local pole=0
	local nombredite=1
	if contreai==1 then
		nombredite=2
	end
	for i=1,nombredite do
		if i==2 then
			pole=614.4
		end
		for minecpt=1, mineinfo.nb do
			sequenceData = {
				name = "batname",
				start = 1,
				count = 9,
			}
			numero=0
			for i=1,nbbatiment,1 do
				if ibatiment[i].sup1==1 and ibatiment[i].niveau~=0 then
					numero=i
				end
			end
			--local numbatiment=nil
			if numero==0 then
				nbbatiment=nbbatiment+1
				numero=nbbatiment
			end
			ibatiment[numero]=display.newSprite( imgbat.mine, sequenceData )
			if goh then
				local mask = graphics.newMask( "goh/batiment/minmask.png" )
				ibatiment[numero]:setMask(mask)
			end
			ibatiment[numero].x1=mineinfo[minecpt].x
			ibatiment[numero].y1=mineinfo[minecpt].y+pole
			ibatiment[numero].x=ibatiment[numero].x1+batimentinit[3][0][1].x
			ibatiment[numero].y=ibatiment[numero].y1+batimentinit[3][0][1].y
			ibatiment[numero].pole=pole
			if mineinfo[minecpt].nbmine~=nil then
				ibatiment[numero].numpoint=mineinfo[minecpt].nbmine
				intersection[ibatiment[numero].numpoint].numbat=numero
			end
			if mineinfo[minecpt].nbmine1~=nil then
				intersection[mineinfo[minecpt].nbmine1].numbat=numero
			end
			if not goh then
				ibatiment[numero].xScale=0.25
			else
				ibatiment[numero].xScale=0.35
			end
			ibatiment[numero].yScale=ibatiment[numero].xScale
			ibatiment[numero]:setFrame(1)
			if goh then
				ibatiment[numero].group=mathfloor(ibatiment[numero].y1+ibatiment[numero].height*0.5*ibatiment[numero].yScale)+1024
			else
				ibatiment[numero].group=mathfloor(ibatiment[numero].y1)+1024+10
			end
			ibatiment[numero].type1=3
			ibatiment[numero].niveau=1
			ibatiment[numero].typebat=3*3*5+1
			group[ibatiment[numero].group]:insert(ibatiment[numero])
			local distmin=(chemin[1].x-ibatiment[numero].x1)^2+(chemin[1].y+ibatiment[numero].pole-ibatiment[numero].y1)^2
			local chemini=1
			for i=2,cheminnb,1 do
				local dist1=(chemin[i].x-ibatiment[numero].x1)^2+(chemin[i].y+ibatiment[numero].pole-ibatiment[numero].y1)^2
				if(distmin> dist1) then
					distmin=dist1
					chemini=i
				end
			end
			--print("chemini"..chemini)
			ibatiment[numero].ptproche=chemini
			print("point proche mine "..ibatiment[numero].ptproche)
			--nbsoldat=nbsoldat+1
			local num=findnbsoldat(0) --nbsoldat
			isoldat[num]={}
			isoldat[num].xposi=0
			isoldat[num].yposi=0
			ibatiment[numero].numsol=num
			isoldat[num].mine=true
			isoldat[num].vie=100
			isoldat[num].point=1
			isoldat[num].vietotale=isoldat[num].vie
			isoldat[num].x1=ibatiment[numero].x1+batimentinit[3][0][1].x
			isoldat[num].y1=ibatiment[numero].y1+batimentinit[3][0][1].y
			isoldat[num].centrex=0
			isoldat[num].centrey=0
			isoldat[num].effetvern=0
			isoldat[num].effetvero=0
			isoldat[num].timeatt=10000
			isoldat[num].attx=0
			isoldat[num].atty=0
			isoldat[num].vivant=false -- true
			isoldat[num].ennemi=0 	-- si 0 : pas de conflit en cours sinon : numero du soldat
			isoldat[num].nbennemi=0 
			isoldat[num].pv3=false
			isoldat[num].orientation=0
			isoldat[num].numbat=numero
			isoldat[num].classe=5--cavalrie
			isoldat[num].niveau=1
			isoldat[num].attaque=0
			isoldat[num].vitesse=0.5
			isoldat[num].blocnbennemi=10
			isoldat[num].tir=1
			isoldat[num].direction=1
			isoldat[num].pole=pole
			isoldat[num].rectvie=display.newRect(ibatiment[numero].x1,ibatiment[numero].y1-30, 40, 2 )--ibatiment[numero].group+20
			--group[ibatiment[numero].group+20]:insert(isoldat[num].rectvie)
			isoldat[num].rectvie:setFillColor( 0,1,0 )
			isoldat[num].rectvie.alpha=0
			isoldat[num].encombat=0
			isoldat[num].porte=40
			isoldat[num].height=ibatiment[numero].height*ibatiment[numero].yScale
			isoldat[num].width=ibatiment[numero].width*ibatiment[numero].xScale
			print("la mine a comme numero de soldat: "..num)
			-- local zone1bis=(isoldat[num].y1)/619*4 --deux données en une
			-- local zone1y=mathfloor(zone1bis*0.5)+2
			-- local zone2y=mathfloor((zone1bis)*0.5+0.5)+2
			-- zone1bis=(isoldat[num].x1)/1229*6 --deux données en une
			-- local zone1x=mathfloor(zone1bis*0.5)+2
			-- local zone2x=mathfloor((zone1bis)*0.5+0.5)+2
			-- isoldat[num].zone1=zone1y*3+zone1x
			-- isoldat[num].zone2=zone2y*3+zone2x

			local zone1bis=(isoldat[num].y1)/619*2 --deux données en une
			local zone1y=mathfloor(zone1bis)+2
			local zone2y=mathfloor((zone1bis)+0.5)+2
			zone1bis=(isoldat[num].x1)/1229*3 --deux données en une
			local zone1x=mathfloor(zone1bis)+3
			local zone2x=mathfloor(zone1bis+0.5)+3
			isoldat[num].zone1=zone1y*4+zone1x
			isoldat[num].zone2=zone2y*4+zone2x
			isoldat[num].zone3=zone2y*4+zone1x
			isoldat[num].zone4=zone1y*4+zone2x


			initia(numero)
			miseajourvalevol(numero)
			finmiseajourevol(numero,3)
			ibatiment[numero].sup=0
			ibatiment[numero].endev=0
			ibatiment[numero].timedep=1
			ibatiment[numero].chargement=display.newRect(group[ibatiment[numero].group],ibatiment[numero].x1+50,ibatiment[numero].y1,8,52)
			ibatiment[numero].chargement.strokeWidth=1
			ibatiment[numero].chargement:setFillColor(0,0)
			ibatiment[numero].chargement:setStrokeColor( 1, 1, 0 )
			ibatiment[numero].chargement.alpha=0
			ibatiment[numero].chargement1=display.newRect(group[ibatiment[numero].group],ibatiment[numero].x1+50,ibatiment[numero].y1,6,0)
			ibatiment[numero].chargement1:setFillColor(0.8,0.8,0.2)
			ibatiment[numero].chargement1.alpha=0
			ibatiment[numero].chargement1.cpt=0
					local sequenceData =
			{
			    name="echafau",
			    frames= {1,2,3,4,5}, -- frame indexes of animation, in image sheet
			    time = 3000,           -- Optional. In ms.  If not supplied, then sprite is frame-based.
			    loopCount = 1        -- Optional. Default is 0.
			}
			ibatiment[numero].echafaudage=display.newSprite(imageecha, sequenceData )
			ibatiment[numero].echafaudage.x=ibatiment[numero].x1
			ibatiment[numero].echafaudage.y=ibatiment[numero].y1
			ibatiment[numero].echafaudage.xScale=ibatiment[numero].xScale
			ibatiment[numero].echafaudage.yScale=ibatiment[numero].yScale
			if goh then
				ibatiment[numero].echafaudage.x=ibatiment[numero].echafaudage.x+batimentinit[3][0][1].x+batimentinit[3][0][2].xecha
				ibatiment[numero].echafaudage.y=ibatiment[numero].echafaudage.y+batimentinit[3][0][1].y+batimentinit[3][0][2].yecha
				ibatiment[numero].echafaudage.xScale=0.2*batimentinit[3][0][2].scaleecha
				ibatiment[numero].echafaudage.yScale=ibatiment[numero].echafaudage.xScale
			end
			ibatiment[numero].echafaudage.isVisible=false
			ibatiment[numero].echafaudage:setSequence( "echafau" )
			ibatiment[numero].echafaudage.group=ibatiment[numero].group+1
			group[ibatiment[numero].echafaudage.group]:insert(ibatiment[numero].echafaudage)

			ibatiment[numero].recuptune=display.newImage(imbouton.batiment,12) -- (imbouton.fric,1)
			ibatiment[numero].recuptune.x=ibatiment[numero].x1
			ibatiment[numero].recuptune.y=ibatiment[numero].y1
			if not goh then
				ibatiment[numero].recuptune.xScale=0.35*apparence
			else
				ibatiment[numero].recuptune.xScale=0.2*apparence
			end
			ibatiment[numero].recuptune.yScale=ibatiment[numero].recuptune.xScale
			ibatiment[numero].recuptune.isVisible=false
			ibatiment[numero].recuptune.group=ibatiment[numero].group+2
			group[ibatiment[numero].recuptune.group]:insert(ibatiment[numero].recuptune)
			ibatiment[numero].recuptune.clic=0
			group[ibatiment[numero].group+20]:insert(isoldat[num].rectvie)
			ibatiment[numero].etat=-1 -- etat de degradation de la mine, -1 signifie qu'il n'y a pas d'anim de créé sur la degradation
			ibatiment[numero].xf=ibatiment[numero].x1-23
			ibatiment[numero].yf=ibatiment[numero].y1-9
			if goh then
				ibatiment[numero].xf=ibatiment[numero].x1
				ibatiment[numero].yf=ibatiment[numero].y1
			end
		end
	end
end
end
t.mine = function ()
	
end
return (t)