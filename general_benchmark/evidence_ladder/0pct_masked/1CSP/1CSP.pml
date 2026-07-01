# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.040596135634205235

load 1CSP.pdb, 1CSP
bg_color white
hide everything, 1CSP
show cartoon, 1CSP
color grey80, 1CSP
set cartoon_transparency, 0.1

select worst_residues, 1CSP and resi 3+20+21+34+35+36+37+53+54+57
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1CSP and resi 21 and name CA, 1CSP and resi 36 and name CA  # target=27.49987870562872 current=31.310885525336968
color yellow, pair_00
distance pair_01, 1CSP and resi 21 and name CA, 1CSP and resi 35 and name CA  # target=27.499308479493646 current=30.32594961959608
color yellow, pair_01
distance pair_02, 1CSP and resi 21 and name CA, 1CSP and resi 37 and name CA  # target=27.499047408239363 current=30.18072980158954
color yellow, pair_02
distance pair_03, 1CSP and resi 36 and name CA, 1CSP and resi 54 and name CA  # target=27.497669516697503 current=29.73486620627865
color yellow, pair_03
distance pair_04, 1CSP and resi 22 and name CA, 1CSP and resi 36 and name CA  # target=27.49635307854473 current=29.422172330362024
color yellow, pair_04
distance pair_05, 1CSP and resi 43 and name CA, 1CSP and resi 54 and name CA  # target=27.49324930280517 current=29.085608965636588
color yellow, pair_05
distance pair_06, 1CSP and resi 11 and name CA, 1CSP and resi 21 and name CA  # target=27.48942175141445 current=28.827754673231254
color yellow, pair_06
distance pair_07, 1CSP and resi 20 and name CA, 1CSP and resi 36 and name CA  # target=27.48862083568139 current=28.736873357048363
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
