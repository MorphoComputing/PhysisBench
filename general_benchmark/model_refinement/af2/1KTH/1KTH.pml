# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 8.808320401597927

load 1KTH.pdb, 1KTH
bg_color white
hide everything, 1KTH
show cartoon, 1KTH
color grey80, 1KTH
set cartoon_transparency, 0.1

select worst_residues, 1KTH and resi 1+2+12+14+15+18+35+36+37+38
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1KTH and resi 8+18+30+59
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1KTH and resi 5 and name CA, 1KTH and resi 25 and name CA  # target=27.244604133013382 current=16.707291188729965
color yellow, pair_00
distance pair_01, 1KTH and resi 14 and name CA, 1KTH and resi 25 and name CA  # target=24.922382999809642 current=14.474690458595015
color yellow, pair_01
distance pair_02, 1KTH and resi 11 and name CA, 1KTH and resi 25 and name CA  # target=26.799839344928166 current=17.076719768338595
color yellow, pair_02
distance pair_03, 1KTH and resi 5 and name CA, 1KTH and resi 18 and name CA  # target=20.890347308126138 current=11.30554157489336
color yellow, pair_03
distance pair_04, 1KTH and resi 1 and name CA, 1KTH and resi 25 and name CA  # target=24.329906592580812 current=15.020666725916703
color yellow, pair_04
distance pair_05, 1KTH and resi 14 and name CA, 1KTH and resi 28 and name CA  # target=25.875146307183627 current=17.48515221179104
color yellow, pair_05
distance pair_06, 1KTH and resi 1 and name CA, 1KTH and resi 26 and name CA  # target=23.02322045158661 current=14.906609361179513
color yellow, pair_06
distance pair_07, 1KTH and resi 5 and name CA, 1KTH and resi 28 and name CA  # target=27.044738839319756 current=19.021175523301732
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
