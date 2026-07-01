# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.8684118342109182

load 1JBL.pdb, 1JBL
bg_color white
hide everything, 1JBL
show cartoon, 1JBL
color grey80, 1JBL
set cartoon_transparency, 0.1

select worst_residues, 1JBL and resi 1+4+5+6+7+8+9+10+11+12
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1JBL and resi 2 and name CA, 1JBL and resi 10 and name CA  # target=4.9249679923487575 current=3.8011401875670447
color yellow, pair_00
distance pair_01, 1JBL and resi 2 and name CA, 1JBL and resi 11 and name CA  # target=6.345550922883425 current=5.8894089245275625
color yellow, pair_01
distance pair_02, 1JBL and resi 3 and name CA, 1JBL and resi 11 and name CA  # target=8.522507500151638 current=8.187488420261083
color yellow, pair_02
distance pair_03, 1JBL and resi 1 and name CA, 1JBL and resi 11 and name CA  # target=5.695322066154259 current=5.372729146183962
color yellow, pair_03
distance pair_04, 1JBL and resi 3 and name CA, 1JBL and resi 12 and name CA  # target=12.072870127353953 current=11.85489025914062
color yellow, pair_04
distance pair_05, 1JBL and resi 1 and name CA, 1JBL and resi 10 and name CA  # target=5.88929460650993 current=5.702936525010783
color yellow, pair_05
distance pair_06, 1JBL and resi 4 and name CA, 1JBL and resi 12 and name CA  # target=15.252673201348909 current=15.301228191665492
color yellow, pair_06
distance pair_07, 1JBL and resi 1 and name CA, 1JBL and resi 12 and name CA  # target=7.276182280210837 current=7.290567523940532
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
