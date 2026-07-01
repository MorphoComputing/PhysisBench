# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 4.111535332969444

load 1R1F.pdb, 1R1F
bg_color white
hide everything, 1R1F
show cartoon, 1R1F
color grey80, 1R1F
set cartoon_transparency, 0.1

select worst_residues, 1R1F and resi 1+4+5+8+9+11+14+25+26+28
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1R1F and resi 29+73
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1R1F and resi 6 and name CA, 1R1F and resi 24 and name CA  # target=16.296404873568193 current=10.317484295664416
color yellow, pair_00
distance pair_01, 1R1F and resi 6 and name CA, 1R1F and resi 22 and name CA  # target=13.183480695313806 current=7.32276471255904
color yellow, pair_01
distance pair_02, 1R1F and resi 7 and name CA, 1R1F and resi 24 and name CA  # target=17.096643400391763 current=11.29245433109197
color yellow, pair_02
distance pair_03, 1R1F and resi 7 and name CA, 1R1F and resi 27 and name CA  # target=12.098769288812084 current=6.340956813642032
color yellow, pair_03
distance pair_04, 1R1F and resi 7 and name CA, 1R1F and resi 26 and name CA  # target=14.684068556315777 current=9.043382941692231
color yellow, pair_04
distance pair_05, 1R1F and resi 6 and name CA, 1R1F and resi 26 and name CA  # target=14.421018065344892 current=8.859397415124795
color yellow, pair_05
distance pair_06, 1R1F and resi 8 and name CA, 1R1F and resi 24 and name CA  # target=17.007675750351947 current=11.520070934584217
color yellow, pair_06
distance pair_07, 1R1F and resi 5 and name CA, 1R1F and resi 27 and name CA  # target=16.24144445163741 current=10.754966484194753
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
