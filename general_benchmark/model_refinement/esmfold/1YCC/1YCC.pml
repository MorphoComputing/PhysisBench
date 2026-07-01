# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.6249073555252679

load 1YCC.pdb, 1YCC
bg_color white
hide everything, 1YCC
show cartoon, 1YCC
color grey80, 1YCC
set cartoon_transparency, 0.1

select worst_residues, 1YCC and resi 1+2+9+48+49+62+75+76+78+84
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1YCC and resi 6 and name CA, 1YCC and resi 54 and name CA  # target=27.481848925763565 current=33.41439537333471
color yellow, pair_00
distance pair_01, 1YCC and resi 8 and name CA, 1YCC and resi 54 and name CA  # target=27.48418465827445 current=33.26017703577494
color yellow, pair_01
distance pair_02, 1YCC and resi 8 and name CA, 1YCC and resi 58 and name CA  # target=27.47682627179307 current=33.08937625138444
color yellow, pair_02
distance pair_03, 1YCC and resi 6 and name CA, 1YCC and resi 58 and name CA  # target=27.455127558699782 current=32.34835643359826
color yellow, pair_03
distance pair_04, 1YCC and resi 49 and name CA, 1YCC and resi 88 and name CA  # target=27.445641020880363 current=32.2987622774846
color yellow, pair_04
distance pair_05, 1YCC and resi 49 and name CA, 1YCC and resi 90 and name CA  # target=27.44529766989332 current=32.286707994894456
color yellow, pair_05
distance pair_06, 1YCC and resi 5 and name CA, 1YCC and resi 54 and name CA  # target=27.458681229558017 current=32.18527178400937
color yellow, pair_06
distance pair_07, 1YCC and resi 8 and name CA, 1YCC and resi 55 and name CA  # target=27.449170651163335 current=32.00069729387305
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
