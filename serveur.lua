local t={}
if true then
	--local loadsave = require("loadsave")
	-- local envoipartie=false
	-- local envoieerror=false
	-- local function networkListener( event )
	--    if ( event.isError ) then
	--       print( "Network Error." )
	--    else
	-- 		if ( event.phase == "began" ) then
	-- 		elseif ( event.phase == "progress" ) then
	-- 		elseif ( event.phase == "ended" ) then
	-- 			print("fichier envoyer avec succes")
	-- 			if envoipartie then
	--       		envoipartie=false
	-- 		    saveret=nil
	-- 			if saveret==nil then
	-- 				saveret={}
	-- 				saveret.id=system.getInfo("deviceID")
	-- 				saveret.name=system.getInfo("name")
	-- 				saveret.androidAppVersionCode=system.getInfo("androidAppVersionCode")
	-- 				saveret.appVersionString=system.getInfo("appVersionString")
	-- 				if saveret.appVersionString==nil then
	-- 					saveret.appVersionString="0"
	-- 				end
	-- 				saveret.build=system.getInfo("build")
	-- 				saveret.reinit=0
	-- 			end
	-- 			-- saveret.reinit=saveret.reinit+reinit1
	-- 			saveret.appVersionString=system.getInfo("appVersionString")
	-- 			if saveret.appVersionString==nil then
	-- 				saveret.appVersionString="0"
	-- 			end
	-- 			local loadsave = require("loadsave")
	-- 			loadsave.saveTable(saveret,"undeuxtroissoleilretinf.json")
	-- 			end
	-- 			if envoieerror then
	-- 				envoieerror=false
	-- 				loadsave.saveTable(nil, "undeuxtroissoleilbug.json" )
	-- 			end
	-- 		end
	-- 	end
	-- end
	-- local headers = {}
	-- headers["Content-Type"] = "application/x-www-form-urlencoded"
	-- headers["Accept-Language"] = "en-US"

	-- local filejson=loadsave.loadTable("undeuxtroissoleilretinf.json")
	-- print(filejson)
	-- filejson=json.encode(filejson)
	-- print(filejson)
	function evnoiedesfichier()

		if true then -- envoi des parties
			local function networkListener( event )
			   if ( event.isError ) then
			      print( "Network Error." )
			   else
					if ( event.phase == "began" ) then
					elseif ( event.phase == "progress" ) then
					elseif ( event.phase == "ended" ) then
						print("fichier envoyer avec succes")
						--if envoipartie then
			      		--envoipartie=false
					    saveret=nil
						if saveret==nil then
							saveret={}
							saveret.id=system.getInfo("deviceID")
							saveret.name=system.getInfo("name")
							saveret.androidAppVersionCode=system.getInfo("androidAppVersionCode")
							saveret.appVersionString=system.getInfo("appVersionString")
							if saveret.appVersionString==nil then
								saveret.appVersionString="0"
							end
							saveret.build=system.getInfo("build")
							saveret.reinit=0
						end
						-- saveret.reinit=saveret.reinit+reinit1
						saveret.appVersionString=system.getInfo("appVersionString")
						if saveret.appVersionString==nil then
							saveret.appVersionString="0"
						end
						local loadsave = require("loadsave")
						loadsave.saveTable(saveret,"undeuxtroissoleilretinf.json")
						-- end
						-- if envoieerror then
						-- 	envoieerror=false
						-- 	loadsave.saveTable(nil, "undeuxtroissoleilbug.json" )
						-- end
					end
				end
			end
			local headers = {}
			headers["Content-Type"] = "application/x-www-form-urlencoded"
			headers["Accept-Language"] = "en-US"
			local contents = ""
			if true then
				local json=require("json")
				local path=system.pathForFile("undeuxtroissoleilretinf.json",system.DocumentsDirectory)
				local file=io.open( path, "r" )
				if file then
					contents=file:read( "*a" )
					io.close( file )
				end
			end
			if string.len(contents)>100 then
				--envoipartie=true
				local body="json="..contents
				local params = {}
				params.headers = headers
				params.body = body
				network.request("https://stats.arthafrance.com", "POST", networkListener, params )
			end
		end

		if true then -- envoi des rapports d'erreur
			local function networkListener( event )
			   if ( event.isError ) then
			      print( "Network Error." )
			   else
					if ( event.phase == "began" ) then
					elseif ( event.phase == "progress" ) then
					elseif ( event.phase == "ended" ) then
						local loadsave = require("loadsave")
							loadsave.saveTable(nil, "undeuxtroissoleilbug.json" )
					end
				end
			end
			local headers = {}
			headers["Content-Type"] = "application/x-www-form-urlencoded"
			headers["Accept-Language"] = "en-US"
			local contents = ""
			if true then
				local json=require("json")
				local path=system.pathForFile("undeuxtroissoleilbug.json",system.DocumentsDirectory)
				local file=io.open( path, "r" )
				if file then
					contents=file:read( "*a" )
					io.close( file )
				end
			end
			if string.len(contents)>10 then
				local body="json="..contents
				--envoieerror=true
				local params = {}
				params.headers = headers
				params.body = body
				network.request("https://stats.arthafrance.com/errors.php", "POST", networkListener, params )
			end
		end
	end
	function envoiedelasauvegarde(letexte)
		if true then -- envoi des sauvegarde
			savegame.share=1
			local loadsave = require("loadsave")
			loadsave.saveTable(savegame, "undeuxtroissoleil.json" )
			local id
			local function networkListener( event )
			   if ( event.isError ) then
			      print( "Network Error." )
			      if letexte~=nil then
			      	letexte.text="Error Please retry"
			      end
			   else
					if ( event.phase == "began" ) then
					elseif ( event.phase == "progress" ) then
						if letexte~=nil then
							letexte.text="Loading"
						end
					elseif ( event.phase == "ended" ) then
						print("fichier envoyer avec succes (sauvegarde)")
						print ( "RESPONSE: " .. event.response )
						if event.response==tostring(id) then
							if letexte~=nil then
								letexte.text=id
							end
						else
							if letexte~=nil then
								letexte.text="An error occured please retry"
							end
						end
					end
				end
			end
			local headers = {}
			headers["Content-Type"] = "application/x-www-form-urlencoded"
			headers["Accept-Language"] = "en-US"
			math.randomseed( os.time() )
			local idpre=math.random()
			if idpre<0.1 then
				idpre=idpre+0.1
			end
			id=mathfloor(idpre*10^10)
			print("\n\n\n\n\n\n\n\n\nID online savegame is "..id)
			local contents =""..id
			if true then
				local json=require("json")
				local path=system.pathForFile("undeuxtroissoleil.json",system.DocumentsDirectory)
				local file=io.open( path, "r" )
				if file then
					contents=contents.."debutdufichiernor"..file:read( "*a" )
					io.close( file )
				end
				if true then
					local json=require("json")
					local path=system.pathForFile("undeuxtroissoleilbis.json",system.DocumentsDirectory)
					local file=io.open( path, "r" )
					if file then
						contents=contents.."findufichierdebutdufichierbis"..file:read( "*a" )
						io.close( file )
					end
				end
				if true then
					local json=require("json")
					local path=system.pathForFile("undeuxtroissoleilter.json",system.DocumentsDirectory)
					local file=io.open( path, "r" )
					if file then
						contents=contents.."findufichierdebutdufichierter"..file:read( "*a" )
						io.close( file )
					end
				end
			end
			local body="json="..contents.."findufichier"
			print("contents"..contents)
			local params = {}
			params.headers = headers
			params.body = body
			network.request("https://stats.arthafrance.com/savegame.php", "POST", networkListener, params )
		end
		return id
	end
	local function removesavegame(id)
		local function networkListener( event )
			if ( event.isError ) then
				print( "Network Error." )
			else
				if ( event.phase == "began" ) then
					print("begin")
				elseif ( event.phase == "progress" ) then
					print("in progress")
				elseif ( event.phase == "ended" ) then
					print("save game remove correctly\n\n\n\n\n\n"..event.response)
				end
			end
		end
		local headers = {}
		headers["Content-Type"] = "application/x-www-form-urlencoded"
		headers["Accept-Language"] = "en-US"
		local body="json="..id
		-- print("contents"..contents)
		local params = {}
		params.headers = headers
		params.body = body
		network.request("https://stats.arthafrance.com/savegameremove.php", "POST", networkListener, params )
	end
	local function affresultat(posneg)
		local affresultat=display.newEmbossedText("",contentcenterx,contentcentery,fonttype,35*fontsize)
		if posneg then
			affresultat.text="The savegame is imported!"
		else
			affresultat.text="An error occure please retry"
		end
		affresultat.xScale=0.5
		affresultat.yScale=0.5
		local function timertofront(event)
			affresultat:toFront()
		end
		timer.performWithDelay(100,timertofront,20)
		transition.to(affresultat,{time=2000,xScale=1,yScale=1})
		local finaffresultat=function(obj)
			obj:removeSelf()
			obj=nil
		end
		transition.to(affresultat,{delay=1500,time=2500,alpha=0,onComplete=finaffresultat}) 
	end
	local function copiedelasauvegarde(response,letexte,id)
		response=string.sub(response,10)
		print("Etape 0 "..response)
		print("Debut etape suivante")
		-- print(string.gmatch(response,"debutdufichier.-findufichier"))
		-- print("yo")
		local succed=true
		for w in response:gmatch("debutdufichier.-findufichier") do
			print("Match")
			local prefix=string.sub(w,15,17)
			print("prefix "..prefix)
			local fichierc=string.sub(w,18)
			fichierc=string.sub(fichierc,1,-13)
			print("Fichier suivant") 
			print(fichierc)
			if prefix=="nor" then
				prefix=""
				fichierc=string.gsub(fichierc,'"id":".-"','"id":"'..system.getInfo("deviceID")..'"')
			end
			print("prefix undeuxtroissoleil"..prefix..".json")
			if prefix=="bis" then
				fichierc=string.gsub(fichierc,"e ","e")
				fichierc=string.gsub(fichierc,"E ","e")
			end
			local path = system.pathForFile("undeuxtroissoleil"..prefix..".json",system.DocumentsDirectory)
			print("path "..path)
			local file = io.open(path, "w")
			print("file ouvert")
			if file then
				print("file en ecriture")
			    file:write(fichierc)
			    io.close( file )
			    print("file fini")
			    --return true
			else
				succed=false
				affresultat(false)
				print("erreur")
			    --return false
			end
			print("fin d'enregistrement fichier")
		end
		print("fin copie sauvegarde")
		--local un, bis, ter = response:match("([.]+)debutdufichier([.]+)")
		-- print("")
		-- print(un)
		-- print("")
		-- print(bis)
		-- print("")
		-- print(ter)
		-- for i in string.gmatch(response, "debutdufichier") do
		--   print(i)
		-- end
		if letexte~=nil then
			letexte.fini=true
		end
		if succed then
			affresultat(true)
			removesavegame(id)
		end
	end
	function demandedesauvegarde(id,letexte)
		if letexte~=nil then
			letexte.text="Loading"
		end
		print("demande sauvegarde")
		if true then
			local reponse=""
			local function networkListener( event )
				if ( event.isError ) then
					if letexte~=nil then
						letexte.text="Error 0"
						letexte.fini=true
					end
					print( "Network error: ", event.response )
					affresultat(false)
				else
					if ( event.phase == "began" ) then
					elseif ( event.phase == "progress" ) then
					elseif ( event.phase == "ended" ) then
						print ( "RESPONSE: " .. event.response )
						local letextecopie=tostring(event.response)
						print("Reponse string "..letextecopie)
						local idreponse=string.sub(letextecopie,1,10)
						print("ID reponse "..idreponse)
						if idreponse==tostring(id) then
							print("Succes 1")
							copiedelasauvegarde(event.response,letexte,id)
						else
							print("Error 1")
							if letexte~=nil then
								letexte.text="Error 1"
								letexte.fini=true
							end
						end
					end
				end
			end
			network.request( "https://stats.arthafrance.com/files/savegame/file_"..id..".json", "POST", networkListener )
		end
	end

end
function t.new()

end
return t 