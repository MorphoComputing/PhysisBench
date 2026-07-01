# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 1.4013521797484036

load 1JBL.pdb, 1JBL
bg_color white
hide everything, 1JBL
show cartoon, 1JBL
color grey80, 1JBL
set cartoon_transparency, 0.1

select worst_residues, 1JBL and resi 1+2+3+6+7+8+9+10+11+12
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1JBL and resi 1 and name CA, 1JBL and resi 11 and name CA  # target=6.192697700060009 current=4.998363424917374
color yellow, pair_00
distance pair_01, 1JBL and resi 2 and name CA, 1JBL and resi 10 and name CA  # target=4.882541208876896 current=3.8012947264474706
color yellow, pair_01
distance pair_02, 1JBL and resi 2 and name CA, 1JBL and resi 12 and name CA  # target=10.18131865061193 current=9.287565029921554
color yellow, pair_02
distance pair_03, 1JBL and resi 4 and name CA, 1JBL and resi 12 and name CA  # target=15.7072018416741 current=14.874427367826895
color yellow, pair_03
distance pair_04, 1JBL and resi 3 and name CA, 1JBL and resi 12 and name CA  # target=10.936178724537669 current=11.490256620073303
color yellow, pair_04
distance pair_05, 1JBL and resi 1 and name CA, 1JBL and resi 10 and name CA  # target=5.420349621777574 current=4.9818101772377
color yellow, pair_05
distance pair_06, 1JBL and resi 1 and name CA, 1JBL and resi 9 and name CA  # target=8.29600607076562 current=7.988193515428371
color yellow, pair_06
distance pair_07, 1JBL and resi 2 and name CA, 1JBL and resi 11 and name CA  # target=5.36981573817546 current=5.599045208611228
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
