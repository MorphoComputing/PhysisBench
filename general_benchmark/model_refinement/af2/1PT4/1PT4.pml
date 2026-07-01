# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 2.1335478542384325

load 1PT4.pdb, 1PT4
bg_color white
hide everything, 1PT4
show cartoon, 1PT4
color grey80, 1PT4
set cartoon_transparency, 0.1

select worst_residues, 1PT4 and resi 1+3+5+6+7+10+13+25+26+27
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1PT4 and resi 11
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1PT4 and resi 1 and name CA, 1PT4 and resi 27 and name CA  # target=18.624797127185484 current=11.690505353748835
color yellow, pair_00
distance pair_01, 1PT4 and resi 2 and name CA, 1PT4 and resi 27 and name CA  # target=20.197783218956236 current=14.318547892943522
color yellow, pair_01
distance pair_02, 1PT4 and resi 10 and name CA, 1PT4 and resi 27 and name CA  # target=20.50597047012008 current=17.2595904920021
color yellow, pair_02
distance pair_03, 1PT4 and resi 3 and name CA, 1PT4 and resi 27 and name CA  # target=21.921806191211683 current=18.84402657423823
color yellow, pair_03
distance pair_04, 1PT4 and resi 19 and name CA, 1PT4 and resi 27 and name CA  # target=22.697524358051723 current=19.66386415876376
color yellow, pair_04
distance pair_05, 1PT4 and resi 1 and name CA, 1PT4 and resi 26 and name CA  # target=15.180581753327191 current=12.316359595840105
color yellow, pair_05
distance pair_06, 1PT4 and resi 2 and name CA, 1PT4 and resi 26 and name CA  # target=16.87121849077501 current=14.075803902100596
color yellow, pair_06
distance pair_07, 1PT4 and resi 5 and name CA, 1PT4 and resi 27 and name CA  # target=25.810074284473178 current=23.224558853429983
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
