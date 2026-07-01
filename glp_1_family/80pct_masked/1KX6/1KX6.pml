# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 2.5814685915493634

load 1KX6.pdb, 1KX6
bg_color white
hide everything, 1KX6
show cartoon, 1KX6
color grey80, 1KX6
set cartoon_transparency, 0.1

select worst_residues, 1KX6 and resi 1+7+8+17+20+21+23+25+26+27
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1KX6 and resi 10 and name CA, 1KX6 and resi 26 and name CA  # target=32.34907764250979 current=31.167273900998648
color yellow, pair_00
distance pair_01, 1KX6 and resi 12 and name CA, 1KX6 and resi 23 and name CA  # target=25.870245841043143 current=25.049593969225953
color yellow, pair_01
distance pair_02, 1KX6 and resi 2 and name CA, 1KX6 and resi 27 and name CA  # target=37.4146452643076 current=36.60613553955162
color yellow, pair_02
distance pair_03, 1KX6 and resi 4 and name CA, 1KX6 and resi 18 and name CA  # target=26.609274513499642 current=25.819794768801145
color yellow, pair_03
distance pair_04, 1KX6 and resi 5 and name CA, 1KX6 and resi 25 and name CA  # target=36.1845836897062 current=35.512866862058495
color yellow, pair_04
distance pair_05, 1KX6 and resi 5 and name CA, 1KX6 and resi 22 and name CA  # target=32.509085071497324 current=31.871486647338738
color yellow, pair_05
distance pair_06, 1KX6 and resi 6 and name CA, 1KX6 and resi 20 and name CA  # target=31.16544257181498 current=30.55843870603867
color yellow, pair_06
distance pair_07, 1KX6 and resi 10 and name CA, 1KX6 and resi 23 and name CA  # target=28.74596469048283 current=29.317825876164694
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
