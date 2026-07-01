# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.3830930452416945

load 1CSP.pdb, 1CSP
bg_color white
hide everything, 1CSP
show cartoon, 1CSP
color grey80, 1CSP
set cartoon_transparency, 0.1

select worst_residues, 1CSP and resi 10+12+13+14+20+27+30+36+37+38
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1CSP and resi 11 and name CA, 1CSP and resi 21 and name CA  # target=27.48942175141445 current=28.656492819912106
color yellow, pair_00
distance pair_01, 1CSP and resi 20 and name CA, 1CSP and resi 36 and name CA  # target=27.48862083568139 current=28.181941601936522
color yellow, pair_01
distance pair_02, 1CSP and resi 8 and name CA, 1CSP and resi 37 and name CA  # target=13.800834563224369 current=14.44073585003292
color yellow, pair_02
distance pair_03, 1CSP and resi 22 and name CA, 1CSP and resi 37 and name CA  # target=27.45931564557927 current=28.080981482308964
color yellow, pair_03
distance pair_04, 1CSP and resi 1 and name CA, 1CSP and resi 65 and name CA  # target=10.828457034293196 current=11.426695217404074
color yellow, pair_04
distance pair_05, 1CSP and resi 18 and name CA, 1CSP and resi 35 and name CA  # target=22.95084084284628 current=23.47927237560632
color yellow, pair_05
distance pair_06, 1CSP and resi 4 and name CA, 1CSP and resi 37 and name CA  # target=18.973254046209412 current=19.490283170939914
color yellow, pair_06
distance pair_07, 1CSP and resi 10 and name CA, 1CSP and resi 46 and name CA  # target=15.984949454375272 current=16.470889464075753
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
