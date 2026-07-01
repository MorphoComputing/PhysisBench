# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 10.78539389864167

load 4INS.pdb, 4INS
bg_color white
hide everything, 4INS
show cartoon, 4INS
color grey80, 4INS
set cartoon_transparency, 0.1

select worst_residues, 4INS and resi 45+46+47+50+51+54+55+67+93+94
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 4INS and resi 12+16+31+49
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 4INS and resi 84 and name CA, 4INS and resi 93 and name CA  # target=15.748743693552267 current=5.842499169040183
color yellow, pair_00
distance pair_01, 4INS and resi 84 and name CA, 4INS and resi 92 and name CA  # target=12.063345785736505 current=4.039280740769597
color yellow, pair_01
distance pair_02, 4INS and resi 13 and name CA, 4INS and resi 84 and name CA  # target=12.895855900385536 current=20.112054347850663
color yellow, pair_02
distance pair_03, 4INS and resi 19 and name CA, 4INS and resi 84 and name CA  # target=6.55624839251166 current=13.492906300710587
color yellow, pair_03
distance pair_04, 4INS and resi 10 and name CA, 4INS and resi 78 and name CA  # target=17.49043509353346 current=24.169066777098816
color yellow, pair_04
distance pair_05, 4INS and resi 16 and name CA, 4INS and resi 84 and name CA  # target=8.75132417893726 current=15.410245856408409
color yellow, pair_05
distance pair_06, 4INS and resi 12 and name CA, 4INS and resi 84 and name CA  # target=11.865732277842403 current=17.985691002379625
color yellow, pair_06
distance pair_07, 4INS and resi 12 and name CA, 4INS and resi 21 and name CA  # target=9.557464737679291 current=3.6943811546915195
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
