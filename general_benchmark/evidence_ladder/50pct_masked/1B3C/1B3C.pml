# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.07081996925060649

load 1B3C.pdb, 1B3C
bg_color white
hide everything, 1B3C
show cartoon, 1B3C
color grey80, 1B3C
set cartoon_transparency, 0.1

select worst_residues, 1B3C and resi 6+7+8+15+57+58+59+60+61+62
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1B3C and resi 21 and name CA, 1B3C and resi 60 and name CA  # target=27.489961233427522 current=28.791097414996663
color yellow, pair_00
distance pair_01, 1B3C and resi 32 and name CA, 1B3C and resi 62 and name CA  # target=24.103642978597687 current=24.622885075727254
color yellow, pair_01
distance pair_02, 1B3C and resi 28 and name CA, 1B3C and resi 61 and name CA  # target=23.372665230954638 current=23.88571536897332
color yellow, pair_02
distance pair_03, 1B3C and resi 15 and name CA, 1B3C and resi 32 and name CA  # target=23.54982866582927 current=24.058285037210904
color yellow, pair_03
distance pair_04, 1B3C and resi 25 and name CA, 1B3C and resi 59 and name CA  # target=23.007014525814043 current=23.513229638542256
color yellow, pair_04
distance pair_05, 1B3C and resi 8 and name CA, 1B3C and resi 36 and name CA  # target=23.40882228443059 current=23.90372476306949
color yellow, pair_05
distance pair_06, 1B3C and resi 23 and name CA, 1B3C and resi 60 and name CA  # target=23.314038776989385 current=23.800859769192375
color yellow, pair_06
distance pair_07, 1B3C and resi 7 and name CA, 1B3C and resi 18 and name CA  # target=23.765924649613922 current=24.240645157315836
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
