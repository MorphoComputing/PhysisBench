# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.048975519986031474

load 1R1F.pdb, 1R1F
bg_color white
hide everything, 1R1F
show cartoon, 1R1F
color grey80, 1R1F
set cartoon_transparency, 0.1

select worst_residues, 1R1F and resi 1+2+6+16+17+25+26+27+34+35
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1R1F and resi 8 and name CA, 1R1F and resi 35 and name CA  # target=23.87032632399157 current=24.43288383543199
color yellow, pair_00
distance pair_01, 1R1F and resi 26 and name CA, 1R1F and resi 34 and name CA  # target=23.912974009156862 current=24.41138218475798
color yellow, pair_01
distance pair_02, 1R1F and resi 9 and name CA, 1R1F and resi 34 and name CA  # target=23.36506564628366 current=23.86145697557667
color yellow, pair_02
distance pair_03, 1R1F and resi 2 and name CA, 1R1F and resi 32 and name CA  # target=3.9703103519250016 current=3.6358562792882894
color yellow, pair_03
distance pair_04, 1R1F and resi 9 and name CA, 1R1F and resi 35 and name CA  # target=22.950990372348706 current=23.278683458314262
color yellow, pair_04
distance pair_05, 1R1F and resi 22 and name CA, 1R1F and resi 30 and name CA  # target=4.128796027834688 current=3.8875484363229935
color yellow, pair_05
distance pair_06, 1R1F and resi 7 and name CA, 1R1F and resi 34 and name CA  # target=22.623479664893903 current=22.83789215923717
color yellow, pair_06
distance pair_07, 1R1F and resi 1 and name CA, 1R1F and resi 31 and name CA  # target=4.212671838575837 current=4.015334083444964
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
