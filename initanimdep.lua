local t={}
if not functionload then
function initsequence()--initialisation de tout les animations(ordre des images et autre parametre)
sequence={}
if goh then
	sequence.infwalk={
		{
			name="walk",
			frames={1,2,3,4},
			time=500,
			loopCount=0,
		},
		{
			name="arret",
			frames={1,1},
			time=400,
			loopCount=0,
		}
	}
	sequence.cavgent ={
	{
	name="walk",
	frames={1,2,3,4},--frames= {1,4,5,3}, -- frame indexes of animation, in image sheet
    time = 400,           -- Optional. In ms.  If not supplied, then sprite is frame-based.
	loopCount = 0,        -- Optional. Default is 0.

  -- loopDirection = "faward"
	},
	{
	name="arret",
	frames={1,1,1,1},--frames= {1,4,5,3}, -- frame indexes of animation, in image sheet
    time = 400,           -- Optional. In ms.  If not supplied, then sprite is frame-based.
	loopCount = 0,        -- Optional. Default is 0.

  -- loopDirection = "faward"
	}}
	sequence.elf2 ={
	{
	name="walk",
	frames={1,2,3,4,5,6,7},--frames= {1,4,5,3}, -- frame indexes of animation, in image sheet
    time = 400,           -- Optional. In ms.  If not supplied, then sprite is frame-based.
	loopCount = 0,        -- Optional. Default is 0.

  -- loopDirection = "faward"
	},
	{
	name="arret",
	frames={1,1,1,1},--frames= {1,4,5,3}, -- frame indexes of animation, in image sheet
    time = 400,           -- Optional. In ms.  If not supplied, then sprite is frame-based.
	loopCount = 0,        -- Optional. Default is 0.

  -- loopDirection = "faward"
	}}
	sequence.golem ={
	{
	name="walk",
	frames={1,2,3,4,5,6,7,8,9,10},--frames= {1,4,5,3}, -- frame indexes of animation, in image sheet
    time = 400,           -- Optional. In ms.  If not supplied, then sprite is frame-based.
	loopCount = 0,        -- Optional. Default is 0.

  -- loopDirection = "faward"
	},
	{
	name="arret",
	frames={1,1,1,1},--frames= {1,4,5,3}, -- frame indexes of animation, in image sheet
    time = 400,           -- Optional. In ms.  If not supplied, then sprite is frame-based.
	loopCount = 0,        -- Optional. Default is 0.

  -- loopDirection = "faward"
	}}
	sequence.araigne ={
	{
	name="walk",
	frames={1,2,3,4,5,6},
    time = 400,
	loopCount = 0,
	},
	{
	name="arret",
	frames={1,1,1,1},
    time = 400,
	loopCount = 0,
	}}
	sequence.ours ={
	{
	name="walk",
	frames={1,2,3,4,5,6,7,8},
    time = 400,
	loopCount = 0,
	},
	{
	name="arret",
	frames={1,1,1,1},
    time = 400,
	loopCount = 0,
	}}
	sequence.rhino ={
	{
	name="walk",
	frames={1,2,3,4,5,6,7,8,9},
    time = 400,
	loopCount = 0,
	},
	{
	name="arret",
	frames={1,1,1,1},
    time = 400,
	loopCount = 0,
	}}
	sequence.chien ={
	{
	name="walk",
	frames={1,2,3,4,5},
    time = 400,
	loopCount = 0,
	},
	{
	name="arret",
	frames={1,1,1,1},
    time = 400,
	loopCount = 0,
	}}
else
	sequence.cavgent ={
		{
		name="cavmouv",
		frames={1,2,3,4},--frames= {1,4,5,3}, -- frame indexes of animation, in image sheet
	    time = 400,           -- Optional. In ms.  If not supplied, then sprite is frame-based.
		loopCount = 0,        -- Optional. Default is 0.

	  -- loopDirection = "faward"
		},
		{
		name="arret",
		frames={4,4,4},--frames= {1,4,5,3}, -- frame indexes of animation, in image sheet
	    time = 400,           -- Optional. In ms.  If not supplied, then sprite is frame-based.
		loopCount = 0,        -- Optional. Default is 0.

	  -- loopDirection = "faward"
		}}
