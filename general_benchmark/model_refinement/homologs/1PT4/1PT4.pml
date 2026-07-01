# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.8807111193476521

load 1PT4.pdb, 1PT4
bg_color white
hide everything, 1PT4
show cartoon, 1PT4
color grey80, 1PT4
set cartoon_transparency, 0.1

select worst_residues, 1PT4 and resi 1+6+8+10+12+13+14+19+24+25
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1PT4 and resi 5 and name CA, 1PT4 and resi 19 and name CA  # target=6.253674568241512 current=4.867886987891666
color yellow, pair_00
distance pair_01, 1PT4 and resi 3 and name CA, 1PT4 and resi 20 and name CA  # target=5.733639154262886 current=4.408417089856254
color yellow, pair_01
distance pair_02, 1PT4 and resi 4 and name CA, 1PT4 and resi 20 and name CA  # target=6.144620338220682 current=5.093242003009132
color yellow, pair_02
distance pair_03, 1PT4 and resi 17 and name CA, 1PT4 and resi 25 and name CA  # target=10.304691914642879 current=9.270916385897769
color yellow, pair_03
distance pair_04, 1PT4 and resi 1 and name CA, 1PT4 and resi 23 and name CA  # target=12.131980335063844 current=11.385650803046198
color yellow, pair_04
distance pair_05, 1PT4 and resi 12 and name CA, 1PT4 and resi 27 and name CA  # target=13.184216619288849 current=13.907326289511147
color yellow, pair_05
distance pair_06, 1PT4 and resi 12 and name CA, 1PT4 and resi 26 and name CA  # target=14.082734884857222 current=14.785833912855576
color yellow, pair_06
distance pair_07, 1PT4 and resi 11 and name CA, 1PT4 and resi 27 and name CA  # target=11.071390747074412 current=11.766782135085103
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
