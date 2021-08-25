local initrecherche={} -- permet de ne pas reclaculer la distance des points par rapport a leur origine. Pour mettre a jour aller dans le fichier niveau 1 et copié le contenu de la console
function initrecherche.new(niveauch)
	if not goh then
		if niveauch==1 then
			linftabpro={1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30}
		elseif niveauch==2 then
			linftabpro={1,2,3,4,5,5,6,7,8,9,10,11,12,13,14,15,16,17,18,5,6,7,8,9,10,11,12,13,14,15}
		elseif niveauch==3 then
			linftabpro={1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,1,2,3,4,5,6,7,8,9,10,11,12,13,14,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21}
		elseif niveauch==4 then
			linftabpro={1,2,3,4,5,6,7,8,9,10,11,12,13,14,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,28,29,13,1,2,3,4,5,6,7,8,9,10,11,12,13,14,28,13,14,15,16,17,18,19,20,21,22,23,30,31,32,33,34,35,36,37,38,23,24,25,26,27,28,29}
		elseif niveauch==5 then
			linftabpro={1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44}
		elseif niveauch==6 then
			linftabpro={1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,1,2,3,4,5,6,7,8,9,10,11,12}
		elseif niveauch==7 then
			linftabpro={1,2,3,4,5,6,7,8,9,10,11,9,10,11,1,2,3,4,5,6,7,8,9,1,2,3,4,5,6,7,8,9,10,11,11,12,13,14,15,16,1,2,3,4,5,6,7,8,1,2,3,4,5,6,7,8,7,8,9,10,11,12,13,14,15,16}
		elseif niveauch==8 then
			linftabpro={1,2,3,4,4,5,6,7,4,5,6,7,1,2,3,4,5,6,7,8,9,10,11,7,8,9,10,11,12,13,14,15,16,10,11,12,13,14,15,16,17,18,19,20,21,7,7,8,9,8,9,10,11,16,16,8,9,10,11,12,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,12,13,14,15,16,17,18,19,20,16,17}
		elseif niveauch==9 then
			linftabpro={1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,16,17,18,19,20,21,22,23,24,23,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,16,16,17,18,19,20,21,22,23,24,23,24,24,25,26,27,28,29,30}
		elseif niveauch==10 then
			linftabpro={1,2,3,4,5,6,7,8,9,10,1,2,3,4,5,6,7,8,9,10,11,10,11,12,13,14,15,16,17,18,19,20,21,10,11,12,13,14,15,16,17,18,19,20,21,21,22,23,24,25,26,27,28,29,22,23,24,25,26,27,28,29}
		elseif niveauch==11 then
			linftabpro={1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38}
		elseif niveauch==12 then
			linftabpro={1,2,3,4,5,6,7,8,9,10,11,12,11,12,13,14,11,10,5,6,7,8,9,10,11,12,13,1,2,3,4,5,1,2,3,4,5,6,7,8,9,8,9,10,11,8,9,10,11,12,13,14,15,16,17,18,18,15,16,17,18,19,20,13,14,15,18,19,20,21,13,14,15,16,17,18}
		elseif niveauch==13 then
			linftabpro={1,2,3,4,5,6,7,8,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,23,24,25,26,27,28,29,30,1,2,3,4,5,6,7,8,8,9,10,11,12,13,14,13,14,15,16,17,18,15,16,17,18,19,20,21,22,23,24,25,8,9,10,11,8,9,10,11,12,11,12,13,14,15}
		elseif niveauch==14 then
			linftabpro={1,2,3,4,2,3,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,3,4,5,6,7,8,9,10,11,12,13,14,15,1,2,3,4,5,6,7,8,9,10,11,12,2,3,4,5,6,7,8,9,10,11,12,13,14,15}
		elseif niveauch==15 then
			linftabpro={1,2,3,4,4,5,6,7,8,9,10,11,4,5,6,7,8,2,3,4,5,6,7,2,3,4,5,6,5,6,7,3,4,5,6,7,8,3,4,5,5,6,7,8,9,2,3,4,5,6,2,3,4,5,6,7,7,8,9,5,6,7,8,9,10,11,11,12,13,14,15,6,7,8,9,6,7,8,9,10,11,1,2,3,4,5,1,2,3,1,2,3,1,2,3,4,1,2,3,1,2,1,2,3,4,5,6,5,6,5,6,4,5,6,7,7,8,9,10,11,12,13,14,15,11,12,13,11}
		elseif niveauch==16 then
			linftabpro={1,2,3,4,2,3,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,3,4,5,6,7,8,9,10,11,12,13,14,15,1,2,3,4,5,6,7,8,9,10,11,12,2,3,4,5,6,7,8,9,10,11,12,13,14,15}
		elseif niveauch==17 then
			linftabpro={1,2,3,4,2,3,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,3,4,5,6,7,8,9,10,11,12,13,14,15,1,2,3,4,5,6,7,8,9,10,11,12,2,3,4,5,6,7,8,9,10,11,12,13,14,15}
		else
			print("erreur carte inconnu")
		end
	else
		if niveauch==1 then
			linftabpro={1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31}
		elseif niveauch==2 then
			linftabpro={1,2,3,4,5,5,6,7,8,9,10,11,12,13,14,15,16,17,18,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31}
		elseif niveauch==3 then
			linftabpro={1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22}
		elseif niveauch==4 then
			linftabpro={1,2,3,4,5,6,7,8,9,10,11,12,13,14,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,28,29,13,1,2,3,4,5,6,7,8,9,10,11,12,13,14,28,13,14,15,16,17,18,19,20,21,22,23,30,31,32,33,34,35,36,37,38,23,24,25,26,27,28,29}
		elseif niveauch==5 then
			linftabpro={1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44}
		elseif niveauch==6 then
			linftabpro={1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,1,2,3,4,5,6,7,8,9,10,11,12}
		elseif niveauch==7 then
			linftabpro={1,2,3,4,5,6,7,8,9,10,11,12,13,1,2,3,4,5,6,7,8,9,10,11,12,13,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,1,2,3,4,5,6,7,8,9,10,11,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20}
		elseif niveauch==8 then
			linftabpro={1,2,3,4,4,5,6,7,4,5,6,7,1,2,3,4,5,6,7,8,9,10,11,7,8,9,10,11,12,13,14,15,16,10,11,12,13,14,15,16,17,18,19,20,21,7,7,8,9,8,9,10,11,16,16,8,9,10,11,12,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,12,13,14,15,16,17,18,19,20,16,17}
		elseif niveauch==9 then
			linftabpro={1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,16,17,18,19,20,21,22,23,24,23,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,16,16,17,18,19,20,21,22,23,24,23,24,24,25,26,27,28,29,30,31}
		elseif niveauch==10 then
			linftabpro={1,2,3,4,5,6,7,8,9,10,1,2,3,4,5,6,7,8,9,10,11,10,11,12,13,14,15,16,17,18,19,20,21,10,11,12,13,14,15,16,17,18,19,20,21,21,22,23,24,25,26,27,28,29,22,23,24,25,26,27,28,29}
		elseif niveauch==11 then
			linftabpro={1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37}
		elseif niveauch==12 then
			linftabpro={1,2,3,4,5,6,7,8,9,10,11,12,11,12,13,14,11,10,5,6,7,8,9,10,11,12,13,1,2,3,4,5,1,2,3,4,5,6,7,8,9,8,9,10,11,8,9,10,11,12,13,14,15,16,17,18,18,15,16,17,18,19,20,13,14,15,18,19,20,21,13,14,15,16,17,18}
		elseif niveauch==13 then
			linftabpro={1,2,3,4,5,6,7,8,9,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,23,24,25,26,27,28,29,30,1,2,3,4,5,6,7,8,8,9,10,11,12,13,14,13,14,15,16,17,18,15,16,17,18,19,20,21,22,23,24,9,10,11,12,13,8,9,10,11,12,11,12,13,14,15}
		elseif niveauch==14 then
			linftabpro={1,2,3,4,2,3,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,3,4,5,6,7,8,9,10,11,12,13,14,15,1,2,3,4,5,6,7,8,9,10,11,12,2,3,4,5,6,7,8,9,10,11,12,13,14,15}
		elseif niveauch==15 then
			linftabpro={1,2,3,4,5,6,7,8,9,10,11,12,13,1,2,3,4,5,6,7,8,9,10,11,12,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,1,2,3,4,5,6,7,8,9,10,11,12,13,14,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,5,6,7,8,9,10,11,12,13,14,15,16,18,19,20,21,22,23,24,25,26}
		elseif niveauch==16 then
			linftabpro={1,2,3,4,4,5,6,7,8,9,10,11,4,5,6,7,8,2,3,4,5,6,7,2,3,4,5,6,5,6,7,3,4,5,6,7,8,3,4,5,5,6,7,8,9,2,3,4,5,6,2,3,4,5,6,7,7,8,9,5,6,7,8,9,10,11,11,12,13,14,15,6,7,8,9,6,7,8,9,10,11,1,2,3,4,5,1,2,3,1,2,3,1,2,3,4,1,2,3,1,2,1,2,3,4,5,6,5,6,5,6,4,5,6,7,7,8,9,10,11,12,13,14,15,11,12,13,11}
		elseif niveauch==17 then
			linftabpro={1,2,3,4,2,3,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,3,4,5,6,7,8,9,10,11,12,13,14,15,1,2,3,4,5,6,7,8,9,10,11,12,2,3,4,5,6,7,8,9,10,11,12,13,14,15}
		else
			print("erreur carte inconnu")
		end
	end
end
return initrecherche

-- enlever les guerrier vague 2 vers debut et fin vague 3
-- es ce que perdre fait trop varier le temps entre les spawn?