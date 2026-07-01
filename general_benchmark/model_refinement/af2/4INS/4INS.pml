# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 10.330013228843551

load 4INS.pdb, 4INS
bg_color white
hide everything, 4INS
show cartoon, 4INS
color grey80, 4INS
set cartoon_transparency, 0.1

select worst_residues, 4INS and resi 1+2+3+18+45+46+47+64+75+94
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 4INS and resi 13+22+62
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 4INS and resi 47 and name CA, 4INS and resi 61 and name CA  # target=26.43715102223251 current=10.924325770707734
color yellow, pair_00
distance pair_01, 4INS and resi 80 and name CA, 4INS and resi 94 and name CA  # target=22.532281770325415 current=7.472007957164611
color yellow, pair_01
distance pair_02, 4INS and resi 47 and name CA, 4INS and resi 67 and name CA  # target=27.475804243909703 current=12.692736483979175
color yellow, pair_02
distance pair_03, 4INS and resi 2 and name CA, 4INS and resi 47 and name CA  # target=27.48873958965598 current=40.93538119741021
color yellow, pair_03
distance pair_04, 4INS and resi 41 and name CA, 4INS and resi 94 and name CA  # target=27.49998825583126 current=14.171633877301652
color yellow, pair_04
distance pair_05, 4INS and resi 61 and name CA, 4INS and resi 71 and name CA  # target=26.96571828537262 current=13.906697610895561
color yellow, pair_05
distance pair_06, 4INS and resi 35 and name CA, 4INS and resi 94 and name CA  # target=27.499954306510755 current=14.563969214880887
color yellow, pair_06
distance pair_07, 4INS and resi 46 and name CA, 4INS and resi 61 and name CA  # target=27.090100353125308 current=14.403343372177138
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
