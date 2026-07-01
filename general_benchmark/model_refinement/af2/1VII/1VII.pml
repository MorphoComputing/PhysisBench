# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 1.4163027619148787

load 1VII.pdb, 1VII
bg_color white
hide everything, 1VII
show cartoon, 1VII
color grey80, 1VII
set cartoon_transparency, 0.1

select worst_residues, 1VII and resi 4+7+8+14+15+16+20+30+32+33
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1VII and resi 1 and name CA, 1VII and resi 33 and name CA  # target=12.803898162839694 current=9.7618710087414
color yellow, pair_00
distance pair_01, 1VII and resi 6 and name CA, 1VII and resi 33 and name CA  # target=12.655007330203375 current=10.12250756856687
color yellow, pair_01
distance pair_02, 1VII and resi 2 and name CA, 1VII and resi 33 and name CA  # target=16.031613132636682 current=13.73084682656971
color yellow, pair_02
distance pair_03, 1VII and resi 5 and name CA, 1VII and resi 33 and name CA  # target=13.481591447443053 current=11.33241506105145
color yellow, pair_03
distance pair_04, 1VII and resi 3 and name CA, 1VII and resi 33 and name CA  # target=17.25137778536157 current=15.22089745660711
color yellow, pair_04
distance pair_05, 1VII and resi 4 and name CA, 1VII and resi 33 and name CA  # target=17.085016960340315 current=15.058371465067385
color yellow, pair_05
distance pair_06, 1VII and resi 9 and name CA, 1VII and resi 33 and name CA  # target=9.941520241002857 current=7.966537130789035
color yellow, pair_06
distance pair_07, 1VII and resi 7 and name CA, 1VII and resi 33 and name CA  # target=14.9198101928514 current=13.255147168455203
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
