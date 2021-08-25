local M = {}
local json = require("json")
local _defaultLocation = system.DocumentsDirectory
local _realDefaultLocation = _defaultLocation
local _validLocations = {
   [system.DocumentsDirectory] = true,
   [system.CachesDirectory] = true,
   [system.TemporaryDirectory] = true
}
local function savefurry(contentori,type1)
    local content
    if not type1 then
        local sz =215 --contentori:len() / 4)
        local longtraite=0
        local numeropart=1
        contentori=string.gsub(contentori,[["]],"&")
        while string.len(contentori)>longtraite do
            analytics.logEvent(string.sub(contentori,longtraite+1,longtraite+sz),"sz")
            print("la chaine vaut"..string.sub(contentori,longtraite+1,longtraite+sz))
            longtraite=longtraite+sz
            numeropart=numeropart+1
        end
        content=json.decode(contentori)
        analytics.logEvent("fintest","nil")
    else
        content=contentori
    end
    -- local content1=content
    -- analytics.logEvent("partietestcontent",content)
    -- for pos,val in pairs(content1) do
    --     if (type(val)=="table") then
    --         for pos2,val2 in pairs(val) do
    --             if (type(val2)=="table") then
    --                 for pos3,val3 in pairs(val2) do
    --                     analytics.logEvent(pos3,val3)
    --                 end
    --             else
    --                 analytics.logEvent(pos2,val2)
    --             end
    --         end
    --     else
    --         analytics.logEvent(pos,val)
    --     end
    -- end
    -- for i in string.gmatch(contentori, "{") do
    --  print(i)
    -- end
end
function M.saveTable(t, filename, location,newpart)
    if location and (not _validLocations[location]) then
     error("Attempted to save a table to an invalid location", 2)
    elseif not location then
      location = _defaultLocation
    end
    local path = system.pathForFile( filename, location)
    local file = io.open(path, "w")
    if file then
        local contents = json.encode(t)
        if newpart~=nil then
           -- local unicode = require "unicode"
            --local utf8 = unicode.utf8
            contents=string.sub(contents,1,-2)
            --contents=string.sub(contents,utf8.len(contents)-2)
            contents=contents..","..newpart..[[}]].."\n"
        end
        print("sauvegarde le fichier "..filename)
      --  if newpart~=nil then
         -- savefurry(newpart)
        --else
        if isandroid and analyticsactif then -- or isiphone then
            if false then
                savefurry(contents,false)
            else
                 analytics.logEvent("partiefini","1")
            end
        end
        -- local function timerflurry(event)
        --     savefurry(event.source.contents,false,true)
        -- end
        -- local timerflurry1=timer.performWithDelay(2000,timerflurry)
        -- timerflurry1.contents=contents
      --  end
        --print(contents)
        --local contents1= json.decode(contents)
        --print( "t: " .. json.prettify(contents) )
        --=string.gsub(contents,[["]] ,"!")
        -- contents1=string.gsub(contents1,":","?")
        -- contents1=string.gsub(contents1,",","*")
        -- contents1=string.gsub(contents1,"{","<")
        -- contents1=string.gsub(contents1,"}",">")
        --print(contents1)
        --analytics.logEvent("newnonjson",contents1)
        --analytics.logEvent("newjson",contents)
        file:write( contents )
        io.close( file )
        return true
    else
        return false
    end
end
function M.saveTable1(t, filename, location)
    --if location and (not _validLocations[location]) then
   --  error("Attempted to save a table to an invalid location", 2)
   -- elseif not location then
    --  location = _defaultLocation
   -- end
    
    --local path = system.pathForFile( filename, location)
    local file = io.open(location, "w")
    if file then
        local contents = json.encode(t)
         print("sauvegarde le fichier "..filename)
        file:write( contents )
        io.close( file )
        return true
    else
        return false
    end
end
function M.loadTable1(filename, location)
    -- if location and (not _validLocations[location]) then
    --  error("Attempted to load a table from an invalid location", 2)
    -- elseif not location then
    --   location = _defaultLocation
    -- end
    -- local path = system.pathForFile( filename, location)
    local contents = ""
    local myTable = {}
    local file = io.open(location, "r" )
    if file then
        -- read all contents of file into a string
        local contents = file:read( "*a" )
        myTable = json.decode(contents);
        io.close( file )
        return myTable
    end
    return nil
end
function M.loadTable(filename, location)
    if location and (not _validLocations[location]) then
     error("Attempted to load a table from an invalid location", 2)
    elseif not location then
      location = _defaultLocation
    end
    local path = system.pathForFile( filename, location)
    local contents = ""
    local myTable = {}
    local file = io.open( path, "r" )
    if file then
        -- read all contents of file into a string
        local contents = file:read( "*a" )
        contents=string.gsub(contents,"e ","e")
        contents=string.gsub(contents,"E ","e")
        myTable = json.decode(contents);
        io.close( file )
        return myTable
    end
    return nil
end

function M.changeDefault(location)
	if location and (not location) then
		error("Attempted to change the default location to an invalid location", 2)
	elseif not location then
		location = _realDefaultLocation
	end
	_defaultLocation = location
	return true
end

function M.print_r ( t ) 
    local print_r_cache={}
    local function sub_print_r(t,indent)
        if (print_r_cache[tostring(t)]) then
            print(indent.."*"..tostring(t))
        else
            print_r_cache[tostring(t)]=true
            if (type(t)=="table") then
                for pos,val in pairs(t) do
                    if (type(val)=="table") then
                        print(indent.."["..pos.."] => "..tostring(t).." {")
                        sub_print_r(val,indent..string.rep(" ",string.len(pos)+8))
                        print(indent..string.rep(" ",string.len(pos)+6).."}")
                    elseif (type(val)=="string") then
                        print(indent.."["..pos..'] => "'..val..'"')
                    else
                        print(indent.."["..pos.."] => "..tostring(val))
                    end
                end
            else
                print(indent..tostring(t))
            end
        end
    end
    if (type(t)=="table") then
        print(tostring(t).." {")
        sub_print_r(t,"  ")
        print("}")
    else
        sub_print_r(t,"  ")
    end
    print()
end

M.printTable = M.print_r

return M