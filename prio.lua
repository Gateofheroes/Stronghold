local t={}--une partie de la gestion des priorité entre les differents boutons
function initclicprio()
	clicsurqqc=false
end
function clicsurqqcfunc()
	if clicsurqqc==true then
		timer.cancel(timerprioclic)
	end
	clicsurqqc=true
	local function timerprioclic1 (event)
		clicsurqqc=false
	end
	timerprioclic=timer.performWithDelay( 400,timerprioclic1 )	
end
