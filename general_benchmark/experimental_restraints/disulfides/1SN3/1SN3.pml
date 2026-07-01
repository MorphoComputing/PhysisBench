# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 8.519072299962941

load 1SN3.pdb, 1SN3
bg_color white
hide everything, 1SN3
show cartoon, 1SN3
color grey80, 1SN3
set cartoon_transparency, 0.1

select worst_residues, 1SN3 and resi 2+31+40+42+49+50+51+61+62+63
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1SN3 and resi 15 and name CA, 1SN3 and resi 40 and name CA  # target=5.526827568351721 current=9.014670057243583
color yellow, pair_00
distance pair_01, 1SN3 and resi 24 and name CA, 1SN3 and resi 45 and name CA  # target=5.526827568351721 current=7.412106645304216
color yellow, pair_01
distance pair_02, 1SN3 and resi 28 and name CA, 1SN3 and resi 47 and name CA  # target=5.526827568351721 current=7.191995213628494
color yellow, pair_02

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
