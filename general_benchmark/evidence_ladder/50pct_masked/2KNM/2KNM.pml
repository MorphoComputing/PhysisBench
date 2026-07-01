# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS | CA RMSD: 0.031100486643453096

load 2KNM.pdb, 2KNM
bg_color white
hide everything, 2KNM
show cartoon, 2KNM
color grey80, 2KNM
set cartoon_transparency, 0.1

select worst_residues, 2KNM and resi 2+9+10+14+15+16+17+19+23+28
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 2KNM and resi 6 and name CA, 2KNM and resi 25 and name CA  # target=4.496937596271118 current=4.380697758322574
color yellow, pair_00
distance pair_01, 2KNM and resi 19 and name CA, 2KNM and resi 28 and name CA  # target=4.513047188598279 current=4.420981947890418
color yellow, pair_01
distance pair_02, 2KNM and resi 8 and name CA, 2KNM and resi 17 and name CA  # target=19.394316147278023 current=19.456901522783472
color yellow, pair_02
distance pair_03, 2KNM and resi 1 and name CA, 2KNM and resi 9 and name CA  # target=19.289528323751856 current=19.33685276756242
color yellow, pair_03
distance pair_04, 2KNM and resi 12 and name CA, 2KNM and resi 28 and name CA  # target=10.418751889795319 current=10.457053809159566
color yellow, pair_04
distance pair_05, 2KNM and resi 5 and name CA, 2KNM and resi 14 and name CA  # target=7.749901217941739 current=7.715133745310304
color yellow, pair_05
distance pair_06, 2KNM and resi 1 and name CA, 2KNM and resi 28 and name CA  # target=5.174770905714849 current=5.141551618391235
color yellow, pair_06
distance pair_07, 2KNM and resi 10 and name CA, 2KNM and resi 25 and name CA  # target=9.30239712138693 current=9.335206223234849
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
