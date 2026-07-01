# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS | CA RMSD: 0.08884271782623214

load 1PT4.pdb, 1PT4
bg_color white
hide everything, 1PT4
show cartoon, 1PT4
color grey80, 1PT4
set cartoon_transparency, 0.1

select worst_residues, 1PT4 and resi 1+13+14+17+18+19+21+23+24+27
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1PT4 and resi 3 and name CA, 1PT4 and resi 20 and name CA  # target=4.293918260323778 current=4.0874965949500215
color yellow, pair_00
distance pair_01, 1PT4 and resi 7 and name CA, 1PT4 and resi 19 and name CA  # target=7.125164272487224 current=7.296408206960884
color yellow, pair_01
distance pair_02, 1PT4 and resi 1 and name CA, 1PT4 and resi 23 and name CA  # target=9.406231032574778 current=9.23727691155805
color yellow, pair_02
distance pair_03, 1PT4 and resi 14 and name CA, 1PT4 and resi 27 and name CA  # target=8.576342492373122 current=8.745211103859152
color yellow, pair_03
distance pair_04, 1PT4 and resi 2 and name CA, 1PT4 and resi 21 and name CA  # target=5.784057036292405 current=5.622273060373564
color yellow, pair_04
distance pair_05, 1PT4 and resi 1 and name CA, 1PT4 and resi 24 and name CA  # target=12.901083120624 current=12.739983394454454
color yellow, pair_05
distance pair_06, 1PT4 and resi 17 and name CA, 1PT4 and resi 27 and name CA  # target=8.389487419416898 current=8.546129240776578
color yellow, pair_06
distance pair_07, 1PT4 and resi 3 and name CA, 1PT4 and resi 21 and name CA  # target=5.530001778943845 current=5.386484015036147
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
