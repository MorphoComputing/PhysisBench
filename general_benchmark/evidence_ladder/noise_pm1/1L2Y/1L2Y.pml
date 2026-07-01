# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 1.310734281379613

load 1L2Y.pdb, 1L2Y
bg_color white
hide everything, 1L2Y
show cartoon, 1L2Y
color grey80, 1L2Y
set cartoon_transparency, 0.1

select worst_residues, 1L2Y and resi 1+2+3+6+7+8+10+13+14+18
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1L2Y and resi 3
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1L2Y and resi 2 and name CA, 1L2Y and resi 10 and name CA  # target=7.514579178688045 current=10.134308034201906
color yellow, pair_00
distance pair_01, 1L2Y and resi 1 and name CA, 1L2Y and resi 9 and name CA  # target=14.82555687758302 current=12.727063859138694
color yellow, pair_01
distance pair_02, 1L2Y and resi 1 and name CA, 1L2Y and resi 18 and name CA  # target=9.182951556903427 current=7.504317498783175
color yellow, pair_02
distance pair_03, 1L2Y and resi 4 and name CA, 1L2Y and resi 15 and name CA  # target=9.55243021589523 current=11.212957880255733
color yellow, pair_03
distance pair_04, 1L2Y and resi 1 and name CA, 1L2Y and resi 15 and name CA  # target=12.326222416325761 current=13.813158673601103
color yellow, pair_04
distance pair_05, 1L2Y and resi 4 and name CA, 1L2Y and resi 18 and name CA  # target=11.452630458370633 current=9.978047697420122
color yellow, pair_05
distance pair_06, 1L2Y and resi 7 and name CA, 1L2Y and resi 17 and name CA  # target=12.886526238912694 current=11.54988776814849
color yellow, pair_06
distance pair_07, 1L2Y and resi 3 and name CA, 1L2Y and resi 12 and name CA  # target=13.552439126371787 current=14.870078578182774
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
