# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 4.926116548815657

load 4INS.pdb, 4INS
bg_color white
hide everything, 4INS
show cartoon, 4INS
color grey80, 4INS
set cartoon_transparency, 0.1

select worst_residues, 4INS and resi 47+55+60+61+64+71+72+73+74+75
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 4INS and resi 34+49+91+278+524+3617
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 4INS and resi 74 and name CA, 4INS and resi 84 and name CA  # target=21.588723747408352 current=7.378093639948456
color yellow, pair_00
distance pair_01, 4INS and resi 47 and name CA, 4INS and resi 74 and name CA  # target=22.663963506189024 current=8.647984280548021
color yellow, pair_01
distance pair_02, 4INS and resi 45 and name CA, 4INS and resi 75 and name CA  # target=20.703435295662963 current=6.808245392427276
color yellow, pair_02
distance pair_03, 4INS and resi 61 and name CA, 4INS and resi 69 and name CA  # target=15.882006125541203 current=3.2779635608010693
color yellow, pair_03
distance pair_04, 4INS and resi 47 and name CA, 4INS and resi 75 and name CA  # target=22.46189544170975 current=9.90800050659507
color yellow, pair_04
distance pair_05, 4INS and resi 45 and name CA, 4INS and resi 74 and name CA  # target=17.475274178007037 current=4.941504626403582
color yellow, pair_05
distance pair_06, 4INS and resi 49 and name CA, 4INS and resi 72 and name CA  # target=15.1991187414729 current=3.23116517387178
color yellow, pair_06
distance pair_07, 4INS and resi 74 and name CA, 4INS and resi 86 and name CA  # target=21.872988434641524 current=9.985761042069988
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
