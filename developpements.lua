local t={}

-- agit dans soldat.lua ligne 360
-- agit dans batiment.lua,  miseajourvalevol, ligne 98

-- probleme a resoudre dans batiment de tir : faire agir le savegameall..bonus du nb de fleche plus tot


t.developpements = function ()
	local supportlanguage={}
	supportlanguage.fr=true
	supportlanguage.cs=true
	supportlanguage["in"]=true
	supportlanguage.ru=true -- moins english
	local function getlanguage(langue)
		if langue=="fr"then
			texttraduction.savegamealltips={"Débloquez de nouvelles tours, pouvoirs et héros","Appuyez sur le coffre pour accéder au menu de développement","La cavalerie a un bonus de charge","Les géants peuvent bloquer plusieurs ennemis à la fois","Les flèches des archers ne manquent jamais leur cible","Récoltez plus d’or en améliorant les mines","Les tours sont constructibles en dehors des chemins","Les héros de niveau 3 ont une attaque spéciale","Débloquez les niveaux bonus grâce aux diamants jaunes","Débloquez de nouveaux items avec les diamants rouges","Ajustez le son en cliquant sur l’engrenage","Trois pouvoirs sont disponibles","Les héros gagnent de l’XP en combattant","Gagnez de l’argent en déclenchant la prochaine vague"}
			texttraduction.savegameallmapname={"Paisible village","La mine abandonnée","Le ruisseau","La ferme au moulin","Premières neiges","Le serpent de glace","Le croisement arctique","Les igloos perdus","Indiens & Cowboys","Aux portes de la ville","L’oasis","La baie des pirates","Les portes de l'enfer","Village perdu","Terres inconnues","Terres inconnues","","","","","Multi","Multi1"}
			texttraduction.chniveaunew={"Herbe","Neige","Sable","Rocs","Niveau "}
			texttraduction.chniveaubonus={"Mode","Thème","Infini","Défendez-vous aussi longtemps que possible","Squelette",nil,"Faites face aux vagues de squelettes","Attaque","AI defend","U att","A votre tour d’attaquer !","Zombie","Ferez vous le poids face aux zombies ?","Armée","U&AI Defend","U&AI att","Controlez une armée de soldat","Panique","Repoussez l’insurrection de paysans","MegaXP","4xXP pour les soldats","Les soldats gagnent 4 fois plus vite de l’expérience","Million","Vous commencez avec 1 million","Régnez en nabab avec un million de pièces d’or","Niveau ","Requis:"}
			texttraduction.menudevnewdist={"Tours","","","","","","","","","","Rechargement","Rechargement rapide","Cadence de\ntir augmentée","","","","","","","","","","Grand arc","Grand arc ","Portée augmentée","","","","","","","","","","Chaudron","Chaudron ","Attaque améliorée"}
			texttraduction.menudevnewcont={"","","","","","","","","","Étalon","Étalon ","Augmente le\n bonus de charge","","","","","","","","","","Entrainement","Entrainement ","Temps de repos\ndiminué","","","","","","","","","","Armure","Armure blindée ","Augmente les vies\n des géants","Casernes"}
			texttraduction.menudevnewspell={"Pouvoirs","Armes","Titanium weapon","Augmente\n l’attaque des\n renforts","Armure","Cotte de maille","Les renforts ont\n plus de vie","Rechargement","Invocation rapide","Recharger les\npouvoirs plus\nrapidement","Alliés","Alliés revenants","Invoquez 3 unités","Projectile","Débloquez Projectile","Débloquez un\n nouveau sort","Puissance","Puissance d’attaque","Attaque augmentée","Invocation","Invocation rapide","Recharger les\npouvoirs plus\nrapidement","Ciel sombre","Ciel sombre","Attaque augmentée","Rage","Débloquez la rage","Toutes les tours\net les unités\n sont plus fortes\n durant un instant","Adrénaline","Adrénaline","Améliore la\n puissance du sort","Ragnarock","Ragnarock","Améliore la\n puissance du sort","Rechargement","Invocation rapide","Recharger les\npouvoirs plus\nrapidement"}
			texttraduction.menudevnewheroes={"Héros","","","","","","","","","Il transforme les morts en une horde de squelettes alliée","Réinit","Réinit ","Réinitialisation de\n toutes les tours\net pouvoirs\ndéveloppés","","","","","","","","","Charme les ennemis en alliés par ses pouvoirs spirituels","","","Son attaque est hors norme il peut terrasser des armées à lui tout seul","","","","","","","","","Ce marteau peut\n faire trembler\n la terre","XP","Unités XP","Toutes les unités\n acquièrent de\n l’expérience"}
			texttraduction.tuto={"Les ennemis viennent d’ici","Cliquez pour construire une tour","Construisez une tour d’infanterie","Construisez une tour de tir","Placez votre tour\n n’importe où sur l’herbe","Lancez la première vague d’ennemis","Réparez la mine d’or","Lancez la première vague d’ennemis ","Récoltez de l’or","Améliorez votre tour","Cliquez pour réduire\n le temps entre les vagues","Lancez la première vague d’ennemis","Utilisez votre pouvoir spécial","Placez le pouvoir sur le chemin"}
			texttraduction.comp={"Musique de fond ","Histoire","Améliorations:\nDébloquez de nouvelles tours,\n pouvoirs et héros","Niveaux bonus","Réglages:\nRéglez le volume\net la musique de fond","Choisissez votre héros\net cliquez jouer","Choisissez votre niveau","Débloquez de nouvelles tours"}
			texttraduction.menucarte={"Brave guerrier,\n\nvous êtes l’élu parmi les elfes, humains\n et géants.\n\nConstruisez des tours, contrôlez votre héros et faîtes bon \nusage de chaque technologie pour défendre\nle royaume.","Capitaine,\n\nle royaume des elfes est sain et sauf. Il faut à présent défendre\nla terre du nord envahie par les orcs.\nCombattez l’épée à la main","Général,\n\n après avoir vaincu les orcs du nord,\nfaisons cap vers le désert avec les géants\n et écrasons les mercenaires\nune fois pour toutes.","Roi,\n\nles trois armées se rallient dans les terres brûlées.\nAidez-les à vaincre Vulkann dans la bataille finale.\nQue les dieux soient avec vous.\n\nAstuce: Débloquez l'XP pour toutes vos unités dans l'onglet des héros"}
			texttraduction.batiment={"Caserne","Fort","Forteresse","Château","Grotte","Caverne","Antre","Ferme","Écurie","Paladin","Mirador","Arbalète","Tour massive","Balliste","Catapulte","Onagre","Trébuchet","Barricade","Trancheur","Acide","Mine abandonnée","Mine","Mine des gobelins","Mine des nains","Bâtiment"}
			texttraduction.soldat={"Spartiate","Garde royal","Warpriest","Elfe meneur","Nécromancien","Elfe aguerri","Gladiateur","Scorpio","Marteau divin","Oliphant","soldat","Millicien","Templier","Champion","Boucher","Ogre","Colosse","Ecuyer","Chevalier","Paladin","Renfort 1","Renfort 2","Renfort 3","Archer 1","Archer 2","Archer 3"}		
			if not goh then
				texttraduction.message={"Perdu","Victoire"," Dommages:"," Vie:"," Att:"," lvl:"}
				texttraduction.rate={"Vous aimez Stronghold?  Venez le noter","Tués: ","  Vagues: ","Niveau: "}
				texttraduction.changelog={'Venez decouvrir "Gate Of Heroes" notre nouveau jeu!'}
				texttraduction.complement={"Débloquez ","\nAttaque","\nVie","\nPortée","\nCadence","\nPrix",": faible",":moyenne",": élevée","\nBonus de charge","\nAttaque plusieurs\n ennemis","\nDégâts étendus","\nFlèches"}
				texttraduction.hero={"lvl:","xp:","HP:","ATK:"}
				texttraduction.bonusrace={"Humain: ","\nCatapulte portée/attaque +10% \nInfanterie vie/attaque +10%","Elfe: ","\nArcher portée/attaque +10% \nCavalier vie/attaque +10%","Géant: ","\nPique portée/attaque +10% \nGeant vie/attaque +10%","Mode Impossible:\n\n"," diamants\n5 pièces -> 1 diamant","3 stars require to unlock hardcore mode","1 Wave mode","You need to win the hardcore mode"}
			else
				texttraduction.message={"Perdu","Victoire",nil,nil,nil," lvl:"}
				texttraduction.rate={"Vous aimez Gate Of Heroes?  Venez le noter","Tués: ","  Vagues: ","Niveau: "}
				texttraduction.changelog={"New tutorial"}
				texttraduction.complement={"Débloquez ",nil,nil,nil,nil,nil,nil,nil,nil,"\nBonus de charge","\nAttaque plusieurs\n ennemis","\nDégâts étendus","\nFlèches"}
				texttraduction.hero={nil,nil,nil,nil}
				texttraduction.bonusrace={"Humain: ",nil,"Elfe: ",nil,"Géant: ",nil,"Mode Impossible:\n\n"," diamants\n5$ -> 1 diamant","3 stars require to unlock hardcore mode","1 Wave mode","You need to win the hardcore mode"}
			end
			texttraduction.modedejeu={"Mode Panique!","Mode Zombie!","Mode Squelette!","Mode armée!","Mode Mega^!","Mode Millionnaire!","Mode Infini!","Mode Attaque!(beta)","Mode armée!","Impossible"}
			texttraduction.multi={"Play","Editor","Soldier","Unlock","Random","Nil","Save","Spell 1","Spell 2","Spell 3","Hero 1","Hero 2","Hero 3","Map 2","Map 3","Map 4"}
			texttraduction.menuinf={"Play campaign mode","Play to special game mode\nUnlock new modes by using yellow diamonds\nYou win them when you finish a campaign level not loosing many life","Unlock new buildings, spells or heroes","Enjoy the alpha version of multiplayer"}
			texttraduction.statinfo={"Tués","Tués par la tour la plus efficace","Tués par le héro","rang mondial"}
			texttraduction.menuquestion={"Retourner au menu principal?","Recommencer la partie?"}
			texttraduction.finishgame={"Bravo !\n\nVous avez battu Vulkann, la paix est de retour dans tout le royaume.\nVous avez trouvé son trésor, 300 diamants vont permettre de renforcer votre armée.\nAvez vous assez de courage pour repoussez les ennemis en hardcore?"}
			texttraduction.tuto0={"Voulez vous battre en retraite et\ncommencer l'aventure avec un nouveau héro ?","La bataille est perdue, préparons une offensive"}
			texttraduction.gohpub={'Découvrez "Gate Of Heroes"\noù le niveau 16 est disponible!'}
		elseif langue=="cs"then
			texttraduction.savegamealltips={"Odblokujte nové věže, schopnosti a hrdiny!","Klikněte na truhlu, pokud si přejete zobrazit menu vývoje","Jezdectvo má nábojový bonus","Obři mohou zablokovat několik nepřátel najednou","Šipky lukostřelců nikdy neminou terč","Vylepšete  doly a vytěžte tak víc zlata","Věže je možno stavět i mimo cesty","Hrdinové úrovně 3 mají možnost speciálního útoku","Odemkněte bonusové úrovně díky žlutým diamantům","Získejte nové položky díky červeným diamantům","Upravte zvuk kliknutím na ozubení","Jsou k dispozici tři schopnosti","Když bojují, hrdinové získávají XP","Rozpoutejte další vlnu a vyhrajte tak peníze"}
			texttraduction.savegameallmapname={"Poklidná vesnice","Opuštěný dům","Potok","Farma s mlýnem","První sníh","Ledový had","Arktická křižovatka","Ztracená iglú","Indiáni a kovbojové","Vstup do města","Oáza","Pirátí zátoka","Dveře do pekla","Ztracená vesnice","Neznámé končiny","Neznámé končiny","","","","","Multi","Multi1"}
			texttraduction.chniveaunew={"Tráva","Sníh","Písek","Skály","Úroveň "}
			texttraduction.chniveaubonus={"Mód","Téma","Nekonečno","Braňte se tak dlouho, jak jen to bude možné","Mrtvola","Mrtvola","Postavte se vlnám mrtvol","Útok","AI defend","U att","Zaútočte, teď je řada na vás!","Zombie","Troufnete si postavit se zombie?","Army","U&AI Defend","U&AI att","Hrajte proti umělé inteligenci","Panika","Zneškodněte venkovské povstání","MegaXP","4xXP pro vojáky","Vojáci získávají zkušenosti 4krát rychleji","Milion","Začínáte s jedním milionem","Vládněte nabobu s milionem zlaťáků","Úroveň ","Requis:"}
			texttraduction.menudevnewdist={"Věže","","","","","","","","","","Dobití","Rychlé dobití","Rytmus\nstřel zvýšený","","","","","","","","","","Velký luk","Velký luk ","Prodloužený dostřel","","","","","","","","","","Kotlík","Kotlík ","Vylepšený útok"}
			texttraduction.menudevnewcont={"","","","","","","","","","Hřebec","Hřebec","Zvyšte\n bonus nabíjení","","","","","","","","","","Trénink","Trénink ","Čas odpočinku\nsnížen","","","","","","","","","","Zbroj","Obrněná zbroj ","Zvýšit počet životů\n Obři","Kasárny"}
			texttraduction.menudevnewspell={"Schopnosti","Zbraně","Titanové zbraně","Zvýšit\n l’Útok \n Posilas","Zbroj","Kroužkovaná tunika"," Posilas mají\n více života","Dobití","Rychlá invokace","Obnovit\nschopnosti\nrychleji","Spojenci","Vracející se spojenci","Invokujte 3 jednotky","Projektil","Odblokujte Projektil","Odblokujte \n nový druh","Síla","Síla útoku","Útok zvýšený","Invokace","Rychlá invokace","Obnovte\nschopnosti\nrychleji","Zatažené nebe","Zatažené nebe","Útok zvýšený","Furie","Odblokujte Furii","Všechny věže\net jednotky\n jsou silnější\n během krátké doby","Adrenalin","Adrenalin","Zlepšuje\n Výkonnost","Ragnarock","Ragnarock","Zlepšuje\n výkonnost","Dobíjení","Rychlá invokace","Obnovit\nschopnosti\nrychleji"}
			texttraduction.menudevnewheroes={"Hrdinové","","","","","","","","","Il přeměňuje mrtvé v hordu spřízněných skeletů","Začít od začátku","Začít od začátku","Reinicializace\n všech věží\net rozvinuté\nschopnosti","","","","","","","","","Okouzlí nepřátele  \na udělá z nich spojence díky svým duchovním \nschopnostem","","","Oliphant destroy all army","","","","","","","","","Ce kladivo může\n způsobit\n zemětřesení","XP","Jednotky XP","Všechny jednotky\n sbírají\nzkušenosti"}
			texttraduction.tuto={"Nepřátelé pochází odsud","Klikněte, abyste pokračovali s věží","Postavte věž bojovníků","Postavte střeleckou věž","Umístěte vaši věž\n na trávu","Odstartujte první vlnu nepřátel","Opravte zlatý důl","Odstartujte první vlnu nepřátel ","Skliďte zlato","Vylepšete vaši věž","Klikněte pro zredukování\n času mezi vlnami","Odstartujte první vlnu nepřátel","Použijte vaši  speciální schopnost","Umístěte schopnost na cestu"}
			texttraduction.comp={"Doprovodná hudba","Příběh","Vylepšení:\nOdblokujte nové věže,\n schopnosti a hrdiny","","Úpravy:\nUpravte zvuk\na doprovodnou hudbu","Vyberte svého hrdinu\net Klikněte na hrát","Vyberte svoji úroveň","Odblokujte nové věže"}
			texttraduction.menucarte={"Statečný válečník,\n\nJste vyvolený mezi elfy, lidmi \n a obry.\n\nPostavte věže, kontrolujte vaše hrdiny a dobře \npoužívejte každou technologii a braňte svoje\nlkrálovství","Kapitáne,\n\nkrálovství elfů je v bezpečí. Nyní musíme bránit\nseverní zemi obsazenou kosatkami.\nBojujte s mečem v ruce","Generále,\n\n poté, co jsme porazili kosatky ze severu,\npojďme teď k poušti s obry\n a zničme nájezdníky\njednou pro vždy.","Králi,\n\nltři armády se spojily ve spálených zemích.\nPomozte jim porazit Vulkann v poslední bitvě.\nBůh vám žehnejn\nTip: Odblokujte XP pro všechny vaše jednotky v okně hrdinů"}
			texttraduction.batiment={"Kasárna","Silný","Pevnost","Zámek","Jeskyně","Úžina","Brloh","Farma","Stáj","Paladin","Pozorovatelna","Kuš","masivní věž","Balliste","Katapult","pupalka","Past","Barikáda","Sekáček","Kyselina","opuštěný důl","důl","důl gobelínů","důl trpaslíků","Budova"}
			texttraduction.soldat={"Sparťan","Královská garda","Válečný mnich","Elf průvodce","Kromaňonec","Elf  zocelený","gladiátor","Škorpion","božské kladivo","Hrdinný drak","voják","Bojovník","Templář","Šampion","Řezník","Obr","Obr","Podkoní","Rytíř","Paladin","Posila 1","Posila 2","Posila 3","Lukostřelec 1","Lukostřelec 2","Lukostřelec 3"} 
			texttraduction.message={"Prohra","Vítězství"," Škody:"," Život:"," Att:"," lvl:"}
			texttraduction.complement={"Odblokujte ","\nÚtok","\nHP","\nDostřel","\nRytmus","\nCena",": slabý",": střední",": vysoký","\nBonus nabíjení","\nÚtok více\n nepřátel","\nRozsáhlé škody","\nŠipky"}
			if not goh then
				texttraduction.rate={"Máte rádi Stronghold? Poznamenejte to!","Zabití: "," vlny: ","Úroveň: "}
				texttraduction.changelog={"Discover our new game :\nGate of Heroes !"}
				texttraduction.hero={"lvl:","xp:","HP:","ATK:"}
			else
				texttraduction.rate={"Máte rádi Gate Of Heroes? Poznamenejte to!","Zabití: "," vlny: ","Úroveň: "}
				texttraduction.changelog={"New tutorial"}
				texttraduction.hero={"lvl","xp","HP","ATK"}
			end
			texttraduction.Modedejeu={"Mód Panika!","Mód Zombie!","Mód Skelet!","Mód Army!","Mód MegaXP!","Mód Milionář!","Mód Nekonečno!","Mód Útok!","Mód army!","Nemožné"}
			texttraduction.bonusrace={"Člověk: ","\nKatapult dostřel/Útok +10% \nPěchota život/Útok +10%","Elf : ","\nLukostřelec dostřel/Útok +10% \nJezdec život/Útok +10%","Obr: ","\nŠpička dostřel/Útok +10% \nObr život/Útok +10%","Mód Nemožné:\n\n"," diamanty\n5 mincí -> 1 diamant","3 stars require to unlock hardcore mode","1 Wave mode","You need to win the hardcore mode"}
			texttraduction.multi={"Play","Editor","Soldier","Unlock","Random","Nil","Save","Spell 1","Spell 2","Spell 3","Hero 1","Hero 2","Hero 3","Map 2","Map 3","Map 4"}
			texttraduction.menuinf={"Play campaign mode","Play to special game mode\nUnlock new modes by using yellow diamonds\nYou win them when you finish a campaign level not loosing many life","Unlock new buildings, spells or heroes","Enjoy the alpha version of multiplayer"}
			texttraduction.statinfo={"Kills","Kills by the better tower","Kills by the hero","World ranking"}
			texttraduction.menuquestion={"Leave the game?","Do you want to restart?"}
			texttraduction.finishgame={"Congratulation !\n\nYou have killed Vulkann, peace will be back.\nYou have found the treasure of Vulkann containing 300 gems.\nDo you still have the courage to save the world once again in hard core mod?"}
			texttraduction.tuto0={"Would you like to retreat and\nbegin the adventure with a new hero ?","The battle is lost, we must retreat"}
			texttraduction.gohpub={'Level 16 now available\nin "Gate of Heroes"'}
		elseif langue=="in" then
			texttraduction.savegamealltips={"Rilis menara baru, kesaktian, dan pendekar","Rilis menara baru, kesaktian, dan pendekar","Kavaleri mendapat bonus serbuan","Raksasa dapat menghalangi beberapa musuh secara bersamaan","Anak panah para pemanah selalu mengenai sasaran","Dapatkanlah emas lebih banyak dengan memperbaiki tambang","Menara dapat dibangun di luar jalan","Terdapat serbuan khusus bagi pendekar level 3","Rilis level bonus dengan permata kuning","Rilis item baru dengan permata merah","Sesuaikan suara dengan menekan roda gigi","Tiga kesaktian tersedia","Pendekar memenangkan XP ketika bertempur","Dapatkanlah uang dengan meluncurkan gelombang berikutnya"}
			texttraduction.savegameallmapname={"Desa tenteram","Tambang yang ditinggalkan","Sungai","Rumah dan ladang dengan kincir angin","Salju awal","Ular es","Persimpangan Arktik","Rumah salju terpencil","Suku Indian & Cowboys","Di gerbang kota","Oase","Teluk bajak laut","Pintu neraka","Desa terpencil","Wilayah tak dikenal","Wilayah tak dikenal","","","","","Multi","Multi1"}
			texttraduction.chniveaunew={"Alang-alang","Salju","Pasir","Batu","Level "}
			texttraduction.chniveaubonus={"Modus","Tema","Tak terhingga","Lindungi diri Anda selama mungkin","Tulang kerangka","Tulang kerangka","Hadapilah gelombang tulang kerangka","Serbu","AI defend","U att","Giliran Anda menyerang!","Zombi","Apakah Anda siap melawan zombi?","Army","U&AI Defend","U&AI att","Mainlah melawan Kecerdasan Buatan","Panik","Lawan pemberontakan petani","MegaXP","4xXP untuk prajurit","Prajurit memenangkan pengalaman 4x lebih cepat","Juta","Anda mulai dengan 1 juta","Berkuasalah seperti Raja dengan 1 juta keping emas","Level ","\bDiperlukan:"}
			texttraduction.menudevnewdist={"Menara","","","","","","","","","","Memuat kembali","Memuat kembali","Memuat kembali secara cepat","","","","","","","","","","Busur besar","Busur besar ","Jarak Busur besar","","","","","","","","","","Kancah","Kancah ","Serbuan ditingkatkan"}
			texttraduction.menudevnewcont={"","","","","","","","","","Kuda jagoan","Kuda jagoan ","Tingkatkan \n bonus serbuan","","","","","","","","","","Kastil","Kastil ","Waktu istirahat dikurangi","","","","","","","","","","Pakaian baja","Pakaian baja Pakaian baja","Tingkatkan kehidupan\n raksasa","Barak"}
			texttraduction.menudevnewspell={"Kesaktian","Senjata","Senjata titanium","Tingkatkan\n serbuan \n bala bantuan","Pakaian baja","Zirah rantai","Bala bantuan mendapatkan\n kehidupan tambahan","Memuat kembali"," Memuat kembali secara cepat ","Muat kembali \nkesaktian dengan lebih\ncepat","Sekutu","Bala bantuan lebih banyak","Muat 3 unit","Proyektil","Rilis Proyektil","Rilis \n mantra baru","Kekuatan","Kekuatan serbuan","Kekuatan ditingkatkan","Memuat kembali"," Memuat kembali secara cepat","Muat kembali \nkesaktian dengan lebih\ncepat","Langit gelap","Langit gelap","Serbuan ditingkatkan","Amarah","Rilis Amarah","Semua menara\net unit\n lebih kuat\n selama sekejap","Adrenalin","Adrenalin","Tingkatkan\n kekuatan kesaktian","Ragnarock","Ragnarock","Tingkatkan\n kekuatan kesaktian","Memuat kembali"," Memuat kembali","Muat kembali \nkesaktian\ndengan lebih cepat"}
			texttraduction.menudevnewheroes={"Pendekar","","","","","","","","","Berkatnya, yang telah meninggal menjelma menjadi segerombolan tulang kerangka sekutu","Reinis","Reinis ","Reinisialisasi\n semua menara\n et kesaktian\ndikembangkan","","","","","","","","","Merayu musuh menjadi sekutu berkat kekuatan batinnya","","","Oliphant can destroy a whole army","","","","","","","","","Palu ini dapat menggoncangkan dunia","XP","Unit XP","Semua unit mendapatkan pengalaman"}
			texttraduction.tuto={"Musuh datang dari sini","Tekan untuk membangun menara","Bangunlah menara infantri","Bangunlah menara tembak","Posisikanlah menara Anda\n di mana saja di atas rumput","Luncurkan gelombang pertama musuh","Perbaiki tambang emas"," Luncurkan gelombang pertama musuh ","Dapatkanlah emas","Perbaiki menara Anda","Tekan untuk mengurangi\n waktu antar gelombang"," Luncurkan gelombang pertama musuh","Gunakanlah kesaktian khusus Anda","Letakkanlah kesaktian pada jalan"}
			texttraduction.comp={"Musik latar belakang ","Kisah","Perbaikan:\nRilis menara baru,\n kesaktian dan pendekar","Level bonus","Pengaturan:\nAturlah volume\net musik latar belakang","Pilihlah pendekar Anda\net tekan main","Pilihlah level Anda","Rilis menara baru"}
			texttraduction.menucarte={"Prajurit yang gagah,\n\nAndalah yang terpilih di antara kaum elf, manusia,\n dan raksasa.\n\Bangunlah menara, kuasailah pendekar Anda dan gunakanlah \ndengan baik setiap teknologi untuk membela\nKerajaan.","Kapten,\n\nKerajaan Elf sekarang selamat. Kini, wilayah di utara\nyang perlu dibela sebab dijajah oleh para orc.\nBerjuanglah dengan memegang kuat pedang","Jendral,\n\n setelah mengalahkan para orc di utara,\nmari menuju ke padang gurun bersama para raksasa\n dan menghancurkan prajurit sewaan\nuntuk selamanya.","Raja,\n\nketiga bala tentara bergabung di wilayah hangus.\nBantulah mereka mengalahkan Vulkann saat peperangan terakhir.\nSemoga para dewata mendampingi Anda sekalian.\n\nTrik: Rilis XP untuk semua unit Anda dalam tab pendekar"}
			texttraduction.batiment={"Barak","Benteng","Kubu","Kastil","Gua","Gua besar","Liang","Rumah dan ladang","Kandang kuda","Paladin","Mirador","Busur silang","Menara kukuh","Ballista","Katapel tempur","Onager","Trebuset","Barikade","Pemotong","Asam","Tambang yang ditinggalkan","Tambang","Tambang Goblin","Tambang Kurcaci","Gedung"}
			texttraduction.soldat={"Sparta","Pengawal raja","Pendeta pendekar","Elf pemimpin","Ahli Nekromansi","Elf berpengalaman","Gladiator","Skorpio","Palu dewata","Oliphant","prajurit","Anggota milisi","Ksatria Templar","Juara","Jagal","Gergasi","Kolosus","Pengurus kuda","Ksatria","Paladin","Bala bantuan 1"," Bala bantuan 2"," Bala bantuan 3","Pemanah 1"," Pemanah 2"," Pemanah 3"}
			texttraduction.message={"Kalah","Kemenangan"," Kerusakan:"," Kehidupan:"," Srb:"," lvl:"}
			texttraduction.complement={"Rilis ","\nSerbu","\nHP","\nJarak","\nKecepatan","\nHarga",": lemah",": sedang",": tinggi","\nBonus serbuan","\nSerbu beberapa\n musuh","\nKerusakan ekstensif","\nAnak panah"}
			if not goh then
				texttraduction.rate={"Anda suka Stronghold?  Berilah nilai","Terbunuh: ","  Gelombang: ","Level: "}
				texttraduction.changelog={"Discover our new game :\nGate of Heroes !"}
				texttraduction.hero={"lvl:","xp:","HP:","ATK:"}
			else
				texttraduction.rate={"Anda suka Gate Of Heroes?  Berilah nilai","Terbunuh: ","  Gelombang: ","Level: "}
				texttraduction.changelog={"New tutorial"}
				texttraduction.hero={"lvl","xp","HP","ATK"}
			end
			texttraduction.modedejeu={"Modus Panik!","Modus Zombi!","Modus tulang kerangka!","Modus Army!","Modus MegaXP!","Modus Milyuner!","Modus Tak terhingga!","Modus Serbu!(beta)","Modus army!","Mustahil"}
			texttraduction.bonusrace={"Manusia: ","Katapel tempur jarak/serbuan +10% \nInfanteri kehidupan/serbuan +10%","Elf: ","Pemanah jarak/serbuan +10% \nPenunggang kuda kehidupan/serbuan +10%","Raksasa: ","Tombak jarak/serbuan +10% \nRaksasa kehidupan/serbuan +10%","Modus Mustahil:\n\n"," permata\n5 keping -> 1 permata","3 stars require to unlock hardcore mode","1 Wave mode","You need to win the hardcore mode"}
			texttraduction.multi={"Play","Editor","Soldier","Unlock","Random","Nil","Save","Spell 1","Spell 2","Spell 3","Hero 1","Hero 2","Hero 3","Map 2","Map 3","Map 4"}
			texttraduction.menuinf={"Play campaign mode","Play to special game mode\nUnlock new mode by won yellow diamond\nYou win them when you finish a campaign level not loosing many life","Unlock new buildings, spells or heroes","Enjoy the alpha version of multiplayer"}
			texttraduction.statinfo={"Kills","Kills by the better tower","Kills by the hero","World ranking"}
			texttraduction.menuquestion={"Leave the game?","Do you want to restart?"}
			texttraduction.finishgame={"Congratulation !\n\nYou have killed Vulkann, peace will be back.\nYou have found the treasure of Vulkann containing 300 gems.\nDo you still have the courage to save the world once again in hard core mod?"}
			texttraduction.tuto0={"Would you like to retreat and\nbegin the adventure with a new hero ?","The battle is lost, we must retreat"}
			texttraduction.gohpub={'Level 16 now available\nin "Gate of Heroes"'}
		elseif langue=="ru" then
			texttraduction.savegamealltips={"Откройте новые башни","заклинания и героев","Нажмите на сундук для открытия меню башен и героев","Кавалерия имеет бонус натиска","Гиганты могут остановить и атаковать несколько врагов ","Башни лучников всегда бьют точно в цель","Улучшеные шахты увеличивают доход","Здания строятся только на подходящей территори","Герои 3 уровня имеют специальную атаку","Бонусный уровень может быть разблокирован желтыми бриллиантами","Улучшения могут быть открыты красными бриллиантами","Отрегулируйте звук нажатием на шестеренку","Доступно 3 заклинания","Герой получает опыт через бой","Получайте деньги вызывая волны заранее"}
			texttraduction.savegameallmapname={"Мирное село","Заброшенная шахта","Маленькая речка","Ферма мельков","Первый снег","Снежный змей","Арктическое шоссе","Потерянные иглу","Индейцы и ковбои","Городские ворота","Пустынный оазис","Пиратская бухта","Врата АДА","Потерянная деревня","Неизвестные земли","Неизвестные земли","","","","","Multi","Multi1"}
			texttraduction.chniveaunew={"Трава","Снег","Песок","Пепел","Уровень "}
			texttraduction.chniveaubonus={"Мод","Тема","Бесконечный","Защищайте себя как можно дольше","Скелет","Скелет","Столкнись с огромными волнами скелетов","Атака","ИИ защита","Ты атакуешь","Твоя очередь атаковать врагов!","Зомби","Сможешь устоять против этих зомби?","Армия","Ты и ИИ защита","Ты и ИИ атака","Командование армией","Паника","Крестьяне боятся, постарайтеся не переусердствовать","Мега опыт","4х опыт для солдат","Ваши солдаты получают овыт в 4 раза быстрее","Миллион","Вы начинаете с миллионом","Правь как царь с одним миллионом монет","Уровень ","\bТребуется:"}
			texttraduction.menudevnewdist={"Башни","","","","","","","","","","Быстрая перезарядка","Быстрая перезарядка ","Скорость огня увеличена","","","","","","","","","","Длинный лук","Длинный лук ","Высокий диапазон","","","","","","","","","","Широкие горшки","Широкие горшки ","Атака увеличена"}
			texttraduction.menudevnewcont={"","","","","","","","","","Скакун","Скакун ","Увеличение урона\n натиска кавалерии","","","","","","","","","","Тренировка","Тренировка ","Время респавна\nуменьшено","","","","","","","","","","Пластинчатый доспех","Пластинчатый доспех ","Увеличение здоровья\n гигантов","Бараки"}
			texttraduction.menudevnewspell={"Заклинания","Оружие","Титановое оружие","Увеличение\n атаки подкрепления","Здоровье","Буст здоровья","Подкрепление имеет\nбольше жизней","Быстрый","Быстрый призыв","Бытрая перезарядка\n заклинания","Армия","Армия нежити","Завербовать 3 еденицы","Снаряд","Разблокировать снаряд","Открыть новые заклинания","Сила","Сила атаки","Атака увеличена","Быстро","Быстрый призыв","Время перезарядки\n заклинания уменьшено","Черное небо","Черное небо","Атака усилена","Пушистый","Разблокировать пушистых","Все башни и юниты\n станут сильнее for\n на короткое время","Адреналин","Адреналин","Увеличение силы\n заклинания","Рагнарек","Рагнарек","Увеличение силы\n заклинаний","Быстрый","Быстрый призыв","Быстрый призыв\n заклинания"}
			texttraduction.menudevnewheroes={"Герои","","","","","","","","","Он трансформирует врагов\n в скелетов","Перезарядка","Перезарядка ","переустановка\nвсех построек\nи мощности\nразвития","","","","","","","","","Очаровывание врагов\nиспользуя духовные силы","","","Олифант может уничтожить целую армию","","","","","","","","","Молот вызывает\n землетрясение","Опыт","Опыт юнита","Все юниты имеют опыт"}
			texttraduction.tuto={"Враг пришел с этой точки","Нажмите, чтобы построить башню","Построить башню пехотинцев","Построить башню лучников","Разместите башню\nгде-нибудь на траве","Запуск первой волны противника","Восстановить золотой рудник","Запуск первой волны противника","Соберите золото","Улучшите башню","Нажмите чтобы уменьшить\nвремя между волнами","Запуск первой волны противника","Используй специальную силу","Размести башню на дороге"}
			texttraduction.comp={"Фоновая музыка ","История","Улучшения:\nОткрой новые здания\nсилы и заклинания","Экстра уровень","Настройки:\nнастройки звука\nи выключить\nфоновую музыку","Выбери своего героя\nи нажми играть","Выбери свой уровень","Разблокируй новые здания"}
			texttraduction.menucarte={"Храбрый воин,\n\nты избранный среди эльфов, людей\nи гигантов.\n\nСтрой башни, управляй своим героем и мудро используй\nтехнологии каждой расы, чтобы защитить\nкоролевство.","Капитан,\n\nкоролевство эльфов в целости и сохранности. Сейчас мы должны\nзащищать северные земли, которые населены орками.\nМожет ты умрешь с мечом в бою","Генерал,\n\nсейчас орки были изгнаны с севера,\nнужно ворваться в пустыню с гигантами и раздавить\nих раз и навсегда.","Мой король,\n\nармия троецарствия переходит в Пепел.\nПомогите им уничтожить Короля Огня в финальной битве.\nДа прибудут с тобой Боги.\n\nЗаписка: разблокируй опыт всех твоих юнитов на главной сранице."}
			texttraduction.batiment={"Бараки","Форт","Крепость","Замок","Пещера","Пещера","Полость","Ферма","Стабильный","Паладин","Смотровая вышка","Длинный лук","Тяжелая башня","Балиста","Катапульта","Катапульта","Требушет","Нападающий","Убийца","Яд","Заброшенная шахта","Шахта","Шахта гоблинов","Шахта гномов","Строение"}
			texttraduction.soldat={"Спартанец","Гвардия","Боевой монах","Лидер эльфов","Некромант","Снайпер","Гладиатор","Скорпион","Божественный молот","Олифант","Солдат","Ополченец","Мечник","Чемпион","Мясник","Огр","Кожевник","Оруженосец","Рыцарь","Паладин","Усиление пехоты 1","Усиление пехоты 2","Усиление пехоты 3","Усиление лучников 1","Усиление лучников 2","Усиление лучников 3"}
			texttraduction.complement={"Открыть ","\nАтака","\nЗдоровье","\nДальность","\nСкорострельность","\nЦена",": слабый",": средний",": высокий","\nНатиск","\nАтака нескольких\n врагов","\nЗона урона","\nСтрела"}
			texttraduction.message={"Ты проиграл","Ты победил"," Урон:"," Здоровье:"," Атака:"," Уровень:"}
			texttraduction.rate={"Тебе нравится стронгхолд?   Почему бы не оценить его?","Убийств: ","  Волна: ","Уровень: "}
			texttraduction.modedejeu={"Режим Паники!","Режим зомби!","Режим Скелетов!","Режим армии!","Мега опыт!","Режим миллионера!","Бесконечный режим!","Режим атаки!","Режим армии!","Хардкор"}
			texttraduction.bonusrace={"Человек: ","\nДальность катапульт/Атака +10% \nЗдоровье пехоты/Атака +10%","Эльф: ","\nДальность лучников/Атака +10% \nЗдоровье рыцарей/Атака +10%","Гигант: ","\nДистанция копейщиков/Atk +10% \nЗдоровье гигантов/attk +10%","Режим хардкор:\n\n"," Драгоценные камни\n5 монет -> 1 камень","3 stars require to unlock hardcore mode","1 Wave mode","You need to win the hardcore mode"}
			texttraduction.multi={"Играть","Редактор","Солдат","Открыть","Рандом","Nil","Сохранить","Заклинание 1","Заклинание 2","Заклинание 3","Герой 1","Герой 2","Герой 3","Карта 2","Картка 3","Карта 4"}
			texttraduction.menuinf={"Играть в компанию","Играть в специальный режим\nЧтобы открыть новый режим используй желтый кристалл\nТы выиграешь, когда закончишь уровень копмании потеряв минимум жизней","Разблокируй новые здания, заклинания и героев","Играйте в Альфа-версию мультиплеера"}
			texttraduction.statinfo={"Убийства","Убийства башнями","Убийство героем","Мировой рейтинг"}
			texttraduction.menuquestion={"Покинуть игру?","Начать занаво?"}
			texttraduction.finishgame={"Поздравляем!\n\nВы убили Короля Огня, начинается мирное время.\nВы нашли сокровище Короля Огня, в котором было 300 кристаллов.\nИмеете ли вы мужество, чтобы спасти мир еще раз в Хардкор режиме?"}
			if not goh then
				texttraduction.changelog={"Discover our new game :\nGate of Heroes !"}
				texttraduction.hero={"lvl:","xp:","HP:","ATK:"}
			else
				texttraduction.changelog={"New tutorial"}
				texttraduction.hero={"lvl","xp","HP","ATK"}
			end
			texttraduction.tuto0={"Would you like to retreat and\nbegin the adventure with a new hero ?","The battle is lost, we must retreat"}
			texttraduction.gohpub={'Level 16 now available\nin "Gate of Heroes"'}
		else--english then
			texttraduction.savegamealltips={"Unlock new towers, spells and heroes","Click on the chest to open the towers and heroes menu","Cavalry has a charge bonus","Giants can stop and attack several ennemies ","Archer Towers arrows always hit their target","An upgraded mine increases income","Buildings can only be built on a buildable area","Level 3 heroes have a special attack","Bonus level can be unlocked with yellow diamonds","Upgrades can be unlocked with red diamonds","Adjust the sound by clicking on the gear","Three spells are available","Heroes gains XP by fighting","Earn money by calling waves early"}
			texttraduction.savegameallmapname={"Peaceful village","Abandoned mine","The small river","The mill farm","First snow","Snowing snake","Arctic highway","Lost igloos","Indians and cowboys","The city gates","Desert Oasis","Pirate Bay","The gates of hell","Lost villages","Unknown land","Unknown land","","","","","Multi","Multi1"}
			texttraduction.chniveaunew={"Grass","Snow","Sand","Ash","Level "}
			texttraduction.chniveaubonus={"Mode","Theme","Infinite","Defend yourself as long as you can","Skeleton","Skeleton","Face huge waves of skeletons","Attack","AI defend","U att","Your turn to attack the enemy!","Zombie","Can you resist against these zombies?","Army","U&AI Defend","U&AI att","Command an army","Panic","The peasants are scared try not to be overwhelmed","MegaXP","4xXP for soldier","Your soldiers gain experience 4 times faster","Million","You begin with a million","Reign as a king with one million coins","Level ","\bNeeds:"}
			texttraduction.menudevnewdist={"Towers","","","","","","","","","","Fast reload","Fast reload ","Fire rate increase","","","","","","","","","","Longbow","Longbow ","Range high","","","","","","","","","","Wide pots","Wide pots ","Attack increased"}
			texttraduction.menudevnewcont={"","","","","","","","","","Stallion","Stallion ","Increase charge\n bonus damage","","","","","","","","","","Training","Training ","Respawn time\nreduced","","","","","","","","","","Plate armor","Plate armor ","Increase giants\n health","Barrack"}
			texttraduction.menudevnewspell={"Spells","Weapon","Titanium weapon","Increase\nreinforcement attack","Health","Health boost","Reiforcement have\nmore life","Quick","Quick summon","Quicker spell\n recharge","Army","Undead army","Summon 3 units","Projectile","Unlock Projectile","Unlock a new spell","Strength","Strength attack","Attack increased","Quick","Quick summon","Shorter spell\n recharge time","Black sky","Black sky","Attack increased","Furry","Unlock Furry","All tower and units\n are stronger for\n a short time","Adrenaline","Adrenaline","Increase spell\n strength","Ragnarock","Ragnarock","Increase spell\nstrength","Quick","Quick summon","Quicker spell\n recharge"}
			texttraduction.menudevnewheroes={"Heroes","","","","","","","","","He transforms it's enemies into\nskeleton minions","Reinit","Reinit ","reinitialisation\nof all building\nand power\ndevelopment","","","","","","","","","Charm the ennemies\nusing spiritual powers","","","Oliphant can destroy a whole army","","","","","","","","","Hammer cause\n an earthquake","XP","Unit XP","All unit have XP"}
			texttraduction.tuto={"Enemy come from this point","Click to build a tower","Build an infantery tower","Build an archer tower","Place your tower\nanywhere on the grass","Launch the first wave of enemy","Rebuild the gold mine","Launch the first wave of enemy","Collect gold","Upgrade your tower","Click to minimize\nthe time between waves","Launch the first wave of enemy","Use your special power","Place the power on the road"}
			texttraduction.comp={"Background music ","Story","Upgrades:\nUnlock new buildings,\npowers and generals","Extra level","Settings:\nchoose the volume\nand desactive the\nbackground music","Choose your hero\nand press play","Choose your level","Unlock new buildings"}
			texttraduction.menucarte={"Brave warrior,\n\nyou are the chosen one among the elves, humans\nand giants.\n\nBuild towers, control your hero and make good\nuse of the technologies of each race to defend\nthe kingdoms.","Captain,\n\nthe elf kingdom is safe and sound. We must now\ndefend the northen land which is overwhelmed by orcs.\nMay you die with a sword in battle.","General,\n\nnow that the orcs in the north have been chased away,\nhead to the desert with the giants and crush\nthe mercenaries once and for all.","My king,\n\nthe three kingdoms armies are matching to Ashes.\nHelp them defeat Vulkann in the final battle.\nMay the gods be with you.\n\nTip: Unlock XP for all your units in the general main tab"}
			texttraduction.batiment={"Barrack","Fort","Fortress","Castle","Cave","Cavern","Antrum","Farm","Stable","Paladin","Watchtower","Crossbow","Heavy tower","Ballista","Catapult","Onager","Trebuchet","Spiker","Slayer","Acid","Abandoned mine","Mine","Goblin mine","Dwarf mine","Batiment"}
			texttraduction.soldat={"Spartan","Kingsguard","Warpriest","Elf leader","Necromancer","Sharpshooter","Gladiator","Scorpio","Divine hammer","Oliphant","soldier","Militiaman","Swordsman","Champion","Butcher","Ogre","Skinner","Squire","Knight","Paladin","RenfInf 1","RenfInf 2","RenfInf 3","RenfArc 1","RenfArc 2","RenfArc 3"}
			texttraduction.complement={"Unlock ","\nAttack","\nHP","\nRange","\nFire rate","\nPrice",": weak",": medium",": high","\nCharge bonus","\nAttack several\n enemies","\nArea damage","\nArrow"}
			texttraduction.message={"You lose","You win"," Damage:"," HP:"," Atk:"," lvl:"}
			if not goh then
				texttraduction.rate={"You liked Stronghold?   Why not rating it?","Killed: ","  Wave: ","Level: "}
				texttraduction.changelog={"Discover our new game :\nGate of Heroes !"}
				texttraduction.hero={"lvl:","xp:","HP:","ATK:"}
			else
				texttraduction.rate={"You liked Gate Of Heroes?   Why not rating it?","Killed: ","  Wave: ","Level: "}
				texttraduction.changelog={"New tutorial"}
				texttraduction.hero={"lvl","xp","HP","ATK"}
			end
			texttraduction.modedejeu={"Panic mode!","Zombie mode!","Skeleton mode!","Army mode!","MegaXP mode!","Millionaire Mode!","Mode Infinite!","Attack mode!(beta)","Army mode!","Hardcore"}
			texttraduction.bonusrace={"Human: ","\nCatapult Range/Atk +10% \nInfantry HP/Atk +10%","Elf: ","\nArcher Range/Atk +10% \nChivalry HP/Atk +10%","Giant: ","\nSpiker Range/Atk +10% \nGiant HP/attk +10%","Hardcore mode:\n\n"," gems\n5 coins -> 1 gem","3 stars require to unlock hardcore mode","1 Wave mode","You need to win the hardcore mode"}
			texttraduction.multi={"Play","Editor","Soldier","Unlock","Random","Nil","Save","Spell 1","Spell 2","Spell 3","Hero 1","Hero 2","Hero 3","Map 2","Map 3","Map 4"}
			texttraduction.menuinf={"Play campaign mode","Play to special game mode\nUnlock new modes by using yellow diamonds\nYou win them when you finish a campaign level not loosing many life","Unlock new buildings, spells or heroes","Enjoy the alpha version of multiplayer"}
			texttraduction.statinfo={"Kills","Kills by the better tower","Kills by the hero","World ranking"}
			texttraduction.menuquestion={"Leave the game?","Do you want to restart?"}
			texttraduction.finishgame={"Congratulation !\n\nYou have killed Vulkann, peace will be back.\nYou have found the treasure of Vulkann containing 300 gems.\nDo you still have the courage to save the world once again in hard core mod?"}
			texttraduction.tuto0={"Would you like to retreat and\nbegin the adventure with a new hero ?","The battle is lost, we must retreat"}
			texttraduction.gohpub={'Level 16 now available\nin "Gate of Heroes"'}
		end
		if texttraduction.modedejeu[10]==nil then
			texttraduction.modedejeu[10]="Hardcore"
		end
		texttraduction.chniveaubonus[6]=texttraduction.chniveaubonus[5]
		
			texttraduction.message[3]=" }"
			texttraduction.message[4]=" {"
			texttraduction.message[5]=" }"

			texttraduction.complement[2]="\n}"
			texttraduction.complement[3]="\n{"
			texttraduction.complement[4]="\n°"
			texttraduction.complement[5]="\n*"
			texttraduction.complement[6]="\n$"
			texttraduction.complement[7]=": ¤"
			texttraduction.complement[8]=": ¤¤"
			texttraduction.complement[9]=": ¤¤¤"
			
			texttraduction.chniveaubonus[20]="Mega^"
			texttraduction.hero={"lvl","^","§","}"}

			texttraduction.bonusrace[2]="\nÅ    °/} +10% \nÂ     §/} +10%"
			texttraduction.bonusrace[4]="\nÆ    °/} +10% \nÃ    §/} +10%"
			texttraduction.bonusrace[6]="\nÁ    °/} +10% \nÄ    §/} +10%"

			texttraduction.batiment[1]="Â "..texttraduction.batiment[1]
			texttraduction.batiment[2]="Â "..texttraduction.batiment[2]
			texttraduction.batiment[3]="Â "..texttraduction.batiment[3]
			texttraduction.batiment[4]="Â "..texttraduction.batiment[4]

			texttraduction.batiment[5]="Ä "..texttraduction.batiment[5]
			texttraduction.batiment[6]="Ä "..texttraduction.batiment[6]
			texttraduction.batiment[7]="Ä "..texttraduction.batiment[7]

			texttraduction.batiment[8]="Ã "..texttraduction.batiment[8]
			texttraduction.batiment[9]="Ã "..texttraduction.batiment[9]
			texttraduction.batiment[10]="Ã "..texttraduction.batiment[10]

			texttraduction.batiment[11]="Æ "..texttraduction.batiment[11]
			texttraduction.batiment[12]="Æ "..texttraduction.batiment[12]
			texttraduction.batiment[13]="Æ "..texttraduction.batiment[13]
			texttraduction.batiment[14]="Æ "..texttraduction.batiment[14]

			texttraduction.batiment[16]="Å "..texttraduction.batiment[16]
			texttraduction.batiment[15]="Å "..texttraduction.batiment[15]
			texttraduction.batiment[17]="Å "..texttraduction.batiment[17]

			texttraduction.batiment[18]="Á "..texttraduction.batiment[18]
			texttraduction.batiment[19]="Á "..texttraduction.batiment[19]
			texttraduction.batiment[20]="Á "..texttraduction.batiment[20]

			texttraduction.batiment[21]="á "..texttraduction.batiment[21]
			texttraduction.batiment[22]="á "..texttraduction.batiment[22]
			texttraduction.batiment[23]="á "..texttraduction.batiment[23]
			texttraduction.batiment[24]="á "..texttraduction.batiment[24]
			-- Â : infanterie Ã : cavalerie Ä : géant Å : catapulte Æ : archers Á  : liquide á : mine
			-- { : Vie (pour la vie des casernes ) § : HP (point de vie des héros ) } : atk ° : portée $ : pièces * : cadence ^ : XP ¤ : étoile (pour faible moyen élevé) £ : augmenté 	
			texttraduction.wave={"Â °x2","Ä °x2","Ã °x2","á repair 2x faster","Æ faster arrows","Å faster projectile","Á °+25%","Mine doesn't wait to repair","Â +1Â","Ã +1Ã","Ä +1Ä","á §x2","Æ +1 arrow","Å +1 projectile","Á }x2","á $x4"}
			texttraduction.bonusrace[12]="Reward:\n"
		
		return texttraduction
	end
	function newinitbonus(reinit)
		print("init dev")
		--savegameall.bonus={}
		if reinit==nil then
			savegameall={}
		end
		savegameall.bonusbatiment={}
		-- for i=1,3 do
		-- 	savegameall..bonus.batiment[i]={} --type 1
		-- 	for j=1,3 do
		-- 		savegameall..bonus.batiment[i][j]={} --type 2 +1
		-- 		for k=1,5 do
		-- 			savegameall..bonus.batiment[i][j][k]={} --niveau
		-- 		end
		-- 	end
		-- end
		savegameall.unlock={}
		for i=1,50 do
			savegameall.bonusbatiment[i]={}
			savegameall.unlock[i]=0
		end
		savegameall.unlock[1]=1
		savegameall.unlock[16]=1
		for i=31,50 do
			savegameall.unlock[i]=1
		end
		-- savegameall..bonus.batiment[1][1][1].porte=200000
		savegameall.bonusbatiment.tableau={}
		savegameall.bonusbatiment.tableau[1]={"porte","nbunit"}
		savegameall.bonusbatiment.tableau[2]={"attaque","porte","cadence","vitesse","impact","nbfleche"}
		savegameall.bonusbatiment.tableau[3]={"argentsec","vie","vietotale"}

		savegameall.bonussoldat={}
		for i=1,100 do
			savegameall.bonussoldat[i]={}--typesoldat 
		end
		--savegameall..bonus.soldat[101].vie=200
		-- savegameall..bonus.soldat[171].tir={}
		-- savegameall..bonus.soldat[171].vie=10000
		-- savegameall..bonus.soldat[171].tir.attaque=100
		savegameall.bonussoldat.tableaucont={"vie","attaque","vitesse","timeatt","regene","charge","regenevie","blocnbennemi","attnbennemi"}
		savegameall.bonussoldat.tableaudist={"porte","attaque","vitesse","cadence","nbfleche"}
		savegameall.bonuspouvoir={}
		savegameall.bonuspouvoir[1]={}--pouvoir 1
		savegameall.bonuspouvoir[1].loadt=1 --duree de chargement
		savegameall.bonuspouvoir[1].nbsold=2 --nombre de soldat
		savegameall.bonuspouvoir[2]={}
		savegameall.bonuspouvoir[2].unlock=false --si il est debloquer
		savegameall.bonuspouvoir[2].loadt=1 --duree de chargement
		savegameall.bonuspouvoir[2].attaque=1 --attaque du pv
		savegameall.bonuspouvoir[2].bonus=1 --bonus (nb pro pour race 0,1 et race 2 pv att+10%+ si pv rest >50% alors pv load 50%)
		savegameall.bonuspouvoir[3]={}
		savegameall.bonuspouvoir[3].unlock=false --si il est debloquer
		savegameall.bonuspouvoir[3].loadt=1
		savegameall.bonuspouvoir[3].bonus1=1
		savegameall.bonuspouvoir[3].bonus2=1
		savegameall.bonuspouvoir[3].bonus3=1
		if reinit==nil then
			savegameall.general={}
			savegameall.generalch={} -- general choisi
			for i=1,3 do --race+1
				savegameall.general[i]=1
				--savegameall.generalch[i]=1
				-- savegameall.generaldev[i]={}
				-- for j=1,3 do -- nombre de general par race
				-- 	-- savegameall.generaldev[i][j].niveau=1 -- niveau du general
				-- 	savegameall.generaldev[i][j].experience=0 -- experience du general
				-- end
			end
		end
		savegameall.generalxp={}
		savegameall.generalxp[1]=500
		local coef=2
		for i=2,101 do
			savegameall.generalxp[i]=savegameall.generalxp[i-1]*coef
			if i==5 then
				coef=1.8
			elseif i==10 then
				coef=1.5
			elseif i==15 then
				coef=1.25
			end
		end
		
		savegameall.generalxp[1]=400
		--savegameall.generalxp={400,1000,2000,4000,8000,16000,32000,64000,128000} -- nombre d'experience pour passer au niveau du dessus
		savegameall.unitxp={200,300,400,500,600,700,900,1000,1300,1600,1900,2100,2400,3000,3500,4000,4600,5200,5900,6700,7600,8600,10000,12000,14000,17000,21000,26000,32000,39000,47000,55000,30000,40000,50000,60000,70000,80000,900000,100000,110000,140000,200000,300000,600000,700000,800000,260000000} -- nombre d'experience pour passer au niveau du dessus. comportement different que le general
		savegameall.xpactive=false
		-- que mettons dedans
		savegameall.bouton0={}
		for i=1,320 do --0 à 320 pour menu dev, 0 à 80 pour le premier groupe,80 à 160 pour le deuxieme, 0 a 20 pour la premiere page 
			savegameall.bouton0[i]=1 --1 pour dispo, 0 pour pas dispo, 2 pour deja acquis
		end
		if savegameall.bouton1==nil then
			savegameall.bouton1={}
			for i=1,106 do --niveau+20*pages
				savegameall.bouton1[i]=0 --------------------ici pour mettre le deve
			end
			local nbniv=1
			for i=1,16 do
				if savegameresul~=nil then
					if savegameresul[(i-1)*4+4]~=nil then
						if savegameresul[(i-1)*4+4]~=0 then
							print("savegameresul[("..i.."-1)*4+4]="..savegameresul[(i-1)*4+4])
							local pagenb=1
							local niveauchtest=i+1
							if niveauchtest>4 then
								if niveauchtest>8 then
									if niveauchtest>12 then
										pagenb=4
									else
										pagenb=3
									end
								else
									pagenb=2
								end
							end
							print("ici "..(pagenb*20+(niveauchtest-(pagenb-1)*4)))
							savegameall.bouton1[pagenb*20+(niveauchtest-(pagenb-1)*4)]=1
						elseif issimulator then
							savegameresul[(i-1)*4+4]=1 ----------------------------------------------------------------------------------- debloque tout les niveaux
						end
					end
				end
			end
			--for i=1,21 do
			print("ca reinit?")
				savegameall.bouton1[21]=1
				savegameall.bouton1[101]=1
				savegameall.bouton1[102]=1
				savegameall.bouton1[103]=1
				savegameall.bouton1[104]=1
				savegameall.bouton1[105]=1
				savegameall.bouton1[106]=1
				savegameall.bouton1[107]=1
				savegameall.bouton1[108]=1

		end
		--end
		leveldata={} --stoker des données pour le visiuel des minicarte
		for i=-1,24 do
			leveldata[i]={}
		end
		for i=16,24 do
			leveldata[i].wave=5
			leveldata[i].life=10
		end
		leveldata[0].wave=3 -- nombre de vague pour le niveau zombie
		leveldata[0].life=5 -- nombre de vie pour le niveau zombie
		leveldata[1].wave=3 -- nombre de vague pour le niveau 1
		leveldata[1].life=5 -- nombre de vie pour le niveau 1
		leveldata[2].wave=4
		leveldata[2].life=5
		leveldata[3].wave=4
		leveldata[3].life=5
		leveldata[4].wave=5
		leveldata[4].life=5

		leveldata[5].wave=5
		leveldata[5].life=7
		leveldata[6].wave=5
		leveldata[6].life=7
		leveldata[7].wave=6
		leveldata[7].life=7
		leveldata[8].wave=7
		leveldata[8].life=7

		leveldata[9].wave=7
		leveldata[9].life=10
		leveldata[10].wave=8
		leveldata[10].life=10
		leveldata[11].wave=9
		leveldata[11].life=10
		leveldata[12].wave=10
		leveldata[12].life=10

		leveldata[13].wave=10
		leveldata[13].life=15
		leveldata[14].wave=11
		leveldata[14].life=15
		leveldata[15].wave=11
		leveldata[15].life=15
		if not goh then
			leveldata[16].wave=4
			leveldata[16].life=40
		else
			leveldata[16].wave=11
			leveldata[16].life=15
		end
		leveldata[17].wave=4
		leveldata[17].life=40

		leveldata[1].wavetune=2000
		leveldata[2].wavetune=600
		leveldata[3].wavetune=2000
		leveldata[4].wavetune=2000
		leveldata[5].wavetune=2000
		leveldata[6].wavetune=4000
		leveldata[7].wavetune=4000
		leveldata[8].wavetune=4000
		leveldata[9].wavetune=6000
		leveldata[10].wavetune=6000
		leveldata[11].wavetune=6000
		leveldata[12].wavetune=6000
		leveldata[13].wavetune=8000
		leveldata[14].wavetune=8000
		if goh then
			leveldata[15].wavetune=8000
		else
			leveldata[15].wavetune=10000
		end
		leveldata[16].wavetune=10000
		leveldata[17].wavetune=10000

		--savegameall.saveretour={"ordredecrea","ennemipasse","race","niveauch","modeinfini","pouvoirdisp","nbsoldat","tunefin","ennemipassedep","argentdep","vagueinf","nbvague","genetype","dureepartie","nombredekill","nbperte","nbgenemort","attpv1","pv1nb","attpv2","pv2nb","attpv3","pv3nb","attgene","dureepartie","dureepartie1","accelererenn","modeinfdif","ralenticroissance","infinfo","laginfo","victoire","dureepause","dureeacc","nbpause","nbacc","ordrespawn"}
		savegameall.multidata={}
		for i=1,4 do
			savegameall.multidata[i]={}--carte
			for j=1,4 do
				savegameall.multidata[i][j]={}--save
				savegameall.multidata[i][j].fric=200
				savegameall.multidata[i][j].vaguemax=j^2 --0
				savegameall.multidata[i][j].point=5*j
				savegameall.multidata[i][j].timer=15
				savegameall.multidata[i][j].timervague=5
			end
		end
		savegameall.multidata[-1]={}--carte
		savegameall.multidata[-1][1]={}--save
		savegameall.multidata[-1][1].fric=200
		savegameall.multidata[-1][1].vaguemax=100 --0
		savegameall.multidata[-1][1].point=5
		savegameall.multidata[-1][1].timer=15
		savegameall.multidata[-1][1].timervague=5
		--savegameall.tips={"Don't forget to unlock building","Move the flag to move soldier","Unlock new general to increase your power","3 power exist, unlock them all","You can developpe the puissance of the power"}
		--savegameall.tips={"débloque des tours et des généraux en cliquant sur le coffre","la cavalerie posséde un bonus de charge","Les géants retiennent et attaquent plusieurs ennemi à la fois","Les fleches des tours atteignent toujours leurs cibles","Une mine dévellopé rapporte plus","Construit les batiments sur les zones constructibles","Les generaux de niveau 3 on une attaque speciale","Les challenges se debloquent avec diamant jaune","Les diamants rouges sont la monnaie des dévellopements","Regle le son en cliquant sur l'engrenage","Trois pouvoirs sont disponible","Les généraux gagnent de XP en se battant","Lance une vague en avance rapporte de l'argent"}--tips new
		texttraduction={} -- contient tout les textes du jeu.
		local langueutilisateur=string.lower(string.sub(system.getPreference("ui","language"),1,2))
		if supportlanguage[langueutilisateur]==nil then
			langueutilisateur=string.lower(string.sub(system.getPreference( "locale", "language" ),1,2))
		end
		print("langueutilisateur "..langueutilisateur)
		if issimulator and false then
			local function printxmllangue(v0)
				local stringxml=[[<?xml version="1.0" encoding="utf-8"?>]].."\n<resources>"
				for k, v in pairs(v0) do 
					for k1,v1 in pairs(v) do
						v1=string.gsub(v1,"\n"," ")
						v1=string.gsub(v1,">"," ")
						v1=string.gsub(v1,"<"," ")
						v1=string.gsub(v1,[[\]]," ")
						v1=string.gsub(v1,[[/]]," ")
						v1=string.gsub(v1,'%%'," ")
						stringxml=stringxml.."\n"..[[	<string name="]]..k..k1..[[">]]..v1..[[</string>]]
					end
				end
				stringxml=stringxml.."\n</resources>"
				print("\n\n"..stringxml)
			end
			printxmllangue(getlanguage("dff"))
			printxmllangue(getlanguage("fr"))
			printxmllangue(getlanguage("cs"))
			printxmllangue(getlanguage("in"))
			printxmllangue(getlanguage("ru"))
		end
		getlanguage(langueutilisateur)
		savegameall.gainhard={20,75,150,400}
		savegameall.tips=texttraduction.savegamealltips --{"Unlock new towers, spells and heroes","Click on the chest to open the tower and heroe menu","Cavalry has a charge bonus","Giants can stop and attack several ennemies ","Archer Towers arrows always hit their target","An upgraded mine increases income","Buildings can only be built on a buildable areas","Level 3 heroes have a special attack","Bonus level can be unlocked with yellow diamonds","Upgrades can be unlocked with red diamonds","Adjust the sound by clicking on the gear","Three spells are available","Heroes gains XP by fighting","Earn money by calling waves early"}
		--savegameall.mapname={"Un paisible village","Une mine abandonnée","Petite riviere/Pont sur riviere","Rond point du moulin/ La ferme au moulin","Les premieres neiges","Le serpent enneigé","Unknows land","Les igloos perdus","Indiens et cow-boys","Aux portes de la ville","Oasis au bord du desert/Oasis du desert","La baie/cirque des pirates","Le/les villages perdus","Unknown land","Unknown land"}
		savegameall.mapname=texttraduction.savegameallmapname --{"Peaceful village","Abandoned mine","The small river","The mill farm","First snow","Snowing snake","Arctic highway","Lost igloos","Indians and cowboys","The city gates","Desert Oasis","Pirate Bay","Unknown land","Lost villages","Unknown land","Unknown land"}
		savegameall.mapname[17]="Tutorial level"
		-- leveldata[1].
		-- savegameall.dev={}
		-- for i=1,320 do
		-- 	savegameall.dev[i]=0 --devellopement fait
		-- end
		-- loadsave.saveTable(savegameall., "undeuxtroissoleil.json" )
		-- loadsave.saveTable(savegameall.bonussoldat, "undeuxtroissoleil1.json" )
		-- loadsave.saveTable(savegameall.bonusbatiment, "undeuxtroissoleil2.json" )
		-- loadsave.saveTable(savegameall.bonuspouvoir, "undeuxtroissoleil3.json" )
		--print("savegame niveau 1 etoile "..savegame[4])
	end
end
return(t)