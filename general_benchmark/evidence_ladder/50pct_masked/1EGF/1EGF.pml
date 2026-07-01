# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.13154547922130352

load 1EGF.pdb, 1EGF
bg_color white
hide everything, 1EGF
show cartoon, 1EGF
color grey80, 1EGF
set cartoon_transparency, 0.1

select worst_residues, 1EGF and resi 5+9+23+24+25+26+35+47+48+51
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1EGF and resi 7 and name CA, 1EGF and resi 51 and name CA  # target=27.499334048871805 current=30.179469850767603
color yellow, pair_00
distance pair_01, 1EGF and resi 7 and name CA, 1EGF and resi 48 and name CA  # target=27.497611262110393 current=29.53415913275036
color yellow, pair_01
distance pair_02, 1EGF and resi 8 and name CA, 1EGF and resi 47 and name CA  # target=27.49691522752473 current=29.339782042161055
color yellow, pair_02
distance pair_03, 1EGF and resi 10 and name CA, 1EGF and resi 51 and name CA  # target=27.490101855004202 current=28.765351631069098
color yellow, pair_03
distance pair_04, 1EGF and resi 8 and name CA, 1EGF and resi 46 and name CA  # target=27.488281216954157 current=28.73804463630006
color yellow, pair_04
distance pair_05, 1EGF and resi 9 and name CA, 1EGF and resi 51 and name CA  # target=27.489564208558058 current=28.72009667034004
color yellow, pair_05
distance pair_06, 1EGF and resi 8 and name CA, 1EGF and resi 50 and name CA  # target=27.483622463468148 current=28.50567433454184
color yellow, pair_06
distance pair_07, 1EGF and resi 6 and name CA, 1EGF and resi 48 and name CA  # target=27.476114024803934 current=28.222410163599438
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
