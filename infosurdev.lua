local t={}
t.test= function ()
	
end
local showsomething=false
local groupdaffinfo
local imagini
local imagfin
local boutondev
local stringtag="afficheanim"
local boutonfini=function(obj)
	transition.cancel(stringtag)
	display.remove(imagini)
	imagini=nil
	display.remove(imagfin)
	imagfin=nil
	display.remove(boutondev)
	boutondev=nil
	display.remove(groupdaffinfo)
	groupdaffinfo=nil
end
local boutoncancel=function (obj)
	--display.remove(groupdaffinfo)
end
function afficheanim(inf1,inf2,inf3,barverx)
	print("wesh maggle "..inf1.." "..inf2.." "..inf3)
	if chargementdesfichier[5]==1 and inf2<=2 then
		local a=boutonfini()
		groupdaffinfo=display.newGroup()
		groupdaffinfo.x=barverx
		groupdaffinfo.y=contentcentery
		local stringimg=""
		if inf2==1 then
			stringimg="distance"
		else
			stringimg="contact"
		end
		local typebat=1
		local niveaubat
		if inf3<5 then
			typebat=1
			niveaubat=inf3
		elseif inf3<9 then
			typebat=0
			niveaubat=inf3-4
		else
			typebat=2
			niveaubat=inf3-8
		end
		if niveaubat<4 then
			if niveaubat>1 then
				imagini=display.newImage(imgbat[stringimg],typebat*3+niveaubat-1)
				imagini.xScale=0.3
			else
				if inf2==1 then
					imagini=display.newImage(imgbat.arc,1)
					imagini.xScale=0.5
				else
					imagini=display.newImage(imgbat.inf,1)
					imagini.xScale=0.4
				end
				if not goh and inf2==1 then
					imagini.xScale=imagini.xScale*0.6
				end
			end
			if not goh then
				imagini.xScale=imagini.xScale*0.7
			end
			groupdaffinfo:insert(imagini)

			--imagini.xScale=0.3
			--imagini.yScale=0.3
			imagfin=display.newImage(imgbat[stringimg],typebat*3+niveaubat)
			imagfin.alpha=0
			imagfin.xScale=0.3
			if inf2==2 then
				imagfin.xScale=imagfin.xScale*1.5
				if niveaubat>1 then
					imagini.xScale=imagini.xScale*1.5
				end
			end
			if not goh then
				imagfin.xScale=imagfin.xScale*0.7
			end
			if not goh and inf2~=1 then
				imagfin.xScale=imagfin.xScale*0.6
				imagini.xScale=imagini.xScale*0.6
			end
			imagini.yScale=imagini.xScale
			imagfin.yScale=imagfin.xScale
			groupdaffinfo:insert(imagfin)
			if imagini.yScale*imagini.height*1.5>actualcontentheight then
				groupdaffinfo.xScale=actualcontentheight/(imagini.yScale*imagini.height*1.5)
				groupdaffinfo.yScale=groupdaffinfo.xScale
			end
			local numbouton=typebat+3
			if inf2==1 then
				numbouton=numbouton+3
			end
			if numbouton==3 then
				numbouton=2
			end
			boutondev=display.newImage(imbouton.batiment,numbouton)
			boutondev.xScale=0.2
			boutondev.yScale=boutondev.xScale
			boutondev.y=-boutondev.height*boutondev.yScale*0.6-imagini.height*imagini.yScale*0.6
			groupdaffinfo:insert(boutondev)
			transition.to(boutondev,{delay=100,time=400,transition=easing.inCirc,y=0,xScale=boutondev.yScale*0.75,yScale=boutondev.yScale*0.75,tag=stringtag})
			transition.to(boutondev,{delay=500,time=100,transition=easing.inCirc,alpha=0,tag=stringtag})
			transition.to(groupdaffinfo,{delay=600,time=800,transition=easing.inCirc,alpha=0,onComplete=boutonfini, onCancel=boutoncancel,tag=stringtag})
			transition.from(imagfin,{delay=500,time=100,transition=easing.inCirc,xScale=imagfin.yScale*0.75,yScale=imagfin.yScale*0.75,tag=stringtag})
			transition.to(imagfin,{delay=500,time=100,transition=easing.inCirc,alpha=1,tag=stringtag})
			transition.to(imagini,{delay=500,time=100,transition=easing.inCirc,xScale=imagini.yScale*0.75,yScale=imagini.yScale*0.75,tag=stringtag})
			transition.from(imagini,{delay=500,time=100,transition=easing.inCirc,alpha=1,tag=stringtag})
		end
		-- 1 1 1 cata
		-- 1 1 2 ona
		-- 1 1 3 tre
		-- 1 1 5 arc2
		-- 1 1 6 arc3

		-- 1 1 9 liq

		-- 1 2 1 cav
	end
end
return t