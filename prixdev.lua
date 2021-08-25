local t={}--definit le prix des differents devellopement pendant le jeu
function prixdeve()
	prix={}--premier nombre est le type 1, le deux type2 et le troisieme est le niveau--------------------------------------le prix c'est le prix pour obtenir l'evolution---------------------------
	local i=1
	while i<=3 do
		prix[i]={}
		local j=0
		while j<3 do
			prix[i][j]={}
			local k=1
			local abaisseur=0
			while k<5 do
				--prix[i][j][k]={}
				if k==2 then
					abaisseur=1
				end
				prix[i][j][k]=100*(k-abaisseur)
				k=k+1
			end
			j=j+1
		end
		i=i+1
	end 
	prix[1][1][4]=500
	prix[2][2][4]=500
	prix[1][2][4]=200
	if multi~=0 then
		local k=1
		while k<5 do
			prix[3][1][k]=0.5*prix[3][1][k]
			k=k+1
		end
	end
	for k=1,2 do
		for i=0,2 do
			local prixnouveau=0
			for j=1,4 do
				prixnouveau=prixnouveau+prix[k][i][j]
			end
			if k==2 then
				prixnouveau=prixnouveau*1.5
			end
			prix[k][i][5]=prixnouveau
		end
	end
end

t.prixdev= function()
local a=1
end
return t