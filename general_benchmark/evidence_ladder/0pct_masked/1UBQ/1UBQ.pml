# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.07020985625694802

load 1UBQ.pdb, 1UBQ
bg_color white
hide everything, 1UBQ
show cartoon, 1UBQ
color grey80, 1UBQ
set cartoon_transparency, 0.1

select worst_residues, 1UBQ and resi 10+11+34+56+57+59+63+72+73+74
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1UBQ and resi 3
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1UBQ and resi 62 and name CA, 1UBQ and resi 74 and name CA  # target=27.499999913278657 current=35.347454260366334
color yellow, pair_00
distance pair_01, 1UBQ and resi 61 and name CA, 1UBQ and resi 74 and name CA  # target=27.499999790604303 current=34.79141742046307
color yellow, pair_01
distance pair_02, 1UBQ and resi 63 and name CA, 1UBQ and resi 74 and name CA  # target=27.499998780297595 current=33.896260025738876
color yellow, pair_02
distance pair_03, 1UBQ and resi 17 and name CA, 1UBQ and resi 74 and name CA  # target=27.49999814027944 current=33.61749070402969
color yellow, pair_03
distance pair_04, 1UBQ and resi 59 and name CA, 1UBQ and resi 74 and name CA  # target=27.4999982198688 current=33.48789371472527
color yellow, pair_04
distance pair_05, 1UBQ and resi 19 and name CA, 1UBQ and resi 74 and name CA  # target=27.49999783066455 current=33.44673809237437
color yellow, pair_05
distance pair_06, 1UBQ and resi 18 and name CA, 1UBQ and resi 74 and name CA  # target=27.499997282430687 current=33.35181397244604
color yellow, pair_06
distance pair_07, 1UBQ and resi 1 and name CA, 1UBQ and resi 74 and name CA  # target=27.499996338318034 current=33.32410346860974
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
