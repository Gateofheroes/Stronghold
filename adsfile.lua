local t={}
t.adsfile=function()
	local admob
	local publife=false -- false pour menu bonus et true new life
	local adsloading=false
	local initfinish=false
	local adsshortload=false
	local timerfini=true
	local function timerfin()
		timerfini=false
		local function timerfinifunc(event)
			timerfini=true
		end
		timer.performWithDelay(45000,timerfinifunc)
	end
	if not premium then
		local function timerevent(event)
			admob = require( "plugin.admob" )
			local function adListener(event)
				if ( event.phase == "init" ) then  -- Successful initialization
					initfinish=true
					print( event.provider )
				elseif event.phase=="reward" then
					if publife then
						adsseen()
					end
				end
			end
			local testMode1=false
			if issimulator then
				testMode1=true
			end
			if goh and not gohForStronghold then
				admob.init( adListener, { appId="ca-app-pub-9109504201480085~3754083855",testMode=testMode1 } )
			else
				admob.init( adListener, { appId="ca-app-pub-9109504201480085~6649273455",testMode=testMode1 } )
			end
		end
		timer.performWithDelay(500,timerevent)
	end
	function loadadsnewlife()
		if not premium then
			-- adsIsWatch=false
			if pubvie and initfinish then
				if not admob.isLoaded( "rewardedVideo" ) and not adsloading then
					if not goh or gohForStronghold then
						admob.load( "rewardedVideo", { adUnitId="ca-app-pub-9109504201480085/4510963454"})
					else
						admob.load( "rewardedVideo", { adUnitId="ca-app-pub-9109504201480085/5230817051" } )
					end
					adsloading=true
				end
			end
		end
	end
	function loadsbonus()
		if not premium and initfinish and ((not savegame.bonuspaid and goh) or (not savegame.inapp and not goh)) then
			if (not admob.isLoaded( "interstitial" ) and not adsloadingbonus) or adsshortload then
				if goh and not gohForStronghold then
					admob.load( "interstitial", { adUnitId="ca-app-pub-9109504201480085/3416006651" } )
				else
					admob.load( "interstitial", { adUnitId="ca-app-pub-9109504201480085/8126006651" } )
				end
				adsloadingbonus=true
				adsshortload=false
			end
		end
	end
	function loadshortads()
		if not premium and initfinish and ((not savegame.bonuspaid and goh) or (not goh and not savegame.inapp)) then
			if (not admob.isLoaded( "interstitial" ) and not adsloadingbonus) or not adsshortload then
				if goh and not gohForStronghold then
					admob.load( "interstitial", { adUnitId="ca-app-pub-9109504201480085/1704954255" } )
				else
					admob.load( "interstitial", { adUnitId="ca-app-pub-9109504201480085/8326981813" } )
				end
				adsloadingbonus=true
				adsshortload=true
			end
		end
	end

	function adsloadnewlife()
		local adsload=false
		if not premium and pubvie and initfinish then
			if admob.isLoaded( "rewardedVideo" ) then
				adsload=true
			elseif issimulator then
				adsload=true
			end
		end
		return adsload
	end
	function showadslife()
		publife=true
		if not premium and initfinish then
			admob.show( "rewardedVideo" )
			adsloading=false
		end
	end
	function showshortads(loadnext)
		publife=false
		if not premium and initfinish and timerfini and ((goh and not savegame.bonuspaid) or (not goh and not savegame.inapp)) and savegame.tuto3 then
			if admob.isLoaded("interstitial") then
				admob.show( "interstitial" )
				adsloadingbonus=false
				timerfin()
			end
			if loadnext~=nil then
				local function timerloadnext(event)
					loadshortads()
				end
				timer.performWithDelay( 1000,timerloadnext) --50
			end
		end
	end
	function showadsplaybonus(loadnext,wait)
		publife=false
		if not premium and initfinish and timerfini and ((goh and not savegame.bonuspaid) or (not goh and not savegame.inapp)) and savegame.tuto3 then
			if admob.isLoaded("interstitial") or wait~=nil then
				admob.show( "interstitial" )
				adsloadingbonus=false
				--loadsbonus()
				timerfin()
			end
			if loadnext~=nil then
				local function timerloadnext(event)
					loadsbonus()
				end
				timer.performWithDelay( 1000,timerloadnext) --50
			end
		end
	end
end
return (t)