end
sequence.araigne ={
	{
	name="cavmouv",
	frames={1,2,3,4,5,6},--frames= {1,4,5,3}, -- frame indexes of animation, in image sheet
    time = 400,           -- Optional. In ms.  If not supplied, then sprite is frame-based.
	loopCount = 0,        -- Optional. Default is 0.

  -- loopDirection = "faward"
	},
	{
	name="arret",
	frames={1,1,1,1},--frames= {1,4,5,3}, -- frame indexes of animation, in image sheet
    time = 400,           -- Optional. In ms.  If not supplied, then sprite is frame-based.
	loopCount = 0,        -- Optional. Default is 0.

  -- loopDirection = "faward"
	}}
sequence.dragon ={
	{
	name="cavmouv",
	frames={1,8,9,4,5,4,6,3},--frames= {1,4,5,3}, -- frame indexes of animation, in image sheet
    time = 400,           -- Optional. In ms.  If not supplied, then sprite is frame-based.
	loopCount = 0,        -- Optional. Default is 0.

  -- loopDirection = "faward"
	},
	{
	name="arret",
	frames={1,1,1,1},--frames= {1,4,5,3}, -- frame indexes of animation, in image sheet
    time = 400,           -- Optional. In ms.  If not supplied, then sprite is frame-based.
	loopCount = 0,        -- Optional. Default is 0.

  -- loopDirection = "faward"
	}}
sequence.cav ={
	{
	name="cavamechant",
	frames={1,2,3},--frames= {1,4,5,3}, -- frame indexes of animation, in image sheet
    time = 500,           -- Optional. In ms.  If not supplied, then sprite is frame-based.
	loopCount = 0,        -- Optional. Default is 0.

  -- loopDirection = "faward"
	},
	{
	name="arret",
	frames= {1,1,1}, -- frame indexes of animation, in image sheet
	time = 400,           -- Optional. In ms.  If not supplied, then sprite is frame-based.
	loopCount = 0,        -- Optional. Default is 0.
	-- loopDirection = "faward"
	}}
sequence.inf ={
{
name="horizontale",
frames={3,2,1},--frames= {1,4,5,3}, -- frame indexes of animation, in image sheet
time = 500,           -- Optional. In ms.  If not supplied, then sprite is frame-based.
loopCount = 0,        -- Optional. Default is 0.

-- loopDirection = "faward"
},
{
name="verticale",
frames={4,5},-- {1,6,3,6,5,6,5,6,3,6}, -- frame indexes of animation, in image sheet
time = 400,           -- Optional. In ms.  If not supplied, then sprite is frame-based.
loopCount = 0,        -- Optional. Default is 0.
-- loopDirection = "faward"
},
{
name="diagonalehaut",
frames= {1,1,2}, -- frame indexes of animation, in image sheet
time = 400,           -- Optional. In ms.  If not supplied, then sprite is frame-based.
loopCount = 0,        -- Optional. Default is 0.
-- loopDirection = "faward"
},
{
name="diagonalebas",
frames= {3,3,2}, -- frame indexes of animation, in image sheet
time = 400,           -- Optional. In ms.  If not supplied, then sprite is frame-based.
loopCount = 0,     
},
{
name="arret",
frames= {6,6,6}, -- frame indexes of animation, in image sheet
time = 400,           -- Optional. In ms.  If not supplied, then sprite is frame-based.
loopCount = 0,        -- Optional. Default is 0.
-- loopDirection = "faward"
}}
sequence.infme ={
{
name="horizontale",
frames={4,3,2}, --4,3},--frames= {1,4,5,3}, -- frame indexes of animation, in image sheet
time = 600,           -- Optional. In ms.  If not supplied, then sprite is frame-based.
loopCount = 0,        -- Optional. Default is 0.

-- loopDirection = "faward"
},
{
name="verticale",
frames={5,6},-- {1,6,3,6,5,6,5,6,3,6}, -- frame indexes of animation, in image sheet
time = 400,           -- Optional. In ms.  If not supplied, then sprite is frame-based.
loopCount = 0,        -- Optional. Default is 0.
-- loopDirection = "faward"
},
{
name="diagonalehaut",
frames= {2,2,3}, -- frame indexes of animation, in image sheet
time = 400,           -- Optional. In ms.  If not supplied, then sprite is frame-based.
loopCount = 0,        -- Optional. Default is 0.
-- loopDirection = "faward"
},
{
name="diagonalebas",
frames= {4,4,3}, -- frame indexes of animation, in image sheet
time = 400,           -- Optional. In ms.  If not supplied, then sprite is frame-based.
loopCount = 0,     
},
{
name="arret",
frames= {1,1,1}, -- frame indexes of animation, in image sheet
time = 400,           -- Optional. In ms.  If not supplied, then sprite is frame-based.
loopCount = 0,        -- Optional. Default is 0.
-- loopDirection = "faward"
}}
seqdata={
    	name="combat",
    	frames={1,1},--frames= {1,4,5,3}, -- frame indexes of animation, in image sheet
    	loopCount = 0,        -- Optional. Default is 0.
	}
