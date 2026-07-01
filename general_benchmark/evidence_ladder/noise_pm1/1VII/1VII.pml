# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.7514602208656367

load 1VII.pdb, 1VII
bg_color white
hide everything, 1VII
show cartoon, 1VII
color grey80, 1VII
set cartoon_transparency, 0.1

select worst_residues, 1VII and resi 2+3+5+10+14+15+20+21+27+34
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1VII and resi 4
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1VII and resi 2 and name CA, 1VII and resi 13 and name CA  # target=12.142261364722144 current=8.814329694989118
color yellow, pair_00
distance pair_01, 1VII and resi 16 and name CA, 1VII and resi 33 and name CA  # target=10.57043727446458 current=13.480304403537993
color yellow, pair_01
distance pair_02, 1VII and resi 7 and name CA, 1VII and resi 28 and name CA  # target=16.33969919151816 current=13.702315162068299
color yellow, pair_02
distance pair_03, 1VII and resi 9 and name CA, 1VII and resi 34 and name CA  # target=11.153612657781322 current=8.538166231353427
color yellow, pair_03
distance pair_04, 1VII and resi 7 and name CA, 1VII and resi 15 and name CA  # target=14.223023203248648 current=11.649297388309563
color yellow, pair_04
distance pair_05, 1VII and resi 11 and name CA, 1VII and resi 33 and name CA  # target=12.440566097001343 current=10.074229475801657
color yellow, pair_05
distance pair_06, 1VII and resi 10 and name CA, 1VII and resi 20 and name CA  # target=10.09217390802628 current=12.417511317110668
color yellow, pair_06
distance pair_07, 1VII and resi 12 and name CA, 1VII and resi 31 and name CA  # target=12.63471408772573 current=14.956326674145517
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
