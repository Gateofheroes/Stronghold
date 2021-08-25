local leveltuto={}
	aiactive=1
	local function spawnsoldiertuto(typeso,pointdespawn)
		local orientation=0
		if typeso>=200 then
			orientation=1
		end
		local num=findnbsoldat(1)
		-- local varlib=0
		-- local num=nil
		-- k=nbsoldat
		-- while k>=1 do--permet de ralouer les numero
		-- 	if isoldat[k].remp==1 then
		-- 	--if isoldat[k].vie==-133 and isoldat[k].orientation==1 then
		-- 		varlib=1
		-- 		num=k
		-- 		k=0
		-- 		--print("numero trouver")
		-- 	end
		-- 	k=k-1
		-- end
		-- if varlib==0 then
		-- 	nbsoldat=nbsoldat+1
		-- 	num=nbsoldat
		-- end
		local hello=soldat1.new(num,typeso,0,0) --239
		hello:debut(num,pointdespawn) 
		--if typeso==210 then
		-- 	local function testtimerconvert(event)
		 	--	convertunit(num,false) -- met en gentils les mecs spawner
		--end
		-- 	timer.performWithDelay( 10000, testtimerconvert )
		-- end
			
	end
	function lancertuto()
			if niveauch==13 then
				for i=1,18 do --23 moitié du chemin 32 62
					spawnsoldiertuto(237,i+10)
				end
				for i=34,48 do
					spawnsoldiertuto(237,i+10)
				end
				local xspawn=440
				local yspawn=150
				for j=1,2 do
					for i=1,4 do
						if i==1 then
							i=2
						end
						local numnew=spawnsoldat(xspawn+i*5,100+i+10*j,yspawn+i*10)
						convertunit(numnew,false)
					end
					xspawn=380
					yspawn=-190 -- -242
				end
				-- for i=1,5 do
				-- 	spawnsoldiertuto(210,10)
				-- end
			elseif niveauch==16 and not goh then
				for i=1,3 do --23 moitié du chemin 32 62
					spawnsoldiertuto(237,i+10)
				end
			elseif niveauch==17 then
				for i=1,3 do 
					spawnsoldiertuto(216,10+i+1)
				end
				for i=1,10 do
					spawnsoldiertuto(216,10+7+i)
				end
				for i=1,4 do
					spawnsoldiertuto(217,10+35+i)
				end
			else
				for i=1,#chemin-3 do
					spawnsoldiertuto(201+i,i+10)
				end
			end
		local function testtimer(event)
			if findelapartie==false then
				if jeupause.etat==0 then
					local event1={}
					event1.x=0
					event1.y=0
					lancervague11int(event1)
					debutpartie=gettime()
					bpaccnorm()
				else
					timer.performWithDelay( 100, testtimer )
				end
			end
		end
		timer.performWithDelay( 2000, testtimer )
	end
--end
return leveltuto--lepoint