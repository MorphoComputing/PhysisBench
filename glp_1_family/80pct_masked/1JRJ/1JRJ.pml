# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 2.3950939108327947

load 1JRJ.pdb, 1JRJ
bg_color white
hide everything, 1JRJ
show cartoon, 1JRJ
color grey80, 1JRJ
set cartoon_transparency, 0.1

select worst_residues, 1JRJ and resi 4+8+9+13+14+28+30+31+33+34
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1JRJ and resi 13 and name CA, 1JRJ and resi 34 and name CA  # target=21.850738336677317 current=23.22367050915434
color yellow, pair_00
distance pair_01, 1JRJ and resi 20 and name CA, 1JRJ and resi 30 and name CA  # target=13.645215384358234 current=12.44229838172813
color yellow, pair_01
distance pair_02, 1JRJ and resi 15 and name CA, 1JRJ and resi 31 and name CA  # target=23.22126884965889 current=24.255983211415007
color yellow, pair_02
distance pair_03, 1JRJ and resi 7 and name CA, 1JRJ and resi 25 and name CA  # target=27.74605529918876 current=28.707518816866042
color yellow, pair_03
distance pair_04, 1JRJ and resi 2 and name CA, 1JRJ and resi 35 and name CA  # target=41.83427529812971 current=40.874089988653765
color yellow, pair_04
distance pair_05, 1JRJ and resi 14 and name CA, 1JRJ and resi 30 and name CA  # target=20.858801828210524 current=21.719475834951453
color yellow, pair_05
distance pair_06, 1JRJ and resi 10 and name CA, 1JRJ and resi 35 and name CA  # target=23.968025601158548 current=24.802610939695654
color yellow, pair_06
distance pair_07, 1JRJ and resi 13 and name CA, 1JRJ and resi 25 and name CA  # target=19.085638417084034 current=18.27153627745977
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
