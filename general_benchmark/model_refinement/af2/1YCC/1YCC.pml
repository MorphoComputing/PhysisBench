# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.5778405522349528

load 1YCC.pdb, 1YCC
bg_color white
hide everything, 1YCC
show cartoon, 1YCC
color grey80, 1YCC
set cartoon_transparency, 0.1

select worst_residues, 1YCC and resi 1+2+3+4+5+27+48+49+54+61
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1YCC and resi 8 and name CA, 1YCC and resi 54 and name CA  # target=27.48210176129199 current=32.832750345707964
color yellow, pair_00
distance pair_01, 1YCC and resi 6 and name CA, 1YCC and resi 54 and name CA  # target=27.478452165350948 current=32.76185634061089
color yellow, pair_01
distance pair_02, 1YCC and resi 8 and name CA, 1YCC and resi 58 and name CA  # target=27.471084228947483 current=32.51986173301908
color yellow, pair_02
distance pair_03, 1YCC and resi 49 and name CA, 1YCC and resi 88 and name CA  # target=27.45614154459166 current=32.20448465437603
color yellow, pair_03
distance pair_04, 1YCC and resi 49 and name CA, 1YCC and resi 90 and name CA  # target=27.45750147692707 current=32.199915199258264
color yellow, pair_04
distance pair_05, 1YCC and resi 49 and name CA, 1YCC and resi 89 and name CA  # target=27.438762841002408 current=31.732968812478035
color yellow, pair_05
distance pair_06, 1YCC and resi 9 and name CA, 1YCC and resi 54 and name CA  # target=27.460813660136584 current=31.703401643652178
color yellow, pair_06
distance pair_07, 1YCC and resi 6 and name CA, 1YCC and resi 58 and name CA  # target=27.442517872466745 current=31.58576395343972
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
