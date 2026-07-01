# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.5550844885025736

load 1CRN.pdb, 1CRN
bg_color white
hide everything, 1CRN
show cartoon, 1CRN
color grey80, 1CRN
set cartoon_transparency, 0.1

select worst_residues, 1CRN and resi 2+10+25+37+38+40+41+42+43+44
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1CRN and resi 25
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1CRN and resi 31 and name CA, 1CRN and resi 43 and name CA  # target=10.395506154309981 current=7.216537788995864
color yellow, pair_00
distance pair_01, 1CRN and resi 32 and name CA, 1CRN and resi 42 and name CA  # target=8.079364376988414 current=11.21913542628303
color yellow, pair_01
distance pair_02, 1CRN and resi 4 and name CA, 1CRN and resi 36 and name CA  # target=19.27079438265335 current=16.439142743431134
color yellow, pair_02
distance pair_03, 1CRN and resi 15 and name CA, 1CRN and resi 24 and name CA  # target=11.251089321277734 current=8.554144891039632
color yellow, pair_03
distance pair_04, 1CRN and resi 21 and name CA, 1CRN and resi 30 and name CA  # target=11.982315933381882 current=14.565600789683456
color yellow, pair_04
distance pair_05, 1CRN and resi 20 and name CA, 1CRN and resi 33 and name CA  # target=16.370413924761344 current=13.83494438998987
color yellow, pair_05
distance pair_06, 1CRN and resi 20 and name CA, 1CRN and resi 39 and name CA  # target=19.467828586018634 current=21.97820335753161
color yellow, pair_06
distance pair_07, 1CRN and resi 5 and name CA, 1CRN and resi 40 and name CA  # target=14.043922062125388 current=11.614117620955804
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
