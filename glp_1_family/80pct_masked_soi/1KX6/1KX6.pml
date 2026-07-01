# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 2.3177089147568055

load 1KX6.pdb, 1KX6
bg_color white
hide everything, 1KX6
show cartoon, 1KX6
color grey80, 1KX6
set cartoon_transparency, 0.1

select worst_residues, 1KX6 and resi 4+7+8+13+15+21+22+24+25+27
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1KX6 and resi 10 and name CA, 1KX6 and resi 23 and name CA  # target=28.74596469048283 current=30.16145157658361
color yellow, pair_00
distance pair_01, 1KX6 and resi 1 and name CA, 1KX6 and resi 26 and name CA  # target=37.76671190901814 current=38.677518428774185
color yellow, pair_01
distance pair_02, 1KX6 and resi 11 and name CA, 1KX6 and resi 26 and name CA  # target=27.89532099905979 current=28.768666145725273
color yellow, pair_02
distance pair_03, 1KX6 and resi 9 and name CA, 1KX6 and resi 25 and name CA  # target=28.909415561342165 current=29.654963422354353
color yellow, pair_03
distance pair_04, 1KX6 and resi 1 and name CA, 1KX6 and resi 27 and name CA  # target=41.43163838369108 current=40.740779196020824
color yellow, pair_04
distance pair_05, 1KX6 and resi 12 and name CA, 1KX6 and resi 27 and name CA  # target=28.02795172322401 current=28.698022810517877
color yellow, pair_05
distance pair_06, 1KX6 and resi 7 and name CA, 1KX6 and resi 19 and name CA  # target=24.249930865289286 current=24.913197737276263
color yellow, pair_06
distance pair_07, 1KX6 and resi 11 and name CA, 1KX6 and resi 27 and name CA  # target=29.189915059501043 current=29.827589094835886
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