sequence.att={}
for i=1,5 do
	sequence.att[i]={}
	for j=2,12 do
		sequence.att[i][j]={}
		--sequence.att[i][j]=seqdata
	end
end
if goh then
	sequence.att[1][2].frames={1,2}
	sequence.att[1][3].frames={1,2,3}
	sequence.att[1][4].frames={1,2,3,4}
	sequence.att[1][5].frames={1,2,3,4,5}
	sequence.att[1][6].frames={1,2,3,4,5,6}
	sequence.att[1][7].frames={1,2,3,4,5,6,7}
	sequence.att[1][8].frames={1,2,3,4,5,6,7,8}
	sequence.att[1][9].frames={1,2,3,4,5,6,7,8,9}
	sequence.att[1][10].frames={1,2,3,4,5,6,7,8,9,10}
	sequence.att[1][11].frames={1,2,3,4,5,6,7,8,9,10,11}
	sequence.att[1][12].frames={1,2,3,4,5,6,7,8,9,10,11,12}
	sequence.att[2][2].frames={1,2}
	sequence.att[2][3].frames={1,2,3}
	sequence.att[2][4].frames={1,2,3,4}
	sequence.att[2][5].frames={1,2,3,4,5}
	sequence.att[2][6].frames={1,2,3,4,5,6}
	sequence.att[2][7].frames={1,2,3,4,5,6,7}
	sequence.att[2][8].frames={1,2,3,4,5,6,7,8}
	sequence.att[2][9].frames={1,2,3,4,5,6,7,8,9}
	sequence.att[2][10].frames={1,2,3,4,5,6,7,8,9,10}
	sequence.att[2][11].frames={1,2,3,4,5,6,7,8,9,10,11}
	sequence.att[2][12].frames={1,2,3,4,5,6,7,8,9,10,11,12}
else
	sequence.att[1][2].frames={1,1,1,1,2}
	sequence.att[1][3].frames={1,1,1,1,2,3}
	sequence.att[1][4].frames={1,1,1,1,2,3,4}
	sequence.att[1][5].frames={1,1,1,1,2,3,4,5}
	sequence.att[1][6].frames={1,1,1,1,2,3,4,5,6}
	sequence.att[1][7].frames={1,1,1,1,2,3,4,5,6,7}
	sequence.att[1][8].frames={1,1,1,1,2,3,4,5,6,7,8}
	sequence.att[2][2].frames={1,1,1,1,2}
	sequence.att[2][3].frames={1,1,1,1,3,2}
	sequence.att[2][4].frames={1,1,1,1,4,3,2}
	sequence.att[2][5].frames={1,1,1,1,5,4,3,2,3}
	sequence.att[2][6].frames={1,1,1,1,6,5,4,3,2,3,6}
	sequence.att[2][7].frames={1,1,1,1,6,5,4,3,2,3,6,7}
	sequence.att[2][8].frames={1,1,1,1,6,5,4,3,2,3,6,7,8}
end
--dispo pour 5 type d'annimations, si cas speciale mettre la variable attanim à 0 et mettre l'odre des instance dans attanimordre
--ordreframes={1,1,1,1,2,3,4,5}

