# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.8836231916602996

load 1ENH.pdb, 1ENH
bg_color white
hide everything, 1ENH
show cartoon, 1ENH
color grey80, 1ENH
set cartoon_transparency, 0.1

select worst_residues, 1ENH and resi 1+2+3+4+18+20+21+47+48+52
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1ENH and resi 1 and name CA, 1ENH and resi 48 and name CA  # target=16.035913051074466 current=13.90643197850116
color yellow, pair_00
distance pair_01, 1ENH and resi 2 and name CA, 1ENH and resi 44 and name CA  # target=10.709341070023942 current=8.657029455893277
color yellow, pair_01
distance pair_02, 1ENH and resi 2 and name CA, 1ENH and resi 48 and name CA  # target=13.473527562866355 current=11.428225504438064
color yellow, pair_02
distance pair_03, 1ENH and resi 1 and name CA, 1ENH and resi 44 and name CA  # target=12.234122659424587 current=10.289349736311419
color yellow, pair_03
distance pair_04, 1ENH and resi 1 and name CA, 1ENH and resi 52 and name CA  # target=25.12988733861245 current=23.22422662268545
color yellow, pair_04
distance pair_05, 1ENH and resi 2 and name CA, 1ENH and resi 49 and name CA  # target=15.605149725253353 current=13.780274657797467
color yellow, pair_05
distance pair_06, 1ENH and resi 2 and name CA, 1ENH and resi 45 and name CA  # target=10.96453348185815 current=9.178410864010313
color yellow, pair_06
distance pair_07, 1ENH and resi 1 and name CA, 1ENH and resi 49 and name CA  # target=18.36903819994805 current=16.627483625215685
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
