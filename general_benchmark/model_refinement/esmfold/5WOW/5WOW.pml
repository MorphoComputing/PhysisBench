# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 3.7569259432517694

load 5WOW.pdb, 5WOW
bg_color white
hide everything, 5WOW
show cartoon, 5WOW
color grey80, 5WOW
set cartoon_transparency, 0.1

select worst_residues, 5WOW and resi 1+2+7+8+31+32+33+34+36+37
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 5WOW and resi 4 and name CA, 5WOW and resi 32 and name CA  # target=13.52673985856095 current=8.352583295592316
color yellow, pair_00
distance pair_01, 5WOW and resi 2 and name CA, 5WOW and resi 32 and name CA  # target=11.899866739243791 current=6.839288103427397
color yellow, pair_01
distance pair_02, 5WOW and resi 4 and name CA, 5WOW and resi 31 and name CA  # target=11.932095300970746 current=7.53007669344435
color yellow, pair_02
distance pair_03, 5WOW and resi 2 and name CA, 5WOW and resi 37 and name CA  # target=17.41204580554223 current=13.11772896124182
color yellow, pair_03
distance pair_04, 5WOW and resi 2 and name CA, 5WOW and resi 31 and name CA  # target=10.60329701917595 current=6.559130268855975
color yellow, pair_04
distance pair_05, 5WOW and resi 4 and name CA, 5WOW and resi 37 and name CA  # target=18.17053992302071 current=14.322335976063568
color yellow, pair_05
distance pair_06, 5WOW and resi 5 and name CA, 5WOW and resi 32 and name CA  # target=13.713824834499139 current=9.89249986543757
color yellow, pair_06
distance pair_07, 5WOW and resi 4 and name CA, 5WOW and resi 35 and name CA  # target=17.6643091255573 current=13.97988139151399
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
