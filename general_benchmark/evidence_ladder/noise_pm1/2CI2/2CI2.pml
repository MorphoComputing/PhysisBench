# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.3687220355646017

load 2CI2.pdb, 2CI2
bg_color white
hide everything, 2CI2
show cartoon, 2CI2
color grey80, 2CI2
set cartoon_transparency, 0.1

select worst_residues, 2CI2 and resi 7+10+17+27+37+38+45+47+51+54
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 2CI2 and resi 5+6+16
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 2CI2 and resi 2 and name CA, 2CI2 and resi 47 and name CA  # target=14.777388742518893 current=10.91944095758201
color yellow, pair_00
distance pair_01, 2CI2 and resi 1 and name CA, 2CI2 and resi 53 and name CA  # target=27.35425620805931 current=30.585571069200334
color yellow, pair_01
distance pair_02, 2CI2 and resi 49 and name CA, 2CI2 and resi 61 and name CA  # target=8.319849365569548 current=5.264192549626034
color yellow, pair_02
distance pair_03, 2CI2 and resi 24 and name CA, 2CI2 and resi 35 and name CA  # target=22.09776299728883 current=25.092189146349497
color yellow, pair_03
distance pair_04, 2CI2 and resi 15 and name CA, 2CI2 and resi 62 and name CA  # target=18.63964145495454 current=15.759174797767459
color yellow, pair_04
distance pair_05, 2CI2 and resi 1 and name CA, 2CI2 and resi 54 and name CA  # target=27.119048397344557 current=29.985554044171415
color yellow, pair_05
distance pair_06, 2CI2 and resi 7 and name CA, 2CI2 and resi 17 and name CA  # target=15.574536800174318 current=12.796629906096237
color yellow, pair_06
distance pair_07, 2CI2 and resi 14 and name CA, 2CI2 and resi 24 and name CA  # target=12.416613609247074 current=15.177670041167241
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
