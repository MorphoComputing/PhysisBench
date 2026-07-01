# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 2.9334307667810533

load 2CI2.pdb, 2CI2
bg_color white
hide everything, 2CI2
show cartoon, 2CI2
color grey80, 2CI2
set cartoon_transparency, 0.1

select worst_residues, 2CI2 and resi 1+33+34+35+36+37+39+40+50+59
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 2CI2 and resi 12 and name CA, 2CI2 and resi 55 and name CA  # target=6.39696569076916 current=4.7148892803622555
color yellow, pair_00
distance pair_01, 2CI2 and resi 41 and name CA, 2CI2 and resi 54 and name CA  # target=27.24390791910316 current=28.851463538670057
color yellow, pair_01
distance pair_02, 2CI2 and resi 12 and name CA, 2CI2 and resi 56 and name CA  # target=4.893057019332573 current=3.32463150284293
color yellow, pair_02
distance pair_03, 2CI2 and resi 32 and name CA, 2CI2 and resi 43 and name CA  # target=15.351250713007822 current=13.940489389884203
color yellow, pair_03
distance pair_04, 2CI2 and resi 32 and name CA, 2CI2 and resi 41 and name CA  # target=17.890197660464548 current=16.48116148759477
color yellow, pair_04
distance pair_05, 2CI2 and resi 31 and name CA, 2CI2 and resi 43 and name CA  # target=14.001080129156893 current=12.693448097508696
color yellow, pair_05
distance pair_06, 2CI2 and resi 31 and name CA, 2CI2 and resi 41 and name CA  # target=17.85223419136763 current=16.592186708244476
color yellow, pair_06
distance pair_07, 2CI2 and resi 32 and name CA, 2CI2 and resi 55 and name CA  # target=10.113650196572005 current=11.356918581428232
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
