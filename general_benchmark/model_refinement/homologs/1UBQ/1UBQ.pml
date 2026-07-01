# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 1.6784598967314768

load 1UBQ.pdb, 1UBQ
bg_color white
hide everything, 1UBQ
show cartoon, 1UBQ
color grey80, 1UBQ
set cartoon_transparency, 0.1

select worst_residues, 1UBQ and resi 30+31+34+45+46+52+59+72+73+74
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1UBQ and resi 62 and name CA, 1UBQ and resi 74 and name CA  # target=27.467471704953393 current=32.46877089915264
color yellow, pair_00
distance pair_01, 1UBQ and resi 1 and name CA, 1UBQ and resi 74 and name CA  # target=27.44279471721765 current=31.834093046223273
color yellow, pair_01
distance pair_02, 1UBQ and resi 62 and name CA, 1UBQ and resi 73 and name CA  # target=27.448154643715668 current=31.79518772638399
color yellow, pair_02
distance pair_03, 1UBQ and resi 17 and name CA, 1UBQ and resi 74 and name CA  # target=27.42846813666191 current=31.349869016514976
color yellow, pair_03
distance pair_04, 1UBQ and resi 15 and name CA, 1UBQ and resi 74 and name CA  # target=27.4162400165072 current=31.25010637790011
color yellow, pair_04
distance pair_05, 1UBQ and resi 63 and name CA, 1UBQ and resi 74 and name CA  # target=27.4107617292904 current=30.9569927049263
color yellow, pair_05
distance pair_06, 1UBQ and resi 17 and name CA, 1UBQ and resi 73 and name CA  # target=27.402832167580893 current=30.91118513384797
color yellow, pair_06
distance pair_07, 1UBQ and resi 1 and name CA, 1UBQ and resi 73 and name CA  # target=27.373243144779497 current=30.63843166228441
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
