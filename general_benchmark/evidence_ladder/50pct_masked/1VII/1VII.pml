# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.9450188101574774

load 1VII.pdb, 1VII
bg_color white
hide everything, 1VII
show cartoon, 1VII
color grey80, 1VII
set cartoon_transparency, 0.1

select worst_residues, 1VII and resi 4+12+14+15+16+17+18+19+20+34
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1VII and resi 1 and name CA, 1VII and resi 14 and name CA  # target=7.966753219590108 current=8.956517773043583
color yellow, pair_00
distance pair_01, 1VII and resi 15 and name CA, 1VII and resi 28 and name CA  # target=13.488530554651918 current=12.512212081928459
color yellow, pair_01
distance pair_02, 1VII and resi 15 and name CA, 1VII and resi 26 and name CA  # target=13.974925362177121 current=14.775441290885755
color yellow, pair_02
distance pair_03, 1VII and resi 8 and name CA, 1VII and resi 34 and name CA  # target=12.024993740617447 current=12.757245542502258
color yellow, pair_03
distance pair_04, 1VII and resi 15 and name CA, 1VII and resi 32 and name CA  # target=14.97155912959328 current=14.413736434905742
color yellow, pair_04
distance pair_05, 1VII and resi 10 and name CA, 1VII and resi 32 and name CA  # target=6.474479571717814 current=6.970470489853872
color yellow, pair_05
distance pair_06, 1VII and resi 11 and name CA, 1VII and resi 33 and name CA  # target=9.99028991113067 current=10.485635187005363
color yellow, pair_06
distance pair_07, 1VII and resi 11 and name CA, 1VII and resi 32 and name CA  # target=10.125815629556312 current=10.568340351526397
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
