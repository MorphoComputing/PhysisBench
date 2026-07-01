# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 4.518380402676357

load 1VII.pdb, 1VII
bg_color white
hide everything, 1VII
show cartoon, 1VII
color grey80, 1VII
set cartoon_transparency, 0.1

select worst_residues, 1VII and resi 1+7+8+9+12+15+19+21+23+30
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1VII and resi 8
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1VII and resi 6 and name CA, 1VII and resi 17 and name CA  # target=4.893392851656878 current=8.042883448379072
color yellow, pair_00
distance pair_01, 1VII and resi 17 and name CA, 1VII and resi 25 and name CA  # target=4.647636918307805 current=6.748524196698677
color yellow, pair_01
distance pair_02, 1VII and resi 10 and name CA, 1VII and resi 28 and name CA  # target=5.533144452470395 current=7.5377583258384675
color yellow, pair_02
distance pair_03, 1VII and resi 10 and name CA, 1VII and resi 29 and name CA  # target=4.893392851656878 current=6.844061633860729
color yellow, pair_03
distance pair_04, 1VII and resi 9 and name CA, 1VII and resi 32 and name CA  # target=5.212492862963047 current=7.153903188494441
color yellow, pair_04
distance pair_05, 1VII and resi 3 and name CA, 1VII and resi 14 and name CA  # target=5.212492862963047 current=7.002461858510649
color yellow, pair_05
distance pair_06, 1VII and resi 1 and name CA, 1VII and resi 10 and name CA  # target=5.212492862963047 current=6.994582796468415
color yellow, pair_06
distance pair_07, 1VII and resi 20 and name CA, 1VII and resi 28 and name CA  # target=5.212492862963047 current=6.87437842768392
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
