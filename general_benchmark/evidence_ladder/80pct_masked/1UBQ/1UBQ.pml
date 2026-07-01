# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 4.465232303827476

load 1UBQ.pdb, 1UBQ
bg_color white
hide everything, 1UBQ
show cartoon, 1UBQ
color grey80, 1UBQ
set cartoon_transparency, 0.1

select worst_residues, 1UBQ and resi 7+8+9+10+19+21+24+36+46+74
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1UBQ and resi 7+11+39+75
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1UBQ and resi 8 and name CA, 1UBQ and resi 28 and name CA  # target=18.885635941113538 current=7.3437044044864255
color yellow, pair_00
distance pair_01, 1UBQ and resi 11 and name CA, 1UBQ and resi 24 and name CA  # target=18.29530646439872 current=7.902271273807285
color yellow, pair_01
distance pair_02, 1UBQ and resi 9 and name CA, 1UBQ and resi 33 and name CA  # target=13.8569252691584 current=4.018679702372103
color yellow, pair_02
distance pair_03, 1UBQ and resi 9 and name CA, 1UBQ and resi 30 and name CA  # target=17.568481509948644 current=8.543002756533907
color yellow, pair_03
distance pair_04, 1UBQ and resi 21 and name CA, 1UBQ and resi 34 and name CA  # target=18.712231336380043 current=9.79954216029952
color yellow, pair_04
distance pair_05, 1UBQ and resi 10 and name CA, 1UBQ and resi 25 and name CA  # target=17.08758872531761 current=8.183540970871459
color yellow, pair_05
distance pair_06, 1UBQ and resi 9 and name CA, 1UBQ and resi 20 and name CA  # target=25.029726842291776 current=16.53659382441731
color yellow, pair_06
distance pair_07, 1UBQ and resi 7 and name CA, 1UBQ and resi 27 and name CA  # target=18.771413417346263 current=10.414726522016185
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