sequence.tir={
		{
		name="01",--0 pour archer et le deuxieme chiffre pour le niveau
		frames= {1}, -- frame indexes of animation, in image sheet
		time = 1,--2, 1          -- Optional. In ms.  If not supplied, then sprite is frame-based.
		loopCount = 10^8       -- Optional. Default is 0.
		},
		{
		name="02",
		frames= {2}, -- frame indexes of animation, in image sheet
		time = 1,--2, 1          -- Optional. In ms.  If not supplied, then sprite is frame-based.
		loopCount = 10^8       -- Optional. Default is 0.
		},
		{
		name="03",
		frames= {3}, -- frame indexes of animation, in image sheet
		time = 1,--2, 1          -- Optional. In ms.  If not supplied, then sprite is frame-based.
		loopCount = 10^8       -- Optional. Default is 0.
		},
		{
		name="04",
		frames= {4}, -- frame indexes of animation, in image sheet
		time = 1,--2, 1          -- Optional. In ms.  If not supplied, then sprite is frame-based.
		loopCount = 10^8       -- Optional. Default is 0.
		},
		{
		name="12",
		frames= {5}, -- frame indexes of animation, in image sheet
		time = 1,--2, 1          -- Optional. In ms.  If not supplied, then sprite is frame-based.
		loopCount = 10^8       -- Optional. Default is 0.
		},
		{
		name="13",
		frames= {6}, -- frame indexes of animation, in image sheet
		time = 1,--2, 1          -- Optional. In ms.  If not supplied, then sprite is frame-based.
		loopCount = 10^8       -- Optional. Default is 0.
		},
		{
		name="14",
		frames= {7}, -- frame indexes of animation, in image sheet
		time = 1,--2, 1          -- Optional. In ms.  If not supplied, then sprite is frame-based.
		loopCount = 10^8       -- Optional. Default is 0.
		}
	}

	trajectoire={}
	trajectoire.fle={}
	trajectoire.fle={-2,0,0.5,0.75,0.75}
	trajectoire.fleangle={}
	trajectoire.fleangle={0.15,0.35,0.35,0.25,0.15}
	trajectoire.boul={}
	trajectoire.boul={-2,-1,0,1,2}
	trajectoire.boulangle={}
	trajectoire.boulangle={0.2,0.2,0.2,0.2,0.2}

batimentinit={} -- pour que les batiments ne bouge pas quand on les developpe.
for k=1,3 do
	batimentinit[k]={}
	for i=0,3 do
		batimentinit[k][i]={}
		for j=1,4 do
			batimentinit[k][i][j]={}
			batimentinit[k][i][j].x=0
			batimentinit[k][i][j].y=0
			batimentinit[k][i][j].xecha=0
			batimentinit[k][i][j].yecha=0
			batimentinit[k][i][j].scaleecha=1
		end
	end
