if false then -- reactiver pour verifier la license
	if system.getInfo("environment") ~= "simulator" then
		local licensing = require "licensing"
		licensing.init( "google" )
		 
		local function licensingListener( event )
		  local verified = event.isVerified
		    if event.isVerified then
		    	native.showAlert( "Licensing worked!", "There was no problem verifying the application.", { "OK" } )
		 		display.newText("license verified",0,0,fonttype,20)
		      --THE APP HAS BEEN VERIFIED BY GOOGLE.
		      --DO STUFF, LIKE GO TO ANOTHER SCENE.
		 
		    else
		      native.showAlert( "Licensing Failed!", "There was a problem verifying the application, please try again.", { "OK" } )
		    end
		end
		licensing.verify( licensingListener )
	end
end
local store
local initinappload=false
local prixrapporterfin=0
local prixcou=0
function initinapp()
	if not initinappload then
		initinappload=true
		if isamazon then
			store = require( "plugin.amazon.iap" )
		elseif isandroid then
			store = require( "plugin.google.iap.v3" ) -- code a tester
		else
			store = require( "store" )
		end
		local net = {}
		--------------------------------------------------------------------------------
		local function transactionCallback( event )
		--------------------------------------------------------------------------------
		    -- Processes all events that happen with the store. 
		    local transaction = event.transaction
		    local textinapp
		    local function timerfintextaff(event)
		    	if textinapp~=nil then
		    		textinapp:removeSelf()
		    		textinapp=nil
		    	end
		    end
		    timer.performWithDelay( 2500, timerfintextaff )
		    if ( transaction.state == "purchased" ) then
				if prixrapporterfin==0 or prixrapporterfin==nil then
					local eventname=event.name
					if string.gsub(string.lower(eventname),"%A","")=="unlockbonus" or string.gsub(string.lower(eventname),"%A","")=="unlockallbonuslevelandremoveads" then
						prixrapporterfin=-1
					else
				    	eventname=string.gsub(eventname, "%D", "")
						prixrapporterfin=tonumber(eventname)
					end
				end
		    	--textinapp=display.newText("achat inapp fait      ("..prixcou..")",contentcenterx,contentcentery,fonttype,24)
		    	if prixrapporterfin==-1 then
		    		savegame.bonuspaid=true
					prixrapporterfin=0
					local loadsave = require("loadsave")
					loadsave.saveTable(savegame, "undeuxtroissoleil.json" )
		    	else
					if fric1<0 then
						fric1=-fric1+prixrapporterfin*7
					else
						fric1=-(fric1+prixrapporterfin*7)
					end
					fric1=mathfloor(fric1)
					savegame.diplay=os.clock()
					local fricpos=fric1
					if fricpos<0 then
						fricpos=-fricpos
					end
					savegame.content=(-fricpos/3-1)/savegame.display
					savegame.monney=fricpos/7
					savegame.yomec=savegame.yomec+prixrapporterfin*5
					local loadsave = require("loadsave")
					loadsave.saveTable(savegame, "undeuxtroissoleil.json" )
					-- if lefrictext~=nil then
					-- 	lefrictext.text=fricpos/7
					-- end
					print( "Transaction succuessful!" )
					prixrapporterfin=0
					destructeurinapp()
				end
		    elseif ( transaction.state == "cancelled" ) then

		    	-- textinapp=display.newText("User cancelled transaction.",contentcenterx,contentcentery,fonttype,24)
		        print( "User cancelled transaction." )
		    elseif ( transaction.state == "failed" ) then
		    	textinapp=display.newText("Transaction failed: "..transaction.errorType.." +string= "..transaction.errorString,contentcenterx,contentcentery,fonttype,15)
		        print( "Transaction failed:", transaction.errorType, transaction.errorString )
		        if tonumber(transaction.errorType)==7 and prixrapporterfin==-1 then
		    		savegame.bonuspaid=true
					prixrapporterfin=0
					local loadsave = require("loadsave")
					loadsave.saveTable(savegame, "undeuxtroissoleil.json" )
				end
		    else
		    	textinapp=display.newText("(unknown event)",contentcenterx,contentcentery,fonttype,24)
		        print( "(unknown event)" )
		    end
		end
		if isamazon then
	    	store.init("amazon", transactionCallback ) 
	    elseif isandroid then
			store.init("google", transactionCallback ) 
			--display.newText("google in app",contentcenterx,contentcentery,fonttype,24)
		else
			store.init( "apple", transactionCallback )
		end
	end
end
function reinitinapp()
	if isandroid and not isamazon then
		local storeandro = require( "plugin.google.iap.v3" )
		if goh and not gohForStronghold then
			storeandro.consumePurchase("500gems")
		else
			storeandro.consumePurchase("500_gems")
		end
		storeandro.consumePurchase("2000_gems")
		storeandro.consumePurchase("8000_gems")
		storeandro.consumePurchase("45000_gems")
	end
end
reinitinapp()

function inapp(prix,prixrapporter) 

	--------------------------------------------------------------------------------
	local function purchaseItem()
	--------------------------------------------------------------------------------
	    if store.isActive then
	    	if prix==-1 then
	    		if isamazon then
	    			store.purchase("unlockbonus")
	    		elseif isandroid then
	    			store.purchase("unlockbonus")
	    		else
					store.purchase("unlock_bonus")
				end
	    	elseif prix==1 then
	    		if isamazon then
	    			if goh and not gohForStronghold then
	    				store.purchase("500Gems1")
	    			else
	    				store.purchase("500Gems")
	    			end
	    		elseif isandroid then
	    			--store.consumePurchase("500_gems1")
	    			--display.newText("reset purchase",contentcenterx,contentcentery,fonttype,24)
	    			if goh and not gohForStronghold then
	    				store.purchase("500gems")
	    			else
	    				store.purchase("500_gems")
	    			end
	    		else
	    			if not goh or isandroid then
						store.purchase("500_gems")
					else
						store.purchase("500_gems1")
					end
				end
			elseif prix==2 then
				if isamazon then
					if goh then
	    				store.purchase("2000Gems1")
	    			else
	    				store.purchase("2000Gems")
	    			end
	    		elseif isandroid then
					store.purchase("2000_gems")
					--display.newText("set purchase",contentcenterx,contentcentery,fonttype,24)
				else
					if not goh or isandroid then
						store.purchase("2000_gems")
					else
						store.purchase("2000_gems1")
					end
				end
			elseif prix==3 then
				if isamazon then
					if goh then
	    				store.purchase("8000Gems1")
	    			else
	    				store.purchase("8000Gems")
	    			end
	    		else
	    			if not goh or isandroid then
						store.purchase("8000_gems")
					else
						store.purchase("8000_gems1")
					end
				end
			else
				if isamazon then
					if goh then
	    				store.purchase("45000Gems1")
	    			else
	    				store.purchase("45000Gems")
	    			end
	    		else
	    			if not goh or isandroid then
						store.purchase("45000_gems")
					else
						store.purchase("45000_gems1")
					end
				end
			end
	    end
	end
	--net.purchaseItem = purchaseItem
	prixrapporterfin=prixrapporter
	prixcou=prix
	purchaseItem()
	--return net
end

-- display.newText("license verified",0,0,fonttype,20)