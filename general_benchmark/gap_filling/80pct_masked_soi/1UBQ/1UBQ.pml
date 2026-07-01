# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.8935737523343613

load 1UBQ.pdb, 1UBQ
bg_color white
hide everything, 1UBQ
show cartoon, 1UBQ
color grey80, 1UBQ
set cartoon_transparency, 0.1

select worst_residues, 1UBQ and resi 8+9+24+29+39+59+64+72+73+74
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1UBQ and resi 14
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1UBQ and resi 66 and name CA, 1UBQ and resi 74 and name CA  # target=24.289873631029657 current=20.17278073983807
color yellow, pair_00
distance pair_01, 1UBQ and resi 41 and name CA, 1UBQ and resi 74 and name CA  # target=15.815846899790678 current=11.764690205257585
color yellow, pair_01
distance pair_02, 1UBQ and resi 62 and name CA, 1UBQ and resi 73 and name CA  # target=27.499977528751028 current=31.198053559800904
color yellow, pair_02
distance pair_03, 1UBQ and resi 62 and name CA, 1UBQ and resi 74 and name CA  # target=27.499999913278657 current=30.981482744454297
color yellow, pair_03
distance pair_04, 1UBQ and resi 12 and name CA, 1UBQ and resi 74 and name CA  # target=25.623812040739185 current=23.10547609962216
color yellow, pair_04
distance pair_05, 1UBQ and resi 18 and name CA, 1UBQ and resi 74 and name CA  # target=27.499997282430687 current=30.018034878070537
color yellow, pair_05
distance pair_06, 1UBQ and resi 63 and name CA, 1UBQ and resi 73 and name CA  # target=27.499793037305746 current=29.8979359658765
color yellow, pair_06
distance pair_07, 1UBQ and resi 1 and name CA, 1UBQ and resi 74 and name CA  # target=27.500000000000004 current=29.772189695784952
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
