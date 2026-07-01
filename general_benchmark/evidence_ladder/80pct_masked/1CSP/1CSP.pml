# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.3435990626701107

load 1CSP.pdb, 1CSP
bg_color white
hide everything, 1CSP
show cartoon, 1CSP
color grey80, 1CSP
set cartoon_transparency, 0.1

select worst_residues, 1CSP and resi 1+13+14+20+21+34+36+37+57+63
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1CSP and resi 11 and name CA, 1CSP and resi 21 and name CA  # target=27.48942175141445 current=28.670560319588944
color yellow, pair_00
distance pair_01, 1CSP and resi 42 and name CA, 1CSP and resi 55 and name CA  # target=24.13178353116801 current=24.66579517693458
color yellow, pair_01
distance pair_02, 1CSP and resi 20 and name CA, 1CSP and resi 61 and name CA  # target=18.157558962267064 current=17.633409307600964
color yellow, pair_02
distance pair_03, 1CSP and resi 21 and name CA, 1CSP and resi 58 and name CA  # target=15.529131101656555 current=15.023282129548077
color yellow, pair_03
distance pair_04, 1CSP and resi 55 and name CA, 1CSP and resi 65 and name CA  # target=26.987938323644666 current=26.527710693149942
color yellow, pair_04
distance pair_05, 1CSP and resi 14 and name CA, 1CSP and resi 48 and name CA  # target=14.649338468136227 current=15.09622036257024
color yellow, pair_05
distance pair_06, 1CSP and resi 36 and name CA, 1CSP and resi 52 and name CA  # target=26.595921993067524 current=26.16684364787631
color yellow, pair_06
distance pair_07, 1CSP and resi 20 and name CA, 1CSP and resi 36 and name CA  # target=27.48862083568139 current=27.915522638267092
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