end
if goh then
	batimentinit[1][0][1].x=0 -- type1 (contact, archer ou mine(de 1 à 3)), type2( si contact infanterie, cavalerie et geant(0 à 2)), niveau( niveau du batiment(de 1 à 4))
	batimentinit[1][0][1].y=20
	batimentinit[1][0][1].xecha=-15
	batimentinit[1][0][1].yecha=10
	batimentinit[1][0][1].scaleecha=0.8
	batimentinit[1][0][2].x=7
	batimentinit[1][0][2].y=0
	batimentinit[1][0][2].xecha=-25
	batimentinit[1][0][2].yecha=0
	batimentinit[1][0][3].xecha=-30
	batimentinit[1][0][3].yecha=20
	batimentinit[1][0][4].xecha=-30
	batimentinit[1][0][4].yecha=20
	batimentinit[1][2][2].x=5
	batimentinit[1][2][2].y=-5
	batimentinit[1][2][2].xecha=-25
	batimentinit[1][2][2].yecha=-10
	batimentinit[1][2][3].x=5
	batimentinit[1][2][3].y=-5
	batimentinit[1][2][3].xecha=-35
	batimentinit[1][2][3].yecha=20
	batimentinit[1][2][4].x=5
	batimentinit[1][2][4].y=-5
	batimentinit[1][2][4].xecha=-35
	batimentinit[1][2][4].yecha=20
	batimentinit[1][1][2].x=5
	batimentinit[1][1][2].y=-5
	batimentinit[1][1][2].xecha=-20
	batimentinit[1][1][2].yecha=-5
	batimentinit[1][1][3].x=5
	batimentinit[1][1][3].y=-5
	batimentinit[1][1][3].xecha=-25
	batimentinit[1][1][3].yecha=20
	batimentinit[1][1][4].x=5
	batimentinit[1][1][4].y=-5
	batimentinit[1][1][4].xecha=-25
	batimentinit[1][1][4].yecha=20

	batimentinit[2][0][1].x=0
	batimentinit[2][0][1].y=15
	batimentinit[2][0][1].xecha=-15
	batimentinit[2][0][1].yecha=10
	batimentinit[2][0][1].scaleecha=0.8
	batimentinit[2][0][2].x=-5
	batimentinit[2][0][2].y=-5
	batimentinit[2][0][2].xecha=-20
	batimentinit[2][0][2].yecha=-15
	batimentinit[2][0][3].x=-5
	batimentinit[2][0][3].y=-5
	batimentinit[2][0][3].xecha=-10
	batimentinit[2][0][3].yecha=10
	batimentinit[2][0][4].x=-5
	batimentinit[2][0][4].y=-5
	batimentinit[2][0][4].xecha=-10
	batimentinit[2][0][4].yecha=10

	batimentinit[2][2][2].x=-3
	batimentinit[2][2][2].y=-5
	batimentinit[2][2][2].xecha=-15
	batimentinit[2][2][2].yecha=0
	batimentinit[2][2][3].x=-3
	batimentinit[2][2][3].y=-5
	batimentinit[2][2][3].xecha=-10
	batimentinit[2][2][3].yecha=10
	batimentinit[2][2][4].x=-3
	batimentinit[2][2][4].y=-5
	batimentinit[2][2][4].xecha=-10
	batimentinit[2][2][4].yecha=10
	batimentinit[2][1][2].x=-5
	batimentinit[2][1][2].y=-5
	batimentinit[2][1][2].xecha=-15
	batimentinit[2][1][2].yecha=0
	batimentinit[2][1][3].x=-5
	batimentinit[2][1][3].y=-5
	batimentinit[2][1][3].xecha=-10
	batimentinit[2][1][3].yecha=10
	batimentinit[2][1][4].x=-5
	batimentinit[2][1][4].y=-5
	batimentinit[2][1][4].xecha=-10
	batimentinit[2][1][4].yecha=10

	batimentinit[3][0][1].x=-20
	batimentinit[3][0][1].y=30
	batimentinit[3][0][2].x=-20
	batimentinit[3][0][2].y=30
	batimentinit[3][0][2].xecha=-15
	batimentinit[3][0][2].yecha=-15
	batimentinit[3][0][2].scaleecha=1.2
	batimentinit[3][0][3].x=-20
	batimentinit[3][0][3].y=30
	batimentinit[3][0][3].xecha=-15
	batimentinit[3][0][3].yecha=-15
	batimentinit[3][0][3].scaleecha=1.2
	batimentinit[3][0][4].x=-20
	batimentinit[3][0][4].y=30
	batimentinit[3][0][4].xecha=-15
	batimentinit[3][0][4].yecha=-15
	batimentinit[3][0][4].scaleecha=1.2
	-- batimentinit[1][0][2].x=7
	-- batimentinit[1][0][2].y=0
end
attaquebatsec={}
for k=1,4 do
	attaquebatsec[k]={}
	for i=1,3 do
		attaquebatsec[k][i]={}
		for j=1,3 do
			attaquebatsec[k][i][j]={}
		end
	end
