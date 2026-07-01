# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 3.7413217354669714

load 2KNM.pdb, 2KNM
bg_color white
hide everything, 2KNM
show cartoon, 2KNM
color grey80, 2KNM
set cartoon_transparency, 0.1

select worst_residues, 2KNM and resi 1+11+13+14+15+16+18+22+23+24
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 2KNM and resi 3
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 2KNM and resi 2 and name CA, 2KNM and resi 16 and name CA  # target=14.136318182987889 current=10.530342283230514
color yellow, pair_00
distance pair_01, 2KNM and resi 10 and name CA, 2KNM and resi 28 and name CA  # target=15.727767139020097 current=12.458498800802749
color yellow, pair_01
distance pair_02, 2KNM and resi 5 and name CA, 2KNM and resi 18 and name CA  # target=12.877736517055066 current=10.115234402168474
color yellow, pair_02
distance pair_03, 2KNM and resi 7 and name CA, 2KNM and resi 16 and name CA  # target=14.967632152225319 current=12.351407793068628
color yellow, pair_03
distance pair_04, 2KNM and resi 8 and name CA, 2KNM and resi 17 and name CA  # target=19.394316147278023 current=17.23429953910681
color yellow, pair_04
distance pair_05, 2KNM and resi 6 and name CA, 2KNM and resi 17 and name CA  # target=15.474320446212605 current=13.436351895591454
color yellow, pair_05
distance pair_06, 2KNM and resi 11 and name CA, 2KNM and resi 25 and name CA  # target=9.553148722655605 current=7.607827263219121
color yellow, pair_06
distance pair_07, 2KNM and resi 1 and name CA, 2KNM and resi 15 and name CA  # target=12.656758499765317 current=11.204412795720984
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
