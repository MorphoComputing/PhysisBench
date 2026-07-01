# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.7523480244093381

load 1YCC.pdb, 1YCC
bg_color white
hide everything, 1YCC
show cartoon, 1YCC
color grey80, 1YCC
set cartoon_transparency, 0.1

select worst_residues, 1YCC and resi 1+3+4+5+8+26+27+49+54+75
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1YCC and resi 13+23+25+68+83+92
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1YCC and resi 49 and name CA, 1YCC and resi 90 and name CA  # target=27.483671450912116 current=32.11938171750639
color yellow, pair_00
distance pair_01, 1YCC and resi 1 and name CA, 1YCC and resi 61 and name CA  # target=18.85326660635466 current=14.33298033429115
color yellow, pair_01
distance pair_02, 1YCC and resi 48 and name CA, 1YCC and resi 90 and name CA  # target=27.4834651594827 current=31.86133441706956
color yellow, pair_02
distance pair_03, 1YCC and resi 6 and name CA, 1YCC and resi 54 and name CA  # target=27.475074164589962 current=31.820784714749927
color yellow, pair_03
distance pair_04, 1YCC and resi 48 and name CA, 1YCC and resi 88 and name CA  # target=27.45407834961241 current=31.639909453925373
color yellow, pair_04
distance pair_05, 1YCC and resi 5 and name CA, 1YCC and resi 103 and name CA  # target=18.437964298416674 current=14.287631594224361
color yellow, pair_05
distance pair_06, 1YCC and resi 49 and name CA, 1YCC and resi 88 and name CA  # target=27.483784777612396 current=31.53543701583214
color yellow, pair_06
distance pair_07, 1YCC and resi 8 and name CA, 1YCC and resi 58 and name CA  # target=27.48555983504366 current=31.53297999933165
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