end
attaquebatsec[1][1][1][1]=14
attaquebatsec[2][1][1][1]=14
attaquebatsec[3][1][1][1]=14
attaquebatsec[4][1][1][1]=14
attaquebatsec[1][1][1][2]=27
attaquebatsec[2][1][1][2]=27
attaquebatsec[3][1][1][2]=27
attaquebatsec[4][1][1][2]=27
attaquebatsec[1][1][1][3]=57
attaquebatsec[2][1][1][3]=57
attaquebatsec[3][1][1][3]=57
attaquebatsec[4][1][1][3]=57
attaquebatsec[1][1][1][4]=88
attaquebatsec[2][1][1][4]=88
attaquebatsec[3][1][1][4]=88
attaquebatsec[4][1][1][4]=88
attaquebatsec[1][1][2][2]=21
attaquebatsec[2][1][2][2]=21
attaquebatsec[3][1][2][2]=21
attaquebatsec[4][1][2][2]=21
attaquebatsec[1][1][2][3]=35
attaquebatsec[2][1][2][3]=35
attaquebatsec[3][1][2][3]=35
attaquebatsec[4][1][2][3]=35
attaquebatsec[1][1][2][4]=98
attaquebatsec[2][1][2][4]=98
attaquebatsec[3][1][2][4]=98
attaquebatsec[4][1][2][4]=98
attaquebatsec[1][1][3][2]=29
attaquebatsec[2][1][3][2]=29
attaquebatsec[3][1][3][2]=29
attaquebatsec[4][1][3][2]=29
attaquebatsec[1][1][3][3]=58
attaquebatsec[2][1][3][3]=58
attaquebatsec[3][1][3][3]=58
attaquebatsec[4][1][3][3]=58
attaquebatsec[1][1][3][4]=78
attaquebatsec[2][1][3][4]=78
attaquebatsec[3][1][3][4]=78
attaquebatsec[4][1][3][4]=78
attaquebatsec[1][2][1][1]=7
attaquebatsec[2][2][1][1]=8
attaquebatsec[3][2][1][1]=7
attaquebatsec[4][2][1][1]=7
attaquebatsec[1][2][1][2]=15
attaquebatsec[2][2][1][2]=18
attaquebatsec[3][2][1][2]=15
attaquebatsec[4][2][1][2]=15
attaquebatsec[1][2][1][3]=34
attaquebatsec[2][2][1][3]=40
attaquebatsec[3][2][1][3]=34
attaquebatsec[4][2][1][3]=34
attaquebatsec[1][2][1][4]=49
attaquebatsec[2][2][1][4]=59
attaquebatsec[3][2][1][4]=49
attaquebatsec[4][2][1][4]=49
attaquebatsec[1][2][2][2]=25
attaquebatsec[2][2][2][2]=21
attaquebatsec[3][2][2][2]=21
attaquebatsec[4][2][2][2]=21
attaquebatsec[1][2][2][3]=36
attaquebatsec[2][2][2][3]=29
attaquebatsec[3][2][2][3]=29
attaquebatsec[4][2][2][3]=29
attaquebatsec[1][2][2][4]=42
attaquebatsec[2][2][2][4]=35
attaquebatsec[3][2][2][4]=35
attaquebatsec[4][2][2][4]=35
attaquebatsec[1][2][3][2]=21
attaquebatsec[2][2][3][2]=21
attaquebatsec[3][2][3][2]=27
attaquebatsec[4][2][3][2]=21
attaquebatsec[1][2][3][3]=35
attaquebatsec[2][2][3][3]=35
attaquebatsec[3][2][3][3]=44
attaquebatsec[4][2][3][3]=35
attaquebatsec[1][2][3][4]=72
attaquebatsec[2][2][3][4]=72
attaquebatsec[3][2][3][4]=91
attaquebatsec[4][2][3][4]=72
attaquebatsec[1][3][1][2]=20
attaquebatsec[2][3][1][2]=20
attaquebatsec[3][3][1][2]=20
attaquebatsec[4][3][1][2]=20
attaquebatsec[1][3][1][3]=40
attaquebatsec[2][3][1][3]=40
attaquebatsec[3][3][1][3]=40
attaquebatsec[4][3][1][3]=40
attaquebatsec[1][3][1][4]=64
attaquebatsec[2][3][1][4]=64
attaquebatsec[3][3][1][4]=64
attaquebatsec[4][3][1][4]=64

end
end
t.initanimdep = function()
local a=1
end
return t